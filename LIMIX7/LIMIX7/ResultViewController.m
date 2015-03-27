//
//  ResultViewController.m
//  LIMIX7
//
//  Created by Ethan Wayne on 2/20/14.
//  Copyright (c) 2014 YINICSOFT. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad

{
    [super viewDidLoad];

    
    /*****************************
     Diagnosis Service
     *****************************/
    clinicDiagnosis=[NSMutableDictionary dictionary];
    [clinicDiagnosis setObject:@0 forKey:@"cholera"];
    [clinicDiagnosis setObject:@0 forKey:@"acute_infection"];
    [clinicDiagnosis setObject:@0 forKey:@"typhoid_fever"];
    [clinicDiagnosis setObject:@0 forKey:@"malabsorption"];
    [clinicDiagnosis setObject:@0 forKey:@"food_poisoning"];
    [clinicDiagnosis setObject:@0 forKey:@"osmotic_motility"];
    [clinicDiagnosis setObject:@0 forKey:@"crohn"];
    [clinicDiagnosis setObject:@0 forKey:@"ulcerative_colits"];
    [clinicDiagnosis setObject:@0 forKey:@"others"];
    
    /***
    [clinicDiagnosis setObject:@10 forKey:@"cholera"];
    [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+103] forKey:@"cholera"];
    [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+70] forKey:@"cholera"];
    NSLog(@"Result  %@",[clinicDiagnosis objectForKey:@"cholera"]);
    ***/
    //for(id key in clinicResults)
    //    NSLog(@"RESULT:  key=%@ value=%@", key, [clinicResults objectForKey:key]);
    
    
    
    
    ////Diagnosis...ACUTE
    //NSLog(@"Result  %@",[clinicResults objectForKey:@"ACUTE"]);
    if ([[clinicResults objectForKey:@"ACUTE"] isEqualToString:@"TODAY"]){
        ////ACUTE:TODAY matters to cholera
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+10] forKey:@"cholera"];
        ////ACUTE:TODAY partly matters to acute_infection, some are some not.
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+10] forKey:@"acute_infection"];
        ////ACUTE:TODAY partly matters to typhoid_fever, since typhoid_feiver incubates usually for 24 hours
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"typhoid_fever"] intValue]+10] forKey:@"typhoid_fever"];
        ////ACUTE:TODAY matters to food_poisoning
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]+10] forKey:@"food_poisoning"];
        ////ACUTE:TODAY matters to osmotic_motility, since it matters to food
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"osmotic_motility"] intValue]+8] forKey:@"osmotic_motility"];
    }else if ([[clinicResults objectForKey:@"ACUTE"] isEqualToString:@"2WEEK"]){
        //NSLog(@"2WEEK");
        ////ACUTE:2WEEKS matters to osmotic_motility, since it could lasts very long
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"osmotic_motility"] intValue]+2] forKey:@"osmotic_motility"];
        ////ACUTE:2WEEKS matters to malabsorption, since it's chronic
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"malabsorption"] intValue]+10] forKey:@"malabsorption"];
        ////ACUTE:2WEEKS matters to crohn, since it's chronic
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"crohn"] intValue]+10] forKey:@"crohn"];
        ////ACUTE:2WEEKS matters to ulcerative_colits, since it's chronic
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"ulcerative_colits"] intValue]+10] forKey:@"ulcerative_colits"];
        ////ACUTE:TODAY matters to cholera
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]-20] forKey:@"cholera"];
        ////ACUTE:TODAY matters to food_poisoning
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]-20] forKey:@"food_poisoning"];
    }else{
        //NSLog(@"4WEEK");
        ////ACUTE:4WEEKS matters to malabsorption, since it's chronic
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"malabsorption"] intValue]+30] forKey:@"malabsorption"];
        ////ACUTE:4WEEKS matters to crohn, since it's chronic
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"crohn"] intValue]+20] forKey:@"crohn"];
        ////ACUTE:4WEEKS matters to ulcerative_colits, since it's chronic
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"ulcerative_colits"] intValue]+20] forKey:@"ulcerative_colits"];
        ////ACUTE:TODAY matters to cholera
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]-20] forKey:@"cholera"];
        ////ACUTE:TODAY partly matters to acute_infection, some are some not.
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]-20] forKey:@"acute_infection"];
        ////ACUTE:TODAY partly matters to typhoid_fever, since typhoid_feiver incubates usually for 24 hours
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"typhoid_fever"] intValue]-10] forKey:@"typhoid_fever"];
        ////ACUTE:TODAY matters to food_poisoning
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]-20] forKey:@"food_poisoning"];
    }
    
    
    
    ////Diagnosis...EPIDEMIOLOGY
    //NSLog(@"Result  %@",[clinicResults objectForKey:@"EPIDEMIOLOGY"]);
    if ([[clinicResults objectForKey:@"EPIDEMIOLOGY"] isEqualToString:@"YES"]){
        ////cholera is transmitted based on area.
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+10] forKey:@"cholera"];
        ////typhoid_fever, is transmitted based on area.
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"typhoid_fever"] intValue]+4] forKey:@"typhoid_fever"];
        ////acute_infection, some of it, such as crytosporidium, is transmitted based on area .
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+2] forKey:@"acute_infection"];
        ////for food_poisoning, this is the best sign
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]+10] forKey:@"food_poisoning"];
    }if ([[clinicResults objectForKey:@"EPIDEMIOLOGY"] isEqualToString:@"NO"]){
        ////cholera is transmitted based on area.
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]-30] forKey:@"cholera"];
        ////for food_poisoning, this is the best sign
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]-5] forKey:@"food_poisoning"];
    }
    
    
    
    
    
    
    
    ////Diagnosis...PAIN/PAIN_LOCATION_A/PAIN_LOCATION_B/PAIN_CONTINUE
    //NSLog(@"Result  %@",[clinicResults objectForKey:@"PAIN"]);
    if ([[clinicResults objectForKey:@"PAIN"] isEqualToString:@"YES"]){
        if ([[clinicResults objectForKey:@"PAIN_LOCATION_A"] isEqualToString:@"YES"]){
            ////crohn happens on small and big intestine
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"crohn"] intValue]+3] forKey:@"crohn"];
            ////acute_infection happens some on small intestine, some in big intestine.
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+2] forKey:@"acute_infection"];
            
        }
        if ([[clinicResults objectForKey:@"PAIN_LOCATION_B"] isEqualToString:@"YES"]){
            ////ulcerative_colits happens on big intestine
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"ulcerative_colits"] intValue]+3] forKey:@"ulcerative_colits"];
        }
        if ([[clinicResults objectForKey:@"PAIN_CONTINUE"] isEqualToString:@"YES"]){
            ////ulcerative_colits happens on big intestine
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"ulcerative_colits"] intValue]+3] forKey:@"ulcerative_colits"];
        }
    }
    
    
    ////Diagnosis...DEFECATION/DEFECATION_VOLUME/DEFECATION_OBSERVATION/DEFECATION_SMELL/DEFECATION_BLOODY
    if ([[clinicResults objectForKey:@"DEFECATION"] isEqualToString:@"YES"]){
        ////DEFECATION_VOLUME
        if ([[clinicResults objectForKey:@"DEFECATION_VOLUME"] isEqualToString:@"LARGE"]){
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+8] forKey:@"acute_infection"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+5] forKey:@"cholera"];
        }
        if ([[clinicResults objectForKey:@"DEFECATION_VOLUME"] isEqualToString:@"LARGE"]){
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+8] forKey:@"acute_infection"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+10] forKey:@"cholera"];
        }
        
        ////DEFECATION_OBSERVATION
        if ([[clinicResults objectForKey:@"DEFECATION_VOLUME"] isEqualToString:@"Watery"]){
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+10] forKey:@"acute_infection"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+10] forKey:@"cholera"];
        }
        if ([[clinicResults objectForKey:@"DEFECATION_VOLUME"] isEqualToString:@"Mucoid"]){
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"crohn"] intValue]+10] forKey:@"crohn"];
        }
        if ([[clinicResults objectForKey:@"DEFECATION_VOLUME"] isEqualToString:@"Formed"]){
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"malabsorption"] intValue]+10] forKey:@"malabsorption"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]-10] forKey:@"cholera"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]-5] forKey:@"acute_infection"];
        }
        ////DEFECATION_SMELL
        if ([[clinicResults objectForKey:@"DEFECATION_SMELL"] isEqualToString:@"YES"]){
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"malabsorption"] intValue]+10] forKey:@"malabsorption"];
        }
        ////DEFECATION_BLOODY
        if ([[clinicResults objectForKey:@"DEFECATION_BLOODY"] isEqualToString:@"YES"]){
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+8] forKey:@"acute_infection"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"typhoid_fever"] intValue]+10] forKey:@"typhoid_fever"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]+10] forKey:@"food_poisoning"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"ulcerative_colits"] intValue]+5] forKey:@"ulcerative_colits"];
            [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"others"] intValue]+10] forKey:@"others"];
        }
    }
    
    ////Diagnosis...OVERALL_SYMPTOM
    //NSLog(@"Result  %@",[clinicResults objectForKey:@"OVERALL_SYMPTOM"]);
    if ([[clinicResults objectForKey:@"OVERALL_SYMPTOM"] isEqualToString:@"YES"]){
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+15] forKey:@"acute_infection"];
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"typhoid_fever"] intValue]+15] forKey:@"typhoid_fever"];
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]+15] forKey:@"food_poisoning"];
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+10] forKey:@"cholera"];
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"malabsorption"] intValue]-10] forKey:@"malabsorption"];
    }
    
    
    ////Diagnosis...ATE
    //NSLog(@"Result  %@",[clinicResults objectForKey:@"ATE"]);
    if ([[clinicResults objectForKey:@"ATE"] isEqualToString:@"YES"]){
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]+10] forKey:@"acute_infection"];
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]+10] forKey:@"food_poisoning"];
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]+10] forKey:@"cholera"];
        ////ACUTE:TODAY matters to osmotic_motility, since it matters to food
        [clinicDiagnosis setObject:[NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"osmotic_motility"] intValue]+8] forKey:@"osmotic_motility"];
    }
    
    
    

    
    /**
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Cholera infection",
                                  @0,
                                  @"Seeking for treatment immediately is recommended. Cholera infection is a easily treated yet very dangerous diease if not treated",
                                  @"http://www.cdc.gov/cholera/illness.html",
                                  nil] forKey:@"cholera"];
    NSMutableArray *a =[clinicInformation objectForKey:@"cholera"];
    float i=[a[1] floatValue]+0.01;
    [a replaceObjectAtIndex:1 withObject:[NSNumber numberWithFloat:i]];
    NSLog(@"value=%@,%@,%@,%@", a[0],a[1],a[2],a[3]);
    **/
    
    
    NSMutableDictionary *clinicInformation;
    clinicInformation=[NSMutableDictionary dictionary];
    ////cholera
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Cholera infection risk",
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"cholera"] intValue]],@0,@0,
                                  @"Seeking for immediate treatment is recommended. Cholera infection can be easily cured, however if could be very dangerous diease if not treated",
                                  @"http://www.cdc.gov/cholera/illness.html",
                                  nil] forKey:@"cholera"];
    ////acute_infection
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Acute bacteria or virus infection risk",
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"acute_infection"] intValue]],@0,@0,
                                  @"Seeking for treatment is recommended. Common acute infection for digest system includes Cryptosporidium, Giardia, C. difficile etc, could be from negligble to very severe",
                                  @"http://digestive.niddk.nih.gov/ddiseases/pubs/diarrhea/",
                                  nil] forKey:@"acute_infection"];
    ////typhoid_fever
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Typhoid fever risk",
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"typhoid_fever"] intValue]],@0,@0,
                                  @"Seeking for immediate treatment is recommended. Typhoid fever is an infectious dieases and could be incubating for days.",
                                  @"http://www.cdc.gov/nczved/divisions/dfbmd/diseases/typhoid_fever/",
                                  nil] forKey:@"typhoid_fever"];
    ////malabsorption
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Malabsorption risk",
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"malabsorption"] intValue]],@0,@0,
                                  @"It is usually not urgent. Malabsorption could have many causes such as pancreatic insufficiency, lactase deficiency or bile salt deficiency. It could cause mal-nutrition issues in long term",
                                  @"http://en.wikipedia.org/wiki/Malabsorption",
                                  nil] forKey:@"malabsorption"];
    
    ////food_poisoning
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Food poisoning risk",
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"food_poisoning"] intValue]],@0,@0,
                                  @"Seeking for immediate treatment is recommended. Food poisoning can cause systemic damage in short period of time, depends on the serverity.",
                                  @"http://www.nlm.nih.gov/medlineplus/ency/article/001652.htm",
                                  nil] forKey:@"food_poisoning"];
    
    ////osmotic_motility
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Food relatied digestion dysfunctioning",
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"osmotic_motility"] intValue]],@0,@0,
                                  @"It is usually not urgent. Such as, the food intaking causes osmotic or motiltiy diarrhea, which is specific to person.",
                                  @"http://en.wikipedia.org/wiki/Diarrhea",
                                  nil] forKey:@"osmotic_motility"];
    
    ////crohn
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Crohn's disease risk",
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"crohn"] intValue]],@0,@0,
                                  @"It is usually not urgent. but seeking health care at your earliest convenience is recommended. It's a chornic inflammatory bowel disease.",
                                  @"http://en.wikipedia.org/wiki/Crohn's_disease",
                                  nil] forKey:@"crohn"];
    
    ////ulcerative_colits
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Ulcerative colitis risk",
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"ulcerative_colits"] intValue]],@0,@0,
                                  @"It is usually not urgent. but seeking health care at your earliest convenience is recommended. It's a chornic inflammatory bowel disease and often happen on colon.",
                                  @"http://en.wikipedia.org/wiki/Ulcerative_colitis",
                                  nil] forKey:@"ulcerative_colits"];
    
    ////others
    [clinicInformation setObject:[NSMutableArray arrayWithObjects:
                                  @"Can not detect any significant risks based on the information provided.",@0,@0,
                                  [NSNumber numberWithInt:[[clinicDiagnosis objectForKey:@"others"] intValue]],
                                  @"Seeking treatment is recommended.",
                                  @"http://www.cdc.gov/ncidod/diseases/submenus/sub_diarrhea.htm",
                                  nil] forKey:@"others"];
    
    
    
    
    NSMutableArray *result_Array = [NSMutableArray array];
    for(id key in clinicDiagnosis){
        //NSLog(@"RESULT:  key=%@ value=%@", key, [clinicDiagnosis objectForKey:key]);
        [result_Array addObject:[clinicDiagnosis objectForKey:key]];
    }
    
    

    int riskCount = 0;
    int first_max = [[result_Array valueForKeyPath:@"@max.intValue"] intValue];
    [result_Array removeAllObjects];
    for (id key in clinicDiagnosis){
        int current = [[clinicDiagnosis objectForKey:key] intValue];
        //NSLog(@"%d",current);
        if (current == first_max){
             //NSLog(@"FIRST RISK>>>>  key=%@ value=%@", key, [clinicDiagnosis objectForKey:key]);
             riskCount++;
             NSMutableArray *tempArray =[clinicInformation objectForKey:key];
             [tempArray replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:1]];
             [tempArray replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:riskCount]];
             [clinicInformation setObject:tempArray forKey:key];
        }else{
            [result_Array addObject:[clinicDiagnosis objectForKey:key]];
        }
    }
    
    int second_max = [[result_Array valueForKeyPath:@"@max.intValue"] intValue];
    [result_Array removeAllObjects];
    for (id key in clinicDiagnosis){
        int current = [[clinicDiagnosis objectForKey:key] intValue];
        //NSLog(@"%d",current);
        if (current == second_max){
            //NSLog(@"SECOND RISK>>>>  key=%@ value=%@", key, [clinicDiagnosis objectForKey:key]);
            riskCount++;
            NSMutableArray *tempArray =[clinicInformation objectForKey:key];
            [tempArray replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:2]];
            [tempArray replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:riskCount]];
            [clinicInformation setObject:tempArray forKey:key];
        }else if(current < second_max){
            [result_Array addObject:[clinicDiagnosis objectForKey:key]];
        }
    }
    
    int third_max = [[result_Array valueForKeyPath:@"@max.intValue"] intValue];
    [result_Array removeAllObjects];
    for (id key in clinicDiagnosis){
        int current = [[clinicDiagnosis objectForKey:key] intValue];
        //NSLog(@"%d",current);
        if (current == third_max){
            //NSLog(@"THIRD RISK>>>>  key=%@ value=%@", key, [clinicDiagnosis objectForKey:key]);
            riskCount++;
            NSMutableArray *tempArray =[clinicInformation objectForKey:key];
            [tempArray replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:3]];
            [tempArray replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:riskCount]];
            [clinicInformation setObject:tempArray forKey:key];
        }
    }
    
    /****
    for(id key in clinicInformation){
        NSLog(@"RESULT:  key=%@ value=%@", key, [clinicInformation objectForKey:key]);
    }
    ****/
  

    
    
    
    
    /*****************************
     LOAD RESULT
     *****************************/
    CGRect scrollViewFrame=CGRectMake(0, 0, 320, CGRectGetHeight(self.view.bounds));
    scrollView = [[UIScrollView alloc]initWithFrame:scrollViewFrame];
    [self.view addSubview:scrollView];
    CGSize scrollViewContentSize = CGSizeMake(320,1650);
    [scrollView setContentSize:scrollViewContentSize];
    [scrollView setPagingEnabled:NO];
    
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
    UILabel *label_Hint = [[UILabel alloc]initWithFrame:CGRectMake(10,10,300,60)];
    [label_Hint setText:@"ACKNOWLEDGEMENT: Some image content used in this app are provided by National Cancer Institute(NIH) and www.cancer.gov"];
    [label_Hint setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    label_Hint.numberOfLines = 0;
    [scrollView addSubview:label_Hint];
    label_Hint.textColor = [UIColor grayColor];
    
    cover = 700.0;
    ////RISK1:The First Risk to show
    for (id key in clinicInformation){
        NSMutableArray *tempArray =[clinicInformation objectForKey:key];
        if ([tempArray[3] intValue] == 1){
            float riskChance = [tempArray[1] floatValue];
            riskChance = (log2f(riskChance) / log2f(2.71828))* 0.01 + 1;
            ///////Risk1_Risktext: The first risk box
            UIImageView *imgView_RISK1;
            imgView_RISK1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 65, 310, 218)];
            imgView_RISK1.image = [UIImage imageNamed:@"5-RES.png"];
            [scrollView addSubview:imgView_RISK1];

            UILabel *label_Risk1_Risktext = [[UILabel alloc]initWithFrame:CGRectMake(15,80,300,20)];//+15
            if ([tempArray[1] intValue]>=30){
                NSString *preText= [NSString stringWithFormat:@"High Risk (%f)",riskChance];
                [label_Risk1_Risktext setText:preText];
                [label_Risk1_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk1_Risktext setTextColor:[UIColor redColor]];
            }else if([tempArray[1] intValue]<30 && [tempArray[1] intValue]>10){
                NSString *preText= [NSString stringWithFormat:@"Risk (%f)",riskChance];
                [label_Risk1_Risktext setText:preText];
                [label_Risk1_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk1_Risktext setTextColor:[UIColor blackColor]];
            }else{
                [label_Risk1_Risktext setText:@"Not enough information"];
                [label_Risk1_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk1_Risktext setTextColor:[UIColor blackColor]];
                tempArray =[clinicInformation objectForKey:@"others"];
                cover = 270.0;
            
            }
            [scrollView addSubview:label_Risk1_Risktext];
            
            //DxRisk
            UILabel *label_Risk1_DxRisk = [[UILabel alloc]initWithFrame:CGRectMake(15,90,300,60)];//+10
            [label_Risk1_DxRisk setText:tempArray[0]];
            [label_Risk1_DxRisk setFont:[UIFont fontWithName:@"Arial" size:18]];
            label_Risk1_DxRisk.numberOfLines = 0;
            [scrollView addSubview:label_Risk1_DxRisk];
            //DxAdvices
            UILabel *label_Risk1_DxAdvices = [[UILabel alloc]initWithFrame:CGRectMake(15,120,300,100)];//+30
            [label_Risk1_DxAdvices setText:tempArray[4]];
            [label_Risk1_DxAdvices setFont:[UIFont fontWithName:@"Arial" size:15]];
            label_Risk1_DxAdvices.numberOfLines = 0;
            [scrollView addSubview:label_Risk1_DxAdvices];
            //DxLink
            UILabel *label_Risk1_DxLink_instruction = [[UILabel alloc]initWithFrame:CGRectMake(15,210,300,20)];//+90
            [label_Risk1_DxLink_instruction setText:@"More Readings"];
            [label_Risk1_DxLink_instruction setFont:[UIFont fontWithName:@"Arial" size:12]];
            label_Risk1_DxLink_instruction.numberOfLines = 0;
            [scrollView addSubview:label_Risk1_DxLink_instruction];
            UILabel *label_Risk1_DxLink = [[UILabel alloc]initWithFrame:CGRectMake(15,220,300,40)];//+10
            [label_Risk1_DxLink setText:tempArray[5]];
            [label_Risk1_DxLink setFont:[UIFont fontWithName:@"Arial" size:12]];
            label_Risk1_DxLink.numberOfLines = 0;
            [scrollView addSubview:label_Risk1_DxLink];

        }
    }
    
    
    ////EXACT COPY
    ////RISK2:The Second Risk to show
    for (id key in clinicInformation){
        NSMutableArray *tempArray =[clinicInformation objectForKey:key];
        if ([tempArray[3] intValue] == 2){
            float riskChance = [tempArray[1] floatValue];
            riskChance = (log2f(riskChance) / log2f(2.71828))* 0.01 + 1;
            ///////Risk1_Risktext: The first risk box
            UIImageView *imgView_RISK2;
            imgView_RISK2 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 280, 310, 218)];
            imgView_RISK2.image = [UIImage imageNamed:@"5-RES.png"];
            [scrollView addSubview:imgView_RISK2];
            
            UILabel *label_Risk2_Risktext = [[UILabel alloc]initWithFrame:CGRectMake(15,295,300,20)];
            if ([tempArray[1] intValue]>=30){
                NSString *preText= [NSString stringWithFormat:@"High Risk (%f)",riskChance];
                [label_Risk2_Risktext setText:preText];
                [label_Risk2_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk2_Risktext setTextColor:[UIColor redColor]];
            }else if([tempArray[1] intValue]<30 && [tempArray[1] intValue]>10){
                NSString *preText= [NSString stringWithFormat:@"Risk (%f)",riskChance];
                [label_Risk2_Risktext setText:preText];
                [label_Risk2_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk2_Risktext setTextColor:[UIColor blackColor]];
            }else{
                [label_Risk2_Risktext setText:@"Not enough information"];
                [label_Risk2_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk2_Risktext setTextColor:[UIColor blackColor]];
                tempArray =[clinicInformation objectForKey:@"others"];
                
            }
            [scrollView addSubview:label_Risk2_Risktext];
            
            //DxRisk
            UILabel *label_Risk2_DxRisk = [[UILabel alloc]initWithFrame:CGRectMake(15,310,300,60)];
            [label_Risk2_DxRisk setText:tempArray[0]];
            [label_Risk2_DxRisk setFont:[UIFont fontWithName:@"Arial" size:18]];
            label_Risk2_DxRisk.numberOfLines = 0;
            [scrollView addSubview:label_Risk2_DxRisk];
            //DxAdvices
            UILabel *label_Risk2_DxAdvices = [[UILabel alloc]initWithFrame:CGRectMake(15,340,300,100)];
            [label_Risk2_DxAdvices setText:tempArray[4]];
            [label_Risk2_DxAdvices setFont:[UIFont fontWithName:@"Arial" size:15]];
            label_Risk2_DxAdvices.numberOfLines = 0;
            [scrollView addSubview:label_Risk2_DxAdvices];
            //DxLink
            UILabel *label_Risk2_DxLink_instruction = [[UILabel alloc]initWithFrame:CGRectMake(15,430,300,20)];
            [label_Risk2_DxLink_instruction setText:@"More Readings"];
            [label_Risk2_DxLink_instruction setFont:[UIFont fontWithName:@"Arial" size:12]];
            label_Risk2_DxLink_instruction.numberOfLines = 0;
            [scrollView addSubview:label_Risk2_DxLink_instruction];
            UILabel *label_Risk2_DxLink = [[UILabel alloc]initWithFrame:CGRectMake(15,440,300,40)];
            [label_Risk2_DxLink setText:tempArray[5]];
            [label_Risk2_DxLink setFont:[UIFont fontWithName:@"Arial" size:12]];
            label_Risk2_DxLink.numberOfLines = 0;
            [scrollView addSubview:label_Risk2_DxLink];
            
        }
    }
    
    
    ////EXACT COPY
    ////RISK3:The Third Risk to show
    for (id key in clinicInformation){
        NSMutableArray *tempArray =[clinicInformation objectForKey:key];
        if ([tempArray[3] intValue] == 3){
            float riskChance = [tempArray[1] floatValue];
            riskChance = (log2f(riskChance) / log2f(2.71828))* 0.01 + 1;
            ///////Risk1_Risktext: The first risk box
            UIImageView *imgView_RISK2;
            imgView_RISK2 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 500, 310, 218)];
            imgView_RISK2.image = [UIImage imageNamed:@"5-RES.png"];
            [scrollView addSubview:imgView_RISK2];
            
            UILabel *label_Risk2_Risktext = [[UILabel alloc]initWithFrame:CGRectMake(15,515,300,20)];
            if ([tempArray[1] intValue]>=30){
                NSString *preText= [NSString stringWithFormat:@"High Risk (%f)",riskChance];
                [label_Risk2_Risktext setText:preText];
                [label_Risk2_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk2_Risktext setTextColor:[UIColor redColor]];
            }else if([tempArray[1] intValue]<30 && [tempArray[1] intValue]>10){
                NSString *preText= [NSString stringWithFormat:@"Risk (%f)",riskChance];
                [label_Risk2_Risktext setText:preText];
                [label_Risk2_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk2_Risktext setTextColor:[UIColor blackColor]];
            }else{
                [label_Risk2_Risktext setText:@"Not enough information"];
                [label_Risk2_Risktext setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
                [label_Risk2_Risktext setTextColor:[UIColor blackColor]];
                tempArray =[clinicInformation objectForKey:@"others"];
                
            }
            [scrollView addSubview:label_Risk2_Risktext];
            
            //DxRisk
            UILabel *label_Risk2_DxRisk = [[UILabel alloc]initWithFrame:CGRectMake(15,525,300,60)];
            [label_Risk2_DxRisk setText:tempArray[0]];
            [label_Risk2_DxRisk setFont:[UIFont fontWithName:@"Arial" size:18]];
            label_Risk2_DxRisk.numberOfLines = 0;
            [scrollView addSubview:label_Risk2_DxRisk];
            //DxAdvices
            UILabel *label_Risk2_DxAdvices = [[UILabel alloc]initWithFrame:CGRectMake(15,555,300,100)];
            [label_Risk2_DxAdvices setText:tempArray[4]];
            [label_Risk2_DxAdvices setFont:[UIFont fontWithName:@"Arial" size:15]];
            label_Risk2_DxAdvices.numberOfLines = 0;
            [scrollView addSubview:label_Risk2_DxAdvices];
            //DxLink
            UILabel *label_Risk2_DxLink_instruction = [[UILabel alloc]initWithFrame:CGRectMake(15,645,300,20)];
            [label_Risk2_DxLink_instruction setText:@"More Readings"];
            [label_Risk2_DxLink_instruction setFont:[UIFont fontWithName:@"Arial" size:12]];
            label_Risk2_DxLink_instruction.numberOfLines = 0;
            [scrollView addSubview:label_Risk2_DxLink_instruction];
            UILabel *label_Risk2_DxLink = [[UILabel alloc]initWithFrame:CGRectMake(15,655,300,40)];
            [label_Risk2_DxLink setText:tempArray[5]];
            [label_Risk2_DxLink setFont:[UIFont fontWithName:@"Arial" size:12]];
            label_Risk2_DxLink.numberOfLines = 0;
            [scrollView addSubview:label_Risk2_DxLink];
            
        }
    }
    
    UIImageView *imgView_disclaimer;
    imgView_disclaimer = [[UIImageView alloc] initWithFrame:CGRectMake(0, cover, 320, 950)];
    imgView_disclaimer.image = [UIImage imageNamed:@"HD_BG2.png"];
    [scrollView addSubview:imgView_disclaimer];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


////Setters and getters
-(void) setClinicResults:(NSMutableDictionary *) inputClinicResults{
    clinicResults = inputClinicResults;
}

@end
