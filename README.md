Welcome to this NITS Briefing Project. 

To visualize the final result in a simulator, please open project with XCODE (Mac Computer). To start, run the app with CMD + R having selected your desired Simulator Device. 



iOS NITS BRIEFING APP

VIDEO DEMO:

https://youtu.be/wcjdKeqasWU

DESCRIPTION:

    iOS Application written in Swift, using the SwifUI Framework.

    Context: Flight crew can encounter many different unplanned scenarios and emergencies during a flight. In order to react fast and correctly andd deal with the situation, communication between the flight deck and cabin crew is crucial. This is why airlines have standardized protocols of communication, such as the NITS Briefing, to minimize reaction time and maximize clear communication. NITS stands for "Nature of Emergency", "Intentions", "Time Available", and "Specific Instructions" and provide the communication in case of an emergency with structure that can passed on from flight  deck to  cabin crew clearly and time efficiently. Until now, the procedure to conduct a NITS Briefing is as follows:
            1. Pilot makes a PA alerting crew of an emergency: "Purser to the flight Deck"
            2. Flight Purser accesses the flight deck, carrying a pen and paper to take notes. Cabin crew go to their positions to await  instructions. 
            3. Pilot gives briefing to Purser, who writes down briefing on paper. Time available is recorded looking at watch and written down on paper. 
            4. Purser makes an all call, providing rest of crew with the NITS Briefing information. 
        This app is an attempt to solve problems involved in having to write the details of an emergency on a piece of paper in a situation where time is of the essence and the stress factor might be high, such as looking for a pen/paper, writing clearly, and keeping track of time elapsed since briefing was given by the captain. The app is structured in different Navigation Tabs that represent the stages of the NITS Briefing, that the user can use to input the  briefing information. At the end, the  user obtains a Briefing Sheet with the input data, the real Time Available in form of a countdown, and specific instructions that the app will output considering the emergency and aircraft types.

    WELCOME/HOME SCREEN:
        This is what the user sees when first opening the app. It contains a welcome message, instructions to start and two buttons at the top. The settings button lets the user choose the aircraft type, as each type  will require different safety procedures. The reset button allows the user to reset all input data in order to start a fresh briefing.
    NATURE Tab: 
        The user can choose the emergency category from a picker wheel. He can add details into a Text Editor box. To move on to the next step, the next tab, "Intentions", shall be pressed. 
    INTENTIONS Tab:
        Similar  to the previous tab, here the user can choose an overall intention of the captain in a picker wheel and type in any additional details into a text box. 
    TIME AVAILABLE Tab:
        Using another picker wheel, the user can choose how much time there is to deal with the situation at hand, ranging between 1 and 59 minutes. He then can press the play button, that initiates a countdown.
    SPECIFIC INSTRUCTIONS Tab:
        Any additional instructions from the captain specific to the present situation will be typed into the Text Editor in this View. A representation of the available time is now visible at the top, counting down. At the bottom the user can submit the data tapping the  "Submit Data" button. This will display the complete Briefing Sheet.
    BRIEFING SHEET:
        The Briefing Sheet includes all informations that were input in the briefing in a template, that can be read to  the crew  during the all-call. Still, time keeps counting down, and allows the Purser to give the crew an accurate information of the time available. 
        If a certain type of aircraft, combined with a certain emergency category requires a specific action to be taken, this will be  put out at the end of the message as specific instructions. An example of this is a "Ditching" (Emergency Landing on water) situation on a Boeing 777-300 Aircraft: L3 and R3 doors are required to disarm emergency slides before ditching. 

    APP ARCHITECTURE:
        Each of the views are coded in their own file, that can be found in the Controller Group. Each ViewController gets its own Model File in the Model Group, where the data pertaining to each ViewController is stored and updated. 
        The informations contained in the individual Model files is shared to other Views, such as the Briefing sheet, with SwiftUI's State Management system, using the ObservableObject protocol, and the @StateObject and @EvironmentObbject property wrappers. View States are locally managed with the @State property wrapper to toggle states within the view.
