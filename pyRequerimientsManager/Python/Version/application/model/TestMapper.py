import application.model.AplicacionMapper as AplicacionMapper
myAplicacionMapper = AplicacionMapper.AplicacionMapper()
results = myAplicacionMapper.getEvents()
print results