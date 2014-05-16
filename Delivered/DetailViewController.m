//
//  DetailViewController.m
//  Delivered
//
//  Created by brett davis on 6/10/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "PackageDataController.h"
#import "Package.h"
#import "TouchXML.h"
#import "EditViewController.h"


@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setPackage:(Package *) newPackage
{
    if (_package != newPackage) {
        _package = newPackage;
        
        // Update the view.
        [self configureView];
    }
    
}

- (void)configureView
{

    // Update the user interface for the detail item.
    //NSLog(@"%@ %@ %@", self.package.name, self.package.trackingNumber, self.package.shippingProvider);
    Package *thePackage = self.package;
    
    
    if (thePackage) {
        self.packageNameLabel.text = thePackage.name;
        self.trackingNumberLabel.text = thePackage.trackingNumber;
        
        
        }
        NSString *fullURL;
        NSURL *url;
        NSURLRequest *requestObj;
        
        
        if([thePackage.shippingProvider isEqual: @"UPS"]){
        fullURL = [NSString stringWithFormat:@"http://wwwapps.ups.com/WebTracking/track?loc=en_US&track.x=Track&trackNums=%@", thePackage.trackingNumber];
        url = [NSURL URLWithString:fullURL];
        requestObj = [NSURLRequest requestWithURL:url];
        }
        
        if([thePackage.shippingProvider isEqual: @"FedEx"]){
            fullURL = [NSString stringWithFormat:@"http://www.fedex.com/Tracking?action=track&tracknumbers=%@", thePackage.trackingNumber];
            url = [NSURL URLWithString:fullURL];
            requestObj = [NSURLRequest requestWithURL:url];
        }
        
        if([thePackage.shippingProvider isEqual: @"USPS"]){
            fullURL = [NSString stringWithFormat:@"https://tools.usps.com/go/TrackConfirmAction?qtc_tLabels1=%@", thePackage.trackingNumber];
            url = [NSURL URLWithString:fullURL];
            requestObj = [NSURLRequest requestWithURL:url];
        }
        
        
        [_shippingUpdates loadRequest:requestObj];

        
        
        
        //[self getUpdates:thePackage];
    

}

- (void)viewDidLoad
{    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

#pragma mark - UISplitViewDelegate methods
-(void)splitViewController:(UISplitViewController *)svc
    willHideViewController:(UIViewController *)aViewController
         withBarButtonItem:(UIBarButtonItem *)barButtonItem
      forPopoverController:(UIPopoverController *)pc
{
    //Grab a reference to the popover
    self.popover = pc;
    
    //Set the title of the bar button item
    barButtonItem.title = @"List";
    
    //Set the bar button item as the Nav Bar's leftBarButtonItem
    [_navBarItem setLeftBarButtonItem:barButtonItem animated:YES];
}

-(void)splitViewController:(UISplitViewController *)svc
    willShowViewController:(UIViewController *)aViewController
 invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    //Remove the barButtonItem.
    [_navBarItem setLeftBarButtonItem:nil animated:YES];
    
    
    //Nil out the pointer to the popover.
    _popover = nil;
}
-(void)didClickSaveButton: (Package *) thisPackage{
       self.package = thisPackage;
       self.dataController = [PackageDataController sharedInstance];
    NSLog(@"reference 2 = %d", self.dataController.reference);
       [self.dataController.masterPackageList replaceObjectAtIndex:self.dataController.reference withObject:thisPackage];

       [[_currentPopoverSegue popoverController] dismissPopoverAnimated: YES];
       [self.view setNeedsDisplay];

    
}
- (void)getUpdates:(Package *) thisPackage {
       
}

-(void)selectedPackage:(Package *)newPackage
{
    self.package= newPackage;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSLog(@"is: %@", self.package.shippingProvider);
    Package *newPackage = [[Package alloc] initWithName:self.package.name tracking:self.package.trackingNumber shipper:self.package.shippingProvider];
    if ([[segue identifier] isEqualToString:@"editDetails"]) {
        _currentPopoverSegue = (UIStoryboardPopoverSegue *)segue;
        _editView = [segue destinationViewController];
        _editView.delegate = self;
        _editView.package = newPackage;
    }
    
    
}



@end
