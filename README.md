## 📱**프로젝트: Blockchain Asset Trader**

---

### 📝 **프로젝트 개요**

**Blockchain Asset Trader**는 사용자가 이더리움 블록체인 상에서 자산을 관리하고 거래할 수 있는 기능을 제공하는 iOS 애플리케이션입니다. 이 앱은 이더리움 지갑의 잔액을 실시간으로 확인하고, 이더리움 거래를 수행하며, 거래 내역을 기록하고 조회할 수 있는 기능을 제공합니다. 백엔드 서버는 Flask를 사용하여 개발되었으며, 이더리움 블록체인과 상호작용하기 위해 Web3 라이브러리가 사용되었습니다.

---

### 💻**기술 스택 및 사용된 라이브러리**

### **프론트엔드 (iOS 앱)**

- **Swift**: 앱 전반에 사용된 프로그래밍 언어.
- **SwiftUI**: UI를 구성하고 사용자 경험을 최적화하기 위해 사용.
- **Combine**: 비동기 데이터 흐름을 관리하고, 데이터와 UI 간의 바인딩을 구현하기 위해 사용.
- **URLSession**: HTTP 네트워크 요청을 처리하기 위해 사용.
- **UserNotifications**: 로컬 알림을 처리하기 위해 사용.

### **백엔드 (서버)**

- **Flask**: 서버 개발을 위한 Python 마이크로 프레임워크.
- **SQLAlchemy**: 데이터베이스 관리 및 ORM (Object-Relational Mapping) 구현.
- **Web3.py**: 이더리움 블록체인과의 상호작용을 위한 라이브러리.
- **JWT (JSON Web Token)**: 사용자 인증을 위한 토큰 기반 인증 시스템.
- **SQLite**: 애플리케이션의 데이터베이스로 사용된 경량 SQL 데이터베이스.

---

### 🎯 **주요 기능**

1. **사용자 인증 및 프로필 관리**:
    - JWT를 사용하여 사용자 인증을 수행하며, 각 요청에 대해 보안을 유지합니다.
    - 사용자는 프로필 정보를 업데이트하고, 이더리움 지갑 주소를 관리할 수 있습니다.
2. **이더리움 자산 관리**:
    - 사용자는 자신의 이더리움 잔액을 실시간으로 조회할 수 있습니다. 이 잔액은 이더리움 블록체인에서 직접 가져옵니다.
3. **거래 수행 및 관리**:
    - 사용자는 이더리움을 다른 사용자에게 전송할 수 있으며, 이 거래는 블록체인에 기록됩니다.
    - 거래 내역을 조회할 수 있으며, 각 거래의 세부 정보를 확인할 수 있습니다.
4. **거래 기록 및 자산 관리**:
    - 각 사용자는 애플리케이션 내에서 자신의 자산을 관리할 수 있으며, 거래에 따른 자산 변동 내역이 기록됩니다.

---

### 🛠 **디자인 패턴 및 개발 방식**

- **프론트엔드**:
    - **MVVM 패턴**: SwiftUI와 Combine을 사용하여 MVVM (Model-View-ViewModel) 패턴을 구현했습니다. 이 패턴은 UI와 데이터 로직의 명확한 분리를 유지하며, UI 업데이트를 자동화하여 코드의 유지보수성을 높였습니다.
    - **Combine**: 서버와의 비동기 통신 및 데이터 바인딩을 위해 Combine 프레임워크를 활용했습니다. 이로 인해 비동기 작업이 단순화되고, 데이터 스트림을 쉽게 관리할 수 있었습니다.
- **백엔드**:
    - **Flask**: 라우팅, 사용자 인증, 데이터베이스 관리 등 웹 애플리케이션의 전반적인 기능을 관리하기 위해 Flask를 사용했습니다.
    - **JWT 기반 인증**: JWT를 사용하여 토큰 기반 인증 시스템을 구현했습니다. 이를 통해 사용자는 보안이 강화된 상태에서 서비스를 이용할 수 있습니다.
    - **Web3.py**: 이더리움 블록체인과의 상호작용을 위해 Web3.py 라이브러리를 사용하여, 트랜잭션 생성 및 잔액 조회 등의 기능을 구현했습니다.

