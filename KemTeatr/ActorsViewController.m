//
//  ActorsViewController.m
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "ActorsViewController.h"

@interface ActorsViewController ()

@end

@implementation ActorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ActorsViewCell" bundle:nil] forCellWithReuseIdentifier:@"ActorsCell"];
   
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section ==0)
    {
       return 1;
    }
    else {
        return 5;
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ActorsCell" forIndexPath:indexPath];
    
    return  cell;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
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
