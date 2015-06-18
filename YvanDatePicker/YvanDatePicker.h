
//  YvanDatePicker.h

#import <UIKit/UIKit.h>
typedef  void (^selectDate)(NSDate *date);

@interface YvanDatePicker : UIView

+ (YvanDatePicker *)sharedManager;

@property(nonatomic,strong) selectDate selectDate;

@property(nonatomic,strong) UIDatePicker *datePicker;

-(void)showInWindow;

-(void)showInView:(UIView*)view;

-(void)showInView:(UIView*)view withFrame:(CGRect)frame;

-(void)dismissView;
@end
