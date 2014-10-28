//
//  HistoryViewController.m
//  Magic Cards
//
//  Created by User on 10/21/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//
#import "HistoryViewController.h"
#import "MagicCardsViewController.h"
@interface HistoryViewController ()

@end

@implementation HistoryViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.disp.text = self.display;
   
   // NSString *append = [NSString stringWithFormat:@""];
    
    
    NSMutableAttributedString *strings = [[NSMutableAttributedString alloc]init];
    
    [strings appendAttributedString:self.display];
    

    //self.displayGameProcess.attributedText = self.textToAnalyze;

    self.displayGameProcess.attributedText = strings;
       
	[super updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

@end
