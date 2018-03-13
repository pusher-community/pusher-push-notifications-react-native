#import "PushNotificationsBridge.h"
#if __has_include(<React/RCTLog.h>)
#import <React/RCTLog.h>
#else
#import "RCTLog.h"
#endif
@import PushNotifications;

@implementation PushNotificationsBridge

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(subscribe:(NSString *)interest callback:(RCTResponseSenderBlock)callback) {
  NSError *anyError;
  [[PushNotifications shared] subscribeWithInterest:interest error:&anyError completion:^{
    if (anyError) {
      callback(@[anyError, [NSNull null]]);
    }
    else {
      RCTLogInfo(@"Subscribed to interest: %@", interest);
    }
  }];
}

RCT_EXPORT_METHOD(setSubscriptions:(NSArray *)interests callback:(RCTResponseSenderBlock)callback) {
  NSError *anyError;
  [[PushNotifications shared] setSubscriptionsWithInterests:interests error:&anyError completion:^{
    if (anyError) {
      callback(@[anyError, [NSNull null]]);
    }
    else {
      RCTLogInfo(@"Subscribed to interests: %@", interests);
    }
  }];
}

RCT_EXPORT_METHOD(unsubscribe:(NSString *)interest callback:(RCTResponseSenderBlock)callback) {
  NSError *anyError;
  [[PushNotifications shared] unsubscribeWithInterest:interest error:&anyError completion:^{
    if (anyError) {
      callback(@[anyError, [NSNull null]]);
    }
    else {
      RCTLogInfo(@"Unsubscribed from interest: %@", interest);
    }
  }];
}

RCT_EXPORT_METHOD(unsubscribeAll) {
  [[PushNotifications shared] unsubscribeAllWithCompletion:^{
    RCTLogInfo(@"Unsubscribed from all interests.");
  }];
}

RCT_EXPORT_METHOD(getInterests:(RCTResponseSenderBlock)callback) {
  NSArray *interests = [[PushNotifications shared] getInterests];
  callback(@[[NSNull null], interests]);
}

RCT_EXPORT_METHOD(registerForRemoteNotifications) {
  [[PushNotifications shared] registerForRemoteNotifications];
}

- (id)initWithBridge:(RCTBridge *)bridge {
    self = [super init];

    if (self) {
      self.bridge = bridge;
    }

    return self;
}

- (void)startWithInstanceId:(NSString *)instanceId {
  [[PushNotifications shared] startWithInstanceId:instanceId];
}

- (void)handleNotification:(NSDictionary *)userInfo {
  [[PushNotifications shared] handleNotificationWithUserInfo:userInfo];
}

- (void)registerDeviceToken:(NSData *)deviceToken {
  [[PushNotifications shared] registerDeviceToken:deviceToken completion:^{}];
}

@end
