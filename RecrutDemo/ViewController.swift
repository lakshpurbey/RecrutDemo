import UIKit

class ViewController: UIViewController {
    
//    var tableViewController: UIViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
        //No need to check Tableviewcontroller nil
//        if tableViewController == nil {
            let tableView = ThingsTableViewControler()
            tableView.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            present(tableView, animated: false, completion: nil)
//            tableViewController = tableView
//        }
    }
}

