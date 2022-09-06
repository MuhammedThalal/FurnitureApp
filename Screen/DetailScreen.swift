//
//  DetailScreen.swift
//  FurnitureShop App
//
//  Created by muhammed thalal on 06/08/22.
//

import SwiftUI

struct DetailScreen: View {
    var body: some View {
        VStack{
            ZStack{
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    
                    DescriptionView()
                        .offset(y: -40)
                }
                .edgesIgnoringSafeArea(.top)
                
                HStack{
                    Text("$ 1299")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Add to Cart")
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .foregroundColor(Color("Primary"))
                    })
                }
                .padding()
                .padding(.horizontal)
                .background(Color("Primary"))
                .cornerRadius(50, corners: .topLeft)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
            .navigationBarItems(leading:
                                    Image(systemName: "")
                                    .padding(.all, 12)
                                    .background(Color.black)
                                    .cornerRadius(8.0))
        }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct DescriptionView: View {
        var body: some View {
            VStack (alignment: .leading){
                Text("Luruxry Swedia \nChair")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack (spacing: 4){
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image("star")
                    }
                    Text("(4.9)")
                        .opacity(0.5)
                        .padding(.leading, 8)
                    Spacer()
                }
                Text("Description")
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                
                Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                    .lineSpacing(8.0)
                    .opacity(0.6)
                
                HStack{
                    VStack (alignment: .leading){
                        Text("size")
                            .fontWeight(.semibold)
                            .padding(.bottom, 4)
                        Text("Height: 120 cm")
                            .opacity(0.6)
                        Text("wide: 88 cm")
                            .opacity(0.6)
                        Text("Dimeter: 70 cm")
                            .opacity(0.6)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack (alignment: .leading){
                        Text("Treatment")
                            .fontWeight(.semibold)
                            .padding(.bottom, 4)
                        
                        Text("Jadi wood, Canvas, \nAmazing Love")
                            .opacity(0.6)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                 }
                .padding(.vertical)
                
                
                HStack (alignment: .bottom){
                    VStack (alignment: .leading){
                        Text("Colors")
                            .fontWeight(.semibold)
                        
                        HStack{
                            ColorDotView(color: .white)
                            ColorDotView(color: .black)
                            ColorDotView(color: Color("Primary"))
                                
                        }
                    }
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("Quantity")
                            .fontWeight(.semibold)
                        
                        HStack{
                            Button(action:{}) {
                                Image(systemName: "minus")
                                    .padding(.all, 8)
                            }
                            .frame(width: 30, height: 30)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                            .foregroundColor(.black)
                            
                            Text("1")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 8)
                            
                            Button(action:{}) {
                                Image(systemName: "plus")
                                    .padding(.all, 8)
                            }
                            .frame(width: 30, height: 30)
                            .background(Color("Primary"))
                            .clipShape(Circle())
                            .foregroundColor(.white)
                        }
                    }
                }
            }
            .padding()
            .padding(.top)
            .background(Color("Bg"))
            .cornerRadius(40.0)
        }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}
