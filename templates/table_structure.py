from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:root@localhost:3306/camrstidb'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_COMMIT_TEARDOWN'] = True
db = SQLAlchemy(app)


# 金相数据
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

    def __init__(self, sampleId, metalPhase, sfFullImg, sfDescription, sfEquipment, sfZoom, sfPhotoMod, sfImgList):
        self.sampleId = sampleId
        self.metalPhase = metalPhase
        self.sfFullImg = sfFullImg
        self.sfDescription = sfDescription
        self.sfEquipment = sfEquipment
        self.sfZoom = sfZoom
        self.sfPhotoMod = sfPhotoMod
        self.sfImgList = sfImgList

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


# 矿相数据
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
            'mpFullImg': self.mpFullImg,
            'mpDescription': self.mpDescription,
            'mpEquipment': self.mpEquipment,
            'mpZoom': self.mpZoom,
            'mpPhotoMod': self.mpPhotoMod,
            'mpImgList': self.mpImgList
        }


# 电子显微数据
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


# 图片数据
class PhaseGraphic(db.Model):
    __tablename__ = 'om_graphic'
    imageIndex = db.Column('imageIndex', db.Unicode(20), primary_key=True)
    omDescription = db.Column('omDescription', db.UnicodeText)
    omEquipment = db.Column('omEquipment', db.Unicode(10))
    omZoom = db.Column('omZoom', db.Unicode(5))
    omPhotoMod = db.Column('omPhotoMod', db.Unicode(4))

    def __init__(self, imageIndex, omDescription=None, omEquipment=None, omZoom=None, omPhotoMod=None):
        if omDescription is None:
            omDescription = u'无'
        if omEquipment is None:
            omEquipment = u'无'
        if omZoom is None:
            omZoom = u'无'
        if omPhotoMod is None:
            omPhotoMod = u'无'
        self.imageIndex = imageIndex
        self.omDescription = omDescription
        self.omEquipment = omEquipment
        self.omZoom = omZoom
        self.omPhotoMod = omPhotoMod

    def to_json(self):
        return {
            'imageIndex': self.imageIndex,
            'omDescription': self.omDescription,
            'omEquipment': self.omEquipment,
            'omZoom': self.omZoom,
            'omPhotoMod': self.omPhotoMod
        }


# 物理性能数据
class PhysicalPorosity(db.Model):
    __tablename__ = 'physical_property'
    sampleId = db.Column('sampleId', db.Unicode(20), primary_key=True)
    apparentPorosity = db.Column('apparentPorosity', db.FLOAT)
    trueDensity = db.Column('trueDensity', db.FLOAT)
    waterAbsorption = db.Column('waterAbsorption', db.FLOAT)

    def to_json(self):
        return {
            'sampleId': self.sampleId,
            'apparentPorosity': self.apparentPorosity,
            'trueDensity': self.trueDensity,
            'waterAbsorption': self.waterAbsorption
        }


# 实验数据
class ExperimentData(db.Model):
    __tablename__ = 'experiment_data'
    experimentId = db.Column('experimentId', db.Unicode(20), primary_key=True)
    sampleId = db.Column('sampleId', db.Unicode(20))
    mineralContent = db.Column('mineralContent', db.JSON)
    XRDContent = db.Column('XRDContent', db.JSON)
    chemicalContent = db.Column('chemicalContent', db.JSON)
    thermalPerform = db.Column('thermalPerform', db.JSON)
    diameterDisplay = db.Column('diameterDisplay', db.JSON)
    cavityDisplay = db.Column('cavityDisplay', db.JSON)

    def __init__(self, experimentId, sampleId, mineralContent=None, XRDContent=None, chemicalContent=None,
                 thermalPerform=None, diameterDisplay=None, cavityDisplay=None):
        if thermalPerform is None:
            thermalPerform = {}
        if chemicalContent is None:
            chemicalContent = {}
        if XRDContent is None:
            XRDContent = {}
        if mineralContent is None:
            mineralContent = {}
        if diameterDisplay is None:
            diameterDisplay = {}
        if cavityDisplay is None:
            diameterDisplay = {}
        self.experimentId = experimentId
        self.sampleId = sampleId
        self.mineralContent = mineralContent
        self.XRDContent = XRDContent
        self.chemicalContent = chemicalContent
        self.thermalPerform = thermalPerform
        self.diameterDisplay = diameterDisplay
        self.cavityDisplay = cavityDisplay

    def to_json(self):
        return {
            'mineralContent': self.mineralContent,
            'XRDContent': self.XRDContent,
            'chemicalContent': self.chemicalContent,
            'thermalPerform': self.thermalPerform,
            'diameterDisplay': self.diameterDisplay,
            'cavityDisplay': self.cavityDisplay
        }
