const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const FormData = require("form-data");

exports.speechAceIntermediary = functions
  .region("us-west1")
  .https.onCall(async (data, context) => {
    // Adicione async aqui para permitir o uso de await dentro da função
    const uploadURL = data.uploadURL;
    const text = data.text;
    const userId = data.userId;

    try {
      // Baixa o arquivo de áudio do uploadURL
      const audioResponse = await axios.get(uploadURL, {
        responseType: "arraybuffer",
      });

      // Cria o FormData com o arquivo de áudio e os outros parâmetros necessários
      const formData = new FormData();
      formData.append("user_audio_file", audioResponse.data, "audio.mp3");
      formData.append("text", text);
      formData.append("include_unknown_words", "1");

      // Configuração da requisição para a API da SpeechAce
      const speechAceResponse = await axios.post(
        `https://api.speechace.co/api/scoring/text/v9/json?key=QkY5kzFVjyOTTKKxCpsubNJb0FScjl83l3vOnnxgzxoe2sStMAVyfh4SOo1dSTpPDd6raan9pRX6j20EhNJ5ukQ9IhPRijMveOSt18RdyaTAVf3s7mT32llA%2FSlEofBY&dialect=en-us&user_id=${userId}`,
        formData,
        {
          headers: {
            ...formData.getHeaders(),
            // Outros cabeçalhos necessários, como chave de API, se aplicável
          },
        },
      );

      // Retorna a resposta da SpeechAce API
      return { data: speechAceResponse.data }; // Modificado para retornar um objeto com a resposta
    } catch (error) {
      console.error("Erro ao processar a requisição:", error);
      throw new functions.https.HttpsError(
        "unknown",
        "Erro ao processar a requisição",
        error,
      );
    }
  });
