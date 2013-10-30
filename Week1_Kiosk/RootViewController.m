//
//  RootViewController.m
//  Week1_Kiosk
//
//  Created by Christopher J Di Luccia on 10/18/13.
//  Copyright (c) 2013 Christopher J Di Luccia. All rights reserved.
//

#import "RootViewController.h"
#import "CustomView.h"

@interface RootViewController ()

@end

/*********************************
 Use these short cut #define macros to based frame size and position on the screen size
 *********************************/
// Shortcuts Macros
#define isIpad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define h self.view.frame.size.height
#define w self.view.frame.size.width

@implementation RootViewController

-(id)init
{
    
    if(self  = [super init])
    {
        viewSize = 100;
        
        /*************************************************
         LABEL CODE START
        *************************************************/
         mainLabel = [[UILabel alloc] initWithFrame: CGRectMake(w, h, 180, 100)];
         mainLabel.center = CGPointMake(w * 0.5, h * 0.2);
         mainLabel.font = [UIFont fontWithName: @"Times New Roman" size: 17];
         mainLabel.text = @"Silver Torbie Siberian Cat";
         [self.view addSubview:mainLabel];
        
        aboutLabel = [[UILabel alloc] initWithFrame: CGRectMake(w, h, 50, 100)];
        aboutLabel.center = CGPointMake(w * 0.5, h * 0.2);
        aboutLabel.font = [UIFont fontWithName: @"Times New Roman" size: 17];
        aboutLabel.text = @"About";
        aboutLabel.hidden = YES; //hidden by default
        [self.view addSubview:aboutLabel];
        
        photosLabel = [[UILabel alloc] initWithFrame: CGRectMake(w, h, 200, 100)];
        photosLabel.center = CGPointMake(w * 0.5, h * 0.2);
        photosLabel.font = [UIFont fontWithName: @"Times New Roman" size: 17];
        photosLabel.text = @"About";
        photosLabel.hidden = YES; //hidden by default
        [self.view addSubview:photosLabel];
        /*************************************************
         LABEL CODE END
         *************************************************/
        /*************************************************
            IMAGE VIEW CODE START
        **************************************************/
        
        if(isIpad) //ipad
        {
            // iPad
            mainImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mila_iPad.png"]];
            
            NSLog(@"ipad detected");
            
            rows = 9;
            columns = 7;
            
        }
        else
        {
            // iPhone
            mainImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mila_iPhone.jpeg"]];
            
            NSLog(@"iphone detected");
            
            rows = 4;
            columns = 3;
        }
    
        mainImgView.frame = CGRectMake(0, 0, w * 0.5, h * 0.5);
        mainImgView.center = CGPointMake(w * 0.5, h * 0.5);
        mainImgView.backgroundColor = [UIColor yellowColor];
        // setting content mode will keep the aspect ratio of you image
        mainImgView.contentMode = UIViewContentModeScaleAspectFit;
        mainImgView.hidden = NO;
        
        [self.view addSubview:mainImgView];
        /*************************************************
         IMAGE VIEW CODE END
         *************************************************/
        /************************************************
         BUTTON CODE START
         ************************************************/
        aboutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        aboutButton.frame = CGRectMake( w * 0.75, h * 0.80, w * 0.2, h * 0.1);
        [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        [aboutButton addTarget:self
                       action:@selector(aboutButtonAction)
             forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:aboutButton];
        
        photosButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        photosButton.frame = CGRectMake( w * 0.1, h * 0.80, w * 0.2, h * 0.1);
        [photosButton setTitle:@"Photos" forState:UIControlStateNormal];
        [photosButton addTarget:self
                        action:@selector(photosButtonAction)
              forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:photosButton];
        
        backToMainPageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        backToMainPageButton.frame = CGRectMake( w * 0.75, h * 0.90, w * 0.2, h * 0.1);
        [backToMainPageButton setTitle:@"Back" forState:UIControlStateNormal];
        [backToMainPageButton addTarget:self
                        action:@selector(backToMainPageButtonAction)
              forControlEvents:UIControlEventTouchUpInside];
        backToMainPageButton.hidden = YES;//hidden by default
        [self.view addSubview: backToMainPageButton];
        
        backToAboutPageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        backToAboutPageButton.frame = CGRectMake( w * 0.75, h * 0.90, w * 0.2, h * 0.1);
        [backToAboutPageButton setTitle:@"Back" forState:UIControlStateNormal];
        [backToAboutPageButton addTarget:self
                                 action:@selector(backToAboutPageButtonAction)
                       forControlEvents:UIControlEventTouchUpInside];
        backToAboutPageButton.hidden = YES;//hidden by default
        [self.view addSubview: backToAboutPageButton];
        
        signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        signUpButton.frame = CGRectMake( w * 0.4, h * 0.75, w * 0.2, h * 0.1);
        [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
        [signUpButton addTarget:self
                       action:@selector(signUpButtonAction)
             forControlEvents:UIControlEventTouchUpInside];
        signUpButton.hidden = YES;//hidden by default
        [self.view addSubview: signUpButton];
        
        submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        submitButton.frame = CGRectMake( w * 0.4, h * 0.75, w * 0.2, h * 0.1);
        [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
        [submitButton addTarget:self
                         action:@selector(submitButtonAction)
               forControlEvents:UIControlEventTouchUpInside];
        submitButton.hidden = YES;//hidden by default
        [self.view addSubview: submitButton];
        
        refreshButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        refreshButton.frame = CGRectMake( w * 0.55, h * 0.90, w * 0.2, h * 0.1);
        [refreshButton setTitle:@"Refresh" forState:UIControlStateNormal];
        [refreshButton addTarget:self
                         action:@selector(refreshButtonAction)
               forControlEvents:UIControlEventTouchUpInside];
        refreshButton.hidden = YES;//hidden by default
        [self.view addSubview: refreshButton];
        /************************************************
         BUTTON CODE END
         ************************************************/
        /*************************************************
         TEXT VIEW CODE START
         **************************************************/
        
        myTxtView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, w * 0.8, h *0.5)];
        myTxtView.center = CGPointMake(w * 0.5, h * 0.5);
        myTxtView.backgroundColor = [UIColor whiteColor];
		myTxtView.textColor = [UIColor blackColor];
        myTxtView.font = [UIFont fontWithName: @"Times New Roman" size: 16];
		myTxtView.editable = NO;//Don't pop up a keyboard.
        [[myTxtView layer] setBorderColor:[[UIColor grayColor] CGColor]];
        [[myTxtView layer] setBorderWidth:0.5];
        [[myTxtView layer] setCornerRadius:1.0];
		
		myTxtView.text =
        @"I have a one year old female cat named Ludmila. She is a silver torbie Siberian. "
        @"To understand what a torbie is you must first understand what a tortie is. Tortie "
        @"is short for tortoiseshell and for a cat this look consists primarily of black "
        @"fur with red, orange or yellow patches. Torbie is short for tortoiseshell-tabby "
        @"and this look consists of a tortie with stripes or 'tabby' stripes. Torbies can "
        @"also be referred to as patched tabbies.\n\n"
        @"In addition to being one of the most beautiful breeds the Siberian cat's saliva also "
        @"contains the least amount of the feline protein Fel d 1 that causes allergies. They "
        @"aren't quite hypoallergenic but someone who is usually allergic to cats could possibly "
        @"live with a Siberian.\n\n"
        @"Siberian's also have slightly longer hind legs than they do in the front. This"
        @" enables them to be very agile and acrobatic. My cat is constantly climbing and jumping."
        @"Siberian's are also one of the largest breeds of domestic cat second only to the maine-coon."
        @"\n\nPlease sign up for our mailing list if you would like to learn more!";
        
        myTxtView.hidden = YES;//hide it by default;
        
		[self.view addSubview:myTxtView];
        /*************************************************
         TEXT VIEW CODE END
         *************************************************/
        /*************************************************
         TEXT FIELD VIEW CODE FOR EMAIL ADDRESS INPUT START
         *************************************************/
        
        emailTextFieldView = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 18)];
        emailTextFieldView.center = CGPointMake(w * 0.5, h * 0.5);
        emailTextFieldView.backgroundColor = [UIColor whiteColor];
		emailTextFieldView.textColor = [UIColor blackColor];
        emailTextFieldView.font = [UIFont fontWithName: @"Times New Roman" size: 14];
		emailTextFieldView.text = @"<enter email address>";
        emailTextFieldView.hidden = YES;//hide it by default;
        emailTextFieldView.clearsOnBeginEditing = YES;
        emailTextFieldView.delegate = self;
        emailTextFieldView.returnKeyType = UIReturnKeyDone;
        [[emailTextFieldView layer] setBorderColor:[[UIColor grayColor] CGColor]];
        [[emailTextFieldView layer] setBorderWidth:0.5];
        [[emailTextFieldView layer] setCornerRadius:1.0];
        
		[self.view addSubview:emailTextFieldView];
        /*************************************************
         TEXT FIELD VIEW CODE FOR EMAIL ADDRESS INPUT END
         *************************************************/
        /*************************************************
         PHOTO VIEWS CODE START
         *************************************************/
        arrayOfPhotoFileNames = [[NSMutableArray alloc] initWithCapacity:1000];
        
        [arrayOfPhotoFileNames addObject:@"TheWInstagram.JPG"];
        [arrayOfPhotoFileNames addObject:@"TomsWedding.JPG"];
        [arrayOfPhotoFileNames addObject:@"ChrisandAlexis.JPG"];
        [arrayOfPhotoFileNames addObject:@"loft.jpg"];
        [arrayOfPhotoFileNames addObject:@"air-jordan-1-hi.jpg"];
        [arrayOfPhotoFileNames addObject:@"milayawnBig.JPG"];
        [arrayOfPhotoFileNames addObject:@"lorisBig.JPG"];
        [arrayOfPhotoFileNames addObject:@"ladyBig.JPG"];
        [arrayOfPhotoFileNames addObject:@"hippoBig.PNG"];
        [arrayOfPhotoFileNames addObject:@"frogBig.PNG"];
        [arrayOfPhotoFileNames addObject:@"dylanBig.PNG"];
        [arrayOfPhotoFileNames addObject:@"MilaLaunch.JPG"];
        [arrayOfPhotoFileNames addObject:@"keyboard.jpg"];
        [arrayOfPhotoFileNames addObject:@"karaoke.JPG"];
        [arrayOfPhotoFileNames addObject:@"chrisandrocco.jpg"];
        [arrayOfPhotoFileNames addObject:@"Mila_iPad.png"];
        [arrayOfPhotoFileNames addObject:@"Mila_iPhone.jpeg"];
        
        arrayOfCustomViews = [[NSMutableArray alloc] initWithCapacity:1000];
        cellCount = 0;
        
        // define frame based on viewSize
        CGRect rect = CGRectMake(0, 0, viewSize, viewSize);
        for(int c = 0; c<columns; c++)
        {
            for(int r = 0 ; r < rows ; r++)
            {
                cellCount++;
                //init the custom view with a cell # and a random photo
                NSUInteger randomIndex = arc4random() % [arrayOfPhotoFileNames count];
                tempView =
                [[CustomView alloc]initWithFrame:rect
                                 placementNumber:cellCount
                                           photo:[arrayOfPhotoFileNames objectAtIndex:randomIndex]
                 ];
                // off set the y cordinate by "r" 0,1,2,3,4,5,
                tempView.center =   CGPointMake(58 + (c * 103), 78 + (r * 103));
                tempView.hidden = YES;//make hidden by default
            
                [arrayOfCustomViews addObject:tempView];
            }
        }
        //add all of the custom views in the array to self.view
        for(int x = 0; x<arrayOfCustomViews.count; x++)
        {
            [self.view addSubview:[arrayOfCustomViews objectAtIndex:x]];
        }
        /*************************************************
             PHOTO VIEWS CODE END
        *************************************************/
    }
    return self;
}

