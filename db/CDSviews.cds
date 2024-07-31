namespace harisdb.view;

using {harishdb.master, harishdb.transaction} from './data-model';

context CDSviews{

define view![POWorkList] as select from transaction.purchaseorder{

key PO_ID as ![PurchaseOrderNo],
key ITEMS.PO_ITEM_POS as ![Position],
PARTNER_GUID.BP_ID as ![VendorId],
PARTNER_GUID.COMPANY_NAME as ![ComanyName],
ITEMS.GROSS_AMOUNT as ![GrossAmount],
ITEMS.NET_AMOUNT as ![NetAmount],
ITEMS.TAX_AMOUNT as ![TaxAmount],
case OVERALL_STATUS
    when 'N' then 'New'
    when 'D' then 'Delivered'
    when 'P' then 'Pending'
    when 'A' then' Approved'
    when 'X' then 'Rejected'
    end as ![Status],
ITEMS.PRODUCT_GUID.DESCRIPTION as ![Product],
PARTNER_GUID.ADDRESS_GUID.COUNTRY as ![Country]

}

define view ![ProductVH] as select from master.product{
    
    @EndUserText.label:[{
        language:'EN',
        text : ' Product Id'
    },{
        language:'DE',
        text:'Prodekt Id'
    }]
    PRODUCT_ID as ![ProductName],
    @EndUserText.label:[
                {
                    language: 'EN',
                    text: 'Product Name'
                },
                {
                    language: 'DE',
                    text: 'Prodekt Name'
                }
            ]
    DESCRIPTION as ![Description]
}

define view![ItemView] as select from transaction.poitems{

    PARENT_KEY.PARTNER_GUID.NODE_KEY as ![VendorId],
    PRODUCT_GUID.NODE_KEY as ![ProductId],
    CURRENCY as ![Currency],
    GROSS_AMOUNT as ![GrossAmount],
    NET_AMOUNT as ![NetAmount],
    TAX_AMOUNT as ![TaxAmount],
    PARENT_KEY.OVERALL_STATUS as ![Status]
}

define view![ProductOrders] as select from master.product
mixin{
PO_ORDERS:Association[*] to ItemView on PO_ORDERS.ProductId = $projection.ProductKey
}into{

    NODE_KEY as ![ProductKey],
    DESCRIPTION as ![ProductName],
    PRICE as ![Price],
    SUPPLIER_GUID.BP_ID as ![SupplierId],
    SUPPLIER_GUID.COMPANY_NAME as ![SupplierName],
    SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as ![Country],
    PO_ORDERS
}

define view![POAnalytics] as select from ProductOrders{
   ProductName,
    Country,
    round(sum(PO_ORDERS.GrossAmount)) as ![TotalGrossAmount]:Decimal(10,2),
    PO_ORDERS.Currency
}group by ProductName, Country, PO_ORDERS.Currency
}