//
//  ViewController.m
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import "ViewController.h"
#import "LGNetwork.h"
#import "LGModel.h"
#import "LGTitleModel.h"
#import "LGView.h"

@interface ViewController ()

@property (nonatomic,  weak ) LGView *v;
@end

@implementation ViewController {
    NSMutableArray *modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Placeholder text";
    
    LGView *v = [[LGView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:v];
    self.v = v;
    
    [self loadData];
}

- (void)loadData {
    
    [LGNetwork getJsonResponseWithCallback:^(NSDictionary *res) {
        
        if (res) {
            NSLog(@"Now start load...");
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                LGTitleModel *titleModel = [LGTitleModel modelWithDict:res];
                NSLog(@"title: %@", titleModel.title);
                
                modelArray = [NSMutableArray arrayWithCapacity:titleModel.rows.count];
                
                for (NSDictionary *dic in titleModel.rows) {
                    
                    LGModel *model = [LGModel modelWithDict:dic];
                    
                    [modelArray addObject:model];
                }
                
                [self doInMainQueue:^{
                    self.navigationItem.title = titleModel.title;
                    [self.v loadDataWithArray:modelArray];
                }];
                
            });
            
        }
        else {
            NSLog(@"Error, stop here!");
        }
        
    }];
}

- (void)doInMainQueue:(void(^)(void))block {
    if ([NSThread isMainThread]) {
        block();
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
