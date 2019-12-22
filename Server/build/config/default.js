"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var databaseData;
if (process.env.NODE_ENV === 'production') {
    databaseData = {
        mongoURI: "mongodb+srv://hasitha:Freedom6@cluster0-zcrw6.gcp.mongodb.net/test?retryWrites=true&w=majority"
    };
}
else {
    databaseData = {
        mongoURI: "mongodb://localhost:27017/flutter-insta-clone"
    };
}
exports.default = databaseData;
// mongodb://localhost:27017/stack-over-flow
// mongodb+srv://hasitha:Freedom6@cluster0-zcrw6.gcp.mongodb.net/test?retryWrites=true&w=majority
