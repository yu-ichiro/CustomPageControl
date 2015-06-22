//
//  CustomPageControl.swift
//  drops
//
//  Created by Yuichiro on 2015/06/21.
//  Copyright © 2015年 Yu-ichiro. All rights reserved.
//

import UIKit

class CustomPageControl: UIPageControl {
	
	var customImages: [ CGImageRef? ]? = nil
	func setMaskImageForIndex(maskImage:UIImage, index:Int) {
		self.customImages = Array(count: self.numberOfPages, repeatedValue: nil)
		
		let pw = maskImage.size.width * maskImage.scale
		let ph = maskImage.size.height * maskImage.scale
		let bitmapBytesPerRow = (pw * 1.0)
		let context = CGBitmapContextCreate(nil, Int(pw), Int(ph), CGImageGetBitsPerComponent(maskImage.CGImage), Int(bitmapBytesPerRow), CGColorSpaceCreateDeviceGray(), CGBitmapInfo(rawValue: CGImageAlphaInfo.Only.rawValue).rawValue)
		CGContextTranslateCTM(context, 0.0, ph)
		CGContextScaleCTM(context, 1.0, -1.0)
		
		CGContextDrawImage(context, CGRectMake(0, 0, pw, ph), maskImage.CGImage)
		let mi: CGImageRef = CGBitmapContextCreateImage(context)
		
		self.customImages![index] = mi
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func drawRect(rect: CGRect) {
		if customImages == nil { return }
		var index = 0
		for indicator:UIView in self.subviews {
			indicator.alpha = 1.0
			if customImages![index] != nil {
				indicator.alpha = 0.0
				var fill: UIColor? = nil
				if index == self.currentPage {
					fill = self.currentPageIndicatorTintColor != nil ? self.currentPageIndicatorTintColor! : UIColor.whiteColor()
				} else {
					fill = self.pageIndicatorTintColor != nil ? self.pageIndicatorTintColor! : UIColor.whiteColor().colorWithAlphaComponent(0.3)
				}
				fill?.set()
				let frame = CGRectMake((indicator.frame.origin.x + indicator.frame.size.width/2.0)-6.0, (indicator.frame.origin.y + indicator.frame.size.height/2.0)-6.0, 12.0, 12.0)
				CGContextDrawImage(UIGraphicsGetCurrentContext(), frame, customImages![index]!)
			}
			index++
		}
	}
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		super.touchesEnded(touches, withEvent: event)
		self.setNeedsDisplay()
	}
	
	func updatePage(newPage: Int) {
		self.currentPage = newPage
		self.setNeedsDisplay()
	}
}
