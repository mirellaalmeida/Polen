import SwiftUI

struct VerMaisView: View {
    @Binding var historia: HistoriasCard?
    @Binding var verMais: Bool
    
    var body: some View {
        VStack{
            Text(historia!.wrappedTitulo)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(historia!.wrappedDescricao)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .navigationBarItems(trailing: Button(action: {
            self.verMais.toggle()
        }, label: {
            Text("Done")
                .bold()
        }))
    }
}

//struct VerMaisHistoria_Previews: PreviewProvider {
//    static var previews: some View {
//        VerMaisView()
//    }
//}
