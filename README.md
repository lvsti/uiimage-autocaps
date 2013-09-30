### Resizable `UIImage`s made easy

Resizable `UIImage`s are great, the only problem with them is that developers have to specify the appropriate cap insets each time an instance is created, even though the numbers will be the same 99% of the time. Maintaining these magic numbers dispersed in the codebase soon becomes a burden as the project grows and/or the images change. But it doesn't have to be like that.

The provided `AutoCaps` category on `UIImage` delegates the job of setting and maintaining the cap insets to the person whom it should eventually concern in the team: the designer. The idea is the following:

- make a list of all the resizable images in the project
- create a PLIST file which maps these images to their appropriate cap insets
- let the magic flow: in your code use the methods in the provided `AutoCaps` category to instantiate resizable `UIImage`s without having to write a single cap inset value again
- each time a new image resource is added or an existing altered, have the designer update the PLIST accordingly

For example, if you previously had:

```objc
	...
	UIEdgeInsets buttonInsets = UIEdgeInsetsMake(10,20,10,20);
	UIImage* img = [[UIImage imageNamed:@"button.jpg"] resizableImageWithCapInsets:buttonInsets];
```

you'll get the same result with:

```objc
#import "UIImage+AutoCaps.h"
...
	UIImage* img = [UIImage resizableImageNamed:@"button.jpg"];
```

Nice, huh? And what if I told you this automatically works for images with `@2x` and `-568h@2x` suffixes?

If, for some reason, you are not able to use the provided class methods but still want to access the caps for a given image, just have the `+[UIImage(AutoCaps) capInsetsForImageNamed:]` method look it up for you.

Finally, feel free to modify the file name, the way the dictionary is initialized, or any other aspect to make it fit your needs better! Pull requests are also welcome

https://github.com/lkxf/uiimage-autocaps

Lkxf
