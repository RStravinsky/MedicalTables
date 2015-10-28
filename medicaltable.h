#ifndef MEDICALTABLE_H
#define MEDICALTABLE_H

#include <QDebug>
#include <QObject>
#include <QQmlListProperty>

class MedicalTable : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath READ imagePath WRITE setImagePath NOTIFY pathChanged)
    Q_PROPERTY(QString imageState READ imageState WRITE setImageState NOTIFY stateChanged)
    Q_PROPERTY(bool animationActive READ animationActive WRITE setAnimationActive NOTIFY animationActiveChanged)

public:
    explicit MedicalTable(QObject *parent = 0);
    MedicalTable(QString path, QString state, bool animationActive): m_imagePath(path),
    m_imageState(state), m_animationActive(animationActive){}

    inline QString imagePath()
    {
        qDebug() << "imagePath()" << endl;
        return m_imagePath;
    }

    inline void setImagePath( const QString & path )
    {
        qDebug() << "setImagePath()" << endl;

        if ( path != m_imagePath )
        {
           m_imagePath = path;
           emit pathChanged( path );
        }
    }

    inline QString imageState()
    {
        qDebug() << "imageState()" << endl;
        return m_imageState;
    }

    inline void setImageState( const QString & state )
    {
        qDebug() << "setImageState()" << endl;
        if ( state != m_imageState )
        {
           m_imageState = state;
           emit stateChanged( state );
        }
    }

    inline bool animationActive()
    {
        qDebug() << "animationActive()" << endl;
        return m_animationActive;
    }

    inline void setAnimationActive( const bool & active )
    {
        qDebug() << "setAnimationActive()" << endl;

        if ( active != m_animationActive )
        {
           m_animationActive = active;
           emit animationActiveChanged( active );
        }
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
