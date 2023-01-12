```mermaid
sequenceDiagram
    participant C as Client
    participant RU as Rackup
    participant AC as Application Class (app.rb)


    Note left of C: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 
    autonumber
    C->>RU: Sends `HTTP Request - Post (/sort-name) with: Joe,Alice,Zoe,Julia,Kieran`
   
    activate RU
    Note over RU: Sinatra Application: Main entry point of the program
    
    RU->>AC: passes `HTTP Request - Post (/sort-name)`
    rect rgb(62, 107, 33)
    AC->>AC: Handles sending the request to the correct route blockmethod base on the HTTP method.
    Note right of AC: Executes and returns  Post method (/sort-name)
    AC-->>RU: Sends response (/sort-name) result
    deactivate RU
    end
    RU-->>C: HTTP Response with result: “Alice,Joe,Julia,Kieran,Zoe” 
    
```


<!-- 
This diagram shows how different parts of a computer program work together.
It shows the steps that happen when someone uses the program. 
In the specific case it is showing how a web application handles a request from a user. 

It starts with a request being made to the program (by someone visiting a website), 
then it goes to the main entry point of the program called "rackup", then it gets passed on to the "Application class" which is responsible for figuring out where to send the request. 

After that, it goes to the "route block" which carries out the specific tasks needed to complete the request and sends a response back to the user.


-->