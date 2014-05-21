//
//  MacroCollection.h
//  RoadMapiOS_Apple's_iOS_Tutorial
//
//  Created by mar Jinn on 1/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#ifndef RoadMapiOS_Apple_s_iOS_Tutorial_MacroCollection_h
#define RoadMapiOS_Apple_s_iOS_Tutorial_MacroCollection_h

/*
 * Get the name of the method/function being executed 
 */
#define EXECUTING_THIS_FUNC(void)  \
do{ \
fprintf(stdout,"Executing '%s\n' at file '%s\n',line %d\n", \
__PRETTY_FUNCTION__,__FILE__,__LINE__); \
break; \
} while (0)


/*
 * Get the retain count of any object
 */
#define GET_RETAIN_COUNT(obj) CFGetRetainCount((__bridge CFTypeRef)obj)


//#define GET_RETAIN_COUNT(obj) \
//if(obj){ \
//fprintf(stdout,"obj - retainCount:%ld\n",(long)CFGetRetainCount((__bridge CFTypeRef)obj)); \
//}


#endif
