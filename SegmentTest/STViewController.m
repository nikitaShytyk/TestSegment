//
//  STViewController.m
//  SegmentTest
//
//  Created by Никита on 25.08.14.
//  Copyright (c) 2014 NikitaShitik. All rights reserved.
//

#import "STViewController.h"

//cell
#import "STCell.h"

@interface STViewController ()<UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation STViewController

#pragma mark - IBAction

- (IBAction)segmentedControlValueChanged:(id)sender {
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = nil;
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        identifier = @"Cell1";
    } else {
        identifier = @"Cell2";
    }
    
    STCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.firstLabel.text = [NSString stringWithFormat:@"First text #%@", @(indexPath.row)];
    cell.secondLabel.text = [NSString stringWithFormat:@"Second text #%@", @(indexPath.row)];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

@end
