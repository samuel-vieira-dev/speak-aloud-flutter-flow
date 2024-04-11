const admin = require("firebase-admin/app");
admin.initializeApp();

const speechAceIntermediary = require("./speech_ace_intermediary.js");
exports.speechAceIntermediary = speechAceIntermediary.speechAceIntermediary;
