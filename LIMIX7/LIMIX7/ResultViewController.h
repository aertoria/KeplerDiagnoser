//
//  ResultViewController.h
//  LIMIX7
//
//  Created by Ethan Wayne on 2/20/14.
//  Copyright (c) 2014 YINIC. All rights reserved.
//

#import <UIKit/UIKit.h>
float cover;
@interface ResultViewController : UIViewController{
    UIScrollView *scrollView;
    NSMutableDictionary *clinicResults;
    NSMutableDictionary *clinicDiagnosis;
}


-(void) setClinicResults:(NSMutableDictionary *) inputClinicResults;
@end
