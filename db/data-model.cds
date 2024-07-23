namespace harishdb;

using {cuid,Currency} from '@sap/cds/common';
using {harishdb.commons as commons} from './common';


context master{

entity businesspartner{

    key NODE_KEY:commons.Guid;
        BP_ROLE:String(2);
        EMAIL_ADDRESS:String(100);
        PHONE_NUMBER:String(80);
        FAX_NUMBER:String(80);
        WEB_ADDRESS:String(100);
        ADDRESS_GUID:Association to one address;
        BP_ID:String(30);
        COMPANY_NAME:String(250);

}

entity address{

    key NODE_KEY:commons.Guid;
        CITY:String(40);
        POSTAL_CODE:String(20);
        STREET:String(100);
        BUILDING:String(40);
        COUNTRY:String(30);
        ADDRESS_TYPE:String(10);
        VAL_START_DATE:Date;
        VAL_END_DATE:Date;
        LATITUDE:Decimal;
        LONGITUDE:Decimal;
        businesspartner:Association to one businesspartner on businesspartner.ADDRESS_GUID=$self;
}

entity employees:cuid{

        nameFirst:String(40);
        nameMiddle:String(40);
        nameLast:String(40);
        nameInitials:String(40);
        sex:commons.Gender;
        language:String(1);
        phonenumber:commons.PhoneNumber;
        email:commons.EmailAddress;
        loginName:String(40);
        Currency:Currency;
        salaryAmount:commons.AmountT;
        accountNumber:String(30);
        bankId:String(8);
        bankName:String(20);

}

entity product{

    key NODE_KEY:commons.Guid;
        PRODUCT_ID:String(40);
        DESCRIPTION:localized String(255);
        TYPE_CODE:String(3);
        CATEGORY:String(20);
        SUPPLIER_GUID:Association to businesspartner;
        TAX_TARIF_CODE:String(1);
        MEASURE_UNIT:String(5);
        WEIGHT_MEASURE:Decimal(5,2);
        WEIGHT_UNIT:String(5);
        CURRENCY_CODE:String(4);
        PRICE: Decimal(15,2);
        WIDTH: Decimal(5,2);
        HEIGHT: Decimal(5,2);
        DEPTH: Decimal(5,2);
        DIM_UNIT: String(2);
}

}

context transaction{

entity purchaseorder : commons.Amount{
     key NODE_KEY:commons.Guid;
         PO_ID:String(20);
         PARTNER_GUID:Association to master.businesspartner;
         LIFECYCLE_STATUS:String(2);
         OVERALL_STATUS:String(2);
         ITEMS:Association to many poitems on ITEMS.PARENT_KEY = $self;
         
}

entity poitems : commons.Amount {

    key NODE_KEY:commons.Guid;
        PARENT_KEY:Association to purchaseorder;
        PO_ITEM_POS:String(3);
        PRODUCT_GUID:Association to master.product;
    
}

   

}