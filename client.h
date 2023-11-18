#ifndef CLIENT_H
#define CLIENT_H
#include <QTcpSocket>


class Client: public QObject
{
    Q_OBJECT
public:
    Client();

private:
    QTcpSocket* m_pSocket;
    enum class e_ClientMsgType
    {
        text =0,
        loginRequest=1,
        logoutRequest=2,
        registrationRequest=3
    };

    enum class e_ServerMsgType                        //тип сообщения и команды
    {
        text =0,
        loginSucsessful=1,
        loginDenied=2,
        logoutSucsessful=3,
        logoutDenied=4,
        registrationSucsessful=5,
        registrationDenied=6
    };

    void sendToServer(e_ClientMsgType msgType, QVariantList);
    void sendToServer(e_ClientMsgType msgType);

public:
    void connectToServer(QHostAddress hostName, qint16 port);
    void login(QString& name, QString& pass);
    void logout();
    void reg(QString &name, QString &BirthDate, QString &login, QString &pass);

public slots:
    void slotReadyRead();
    void onError(QAbstractSocket::SocketError socketError);
};

#endif // CLIENT_H
