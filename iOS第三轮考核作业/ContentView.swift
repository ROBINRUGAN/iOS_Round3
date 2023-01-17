//
//  ContentView.swift
//  iOS第三轮考核作业
//
//  Created by MEWW on 2023/1/15.
//

import SwiftUI

struct ContentView: View
{
    @State private var username = ""
    @State private var password = ""
    @State private var showAlert: Bool = false
    @State private var isShowingDetailView:Bool = false
    @State private var res: String = "请输入"
    @FocusState private var focus: FocusField?
    enum FocusField:Hashable
    {
        case name
        case password
        case clear
    }
    var body: some View
    {
        NavigationStack
        {
            Color.blue.ignoresSafeArea()
                .overlay(
                    VStack
                    {
                        NavigationLink(destination: DetailView(username: username,password: password), isActive: $isShowingDetailView) { EmptyView() }
                        Text("MEWWW")
                            .font(.system(size:40))
                            .colorInvert()
                        TextField("Username",text: $username)
                            .focused($focus,equals: .name)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25.0, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                        )
                        SecureField("Password",text: $password)
                            .focused($focus,equals: .password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25.0, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke()
                                    )
                        Button(action:{
                                    showAlert.toggle()
                                    let test = Test()
                                    test.mew()
                                    if(username == "")
                                    {
                                        res = "请输入用户名！"
                                        return
                                    }
                                    if(password == "")
                                    {
                                        res = "请输入密码！"
                                        return
                                    }
                                    if(account[username] == password)
                                    {
                                        res = "登录成功！"
                                        isShowingDetailView = true
                                    }
                                    if(account[username] != password)
                                    {
                                        res = "用户名或密码错误！"
                                    }
                                    })
                                {
                                    Text("Login")
                                }
                            .font(.title)
                            .padding(10)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/).padding()
                            .alert(isPresented: $showAlert)
                            {
                                Alert(
                                    title: Text("提示"),
                                    message: Text(res),
                                    dismissButton: .default(Text("mewww"))
                                    {
                                        if(res == "请输入用户名！")
                                        {
                                            focus = .name
                                        }
                                        if(res == "请输入密码！")
                                        {
                                            focus = .password
                                        }
                                        if(res == "用户名或密码错误！")
                                        {
                                            focus = .password
                                        }
                                        if(res == "登录成功！"||res == "请输入")
                                        {
                                            focus = .clear
                                        }
                                    }
                                )
                            
                            }
                        
                        
                    }.padding(20)
                )//overlay
        }//navigationview
    }//bodyview
}//struct

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
