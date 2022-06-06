// Copyright 2016-present 650 Industries. All rights reserved.

#import <ExpoIosHomeIndicator/ExpoIosHomeIndicatorViewManager.h>
#import <ExpoModulesCore/EXUIManager.h>


@interface ExpoIosHomeIndicatorViewManager ()

@property (weak, nonatomic) EXModuleRegistry *moduleRegistry;

@end

@implementation ExpoIosHomeIndicatorViewManager

EX_EXPORT_MODULE(ExpoIosHomeIndicatorViewManager);

- (void)setModuleRegistry:(EXModuleRegistry *)moduleRegistry {
  _moduleRegistry = moduleRegistry;
}

- (UIView *)view
{
  return [ExpoIosHomeIndicatorView new];
}

- (NSString *)viewName
{
  return @"ExpoIosHomeIndicatorView";
}

EX_VIEW_PROPERTY(autoHidden, Bool *, ExpoIosHomeIndicatorView)
{
  [view setPrefersAutoHidden:value];
}

EX_EXPORT_METHOD_AS(setNativeProps,
                    setNativeProps:(NSDictionary *)nativeProps
                    forViewWithTag:(id)viewTag
                    resolver:(EXPromiseResolveBlock)resolve
                    rejecter:(EXPromiseRejectBlock)reject)
{
  [[_moduleRegistry getModuleImplementingProtocol:@protocol(EXUIManager)] executeUIBlock:^(id view) {
    if ([view isKindOfClass:[ExpoIosHomeIndicatorView class]]) {
        ExpoIosHomeIndicatorView *homeIndicatorView = view;
      if (nativeProps[@"autoHidden"]) { [homeIndicatorView setPrefersAutoHidden:nativeProps[@"autoHidden"]]; }
    } else {
      reject(@"E_INVALID_VIEW", [NSString stringWithFormat:@"Invalid view returned from registry, expected ExpoIosHomeIndicatorView, got: %@", view], nil);
    }
  } forView:viewTag ofClass:[ExpoIosHomeIndicatorView class]];
}

@end
