//
//  OpenFileController.m
//  ourFireworks
//
//  Created by  Fry Constantine  on 8/18/09.
//  Copyright 2009 home. All rights reserved.
//

#import "TableController.h"



@implementation TableController
@synthesize Data  = itemName_;

- (id)init{
	self = [super init];
	if (self != nil) {
		CGRect frame = CGRectMake(0, 0, 200, 240);
		self.view = [[UIView alloc]initWithFrame:frame];
		UITableView *table = [[UITableView alloc]initWithFrame:frame];
		[table setDelegate:self];
		[table setDataSource:self];
		[self.view addSubview:table];
		[table release];
		
		
		UIImageView *imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 4)] autorelease];  
		imgView.image = [UIImage imageNamed:@"top.png"];  
		[self.view addSubview:imgView];  
		
		imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-4, self.view.frame.size.width, 4)] autorelease];  
		imgView.image = [UIImage imageNamed:@"down.png"];  
		[self.view addSubview:imgView];
	}
	return self;
}


- (id)initWithItems:(NSArray *)items{
    if (self = [self init]) {
		items_= [[NSArray alloc]initWithArray:items];
	}
    return self;
}

-(NSInteger)numberOfSectionInTableView:(UITableView*)tableView{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [items_ count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return nil;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
	//[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:    UITableViewScrollPositionMiddle   ];
	[itemName_ release];
	itemName_ = [[items_ objectAtIndex:indexPath.row]  description];
}

// The editing style for a row is the kind of button displayed to the left of the cell when in editing mode.
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	// No editing style if not editing or the index path is nil.
	/*if (tableOfFiles_.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
	// Determine the editing style based on whether the cell is a placeholder for adding content or already
	// existing content. Existing content can be deleted.
	if ( tableOfFiles_.editing && indexPath.row == ([groupsArray_ count])) {
		return UITableViewCellEditingStyleInsert;
	} else {
		return UITableViewCellEditingStyleDelete;
	}*/
	return UITableViewCellEditingStyleNone;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.hidesAccessoryWhenEditing = YES;
	}
	cell.textLabel.text = [items_ objectAtIndex:indexPath.row];
	return cell;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[items_ release];
    [super dealloc];
}


@end
