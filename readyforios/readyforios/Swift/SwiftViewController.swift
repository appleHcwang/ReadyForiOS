//
//  SwiftViewController.swift
//  readyforios
//
//  Created by hcwang3 on 2022/4/13.
//

import UIKit

class SwiftViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "swift"
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
//       optionalType(a: "123", b: "456")
       letAndVarDifference(a: "aa", b: "bb")
    }
    
    
  @objc class func optionalType(a:String, b:String) -> String {
        /**
         **可选类型
         */
      var name: String!
      return name ?? ""
    }
    func letAndVarDifference(a:String, b:String)->Void {
        /*
         let代表不可变对象，即对象首地址不能发生变更，也就是说内存地址不能改变，但也可以修饰可变对象。
         var代表可变对象，即内存地址可以发生改变，可以修饰指针重新指向的变量
         */
        let abc: String = "sb"
        print(a,b)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
