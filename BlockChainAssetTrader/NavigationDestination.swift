import Foundation

enum NavigationDestination: Hashable {
    case register
    case login
    case transaction
    case assets
    case transactionDetail(transaction: BlockchainTransaction)
    case transactionList
}
