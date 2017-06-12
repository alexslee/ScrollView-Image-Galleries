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
    
    //initialize images array
    self.images = [[NSArray alloc] initWithObjects: [UIImage imageNamed:@"Lighthouse-in-Field"], [UIImage imageNamed:@"Lighthouse-night"], [UIImage imageNamed:@"Lighthouse-zoomed"], nil];
    
    self.imageOriginX = 0;
    for (UIImage *image in self.images) {
        CGRect frame = CGRectMake(self.imageOriginX, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.scrollView.frame));
        
        UIImageView *view = [[UIImageView alloc]initWithImage:image];
        view.frame = frame;
        view.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollView addSubview:view];
        
        self.imageOriginX += CGRectGetWidth(self.view.frame);
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake([self.images count] * CGRectGetWidth(self.view.frame), CGRectGetHeight(self.scrollView.frame));
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
