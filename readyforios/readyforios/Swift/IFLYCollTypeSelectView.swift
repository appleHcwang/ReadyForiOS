//
//  IFLYCollTypeSelectView.swift
//  Medicare
//
//  Created by hcwang3 on 2022/6/1.
//  Copyright © 2022 medicare. All rights reserved.
//

import UIKit
import SnapKit
//import KakaJSON


@objcMembers
class IFLYCollTypeSelectView: UIView, UITableViewDelegate, UITableViewDataSource {
    static var cellIdent:String? = "IFLYPatCollLabelCell"
    var bjView:UIView?
    var showView:UIView?
    var tipLb:UILabel?
    lazy  var selecTableV:UITableView = {
        let  tableV = UITableView.init(frame: CGRect.init(x:0 , y: 0, width: 0, height: 0), style: UITableView.Style.plain)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UINib.init(nibName: IFLYCollTypeSelectView.cellIdent!, bundle: Bundle.main), forCellReuseIdentifier: IFLYCollTypeSelectView.cellIdent!)
        return tableV
        
    }()
    var dataArr:Array<Any>? {
        willSet {
            
        }
        didSet {
            if (dataArr?.count ?? 0) > 0 {
                showView?.addSubview(selecTableV)
                selecTableV.snp.makeConstraints({ make in
                    make.top.equalTo(tipLb!.snp_bottom).offset(0)
                    make.left.right.equalTo(showView!).offset(0)
                    make.bottom.equalTo(showView!.snp_bottom).offset(-50)
                })
            } else {
                showView?.snp.updateConstraints({ make in
                    make.height.equalTo(200)
                })
                
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
            make.height.equalTo(300)
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
        showView?.addSubview(tipLb!)
        tipLb?.snp.makeConstraints({ make in
            make.top.equalTo(titleV!.snp_bottom).offset(20)
            make.centerX.equalTo(showView!.snp.centerX)
            
        })
        
        
        let qdBtn: UIButton  = UIButton.init(type: UIButton.ButtonType.custom)
        qdBtn.setTitle("确定", for: UIControl.State.normal)
        qdBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        qdBtn.addTarget(self, action: #selector(qdClick), for: UIControl.Event.touchUpInside)
        showView?.addSubview(qdBtn)
        qdBtn.snp.makeConstraints { make in
            make.bottom.equalTo(showView!.snp.bottom).offset(0)
            make.left.right.equalTo(showView!).offset(0)
            make.height.equalTo(50)
        }
        
 
    }
    
    @objc func qdClick() {
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let patCollLabelCell:IFLYPatCollLabelCell? = (tableView.dequeueReusableCell(withIdentifier:IFLYCollTypeSelectView.cellIdent!  , for: indexPath) as! IFLYPatCollLabelCell)
        patCollLabelCell?.selectionStyle = UITableViewCell.SelectionStyle.none
        patCollLabelCell?.btnBlock = {
            print("调用了")
        }
        patCollLabelCell?.setUIData(data: dataArr![indexPath.row])
        return patCollLabelCell!
    }
    
}

typealias KButtonBlock = () -> ()
class IFLYPatCollLabelCell: UITableViewCell  {
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var titleLb: UILabel!
    public  var btnBlock: KButtonBlock!
    override func awakeFromNib() {
        selectBtn.addTarget(self, action: #selector(selectClick), for: UIControl.Event.touchUpInside)
        
    }
    
    func setUIData<T>(data:T) {
        titleLb.text = (data as! String)
    }
    
    @objc func selectClick() {
        if btnBlock != nil {
            btnBlock()
        }
    }
}
