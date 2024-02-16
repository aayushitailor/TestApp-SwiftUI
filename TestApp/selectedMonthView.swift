import SwiftUI

struct SelectedMonthView: View{
    let index: Int
    let lblmonth: String
    @State private var amountString = ""

    var body: some View{
        VStack(alignment: .leading) {
            HStack(spacing: 0.0){
                Text("10%")
                    .frame(width: UIScreen.screenWidth * 12 / 100, height: 50)
                      .foregroundColor(darkBlue)
                      .fontWeight(.semibold)
                      .background(lightBlue)
                      .border(width: 1, edges: [.top, .leading, .bottom, .trailing], color: darkBlue)
                
                Text("50%")
                    .frame(width: UIScreen.screenWidth * 45 / 100, height: 50)
                      .foregroundColor(darkPurple)
                      .fontWeight(.semibold)
                      .background(lightPurple)
                      .border(width: 1, edges: [.top, .bottom, .trailing], color: darkPurple)
                
                Text("40%")
                    .frame(width: UIScreen.screenWidth * 35 / 100, height: 50)
                      .foregroundColor(darkOrg)
                      .fontWeight(.semibold)
                      .background(lightOrg)
                      .border(width: 1, edges: [.top, .bottom, .trailing], color: darkOrg)
            }
            .padding()
            
            HStack(spacing: 0.0) {
                Button{
                    // action will be here
                } label: {
                    HStack {
                        Image("hexagon")
                        Text("必要不可欠")
                    }
                    .foregroundColor(darkBlue)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.horizontal, 5)
                    .padding()
                    .frame(maxHeight: 40)
                    .background(lightBlue)
                    .cornerRadius(30)
                }
                VStack {
                    CustomCurrencyTextField(value: $amountString)
                        .padding()
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                }
            }
            .padding(.top, 0)
            .padding(.bottom, 10)
            .padding(.horizontal, 10)
            
            VStack(){
                Color.gray.frame(height: 1 / UIScreen.main.scale)
            }
            .padding(.horizontal, 10)
            
            VStack {
                Text("3ヵ月平均（9~11月)")
                  .foregroundColor(.black)
                  .font(.system(size: 18.0, weight: .bold))
                  .padding(.horizontal, 20)
                  .padding(.vertical, 15)
            }
            VStack(spacing: 15) {
                SecondView(iconname: "hexagon", title: "必要不可欠", firstValue: "平均 ：¥11,918", secondValue: "9月 ：￥12,812", thirdValue: "10月 ：￥10,255", viewColor: "blue")
                
                SecondView(iconname: "minimize", title: "置を換え可能", firstValue: "平均 ：¥9,315", secondValue: "9月 ：￥9,812", thirdValue: "10月 ：￥10,255", viewColor: "purple")
            }
            .padding(.horizontal, 10)
        }
    }
}

struct CustomCurrencyTextField: View {
    @Binding var value: String
    
    var body: some View {
        TextField("￥0.00", text: $value)
            .onChange(of: value) { newValue in
                if let formattedValue = formatInput(newValue) {
                    self.value = formattedValue
                }
            }
    }
    
    private func formatInput(_ input: String) -> String? {
        let cleanedInput = input.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        if let intValue = Int(cleanedInput) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = "￥"
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber(value: intValue))
        }
        return nil
    }
}

struct SecondView: View{
    let iconname: String
    let title: String
    let firstValue: String
    let secondValue: String
    let thirdValue: String
    let viewColor: String
    
    var body: some View{
        VStack {
            HStack(spacing: 27) {
                VStack{
                    Image(iconname)
                    Text(title)
                        .foregroundColor(viewColor == "blue" ? darkBlue : darkPurple)
                        .font(.system(size: 14, weight: .bold))
                }
                VStack(alignment: .leading){
                    HStack(spacing: 0){
                        viewColor == "blue" ? darkBlue.frame(width: 2, height: 45) : darkPurple.frame(width: 2, height: 45)
                        Text(firstValue)
                            .padding(10)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .background(viewColor == "blue" ? darkBlue : darkPurple)
                            .cornerRadius(10, corners: [.topRight, .bottomRight])
                    }
                    Text(secondValue)
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(red: 105.0/255.0, green: 105.0/255.0, blue: 105.0/255.0))
                        .padding(.bottom, 4)
                    Text(thirdValue)
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(red: 105.0/255.0, green: 105.0/255.0, blue: 105.0/255.0))
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding(15)
        .background(viewColor == "blue" ? lightBlue : lightPurple)
        .cornerRadius(10)
    }
}
