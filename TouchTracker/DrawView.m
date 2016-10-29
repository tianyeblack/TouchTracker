//
//  DrawView.m
//  TouchTracker
//
//  Created by Ye Tian on 28/10/2016.
//  Copyright © 2016 Ye Tian. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder: aDecoder];
  if (self) _finishedLines = [[NSMutableArray alloc] init];
  return self;
}

- (void) strokeLine: (Line *) line {
  UIBezierPath *path = [[UIBezierPath alloc] init];
  path.lineWidth = 10;
  path.lineCapStyle = kCGLineCapRound;
  
  [path moveToPoint: line.begin];
  [path addLineToPoint: line.end];
  
  [path stroke];
}

- (void) drawRect: (CGRect)rect {
  [[UIColor blackColor] setStroke];
  for (Line *line in _finishedLines) [self strokeLine: line];
  
  if (_currentLine) {
    [[UIColor redColor] setStroke];
    [self strokeLine: _currentLine];
  }
}

#pragma mark - Touch Events

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  UITouch *touch = touches.anyObject;
  
  CGPoint location = [touch locationInView: self];
  
  _currentLine = [[Line alloc] initWithBegin: location end: location];
  
  [self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  UITouch *touch = touches.anyObject;
  
  CGPoint location = [touch locationInView: self];
  
  _currentLine.end = location;
  
  [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [_finishedLines addObject: _currentLine];
  _currentLine = nil;
  
  [self setNeedsDisplay];
}

@end
