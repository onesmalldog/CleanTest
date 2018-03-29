//
//  LGView.m
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import "LGView.h"
#import "LGCell.h"
#import "LGModel.h"

@interface LGView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,  weak ) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LGView

- (void)loadDataWithArray:(NSArray *)dataArray {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:dataArray];
    [self.tableView reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self createUI];
    }
    return self;
}

- (void)createUI {
    UITableView *tableView = [self createTableView];
    [self addSubview:tableView];
    self.tableView = tableView;
}

- (UITableView *)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    tableView.allowsSelectionDuringEditing = YES;
    tableView.allowsMultipleSelectionDuringEditing = YES;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.userInteractionEnabled = YES;
    
    return tableView;
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
#pragma mark ------ Delegate ------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LGCell *cell = [LGCell cellWithTableView:tableView];
    
    LGModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LGModel *model = self.dataArray[indexPath.row];
    return [model getBottom];
}
@end
