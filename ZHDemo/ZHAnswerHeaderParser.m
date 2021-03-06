//
//  ZHAnswerHeaderParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerHeaderParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHAnswerHeaderObject.h"

@interface ZHAnswerHeaderParser ()

@end

@implementation ZHAnswerHeaderParser

- (id)parser
{
  NSData *data = [ZHLoadJSONFile AnswerHeaderData];
  NSDictionary *dictonary = [data objectFromJSONData];
  
	NSString *title = [dictonary objectForKey:@"title"];
  
  NSString *description = [dictonary objectForKey:@"description"];
  
  NSString *follower_count = [NSString stringWithFormat:@"%d",
                              [[dictonary objectForKey:@"follower_count"] integerValue]];
  
  NSString *comment_count = [NSString stringWithFormat:@"%d",
                             [[dictonary objectForKey:@"comment_count"] integerValue]];
  
  NSDictionary *creator = [dictonary objectForKey:@"creator"];
  NSString *name = [creator objectForKey:@"name"];
  
  NSString *avatar_url = [creator objectForKey:@"avatar_url"];
  
  NSMutableDictionary *answerHeaderDictinary = [NSMutableDictionary dictionary];
  if (title) {
    [answerHeaderDictinary setObject:title forKey:@"title"];
  }
  if (description) {
    [answerHeaderDictinary setObject:description forKey:@"description"];
  }
  if (follower_count) {
    [answerHeaderDictinary setObject:follower_count forKey:@"follower_count"];
  }
  if (comment_count) {
    [answerHeaderDictinary setObject:comment_count forKey:@"comment_count"];
  }
//  if (creator) {
//    [answerHeaderDictinary setObject:creator forKey:@"creator"];
//  }
  if (name) {
    [answerHeaderDictinary setObject:name forKey:@"name"];
  }
  if (avatar_url) {
    [answerHeaderDictinary setObject:avatar_url forKey:@"avatar_url"];
  }
  
  ZHAnswerHeaderObject *object = [ZHAnswerHeaderObject objectWithData:answerHeaderDictinary];
  
  ZHModel *model = [[ZHModel alloc] init];
  
  model.object = object;
  
  return model;
}

@end
