//
//  TextFieldController.m
//  ourFireworks
//
//  Created by Fry Constantine on 8/26/09.
//  Copyright 2009 home. All rights reserved.
//

#import "TextFieldController.h"


@implementation TextFieldController
//@synthesize Data;

-(id)Data{
	if(textField_.text != nil)
		return [NSString stringWithString:textField_.text];
	else 
		return nil;
}

- (id) init{
	self = [super init];
	if (self != nil) {
		CGRect frame = CGRectMake(0, 0, 200.0, 25.0);
		self.view = [[UIView alloc]initWithFrame:frame];		
		textField_ = [[UITextField alloc] initWithFrame:frame];
		textField_.clearButtonMode =UITextFieldViewModeWhileEditing;
		[self.view addSubview:textField_];
		
		textField_.keyboardType =  UIKeyboardTypeAlphabet;
		//[textField_ setDelegate:self];
		[textField_ setBackgroundColor:[UIColor whiteColor]];
		
		UIImageView *imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 4)] autorelease];  
		imgView.image = [UIImage imageNamed:@"top.png"];  
		[self.view addSubview:imgView];  
		
		imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-4, self.view.frame.size.width, 4)] autorelease];  
		imgView.image = [UIImage imageNamed:@"down.png"];  
		[self.view addSubview:imgView];
		  
	}
	return self;
}

- (id) initWithText:(NSString*)text
{
	self = [super init];
	if (self != nil) {
		textField_.text = text;
	}
	return self;
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

    }
    return self;
}*/

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
		NSCharacterSet *alphaNumericSet = [NSCharacterSet alphanumericCharacterSet];
		NSString *trimmed = [string stringByTrimmingCharactersInSet:alphaNumericSet];
		BOOL isAlphaNumeric = ([trimmed length] == 0);
		return isAlphaNumeric;
}



/*

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {

}

*/
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[textField_ release];
    [super dealloc];
}


@end
