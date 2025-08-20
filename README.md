# 🧠 Mental Health Chatbot | Rapport PCD

A compassionate and intelligent mobile application designed to provide immediate, anonymous mental health support and screening through advanced AI.

![Static Badge](https://img.shields.io/badge/Status-Complete-success) ![Static Badge](https://img.shields.io/badge/License-Academic-blue) ![Static Badge](https://img.shields.io/badge/Python-3.10%2B-informational) ![Static Badge](https://img.shields.io/badge/LLM-Llama2-ff69b4) ![Static Badge](https://img.shields.io/badge/NLP-RoBERTa-yellow)

---

## ✨ Features

| Module | Description |
| :--- | :--- |
| **🤖 AI Chatbot** | Empathetic, conversational support powered by a fine-tuned **Llama2-7B** model. |
| **🧪 Screening Tests** | Four specialized mental health assessments for Depression, Anxiety, Irritability, and Fear. |
| **📊 Instant Analysis** | Tests are evaluated in real-time using a **RoBERTa** model for accurate sentiment scoring. |
| **👤 User Profile** | Secure login, personalized profiles, and history tracking. |
| **🎨 Adaptive UI** | Supports Light & Dark themes for a comfortable user experience. |
| **📚 Resource Library** | Access to educational content on mental health and well-being. |

---

## 🛠️ Architecture & Tech Stack

### 🤖 Chatbot Module
- **Base Model:** `Llama2-7B-Chat` from Meta
- **Fine-Tuning:** Performed using **PEFT** (Parameter-Efficient Fine-Tuning) with the **LoRA** technique.
- **Libraries:** Hugging Face `Transformers`, `PEFT`, `TRL`, `PyTorch`
- **Goal:** To create a supportive, context-aware conversational agent specialized in mental health dialogue.

### 🧪 Test Module
- **Model:** `RoBERTa` (Robustly Optimized BERT Pretraining Approach)
- **Task:** Sentiment Analysis & Score Calculation for user test responses.
- **Reason for Choice:** Superior performance with complex sentences and nuanced sentiment compared to other models like BERT.

### ⚙️ Backend & Deployment
- **Framework:** `Flask` (Python) for a lightweight RESTful API.
- **Function:** Handles HTTP requests, processes messages through the AI models, and returns responses/scores.
- **Communication:** The mobile app communicates with the Flask server to access the AI capabilities.

### 📱 Frontend (Implied)
- A mobile application (Android/iOS) built with a framework like Flutter, React Native, or native development.

---

## 🚀 How It Works

### Chatbot Flow
1. User types a message in the mobile app.
2. The app sends an HTTP request to the Flask server.
3. The server processes the message using the fine-tuned Llama2 model.
4. The generated response is sent back to the app.
5. The response is displayed to the user.

### Test Flow
1. User selects a test (e.g., Depression Test).
2. The app presents questions and multiple-choice answers.
3. Upon completion, the answers are sent to the Flask server.
4. The RoBERTa model analyzes the responses and calculates a score.
5. The score is returned and saved to the user's profile.

---

## 🔬 Model Fine-Tuning Pipeline

The process we followed to adapt Llama2 for our specific use case:

1.  **Import Libraries** (`PEFT`, `Transformers`, `TRL`)
2.  **Load Dataset** from Hugging Face.
3.  **Load Base Model** (`Llama2-7b-chat`) and its **Tokenizer**.
4.  **Define Training Parameters** (epochs, learning rate, batch size).
5.  **Train the Model** using LoRA for efficient fine-tuning.
6.  **Merge LoRA adapters** with the base model for optimization.
7.  **Save & Deploy** the final model to Hugging Face Hub and our Flask server.

---

## 👥 The Team

This project was successfully realized by:
- **Omheni Tayeb**
- **Hlaili Ayoub**
- **Khelil Safouene**

---

## 🙏 Acknowledgments

We are profoundly grateful to:
- **Dr. Aroua Hedhili** for her exceptional guidance and supervision.
- The **Tunisian Association for the Promotion and Prevention of Mental Health (ATPPSM)** for their crucial topic proposal and unwavering support.
- Our families and friends for their invaluable suggestions and encouragement.
- The reviewing **JURY** for their time and consideration.

---

## ⚠️ Disclaimer

**This application is an academic project (Rapport PCD) and is not a certified medical tool. It is designed for screening and support purposes only and is not a substitute for professional diagnosis or treatment from a qualified healthcare provider. Always seek the advice of a mental health professional with any questions you may have.**
