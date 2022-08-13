from flask import Flask
from flask import request, send_file
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from os import remove
from os.path import exists

app = Flask(__name__)
CORS(app, support_credentials=True)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:root@localhost:3306/camrstidb'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_COMMIT_TEARDOWN'] = True
db = SQLAlchemy(app)


class Example(db.Model):
    __tablename__ = 'basicinfo'
    sampleId = db.Column('sampleId', db.Unicode(20), primary_key=True)
    sampleType = db.Column('sampleType', db.Unicode(20))
    sampleSource = db.Column('sampleSource', db.Unicode(30))
    samplingYear = db.Column('samplingYear', db.DATE)
    samplingPeople = db.Column('samplingPeople', db.Unicode(6))
    imageId = db.Column('imageId', db.JSON)
    sampleDescribe = db.Column('sampleDescribe', db.UnicodeText)
    sampleExplain = db.Column('sampleExplain', db.UnicodeText)
    experimentId = db.Column('experimentId', db.JSON)

    def __init__(self, sampleId, sampleType, sampleSource, samplingYear, samplingPeople, imageId,
                 sampleDescribe, sampleExplain, experimentId):
        self.sampleId = sampleId
        self.sampleType = sampleType
        self.sampleSource = sampleSource
        self.samplingYear = samplingYear
        self.samplingPeople = samplingPeople
        self.imageId = imageId
        self.sampleDescribe = sampleDescribe
        self.sampleExplain = sampleExplain
        self.experimentId = experimentId

    def to_json(self, ):
        return {
            'sampleId': self.sampleId,
            'sampleType': self.sampleType,
            'sampleSource': self.sampleSource,
            'samplingYear': self.samplingYear,
            'samplingPeople': self.samplingPeople,
            'imageId': self.imageId,
            'sampleDescribe': self.sampleDescribe,
            'sampleExplain': self.sampleExplain,
            'experimentId': self.experimentId
        }


class MetalPhase(db.Model):
    __tablename__ = 'metalphase'
    sampleId = db.Column('sampleId', db.Unicode(20), primary_key=True)
    metalPhase = db.Column('metalPhase', db.Unicode(2))
    sfFullImg = db.Column('sfFullImg', db.Unicode(20))
    sfDescription = db.Column('sfDescription', db.UnicodeText)
    sfEquipment = db.Column('sfEquipment', db.Unicode(10))
    sfZoom = db.Column('sfZoom', db.Unicode(5))
    sfPhotoMod = db.Column('sfPhotoMod', db.Unicode(4))
    sfImgList = db.Column('sfImgList', db.JSON)

    def to_json(self):
        return {
            'sampleId': self.sampleId,
            'metalPhase': self.metalPhase,
            'sfFullImg': self.sfFullImg,
            'sfDescription': self.sfDescription,
            'sfEquipment': self.sfEquipment,
            'sfZoom': self.sfZoom,
            'sfPhotoMod': self.sfPhotoMod,
            'sfImgList': self.sfImgList
        }


class MinePhase(db.Model):
    __tablename__ = 'minephase'
    sampleId = db.Column('sampleId', db.Unicode(20), primary_key=True)
    minePhase = db.Column('minePhase', db.Unicode(2))
    mpFullImg = db.Column('mpFullImg', db.Unicode(20))
    mpDescription = db.Column('mpDescription', db.UnicodeText)
    mpEquipment = db.Column('mpEquipment', db.Unicode(10))
    mpZoom = db.Column('mpZoom', db.Unicode(5))
    mpPhotoMod = db.Column('mpPhotoMod', db.Unicode(4))
    mpImgList = db.Column('mpImgList', db.JSON)

    def to_json(self):
        return {
            'sampleId': self.sampleId,
            'minePhase': self.minePhase,
            'mpFullImage': self.mpFullImg,
            'mpDescription': self.mpDescription,
            'mpEquipment': self.mpEquipment,
            'mpZoom': self.mpZoom,
            'mpPhotoMod': self.mpPhotoMod,
            'mpImgList': self.mpImgList
        }


