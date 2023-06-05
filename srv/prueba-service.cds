using officesupplies as officesupplies from '../db/schema'; //Especificamos las entidades a usar indicandole en el archivo donde estan definidas.

service CatalogService {
    //Draft habilita la opcion de que el usuario empiece a editar y pueda ir a hacer otra cosa y seguir con la edicion mas tarde.
    //https://cap.cloud.sap/docs/advanced/fiori#draft-support
    @odata.draft.enabled :true 
    entity Products as projection on officesupplies.Products; //Exponemos el servicio de productos.
    entity Suppliers as projection on officesupplies.Suppliers; //Exponemos el servicio de Suppliers.
};