//
//  DxViewController.h
//  LIMIX7
//
//  Created by Ethan Wayne on 2/20/14.
//  Copyright (c) 2014 YINIC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DxViewController : UIViewController{
    UIScrollView *scrollView;
    NSMutableDictionary *clinicSymptoms;
    
    UIImageView *imgView_Pain;
    UIImageView *imgView_Defecation;
    
    UISlider *slider_Acute;
    UISwitch *switch_Epidemiology;
    UISwitch *switch_Pain;
    UILabel *label_Pain_Location;
    UILabel *label_Pain_Location_Bellybutton;
    UISwitch *switch_Pain_Location_Bellybutton;
    UILabel *label_Pain_Location_Bottom;
    UISwitch *switch_Pain_Location_Bottom;
    UILabel *label_Pain_Continue;
    UISwitch *switch_Pain_Continue;
    
    UILabel *label_Defecation;
    UILabel *label_Defecation_cond;
    UISwitch *switch_Defecation;
    UILabel *label_Defecation_Volume;
    UILabel *label_Defecation_Volumne_small;
    UILabel *label_Defecation_Volumne_middle;
    UILabel *label_Defecation_Volumne_high;
    UISwitch *switch_Defecation_Volume;
    UISlider *slider_Defecation_Volume;
    UILabel *label_Defecation_Observation;
    UISegmentedControl *segmentedControl_Defecation_Observation;
    UILabel *label_Defecation_Smell;
    UISwitch *switch_Defecation_Smell;
    UILabel *label_Defecation_Bloody;
    UISwitch *switch_Defecation_Bloody;
    
    UILabel *label_Overall_Symptom;
    UILabel *label_Overall_Symptom_cond;
    UILabel *label_Overall_Symptom_cond_t;
    UISwitch *switch_Overall_Symptom;
    UILabel *label_Ate;
    UISwitch *switch_Ate;
    

}




-(IBAction)HelpmePresssed:(id)sender;
-(IBAction)ResetPressed:(id)sender;

@end
