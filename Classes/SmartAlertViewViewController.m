//
//  SmartAlertViewViewController.m
//  SmartAlertView
//
//  Created by Fry Constantine on 10/17/09.
//  Copyright home 2009. All rights reserved.
//

#import "SmartAlertViewViewController.h"
#import "SmartAlertView.h"
#import "Poof.h"

@implementation SmartAlertViewViewController
@synthesize countryLabel_;
@synthesize textLabel_;

-(IBAction)ChooseCountryName:(id)sender{
	NSArray *countriesISO = [NSLocale ISOCountryCodes];
	NSMutableArray *countriesName = [[NSMutableArray alloc]init];
	NSLocale *locale = [NSLocale currentLocale];
	for(NSString* iso in countriesISO)
		[countriesName addObject:[locale displayNameForKey:NSLocaleCountryCode value:iso]];
	[SmartAlertView ShowTable:@"Выберете страну" WithItems:countriesName WithTarget:self andAction:@selector(SetCountryName:)];
	[countriesName release];
}
//deletit
//////
-(void)SetCountryName:(NSString*)name {
	if(nil != name)
		countryLabel_.text = name;
	else
		countryLabel_.text = @"не выбрана";
}

-(IBAction)InputText:(id)sender{
	[SmartAlertView ShowTextField:@"Введите город" WithText:nil WithTarget:self andAction:@selector(SetText:)];
}

-(void)SetText:(NSString*)text{
	if(nil != text)
		textLabel_.text = text;
	else
		textLabel_.text = @"не введен";
}


-(IBAction)Color:(id)sender{
	[SmartAlertView ShowColorDialogWithTarget:self andAction:@selector(SetColor:)];
}

-(void)SetColor:(UIColor*)color{
	if(nil != color){
		countryLabel_.textColor = color;
		textLabel_.textColor = color;
	}
}

-(IBAction)ShowError:(id)sender{
	Poof *poof = [[Poof alloc] initWithCenter:CGPointMake(0,0)];
	SmartAlertView *smartAlertView = [[SmartAlertView alloc] initWithView:poof andTitle:@"Пуф" 
															   withTarget:nil andAction:@selector(SetColor:)];
	[smartAlertView show];
	[smartAlertView release];
	[poof release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	countryLabel_ = nil;
	textLabel_ = nil;
}


- (void)dealloc {
	[textLabel_ release];
	[countryLabel_ release];
    [super dealloc];	
}

@end
