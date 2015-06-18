
#define MAXHEIGHT [UIScreen mainScreen].bounds.size.height
#import "YvanDatePicker.h"

@interface YvanDatePicker ()

@end

@implementation YvanDatePicker


+ (YvanDatePicker *)sharedManager
{
    static YvanDatePicker *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
        sharedAccountManagerInstance.backgroundColor=[UIColor colorWithWhite:0.5 alpha:0.4];
    });
    return sharedAccountManagerInstance;
}

-(void)showInWindow
{
    [self showInView:[UIApplication sharedApplication].keyWindow];
}
-(void)showInView:(UIView*)view
{
    [self showInView:view withFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    
}
//frame相对于父视图的位置
-(void)showInView:(UIView*)view withFrame:(CGRect)frame;
{
    
    self.frame=CGRectMake(frame.origin.x, MAXHEIGHT, frame.size.width, frame.size.height);
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame=frame;
    } completion:nil];
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissView)];
    [self addGestureRecognizer:tapGesture];
    if (_datePicker==nil) {
        _datePicker=[[UIDatePicker alloc]init];
        _datePicker.locale=[[NSLocale alloc ]initWithLocaleIdentifier:@"zh_Hans_CN"];
        _datePicker.datePickerMode=UIDatePickerModeDate;
        _datePicker.timeZone=[NSTimeZone defaultTimeZone];
    }
    _datePicker.frame=CGRectMake(0, frame.size.height-216, 0, 0);
    [self addSubview:_datePicker];
    
    [view addSubview:self];

}
-(void)dismissView
{
    _selectDate(_datePicker.date);
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame=CGRectMake(0, MAXHEIGHT, self.frame.size.width , self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

@end
