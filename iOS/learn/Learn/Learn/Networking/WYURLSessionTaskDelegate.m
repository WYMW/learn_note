//
//  WYURLSessionTaskDelegate.m
//  Learn
//
//  Created by YmWw on 2019/11/17.
//  Copyright © 2019 com.aso.task. All rights reserved.
//

#import "WYURLSessionTaskDelegate.h"

@implementation WYURLSessionTaskDelegate
- (instancetype) initWithSessionTask:(NSURLSessionTask *)task {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    self.responseData = [[NSMutableData alloc] init];
    [self progressWithTask:task];
    return self;
    
    
}

- (void)progressWithTask:(NSURLSessionTask *)task {
    
    self.uploadProgress = [[NSProgress alloc] init];
    self.downloadProgress = [[NSProgress alloc] init];
    
    for(NSProgress *progress in @[self.uploadProgress, self.downloadProgress]) {
        
        progress.totalUnitCount = NSURLSessionTransferSizeUnknown;
        progress.cancellable = YES;
        progress.cancellationHandler = ^{
            [task cancel];
        };
        
        progress.pausable = YES;
        progress.pausingHandler = ^{
            [task suspend];
        };
        
        progress.resumingHandler = ^{
            [task resume];
        };
        
        [progress addObserver:self forKeyPath:NSStringFromSelector(@selector(fractionCompleted)) options:NSKeyValueObservingOptionNew context:NULL];
        
    }
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([object isEqual:self.downloadProgress]) {
        
        if (self.downloadProgressBlock) {
            self.downloadProgressBlock(self.downloadProgress);
        }
    } else if ([object isEqual:self.uploadProgress]) {
    
        if (self.uploadProgressBlock) {
            self.uploadProgressBlock(self.uploadProgress);
        }
    }
}



- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location {
    
}

- (void)dealloc {
    
    for(NSProgress *progress in @[self.uploadProgress, self.downloadProgress]) {
     
        [progress removeObserver:self forKeyPath:NSStringFromSelector(@selector(fractionCompleted))];
    }
    
}

@end


