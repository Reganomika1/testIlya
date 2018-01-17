//
//  IdentificationViewController.m
//  BSProgectOnObjectiveC
//
//  Created by Admin on 16.01.18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "IdentificationViewController.h"

@interface IdentificationViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@end

@implementation IdentificationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setAppearance];
}

#pragma mark - Appearance

-(void) setAppearance {
    
    [self setSegmentedControl];
    [self setPageViewController];
}

-(void) setSegmentedControl {
    
    self.arrPageTitles = @[@"Login",@"Register"];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    greenView.backgroundColor = [UIColor colorWithRed:0.54 green:0.75 blue:0.24 alpha:1.0];
    [self.view addSubview:greenView];
    
    self.segmentCotroller = [[HMSegmentedControl alloc] initWithSectionTitles:self.arrPageTitles];
    
    self.segmentCotroller.frame = CGRectMake(0,20, self.view.frame.size.width, 60);
    
    self.segmentCotroller.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:0.5]};
    self.segmentCotroller.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentCotroller.backgroundColor = [UIColor colorWithRed:0.54 green:0.75 blue:0.24 alpha:1.0];
    self.segmentCotroller.selectionIndicatorColor = [UIColor whiteColor];
    
    self.segmentCotroller.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentCotroller.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    
    [self.segmentCotroller addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmentCotroller];
}

-(void) setPageViewController {
    
    self.storyboardIDs = @[@"LoginViewController", @"RegisterViewController"];
    
    self.pageController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
    self.pageController.view.frame = CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80);
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
    
    [self setVisibleViewControllerWithIndex:0];
}


- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    [self setVisibleViewControllerWithIndex:segmentedControl.selectedSegmentIndex];
}


-(void) setVisibleViewControllerWithIndex :(NSUInteger) index{
    
    UIViewController *startingViewController = [self.storyboard instantiateViewControllerWithIdentifier:self.storyboardIDs[index]];
    NSArray *viewControllers = @[startingViewController];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}


#pragma mark - Others

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.storyboardIDs count] == 0) || (index >= [self.storyboardIDs count])) {
        return nil;
    }
    
    return [self.storyboard instantiateViewControllerWithIdentifier:self.storyboardIDs[index]];
}


#pragma mark - UIPageViewControllerDataSource


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSString *storyBoardId = [NSString stringWithFormat:@"%@", viewController.class];
    
    NSInteger index = [self.storyboardIDs indexOfObject:storyBoardId];
    
    if ((index == 0) || (index == NSNotFound)){
        
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.storyboardIDs indexOfObject:[NSString stringWithFormat:@"%@", viewController.class]];

    if (index == NSNotFound){
        return nil;
    }
    
    index++;
    
    if (index == [self.storyboardIDs count]){
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    
    if ([previousViewControllers.firstObject isKindOfClass:[LoginViewController class]]){
        self.segmentCotroller.selectedSegmentIndex = 1;
    } else {
        self.segmentCotroller.selectedSegmentIndex = 0;
    }
}

@end
