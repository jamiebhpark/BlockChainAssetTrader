import SwiftUI

struct AssetView: View {
    @EnvironmentObject var appState: AppState
    @State private var assets: Int = 0
    @State private var message: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Check Assets")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            Button(action: fetchAssets) {
                Text("Check Assets")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 16)

            Text("Current Assets: \(assets)")
                .font(.title2)
                .padding()
            
            if !message.isEmpty {
                Text(message)
                    .foregroundColor(.red)
                    .padding()
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Check Assets")
        .navigationBarTitleDisplayMode(.inline)
    }

    func fetchAssets() {
        guard let url = URL(string: "\(serverURL)/assets") else { return }
        var request = URLRequest(url: url)
        request.setValue(appState.token, forHTTPHeaderField: "x-access-token")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            if let assetsResponse = try? JSONDecoder().decode(AssetsResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.assets = assetsResponse.assets
                    self.message = ""
                }
            } else {
                DispatchQueue.main.async {
                    self.message = "Failed to fetch assets."
                }
            }
        }.resume()
    }
}
