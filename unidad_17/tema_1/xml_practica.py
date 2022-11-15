

import xml.dom.minidom

def GenerateXml(path):
    impl = xml.dom.minidom.getDOMImplementation()
    dom = impl.createDocument(None, 'CONFIG_LIST', None)
    root = dom.documentElement
    employee = dom.createElement('COMP')
    root.appendChild(employee)
    nameE = dom.createElement('path')
    nameE.setAttribute ("valor", "aaaaaaaaaaa") # Agregar atributo


    nameT = dom.createTextNode('linux')
    nameE.appendChild(nameT)
    employee.appendChild(nameE)
    f = open(path, 'a')
    dom.writexml(f, addindent=' ', newl='\n')
    f.close()

GenerateXml("unidad_17/tema_1/docs/test.xml")