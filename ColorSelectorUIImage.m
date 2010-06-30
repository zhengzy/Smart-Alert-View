//
//  ColorSelectorUIImage.m
//  ourFireworks
//
//  Created by Fry Constantine on 8/18/09.
//  Copyright 2009 home. All rights reserved.
//

#import "ColorSelectorUIImage.h"


@implementation ColorSelectorUIImage
@synthesize Data = color_ ;


- (id) init{
	self = [super initWithImage:[UIImage imageNamed:@"color_c.png"]];
	if (self != nil) {
		self.userInteractionEnabled = YES;
		aim_ = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aim.png"]];
	}
	return self;
}


-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event{
	UITouch *touch = [[event touchesForView:self] anyObject];
	CGPoint	firstTouch = [touch locationInView:self];
	CGFloat xx =firstTouch.x;
	CGFloat yy = firstTouch.y;
	
	CGImageRef imageRef = [[self image] CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *rawData = malloc(height * width * 4);
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
												 bitsPerComponent, bytesPerRow, colorSpace,
												 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
	
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
	
    // Now your rawData contains the image data in the RGBA8888 pixel format.
	
    int byteIndex = (bytesPerRow * yy) + xx * bytesPerPixel;
	CGFloat red = (rawData[byteIndex]     * 1.0) / 255.0;
	CGFloat green = (rawData[byteIndex + 1] * 1.0) / 255.0;
	CGFloat blue = (rawData[byteIndex + 2] * 1.0) / 255.0;
	CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.0;
	
	free(rawData);	
	
	[color_ release];
	color_ = [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
	
	//Now draw the aim
	if([aim_ superview] == nil)
		[self addSubview:aim_];
	if (alpha == 0){
		[color_ release];
		color_= nil;
		[aim_ removeFromSuperview];
	}		
	aim_.center = firstTouch;
	//self.backgroundColor = color_;
}

- (void) dealloc{
	[color_ release];
	[super dealloc];
}





@end
