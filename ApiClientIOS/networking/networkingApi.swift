import Foundation

public struct Networking {
    var urlSession: URLSession!
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func sendPostRequest(
        from url: URL,
        body: Data,
        token: String? = nil,
        completionHandler: @escaping (Result<Data, Error>, Int) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField:"Content-Type")
        if let tkn = token {
            request.setValue("Bearer \(tkn)", forHTTPHeaderField:"Authorization")
        }
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(error!), 500)
                return
            }
            var statusCode: Int = 500
            if let httpResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode
            }
            completionHandler(.success(data), statusCode)
        }
        task.resume()
    }
}
