//
//  ViewController.m
//  Sticky Header Table
//
//  Created by Pham on 3/2/15.
//  Copyright (c) 2015 Pham. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+StickyHeader.h"

#define HEADER_HEIGHT   60
#define FONT_SIZE       20

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) UIView *tableHeader;
@property (nonatomic, strong) UILabel *tableHeaderLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [NSMutableArray array];
    for(int i = 0; i < 100; i++) {
        [self.data addObject:@(i)];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    CGRect frame = self.tableView.frame;
    frame.origin.y = 20;
    frame.size.height -= 20;
    self.tableView.frame = frame;
    [self.tableView setStickyHeader:true];
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, HEADER_HEIGHT)];
    self.tableHeader.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tableHeader.backgroundColor = [UIColor blueColor];
    self.tableHeader.opaque = false;
    
    self.tableHeaderLabel = [[UILabel alloc] initWithFrame:self.tableHeader.bounds];
    self.tableHeaderLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableHeaderLabel.backgroundColor = [UIColor clearColor];
    self.tableHeaderLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE];
    self.tableHeaderLabel.textColor = [UIColor whiteColor];
    self.tableHeaderLabel.text = @"Sticky Header";
    self.tableHeaderLabel.textAlignment = NSTextAlignmentCenter;
    [self.tableHeader addSubview:self.tableHeaderLabel];
    self.tableView.tableHeaderView = self.tableHeader;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *const CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(! cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.data[indexPath.row]];
    
    return cell;
}

@end
