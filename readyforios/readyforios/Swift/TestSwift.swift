//
//  TestSwift.swift
//  readyforios
//
//  Created by hcwang3 on 2022/3/18.
//

import UIKit

@objcMembers
class TestSwift: NSObject {
    
    var nameNow: String?
      
      //计算属性
      var now: String? {
          set(wakadika) {
            
              self.nameNow = wakadika! + "door"
              
          }
          
          get {
              return self.nameNow
          }
          
      }

}
