
import SwiftUI

struct CustomLabel: View {
    let text: String
    
    var body: some View {
        Text(text)
          .foregroundColor(.black)
          .font(.system(size: 18.0, weight: .bold))
          .padding()
    }
}
