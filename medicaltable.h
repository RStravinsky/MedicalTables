#ifndef MEDICALTABLE_H
#define MEDICALTABLE_H

#include <QObject>
#include <QQmlListProperty>
#include <QtXlsx>

class MedicalTable : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath READ imagePath NOTIFY pathChanged)
    Q_PROPERTY(QString imageState READ imageState WRITE setState NOTIFY stateChanged)
    Q_PROPERTY(bool animationActive READ animationActive NOTIFY animationActiveChanged)
    Q_PROPERTY(QString tableColor READ color NOTIFY colorChanged)

public:
    explicit MedicalTable(QObject *parent = 0);
    MedicalTable(QString path, QString state, bool animationActive, QString color): m_imagePath(path),
    m_imageState(state), m_animationActive(animationActive), m_color(color){}

    Q_INVOKABLE inline QString imagePath() const {
        return m_imagePath;
    }

    Q_INVOKABLE inline QString imageState() const {
        return m_imageState;
    }

    Q_INVOKABLE inline void setState(QString iState) {
        m_imageState = iState;
    }

    Q_INVOKABLE inline bool animationActive() const {

        return m_animationActive;
    }

    inline QString color() const {
        return m_color;
    }

public slots:

signals:
    void pathChanged( QString path );
    void stateChanged( QString state );
    void animationActiveChanged( bool active );
    void colorChanged( QString color );

private:
    QString m_imagePath;
    QString m_imageState;
    bool m_animationActive;
      QString m_color;
};

#endif // MEDICALTABLE_H
