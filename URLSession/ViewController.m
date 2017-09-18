//
//  ViewController.m
//  URLSession
//
//  Created by Miguel Mexicano Herrera on 05/09/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"

@interface ViewController (){
    Utils *utils;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    utils = [[Utils alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)enviarAction:(id)sender {
    /*NSDictionary *mapData = @{@"user":@"17f2eed7d0994382d471aeb442682e59",
                              @"password": @"0192023a7bbd73250516f069df18b500",
                              @"versionTerminosCondiciones": @"v1.0",
                              @"versionAvisoPrivacidad":@"v1.0"};*/
    
    if([self.userTxt.text isEqualToString:@""] || [self.passwordTxt.text isEqualToString:@""]){
        [utils showAlert:self withTitle:@"Error" Message:@"Los campos son Obligatorios"];
        return;
    }
    
    
    NSDictionary *param = @{@"usuario": self.userTxt.text,
                            @"password": self.passwordTxt.text
                            };
    
    
    //[self serviceRESTPOST:@"http://54.86.42.99:4000/login" Parametros:mapData];
    [self serviceRESTPOST:@"http://localhost:8080/RestJR/services/JavaRevolution/validaUsuario" Parametros:param];
}



/*-(void)mostarContenidoTextField{
     NSString *message = @"el campo es Obligatorio";
     NSString *title = @"Error";
     
     if(![self.userTxt.text  isEqual: @""]){
     message = self.userTxt.text;
     title = @"Success";
     }

     UIAlertController * alert = [UIAlertController
     alertControllerWithTitle: title
     message: message
     preferredStyle:UIAlertControllerStyleAlert];
    
     UIAlertAction* yesButton = [UIAlertAction
     actionWithTitle:@"Ok"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * action) {
     }];
    
     [alert addAction:yesButton];
     
     [self presentViewController:alert animated:YES completion:nil];
    
}*/


-(void)serviceRESTPOST: (NSString*)url Parametros:(NSDictionary*)params{
    NSError *error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
 
    NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    
    [request setHTTPBody:postData];
    
    NSString *body = [[NSString alloc] initWithData:[request HTTPBody] encoding: NSUTF8StringEncoding];
    
    NSLog(@"El body es: %@",body);
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"%@",data);
        
        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (jsonData != nil && error == nil) {
            NSDictionary *responseDict = jsonData;
            
           UserResponse *user = [self createUserObject:responseDict];
            NSLog(@"%@",[user usuario]);
            NSLog(@"%@",[user password]);
            NSLog([user isValid] ? @"Yes" : @"No");
            
            NSString *message = [[NSString alloc] initWithFormat:@"\nUsuario: %@ \n Password: %@ \n Es Usuario Valido: %@",[user usuario],[user password], [user isValid] ? @"SI" : @"NO"];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                // ui update code here
                [utils showAlert:self withTitle:@"Respuesta del Servidor" Message:message];
            
                
                [self.userTxt setText:[user password]];
            });
            
            //NSLog(@"este es el diccionario: %@",responseDict);
        }
    }];
    
    [postDataTask resume];
}



-(UserResponse*)createUserObject:(NSDictionary*)response{
    NSString *user = [response objectForKey:@"usuario"];
    NSString *password = [response objectForKey:@"password"];
    Boolean isValid = [[response objectForKey:@"userValido"] boolValue];
    
    UserResponse *userResponse = [[UserResponse alloc] initWithUser:user Password:password isValid:isValid];
    
    return userResponse;
}




-(void)serviceRESTJSONGET{
    NSString *dataUrl = @"http://192.168.10.126:8080/RestJR/services/JavaRevolution/validaUsuario";
    NSURL *url = [NSURL URLWithString:dataUrl];
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
    [downloadTask resume];

}







@end
