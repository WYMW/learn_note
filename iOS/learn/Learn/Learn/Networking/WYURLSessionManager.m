//
//  WYURLSessionManager.m
//  Learn
//
//  Created by YmWw on 2019/11/17.
//  Copyright © 2019 com.aso.task. All rights reserved.
//

#import "WYURLSessionManager.h"
#import "WYURLSessionTaskDelegate.h"

static NSString * const WYSESSIONLOCKNAME = @"com.wy.urlsession.lock.name";

@interface WYURLSessionManager()

/*
   为每一个任务分配一个代理，代理和任务通过 taskIdentifier 放在此字典中。
 */
@property (nonatomic, strong) NSMutableDictionary *mutableTaskDelegateKeyedTask;
@property (nonatomic, strong) NSLock *lock;
@end

@implementation WYURLSessionManager

- (instancetype)init {
    
    return [self initWithSessionConfig:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

- (instancetype)initWithSessionConfig:(NSURLSessionConfiguration *)sessionConfig {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    if (sessionConfig == nil) {
        self.sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    } else {
        self.sessionConfig = sessionConfig;
    }
    
    self.queue = [[NSOperationQueue alloc] init];
    self.queue.maxConcurrentOperationCount = 1;
    
    self.session = [NSURLSession sessionWithConfiguration:self.sessionConfig delegate:self delegateQueue:self.queue];
    self.mutableTaskDelegateKeyedTask = [[NSMutableDictionary alloc] init];
    
    self.lock = [[NSLock alloc] init];
    self.lock.name = WYSESSIONLOCKNAME;
    return self;
}

- (void)setTaskDelegate:(WYURLSessionTaskDelegate *)delegate forTask:(NSURLSessionTask *)task {
    
    NSParameterAssert(delegate);
    NSParameterAssert(task);
    [self.lock lock];
    [self.mutableTaskDelegateKeyedTask setObject:delegate forKey:@(task.taskIdentifier)];
    [self.lock unlock];
}

- (WYURLSessionTaskDelegate *)getDelegateForTask:(NSURLSessionTask *)task {
    
    NSParameterAssert(task);
    return [self.mutableTaskDelegateKeyedTask objectForKey:@(task.taskIdentifier)];
}


#pragma mark --Create NSURLSessionDataTask

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request
                                     complete:(nullable void(^)(NSURLResponse *resonse, id responseObject, NSError *error)) completeBlock {
    
    return nil;
}


- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request
                               uploadProgress:(nullable void(^)(NSProgress *uploadProgress)) uploadProgressBlock
                             downloadProgress:(nullable void(^)(NSProgress *downloadProgress)) downloadProgressBlock
                                     complete:(nullable void(^)(NSURLResponse *resonse, id responseObject, NSError *error)) completeBlock {
    
    return nil;
}
#pragma mark  -- NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
    
}


#pragma mark   -NSURLSessionDownloadDelegate
- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location {
    
}

@end
