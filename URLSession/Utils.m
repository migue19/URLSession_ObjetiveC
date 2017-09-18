//
//  Utils.m
//  BBVA Net Cash
//
//  Created by Miguel Mexicano on 15/09/17.
//  Copyright © 2017 Sergio Rodriguez. All rights reserved.
//

#import "Utils.h"

@implementation Utils


-(void) showAlert:(UIViewController *)context withTitle:(NSString *)title Message:(NSString *)message{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle: title
                                 message: message
                                 preferredStyle:UIAlertControllerStyleAlert];
    //Add Buttons
    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"Aceptar"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
  
    [alert addAction:okButton];
    
    [context presentViewController:alert animated:YES completion:nil];
}


@end
