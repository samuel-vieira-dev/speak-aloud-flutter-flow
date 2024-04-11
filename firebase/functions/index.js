const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions
  .region("us-west1")
  .auth.user()
  .onDelete(async (user) => {
    let firestore = admin.firestore();
    let userRef = firestore.doc("users/" + user.uid);
  });
