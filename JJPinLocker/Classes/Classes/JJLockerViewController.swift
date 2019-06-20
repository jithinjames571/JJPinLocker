//
//  JJLockerViewController.swift
//  JJPinLocker
//
//  Created by jithin.a.james on 17/06/19.
//

import UIKit

public class JJLockerViewController: UIViewController {
    public var oncomplete : ((_ success:String) -> Void)?
    public var message : String?
    public var header : String?
    public var bgColor : UIColor?
    public var pinNum : Int?

    @IBOutlet var textStackView : UIStackView!
    @IBOutlet var headerLabel : UILabel!
    @IBOutlet var messageLabel : UILabel!
    override public func viewDidLoad() {
        super.viewDidLoad()
        
//        let imageView = UIImageView()
//        imageView.backgroundColor = UIColor.clear
//        imageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
//        imageView.image = UIImage(named: "buttonFollowCheckGreen")
//

        headerLabel.text = header!
        messageLabel.text = message!
        
        
        for index in 1...pinNum! {
            let textLabel = UITextField()
            textLabel.backgroundColor = UIColor.clear
            textLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
           // textLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
            textLabel.text  = ""
            textLabel.font = UIFont.systemFont(ofSize: 40)
            textLabel.textAlignment = .center
            textLabel.tag = index
            textLabel.keyboardType = .numberPad
            textLabel.delegate = self
            addLineToView(view: textLabel, position: .LINE_POSITION_BOTTOM, color: UIColor.black , width: 0.5)
            textStackView.addArrangedSubview(textLabel)
        }
        
        //textStackView.distribution  = UIStackViewDistribution.equalSpacing
        textStackView.alignment = UIStackViewAlignment.center
        textStackView.spacing   = 20.0
        
        //textStackView.translatesAutoresizingMaskIntoConstraints = false
        

        // Do any additional setup after loading the view.
    }
    
    public func lol(){
        
        print("sdasdasdasdasdadadasdasd")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    enum LINE_POSITION {
        case LINE_POSITION_TOP
        case LINE_POSITION_BOTTOM
    }
    
    func addLineToView(view : UIView, position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        view.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .LINE_POSITION_TOP:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        default:
            break
        }
    }
    
    

    
}

extension JJLockerViewController : UITextFieldDelegate{
   public func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if (textStackView.arrangedSubviews.last)?.tag == textField.tag{
        }
    }
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.isEmpty == true {
            return true
        }
        
        if string == ""{
                textField.text = ""
                if textStackView.arrangedSubviews[0].tag == textField.tag{ return false  }
                let field = textStackView.arrangedSubviews[textField.tag - 2 ] as! UITextField
                field.becomeFirstResponder()
                return false
        }else{
            if (textStackView.arrangedSubviews.last)?.tag == textField.tag{
                return false
            }

                
            let field = textStackView.arrangedSubviews[textField.tag] as! UITextField
            field.text = string
            field.becomeFirstResponder()
            if (textStackView.arrangedSubviews.last)?.tag == field.tag{
                oncomplete!(combineAllText())
            }
            
            return false;
        }
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    
    func combineAllText() -> String{
        var combinedString = ""
        for item in textStackView.subviews{
           let itemText = item as! UITextField
            combinedString = combinedString + itemText.text!
        }
        return combinedString
        
    }
    
    func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
