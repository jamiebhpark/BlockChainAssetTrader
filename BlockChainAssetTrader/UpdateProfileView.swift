import SwiftUI

struct UpdateProfileView: View {
    @EnvironmentObject var appState: AppState
    @State private var ethereumAddress: String = ""
    @State private var message: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Update Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            TextField("Ethereum Address", text: $ethereumAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            Button(action: updateProfile) {
                Text("Update Profile")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 16)

            Text(message)
                .foregroundColor(.red)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Update Profile")
        .navigationBarTitleDisplayMode(.inline)
    }

    func updateProfile() {
        guard let url = URL(string: "\(serverURL)/update_profile") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(appState.token, forHTTPHeaderField: "x-access-token")
        let body: [String: Any] = ["ethereum_address": ethereumAddress]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            if let response = try? JSONDecoder().decode(ResponseMessage.self, from: data) {
                DispatchQueue.main.async {
                    self.message = response.message
                }
            } else {
                DispatchQueue.main.async {
                    self.message = "Failed to update profile."
                }
            }
        }.resume()
    }
}
