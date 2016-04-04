//
//  ViewController.m
//  RunningLed
//
//  Created by chihieu on 4/4/16.
//  Copyright © 2016 chihieu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _margin;
    int _numberOfBall;
    CGFloat _space;
    CGFloat _ballDiameter;
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _margin = 40.0;
    _ballDiameter = 24.0;
    
    [self checkSizeOfApp];
    [self numberOfBallvsSpace];
    [self drawRowOfBall:13];
    
    
    //[self placeGreyBallAtX:100 andY:100 withTag:1];


//    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grey"]];
//    ball.center = CGPointMake(100,100);
//    ball.tag = 1;
//    [self.view addSubview:ball];
//    NSLog(@"w=%3.0f, h=%3.0f", ball.bounds.size.width,ball.bounds.size.height);
    
}
-(void) placeGreyBallAtX:(CGFloat) x
                    andY:(CGFloat) y
                 withTag:(int)tag
{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [self.view addSubview:ball];
    

}

-(CGFloat) spaceBetweenBallCenterWhenNumberBallIsKnown: (int) n{ //<!
    return (self.view.bounds.size.width - 2 * _margin) / (n-1);


}
-(void) numberOfBallvsSpace {
    BOOL stop = false;
    int n = 3;
    while (!stop) {
        CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnown: n];
        if (space < _ballDiameter) {
            stop = true;
        } else {
            NSLog(@"Number of Ball %d, space between ball center %3.0f", n,
                  space);
        }
        n++;
        
    }
    
}
-(void) drawRowOfBall: (int) numberBalls {
    CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnown:numberBalls];
    for (int i = 0; i<numberBalls + 10; i++){
        //[ self placeGreyBallAtX:_margin + i* space
                           //andY:140
                        //withTag:i +100];
        for (int j =0; j<numberBalls; j++) {
            [self placeGreyBallAtX:_margin + j* space
                              andY:_margin + i* space
                           withTag:j +140];
            
        }
        
        
    }
    
    
}


-(void) checkSizeOfApp {
   CGSize size = self.view.bounds.size;
    NSLog(@"width = %3.0f, height = %3.0f", size.width, size.height);
    
}
@end
