//
//  ViewController.h
//  URLSession
//
//  Created by Miguel Mexicano Herrera on 05/09/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLSessionDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtCaja;

- (IBAction)enviarAction:(id)sender;
//- (void)serviceREST: (int) a secondNumber: (int) b;
//-(void)serviceREST;
@end

