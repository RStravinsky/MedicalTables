#ifndef MEDICALTABLE_H
#define MEDICALTABLE_H

#include <QDebug>
#include <QObject>
#include <QQmlListProperty>

class MedicalTable : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath READ imagePath NOTIFY pathChanged)
    Q_PROPERTY(QString imageState READ imageState NOTIFY stateChanged)
    Q_PROPERTY(bool animationActive READ animationActive NOTIFY animationActiveChanged)

public:
    explicit MedicalTable(QObject *parent = 0);
    MedicalTable(QString path, QString state, bool animationActive): m_imagePath(path),
    m_imageState(state), m_animationActive(animationActive){}

    inline QString imagePath() const {
        return m_imagePath;
    }

    inline QString imageState() const {
        return m_imageState;
    }

    inline bool animationActive() const {

        return m_animationActive;
    }

public slots:

signals:
    void pathChanged( QString path );
    void stateChanged( QString state );
    void animationActiveChanged( bool active );

private:
    QString m_imagePath;
    QString m_imageState;
    bool m_animationActive;
};

#endif // MEDICALTABLE_H
