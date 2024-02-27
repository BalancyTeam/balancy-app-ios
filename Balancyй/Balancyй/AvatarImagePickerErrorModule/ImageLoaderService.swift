import Foundation

protocol LoaderService {
    func loadImage() async throws
}

final class ImageLoaderService: LoaderService {
    private let finalImageName: String = "generatedAvatar.jpg"
    private let testLink: String = ""
    private(set) var loadedURL: String = ""
    
    func loadImage() async throws  {
        guard let imageUrl = URL(string: testLink) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        var fileURL: URL?
        do {
            let (data, _) = try await URLSession.shared.data(from: imageUrl)
            
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory,
                                                                 in: .userDomainMask,
                                                                 appropriateFor: nil,
                                                                 create: true)
            fileURL = documentsDirectory.appendingPathComponent(finalImageName)
            try data.write(to: fileURL!)
        } catch {
            self.loadedURL = ""
            throw error
        }
        
        if let absoluteURL = fileURL?.absoluteString {
            self.loadedURL = absoluteURL
        }
    }
}
