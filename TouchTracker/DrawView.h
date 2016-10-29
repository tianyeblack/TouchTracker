//
//  DrawView.h
//  TouchTracker
//
//  Created by Ye Tian on 28/10/2016.
//  Copyright © 2016 Ye Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface DrawView : UIView

@property (nonatomic) Line *currentLine;
@property (nonatomic) NSMutableArray *finishedLines;

@end
