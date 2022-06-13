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
    
    
    func addLabel() {
        var inputText:UITextField = UITextField();
        let msgAlertCtr = UIAlertController.init(title: "", message: "输入标签名", preferredStyle: .alert)
        let ok = UIAlertAction.init(title: "确定", style:.default) { (action:UIAlertAction) ->() in
            //                if((inputText.text) == ""){
            print("你输入的是：\(String(describing: inputText.text))")
            
            //                }
        }
        let cancel = UIAlertAction.init(title: "取消", style:.cancel) { (action:UIAlertAction) -> ()in
            
            print("取消输入")
        }
        msgAlertCtr.addAction(ok)
        msgAlertCtr.addAction(cancel)
        //添加textField输入框
        msgAlertCtr.addTextField { (textField) in
            //设置传入的textField为初始化UITextField
            inputText = textField
            inputText.placeholder = "输入数据"
        }
        //设置到当前视图
        self.present(msgAlertCtr, animated: true, completion: nil)
        
    }
    
    // MARK: -UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let labelCell:IFLYMedCollLabelCell? = (tableView.dequeueReusableCell(withIdentifier:IFLYCollLabelSetVC.cellIdent  , for: indexPath) as! IFLYMedCollLabelCell)
        labelCell?.editBlock = {
         
            
        }
        
        labelCell?.deleteBlock = {
            
            
        }
        
        
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
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        UITableViewCell.EditingStyle.delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//
//
//
//
//        }
//    }
//
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//
//        return "删除"
//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     您可以使用在Swift中，您可以使用MARK, TODO OR FIXME
     这些预处理器功能允许在源代码编辑器的功能下拉框中添加一些结构。
     */
    
}



class IFLYMedCollLabelCell: UITableViewCell {
    typealias DeleteBlock = () -> ()
    typealias EditBlock = () -> ()
    var deleteBlock:DeleteBlock?
    var editBlock:EditBlock?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    override func awakeFromNib() {
        bgView.layer.cornerRadius = 4
        bgView.layer.borderWidth = 0.5
        bgView.layer.borderColor = UIColor(red: 0.2, green: 0.6, blue: 0.6, alpha: 1).cgColor
    }
    
    
    @IBAction func editClick(_ sender: Any) {
        
        if  editBlock != nil {
            editBlock!()
        }
    }
    
    
    
    @IBAction func deleteClick(_ sender: Any) {
        if deleteBlock != nil {
           deleteBlock!()
        }
    }
}


class IFLYLabelModel : NSObject {
    var titile: String?
    var id: String?
       
    
    
}


/**
 //为没有参数也没有返回值的闭包类型起一个别名
   typealias Nothing = () -> ()
    
 //如果闭包的没有返回值，那么我们还可以这样写，
   typealias Anything = () -> Void
    
 //为接受一个Int类型的参数不返回任何值的闭包类型 定义一个别名：PrintNumber
   typealias PrintNumber = (Int) -> ()
    
 //为接受两个Int类型的参数并且返回一个Int类型的值的闭包类型 定义一个别名：Add
   typealias Add = (Int, Int) -> (Int)
 */
