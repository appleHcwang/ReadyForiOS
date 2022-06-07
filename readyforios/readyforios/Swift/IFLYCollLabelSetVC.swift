//
//  IFLYCollLabelSetVC.swift
//  readyforios
//
//  Created by hcwang3 on 2022/6/7.
//

import UIKit

class IFLYCollLabelSetVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static var cellIdent:String! = "IFLYMedCollLabelCell"
    lazy var listView:UITableView = {
        var tableVw = UITableView.init(frame: CGRect.init(x:0 , y: 0, width: 0, height: 0), style: UITableView.Style.plain)
        tableVw.delegate = self
        tableVw.dataSource = self
        tableVw.register(UINib.init(nibName: IFLYCollLabelSetVC.cellIdent, bundle: Bundle.main), forCellReuseIdentifier: IFLYCollLabelSetVC.cellIdent)
        if #available(iOS 15.0, *) {
            tableVw.sectionHeaderTopPadding = 0
        } else {
            
        }
        return tableVw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "新增标签"
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let labelCell:IFLYMedCollLabelCell? = (tableView.dequeueReusableCell(withIdentifier:IFLYCollLabelSetVC.cellIdent  , for: indexPath) as! IFLYMedCollLabelCell)
        return labelCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 51;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 52
        }
        else {
            return 12
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v: UILabel! = UILabel.init()
        v.backgroundColor = UIColor.white
        if section == 0 {
            v.text = "全部标签"
        } else {
            v.text = ""
        }
        return v
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        UITableViewCell.EditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        return "删除"
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



class IFLYMedCollLabelCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var editBtn: UIButton!
    override func awakeFromNib() {
        bgView.layer.cornerRadius = 4
        bgView.layer.borderWidth = 0.5
        bgView.layer.borderColor = UIColor(red: 0.2, green: 0.6, blue: 0.6, alpha: 1).cgColor
    }
}
