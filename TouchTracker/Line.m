//
//  Line.m
//  TouchTracker
//
//  Created by Ye Tian on 28/10/2016.
//  Copyright © 2016 Ye Tian. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype) initWithBegin:(CGPoint)begin end:(CGPoint)end {
  self = [super init];
  if (self) {
    _begin = begin;
    _end = end;
  }
  return self;
}

@end
