# import Judge.py
import socket
import sys
import multiprocessing
import thread
import logging
import Judge

PORT=int(sys.argv[1])
HOST=''


def clientthread(conn):
    #Sending message to connected client
    conn.send('Welcome to the server.') #send only takes string
    while True:
        reload(Judge)          
        #Receiving from client
        data = conn.recv(1024)
        print data
        
        if not data.rstrip(): 
            break

        p = multiprocessing.Process(target=Judge.judge, args=(data,))
        p.start()
     
             
    conn.close()

class server:
    def __init__(self,PORT,HOST):
        self.s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        self.host=HOST
        self.port=PORT
        print "SOCKET Created"
        try: 
            self.s.bind((HOST,PORT))
            print "Socket joined", PORT
        except socket.error, msg:
            print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
            sys.exit()
        self.run()

    def run(self):
        self.s.listen(10)
        while 1:
            try:
                conn, addr = self.s.accept()
                print 'Connected with ' + addr[0] + ':' + str(addr[1])
                thread.start_new_thread(clientthread ,(conn,))
            except KeyboardInterrupt:
                print "Socket closing"
                sys.exit()

                

     
if __name__ == '__main__':
    logging.basicConfig(filename='server.log',format='%(asctime)s:%(levelname)s:%(message)s', level=logging.DEBUG)
    serv=server(PORT,HOST)
        


