import UIKit

class RegisterFruitsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var fruitsTextField: UITextField!
    @IBOutlet weak var explainFruitsTextView: UITextView!
    @IBOutlet weak var threeTypeTextField: UITextField!
    
    @IBOutlet weak var inputField: UITextField!
    
    var fruits: [String] = []
    weak var pickerView: UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruits.append("超人")
        fruits.append("動物")
        fruits.append("自然")
        
        let pv = UIPickerView()
        pv.delegate = self
        pv.dataSource = self
        
        threeTypeTextField.delegate = self
        threeTypeTextField.inputAssistantItem.leadingBarButtonGroups = []
        threeTypeTextField.inputView = pv
        self.pickerView = pv
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return fruits.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return fruits[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        threeTypeTextField.text = fruits[row]
        
    }
    
    // segueが動作することをViewControllerに通知するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toShare" {
            // 2. 遷移先のViewControllerを取得
            let next = segue.destination as? ShareFruitsViewController
            // 3. １で用意した遷移先の変数に値を渡す
            next?.outputValue = self.inputField.text
            
        }
        
    }
        
    @IBAction func completeFruitsButton(_ sender: UIButton) {
        // 4. 画面遷移実行
        performSegue(withIdentifier: "toShare", sender: nil)
        
    }

}
