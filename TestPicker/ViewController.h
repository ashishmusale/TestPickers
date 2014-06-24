//
//  ViewController.h
//  Test Picker
//
//  Created by Musale, Ashish on 6/21/14.
//  Copyright (c) 2014 Ashish. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate>{
    
    UITextField *nameTextField;
    UITextField *emailTextField;
    UITextField *dateTextField;
    UITextField *timeTextField;
    UITextField *blankTextField;
    UITextField *blankbTextField;
    UITextView  *messageTextView;
    
    NSArray *categoryTypes;
    NSArray *locationTypes;
    NSArray *originatorTypes;
    NSArray *destinationTypes;
    NSArray *statusTypes;
    IBOutlet UIButton *categoryTypeBtn;
    IBOutlet UIButton *locationTypeBtn;
    IBOutlet UIButton *originatorTypeBtn;
    IBOutlet UIButton *destinationTypeBtn;
    IBOutlet UIButton *statusTypeBtn;
    
    CLLocationManager *locationManager;
    IBOutlet UILabel *mlabelcategory;
    NSMutableArray *arrayNocategory;
    IBOutlet UIPickerView *pickerViewcategory;
    
    MFMailComposeViewController *email;
}

@property (nonatomic, retain) MFMailComposeViewController *email;

@property(nonatomic,retain) IBOutlet UITextField *nameTextField;
@property(nonatomic,retain) IBOutlet UITextField *emailTextField;
@property(nonatomic,retain) IBOutlet UITextField *dateTextField;
@property(nonatomic,retain) IBOutlet UITextField *timeTextField;
@property(nonatomic,retain) IBOutlet UITextField *blankTextField;
@property(nonatomic,retain) IBOutlet UITextField *blankbTextField;
@property(nonatomic,retain) IBOutlet UILabel *mlabelcategory;
@property(nonatomic,retain) IBOutlet UITextView *messageTextView;



@property NSString *name;
@property NSString *emailaddress;
@property NSString *date;
@property NSString *time;
@property NSString *blank;
@property NSString *blankb;
@property NSString *category;
@property NSString *message;


- (IBAction)checkData:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;
-(IBAction) showCategoryTypePicker;
-(IBAction) showLocationTypePicker;
-(IBAction) showOriginatorTypePicker;
-(IBAction) showDestinationTypePicker;
-(IBAction) showStatusTypePicker;

//- (void)sendMail;


@end
