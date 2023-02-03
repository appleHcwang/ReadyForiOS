//
//  webViewViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/6/8.
//

#import "webViewViewController.h"
@import WebKit;

@interface webViewViewController ()<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic, strong) WKWebView *webView;
@end

@implementation webViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"webViewViewController";
    [self initWKWebView];
    // Do any additional setup after loading the view.
}
///Users/admin/Desktop/Work/客户端/yysClient/yysClient/dist

- (void)initWKWebView {
    //
    //    NSString *pathString = [[[NSBundle mainBundle] pathForResource:@"dist" ofType:@"bundle"] stringByAppendingPathComponent:@"index.html"];
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    
    NSURL *pathString =  [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];
    
    
    
    //为了适配ipad ，ipad UA = Macintosh ，需要修改为 ipad ，否则H5不可用。（project 勾选ipad下）
    configuration.defaultWebpagePreferences.preferredContentMode = WKContentModeMobile ;
    [configuration.preferences setValue:@YES forKey:@"allowFileAccessFromFileURLs"];
    configuration.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone ;
    configuration.allowsInlineMediaPlayback = YES ;
    [configuration setValue:@YES forKey:@"allowUniversalAccessFromFileURLs"];
    
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
    //    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://zzslyy.xfzhyy.com/ch/report/viewreport.aspx?reportId=80818563-309a-c678-135c-08dadb435190"]]];
    //
    [self.webView loadRequest:[NSURLRequest requestWithURL:pathString]];
    
    
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    [self.view addSubview:_webView];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler  {
    
    NSString *aa=  navigationAction.request.URL.absoluteString;
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}


//mishareQrcodeMustHave

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString *fontString = [[NSString alloc] initWithFormat:@"document.getElementById('PrintHeader').style.width='720px'"];
        [webView evaluateJavaScript:fontString completionHandler:^(id _Nullable d, NSError * _Nullable error) {
            
            NSString *fontString1 = [[NSString alloc] initWithFormat:@"document.documentElement.innerHTML"];
            NSString *fontString2 = [[NSString alloc] initWithFormat:@"document.getElementById('mishareQrcodeMustHave').style.width='80px'"];
            NSString *fontString3 = [[NSString alloc] initWithFormat:@"document.getElementById('mishareQrcodeMustHave').style.right='180px'"];
            [webView evaluateJavaScript:fontString1 completionHandler:^(id _Nullable d, NSError * _Nullable error) {
                
                
                
            }];
        }];
        
        NSString *fontString8 = [[NSString alloc] initWithFormat:@"document.getElementById('PrintHeader').style.backgroundColor='red'"];
        [webView evaluateJavaScript:fontString8 completionHandler:^(id _Nullable d, NSError * _Nullable error) {
            
            
        }];
        
        
        
        
    });
    
    
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