---

### **📈 개발 과정에서의 역할 및 기여**

1. **프론트엔드 개발**:
    - **SwiftUI 및 Combine 활용**: iOS 애플리케이션의 UI와 데이터 흐름을 관리하기 위해 SwiftUI와 Combine 프레임워크를 사용하여 사용자 경험을 최적화했습니다.
    - **UI 디자인 및 구현**: 사용자 친화적인 인터페이스를 설계하고 구현하여, 이더리움 자산 관리와 거래가 직관적이고 쉽게 이루어질 수 있도록 했습니다.
    - **네트워킹 로직**: URLSession을 사용하여 백엔드 서버와의 통신을 구현하였으며, 사용자 인증, 자산 조회, 거래 수행 등의 기능을 효율적으로 처리할 수 있도록 했습니다.
2. **백엔드 개발**:
    - **Flask 서버 구축**: Flask 프레임워크를 사용하여 RESTful API를 설계하고 구현했습니다. 이 API는 사용자 인증, 프로필 관리, 거래 처리, 자산 조회 등의 핵심 기능을 제공합니다.
    - **블록체인 통합**: Web3.py 라이브러리를 사용하여 이더리움 블록체인과의 상호작용을 구현했습니다. 이를 통해 사용자는 실제 블록체인 네트워크에서 이더리움 거래를 수행하고, 지갑 잔액을 확인할 수 있게 되었습니다.
    - **데이터베이스 설계 및 관리**: SQLAlchemy를 활용하여 SQLite 데이터베이스를 관리하고, 사용자 및 거래 데이터를 효율적으로 저장하고 조회할 수 있는 시스템을 구축했습니다.
3. **전체 아키텍처 설계**:
    - **JWT 기반 인증**: 사용자 인증 및 보안을 강화하기 위해 JWT 기반의 토큰 인증 시스템을 설계했습니다. 이를 통해 API 요청 시 사용자 권한을 안전하게 검증할 수 있었습니다.
    - **테스트 및 디버깅**: 전반적인 시스템의 안정성을 보장하기 위해 다양한 테스트와 디버깅 작업을 수행했습니다. 특히, 블록체인 거래의 신뢰성과 백엔드 서버의 성능을 중점적으로 점검했습니다.

---

### **🚀 프로젝트의 성과 및 의미**

1. **실제 블록체인 통합**:
    - 이 프로젝트를 통해 사용자는 이더리움 블록체인에서 직접 거래를 수행할 수 있는 기능을 제공받았습니다. 이는 단순한 시뮬레이션이 아닌 실제 블록체인 네트워크와의 통합을 구현한 것으로, 블록체인 기술을 활용한 실질적인 애플리케이션을 제작하는 데 성공했습니다.
2. **기술적 성과**:
    - **프론트엔드**와 **백엔드**의 유기적인 통합을 통해, 사용자 경험과 시스템의 안정성을 모두 확보할 수 있었습니다. 특히 SwiftUI와 Flask, Web3.py와의 통합을 통해 최신 기술 스택을 실무에 적용하는 데 성공했습니다.
    - **JWT 인증 시스템**과 **SQLAlchemy를 이용한 데이터베이스 관리**를 통해 보안성과 데이터 무결성을 보장했습니다. 이로써 프로젝트의 안정성과 신뢰성을 높일 수 있었습니다.
3. **개발자로서의 성장**:
    - 이 프로젝트는 블록체인과 iOS 애플리케이션의 교차점에서 발생하는 복잡한 문제들을 해결하는 능력을 길러주었습니다. 특히, 블록체인 기술을 실질적인 서비스로 전환하는 과정에서 얻은 경험은 개발자로서의 저의 전문성을 크게 향상시켰습니다.
4. **실무에 적용 가능한 기술 축적**:
    - 프로젝트를 통해 블록체인 기술의 실질적인 활용과 iOS 애플리케이션 개발의 전 과정을 경험했습니다. 이는 실제 기업 환경에서도 즉시 적용 가능한 기술적 자산으로, 블록체인과 모바일 애플리케이션 개발에 대한 깊은 이해를 보여줍니다.

