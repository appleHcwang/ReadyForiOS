//
//  IFLYCollTypeSelectView.swift
//  Medicare
//
//  Created by hcwang3 on 2022/6/1.
//  Copyright © 2022 medicare. All rights reserved.
//

import UIKit
import SnapKit
//import RxSwift
//import KakaJSON


@objcMembers
class IFLYCollTypeSelectView: UIView,  UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    static var cellIdent:String? = "IFLYPatCollLabelCell"
    var bjView:UIView?
    var showView:UIView?
    var tipLb:UILabel?
    lazy  var selecTableV:UITableView = {
        let  tableV = UITableView.init(frame: CGRect.init(x:0 , y: 0, width: 0, height: 0), style: UITableView.Style.plain)
//        tableV.delegate = self
//        tableV.dataSource = self
        tableV.register(UINib.init(nibName: IFLYCollTypeSelectView.cellIdent!, bundle: Bundle.main), forCellReuseIdentifier: IFLYCollTypeSelectView.cellIdent!)
        return tableV
        
    }()
    
    lazy var selectCollV:UICollectionView = {
        //设置布局
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        
        
        let  colV = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        colV.backgroundColor = UIColor.white
        colV.delegate = self
        colV.dataSource = self
    
        colV.register(IFLYPatCollLbCell.self, forCellWithReuseIdentifier: IFLYCollTypeSelectView.cellIdent!)
        return colV
        
    }()
    
    var dataArr:Array<Any>? {
        willSet {
            
        }
        didSet {
            if (dataArr?.count ?? 0) > 0 {
                showView?.addSubview(selectCollV)
                selectCollV.snp.makeConstraints({ make in
                    make.top.equalTo(tipLb!.snp_bottom).offset(0)
                    make.left.right.equalTo(showView!).offset(0)
                    make.bottom.equalTo(showView!.snp_bottom).offset(-88)
                })
                selectCollV.reloadData()
            } else {
                showView?.snp.updateConstraints({ make in
                    make.height.equalTo(258)
                })
                
                tipLb?.numberOfLines = 2
       
                tipLb?.text = "您可以去设置收藏标签管理患者，或直接在收藏中查看"
                tipLb?.snp.makeConstraints({ make in
                    make.top.equalToSuperview().offset(110)
                    make.centerX.equalTo(showView!.snp.centerX)
                   
                })
                
                creatBottomUI()
                
            }
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupSubViews()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        bjView = UIView.init(frame: self.bounds)
        bjView?.backgroundColor = UIColor.red
        self.addSubview(bjView!)
        bjView?.snp.makeConstraints({ make in
            make.edges.equalTo(self)
        })
        
        showView = UIView.init()
        showView?.backgroundColor = UIColor.white
        showView?.layer.masksToBounds = true
        showView?.layer.cornerRadius = 6
        self.addSubview(showView!)
        
        showView?.snp.makeConstraints({ make in
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.center.equalTo(self.center)
            make.height.equalTo(360)
        })
        
        let titleV:UIView? = UIView.init()
        titleV?.backgroundColor = UIColor.yellow
        showView?.addSubview(titleV!)
        
        titleV?.snp.makeConstraints({ make in
            make.height.equalTo(50)
            make.top.equalToSuperview()
            make.left.equalTo(showView!).offset(90)
            make.right.equalTo(showView!).offset(-90)
        })
        
        let leftImV:UIImageView = UIImageView.init()
        leftImV.backgroundColor = UIColor.red
        titleV?.addSubview(leftImV)
        
        leftImV.snp.makeConstraints({ make in
            make.height.width.equalTo(50)
            //            make.left.equalTo(self).offset(15)
            make.left.equalTo(titleV!).offset(0)
            make.centerY.equalTo(titleV!)
        })
        
        
        let titleLb:UILabel? = UILabel.init()
        titleLb?.text = "收藏成功"
        titleV?.addSubview(titleLb!)
        
        titleLb?.snp.makeConstraints({ make in
            make.height.equalTo(50)
            //            make.left.equalTo(self).offset(15)
            make.right.equalTo(titleV!).offset(0)
            make.centerY.equalTo(titleV!)
        })
        
        tipLb = UILabel.init()
        tipLb?.text = "请为该患者选择一个标签:"
        tipLb?.font = UIFont.systemFont(ofSize: 14)
        tipLb?.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        showView?.addSubview(tipLb!)
        tipLb?.snp.makeConstraints({ make in
            make.top.equalTo(titleV!.snp_bottom).offset(20)
//            make.centerX.equalTo(showView!.snp.centerX)
            make.left.equalTo(showView!).offset(16)
            
        })
        
        let qdBtn: UIButton  = UIButton.init(type: UIButton.ButtonType.custom)
        qdBtn.setTitle("确定", for: UIControl.State.normal)
        qdBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        qdBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        qdBtn.addTarget(self, action: #selector(qdClick), for: UIControl.Event.touchUpInside)
        qdBtn.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.6, alpha: 1)
        qdBtn.layer.masksToBounds = true
        qdBtn.layer.cornerRadius = 24
        
        showView?.addSubview(qdBtn)
        qdBtn.snp.makeConstraints { make in
            make.bottom.equalTo(showView!.snp.bottom).offset(-20)
            make.left.equalTo(showView!).offset(16)
            make.right.equalTo(showView!).offset(-16)
            make.height.equalTo(50)

        }
        
        
//        self.dataArr = ["ss"]
//        for item in 1...100 {
//            let str = String(item)
//            self.dataArr?.append(str )
//        }
        
    }
    
    // MARK: -- 底部按钮
    func creatBottomUI() {
        /**  */
        let bottomV:UIView = UIView.init()
        showView?.addSubview(bottomV)
        
        bottomV.backgroundColor = UIColor.yellow
        bottomV.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalTo(showView!)
            make.left.right.equalTo(showView!)
        }
        
 
        let LeftSetBtn:UIButton? = UIButton.init(type: UIButton.ButtonType.custom)
        
        LeftSetBtn?.setTitle("设置", for: UIControl.State.normal)
        LeftSetBtn?.setTitleColor(UIColor.black, for: UIControl.State.normal)
        let rightQdBtn:UIButton? = UIButton.init(type: UIButton.ButtonType.custom)
        
        
        rightQdBtn?.setTitle("确定", for: UIControl.State.normal)
        rightQdBtn?.setTitleColor(UIColor(red: 0.2, green: 0.6, blue: 0.6, alpha: 1), for: UIControl.State.normal)
        
        LeftSetBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightQdBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bottomV.addSubview(LeftSetBtn!)
        bottomV.addSubview(rightQdBtn!)
        
        LeftSetBtn?.snp_makeConstraints({ make in
            make.left.top.bottom.equalToSuperview()
            make.right.equalTo(rightQdBtn!.snp.left)
            make.width.equalTo(rightQdBtn!.snp.width)
        })
        
        rightQdBtn?.snp_makeConstraints({ make in
            make.right.top.bottom.equalToSuperview()
            make.width.equalTo(LeftSetBtn!.snp.width)
        })
        
        let lineV:UIView! = UIView.init()
        bottomV.addSubview(lineV)
        lineV?.snp_makeConstraints({ make in
            make.height.equalTo(1)
            make.left.right.top.equalTo(bottomV)
            
        })
        lineV.backgroundColor = UIColor.gray
        
        let zlineV:UIView! = UIView.init()
        bottomV.addSubview(zlineV)
        zlineV.backgroundColor = UIColor.gray
        zlineV?.snp_makeConstraints({ make in
            make.width.equalTo(1)
            make.bottom.top.equalTo(bottomV)
            make.centerX.equalToSuperview()
        })
        
    }
    
    @objc func qdClick() {
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: ((showView?.frame.width)! - 42)/2, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
         return dataArr?.count ?? 100;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets.init(top: 10, left: 16, bottom: 10, right: 16)
    }

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let patCollLabelCell:IFLYPatCollLbCell? = collectionView.dequeueReusableCell(withReuseIdentifier: IFLYCollTypeSelectView.cellIdent!, for: indexPath) as? IFLYPatCollLbCell
        patCollLabelCell?.titleLb.text = "快治愈患者快治愈患者快治愈患者快治愈患"
        patCollLabelCell?.setUIData(data: dataArr![indexPath.row])
        
        return patCollLabelCell!
        
    }
    
}

