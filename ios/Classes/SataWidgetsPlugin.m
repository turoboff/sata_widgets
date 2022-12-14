#import "SataWidgetsPlugin.h"
#if __has_include(<sata_widgets/sata_widgets-Swift.h>)
#import <sata_widgets/sata_widgets-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sata_widgets-Swift.h"
#endif

@implementation SataWidgetsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSataWidgetsPlugin registerWithRegistrar:registrar];
}
@end
