//
//  ViewController.m
//  LocalNotificationn
//
//  Created by NERC on 2018/4/25.
//  Copyright © 2018年 G. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(100, 200, 50, 50);
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget: self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnAction{
    

    NSLog(@"tuisong");
    UNUserNotificationCenter * center =[UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent * content =[[UNMutableNotificationContent alloc]init];
    content.title =[NSString localizedUserNotificationStringForKey:@"推送的标题" arguments:nil];
    content.body =[NSString localizedUserNotificationStringForKey:@"推送的消息体" arguments:nil];
    content.sound =[UNNotificationSound defaultSound];
    content.badge=@1;
    
    //  > 通知的延时执行
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                                                  triggerWithTimeInterval:5 repeats:NO];
    //每小时重复 1 次喊我喝水
    UNTimeIntervalNotificationTrigger *trigger2 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3600 repeats:YES];
    //每周一早上 8：00 提醒我给老婆做早饭
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekday = 2;
    components.hour = 8;
    UNCalendarNotificationTrigger *trigger3 = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
    
//    //#import <CoreLocation/CoreLocation.h>
//    //一到麦当劳就喊我下车
//    CLRegion *region = [[CLRegion alloc] init];
//    UNLocationNotificationTrigger *trigger4 = [UNLocationNotificationTrigger triggerWithRegion:region repeats:NO];
    

    
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content
                                                                          trigger:trigger
                                      ];
    
    //添加推送通知，等待通知即可！
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
        // > 可在此设置添加后的一些设置
        // > 例如alertVC。。
    }];

    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
