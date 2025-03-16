import Foundation

func getModelFilenames() -> [String]? {
    // Search for all files with a specific extension in the bundle
    guard let resourceURLs = Bundle.main.urls(forResourcesWithExtension: "usdz", subdirectory: nil) else {
        print("No model files found in bundle")
        return nil
    }
    
    // Extract the filenames without the extension
    let filenames = resourceURLs.map { $0.deletingPathExtension().lastPathComponent }
    
    return filenames
}
