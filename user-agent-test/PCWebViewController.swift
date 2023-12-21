

import UIKit
import WebKit

class PCWebViewController: UIViewController, WKUIDelegate {
    static let controllerIdentifier = String(describing: PCWebViewController.self)

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var navigationBarTitle: UINavigationItem!
    
    var urlRequest: URLRequest!
    var viewTitle: String! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36"

        webView.uiDelegate = self
        webView.scrollView.isScrollEnabled = true
        webView.contentMode = .center
        
        webView.load(urlRequest)

        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationBarTitle.title = viewTitle
    }
    
    
    init() {
        super.init(nibName: PCWebViewController.controllerIdentifier, bundle: Bundle(for: PCWebViewController.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .coverVertical
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func onCloseButtonPressed(_ sender: UIBarButtonItem) {
        print("dismissing")
        self.dismiss(animated: true)
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        self.dismiss(animated: true)
    }

}
