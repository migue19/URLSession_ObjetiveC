//
//  UserResponse.h
//  URLSession
//
//  Created by Miguel Mexicano on 18/09/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserResponse : NSObject
  @property (nonatomic, retain)  NSString *usuario;
  @property (nonatomic, retain)  NSString *password;
  @property (nonatomic, assign)  Boolean isValid;


-(id)initWithUser:(NSString *)user Password:(NSString *)password isValid:(Boolean)isValid;

@end
