Purpose
--------------

Useful macro's for Objective-C projects.


Supported OS & SDK Versions
-----------------------------

* Supported build target - iOS 7.1
* Earliest supported deployment target - iOS 2.0


ARC Compatibility
------------------

The SPXDefines macro's will work correctly with or without ARC enabled.


Installation
--------------

To use the SPXDefines in an app, just drag the files into your project and import the header file into any class where you wish to make use of the SPXDefines functionality.

If you're using PODs, simply include it in your Podfile: `pod 'SPXDefines'`

Macro's
-------------

**Description Overrides**

When building custom classes its often good practice to override -description to provide other developers better output in the console. To make this easier and get better type safety you can use my new description methods.

```objc
- (NSString *)description
{
  return SPXDescription(SPXKeyPath(name), SPXKeyPath(age));
}
```

Which expands to:

```objc
- (NSString *)description
{
  return [super.description stringByAppendingFormat:@"%@", [self dictionaryWithValuesForKeys:@[ @"name", @"age" ].description];
}
```

_Note: This method only supports properties or methods since internally it uses KVO on self._
 
**SPXAssertionDefines**

Provides better assertion handling in an iOS project. It will NEVER crash in a RELEASE build, but will assert and break on the offending line of code in DEBUG builds. There are equivalent `SPXCAssertTrueOr...` methods for usage inside C functions.

The following code will assert 'condition', if it fails, write the assertion to the console and break on the offending line of code. In a release build it will simply return.

```objc
SPXAssertTrueOrReturnNo(condition);
SPXAssertTrueOrReturnNil(condition);
SPXAssertTrueOrReturnError(condition);
SPXAssertTrueOrReturn(condition);
```

The following code will also assert 'condition', but instead of returning, it will perform the specified action.
		
`SPXAssertTrueOrPerformAction(condition, NSLog(@"Help!"));`


**SPXEncodingDefines**

The following code will encode or decode variables using NSCoding. It uses `SPXEncode()` and `SPXDecode()` which expand to `[aEncoder encodeObject:name forKey:@"name"]` and `[aDecoder decodeObjectForKey:@"name"]` respectively. If you prefer to provide a custom encoder, decoder, you can use the SPXEncodeE and SPXDecodeE equivalents.
	
```objc
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSInteger age;

...

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
  self = [super init];
  if (!self) return nil;
  
  decode(name);	
  decode(age);
	
  return self;
} 

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  encode(name);
  encode(age);	
}
	
```


**SPXLoggingDefines**

The following methods will first look for CocoaLumberjack and if it exists, use that for logging. If not it will fall back to NSLog but with much improved logging ;)

The pretty format

`YYYY-MM-DD HH:MM:SS | LINE # | CLASS | SELECTOR | MESSAGE`

Example

`2014-03-21 14:31:22 | 23 | AppDelegate | applicationDidFinishLaunchingWithOptions: | Hello World!`

```objc
logMethod; // simply logs the current class and selector
SPXLog(@"Hello World!");
```

