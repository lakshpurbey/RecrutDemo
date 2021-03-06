import Foundation
import UIKit
var count: Int = 0

class ThingCell: UITableViewCell {
    
    private let thingImage = UIImageView()
    private let likeImage = UIImageView()
    let mySeparator = UIView()

    private lazy var nameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 20.0)
        return label
    }()
    
    let background = UIView(frame: .zero)
    var updateThingImage: ((UIImage?) -> (Void)) = { _ in }
    var isLiked: Bool? = false {
        
        willSet {
            self.updateLikeImage(check: newValue)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        background.backgroundColor = UIColor(white: 0.9, alpha: 0.1)
        contentView.addSubview(background)

        thingImage.contentMode = .scaleAspectFit
  
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = UIColor.darkGray
        } else {
            // Fallback on earlier versions
        }
//        backgroundColor = UIColor.lightGray // No need this because we have already mention content view
        contentView.addSubview(nameLabel)
        contentView.addSubview(thingImage)
        contentView.addSubview(likeImage)
        addShadow()
    }
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "")

        nameLabel.text = "Undefined thing name"
 
        updateThingImage = { image in
            self.change(image: image, in: self.thingImage)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
    
        let origin = CGPoint(x: 80.0, y: 10.5)
        let size = CGSize(width: bounds.width - origin.x, height: 20)
        nameLabel.frame = CGRect(origin: origin, size: size)
        nameLabel.textColor = UIColor.white
        nameLabel.numberOfLines = 2
        
        let imageOrigin = CGPoint(x: 10.0, y: 5.5)
        let imageSize = CGSize(width: 50.0, height: 50.0)
        thingImage.frame = CGRect(origin: imageOrigin, size: imageSize)
        
        let likeOrigin = CGPoint(x: bounds.width - 50.5, y: 10.5)
        let likeSize = CGSize(width: 40.0, height: 40.0)
        likeImage.frame = CGRect(origin: likeOrigin, size: likeSize)
        
        background.frame = bounds
    }
    
    func setupImageView() {
        
        thingImage.backgroundColor = UIColor.clear
        thingImage.layer.masksToBounds = true
        thingImage.layer.cornerRadius = 10.0
    }
    
    func update(withText: String) {
        nameLabel.text = withText
    }
    
    func update(withLikeValue: Bool?) {
        isLiked = withLikeValue
    }
    
//    func animateAlphaLikeImage() {
//        
//        likeImage.alpha = 0.0
//        UIView.animate(withDuration: 0.5) { 
//            self.likeImage.alpha = 1.0
//        }
//    }
    
    func setLikeImageWithAnimation(image: UIImage) {

        change(image: image, in: likeImage)
    }
    
    private func updateLikeImage(check: @autoclosure () -> Bool?) {
        
        if check() == true {
            setLikeImageWithAnimation(image: #imageLiteral(resourceName: "likeO96"))
        }
        else if check() == false {
            setLikeImageWithAnimation(image: #imageLiteral(resourceName: "dontlikeO96"))
        }
    }
    
    private func change(image: UIImage?, in imageView: UIImageView, animated: Bool = true) {
        
        let transition = CATransition()
        transition.duration = 0.8
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transition.type = CATransitionType.fade
    
        imageView.image = image
        imageView.layer.add(transition, forKey: nil)
    }
    
    private func addShadow() {
        
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 1.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1.0
        
        thingImage.layer.shadowOffset = CGSize(width: 0.5, height: 1.0)
        thingImage.layer.shadowOpacity = 0.3
        thingImage.layer.shadowRadius = 2.0
    }
}















