import UIKit

let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

class MainViewController: UIViewController {
    private let collectionView: UICollectionView = {
        //セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        //各々の設計に合わせて調整
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //セルの登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    fileprivate var fruits = UserDefaults.standard.array(forKey: "names")
        as? [String] ?? ["apple", "grape", "lemon", "banana", "cherry", "strobery", "peach", "orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let saveButton = UIButton()
        saveButton.frame = CGRect(
            x: viewWidth * 0.9,
            y: viewHeight * 0.1,
            width: viewWidth * 0.1,
            height: viewHeight * 0.1
        )
        saveButton.backgroundColor = UIColor.blue
        saveButton.addTarget(self, action: #selector(onTappedPush(_:)), for: .touchUpInside)
        
        addEventListner()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        view.addSubview(saveButton)
    }
    
    @objc func onTappedPush(_ sender: UIButton) {
        UserDefaults.standard.set(fruits, forKey: "names")
        print(UserDefaults.standard.array(forKey: "names"))
    }
    
    private func addEventListner() {
        let longPressGesture = UILongPressGestureRecognizer(target: self,
                                                            action: #selector(self.handleLongGesture(_:)))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    //ここがポイントです
    @objc func handleLongGesture(_ gesture: UILongPressGestureRecognizer) {
        print("longGesture")
        switch(gesture.state) {
            
        case UIGestureRecognizerState.began:
            print("began")
            guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                break
            }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
            
        case UIGestureRecognizerState.changed:
            print("changed")
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
            
        case UIGestureRecognizerState.ended:
            print("end")
            collectionView.endInteractiveMovement()
            
        default:
            print("default")
            collectionView.cancelInteractiveMovement()
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    //cellの個数設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let cellText = fruits[indexPath.item]
        cell.setupContents(textName: cellText)
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView,
//                        moveItemAtIndexPath sourceIndexPath: NSIndexPath,
//                        toIndexPath destinationIndexPath: NSIndexPath) {
//        
//        let tempNumber = fruits.removeAtIndex(sourceIndexPath.item)
//        fruits.insert(tempNumber, atIndex: destinationIndexPath.item)
//    }
}

//イベントの設定(何もなければ記述の必要なし)
extension MainViewController: UICollectionViewDelegate {
    
}

//cellのサイズの設定
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //ここでは画面の横サイズの半分の大きさのcellサイズを指定
        return CGSize(width: screenSize.width / 2.0, height: screenSize.width / 2.0)
    }
}

final class CollectionViewCell: UICollectionViewCell {
    
    private let fruitsNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: screenSize.width / 2.0, height: screenSize.width / 2.0)
        label.textColor = UIColor.gray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1.0
        
        contentView.addSubview(fruitsNameLabel)
    }
    
    func setupContents(textName: String) {
        fruitsNameLabel.text = textName
    }
}
