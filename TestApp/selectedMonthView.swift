import SwiftUI

struct SelectedMonthView: View{
    let index: Int
    let lblmonth: String
    @State private var essential: String = ""

    var body: some View{
        VStack(alignment: .leading) {
            HStack(spacing: 0.0){
                CustomButton(text: "10%")
                CustomButton(text: "50%")
                CustomButton(text: "40%")
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
                    .foregroundColor(customBlue)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.horizontal, 5)
                    .padding()
                    .frame(maxHeight: 40)
                    .background(lightBlue)
                    .cornerRadius(30)
                }
                TextField("￥9,812", text: $essential)
                    .padding(.trailing, 10.0)
                    .frame(height: 40.0)
                    .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.trailing)
            }
            .padding(.top, 5)
            .padding(.bottom, 15)
            .padding(.horizontal, 10)
            
            VStack(){
                Color.gray.frame(height: 1 / UIScreen.main.scale)
            }
            .padding(10)
            
            VStack {
                CustomLabel(text: "3ヵ月平均（9~11月)").fontWeight(.bold)
            }
            VStack(spacing: 15) {
                SecondView(iconname: "hexagon", title: "必要不可欠", firstValue: "平均 ：¥11,918", secondValue: "9月 ：￥12,812", thirdValue: "10月 ：￥10,255", viewColor: "blue")
                
                SecondView(iconname: "minimize", title: "置を換え可能", firstValue: "平均 ：¥9,315", secondValue: "9月 ：￥9,812", thirdValue: "10月 ：￥10,255", viewColor: "purple")
            }
            .padding(.horizontal, 10)
            
        }
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
                        .foregroundColor(viewColor == "blue" ? customBlue : customPurple)
                        .font(.system(size: 14, weight: .bold))
                }
                VStack(alignment: .leading){
                    HStack(spacing: 0){
                        viewColor == "blue" ? customBlue.frame(width: 2, height: 45) : customPurple.frame(width: 2, height: 45)
                        Text(firstValue)
                            .padding(10)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .background(viewColor == "blue" ? customBlue : customPurple)
                            .cornerRadius(10, corners: [.topRight, .bottomRight])
                    }
                    Text(secondValue)
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(red: 105.0/255.0, green: 105.0/255.0, blue: 105.0/255.0))
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
