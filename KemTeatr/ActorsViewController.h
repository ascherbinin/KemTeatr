//
//  ActorsViewController.h
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ActorsViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *innerView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
