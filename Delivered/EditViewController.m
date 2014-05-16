//
//  EditViewController.m
//  Delivered
//
//  Created by brett davis on 7/12/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import "EditViewController.h"
#import "DetailViewController.h"
#import "Package.h"

@interface EditViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation EditViewController

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
        _packageDescription.text = thePackage.name;
        _packageDescription.delegate = self;
        _trackingNumber.text = thePackage.trackingNumber;
        _trackingNumber.delegate = self;
        [_selector addTarget:self action:@selector(pickOne:) forControlEvents:UIControlEventValueChanged];
        
       // NSLog(@" edit view: %@", thePackage.shippingProvider);
        
        if([thePackage.shippingProvider isEqual: @"FedEx"]){
            _selector.selectedSegmentIndex = 0;
        }
        
        if([thePackage.shippingProvider isEqual: @"UPS"]){
            _selector.selectedSegmentIndex = 1;  
        }
        if([thePackage.shippingProvider isEqual: @"USPS"]){
            _selector.selectedSegmentIndex = 2;
        }
        
        _shippingProvider = [ _selector titleForSegmentAtIndex:[_selector selectedSegmentIndex]];

        
    }
}


-(void) pickOne:(id)sender{
    
    _shippingProvider = [ _selector titleForSegmentAtIndex:[_selector selectedSegmentIndex]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

-(void)splitViewController:(UISplitViewController *)svc
    willHideViewController:(UIViewController *)aViewController
         withBarButtonItem:(UIBarButtonItem *)barButtonItem
      forPopoverController:(UIPopoverController *)pc
{
   // NSLog(@"Will hide left side");
}

-(void)splitViewController:(UISplitViewController *)svc
    willShowViewController:(UIViewController *)aViewController
 invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
  //  NSLog(@"Will show left side");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

-(IBAction)saveButton {
    Package *newPackage = [[Package alloc] initWithName:self.packageDescription.text tracking:self.trackingNumber.text shipper:_shippingProvider];
    [self.delegate didClickSaveButton: newPackage];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    Package *newPackage = [[Package alloc] initWithName:self.packageDescription.text tracking:self.trackingNumber.text shipper:_shippingProvider];
    if ([[segue identifier] isEqualToString:@"saveChanges"]) {
        NSLog(@"should seque");
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.package = newPackage;
    }
   
}



@end
