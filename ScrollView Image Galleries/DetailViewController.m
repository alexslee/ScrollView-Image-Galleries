//
//  DetailViewController.m
//  ScrollView Image Galleries
//
//  Created by Alex Lee on 2017-06-12.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    //setup of the scrollview to allow for user zooming
    self.scroll.maximumZoomScale = 5;
    self.scroll.minimumZoomScale = 1;
    
    //default zoom level is fully zoomed out
    self.scroll.zoomScale = 1;
    
    //prevent zooming past the bounds set above
    self.scroll.bouncesZoom = NO;

    self.imageView.image = self.detailedImage;
    self.scroll.contentSize = self.imageView.frame.size;
    
    //prevent distortion of image by scaling to fit the aspect ratio
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.scroll.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;
{
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale;
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