- (void)aboutButtonAction
{
    //add code to support the user clicking the about button
    myTxtView.hidden = NO;
    backToMainPageButton.hidden = NO;
    aboutLabel.hidden = NO;
    signUpButton.hidden = NO;
    
    mainLabel.hidden = YES;
    mainImgView.hidden = YES;
    aboutButton.hidden = YES;
    photosButton.hidden = YES;
}

- (void)photosButtonAction
{
    //add code to support the user clicking the photos button
    backToMainPageButton.hidden = NO;
    refreshButton.hidden = NO;
    mainLabel.hidden = YES;
    mainImgView.hidden = YES;
    aboutButton.hidden = YES;
    photosButton.hidden = YES;
    
    //unhide all views in the array of custom views
    for(int y = 0; y<arrayOfCustomViews.count; y++)
    {
        tempView = [arrayOfCustomViews objectAtIndex:y];
        tempView.hidden = NO;
        [arrayOfCustomViews replaceObjectAtIndex:y withObject:tempView];
    }

}

- (void)backToMainPageButtonAction
{
    //add code to support the user clicking the back button to return to the main page
    mainLabel.hidden = NO;
    mainImgView.hidden = NO;
    aboutButton.hidden = NO;
    photosButton.hidden = NO;
    
    myTxtView.hidden = YES;
    aboutLabel.hidden = YES;
    backToMainPageButton.hidden = YES;
    signUpButton.hidden = YES;
    refreshButton.hidden = YES;
    
    //unhide all views in the array of custom views
    for(int y = 0; y<arrayOfCustomViews.count; y++)
    {
        tempView = [arrayOfCustomViews objectAtIndex:y];
        tempView.hidden = YES;
        [arrayOfCustomViews replaceObjectAtIndex:y withObject:tempView];
    }
}

