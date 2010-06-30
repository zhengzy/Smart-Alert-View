#import "SmartAlertView.h"

#import "TableController.h"
#import "ColorSelectorUIImage.h"
#import "TextFieldController.h"

@implementation SmartAlertView



+(void)ShowTable:(NSString*)title WithItems:(NSArray*)items WithTarget:(id)target andAction:(SEL)action{
	TableController *asd = [[TableController alloc]initWithItems:items];
	SmartAlertView *rAlertView = [[SmartAlertView alloc]initWithController:asd andTitle:title
																			  withTarget:target andAction:action];
	[asd release];
	[rAlertView show];
	[rAlertView release];
}

+(void)ShowTextField:(NSString*)title WithText:(NSString*)text WithTarget:(id)target andAction:(SEL)action{
	TextFieldController *textController = [[TextFieldController alloc]init];
	SmartAlertView *rAlertView = [[SmartAlertView alloc] initWithController:textController andTitle:title
																			   withTarget:target andAction:action];
	[rAlertView show];
	[rAlertView release];
	[textController release];
}

+(void)ShowColorDialogWithTarget:(id)target andAction:(SEL)action{
	ColorSelectorUIImage *colorSelector = [[ColorSelectorUIImage alloc]init];
	SmartAlertView *rAlertView = [[SmartAlertView alloc]initWithView:colorSelector andTitle:@"Choose color:" 
																		withTarget:target andAction:action];
	[colorSelector release];		
	[rAlertView show];
	[rAlertView release];
}

- (id)initWithView:(UIView*)view andTitle:(NSString*)title withTarget:(id)target andAction:(SEL)action{
	if (self = [super initWithTitle:title message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil]) {
		[self addSubview:view];
		delegate_ = target;
		selector_ = action;
		view_ = view;
		if([view conformsToProtocol:@protocol(SmartAlertViewData)])
			linkToData_ = view;
	}
	return self;
}


- (id)initWithController:(UIViewController<SmartAlertViewData>*)controller andTitle:(NSString*)title withTarget:(id)target andAction:(SEL)action{
	if ([self initWithView:controller.view andTitle:title withTarget:(id)target andAction:(SEL)action]) {
		controller_ = [controller retain];
		if([controller conformsToProtocol:@protocol(SmartAlertViewData)])
			linkToData_ = controller;
	}
	return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if((buttonIndex == 1))
		[delegate_ performSelector:selector_ withObject: linkToData_.Data];
}


- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
	[self release];
	return nil;
}

-(void)setDelegate{
	[self doesNotRecognizeSelector: _cmd];
}



-(CGFloat)GetBottomOfView:(UIView*)view{
	return view.frame.size.height + view.frame.origin.y;
}

- (void) MoveView: (UIView *) view1 underAhotherView:(UIView*)view2  {
	CGRect view1Frame = view1.frame;
	view1Frame.origin.y = [self GetBottomOfView:view2] + 5;
	view1.frame = view1Frame;
}

- (void) ResizeAlertView: (UIAlertView *) alertView  {
	CGFloat height = view_.frame.size.height + 110;	
	alertView.frame = CGRectMake(15.0f, (460-height)/2 ,300.0f, height);
}

-(void) MoveView:(UIView*)view1 toCenterOfView:(UIView*)view2{
	view1.center = CGPointMake(view2.frame.size.width/2 , view2.frame.size.height/2);
}


-(void)willPresentAlertView:(UIAlertView *)alertView{
	if (nil == view_)
		return;	
	[self ResizeAlertView: alertView];
	[self MoveView:view_ toCenterOfView:alertView];
	[self MoveView:view_ underAhotherView:[self.subviews objectAtIndex:0]];		//title
	[self MoveView:[self.subviews objectAtIndex:1] underAhotherView:view_];			//okButton
	[self MoveView:[self.subviews objectAtIndex:2] underAhotherView:view_];		//cancelButton
}


- (void) dealloc {	
	[controller_ release];
	[super dealloc];
}

@end
