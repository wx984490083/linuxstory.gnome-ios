//
//  FMLHTTPClient.h
//  family10
//
//  Created by 王鑫 on 16/10/27.
//  Copyright © 2016年 王鑫. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol HTTPClientDelegate <NSObject>

@required
-(void)requestDidFinishedWithData:(NSData*)data URLResponse:(NSURLResponse*)respose error:(NSError*)error;

@end


@interface HTTPClient : NSObject

@property(nonatomic, strong) NSDictionary* defaultHeaders;
@property(nonatomic, strong) id<HTTPClientDelegate> delegate;

+(instancetype)sharedInstance;

-(void)getWithURL:(NSString*)urlString headers:(NSDictionary*)headers parameters:(NSDictionary*)params completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

-(void)postWithURL:(NSString*)urlString headers:(NSDictionary*)headers httpBody:(NSData*)body completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

@end
