import system.core.model.model as model
class AplicacionMapper(model.model):
    def getEvents(self):
        myResults = self.query("select * from sysaplicacion")
        return myResults