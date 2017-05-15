//
//  FeedHeaderNode.m
//  Sample
//
//  Created by Adlai Holler on 1/23/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "FeedHeaderNode.h"
#import "Utilities.h"

#import <ASDKFluentExtensions/ASDKFluentExtensions.h>
#import "FluentLayoutFeatureDisabling.h"

static UIEdgeInsets kFeedHeaderInset = { .top = 20, .bottom = 20, .left = 10, .right = 10 };

@interface FeedHeaderNode ()
@property (nonatomic, strong, readonly) ASTextNode *textNode;
@end

@implementation FeedHeaderNode

- (instancetype)init
{
  if (self = [super init]) {
    _textNode = [[ASTextNode alloc] init];
    self.automaticallyManagesSubnodes = YES;
    _textNode.attributedText = [NSAttributedString attributedStringWithString:@"Latest Posts" fontSize:18 color:[UIColor darkGrayColor] firstWordColor:nil];
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
  return [ASInsetLayoutSpec insetLayoutSpecWithInsets:kFeedHeaderInset child:_textNode];
}

- (ASLayoutSpec *)fluentLayoutSpecThatFits:(ASSizeRange)constrainedSize
{
  return [_textNode withInset:kFeedHeaderInset];
}

@end
