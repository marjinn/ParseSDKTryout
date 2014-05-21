//
//  main.m
//  RoadMapiOS_Apple's_iOS_Tutorial
//
//  Created by mar Jinn on 1/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CQAppDelegate.h"
#import <Parse/Parse.h>
#import <objc/runtime.h>

@interface TrialClass:NSObject

@property NSString* firstOne;
@property NSString* secondOne;

@end

@implementation TrialClass



@end


int main(int argc, char * argv[])
{
    /**
     *  Morphine
     */
    [Parse setApplicationId:@"GJdr7dNKHnFSM10gbGPRFRvScx9fQkOrioSDqHFP"
                  clientKey:@"3Gj1cgMKZJekFUFZcOAqRPCPyJEpPhKIQTe5EoSN"];
    
    
    TrialClass* trialClass;
    trialClass = [TrialClass new];
    
    [trialClass setFirstOne:@"firstOne"];
    [trialClass setSecondOne:@"secondOnne"];
    

    NSMutableDictionary* allClassProps;
    allClassProps = [NSMutableDictionary dictionary];
    
    Class className;
    className = objc_getClass("TrialClass");
    
    unsigned int count,i = 0;
    
    objc_property_t* properties = NULL;
    properties = class_copyPropertyList(className, &count);
    
    for (i = 0; i < count; i++)
    {
        objc_property_t property = 0;
        property = (objc_property_t)*(properties+i); //pointer array
        
        const char* propertyName = NULL;
        propertyName = property_getName(property);
        
        const char* propertyAttribute = NULL;
        propertyAttribute = property_getAttributes(property);
        
        NSString* propName;
        propName = [NSString stringWithUTF8String:propertyName];
        
        NSString* propAttrib;
        propAttrib = [NSString stringWithUTF8String:propertyAttribute];
        
        fprintf(stdout, "%s %s\n",propertyName,propertyAttribute);
        NSLog(@"%@ %@\n",propName,propAttrib);
        
        id propertyVal;
        propertyVal = [trialClass valueForKey:propName];
        
        NSLog(@"%@",propertyVal);
        
        [allClassProps setObject:propertyVal forKey:propName];
        
        
    }
    
    NSLog(@"%@",allClassProps);
    
    PFObject* testObj;
    testObj = [PFObject objectWithClassName:@"TrialClass"
                                 dictionary:(NSDictionary *)allClassProps];
    
    NSError *__autoreleasing error = nil;
    
    BOOL uploadS;
    uploadS = [testObj save:&error];
    
    
    
    NSLog(@"%@", uploadS ? @"YES" : error );
    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([CQAppDelegate class]));
    }
}
