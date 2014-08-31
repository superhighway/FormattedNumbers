#import "FN.h"
#import "FNExample.h"
#import "FNTableViewCell.h"
#import "FNTableViewController.h"

@interface FNTableViewController ()

@end

@implementation FNTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.example.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.example.summary;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.example.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FNTableViewCell" forIndexPath:indexPath];
    [cell bindWithFNModel:self.example.list[indexPath.row]];
    return cell;
}

@end
