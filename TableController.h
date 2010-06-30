//
//  OpenFileController.h
//  ourFireworks
//
//  Created by Fry Constantine on 8/18/09.
//  Copyright 2009 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmartAlertViewData.h"

@interface TableController : UIViewController
		<UITableViewDataSource,UITableViewDelegate,SmartAlertViewData >{
	NSMutableArray* items_;
	NSString *itemName_;
}

@property (readonly) id Data ;
- (id)initWithItems:(NSArray *)items;
@end
