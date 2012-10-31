//
//  TestViewController.h
//  TestIgnore
//
//  Created by Regie G. Pinat on 10/31/12.
//  Copyright (c) 2012 Regie G. Pinat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coins.h"
@interface TestViewController : UIViewController
{
    NSTimer *timerGame;
    NSTimer *moveTimer;
    
    
    int gameTime;
    float movementSpeed;
}

- (IBAction)TestButton:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet NSMutableArray *arrayofCoins;


-(void)createCoins;
-(void)moveCoins;
-(int)getRandomNumber:(int)from to:(int)to;
@end
