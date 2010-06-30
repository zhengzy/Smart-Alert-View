//
//  ARReachabilityAlertView.h
//

#import <UIKit/UIKit.h>
#import "SmartAlertViewData.h"

@interface SmartAlertView : UIAlertView <UIAlertViewDelegate> {
	UIView *view_;
	UIViewController *controller_;
	SEL selector_;
	id<SmartAlertViewData> linkToData_;
	id delegate_;
}

+(void)ShowTable:(NSString*)title WithItems:(NSArray*)items WithTarget:(id)target andAction:(SEL)action;
+(void)ShowTextField:(NSString*)title WithText:(NSString*)text WithTarget:(id)target andAction:(SEL)action;
+(void)ShowColorDialogWithTarget:(id)target andAction:(SEL)action;

- (id)initWithView:(UIView*)view andTitle:(NSString*)title withTarget:(id)target andAction:(SEL)action;
- (id)initWithController:(UIViewController*)controller andTitle:(NSString*)title withTarget:(id)target andAction:(SEL)action;
@end


