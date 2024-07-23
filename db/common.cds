namespace harishdb.commons;
using { Currency} from '@sap/cds/common';

type Gender:String(1)enum{

        male='M';
        female='F';
        undisclosed='U'
}

type AmountT:Decimal(10,2)@(
    Semantic.amount.Currency_code:'Currency_code',
    sap.unit:'Currency_code');

type Guid:String(32);
 
 aspect Amount{
        CURRENCY:Currency;
        GROSS_AMOUNT:AmountT@(title:'Gross Amount');
        NET_AMOUNT:AmountT@(title:'Net Amount');
        TAX_AMOUNT:AmountT@(title:'Tax Amount');
 }

 type PhoneNumber:String(30)@assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
 
 type EmailAddress:String(80)@assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

 aspect Address{
    CITY:String(40);
    HOUSE:String(30);
    STREET:String(40);
 }


