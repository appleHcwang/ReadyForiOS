//
//  webViewViewController.m
//  readyforios
//
//  Created by hcwang3 on 2022/6/8.
//

#import "webViewViewController.h"
@import WebKit;

@interface webViewViewController ()<WKNavigationDelegate>

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

- (void)initWKWebView {
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://139.210.1.83:9006/htweb/ShowInpatientInfo.jsp?ipid=6923_1"]]];
    
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
        
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler  {

    NSString *aa=  navigationAction.request.URL.absoluteString;
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
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
