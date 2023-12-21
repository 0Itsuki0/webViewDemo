//
//  ViewController.swift
//  user-agent-test
//
//  Created by Itsuki on 2023/12/19.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36"
        
        webView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        webView.uiDelegate = self
        webView.navigationDelegate = self

    }
    
    // color injection
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        print("navigation finished")
//        let css = """
//        body {
//          background-color: red !important;
//        }
//        """
//        let cssString = css.components(separatedBy: .newlines).joined()
//
//        let script = """
//                        var element = document.createElement('style');
//                           element.innerHTML = '\(cssString)';
//                           document.head.appendChild(element);
//                     """
//        webView.evaluateJavaScript(script, completionHandler: nil)
//    }
    
    // open pop up in same view
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        if navigationAction.targetFrame?.isMainFrame != true {
//            webView.load(navigationAction.request)
//        }
//
//        return nil
//    }
    
    // open in new view
//    func webView(_ webView: WKWebView,
//                 createWebViewWith configuration: WKWebViewConfiguration,
//                 for navigationAction: WKNavigationAction,
//                 windowFeatures: WKWindowFeatures) -> WKWebView? {
//
//        if navigationAction.targetFrame?.isMainFrame != true {
//            let newWebView = WKWebView(frame: webView.frame,
//                                       configuration: configuration)
//            newWebView.load(navigationAction.request)
//            newWebView.uiDelegate = self
//            webView.superview?.addSubview(newWebView)
//            return newWebView
//        }
//
//        return nil
//    }
//    
//    func webViewDidClose(_ webView: WKWebView) {
//        webView.removeFromSuperview()
//    }
    
    
    // new view Controller
    func webView(_ webView: WKWebView,
                 createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction,
                 windowFeatures: WKWindowFeatures) -> WKWebView? {

        if navigationAction.targetFrame?.isMainFrame != true {
            let webController = PCWebViewController()
            webController.urlRequest = navigationAction.request
            webController.viewTitle = "A Demo"
            
            self.present(webController, animated: true)
            return nil

        }

        return nil
    }
    
    // javascript injection for pop up
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        let script = """
//                        var elements = document.getElementsByTagName("*")
//                        for (var i = 0; i < elements.length; i++) {
//                          if (elements[i].target == '_blank') {
//                            elements[i].target = '_self'
//                          }
//                        }
//                     """
//        webView.evaluateJavaScript(script, completionHandler: nil)
//    }
    
    // cancel navigation
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        if let host = navigationAction.request.url?.host() {
//            print(host)
//            if host != "www.google.com" {
//                decisionHandler(.cancel)
//                UIApplication.shared.open(navigationAction.request.url!, options: [:], completionHandler: nil)
//            } else{
//                decisionHandler(.allow)
//            }
//        }
//        else {
//            decisionHandler(.allow)
//        }
//    }
    
    
    
}

