#ifndef CLIENT_H
#define CLIENT_H
#include <QTcpSocket>


class Client: public QObject
{
    Q_OBJECT
public:
    Client();

private:
    QTcpSocket *m_pSocket;
    QByteArray m_Data;
    enum class e_MsgType
    {
        text =0,
        loginRequest=1,
        logoutRequest=2,
        registrationRequest=3
    };

    void sendToServer(e_MsgType msgType=e_MsgType::text, QVariantList Data = QVariantList());

public:
    void connectToServer(QString& hostName, qint16 port);
    void login(QString& name, QString& pass);
    void logout();

public slots:
    void slotReadyRead();
};

#endif // CLIENT_H
