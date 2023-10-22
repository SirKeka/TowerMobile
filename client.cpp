#include "client.h"

#include <QVariantList>

Client::Client()
{
    m_pSocket = new QTcpSocket;
    connect (m_pSocket, &QTcpSocket::readyRead, this, &Client::slotReadyRead);
    connect (m_pSocket, &QTcpSocket::disconnected, m_pSocket, &QTcpSocket::deleteLater);
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
    m_pSocket->write(data);
}

void Client::connectToServer(QString &hostName, qint16 port)
{
    m_pSocket->connectToHost(hostName, port);
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

void Client::slotReadyRead()
{
    QDataStream in;
    in.setVersion(QDataStream::Qt_6_6);
}
