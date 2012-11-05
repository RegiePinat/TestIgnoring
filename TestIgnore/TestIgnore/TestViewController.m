//
//  TestViewController.m
//  TestIgnore
//
//  Created by Regie G. Pinat on 10/31/12.
//  Copyright (c) 2012 Regie G. Pinat. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController
@synthesize imageView;
@synthesize arrayofCoins;



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"wew");
    
    gameTime =0;
    movementSpeed = 1;
    
    
    
    arrayofCoins = [[[NSMutableArray alloc] init] autorelease];
    [arrayofCoins retain];
    
  
    
    timerGame = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(createCoins) userInfo:nil repeats:YES];
    moveTimer =[NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(moveCoins) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    
    [arrayofCoins removeAllObjects];
     arrayofCoins=nil;
    [arrayofCoins release];
    
    
    [timerGame invalidate];
    [moveTimer invalidate];
    
    timerGame = nil;
    moveTimer =nil;
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}




-(int)getRandomNumber:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}


- (IBAction)TestButton:(UIButton *)sender
{
    
    
    NSLog(@"TEST");
    
}



-(void)createCoins
{
    
    gameTime++;
    
    NSLog(@"%d",gameTime);
    
    if (gameTime %2 ==0)
    {
        
        if([arrayofCoins count] <10)
        {
            Coins *coin   = [[Coins alloc] init];
        coin.image = [UIImage imageNamed:@"ElectricOrb.png"];
            [coin setFrame:CGRectMake(0, 0, 20, 20)];
            coin.center = CGPointMake([self getRandomNumber:0+10 to:320-10], 0);
            [arrayofCoins addObject:coin];
            [[self view] addSubview:coin];
            
        }
   
    }

    
    

}



-(void)moveCoins
{
    
    for (Coins *coin in arrayofCoins) {
        if (coin.center.y > self.view.frame.size.height)
        {
            [coin removeFromSuperview];
            [arrayofCoins removeObject:coin];
            [coin release];
            break;
        }
    }
    
    
    for (Coins *coin in arrayofCoins) {
        coin.center =CGPointMake(coin.center.x, coin.center.y + movementSpeed);
    }
    
    
}

- (void)dealloc {

    [timerGame release];
    [moveTimer release];
    [imageView release];
    [super dealloc];
}
@end
