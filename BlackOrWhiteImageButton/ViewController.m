//
//  ViewController.m
//  BlackOrWhiteImageButton
//
//  Created by qq on 2018/11/8.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Camera.h"
#import <Photos/Photos.h>
#import "UIButton+BlackWhiteImage.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ivPhotoPreview;
@property (weak, nonatomic) IBOutlet UIButton *btChoosePhoto;
@property (weak, nonatomic) IBOutlet UIButton *btBack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btChoosePhotoClicked:(id)sender {
    [self photoAlbum:self];
}

// MARK: - ImagePicker 委托协议
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    
    UIImage* image = info[@"UIImagePickerControllerOriginalImage"];
    
    if(image){
        self.ivPhotoPreview.image = image;
        
        BlackWhiteOption* option = [BlackWhiteOption new];
        option.changeTextColor = YES;
        option.changeBackgroundImage = YES;
        [self.btBack setBlackWhiteImageWithImage:[UIImage imageNamed:@"返回"] backgroundView:self.ivPhotoPreview option:option];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
