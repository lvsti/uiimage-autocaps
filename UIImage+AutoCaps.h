//
//  UIImage+AutoCaps.h
//  
//
//  Created by Lkxf on 2013.09.30..
//
//


@interface UIImage (AutoCaps)

+ (UIEdgeInsets)capInsetsForImageNamed:(NSString*)aName;

+ (UIImage*)resizableImageNamed:(NSString*)aName;
+ (UIImage*)animatedResizableImageNamed:(NSString*)aName
							   duration:(NSTimeInterval)aDuration;
+ (UIImage*)animatedResizableImageNamed:(NSString*)aName
						   resizingMode:(UIImageResizingMode)aResizingMode
							   duration:(NSTimeInterval)aDuration;

@end
