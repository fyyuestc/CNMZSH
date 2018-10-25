//
//  ViewController.swift
//  CNM
//
//  Created by student on 2018/10/25.
//  Copyright © 2018年 ZSH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var labeldate: UILabel!
    @IBOutlet weak var labelstart: UILabel!
    @IBOutlet weak var labelarrive: UILabel!
    @IBOutlet weak var labeltype: UILabel!
    @IBOutlet weak var textdate: UITextField!
    @IBOutlet weak var textstart: UITextField!
    @IBOutlet weak var textarrive: UITextField!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let alertone = UIAlertController(title: "购票信息", message: BookInfo.text,preferredStyle:.alert)
        let actionconfire = UIAlertAction(title: "确定", style: .destructive, handler: {(x)->() in self.OnceBookInfo.text = self.OnceBookInfo.text! + self.BookInfo.text!})
        let actioncancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertone.addAction(actionconfire)
        alertone.addAction(actioncancel)
        present(alertone, animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textdate.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        BookInfo.text =  textdate.text! + " 从" + textstart.text! + " 去\(textarrive.text!) 的"
    
    }
   
    @IBAction func segementAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            OnceBookInfo.isHidden = true
            BookInfo.isHidden = false
        }else{
            OnceBookInfo.isHidden = false
            BookInfo.isHidden = true
        }
        
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn{
            BookInfo.text =  BookInfo.text! + "国内机票\n"
        }
        else{
            BookInfo.text = BookInfo.text! + "国外机票\n"
        }
    }
    @IBOutlet weak var BookInfo: UILabel!
    @IBOutlet weak var OnceBookInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         textdate.delegate = self
         textstart.delegate = self
         textarrive.delegate = self
         textdate.placeholder="请输入出发日期"
         textstart.placeholder = "请输入出发城市"
         textarrive.placeholder = "请输入到达城市"
         textdate.clearsOnBeginEditing = true
         textstart.clearsOnBeginEditing = true
         textarrive.clearsOnBeginEditing = true
        OnceBookInfo.isHidden = true
        OnceBookInfo.backgroundColor = UIColor.white
        BookInfo.backgroundColor = UIColor.white
    }
    
}
