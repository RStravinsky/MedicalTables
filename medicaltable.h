#ifndef MEDICALTABLE_H
#define MEDICALTABLE_H

#include <QObject>
#include <QQmlListProperty>

class MedicalTable : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath READ imagePath NOTIFY pathChanged)
    Q_PROPERTY(QString imageState READ imageState WRITE setState NOTIFY stateChanged)
    Q_PROPERTY(bool animationActive READ animationActive NOTIFY animationActiveChanged)
    Q_PROPERTY(QString tableColor READ tableColor WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QString tableText READ tableText WRITE setText NOTIFY textChanged)

public:
    explicit MedicalTable(QObject *parent = 0);
    MedicalTable(QString path, QString state, bool animationActive, QString color = "transparent", QString text = ""): m_imagePath(path),
    m_imageState(state), m_animationActive(animationActive), m_color(color), m_text(text){}

    inline QString imagePath() const {
        return m_imagePath;
    }

    inline QString imageState() const {
        return m_imageState;
    }

    inline bool animationActive() const {

        return m_animationActive;
    }

    inline QString tableColor() const {
        return m_color;
    }

    inline QString tableText() const {
        return m_text;
    }

    Q_INVOKABLE void setColor( QString color ) {
        m_color = color;
    }

    Q_INVOKABLE void setState( QString state ) {
        m_imageState = state;
    }

    Q_INVOKABLE void setText( QString text ) {
        m_text = text;
    }


public slots:

signals:
    void pathChanged( QString path );
    void stateChanged( QString state );
    void animationActiveChanged( bool active );
    void colorChanged( QString color );
    void textChanged( QString text );

private:
    QString m_imagePath;
    QString m_imageState;
    bool m_animationActive;
    QString m_color;
    QString m_text;
};

#endif // MEDICALTABLE_H
