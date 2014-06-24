#import "ViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

#define GeoLocation TRUE // FALSE for no latitude/longitude information
#define kPICKERCOLUMN 1
typedef NS_ENUM(NSInteger, PickerType) {
    CATEGORY_PICKER,
    LOCATION_PICKER,
    ORIGINATOR_PICKER,
    DESTINATION_PICKER,
    STATUS_PICKER
};

#define kPICKERCOLUMN 1
#define kPICKER_TAG     101

@interface ViewController ()

@end

@implementation ViewController
{
    UIPickerView *picker;
    PickerType pickerType;
}
@synthesize nameTextField, emailTextField, dateTextField, timeTextField, blankTextField, blankbTextField, mlabelcategory, messageTextView;
@synthesize name, emailaddress, date, time, blank, blankb, category, message, email;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        categoryTypes = [[NSArray alloc] initWithObjects:@"Appetizers",@"Breakfast",@"Dessert",@"Drinks",
                         @"Main Dish/Entree", @"Salad", @"Side Dish", @"Soup", @"Snack",
                         @"Baby Food", @"Pet Food",nil];
        
        locationTypes = [[NSArray alloc] initWithObjects:@"African",@"American",@"Armenian",@"Barbecue"
                         ,nil];
        
        originatorTypes = [[NSArray alloc] initWithObjects:@"African",@"American",@"Armenian",@"Barbecue",
                           nil];
        
        
        destinationTypes = [[NSArray alloc] initWithObjects:@"African",@"American",@"Armenian",@"Barbecue",
                            nil];
        
        
        statusTypes = [[NSArray alloc] initWithObjects:@"African",@"American",@"Armenian",@"Barbecue",
                       nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    nameTextField.text = nil;
    emailTextField.text = nil;
    dateTextField.text = nil;
    timeTextField.text = nil;
    blankTextField.text = nil;
    blankbTextField.text = nil;
    mlabelcategory.text = nil;
    messageTextView.text = nil;
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(100,100,400,160)];
    picker.showsSelectionIndicator = TRUE;
    picker.dataSource = self;
    picker.delegate = self;
    picker.hidden = YES;
    [self.view addSubview:picker];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eve
{
    picker.hidden = YES;
}

#pragma mark -
#pragma mark picker methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return kPICKERCOLUMN;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    switch (pickerType) {
        case CATEGORY_PICKER:
            return [categoryTypes count];;
            break;
        case LOCATION_PICKER:
            return [locationTypes count];
            break;
        case ORIGINATOR_PICKER:
            return [originatorTypes count];
            break;
        case DESTINATION_PICKER:
            return [destinationTypes count];
            break;
        case STATUS_PICKER:
            return [statusTypes count];
            break;
        default: return -1;
            break;
    }
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (pickerType) {
        case CATEGORY_PICKER:
            return [categoryTypes objectAtIndex:row];
            break;
        case LOCATION_PICKER:
            return [locationTypes objectAtIndex:row];
            break;
        case ORIGINATOR_PICKER:
            return [originatorTypes objectAtIndex:row];
            break;
        case DESTINATION_PICKER:
            return [destinationTypes objectAtIndex:row];
            break;
        case STATUS_PICKER:
            return [statusTypes objectAtIndex:row];
            break;
        default: return nil;
            break;
            
    }
}




- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (pickerType) {
        case CATEGORY_PICKER: {
            NSString *categoryType  = [categoryTypes objectAtIndex:[pickerView selectedRowInComponent:0]];
            [categoryTypeBtn setTitle:categoryType forState:UIControlStateNormal];
            break;
        }
        case LOCATION_PICKER: {
            
            NSString *locationType  = [locationTypes objectAtIndex:[pickerView selectedRowInComponent:0]];
            [locationTypeBtn setTitle:locationType forState:UIControlStateNormal];
            break;
            
        }
        case ORIGINATOR_PICKER: {
            NSString *originatorType  = [originatorTypes objectAtIndex:[pickerView selectedRowInComponent:0]];
            [originatorTypeBtn setTitle:originatorType forState:UIControlStateNormal];
            break;
        }
        case DESTINATION_PICKER: {
            NSString *destinationType  = [destinationTypes objectAtIndex:[pickerView selectedRowInComponent:0]];
            [destinationTypeBtn setTitle:destinationType forState:UIControlStateNormal];
            break;
        }
        case STATUS_PICKER:{
            NSString *statusType  = [statusTypes objectAtIndex:[pickerView selectedRowInComponent:0]];
            [statusTypeBtn setTitle:statusType forState:UIControlStateNormal];

            break;
        }
        default:
            break;
    }
}
-(IBAction) showLocationTypePicker{
    
    pickerType = LOCATION_PICKER;
    picker.hidden = NO;
    [picker reloadAllComponents];
    
}
-(IBAction) showCategoryTypePicker{
    pickerType = CATEGORY_PICKER;
    picker.hidden = NO;
    [picker reloadAllComponents];
}

