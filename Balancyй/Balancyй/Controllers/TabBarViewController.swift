import UIKit

class TabBarViewController: UITabBar {

    private var shapeLayer: CALayer?
       
       private func addShape() {
           let shapeLayer = CAShapeLayer()
           shapeLayer.path = createPath()
           shapeLayer.strokeColor = UIColor.clear.cgColor
           shapeLayer.fillColor = UIColor(named: "TabBarColor")?.cgColor
           shapeLayer.lineWidth = 1.0           
           shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
           shapeLayer.shadowRadius = 10

           if let oldShapeLayer = self.shapeLayer {
               self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
           }else{
               self.layer.insertSublayer(shapeLayer, at: 0)
           }
           self.shapeLayer = shapeLayer
       }
       
       override func draw(_ rect: CGRect) {
           self.addShape()
           self.unselectedItemTintColor = UIColor.gray
           self.tintColor = AppColor.textWhite
           setTabBarItems()
       }

       func createPath() -> CGPath {
           let path = UIBezierPath()
           path.move(to: CGPoint(x: 0, y: 0)) //start pos (left top)

//           path.addLine(to: CGPoint(x: centerWidth - 10, y: height)) //left slope
//           path.addLine(to: CGPoint(x: centerWidth + 10 , y: height )) //right slope
           
           path.addLine(to: CGPoint(x: self.frame.width, y: 0)) //right top
           //close the path
           path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
           path.addLine(to: CGPoint(x: 0, y: self.frame.height))
           path.close()
           
           return path.cgPath
       }
    
    func setTabBarItems(){
        
        guard let items = self.items else{
            return
        }
        
        for tabBarItemCounter in 0..<items.count{
            items[tabBarItemCounter].title=Const.tabBarTitles[tabBarItemCounter]
        }
        
        for tabBarItemCounter in 0..<items.count{
            items[tabBarItemCounter].image = UIImage(named: Const.tabBarImages[tabBarItemCounter] )
        }

    }

}
