//
//  ListViewController.m
//  Nerdfeed
//
//  Created by Joseph Baldwin on 1/9/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "ListViewController.h"

@implementation ListViewController

- (void) connection: (NSURLConnection *) conn
        didFailWithError:(NSError *)error
{
    // Release the connection object, we're done with it
    xmlData = nil;
    
    // Release the xmlData object, we're done tith it
    xmlData = nil;
    
    // Grab the description of the error object passed to us
    NSString *errorString = [NSString stringWithFormat:@"Fetch failed: %@",
                             [error localizedDescription]];

    // Create and show an alert view with this error displayed
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
                                       message:errorString
                                       delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}


// This method will be called several times as the data arrives
- (void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    // Add the incoming chunk of data to the container we are keeping
    // tje data always comes int he correct order
    [xmlData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    // We are just checking to make sure we are getting the XML
    NSString *xmlCheck = [[NSString alloc] initWithData: xmlData
                                               encoding:NSUTF8StringEncoding];
    NSLog(@"xmlCheck = %@", xmlCheck);
 
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        [self fetchEntries];
    }
    return self;
}
                                   

- (void) fetchEntries
{
  // Create a new data container for the stuff that comes back from the service
    xmlData = [[NSMutableData alloc] init];
    
    //Contstruct a URL that will asl for the service for what you want -
    // Note we canm concatenate literl strins together on multiple
    // lines in this way - this results in a single NSString instance
    NSURL *url = [NSURL URLWithString:
                  @"http://forums.bignerdranch.com/smartfeed.php?"
                  @"limit=1_DAY&sort_by=standard&feed_type=RSS2.0&feed_style=COMPACT"];
    
    //Put the URL into an NSUrlRequest
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    // Create a connection that will exchange this request for data from the URL
    connection = [[NSURLConnection alloc] initWithRequest:req
                                                 delegate:self
                                         startImmediately:YES];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nil;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
