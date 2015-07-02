//
//  AppDelegate.m
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController *actorsNav;
@property (strong, nonatomic) UINavigationController *eventsNav;
@property (strong, nonatomic) UINavigationController *afishaNav;
@property (strong, nonatomic) UINavigationController *repertoireNav;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSInteger tagID = 0;
    
    
    ActorsViewController *actorsVC = [ActorsViewController new];
    EventsViewController *eventVC = [EventsViewController new];
    AfishaViewController *afishaVC = [AfishaViewController new];
    RepertoireViewController *repertoireVC = [RepertoireViewController new];
    
    
    //Actors Section
    self.actorsNav = [[UINavigationController alloc] initWithRootViewController:actorsVC];
    self.actorsNav.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Актеры"
                                  image:[UIImage imageNamed:@"main-icon-norm-1"]
                                    tag:tagID++];
    
    //Event Section
    self.eventsNav = [[UINavigationController alloc] initWithRootViewController:eventVC];
    self.eventsNav.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"События"
                                  image:[UIImage imageNamed:@"main-icon-norm-1"]
                                    tag:tagID++];
    
    //Repertoire Section
    self.repertoireNav = [[UINavigationController alloc] initWithRootViewController:repertoireVC];
    self.repertoireNav.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Репертуар"
                                  image:[UIImage imageNamed:@"main-icon-norm-1"]
                                    tag:tagID++];
    //Afisha Section
    self.afishaNav = [[UINavigationController alloc] initWithRootViewController:afishaVC];
    self.afishaNav.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Афиша"
                                  image:[UIImage imageNamed:@"main-icon-norm-1"]
                                    tag:tagID++];
    
 
    
    NSArray *controllers = [[NSArray alloc]initWithObjects:
                            self.afishaNav,
                            self.actorsNav,
                            self.repertoireNav,
                            self.eventsNav
                            ,nil ];
    
    tabBarController.viewControllers = controllers;
    [tabBarController setSelectedIndex:0];
    [[UITabBar appearance] setTintColor:[UIColor blueColor]];

    
    [self.window setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
