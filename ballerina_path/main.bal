import ballerina/http;

service /ai on new http:Listener(8080) {
    resource function get foo () returns string {
        return "Hello from ballerina path!";
    }
    
}
