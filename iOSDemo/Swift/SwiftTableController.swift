//
//  SwiftTableController.swift
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//Swift 中所有的基本类型：整数（integer）、浮点数（floating-point number）、布尔值（boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，其底层也是使用结构体实现的。
//Swift 中所有的结构体和枚举类型都是值类型,标准库定义的集合，例如数组，字典和字符串，都对复制进行了优化以降低性能成本。新集合不会立即复制，而是跟原集合共享同一份内存，共享同样的元素。在集合的某个副本要被修改前，才会复制它的元素。而你在代码中看起来就像是立即发生了复制。
//Swift中结构体和枚举能够定义方法
//可以使用下划线（_）来代替显式的实参标签来重写默认行为。
//MARK:访问级别 open>public>Internal>private
//Open 和 Public 级别可以让实体被同一模块源文件中的所有实体访问，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，你会使用 Open 或 Public 级别来指定框架的外部接口。Open 和 Public 的区别在后面会提到。
//Internal(默认级别) 级别让实体被同一模块源文件中的任何实体访问，但是不能被模块外的实体访问。通常情况下，如果某个接口只在应用程序或框架内部使用，就可以将其设置为 Internal 级别。
//File-private 限制实体只能在其定义的文件内部访问。如果功能的部分细节只需要在文件内使用时，可以使用 File-private 来将其隐藏。
//Private 限制实体只能在其定义的作用域，以及同一文件内的 extension 访问。如果功能的部分细节只需要在当前作用域内使用时，可以使用 Private 来将其隐藏。
//Open 为最高访问级别（限制最少），Private 为最低访问级别（限制最多）。
//
//Open 只能作用于类和类的成员，它和 Public 的区别如下：
//
//Public 或者其它更严访问级别的类，只能在其定义的模块内部被继承。
//Public 或者其它更严访问级别的类成员，只能在其定义的模块内部的子类中重写。
//Open 的类，可以在其定义的模块中被继承，也可以在引用它的模块中被继承。
//Open 的类成员，可以在其定义的模块中子类中重写，也可以在引用它的模块中的子类重写。
//把一个类标记为 open，明确的表示你已经充分考虑过外部模块使用此类作为父类的影响，并且设计好了你的类的代码了。


import UIKit
public struct KScreen {
    static  func width() -> CGFloat {
        return UIScreen.main.bounds.width;
    }
    static func height() -> CGFloat {
        return UIScreen.main.bounds.height;
    }
}


//MARK:结构体
struct SomeStruct {
//    UIScreen.main.bounds.width;
    var tructFirst = 0
    var tructSecond = 0
    var totalStru: Int {//计算属性
        get {
          return tructFirst+tructSecond
        }
        set {
            tructFirst = newValue/2
            tructSecond = newValue/2
        }
    }
    //mutating 关键字，允许修改属性。
    mutating func addone(first f:Int){
        tructFirst+=1;
    }
    //下标
    subscript(index:Int)-> Int {
        return 10
    }
    subscript(row:Int,column:Int)->String {
        return String(row)+"."+String(column)
    }
}

class SwiftTableController: UITableViewController {
    
  open var otherVar = 0;
    let mainArray = [["title":"关键字","classn":"XKeyWordViewController","storyboard":"0"],["title":"数据类型","classn":"DataTypeViewController","storyboard":"0"],["title":"闭包","classn":"SwiftBlocksViewController","storyboard":"1"],["title":"枚举","classn":"EnumViewController","storyboard":"0"],["title":"构造器","classn":"ConstructorViewController","storyboard":"0"],["title":"扩展","classn":"ExtensionViewController","storyboard":"0"],["title":"协议","classn":"ProtocolViewController","storyboard":"0"],["title":"UIStackView","classn":"XStackViewController","storyboard":"0"]]
    
    //类型方法
    //在方法的 func 关键字之前加上关键字 static，来指定类型方法。类还可以用关键字 class 来指定，子类重写父类该方法的实现。
    
    //重新父类 override 关键字， 编译器去检查该类的超类（或其中一个父类）是否有匹配重写版本的声明
    //super关键字 前缀来访问超类版本的方法，属性或下标：
    //继承来的只读属性重写为一个读写属性,只需要在重写版本的属性里提供 getter 和 setter 即可。但是，你不可以将一个继承来的读写属性重写为一个只读属性。
    //声明关键字前加上final 关键字可以防止被重新和继承。例如：final var、final func、final class func 以及 final subscript
    
    //类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。
    func fsunctionUseBlock(callBack:(String,String) ->String) -> Void {
    print(callBack("parameter1","parameter2"))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let xs:XStringViewController  = XStringViewController.init()
        otherVar = 3;
        var di = mainArray[0];
        print(di["title"]!);
        var a:String = "1"
        var b:String = "2"
        a = "12"
        b = "34"
        self.fsunctionUseBlock { (a, b) -> String in
            return b+a;
        }
        print(someFunction(firstargument: 2, from: 4));
        
        var ia = 1;
        var ib = 2;
        swapTwoInts(a: &ia, b: &ib);
        print(ia,ib);
        let stru = SomeStruct()
        print("小标" , stru[1],stru[1,2]);
        print(stru.tructSecond,stru.tructFirst);
        //恒等运算 相同（===）不相同（!==）
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    //MARK: 函数。
//函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。
    func someFunction(firstargument:Int,from secodA:Int) -> String {
        return String(secodA)+"+"+String(firstargument);
    }
    //输入输出参数（In-Out Parameters）。在参数定义前加 inout 关键字,需要在参数名前加 & 符，表示这个值可以被函数修改。
    func swapTwoInts(a:inout Int ,b:inout Int) {
        a = 10;
        b = 20;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mainArray.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "swiftcell", for: indexPath)
        let dict = mainArray[indexPath.row];
        
        cell.textLabel?.text = dict["title"];
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = mainArray[indexPath.row];
        guard let boolstr = dict["storyboard"] else { return };
        print(dict,boolstr)
        if (Int(boolstr) == 1){
            guard let Str = dict["classn"] else { return };
            self.performSegue(withIdentifier: Str, sender: nil);
        }
        else {
            guard let Str = dict["classn"] else { return };
            print(Str)
            let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
            let classV = NSClassFromString(clsName! + "." +  Str) as!UIViewController.Type;
            let vc = classV.init();
            self.navigationController?.hidesBottomBarWhenPushed = true;
            self.navigationController?.pushViewController(vc, animated: true);
        }
    }

}

class OtherClass: NSObject {

}
