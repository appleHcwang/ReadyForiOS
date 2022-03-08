//
//  TestView.m
//  readyforios
//
//  Created by hcwang3 on 2022/1/27.
//

#import "TestView.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



/*
* 例如：A中重写父类方法的代码，
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    NSLog(@"AView ---->> hitTest:withEvent: ---");
    UIView * view = [super hitTest:point withEvent:event];
    NSLog(@"AView <<--- hitTest:withEvent: --- /n hitTestView:%@", view);
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    
    NSLog(@"AView --->> pointInside:withEvent: ---");
    BOOL isInside = [super pointInside:point withEvent:event];
    NSLog(@"AView <<--- pointInside:withEvent: --- isInside:%d", isInside);
    int count = (int)self.subviews.count;
    
    
    return isInside;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"AView touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"AView touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"AView touchesEnded");
}

@end
