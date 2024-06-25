import SwiftUI

struct AssetView: View {
    @EnvironmentObject var appState: AppState
    @State private var ethBalance: Double = 0.0
    @State private var message: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Check Assets")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            Button(action: fetchEthBalance) {
                Text("Check Ethereum Balance")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 16)

            Text("Ethereum Balance: \(ethBalance, specifier: "%.4f") ETH")
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
        .onAppear {
            fetchEthBalance()
        }
    }

    func fetchEthBalance() {
        guard let url = URL(string: "\(serverURL)/eth_balance") else { return }
        var request = URLRequest(url: url)
        request.setValue(appState.token, forHTTPHeaderField: "x-access-token")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.message = "Request error: \(error.localizedDescription)"
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    self.message = "No data received."
                }
                return
            }
            do {
                let balanceResponse = try JSONDecoder().decode([String: Double].self, from: data)
                if let ethBalance = balanceResponse["eth_balance"] {
                    DispatchQueue.main.async {
                        self.ethBalance = ethBalance
                        self.message = ""
                    }
                } else {
                    DispatchQueue.main.async {
                        self.message = "Failed to fetch Ethereum balance: Key not found"
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.message = "Failed to fetch Ethereum balance: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
