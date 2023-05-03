import UIKit

class ShareFruitsViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var outputValue : String?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        outputLabel.text = outputValue
        
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        
        let activityItems = ["あなたは今まで存在しなかった悪魔の実を創造しました。", "#悪魔の実の創造者"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
        
    }

}
