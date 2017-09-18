//
//  UserResponse.m
//  URLSession
//
//  Created by Miguel Mexicano on 18/09/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

#import "UserResponse.h"

@implementation UserResponse


-(id)initWithUser:(NSString *)user Password:(NSString *)password isValid:(Boolean)isValid
{
    if(self = [super init])
    {
        [self setUsuario:user];
        [self setPassword:password];
        [self setIsValid:isValid];
    }
    return self;
}


@end
