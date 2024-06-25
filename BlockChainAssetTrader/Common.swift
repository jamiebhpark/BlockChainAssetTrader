import Foundation

// 서버 URL
let serverURL = "http://172.30.1.24:5001"

// 공통 구조체 정의
struct ResponseMessage: Codable {
    let message: String
}

struct TokenResponse: Codable {
    let token: String
}

struct AssetsResponse: Codable {
    let assets: Int
}

struct Transaction: Identifiable, Codable {
    var id: UUID
    let sender: String
    let receiver: String
    let amount: Int
    let timestamp: String
    let txn_hash: String
}

