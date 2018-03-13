#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif

@interface PushNotificationsBridge : NSObject <RCTBridgeModule>

@property (nonatomic, strong) RCTBridge* bridge;

- (id)initWithBridge:(RCTBridge *)bridge;

- (void)startWithInstanceId:(NSString *)instanceId;
- (void)handleNotification:(NSDictionary *)userInfo;
- (void)registerDeviceToken:(NSData *)deviceToken;
- (void)registerForRemoteNotifications;

@end
