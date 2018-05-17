#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TBase.h"
#import "TBinaryProtocol.h"
#import "TCompactProtocol.h"
#import "TMultiplexedProtocol.h"
#import "TProtocol.h"
#import "TProtocolDecorator.h"
#import "TProtocolException.h"
#import "TProtocolFactory.h"
#import "TProtocolUtil.h"
#import "TSocketServer.h"
#import "TApplicationException.h"
#import "TBaseClient.h"
#import "TException.h"
#import "Thrift.h"
#import "TObjective-C.h"
#import "TProcessor.h"
#import "TProcessorFactory.h"
#import "TAsyncTransport.h"
#import "TFramedTransport.h"
#import "THTTPClient.h"
#import "TMemoryBuffer.h"
#import "TNSFileHandleTransport.h"
#import "TNSStreamTransport.h"
#import "TSocketClient.h"
#import "TSSLSocketClient.h"
#import "TSSLSocketException.h"
#import "TTransport.h"
#import "TTransportException.h"
#import "TSharedProcessorFactory.h"

FOUNDATION_EXPORT double thriftVersionNumber;
FOUNDATION_EXPORT const unsigned char thriftVersionString[];

