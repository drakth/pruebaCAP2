namespace officesupplies; //Definimos el namespace a usar, hay que usaarlo tanto en los archivos CSV como en el SRV.

//Usamos los types y aspects que nos provee SAP en common, en este caso Currency, para la moneda.
using { Currency } from '@sap/cds/common';

entity Products{
    @Common.Common.Label    : 'UUID'
    key ID                  : UUID;
    identifier              : String @Common.Label : 'ProductID';
    title                   : localized String @( Common.Label : 'Name' );
    description             : localized String;
    availability            : Integer;
    storage_capacity        : Integer;
    criticality             : Integer;
    price                   : Decimal(9,2);
    currency                : Currency;
    supplier                : Association to  Suppliers; //Indicamos que tiene una asociacion unica a Suppliers abajo
    image_url               : String;
}

entity Suppliers{
    key ID                  : UUID;
    identifier              : String;
    name                    : String;
    phone                   : String;
    building                : String;
    street                  : String @UI.MultiLineText;
    postCode                : String;
    city                    : String;
    country                 : String;
    //Indicamos que tiene una asociacion multiple a Products arriba.
    products                : Composition of many Products on products.supplier = $self;
}

//entity SomeView ( p_ID: Integer )
//    as SELECT * from Products where ID=:p_ID;