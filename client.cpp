#include "client.h"

#include <QVariantList>

Client::Client()
{
    m_pSocket = new QTcpSocket;
    connect (m_pSocket, &QTcpSocket::readyRead, this, &Client::slotReadyRead);
    connect (m_pSocket, &QTcpSocket::disconnected, m_pSocket, &QTcpSocket::deleteLater);
    connect (m_pSocket, &QTcpSocket::errorOccurred, this, &Client::onError);
}

void Client::sendToServer(e_MsgType msgType, QVariantList input)
{
    QByteArray data;
    data.clear();
    QDataStream out(&data, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_6_6);
    out<<qint16(0);
    out<<msgType;
    out<<input;
    out.device()->seek(0);
    out<<qint16(data.size()-sizeof(qint16));
    qDebug()<<m_pSocket->write(data);
}

void Client::connectToServer(QHostAddress hostName, qint16 port)
{
    m_pSocket->connectToHost(hostName, 2323);
}

void Client::login(QString &name, QString &pass)
{
    QVariantList credentianals;
    credentianals.append(name);
    credentianals.append(pass);
    sendToServer(e_MsgType::loginRequest, credentianals);
}

void Client::logout()
{
    sendToServer(e_MsgType::logoutRequest);
}

void Client::reg(QString &name, QString &birthDate, QString &login, QString &pass)
{
    QVariantList registerInfo;
    registerInfo.append(name);
    registerInfo.append(birthDate);
    registerInfo.append(login);
    registerInfo.append(pass);
    sendToServer(e_MsgType::registrationRequest, registerInfo);
}

void Client::slotReadyRead()
{
    QDataStream in;
    in.setVersion(QDataStream::Qt_6_6);
}

void Client::onError(QAbstractSocket::SocketError socketError)
{
    switch (socketError) {
    case QAbstractSocket::RemoteHostClosedError:
        break;
    case QAbstractSocket::HostNotFoundError:
        qDebug()<<"Error, The host was not found";
        break;
    case QAbstractSocket::ConnectionRefusedError:
        qDebug()<<"Error, The connection was refused by the peer.";
        break;
    default:
        qDebug()<<"Error, The following error occurred: "<<m_pSocket->errorString();
    }
}
