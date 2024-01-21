import Foundation

protocol LoaderService {
    func loadData() async throws
}

final class ImageLoaderService: LoaderService {
    private let finalImageName: String = "generatedAvatar.jpg"
    private let testLink: String = ""
    private(set) var loadedURL: String = ""
    
    func loadData() async throws  {
        guard let imageUrl = URL(string: testLink) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: imageUrl)
            
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory,
                                                                 in: .userDomainMask,
                                                                 appropriateFor: nil,
                                                                 create: true)
            let fileURL = documentsDirectory.appendingPathComponent(finalImageName)
            try data.write(to: fileURL)
            self.loadedURL = fileURL.absoluteString
        } catch {
            self.loadedURL = ""
            throw error
        }
    }
}
