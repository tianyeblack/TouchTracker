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
  if (self) {
    _finishedLines = [[NSMutableArray alloc] init];
    _currentLines = [[NSMutableDictionary alloc] init];
  }
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
  
  [[UIColor redColor] setStroke];
  for (Line *line in _currentLines.allValues) [self strokeLine: line];
}

#pragma mark - Touch Events

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  for (UITouch *touch in touches) {
    CGPoint location = [touch locationInView: self];
  
    Line *newLine = [[Line alloc] initWithBegin: location end: location];
    
    NSValue *key = [NSValue valueWithNonretainedObject: touch];
    _currentLines[key] = newLine;
  }
  
  [self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  for (UITouch *touch in touches) {
    CGPoint location = [touch locationInView: self];
    
    NSValue *key = [NSValue valueWithNonretainedObject: touch];
    
    Line *line = _currentLines[key];
    line.end = location;
  }
  
  [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  for (UITouch *touch in touches) {
    CGPoint location = [touch locationInView: self];
    
    NSValue *key = [NSValue valueWithNonretainedObject: touch];
    
    Line *line = _currentLines[key];
    line.end = location;
    
    [_finishedLines addObject: line];
    [_currentLines removeObjectForKey: key];
  }
  
  [self setNeedsDisplay];
}

- (void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  [_currentLines removeAllObjects];
  
  [self setNeedsDisplay];
}

@end
