import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "second view"
        self.view.backgroundColor = UIColor.red
        print("loaded")
    }
    
    init() {
        print("constructed")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        //super.init(coder: coder)
    }
}
