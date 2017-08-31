//
//  FMLHTTPClient.m
//  family10
//
//  Created by 王鑫 on 16/10/27.
//  Copyright © 2016年 王鑫. All rights reserved.
//

#import "HTTPClient.h"

@interface HTTPClient()<NSURLSessionDataDelegate>
{
    NSURLSession* _session;
}

@end

static HTTPClient* httpClient;

@implementation HTTPClient

+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpClient = [[HTTPClient alloc] init];
    });
    return httpClient;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return self;
}

-(void)getWithURL:(NSString*)urlString headers:(NSDictionary*)headers parameters:(NSDictionary*)params completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler
{
    NSString* paramsString = [self translateHttpParams:params];
    NSString* tmpurl = [NSString stringWithFormat:@"%@%@", urlString, paramsString];
    NSURL* url = [NSURL URLWithString:tmpurl];
    NSMutableURLRequest* req = [NSMutableURLRequest requestWithURL:url];
    req.timeoutInterval = 10;
    req.HTTPMethod = @"GET";
    NSMutableDictionary* tmpHeaders = [NSMutableDictionary dictionary];
    [tmpHeaders addEntriesFromDictionary:_defaultHeaders];
    [tmpHeaders addEntriesFromDictionary:headers];
    req.allHTTPHeaderFields = tmpHeaders;
    NSURLSessionDataTask* task = [_session dataTaskWithRequest:req completionHandler:completionHandler];
    [task resume];
}

-(void)postWithURL:(NSString*)urlString headers:(NSDictionary*)headers httpBody:(NSData*)body completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler
{
    NSURL* url = [NSURL URLWithString:urlString];
    NSMutableURLRequest* req = [NSMutableURLRequest requestWithURL:url];
    req.timeoutInterval = 10;
    req.HTTPMethod = @"POST";
    NSMutableDictionary* tmpHeaders = [NSMutableDictionary dictionary];
    [tmpHeaders addEntriesFromDictionary:_defaultHeaders];
    [tmpHeaders addEntriesFromDictionary:headers];
    req.allHTTPHeaderFields = tmpHeaders;
    req.HTTPBody = body;
    NSURLSessionDataTask* task = [_session dataTaskWithRequest:req completionHandler:completionHandler];
    
    [task resume];
}

//证书验证
-(void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
#ifdef DEBUG
        NSString *host = challenge.protectionSpace.host;
        NSLog(@"证书认证\nhost:%@", host);
#endif
        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
        [[challenge sender] useCredential: credential
              forAuthenticationChallenge: challenge];

    }
}

//- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
//
// completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
//    NSLog(@"证书认证");
//    if ([[[challenge protectionSpace] authenticationMethod] isEqualToString: NSURLAuthenticationMethodServerTrust]) {
//        do
//        {
//            SecTrustRef serverTrust = [[challenge protectionSpace] serverTrust];
//            NSCAssert(serverTrust != nil, @"serverTrust is nil");
//            if(nil == serverTrust)
//                break; /* failed */
//            
//            /**
//             *  导入多张CA证书（Certification Authority，支持SSL证书以及自签名的CA）
//             */
//            NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"client" ofType:@"cer"];//自签名证书
//            NSData* caCert = [NSData dataWithContentsOfFile:cerPath];
//            NSCAssert(caCert != nil, @"caCert is nil");
//            if(nil == caCert)
//                break; /* failed */
//            
//            SecCertificateRef caRef = SecCertificateCreateWithData(NULL, (__bridge CFDataRef)caCert);
//            NSCAssert(caRef != nil, @"caRef is nil");
//            if(nil == caRef)
//                break; /* failed */
//            
//            //可以添加多张证书
//            NSArray *caArray = @[(__bridge id)(caRef)];
//            NSCAssert(caArray != nil, @"caArray is nil");
//            if(nil == caArray)
//                break; /* failed */
//            
//            //将读取的证书设置为服务端帧数的根证书
//            OSStatus status = SecTrustSetAnchorCertificates(serverTrust, (__bridge CFArrayRef)caArray);
//            SecTrustSetAnchorCertificatesOnly(serverTrust, NO);
//            NSCAssert(errSecSuccess == status, @"SecTrustSetAnchorCertificates failed");
//            if(!(errSecSuccess == status))
//                break; /* failed */
//            SecTrustResultType result = -1;
//            
//            //通过本地导入的证书来验证服务器的证书是否可信
//            status = SecTrustEvaluate(serverTrust, &result);
//            if(!(errSecSuccess == status))
//                break; /* failed */
//            NSLog(@"stutas:%d",(int)status);
//            NSLog(@"Result: %d", result);
//            BOOL allowConnect = (result == kSecTrustResultUnspecified) || (result == kSecTrustResultProceed);
//            if (allowConnect)
//            {
//                NSLog(@"success");
//            }
//            else
//            {
//                NSLog(@"error");
//            }
//            /* kSecTrustResultUnspecified and kSecTrustResultProceed are success */
//            if(! allowConnect)
//            {
//                break; /* failed */
//            }
//#if 0
//            
//            /* Treat kSecTrustResultConfirm and kSecTrustResultRecoverableTrustFailure as success */
//            /*   since the user will likely tap-through to see the dancing bunnies */
//            if(result == kSecTrustResultDeny || result == kSecTrustResultFatalTrustFailure || result == kSecTrustResultOtherError)
//                break; /* failed to trust cert (good in this case) */
//#endif
//            // The only good exit point
//            NSLog(@"信任该证书");
//            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//            completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
//            return [[challenge sender] useCredential: credential
//                          forAuthenticationChallenge: challenge];
//        }
//        while(0);
//    }
//    // Bad dog
//    NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//    completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge,credential);
//    return [[challenge sender] cancelAuthenticationChallenge: challenge];
//    
//}

-(NSString*)translateHttpParams:(NSDictionary*)params
{
    NSMutableString* result = [NSMutableString new];
    if (!params.count)
    {
        return result;
    }
    NSString* key = params.allKeys[0];
    NSString* value = params[key];
    NSString* tmpKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString* tmpValue = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [result appendFormat:@"?%@=%@", tmpKey, tmpValue];
    for (int i=1; i < params.count; i++)
    {
        key = params.allKeys[i];
        value = params[key];
        tmpKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        tmpValue = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [result appendFormat:@"&%@=%@", tmpKey, tmpValue];
    }
    return result;
}

@end