- (void)backToAboutPageButtonAction
{
    //add code to support the user clicking the back button to return to the about page
    emailTextFieldView.hidden = YES;
    backToAboutPageButton.hidden = YES;
    submitButton.hidden = YES;
    aboutButton.hidden = YES;
    photosButton.hidden = YES;
    
    aboutLabel.hidden = NO;
    backToMainPageButton.hidden = NO;
    myTxtView.hidden = NO;
    signUpButton.hidden = NO;
}

- (void)signUpButtonAction
{
    emailTextFieldView.hidden = NO;//show the text field for email address input
    submitButton.hidden = NO;//show the submit button for email address submission
    signUpButton.hidden = YES;
    aboutLabel.hidden = YES;
    myTxtView.hidden = YES;
    backToMainPageButton.hidden = YES;
    backToAboutPageButton.hidden = NO;
}

- (void)submitButtonAction
{
    if([emailTextFieldView.text isEqualToString:@"<enter email address>"])
    {
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"Email address required to sign up"
                                   message:@"Please enter a valid email address if you wish to sign up for our mail list"
                                  delegate:nil
                         cancelButtonTitle:@"Dismiss"
                         otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        NSString *submissionMessage = [NSString stringWithFormat:@"%@%@", @"Your email:\n", emailTextFieldView.text];
        //concatenate the string "Your email:" with the actual email address submitted in the text field view
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"Thanks for signing up!"
                                   message:submissionMessage
                                  delegate:nil
                         cancelButtonTitle:@"Dismiss"
                         otherButtonTitles:nil];
        [alert show];
        
        //return to the state of the main page so the user can go through the process again if they wish to
        mainLabel.hidden = NO;
        mainImgView.hidden = NO;
        aboutButton.hidden = YES;
        photosButton.hidden = YES;
        submitButton.hidden = YES;
        emailTextFieldView.hidden = YES;
        signUpButton.hidden = YES;
        backToMainPageButton.hidden = YES;
        backToAboutPageButton.hidden = YES;
        aboutButton.hidden = NO;
        photosButton.hidden = NO;
        emailTextFieldView.text = @"<enter email address>";
    }
    
}

- (void)refreshButtonAction
{
    cellCount = 0;
   
    // define frame based on viewSize
    CGRect rect = CGRectMake(0, 0, viewSize, viewSize);
    for(int c = 0; c<columns; c++)
    {
        for(int r = 0 ; r < rows ; r++)
        {
            cellCount++;
            //init the custom view with a cell # and a random photo
            NSUInteger randomIndex = arc4random() % [arrayOfPhotoFileNames count];
            tempView =
            [[CustomView alloc]initWithFrame:rect
                             placementNumber:cellCount
                                       photo:[arrayOfPhotoFileNames objectAtIndex:randomIndex]
             ];
            // off set the y cordinate by "r" 0,1,2,3,4,5,
            tempView.center =   CGPointMake(58 + (c * 103), 78 + (r * 103));
            tempView.hidden = NO;//make hidden by default
            
            [arrayOfCustomViews addObject:tempView];
        }
    }
    //add all of the custom views in the array to self.view
    for(int x = 0; x<arrayOfCustomViews.count; x++)
    {
        [self.view addSubview:[arrayOfCustomViews objectAtIndex:x]];
    }
   
}


-(BOOL) textFieldShouldReturn:(UITextField*) textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)viewDidLoad
{
}

@end