class IFLYPatCollLbCell: UICollectionViewCell {
    lazy var titleLb: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.black
        lab.font = UIFont.systemFont(ofSize: 13)
        lab.numberOfLines = 2
        lab.textAlignment = .center
        contentView.addSubview(lab)
        lab.layer.cornerRadius = 4
        lab.layer.masksToBounds =  true
        lab.layer.borderWidth = 0.5
        lab.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        lab.isUserInteractionEnabled = true
        let tap:UITapGestureRecognizer? = UITapGestureRecognizer.init(target: self, action: #selector(selectClick(someId:)))
        lab.addGestureRecognizer(tap!)
        return lab
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        titleLb.snp.makeConstraints({ make in
            make.edges.equalTo(self)
        })
    }
    
    func setUIData<T>(data:T) {
        titleLb.text = (data as! String)
        if self.isSelected {
            self.titleLb.backgroundColor = UIColor(red: 220/250, green: 0.96, blue: 0.96, alpha: 1)
            self.titleLb.layer.borderColor = UIColor(red: 0.2, green: 0.6, blue: 0.6, alpha: 1).cgColor
        } else {
            self.titleLb.backgroundColor = UIColor.white
            self.titleLb.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        }
    }
    
    @objc func selectClick(someId:Any) {
        if self.isSelected {
            self.isSelected = false
            self.titleLb.backgroundColor = UIColor.white
            self.titleLb.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        } else {
            self.isSelected = true
            self.titleLb.backgroundColor = UIColor(red: 220/250, green: 0.96, blue: 0.96, alpha: 1)
            self.titleLb.layer.borderColor = UIColor(red: 0.2, green: 0.6, blue: 0.6, alpha: 1).cgColor
           
        }
    }
    
    
}
