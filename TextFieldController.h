//
//  TextFieldController.h
//  ourFireworks
//
//  Created by Fry Constantine on 8/26/09.
//  Copyright 2009 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmartAlertViewData.h"

@interface TextFieldController : UIViewController<SmartAlertViewData,UITextFieldDelegate> {
	UITextField *textField_;
}

@property (readonly)id Data;
@end
