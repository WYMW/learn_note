//
//  ViewController.m
//  Learn
//
//  Created by YmWw on 2019/11/16.
//  Copyright © 2019 com.aso.task. All rights reserved.
//

#import "ViewController.h"
#import "NetworkingViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *points;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.points = @[@"网络请求"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pointCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.points.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pointCell"];
    cell.textLabel.text =  self.points[indexPath.row];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        NetworkingViewController *controller = [[NetworkingViewController alloc] initWithNibName:@"NetworkingViewController" bundle:nil];
        
        [self.navigationController pushViewController:controller animated:YES];
        
    }
}




@end
