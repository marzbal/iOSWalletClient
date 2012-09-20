//
//  WalleetRepository.m
//  wallet
//
//  Created by Future Simple on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import "WalleetRepository.h"

#import "WalleetUserData.h"

@implementation WalleetRepository

- (void)createUserWithEmail:(NSString *)email andPassword:(NSString *)password;
{
//    NSURL *url = [NSURL URLWithString:@"http://10.12.216.102:8888/api/v1/person.json"];
//    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
//    
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
//                            height, @"",
//                            weight, @"user[weight]",
//                            nil];
//    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:@"/myobject" parameters:params];
//    
//    AFHTTPRequestOperation *operation = [AFHTTPRequestOperation operationWithRequest:request
//                                                                          completion:^(NSURLRequest *req, NSHTTPURLResponse *response, NSData *data, NSError *error) {
//                                                                              BOOL HTTPStatusCodeIsAcceptable = [[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 100)] containsIndex:[response statusCode]];
//                                                                              if (HTTPStatusCodeIsAcceptable) {
//                                                                                  NSLog(@"Request Successful");
//                                                                              } else {
//                                                                                  NSLog(@"[Error]: (%@ %@) %@", [request HTTPMethod], [[request URL] relativePath], error);
//                                                                              }
//                                                                          }];
//    
//    NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
//    [queue addOperation:operation];
}

- (void)getUserForEmail:(NSString *)email andPassword:(NSString *)password
{
    NSURL *url = [NSURL URLWithString:@"http://10.12.216.102:8888/api/v1/person/sign_in.json"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:@"" parameters:nil];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    // prepare request body
    NSMutableDictionary *personDictionary = [[NSMutableDictionary alloc] initWithCapacity:2];
    [personDictionary setValue:email forKey:@"email"];
    [personDictionary setValue:password forKey:@"password"];
    NSMutableDictionary *requestBodyDictionary = [[NSMutableDictionary alloc] initWithCapacity:1];
    [requestBodyDictionary setValue:personDictionary forKey:@"person"];
    
    // "email\":\"aaa@example.com\", \"password\":\"test123\"}}";
    NSData *requestBody = [NSJSONSerialization dataWithJSONObject:requestBodyDictionary options:NSJSONWritingPrettyPrinted error:nil];
    [request setHTTPBody:requestBody];
    
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSDictionary *dictionary = (NSDictionary *)responseObject;
        NSString *token = [dictionary objectForKey:@"api_token"];
    
        // save user credentials
        [WalleetUserData sharedInstance].userEmail = email;
        [WalleetUserData sharedInstance].userPassword = password;
        [WalleetUserData sharedInstance].userToken = token;
        
        NSLog(@"Token:%@", token);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        [WalleetUserData sharedInstance].userEmail = @"";
        [WalleetUserData sharedInstance].userPassword = @"";
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

@end
