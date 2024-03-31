/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */
const functions = require("firebase-functions/v2/firestore");
const tf = require("@tensorflow/tfjs");
const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// Convert the model to TensorFlow Lite and upload it to Cloud Storage
const source = ml.TFLiteGCSModelSource.from_saved_model('C:\Users\PC\Downloads\model');
const tfliteFormat = ml.TFLiteFormat({ modelSource: source });
const model = ml.Model({
  displayName: "testmodel",  // This is the name you use from your app to lo ad the model.
  tags: ["examples"],            // Optional tags for easier management.
  modelFormat: tfliteFormat
});

// Add the model to your Firebase project and publish it
ml.createModel(model)
  .then((newModel) => {
    console.log('Model created:', newModel);
    return ml.publishModel(newModel.modelId);
  })
  .then(() => {
    console.log('Model published successfully');
  })
  .catch((error) => {
    console.error('Error:', error);
  });



exports.api = onRequest((request, response) => {
    logger.info("Hello logs!", {structuredData: true});
    response.send("Hello from Firebase!");
  });
 