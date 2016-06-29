//
//  ViewController.m
//  CircleLayer
//
//  Created by Fuzzie Liu on 16/6/29.
//  Copyright © 2016年 Fuzzie Liu. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()

@property (strong, nonatomic) CircleView *circleView;
@property (strong, nonatomic) CADisplayLink *countLink;
@property (strong, nonatomic) UILabel *countLabel;
@property (nonatomic) NSInteger percentage;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.circleView.center = self.view.center;
    [self.view addSubview:_circleView];
    
    
    self.circleView.strokeColor = [UIColor colorWithRed:68 / 255.0f green:165 / 255.0f blue:247 / 255.0f alpha:1.0];
    self.circleView.fillColor = [UIColor colorWithRed:113 / 255.0f green:205 / 255.0f blue:243 / 255.0f alpha:0.7];
    self.circleView.strokeWidth = 3.0f;
    self.circleView.startValue = 0;
    [self.circleView addSubview:self.countLabel];
    
    [self.mySwitch addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventValueChanged];
    
}

- (CADisplayLink *)countLink{
    if (!_countLink) {
        _countLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(countFrom:)];
    }
    return _countLink;
}

- (UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _countLabel.backgroundColor = [UIColor clearColor];
        _countLabel.font = [UIFont systemFontOfSize:42];
        _countLabel.textColor = [UIColor colorWithRed:0 / 255.0f green:102 / 255.0f blue:215 / 255.0f alpha:1.0];
        _countLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _countLabel;
}

- (void)countFrom: (NSInteger)startNum{
    if (self.percentage <= 300 && self.percentage % 3 == 0) {
        startNum = self.percentage / 3;
        self.countLabel.text = [NSString stringWithFormat:@"%ld%%", startNum];
        self.circleView.endValue = startNum / 100.f;
    }else if(self.percentage > 300){
        [self.countLink invalidate];
        self.countLink = nil;
    }
    self.percentage += 1;
    NSLog(@"%ld", self.percentage);
    
}

- (void)switchAction{
    NSLog(@"%d",self.mySwitch.isOn);
    if (self.mySwitch.isOn) {
        [self.countLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        self.countLink.paused = NO;
    }else{
        if (self.percentage < 300) {
//            [self.countLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
            self.countLink.paused = YES;
        }else{
            self.countLabel.text = nil;
            self.percentage = 0;
            self.circleView.startValue = 0;
            self.circleView.endValue = 0;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
