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

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

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
        view.userInteractionEnabled = YES;
        
        //tap recognition for the detailed view for each image
        UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToDetailedView:)];
        [view addGestureRecognizer:tapper];
        
        //lastly, add the image to the UIScrollView, and increment the x position for use in placing the next image
        [self.scrollView addSubview:view];
        self.imageOriginX += CGRectGetWidth(self.view.frame);
    }
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake([self.images count] * CGRectGetWidth(self.view.frame), CGRectGetHeight(self.scrollView.frame));
    
    self.scrollView.delegate = self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIImageView *)sender;
{
    if ([segue.identifier isEqualToString:@"toggleDetailedView"]) {
        //if it passes the above condition, we know the sender was an image and can just assign it to the destination VC
        DetailViewController *destination = [segue destinationViewController];
        destination.detailedImage = sender.image;
    }
}

- (void)tapToDetailedView:(UITapGestureRecognizer *)sender;
{
    //manually perform the segue defined in the Main storyboard
    [self performSegueWithIdentifier:@"toggleDetailedView" sender:sender.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    /*
     * Scroll to the next page on the page control indicators.
     * Math sourced from:
     * https://stackoverflow.com/questions/10198732/programmatically-linking-uipagecontrol-to-uiscrollview
     */
    NSInteger nextPage = floor(self.scrollView.contentOffset.x / scrollView.frame.size.width);
    self.pageControl.currentPage = nextPage;
}

@end
