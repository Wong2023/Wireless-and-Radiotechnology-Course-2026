import socket

HOST = "127.0.0.1"
PORT = 5000

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("Server is waiting for connection...")

conn, addr = server.accept()
print("Connected to:", addr)

while True:
    try:
        data = conn.recv(1024)

        if not data:
            break

        print("Received:", data.decode())

    except:
        print("Connection closed")
        break

conn.close()