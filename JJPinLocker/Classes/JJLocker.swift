

//private var once = dispatch_once_t()
//
//class MyObject {
//    init () {
//        dispatch_once(&once) {
//            // Do stuff
//        }
//    }
//}

import Foundation
import UIKit
public class JJLocker {
    // no need (!). It will be initialised from controller
    public typealias CompletionHandler = (_ success:String) -> Void
    var oncomplete : CompletionHandler?
    //  public  init(withViewController string: UIViewController) {
    //       self.someProperty = string
    //
    //        super.init()
    ////    let frameworkBundle = Bundle(for: JJLocker.self)
    ////    let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("XDCoreLib.bundle")
    ////    let resourceBundle = Bundle(url: bundleURL!)
    ////
    ////
    //
    //
    //    }
    
    
    
    //  public  convenience override init() {
    //        self.init() // calls above mentioned controller with default name
    //
    //    }
    
    
    public  func present(with bgColor:UIColor,header :String, messgage:String, pinNumbers:Int,   handler:@escaping CompletionHandler){
        self.oncomplete = handler
        guard let root = UIApplication.shared.keyWindow?.rootViewController else{
            return
        }
        
        let viewController = UIStoryboard(name: "JJLocker", bundle:  Bundle(for: type(of: self))).instantiateViewController(withIdentifier: "JJLocker") as! JJLockerViewController
        viewController.bgColor = bgColor
        viewController.message = messgage
        viewController.header = header
        viewController.pinNum = pinNumbers
        viewController.oncomplete = { Result in
            print(Result)
            self.oncomplete!(Result)
        }
        
        
        root.present(viewController, animated: true, completion: nil)
    }
    
    
    public func dismiss(){
        
    
    }
    
    public static let shared = JJLocker()
    
    //Initializer access level change now
    private init(){
    }
    
    
}