-(IBAction) showOriginatorTypePicker{
    pickerType = ORIGINATOR_PICKER;
    picker.hidden = NO;
    [picker reloadAllComponents];
}

-(IBAction) showDestinationTypePicker{
    pickerType = DESTINATION_PICKER;
    picker.hidden = NO;
    [picker reloadAllComponents];
}

-(IBAction) showStatusTypePicker{
    pickerType = STATUS_PICKER;
    picker.hidden = NO;
    [picker reloadAllComponents];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma - getting info from the UI

//NSString *test = nil;


- (IBAction)checkData:(id)sender
{
    /*
     name = nameTextField.text;
     surname = surnameTextField.text;
     bornDate = bornDateTextField.text;
     address = addressTextField.text;
     zipCode = zipTextField.text;
     email = emailTextField.text;
     */
    
    //NSLog(@" Name: %@ \n Surname: %@ \n Date of Birth: %@ \n Address: %@ \n Post Code: %@ \n email: %@ \n", name, surname, bornDate, address, zipCode, email);
    
    unsigned int x,a = 0;
    NSMutableString *emailmessage; //stringa variabile
    emailmessage = [NSMutableString stringWithFormat: @""]; //le stringhe mutabili vanno inizializzate in questo modo!
    
    
    for (x=0; x<7; x++)
    {
        switch (x) {
            case 0:
                if (nameTextField.text == nil) {
                    [emailmessage appendString:@"Name, "];
                    a=1;
                    
                }
                break;
                
            case 1:
                if (emailTextField.text == nil)
                {
                    [emailmessage appendString:@"Email Address, "];
                    a=1;
                }
                break;
                
            case 2:
                if (dateTextField.text == nil)
                {
                    [emailmessage appendString:@"Date of Near Miss, "];
                    a=1;
                }
                break;
                
            case 3:
                if (timeTextField.text == nil)
                {
                    [emailmessage appendString:@"Time of Near Miss, "];
                    a=1;
                }
                break;
                
            case 4:
                if (blankTextField.text == nil)
                {
                    [emailmessage appendString:@"Post Code, "];
                    a=1;
                }
                break;
                
            case 5:
                if (blankbTextField.text == nil)
                {
                    [emailmessage appendString:@"Email, "];
                    a=1;
                }
                break;
                
            case 6:
                if (mlabelcategory.text == nil)
                {
                    [emailmessage appendString:@"Category, "];
                    a=1;
                }
                break;
            case 7:
                if (messageTextView.text == nil)
                {
                    [emailmessage appendString:@"Observation Description, "];
                    a=1;
                }
                break;
                
            default:
                break;
        }
        
    }
    
    NSLog (@"Email Message: %@", emailmessage);
    
    if (a == 1) {
        
        NSMutableString  *popupError;
        popupError = [NSMutableString stringWithFormat: @"Per inviare compilare i seguenti campi:  "];
        
        [popupError appendString:emailmessage]; //aggiungo i miei errori
        [popupError appendString: @" grazie della comprensione."]; //
        
        NSLog(@"%@", popupError);
        
        UIAlertView *chiamataEffettuata = [[UIAlertView alloc]
                                           initWithTitle:@"ATTENTION" //titolo del mio foglio
                                           message:popupError
                                           delegate:self
                                           cancelButtonTitle:@"Ok, correggo" //bottone con cui si chiude il messaggio
                                           otherButtonTitles:nil, nil];
        [chiamataEffettuata show]; //istanza per mostrare effettivamente il messaggio
    }
    
    else
    {
        name = nameTextField.text;
        emailaddress = emailTextField.text;
        date = dateTextField.text;
        time = timeTextField.text;
        blank = blankTextField.text;
        blankb = blankbTextField.text;
        category = mlabelcategory.text;
        message = messageTextView.text;
        
        NSMutableString *nearmissreport;
        nearmissreport = [NSMutableString stringWithFormat: @"<br><br> <b>Name:</b> %@ <br> <b>Email Address:</b> %@ <br> <b>Date of Near Miss:</b> %@ <br> <b>Time of Near Miss:</b> %@ <br> <b>Post Code:</b> %@ <br> <b>Email Address:</b> %@ <br> <b>Category:</b> %@ <br><b>Observation Description:</b> %@ <br>", name, emailaddress, date, time, blank, blankb, category, message];
        
        NSLog(@"Near Miss Report: %@", nearmissreport);
        
        NSMutableString *testoMail;
        testoMail = [NSMutableString stringWithFormat: nearmissreport];
        
        NSLog(@"%@", testoMail);
        
        
        //MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        MFMailComposeViewController  *picker = [[MFMailComposeViewController  alloc] init];
        picker.mailComposeDelegate = self;
        
        [picker setSubject: name];
        
        // Set up the recipients.
        NSArray *toRecipients = [NSArray arrayWithObjects:@"paul.haddell@bbmmjv.com",nil];
        
        //NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com",@"third@example.com", nil];
        //NSArray *bccRecipients = [NSArray arrayWithObjects:@"four@example.com",nil];
        
        [picker setToRecipients:toRecipients];
        //[picker setCcRecipients:ccRecipients];
        //[picker setBccRecipients:bccRecipients];
        
        // Attach an image to the email.
        //NSString *path = [[NSBundle mainBundle] pathForResource:@"ipodnano" ofType:@"png"];
        //NSData *myData = [NSData dataWithContentsOfFile:path];
        //[picker addAttachmentData:myData mimeType:@"image/png" fileName:@"ipodnano"];
        
        // Fill out the email body text.
        //NSMutableString *emailBody;
        testoMail = [NSMutableString stringWithFormat: @"%@", testoMail];
        
        [picker setMessageBody:testoMail isHTML:YES]; //HTML!!!!!!
        
        // Present the mail composition interface.
        [self presentViewController:picker animated:YES completion:nil];
    }
}


// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Mandare email
/*
 - (void)sendMail:(NSMutableString*)testoMail{
 
 MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
 picker.mailComposeDelegate = self;
 
 [picker setSubject:@"Reclutamento pompieri"];
 
 // Set up the recipients.
 NSArray *toRecipients = [NSArray arrayWithObjects:@"reda.bousbah@gmail.com",nil];
 //NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com",@"third@example.com", nil];
 //NSArray *bccRecipients = [NSArray arrayWithObjects:@"four@example.com",nil];
 
 [picker setToRecipients:toRecipients];
 //[picker setCcRecipients:ccRecipients];
 //[picker setBccRecipients:bccRecipients];
 
 // Attach an image to the email.
 //NSString *path = [[NSBundle mainBundle] pathForResource:@"ipodnano" ofType:@"png"];
 //NSData *myData = [NSData dataWithContentsOfFile:path];
 //[picker addAttachmentData:myData mimeType:@"image/png" fileName:@"ipodnano"];
 
 // Fill out the email body text.
 NSString *emailBody = @"It is raining in sunny California!";
 [picker setMessageBody:emailBody isHTML:NO];
 
 // Present the mail composition interface.
 [self presentViewController:picker animated:YES completion:nil];
 
 
 }
 */



#pragma mark - methods to control the keyboard

- (IBAction)backgroundTap:(id)sender //method for resign the keyboard when the background is tapped
{
    [nameTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [dateTextField resignFirstResponder];
    [timeTextField resignFirstResponder];
    [blankTextField resignFirstResponder];
    [blankbTextField resignFirstResponder];
    [mlabelcategory resignFirstResponder];
    [messageTextView resignFirstResponder];
    
}

- (IBAction)doneButtonPressed:(id)sender
{
    NSLog( @"done button pressed");
    [sender resignFirstResponder];
}
@end