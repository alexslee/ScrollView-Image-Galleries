//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Alex Lee on 2017-06-12.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSArray *images;

@property (nonatomic)CGFloat imageOriginX;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.images = [[NSArray alloc] initWithObjects: [UIImage imageNamed:@"Lighthouse-in-Field"], [UIImage imageNamed:@"Lighthouse-night"], [UIImage imageNamed:@"Lighthouse-zoomed"], nil];
    self.imageOriginX = 0;
    for (UIImage *image in self.images) {
        CGRect frame = CGRectMake(self.imageOriginX, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
        UIImageView *view = [[UIImageView alloc]initWithImage:image];
        view.frame = frame;
        self.imageOriginX += CGRectGetWidth(self.scrollView.frame);
        [self.scrollView addSubview:view];
    }
    self.scrollView.contentSize = CGSizeMake([self.images count] * CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