---

## 스크린샷

1. Dashboard
    
    ![IMG_4896.PNG](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/61b08d3c-2f70-44fa-8331-8150fd540508/IMG_4896.png)
    
2. Register
    
    ![IMG_4897.PNG](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/737efce1-735c-40c0-8cff-b6708887b20e/IMG_4897.png)
    
3. Login
    
    ![IMG_4898.PNG](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/81817c2f-8954-44e6-9670-62d179d3f60f/IMG_4898.png)
    
4. Send Transaction
    
    ![IMG_4904.JPG](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/5ca52c2e-57cd-43e7-b575-b732fa8a842d/IMG_4904.jpg)
    
5. Transaction List
    
    ![IMG_4905.JPG](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/65987b35-4c1f-492b-ad64-e70e51582339/IMG_4905.jpg)
    
6. Transaction Detail
    
    ![IMG_4901.PNG](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/6ada0fdd-4cd2-48fe-b8d5-a7e9de418373/IMG_4901.png)
    

---

## 테스트 시나리오

1. **사용자 등록**
    - 앱을 열고 "Register" 화면으로 이동합니다.
    - 사용자 이름, 비밀번호 및 이더리움 주소를 입력한 후 "Register"를 누릅니다.
    - 등록이 성공적으로 완료되었는지 확인합니다.
2. **사용자 로그인**
    - "Login" 화면으로 이동합니다.
    - 등록된 사용자 이름과 비밀번호를 입력한 후 "Login"을 누릅니다.
    - 로그인이 성공적으로 완료되고 토큰이 생성되었는지 확인합니다.
3. **트랜잭션 전송**
    - "Send Transaction" 화면으로 이동합니다.
    - 유효한 이더리움 주소와 금액을 입력한 후 "Send Transaction"을 누릅니다.
    - 트랜잭션이 성공적으로 전송되고 트랜잭션 목록에 나타나는지 확인합니다.
4. **트랜잭션 조회**
    - "View Transactions" 화면으로 이동합니다.
    - 트랜잭션이 올바르게 목록에 표시되는지 확인합니다.
5. **자산 확인**
    - "Check Assets" 화면으로 이동합니다.
    - "Check Assets" 버튼을 누르고 올바른 자산 잔액과 이더리움 잔액이 표시되는지 확인합니다.
6. **이더리움 잔액 확인**
    - 올바른 이더리움 잔액이 가져와지고 표시되는지 확인합니다.

---

### **코드 스니펫 및 설명**

**1. 사용자 인증 및 상태 관리 (`AppState` 및 `token_required` 데코레이터)**

프론트엔드 (Swift):

```swift
class AppState: ObservableObject {
    @Published var token: String = "" {
        didSet {
            print("Token updated: \(token)")
        }
    }
}

```

백엔드 (Python):

```python
def token_required(f):
    @wraps(f)
    def decorator(*args, **kwargs):
        token = request.headers.get('x-access-token')
        if not token:
            return jsonify({'message': 'Token is missing!'}), 403
        try:
            data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=["HS256"])
            current_user = data['username']
        except jwt.ExpiredSignatureError:
            return jsonify({'message': 'Token has expired!'}), 403
        except jwt.InvalidTokenError:
            return jsonify({'message': 'Token is invalid!'}), 403
        return f(current_user, *args, **kwargs)
    return decorator

```

- **설명**: `AppState`는 사용자의 인증 상태를 관리합니다. `token_required` 데코레이터는 Flask 서버에서 JWT를 검증하여, 보호된 경로에 접근할 때 유효한 토큰이 있는지 확인합니다. 이를 통해 서버는 사용자가 적절히 인증되었는지 확인한 후에만 요청을 처리할 수 있습니다.

**2. 이더리움 잔액 조회 (`AssetView` 및 `/eth_balance` 엔드포인트)**

프론트엔드 (Swift):

```swift
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

```

백엔드 (Python):

