//
//  SmartAlertViewViewController.h
//  SmartAlertView
//
//  Created by Fry Constantine on 10/17/09.
//  Copyright home 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmartAlertViewViewController : UIViewController {
	IBOutlet UILabel *countryLabel_;
	IBOutlet UILabel *textLabel_;
}

@property (nonatomic, retain) IBOutlet UILabel *countryLabel_;
@property (nonatomic, retain) IBOutlet UILabel *textLabel_;

-(IBAction)ChooseCountryName:(id)sender;
-(IBAction)InputText:(id)sender;
-(IBAction)Color:(id)sender;
-(IBAction)ShowError:(id)sender;

-(void)SetCountryName:(NSString*)name;
-(void)SetText:(NSString*)text;
-(void)SetColor:(UIColor*)color;
@end

