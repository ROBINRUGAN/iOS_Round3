//
//  DetailView.swift
//  iOS第三轮考核作业
//
//  Created by MEWW on 2023/1/15.
//

import SwiftUI

struct DetailView: View
{
    @State var username: String = ""
    @State var password: String = ""
    @State var a = 0
    @State var b = 1
    @State var c = 2
    @State var d = 3
    @State var e = 4
    @State var f = 5
    @State var tempa = 0
    @State var tempb = 1
    @State var tempc = 2
    @State var tempd = 3
    @State var tempe = 4
    @State var change = false
    @State var exit = false
    @State var imageURLs = [ "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202104%2F22%2F20210422220415_2e4bd.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1676393460&t=a9fe58dcc5483c67f9e0e0ed25f8dfe9","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202106%2F10%2F20210610232326_f34cf.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1676400861&t=99dde01805640f14c537166e65a919cb","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg1.doubanio.com%2Fview%2Frichtext%2Flarge%2Fpublic%2Fp175084138.jpg&refer=http%3A%2F%2Fimg1.doubanio.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1676400861&t=280871a717e32664b6f6309b47310a23","https://inews.gtimg.com/newsapp_bt/0/14494071320/1000","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202103%2F04%2F20210304115158_e8b2f.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1676400861&t=c0bd58f50f80acb1b05865427e2f82bd",""]
    var body: some View
    {
        NavigationStack
        {
            Color.blue.ignoresSafeArea()
                .overlay(
                    VStack(alignment: .center)
                    {
                        NavigationLink(destination: ContentView(),isActive: $exit ){EmptyView()}
                        HStack(alignment: .center)
                        {
                            Button(action:{

                                self.change.toggle()
                                if(change == true)
                                {
                                    tempb = b
                                    tempc = c
                                    tempd = d
                                    tempe = e
                                    b=f
                                    c=f
                                    d=f
                                    e=f
                                }
                                else
                                {
                                    b=tempb
                                    c=tempc
                                    d=tempd
                                    e=tempe
                                }
                            })
                            {
                                WebBigImage(withURL: imageURLs[a])
                            }
                               // .padding(EdgeInsets(top: 0,leading: 0,bottom: 400,trailing: 250))
                            VStack(alignment: .leading)
                            {
                                Text(username)
                                    .font(.system(size: 30))
                                Text("Account")
                                    .font(.system(size: 20))
                            }
                        }
                        HStack(alignment: .center)
                        {
                            Button(action:{
                                var temp = b
                                b = a
                                a = temp
                            })
                            {
                                WebSmallImage(withURL: imageURLs[b])
                            }
                            Button(action:{
                                var temp = c
                                c = a
                                a = temp
                            })
                            {
                                WebSmallImage(withURL: imageURLs[c])
                            }
                            Button(action:{
                                var temp = d
                                d = a
                                a = temp
                            })
                            {
                                WebSmallImage(withURL: imageURLs[d])
                            }
                            Button(action:{
                                var temp = e
                                e = a
                                a = temp
                            })
                            {
                                WebSmallImage(withURL: imageURLs[e])
                            }
                                

                                
                        }
                        Button(action:{
                            exit = true
                        }
                        )
                        {
                            Text("返回")
                        }
                        .font(.title)
                        .padding(10)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/).padding()
                    }
                        
                )
        }
    }
  
    
}
struct WebSmallImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()

    init(withURL url: String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        VStack {
            //在这里，我们可以直接检查imageLoader的data属性。如果为零，则使用空的UIImage，否则可以使用数据创建UIImage。设置完数据后，@ Published将通知ImageView，它将使用imageLoader中数据的更新版本重新加载Image。
            Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
                .resizable()
                .frame(width: 90,height: 90)
                .aspectRatio(contentMode: .fit)
        }
    }
}
struct WebBigImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()

    init(withURL url: String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        VStack {
            //在这里，我们可以直接检查imageLoader的data属性。如果为零，则使用空的UIImage，否则可以使用数据创建UIImage。设置完数据后，@ Published将通知ImageView，它将使用imageLoader中数据的更新版本重新加载Image。
            Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
                .resizable()
                .frame(width: 150,height: 150)
                .padding(.all,4)
                .padding(.leading,-100)
                .aspectRatio(contentMode: .fit)
        }
    }
}
class ImageLoader: ObservableObject {
    //通过使用@Published属性包装器，我们不需要像PassthroughSubject那样创建自己的发布者并通知我们的订阅者。属性包装器会处理它。
    @Published var data:Data?
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async { self.data = data }
        }
        task.resume()
    }
}
struct Previews_DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
