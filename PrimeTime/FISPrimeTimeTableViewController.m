//
//  FISTableViewController.m
//  PrimeTime
//
//  Created by Henry Dinhofer on 6/23/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeTimeTableViewController.h"

@interface FISPrimeTimeTableViewController ()

@property (strong, nonatomic) NSMutableArray *primeList;

@end

@implementation FISPrimeTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makePrimeList];
    NSLog(@"Number of items in array is %lu", (unsigned long)self.primeList.count);
    self.tableView.accessibilityIdentifier = @"table";
    NSLog(@"Calling primeNumber:5 should return 11 = %lu", [self primeNumber:5]);
   
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.primeList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    NSString *canIHaveYourPrimeNumbah = [NSString stringWithFormat:@"%@", self.primeList[indexPath.row]];
    cell.textLabel.text = canIHaveYourPrimeNumbah;
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger )primeNumber:(NSInteger)prime {
    
    NSNumber *primeNSNumber = self.primeList[prime-1];
    return [primeNSNumber integerValue];
}
-(void)makePrimeList {
    self.primeList = [[NSMutableArray alloc] initWithObjects:@(2), nil];
    NSUInteger i = 3;
    
    while (self.primeList.count < 2001) {
        
        for (NSUInteger currentM = i-1; currentM > 0; currentM--) {
            if (currentM == 1){
                [self.primeList addObject:@(i)];
                break;
            }
            else if (i % currentM == 0 ) {
                break;
            }

        }
        i += 2;
    }
    //NSLog(@"primeList is %@", self.primeList);
    
}

@end