class ElectronMicroPhase(db.Model):
    __tablename__ = 'electron_micro'
    sampleId = db.Column('sampleId', db.Unicode(20), primary_key=True)
    emPhase = db.Column('emPhase', db.Unicode(2))
    emFullImg = db.Column('emFullImg', db.Unicode(20))
    emDescription = db.Column('emDescription', db.UnicodeText)
    emEquipment = db.Column('emEquipment', db.Unicode(10))
    emZoom = db.Column('emZoom', db.Unicode(5))
    emPhotoMod = db.Column('emPhotoMod', db.Unicode(4))
    emImgList = db.Column('emImgList', db.JSON)

    def to_json(self):
        return {
            'sampleId': self.sampleId,
            'emPhase': self.emPhase,
            'emFullImg': self.emFullImg,
            'emDescription': self.emDescription,
            'emZoom': self.emZoom,
            'emPhotoMod': self.emPhotoMod,
            'emEquipment': self.emEquipment,
            'emImgList': self.emImgList
        }


class PhaseGraphic(db.Model):
    __tablename__ = 'om_graphic'
    imageIndex = db.Column('imageIndex', db.Unicode(20), primary_key=True)
    omDescription = db.Column('omDescription', db.UnicodeText)
    omEquipment = db.Column('omEquipment', db.Unicode(10))
    omZoom = db.Column('omZoom', db.Unicode(5))
    omPhotoMod = db.Column('omPhotoMod', db.Unicode(4))

    def to_json(self):
        return {
            'imageIndex': self.imageIndex,
            'omDescription': self.omDescription,
            'omEquipment': self.omEquipment,
            'omZoom': self.omZoom,
            'omPhotoMod': self.omMod
        }


@app.route('/api/request/base', methods=['GET'])
def get_base():  # put application's code here
    examples = Example.query.all()
    t = {str(i): examples[i].to_json() for i in range(len(examples))}
    t["length"] = str(len(examples))
    return t


@app.route('/api/request/phase/<sampleId>', methods=['GET'])
def get_oom(sampleId):
    metal_phase = MetalPhase.query.filter_by(sampleId=sampleId).first()
    mine_phase = MinePhase.query.filter_by(sampleId=sampleId).first()
    em_phase = ElectronMicroPhase.query.filter_by(sampleId=sampleId).first()
    t = {'metalPhaseData': metal_phase.to_json(),
         'minePhaseData': mine_phase.to_json(),
         'emPhaseData': em_phase.to_json()
         }
    return t


@app.route('/api/request/img/<imgid>', methods=['GET'])
def get_img(imgid):
    return send_file('./static/img/{}'.format(imgid), mimetype='image/jpeg')


@app.route('/api/request/delete', methods=['POST'])
def delete_data():
    sample_id = (request.get_json())['sampleId']
    on_delete_data = Example.query.filter_by(sampleId=sample_id).first()
    img_list = on_delete_data.imageId
    if img_list is not None and img_list:
        for img in img_list:
            if exists('./static/img/{}'.format(img)):
                remove('./static/img/{}'.format(img))
    db.session.delete(on_delete_data)
    db.session.commit()
    return {'delete_status': 'success'}


@app.route('/api/upload/base', methods=['POST'])
def upload_base():
    form = request.get_json()
    new_record = Example(form['sampleId'], form['sampleType'], form['sampleSource'], form['samplingYear'],
                         form['samplingPeople'], form['imageId'], form['sampleDescribe'],
                         form['sampleExplain'], form['experimentId'])
    db.session.add(new_record)
    db.session.commit()

    return {'upload_base_status': 'success'}


@app.route('/api/upload/img', methods=['POST'])
def upload_img():
    file = request.files.get('fileToUpload')
    file.save('./static/img/' + file.filename)
    return {'upload_img_status': 'success'}


if __name__ == '__main__':
    app.run()
