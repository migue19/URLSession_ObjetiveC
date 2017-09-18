//
//  ViewController.m
//  URLSession
//
//  Created by Miguel Mexicano Herrera on 05/09/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)enviarAction:(id)sender {
    //int *numero = 0;
    [self serviceRESTPOST];
    
    
   
    
    
   
    
}



-(void)mostarContenidoTextField{
     NSString *message = @"el campo es Obligatorio";
     NSString *title = @"Error";
     
     if(![self.txtCaja.text  isEqual: @""]){
     message = self.txtCaja.text;
     title = @"Success";
     }

     UIAlertController * alert = [UIAlertController
     alertControllerWithTitle: title
     message: message
     preferredStyle:UIAlertControllerStyleAlert];
     
     //Add Buttons
     UIAlertAction* yesButton = [UIAlertAction
     actionWithTitle:@"Ok"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * action) {
     //Handle your yes please button action here
     }];
     
     /*UIAlertAction* noButton = [UIAlertAction
     actionWithTitle:@"Cancel"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * action) {
     //Handle no, thanks button
     }];*/
     
     //Add your buttons to alert controller
     
     [alert addAction:yesButton];
     //[alert addAction:noButton];
     
     [self presentViewController:alert animated:YES completion:nil];
    
}


-(void)serviceRESTPOST{
    NSError *error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:@"http://54.86.42.99:4000/login"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSDictionary *mapData = [[NSDictionary alloc] initWithObjectsAndKeys: @"user", @"17f2eed7d0994382d471aeb442682e59",
                             @"password", @"0192023a7bbd73250516f069df18b500",
                             @"versionTerminosCondiciones", @"v1.0",
                             @"versionAvisoPrivacidad", @"v1.0",nil];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"%@",data);
        
        NSString *someString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",someString);
        
        NSLog(@"%@",response);
        
    }];
    
    [postDataTask resume];
    
    
}



-(void)serviceRESTJSONGET{
    
    NSString *dataUrl = @"http://192.168.10.126:8080/RestJR/services/JavaRevolution/validaUsuario";
    NSURL *url = [NSURL URLWithString:dataUrl];

    
    // 2
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              
                                              
                                              
                                              if(error != nil){
                                                  NSLog(@"%@", error);
                                              }
     
                                              NSLog(@"%@", response);
                                              NSString *someString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                              
                                              
                                              NSLog(@"el data es: %@", someString);
                                              // 4: Handle response here
                                          }];
    
    // 3
    [downloadTask resume];

}





-(void)serviceRESTSimple{
    NSLog(@"Esto es una prueba");
    //NSError *error;
    
    NSString *dataUrl = @"http://nut.com.mx/pruebas/pruebaRest.php";
    NSURL *url = [NSURL URLWithString:dataUrl];
    
    // 2
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              
                                              if(error != nil){
                                                  NSLog(@"%@", error);
                                              }
                                              
                                              
                                              
                                              
                                              NSLog(@"%@", response);
                                              NSString *someString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                              
                                              
                                              NSLog(@"el data es: %@", someString);
                                              // 4: Handle response here
                                          }];
    
    // 3
    [downloadTask resume];
    
    /*NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    
    NSURL *url = [NSURL URLWithString:@"[JSON SERVER"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSDictionary *mapData = [[NSDictionary alloc] initWithObjectsAndKeys: @"TEST IOS", @"name",
                             @"IOS TYPE", @"typemap",
                             nil];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
    }];
    
    [postDataTask resume];*/
    
    
}

@end
