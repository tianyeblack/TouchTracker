//
//  Line.h
//  TouchTracker
//
//  Created by Ye Tian on 28/10/2016.
//  Copyright © 2016 Ye Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Line : NSObject

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;

- (instancetype) initWithBegin: (CGPoint) begin end: (CGPoint) end;

@end
