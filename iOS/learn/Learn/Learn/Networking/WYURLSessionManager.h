//
//  WYURLSessionManager.h
//  Learn
//
//  Created by YmWw on 2019/11/17.
//  Copyright © 2019 com.aso.task. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYURLSessionManager : NSObject < NSURLSessionDelegate,
                                             NSURLSessionTaskDelegate,
                                             NSURLSessionDataDelegate,
                                             NSURLSessionDownloadDelegate
                                            >

/*
   要管理的NSURLSession
 */
@property (nonatomic, strong) NSURLSession *session;

/*
  NSURLSession的配置
 */
@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfig;

/*
   代理回调后运行的队列
 */
@property (nonatomic, strong) NSOperationQueue *queue;

@end

NS_ASSUME_NONNULL_END
