//
//  JMIViewController.m
//  blurView
//
//  Created by Ibanez, Jose on 6/25/13.
//  Copyright (c) 2013 Ibanez, Jose. All rights reserved.
//

#import "JMIViewController.h"
#import "JMIBlur.h"
#import <MediaPlayer/MediaPlayer.h>

@interface JMIViewController ()

@property (nonatomic) UILabel *fpsLabel;
@property (nonatomic) CADisplayLink *displayLink;

@property (nonatomic) JMIBlurView *blurView;
@property (nonatomic) MPMoviePlayerController *moviePlayerController;

@end

@implementation JMIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer *touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(touch:)];
    touch.minimumPressDuration = 0.0;
    touch.allowableMovement = CGFLOAT_MAX;
    [self.view addGestureRecognizer:touch];
    
    
//    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
//    background.frame = self.view.bounds;
//    background.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [self.view addSubview:background];
    
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"]];
    self.moviePlayerController.view.frame = self.view.bounds;
    self.moviePlayerController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.moviePlayerController prepareToPlay];
    [self.view addSubview:self.moviePlayerController.view];
    
    
    self.blurView = [[JMIBlurView alloc] initWithFrame:CGRectZero blurStyle:blurStylePlayerControls];
    
    self.blurView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.blurView addConstraint:[NSLayoutConstraint constraintWithItem:self.blurView
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1.0
                                                               constant:200.0]];
    [self.blurView addConstraint:[NSLayoutConstraint constraintWithItem:self.blurView
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1.0
                                                               constant:200.0]];
    self.blurView.center = self.view.center;
    [self.view addSubview:self.blurView];
    [self.view layoutIfNeeded];
    
    
    self.fpsLabel = [[UILabel alloc] init];
    self.fpsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.fpsLabel.textColor = [UIColor greenColor];
    self.fpsLabel.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.fpsLabel];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fpsLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.fpsLabel
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-10.0]];
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateFPSLabel:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [self.moviePlayerController play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.displayLink invalidate];
    self.displayLink = nil;
}


- (void)updateFPSLabel:(CADisplayLink *)displayLink {
    static CFTimeInterval previous = 0.0;
    CFTimeInterval diff = displayLink.timestamp - previous;
    previous = displayLink.timestamp;
    self.fpsLabel.text = [NSString stringWithFormat:@"%.1f", (1.0 / diff)];
}

- (void)touch:(UILongPressGestureRecognizer *)gestureRecognizer {
    self.blurView.center = [gestureRecognizer locationInView:self.view];
}

@end
