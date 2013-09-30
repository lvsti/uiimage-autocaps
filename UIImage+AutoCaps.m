//
//  UIImage+AutoCaps.m
//  
//
//  Created by Lkxf on 2013.09.30..
//
//

#import "UIImage+AutoCaps.h"

static NSString* const kCapInsetsDictionaryFileName = @"caps.plist";

static NSDictionary* capInsetsDictionary = nil;


@implementation UIImage (AutoCaps)


+ (void)load
{
	NSString* capsFilePath = [[NSBundle mainBundle] pathForResource:kCapInsetsDictionaryFileName
															 ofType:nil];
	capInsetsDictionary = [[NSDictionary alloc] initWithContentsOfFile:capsFilePath];
}


+ (UIEdgeInsets)capInsetsForImageNamed:(NSString*)aName
{
	UIEdgeInsets caps = UIEdgeInsetsZero;
	id capsField = [capInsetsDictionary objectForKey:aName];
	
	if ( capsField )
	{
		NSAssert([capsField isKindOfClass:[NSString class]], @"cap insets field value must be a string");
		
		NSArray* comps = [[capInsetsDictionary objectForKey:aName] componentsSeparatedByString:@" "];
		if ( [comps count] == 1 )
		{
			caps = UIEdgeInsetsMake([[comps objectAtIndex:0] floatValue],
									[[comps objectAtIndex:0] floatValue],
									[[comps objectAtIndex:0] floatValue],
									[[comps objectAtIndex:0] floatValue]);
		}
		else if ( [comps count] == 4 )
		{
			caps = UIEdgeInsetsMake([[comps objectAtIndex:0] floatValue],
									[[comps objectAtIndex:1] floatValue],
									[[comps objectAtIndex:2] floatValue],
									[[comps objectAtIndex:3] floatValue]);
		}
		else
		{
			NSAssert(NO, @"invalid cap insets format");
		}

	}
	
	return caps;
}


+ (UIImage*)resizableImageNamed:(NSString*)aName
{
	return [[UIImage imageNamed:aName] resizableImageWithCapInsets:[UIImage capInsetsForImageNamed:aName]];
}


+ (UIImage*)animatedResizableImageNamed:(NSString*)aName
							   duration:(NSTimeInterval)aDuration
{
	return [UIImage animatedResizableImageNamed:aName
									  capInsets:[UIImage capInsetsForImageNamed:aName]
									   duration:aDuration];
}


+ (UIImage*)animatedResizableImageNamed:(NSString*)aName
						   resizingMode:(UIImageResizingMode)aResizingMode
							   duration:(NSTimeInterval)aDuration
{
	return [UIImage animatedResizableImageNamed:aName
									  capInsets:[UIImage capInsetsForImageNamed:aName]
								   resizingMode:aResizingMode
									   duration:aDuration];
}


@end
