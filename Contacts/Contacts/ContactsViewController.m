//
//  ViewController.m
//  Contacts
//
//  Created by Jim Toepel on 6/10/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSArray *contactArray = @[@"Johnny Appleseed",
                                  @"Paul Bunyan",
                                  @"Calamity Jane"];
        _contacts = [NSMutableArray arrayWithArray:contactArray];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                             forIndexPath:indexPath];
    NSString *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact;
    return cell;
}




@end
