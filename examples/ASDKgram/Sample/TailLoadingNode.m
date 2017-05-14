//
//  TailLoadingNode.m
//  Sample
//
//  Created by Adlai Holler on 1/3/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "TailLoadingNode.h"

#import <ASDKFluentExtensions/ASDKFluentExtensions.h>

// A different way to write layout code: using the fluent API provided by ASDKFluentExtensions
#define FLUENT_LAYOUT 1

@interface TailLoadingNode ()
@property (nonatomic, strong) ASDisplayNode *activityIndicatorNode;
@end

@implementation TailLoadingNode

- (instancetype)init
{
  if (self = [super init]) {
    _activityIndicatorNode = [[ASDisplayNode alloc] initWithViewBlock:^{
      UIActivityIndicatorView *v = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
      [v startAnimating];
      return v;
    }];
    self.style.height = ASDimensionMake(100);
  }
  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
  if (FLUENT_LAYOUT) {
    return [self fluentLayoutSpecThatFits:constrainedSize];
  } else {
    return [self classicLayoutSpecThatFits:constrainedSize];
  }
}

- (ASLayoutSpec *)classicLayoutSpecThatFits:(ASSizeRange)constrainedSize
{
  return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY child:self.activityIndicatorNode];
}

- (ASLayoutSpec *)fluentLayoutSpecThatFits:(ASSizeRange)constrainedSize
{
  return [self.activityIndicatorNode centerWithCenteringOptions:ASCenterLayoutSpecCenteringXY
                                                  sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY];
}

@end
