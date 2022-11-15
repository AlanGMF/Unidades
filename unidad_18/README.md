# Conectarse a MongoDB

### 0 Levantar MongoDB
docker-compose up -d

### 1 Ingresar a Mongosh
docker exec -it mongodb_alkemy bash
mongosh

### 2 Loguearse en Mongodb
use admin
db.auth("admin", "password")


# Practica!

### Crear una base de datos
use my_db

### Crear dos colecciones
my_db.createCollection("coleccion_paises")
my_db.createCollection("coleccion_objetos")

### Insertar 1 documento
my_db.coleccion_paises.insertOne({pais: "Kirguistan", poblacion_en_millones: 6.694})

### Insertar varios documentos
my_db.coleccion_objetos.insert([
    {
        nombre: "jabon",
        peso: "200g",
        color_rgb: "(255, 192, 203)"
    },
    {
        nombre: "autito",
        peso: "25g",
        color_rgb: "(255, 58, 123)"
    },
    {
        nombre: "autito",
        peso: "25g",
        color_rgb: "(255, 58, 123)"
    }
])  

### Listar los documentos existentes en una colección
my_db.coleccion_paises.find()

### Listar un documento específico dentro de la colección

my_db.coleccion_objetos.find({nombre: "jabon"})

### Realizar un update en un registro

my_db.coleccion_objetos.update({
                        _id: ObjectId("63738fcfa5b7ea5815b0fb19")
                    },
                    {
                        $set: {
                            peso: "190g"
                        }
                    })

### Realizar un update a varios registros de forma simultánea

my_db.coleccion_objetos.update({nombre:"autito"},{$set:{peso:"10g"}},{multi:true})