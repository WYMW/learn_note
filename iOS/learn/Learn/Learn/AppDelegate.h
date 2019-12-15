//
//  AppDelegate.h
//  Learn
//
//  Created by YmWw on 2019/11/16.
//  Copyright © 2019 com.aso.task. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

