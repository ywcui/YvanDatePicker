//
//  ViewController.m
//  YvanDatePicker
//
//  Created by City--Online on 15/6/18.
//  Copyright (c) 2015年 YvanCui. All rights reserved.
//

#import "ViewController.h"
#import "YvanDatePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"弹出" style:UIBarButtonItemStyleDone target:self action:@selector(leftClick)];
}
-(void)leftClick
{
    YvanDatePicker *picker=[YvanDatePicker sharedManager];
    picker.selectDate=^(NSDate *date)
    {
        NSLog(@"%@",date);
    };
//    //1.设置在父视图的Frame
//    CGRect frame=CGRectMake(10, self.view.bounds.size.height-260, self.view.bounds.size.width-20, 260);
//    [picker showInView:self.view withFrame:frame];
//    
//    //2.Window显示
//    [picker showInWindow];
//    
//    //3.View全屏显示
//    [picker showInView:self.view];
    
    //4.相对于Window的Frame
    CGRect frame1=CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height-260, [UIApplication sharedApplication].keyWindow.bounds.size.width, 260);
    [picker showInView:[UIApplication sharedApplication].keyWindow withFrame:frame1];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
