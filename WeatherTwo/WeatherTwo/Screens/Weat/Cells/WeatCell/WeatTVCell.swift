import UIKit



class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"



        let myLabel: UILabel = {
            let myLabel = UILabel()
            myLabel.font = .systemFont(ofSize: 20)
            myLabel.text = ""
            return myLabel
        }()



        let myLabel2: UILabel = {
            let myLabel2 = UILabel()
            myLabel2.text = ""
            return myLabel2
        }()



        let myLabel3: UILabel = {
            let myLabel3 = UILabel()
            myLabel3.text = ""
            myLabel3.font = .systemFont(ofSize: 14, weight: .ultraLight)
            return myLabel3
        }()



        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubview(myLabel)
            contentView.addSubview(myLabel2)
            contentView.addSubview(myLabel3)
        }



        required init?(coder: NSCoder){
            fatalError("init(coder:) has not be implemented")
        }



        public func configure(weather: Weat){
            self.myLabel.text = weather.name
            self.myLabel3.text = weather.condition
            self.myLabel2.text = weather.temperatureString+" °С"
        }



        override func layoutSubviews() {
            super.layoutSubviews()

            let labelSize = contentView.frame.size.height - CGFloat(myLabel2.text!.count)

            myLabel.frame = CGRect(x: 15,
                                   y: 0,
                                   width: contentView.frame.size.width - 10 - labelSize,
                                   height: contentView.frame.size.height)

            myLabel2.frame = CGRect(x: contentView.frame.size.width - labelSize - 12,
                                    y: 3,
                                    width: contentView.frame.size.width - 10 - labelSize,
                                    height: contentView.frame.size.height)

            myLabel3.frame = CGRect(x: contentView.frame.size.width/2,
                                    y: 3,
                                    width: contentView.frame.size.width - 40 - labelSize,
                                    height: contentView.frame.size.height)

    }
}
