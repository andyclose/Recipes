# Recipes

### Steps to Run the App
- Launch Xcode
- Open `Recipes.xcproject`
- Build/Run in simulator for iOS 17+

### Focus Areas: 
What specific areas of the project did you prioritize? 
- Fetching Data
- Data Integration tests
- UI
- Navigate to `sourceURL` web page. Tangent that I spent extra time on & threw out since it wasn't required, just a nice to have. :D 
- Refinement + addition of missing requirements

Why did you choose to focus on these areas?
- This provided most of the MVP

### Time Spent: 
Approximately how long did you spend working on this project? 
- Nov 7 ~5 hours - basic functionality & display
- Nov 8 ~6 hours - navigation to webView (`sourceURL`), caching & misc

How did you allocate your time?
- Spent time in the order listed in 'Focus Areas' above
- Most of the extra time was spent on navigation to a webView & caching

### Trade-offs and Decisions: 
Did you make any significant trade-offs in your approach?
- Not that I'm aware of 

### Weakest Part of the Project: 
What do you think is the weakest part of your project?
- Architecture & Performance
- I'm still fairly new to SwiftUI but wanted to do the whole project in SwiftUI.  There's a lot of information about how to do particular things online but not necessarily good Architectural practices (at least in examples I've seen) for SwiftUI. I attempted to break functionality out into several different classes/structs so things were more modular & could potentially be maintained more easily.
- Performance isn't bad but I did not spend time testing with a restricted network. A little more about networking performance is mentioned below in 'Additional Information'.

### External Code and Dependencies: 
Did you use any external code, libraries, or dependencies?
- No.

### Additional Information: 
Is there anything else we should know? 
- Image caching is kinda hacky but I didn't want to import/implement a 3rd party library
- Even though the image fetching is done async, I believe it is still all done up front.  
I'd need to spend more time with to verify, debug & come up with a solution that allowed for fetching images only for the cells being displayed.
- Error handling & logging should be added to a production app.  I left some comments/TODOs regarding error handling & logging.  Unless there is something wrong with connectivity or service errors, there's not much point in notifying the user as they can't do anything anyway. For those errors it might be nice to alert them to an issue & assure them that it will be resolved as quickly as possible.
- Unit Tests are lacking but aside from UI there is not a lot of 'business' to apply tests to.  I did attempt to use the new Testing framework instead of XCTest.
- I would have liked to make the section headers with the Cuisine type sticky & may play with that some more. In the initial implementation sections are in alphabetical order with their respective recipes under them.
- I may play with building out a detail view as well. I started trying to get a webView to load with the `sourceURL` as the detal view but ended up spending too much time on it when it wasn't part of the MVP.  It would be kind of nice to show that as well as the YouTube video if it exists.