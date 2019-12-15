//
//  NetworkingViewController.m
//  Learn
//
//  Created by YmWw on 2019/11/16.
//  Copyright © 2019 com.aso.task. All rights reserved.
//

#import "NetworkingViewController.h"

@interface NetworkingViewController ()<NSURLSessionTaskDelegate, NSURLSessionDataDelegate>
@property (nonatomic, strong) NSData *data;
@end

@implementation NetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://192.168.1.14:8080/af/test"]];
    [dataTask resume];
    
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    
    NSLog(@" didReceiveResponse = %@", response);
    
    completionHandler(NSURLSessionResponseAllow);
    
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    
    NSLog(@"%s", __func__);
}
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
    NSLog(@" didReceiveData =  %@",data);
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