```python
@app.route('/eth_balance', methods=['GET'])
@token_required
def get_eth_balance(current_user):
    user = User.query.filter_by(username=current_user).first()
    if user is None:
        return jsonify({"error": "User does not exist"}), 400

    try:
        print(f"Fetching balance for address: {user.ethereum_address}")
        balance = web3.eth.get_balance(user.ethereum_address)
        eth_balance = web3.from_wei(balance, 'ether')
        return jsonify({"eth_balance": float(eth_balance)}), 200
    except Exception as e:
        print(f"Error fetching balance: {str(e)}")
        return jsonify({"error": str(e)}), 500

```

- **설명**: 프론트엔드에서 `fetchEthBalance` 함수는 사용자의 이더리움 잔액을 서버로부터 조회하여 UI에 반영합니다. 백엔드에서는 `/eth_balance` 엔드포인트가 이더리움 주소의 잔액을 조회하여 JSON 형태로 반환합니다. 이 엔드포인트는 Web3 라이브러리를 사용하여 이더리움 블록체인에서 잔액을 직접 가져옵니다.

**3. 거래 수행 및 기록 (`TransactionView` 및 `/transaction` 엔드포인트)**

프론트엔드 (Swift):

```swift
func sendTransaction() {
    guard let url = URL(string: "\(serverURL)/transaction") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(appState.token, forHTTPHeaderField: "x-access-token")
    let body: [String: Any] = ["receiver": receiver, "amount": Double(amount) ?? 0.0]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body)

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Request error:", error)
            return
        }
        guard let data = data else {
            print("No data received")
            return
        }
        if let response = try? JSONDecoder().decode(ResponseMessage.self, from: data) {
            DispatchQueue.main.async {
                self.message = response.message
                self.fetchTransactions()
            }
        } else {
            DispatchQueue.main.async {
                self.message = "Failed to send transaction."
            }
        }
    }.resume()
}

```

백엔드 (Python):

```python
@app.route('/transaction', methods=['POST'])
@token_required
def create_transaction(current_user):
    data = request.get_json()
    print(f"Received data: {data}")
    sender = current_user
    receiver_input = data.get('receiver')
    amount = data.get('amount')

    if not sender or not receiver_input or not amount:
        print(f"Error: Missing data: sender={sender}, receiver={receiver_input}, amount={amount}")
        return jsonify({"error": "Missing data"}), 400

    sender_user = User.query.filter_by(username=sender).first()
    if sender_user is None:
        print(f"Error: User does not exist: sender={sender}")
        return jsonify({"error": "User does not exist"}), 400
    if sender_user.assets < float(amount):
        print(f"Error: Insufficient assets: sender={sender}, assets={sender_user.assets}, amount={amount}")
        return jsonify({"error": "Insufficient assets"}), 400

    receiver_user = User.query.filter(
        (User.username == receiver_input) | (User.ethereum_address == receiver_input)).first()
    receiver_address = receiver_input if not receiver_user else receiver_user.ethereum_address

    if receiver_address == sender_user.ethereum_address:
        print(f"Error: Sender and receiver addresses are the same.")
        return jsonify({"error": "Sender and receiver addresses are the same."}), 400

    txn_hash = create_blockchain_transaction(sender_user.ethereum_address, receiver_address, amount)
    if not txn_hash:
        print(f"Error: Failed to create blockchain transaction")
        return jsonify({"error": "Failed to create blockchain transaction"}), 400

    sender_user.assets -= float(amount)
    if receiver_user:
        receiver_user.assets += float(amount)
    transaction_record = Transaction(
        id=str(uuid.uuid4()),
        sender=sender,
        receiver=receiver_address,
        amount=amount,
        timestamp=datetime.now(timezone.utc),
        txn_hash=txn_hash
    )
    db.session.add(transaction_record)
    db.session.commit()

    return jsonify({"message": "Transaction successful", "txn_hash": txn_hash}), 201

```

- **설명**: 사용자는 이더리움 거래를 수행할 수 있으며, 이는 블록체인에 기록됩니다. 프론트엔드의 `sendTransaction` 함수는 거래 데이터를 서버로 전송하며, 백엔드의 `/transaction` 엔드포인트는 이를 처리하여 블록체인 상에서 거래를 수행합니다. 성공적으로 완료된 거래는 데이터베이스에 기록됩니다.
