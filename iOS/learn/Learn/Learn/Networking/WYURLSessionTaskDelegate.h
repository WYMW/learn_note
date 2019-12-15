//
//  WYURLSessionTaskDelegate.h
//  Learn
//
//  Created by YmWw on 2019/11/17.
//  Copyright © 2019 com.aso.task. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYURLSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef NSURL* _Nullable (^WYURLSessionDownloadTaskDidFinishDownloadBlock)(NSURLSession *session, NSURLSessionDownloadTask *downloadTask, NSURL *location);
typedef void (^WYURLSessionTaskProgressBlock)(NSProgress *progress);
typedef void (^WYURLSessionTaskCompleteBlock)(NSURLResponse *response, id responseObject, NSError *error);

@interface WYURLSessionTaskDelegate : NSObject <NSURLSessionDelegate, NSURLSessionDataDelegate, NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate>

@property (nonatomic, weak) WYURLSessionManager *sessionManager;
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSProgress *uploadProgress;
@property (nonatomic, strong) NSProgress *downloadProgress;
@property (nonatomic, strong) NSURL *downloadFileURL;
@property (nonatomic, copy) WYURLSessionDownloadTaskDidFinishDownloadBlock donwloadFinishBlock;
@property (nonatomic, copy) WYURLSessionTaskProgressBlock uploadProgressBlock;
@property (nonatomic, copy) WYURLSessionTaskProgressBlock downloadProgressBlock;
@property (nonatomic, copy) WYURLSessionTaskCompleteBlock completeBlock;
- (instancetype) initWithSessionTask:(NSURLSessionTask *)task;
@end


NS_ASSUME_NONNULL_END
