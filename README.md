# 🧊 ChillBot  
**Smarter food tracking.**

ChillBot started as a simple idea: **Can we reduce food waste with AI?**  

It has now evolved into a complete intelligent system that:
- Automatically identifies food items from screen capture inside the fridge
- Extracts or estimates expiration dates using OCR  
- Alerts for items nearing expiration  
- Suggests personalized recipes using expiring items  
- Generates AI-based recipe images for better visualization  

---

## 🛠️ Technologies Used

| Tech | Purpose |
|------|---------|
| `gemini-2.0-flash` | Product identification and OCR |
| `gemini-2.0-flash-exp-image-generation` | AI-based recipe image generation |
| **Firebase Firestore & Storage** | Data storage and image handling |
| **Flutter** | Web dashboard + Android app for seamless UI and camera integration |

---

## 📱 App Preview

### 🧊 Dashboard  
> View fridge inventory & recipe suggestions based on items expiring soon  
<img width="1440" alt="Dashboard Screenshot" src="https://github.com/user-attachments/assets/c4ee9b3b-d034-4ecb-bb98-8b89d653f4b6" />

---

### 🍳 Recipe Details  
> Step-by-step cooking instructions with ingredients + AI-generated visual preview  
<img width="1440" alt="Recipe Page Screenshot" src="https://github.com/user-attachments/assets/aa738a71-c4c9-40d3-b8c9-3eefa24bc11a" />

---

## 🚀 How It Works

1. **Capture:** Use the Android app to continuously capture fridge contents.
2. **Identify:** Gemini model identifies food items and estimates expiration dates.
3. **Alert:** Items nearing expiration are flagged.
4. **Inspire:** Recipe suggestions are generated using those items.
5. **Visualize:** Recipes come with step-by-step instructions *and* AI-generated images.

---
