//
//  DxViewController.m
//  LIMIX7
//
//  Created by Ethan Wayne on 2/20/14.
//  Copyright (c) 2014 YINICSOFT. All rights reserved.

#import "DxViewController.h"
#import "ResultViewController.h"

@interface DxViewController ()

@end

@implementation DxViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"alert"]]){
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"alert"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Disclaimer" message:@"Reliance on any information provided by this app is solely at your own risk. If you proceed it means you understand that a, this is not a clinical diagnosis alternative; b, error(s) may occur in this app as well as the external information resources linked from this app." delegate:nil cancelButtonTitle: @"Agree and proceed" otherButtonTitles: nil];
        
        [alert show];
        
    }

    [super viewDidLoad];
    CGRect scrollViewFrame=CGRectMake(0, 0, 320, CGRectGetHeight(self.view.bounds));
    scrollView = [[UIScrollView alloc]initWithFrame:scrollViewFrame];
    [self.view addSubview:scrollView];
    CGSize scrollViewContentSize = CGSizeMake(320,740);
    [scrollView setContentSize:scrollViewContentSize];
    [scrollView setPagingEnabled:NO];
    
    clinicSymptoms=[NSMutableDictionary dictionary];
                    
    /****Ruller
    ****9/
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0,65,20,10)];
    [label1 setText:@"20"];
    label1.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:label1];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(40,65,20,10)];
    [label2 setText:@"60"];
    label2.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:label2];
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(300,65,20,10)];
    [label3 setText:@"20"];
    label3.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:label3];
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(260,65,20,10)];
    [label4 setText:@"60"];
    label4.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:label4];
    ****
    ****/
    ////////////Hint
    UILabel *label_Hint = [[UILabel alloc]initWithFrame:CGRectMake(10,10,300,60)];
    [label_Hint setText:@"Hint: Please fill as much as you can, but it's OK to leave some of them unchecked if you dont know the answer."];
    [label_Hint setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    label_Hint.numberOfLines = 0;
    [scrollView addSubview:label_Hint];
    label_Hint.textColor = [UIColor grayColor];
    
    
    ////Acute Space:80~145
    UILabel *label_Acute = [[UILabel alloc]initWithFrame:CGRectMake(10,85,300,20)];
    [label_Acute setText:@"How long have you been having diarrhea?"];
    [label_Acute setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Acute];
    UILabel *label_Acute_today = [[UILabel alloc]initWithFrame:CGRectMake(10,110,50,15)];
    [label_Acute_today setText:@"JustToday"];
    [label_Acute_today setFont:[UIFont fontWithName:@"Arial" size:10]];
    [scrollView addSubview:label_Acute_today];
    UILabel *label_Acute_2week = [[UILabel alloc]initWithFrame:CGRectMake(145,110,50,15)];
    [label_Acute_2week setText:@"2Weeks"];
    [label_Acute_2week setFont:[UIFont fontWithName:@"Arial" size:10]];
    [scrollView addSubview:label_Acute_2week];
    UILabel *label_Acute_4week = [[UILabel alloc]initWithFrame:CGRectMake(280,110,50,15)];
    [label_Acute_4week setText:@"4Weeks"];
    [label_Acute_4week setFont:[UIFont fontWithName:@"Arial" size:10]];
    [scrollView addSubview:label_Acute_4week];
    slider_Acute = [[UISlider alloc]initWithFrame:CGRectMake(10,135,300,10)];
    [scrollView addSubview:slider_Acute];
    [slider_Acute setMinimumValue:0];
    [slider_Acute setMaximumValue:4.0];
    slider_Acute.continuous=NO;
    [slider_Acute addTarget:self action:@selector(slider_Acute_Changed:)forControlEvents:UIControlEventValueChanged];
    slider_Acute.value=2.0;
    [clinicSymptoms setObject:@"2WEEK" forKey:@"ACUTE"];
    
    ////Epidemiology Space:165~180
    UILabel *label_Epidemiology = [[UILabel alloc]initWithFrame:CGRectMake(10,165,260,20)];
    [label_Epidemiology setText:@"Anyone else has similar symptoms?"];
    [label_Epidemiology setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Epidemiology];
    switch_Epidemiology = [[UISwitch alloc]initWithFrame:CGRectMake(261, 160, 20, 20)];
    [scrollView addSubview:switch_Epidemiology];
    [switch_Epidemiology setOnTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    [switch_Epidemiology addTarget:self action:@selector(switch_Epidemiology_Changed:)forControlEvents:UIControlEventValueChanged];
    [switch_Epidemiology setOn: NO];
    [clinicSymptoms setObject:@"NO" forKey:@"EPIDEMIOLOGY"];
    
    ////Pain
    UILabel *label_Pain = [[UILabel alloc]initWithFrame:CGRectMake(10,200,260,20)];
    [label_Pain setText:@"Do you feel abdominal pain?"];
    [label_Pain setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Pain];
    switch_Pain = [[UISwitch alloc]initWithFrame:CGRectMake(261, 195, 20, 20)];
    [scrollView addSubview:switch_Pain];
    [switch_Pain setOnTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    [switch_Pain addTarget:self action:@selector(switch_Pain_Changed:)forControlEvents:UIControlEventValueChanged];
    [switch_Pain setOn: NO];
    [clinicSymptoms setObject:@"NO" forKey:@"PAIN"];
    
    ////UIIMAGE
    imgView_Pain = [[UIImageView alloc] initWithFrame:CGRectMake(5, 228, 310, 180)];
    imgView_Pain.image = [UIImage imageNamed:@"4.png"];
    [scrollView addSubview:imgView_Pain];
    
    ////////////Pain_Location
    label_Pain_Location = [[UILabel alloc]initWithFrame:CGRectMake(15,236,260,20)];
    [label_Pain_Location setText:@"Where is the pain:"];
    [label_Pain_Location setFont:[UIFont fontWithName:@"Arial" size:13]];
    [scrollView addSubview:label_Pain_Location];
    label_Pain_Location.textColor = [UIColor grayColor];
    ////////////Pain_Location_Bellybutton
    label_Pain_Location_Bellybutton = [[UILabel alloc]initWithFrame:CGRectMake(15,263,260,20)];
    [label_Pain_Location_Bellybutton setText:@"AroundBellyButton "];
    [label_Pain_Location_Bellybutton setFont:[UIFont fontWithName:@"Arial" size:13]];
    [scrollView addSubview:label_Pain_Location_Bellybutton];
    switch_Pain_Location_Bellybutton = [[UISwitch alloc]initWithFrame:CGRectMake(123, 258, 20, 20)];
    [scrollView addSubview:switch_Pain_Location_Bellybutton];
    [switch_Pain_Location_Bellybutton addTarget:self action:@selector(switch_Pain_Location_BellybuttonChanged:)forControlEvents:UIControlEventValueChanged];
    label_Pain_Location_Bellybutton.textColor = [UIColor grayColor];
    switch_Pain_Location_Bellybutton.enabled = NO;
    [clinicSymptoms setObject:@"NO" forKey:@"PAIN_LOCATION_A"];
    ////////////Pain_Location_Buttom
    label_Pain_Location_Bottom = [[UILabel alloc]initWithFrame:CGRectMake(183,263,260,20)];
    [label_Pain_Location_Bottom setText:@"MuchLower"];
    [label_Pain_Location_Bottom setFont:[UIFont fontWithName:@"Arial" size:13]];
    [scrollView addSubview:label_Pain_Location_Bottom];
    switch_Pain_Location_Bottom = [[UISwitch alloc]initWithFrame:CGRectMake(256, 258, 20, 20)];
    [scrollView addSubview:switch_Pain_Location_Bottom];
    [switch_Pain_Location_Bottom addTarget:self action:@selector(switch_Pain_Location_Buttom_Changed:)forControlEvents:UIControlEventValueChanged];
    label_Pain_Location_Bottom.textColor = [UIColor grayColor];
    switch_Pain_Location_Bottom.enabled = NO;
    [clinicSymptoms setObject:@"NO" forKey:@"PAIN_LOCATION_B"];
    
    ////////////Pain_Continue
    label_Pain_Continue = [[UILabel alloc]initWithFrame:CGRectMake(13,295,260,20)];
    [label_Pain_Continue setText:@"Does pain go away after bowel movement"];
    [label_Pain_Continue setFont:[UIFont fontWithName:@"Arial" size:13]];
    [scrollView addSubview:label_Pain_Continue];
    switch_Pain_Continue = [[UISwitch alloc]initWithFrame:CGRectMake(256, 293, 20, 20)];
    [scrollView addSubview:switch_Pain_Continue];
    [switch_Pain_Continue addTarget:self action:@selector(switch_Pain_Continue_Changed:)forControlEvents:UIControlEventValueChanged];
    label_Pain_Continue.textColor = [UIColor grayColor];
    switch_Pain_Continue.enabled = NO;
    [clinicSymptoms setObject:@"NO" forKey:@"PAIN_CONTINUE"];
    
    
    
    
    
    
    
    ////Defecation
    label_Defecation = [[UILabel alloc]initWithFrame:CGRectMake(10,340,300,20)];
    [label_Defecation setText:@"Please pay attention to your stool"];
    [label_Defecation setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Defecation];
    label_Defecation_cond = [[UILabel alloc]initWithFrame:CGRectMake(10,356,300,20)];
    [label_Defecation_cond setText:@"and recall the latest observation"];
    [label_Defecation_cond setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Defecation_cond];
    switch_Defecation = [[UISwitch alloc]initWithFrame:CGRectMake(261, 345, 20, 20)];
    [scrollView addSubview:switch_Defecation];
    [switch_Defecation setOnTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    [switch_Defecation addTarget:self action:@selector(switch_Defecation_Changed:)forControlEvents:UIControlEventValueChanged];
    [clinicSymptoms setObject:@"NO" forKey:@"DEFECATION"];
    
    ////UIIMAGE
    imgView_Defecation = [[UIImageView alloc] initWithFrame:CGRectMake(5, 380, 310, 218)];
    imgView_Defecation.image = [UIImage imageNamed:@"5.png"];
    [scrollView addSubview:imgView_Defecation];
    
    ////////////Defecation_Volume
    label_Defecation_Volume = [[UILabel alloc]initWithFrame:CGRectMake(15,390,260,20)];
    [label_Defecation_Volume setText:@"What's the volume of today's stool ?"];
    [label_Defecation_Volume setFont:[UIFont fontWithName:@"Arial" size:13]];
    [scrollView addSubview:label_Defecation_Volume];
    label_Defecation_Volumne_small = [[UILabel alloc]initWithFrame:CGRectMake(15,410,70,15)];
    [label_Defecation_Volumne_small setText:@"NormalVolume"];
    [label_Defecation_Volumne_small setFont:[UIFont fontWithName:@"Arial" size:10]];
    [scrollView addSubview:label_Defecation_Volumne_small];
    label_Defecation_Volumne_middle = [[UILabel alloc]initWithFrame:CGRectMake(136,410,70,15)];
    [label_Defecation_Volumne_middle setText:@"LargeVolume"];
    [label_Defecation_Volumne_middle setFont:[UIFont fontWithName:@"Arial" size:10]];
    [scrollView addSubview:label_Defecation_Volumne_middle];
    label_Defecation_Volumne_high = [[UILabel alloc]initWithFrame:CGRectMake(250,410,70,15)];
    [label_Defecation_Volumne_high setText:@"UltraLarge"];
    [label_Defecation_Volumne_high setFont:[UIFont fontWithName:@"Arial" size:10]];
    [scrollView addSubview:label_Defecation_Volumne_high];
    slider_Defecation_Volume = [[UISlider alloc]initWithFrame:CGRectMake(10,436,300,10)];
    [scrollView addSubview:slider_Defecation_Volume];
    [slider_Defecation_Volume setMinimumValue:0];
    [slider_Defecation_Volume setMaximumValue:2.0];
    slider_Defecation_Volume.continuous=NO;
    [slider_Defecation_Volume addTarget:self action:@selector(slider_Defecation_Volume_Changed:)forControlEvents:UIControlEventValueChanged];
    slider_Defecation_Volume.value=1.0;
    [clinicSymptoms setObject:@"LARGE" forKey:@"DEFECATION_VOLUME"];
    
    label_Defecation_Volume.textColor = [UIColor grayColor];
    label_Defecation_Volumne_small.textColor = [UIColor grayColor];
    label_Defecation_Volumne_middle.textColor = [UIColor grayColor];
    label_Defecation_Volumne_high.textColor = [UIColor grayColor];
    slider_Defecation_Volume.enabled= NO;
    
    
    ////////////Defecation_Observation
    label_Defecation_Observation = [[UILabel alloc]initWithFrame:CGRectMake(15,450,300,20)];
    [label_Defecation_Observation setText:@"Was the defecation watery or covered by mucoid?"];
    [label_Defecation_Observation setFont:[UIFont fontWithName:@"Arial" size:13]];
    [scrollView addSubview:label_Defecation_Observation];
    NSArray *itemArray = [NSArray arrayWithObjects: @"Watery", @"Mucoid", @"Mushy",@"Formed",nil];
    segmentedControl_Defecation_Observation = [[UISegmentedControl alloc] initWithItems:itemArray];
    [scrollView addSubview:segmentedControl_Defecation_Observation];
    segmentedControl_Defecation_Observation.frame = CGRectMake(20, 475, 280, 30);
    [segmentedControl_Defecation_Observation addTarget:self action:@selector(segmentedControl_Defecation_Observation_Changed:)forControlEvents:UIControlEventValueChanged];
    label_Defecation_Observation.textColor = [UIColor grayColor];
    segmentedControl_Defecation_Observation.enabled = NO;
    segmentedControl_Defecation_Observation.selectedSegmentIndex = 0;
    [clinicSymptoms setObject:@"WATERY" forKey:@"DEFECATION_OBSERVATION"];
    
    ////////////Defecation_Smell
    label_Defecation_Smell = [[UILabel alloc]initWithFrame:CGRectMake(15,515,300,20)];
    [label_Defecation_Smell setText:@"Is the defecation very smelly?"];
    [label_Defecation_Smell setFont:[UIFont fontWithName:@"Arial" size:13]];
    [scrollView addSubview:label_Defecation_Smell];
    switch_Defecation_Smell = [[UISwitch alloc]initWithFrame:CGRectMake(254, 510, 20, 20)];
    [scrollView addSubview:switch_Defecation_Smell];
    [switch_Defecation_Smell addTarget:self action:@selector(switch_Defecation_smell_Changed:)forControlEvents:UIControlEventValueChanged];
    label_Defecation_Smell.textColor = [UIColor grayColor];
    switch_Defecation_Smell.enabled = NO;
    [clinicSymptoms setObject:@"NO" forKey:@"DEFECATION_SMELL"];
    
    ////////////Defecation_Bloody
    label_Defecation_Bloody = [[UILabel alloc]initWithFrame:CGRectMake(15,550,300,20)];
    [label_Defecation_Bloody setText:@"Does the defecation has blood inside?"];
    [label_Defecation_Bloody setFont:[UIFont fontWithName:@"Arial" size:13]];
    [scrollView addSubview:label_Defecation_Bloody];
    switch_Defecation_Bloody = [[UISwitch alloc]initWithFrame:CGRectMake(254, 545, 20, 20)];
    [scrollView addSubview:switch_Defecation_Bloody];
    [switch_Defecation_Bloody addTarget:self action:@selector(Defecation_bloody_Changed:)forControlEvents:UIControlEventValueChanged];
    label_Defecation_Bloody.textColor = [UIColor grayColor];
    switch_Defecation_Bloody.enabled = NO;
    [clinicSymptoms setObject:@"NO" forKey:@"DEFECATION_BLOODY"];
    
    
    ////Overall_Symptom
    label_Overall_Symptom = [[UILabel alloc]initWithFrame:CGRectMake(10,600,300,20)];
    [label_Overall_Symptom setText:@"Do you have general systemic symptoms"];
    [label_Overall_Symptom setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Overall_Symptom];
    label_Overall_Symptom_cond = [[UILabel alloc]initWithFrame:CGRectMake(10,620,300,20)];
    [label_Overall_Symptom_cond setText:@"such as vomiting, dizziness, thirst,"];
    [label_Overall_Symptom_cond setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Overall_Symptom_cond];
    label_Overall_Symptom_cond_t = [[UILabel alloc]initWithFrame:CGRectMake(10,640,300,20)];
    [label_Overall_Symptom_cond_t setText:@"fatigue and fever? "];
    [label_Overall_Symptom_cond_t setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Overall_Symptom_cond_t];
    
    switch_Overall_Symptom = [[UISwitch alloc]initWithFrame:CGRectMake(261, 625, 20, 20)];
    [switch_Overall_Symptom setOnTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    [scrollView addSubview:switch_Overall_Symptom];
    [switch_Overall_Symptom addTarget:self action:@selector(switch_Overall_Symptom_Changed:)forControlEvents:UIControlEventValueChanged];
    [clinicSymptoms setObject:@"NO" forKey:@"OVERALL_SYMPTOM"];
    

    ////Ate
    label_Ate = [[UILabel alloc]initWithFrame:CGRectMake(10,670,300,20)];
    [label_Ate setText:@"Did you just eat before diarrhea?"];
    [label_Ate setFont:[UIFont fontWithName:@"Arial" size:15]];
    [scrollView addSubview:label_Ate];
    switch_Ate = [[UISwitch alloc]initWithFrame:CGRectMake(261, 668, 20, 20)];
    [switch_Ate setOnTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    [scrollView addSubview:switch_Ate];
    [switch_Ate addTarget:self action:@selector(switch_Ate_Changed:)forControlEvents:UIControlEventValueChanged];
    label_Ate.textColor = [UIColor grayColor];
    switch_Ate.enabled = NO;
    [clinicSymptoms setObject:@"NO" forKey:@"ATE"];
    
    ////UIIMAGE
    UIImageView *imgLogo = [[UIImageView alloc] initWithFrame:CGRectMake(90, 700, 143, 59)];
    imgLogo.image = [UIImage imageNamed:@"weblink.png"];
    [scrollView addSubview:imgLogo];
    
}
















/*************************
 CONTROLLER OF UIVIEW
 *************************/

////Acute
- (IBAction)slider_Acute_Changed:(UISlider*)sender{
    //NSLog(@"%f",sender.value);
    if (sender.value<1.0) {
        //NSLog(@"TODAY");
        label_Ate.textColor = [UIColor blackColor];
        switch_Ate.enabled = YES;
        [clinicSymptoms setObject:@"TODAY" forKey:@"ACUTE"];
    }else if(sender.value>2.5){
        //NSLog(@"4Week");
        [switch_Ate setOn:NO animated:YES];
        label_Ate.textColor = [UIColor grayColor];
        switch_Ate.enabled = NO;
        [clinicSymptoms setObject:@"4WEEK" forKey:@"ACUTE"];
        [clinicSymptoms setObject:@"NO" forKey:@"ATE"];
    }else{
        //NSLog(@"2Week");
        [switch_Ate setOn:NO animated:YES];
        label_Ate.textColor = [UIColor grayColor];
        switch_Ate.enabled = NO;
        [clinicSymptoms setObject:@"2WEEK" forKey:@"ACUTE"];
        [clinicSymptoms setObject:@"NO" forKey:@"ATE"];
    }
    
}

////Epidemiology
-(IBAction)switch_Epidemiology_Changed:(UISwitch*)sender{
    //NSLog(@"Epidemiology  %s",sender.isOn?"YES":"NO");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"EPIDEMIOLOGY"];
}


////Pain
-(IBAction)switch_Pain_Changed:(UISwitch*)sender{
    //NSLog(@"Pain  %s",sender.isOn?"YES":"NO");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"PAIN"];
    if (sender.isOn) {
        switch_Pain_Location_Bottom.enabled = YES;
        switch_Pain_Location_Bellybutton.enabled = YES;
        label_Pain_Location.textColor = [UIColor blackColor];
        label_Pain_Location_Bottom.textColor = [UIColor blackColor];
        label_Pain_Location_Bellybutton.textColor = [UIColor blackColor];
        label_Pain_Continue.textColor = [UIColor blackColor];
        switch_Pain_Continue.enabled = YES;
        imgView_Pain.image = [UIImage imageNamed:@"49.png"];
    }else{
        label_Pain_Location.textColor = [UIColor grayColor];
        switch_Pain_Location_Bottom.enabled = NO;
        [switch_Pain_Location_Bottom setOn:NO animated:YES];
        switch_Pain_Location_Bellybutton.enabled = NO;
        [switch_Pain_Location_Bellybutton setOn:NO animated:YES];
        label_Pain_Location_Bottom.textColor = [UIColor grayColor];
        label_Pain_Location_Bellybutton.textColor = [UIColor grayColor];
        switch_Pain_Continue.enabled = NO;
        [switch_Pain_Continue setOn:NO animated:YES];
        label_Pain_Continue.textColor = [UIColor grayColor];
        [clinicSymptoms setObject:@"NO" forKey:@"PAIN_LOCATION_A"];
        [clinicSymptoms setObject:@"NO" forKey:@"PAIN_LOCATION_B"];
        [clinicSymptoms setObject:@"NO" forKey:@"PAIN_CONTINUE"];
        imgView_Pain.image = [UIImage imageNamed:@"4.png"];
    }
    
}
////////Pain_Location_Bellybutton
-(IBAction)switch_Pain_Location_BellybuttonChanged:(UISwitch*)sender{
    //NSLog(@"Pain_Location_Bellybutton %s",sender.isOn?"ON":"OFF");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"PAIN_LOCATION_A"];
}
////////Pain_Location_Buttom
-(IBAction)switch_Pain_Location_Buttom_Changed:(UISwitch*)sender{
    //NSLog(@"Pain_Location_Buttom %s",sender.isOn?"ON":"OFF");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"PAIN_LOCATION_B"];
}
////////Pain_Continue
-(IBAction)switch_Pain_Continue_Changed:(UISwitch*)sender{
    //NSLog(@"Pain_Continue %s",sender.isOn?"ON":"OFF");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"PAIN_CONTINUE"];
}


////Defecation
-(IBAction)switch_Defecation_Changed:(UISwitch*)sender{
    //NSLog(@"Defecation %s",sender.isOn?"ON":"OFF");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"DEFECATION"];
    if (switch_Defecation.isOn) {
        label_Defecation_Volume.textColor = [UIColor blackColor];
        label_Defecation_Volumne_small.textColor = [UIColor blackColor];
        label_Defecation_Volumne_middle.textColor = [UIColor blackColor];
        label_Defecation_Volumne_high.textColor = [UIColor blackColor];
        switch_Defecation_Volume.enabled = YES;
        slider_Defecation_Volume.enabled= YES;
        
        label_Defecation_Observation.textColor = [UIColor blackColor];
        segmentedControl_Defecation_Observation.enabled = YES;
        
        label_Defecation_Smell.textColor = [UIColor blackColor];
        switch_Defecation_Smell.enabled = YES;
        
        label_Defecation_Bloody.textColor = [UIColor blackColor];
        switch_Defecation_Bloody.enabled = YES;
        
        imgView_Defecation.image = [UIImage imageNamed:@"59.png"];
    }else{
        label_Defecation_Volume.textColor = [UIColor grayColor];
        label_Defecation_Volumne_small.textColor = [UIColor grayColor];
        label_Defecation_Volumne_middle.textColor = [UIColor grayColor];
        label_Defecation_Volumne_high.textColor = [UIColor grayColor];
        switch_Defecation_Volume.enabled = NO;
        slider_Defecation_Volume.enabled= NO;
        slider_Defecation_Volume.value=1.0;
        label_Defecation_Observation.textColor = [UIColor grayColor];
        segmentedControl_Defecation_Observation.enabled = NO;
        segmentedControl_Defecation_Observation.selectedSegmentIndex = 0;
        
        label_Defecation_Smell.textColor = [UIColor grayColor];
        switch_Defecation_Smell.enabled = NO;
        [switch_Defecation_Smell setOn:NO animated:YES];
        
        label_Defecation_Bloody.textColor = [UIColor grayColor];
        switch_Defecation_Bloody.enabled = NO;
        [switch_Defecation_Bloody setOn:NO animated:YES];
        [clinicSymptoms setObject:@"LARGE" forKey:@"DEFECATION_VOLUME"];
        [clinicSymptoms setObject:@"Watery" forKey:@"DEFECATION_OBSERVATION"];
        [clinicSymptoms setObject:@"NO" forKey:@"DEFECATION_SMELL"];
         [clinicSymptoms setObject:@"NO" forKey:@"DEFECATION_BLOODY"];

        imgView_Defecation.image = [UIImage imageNamed:@"5.png"];
    }
}
////Defecation_Volume
- (IBAction)slider_Defecation_Volume_Changed:(UISlider*)sender{
    //NSLog(@"%f",sender.value);
    if (sender.value<0.5) {
        //NSLog(@"Normal");
        [clinicSymptoms setObject:@"NORMAL" forKey:@"DEFECATION_VOLUME"];
    }else if(sender.value>1.5){
        //NSLog(@"Ultra");
        [clinicSymptoms setObject:@"ULTRA" forKey:@"DEFECATION_VOLUME"];
    }else{
        //NSLog(@"Large");
        [clinicSymptoms setObject:@"LARGE" forKey:@"DEFECATION_VOLUME"];
    }
}
////segmentedControl_Defecation_Observation_Changed
-(IBAction)segmentedControl_Defecation_Observation_Changed:(UISegmentedControl *)sender{
    NSString *result = [sender titleForSegmentAtIndex: [sender selectedSegmentIndex]];
    //NSLog(@"%@",result);
    [clinicSymptoms setObject:result forKey:@"DEFECATION_OBSERVATION"];
}

////////Defecation_smell
-(IBAction)switch_Defecation_smell_Changed:(UISwitch*)sender{
    //NSLog(@"Defecation_Smell %s",sender.isOn?"ON":"OFF");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"DEFECATION_SMELL"];
}
////////Defecation_bloody
-(IBAction)Defecation_bloody_Changed:(UISwitch*)sender{
    //NSLog(@"Defecation_Blood %s",sender.isOn?"ON":"OFF");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"DEFECATION_BLOODY"];
}
////Overall_Symptom_Changed
-(IBAction)switch_Overall_Symptom_Changed:(UISwitch*)sender{
    //NSLog(@"Overall_Symtom %s",sender.isOn?"ON":"OFF");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"OVERALL_SYMPTOM"];
}
////Ate
-(IBAction)switch_Ate_Changed:(UISwitch*)sender{
    //NSLog(@"Fever %s",sender.isOn?"ON":"OFF");
    NSString *result = sender.isOn?@"YES":@"NO";
    [clinicSymptoms setObject:result forKey:@"ATE"];
}



















/*************************
SERVICES OF DIAGNOSIS DATA GATHERING
*************************/

-(IBAction)HelpmePresssed:(id)sender{
    //NSLog(@"DICTIONARY:   ");
    //NSLog(@"CLINIC-ACUTE%@",[clinicSymptoms objectForKey:@"ACUTE"]);
    //NSLog(@"CLINIC  %@",[clinicSymptoms objectForKey:@"PAIN"]);
    /****
    for(id key in clinicSymptoms)
        NSLog(@"CLINIC  key=%@ value=%@", key, [clinicSymptoms objectForKey:key]);
    ****/
    ResultViewController *resultViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Result"];
    [resultViewController setClinicResults:(clinicSymptoms)];
    [self.navigationController pushViewController:resultViewController animated:YES];
};


-(IBAction)ResetPressed:(id)sender{
    slider_Acute.value=2.0;
    [clinicSymptoms setObject:@"2WEEK" forKey:@"ACUTE"];
    
    [switch_Epidemiology setOn: NO animated:YES];
    [clinicSymptoms setObject:@"NO" forKey:@"EPIDEMIOLOGY"];
    
    [switch_Pain setOn: NO animated:YES];
    [clinicSymptoms setObject:@"NO" forKey:@"PAIN"];
    
    label_Pain_Location.textColor = [UIColor grayColor];
    switch_Pain_Location_Bottom.enabled = NO;
    [switch_Pain_Location_Bottom setOn:NO animated:YES];
    switch_Pain_Location_Bellybutton.enabled = NO;
    [switch_Pain_Location_Bellybutton setOn:NO animated:YES];
    label_Pain_Location_Bottom.textColor = [UIColor grayColor];
    label_Pain_Location_Bellybutton.textColor = [UIColor grayColor];
    switch_Pain_Continue.enabled = NO;
    [switch_Pain_Continue setOn:NO animated:YES];
    label_Pain_Continue.textColor = [UIColor grayColor];
    [clinicSymptoms setObject:@"NO" forKey:@"PAIN_LOCATION_A"];
    [clinicSymptoms setObject:@"NO" forKey:@"PAIN_LOCATION_B"];
    [clinicSymptoms setObject:@"NO" forKey:@"PAIN_CONTINUE"];
    imgView_Pain.image = [UIImage imageNamed:@"4.png"];
    
    [switch_Defecation setOn:NO animated:YES];
    [clinicSymptoms setObject:@"NO" forKey:@"DEFECATION"];
    label_Defecation_Volume.textColor = [UIColor grayColor];
    label_Defecation_Volumne_small.textColor = [UIColor grayColor];
    label_Defecation_Volumne_middle.textColor = [UIColor grayColor];
    label_Defecation_Volumne_high.textColor = [UIColor grayColor];
    switch_Defecation_Volume.enabled = NO;
    slider_Defecation_Volume.enabled= NO;
    slider_Defecation_Volume.value=1.0;
    label_Defecation_Observation.textColor = [UIColor grayColor];
    segmentedControl_Defecation_Observation.enabled = NO;
    segmentedControl_Defecation_Observation.selectedSegmentIndex = 0;
    
    label_Defecation_Smell.textColor = [UIColor grayColor];
    switch_Defecation_Smell.enabled = NO;
    [switch_Defecation_Smell setOn:NO animated:YES];
    
    label_Defecation_Bloody.textColor = [UIColor grayColor];
    switch_Defecation_Bloody.enabled = NO;
    [switch_Defecation_Bloody setOn:NO animated:YES];
    [clinicSymptoms setObject:@"LARGE" forKey:@"DEFECATION_VOLUME"];
    [clinicSymptoms setObject:@"Watery" forKey:@"DEFECATION_OBSERVATION"];
    [clinicSymptoms setObject:@"NO" forKey:@"DEFECATION_SMELL"];
    [clinicSymptoms setObject:@"NO" forKey:@"DEFECATION_BLOODY"];
    
    imgView_Defecation.image = [UIImage imageNamed:@"5.png"];
    
    [switch_Overall_Symptom setOn:NO animated:YES];
    [clinicSymptoms setObject:@"NO" forKey:@"OVERALL_SYMPTOM"];
    
    switch_Ate.enabled = NO;
    [clinicSymptoms setObject:@"2WEEK" forKey:@"ACUTE"];
    [clinicSymptoms setObject:@"NO" forKey:@"ATE"];
    
};


@end
