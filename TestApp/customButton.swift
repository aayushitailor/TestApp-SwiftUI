
import SwiftUI

struct CustomButton: View{
    let text: String
    
    var body: some View{
        Text(text)
            .frame(width: text == "10%" ? UIScreen.screenWidth * 10 / 100 :  text == "50%" ? UIScreen.screenWidth * 46 / 100 : UIScreen.screenWidth * 36 / 100, height: 50)
              .foregroundColor(text == "10%" ? customBlue: text == "50%" ? customPurple: customOrg )
              .fontWeight(.semibold)
              .background(text == "10%" ? lightBlue: text == "50%" ? lightPurple : lightOrg )
              .border(width: 1, edges: text == "10%" ? [.top, .leading, .bottom, .trailing] : [.top, .bottom, .trailing], color: text == "10%" ? customBlue : text == "50%" ? customPurple : customOrg)

    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
