//
//  RootViewController.h
//  Week1_Kiosk
//
//  Created by Christopher J Di Luccia on 10/18/13.
//  Copyright (c) 2013 Christopher J Di Luccia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CustomView.h"

@interface RootViewController : UIViewController <UITextViewDelegate>
{
    UITextField *emailTextFieldView;
    UILabel *mainLabel;
    UILabel *aboutLabel;
    UILabel *photosLabel;
    UIImageView *mainImgView;
    UITextView *myTxtView;
    UIButton *backToMainPageButton;
    UIButton *aboutButton;
    UIButton *photosButton;
    UIButton *signUpButton;
    UIButton *submitButton;
    UIButton *backToAboutPageButton;
    UIButton *refreshButton;
    NSMutableArray *arrayOfCustomViews;
    CustomView *tempView;
    int rows;
    int columns;
    int cellCount;
    NSMutableArray *arrayOfPhotoFileNames;
    int viewSize;
}

@end
