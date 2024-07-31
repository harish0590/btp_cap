using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(

    UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT
    ],
    UI.LineItem:[ 
    {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type:'UI.DataFieldForAction',
            Action:'CatalogService.boost',
            Label:'boost',
            Inline:true
        },
        {
            $Type : 'UI.DataField',
            Value : OverallStatus,
            Criticality:ColorCoding
        },
        
    ],
    UI.HeaderInfo:{
        TypeName:'Purchase Order',
        TypeNamePlural:'Purchase Orders',
        Title:{
            $Type:'UI.DataField',
            Value:PO_ID
        },
        Description:{
            $Type:'UI.DataField',
            Value:PARTNER_GUID.COMPANY_NAME
        },
        ImageUrl:'data:image/jpeg;base64,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'
    },
    UI.Facets:[{
        $Type : 'UI.CollectionFacet',
        Label:'More Info',
        Facets:[
            {
            $Type : 'UI.ReferenceFacet',
            Target:'@UI.Identification'
        },{
            $Type : 'UI.ReferenceFacet',
            Label:'Prices',
            Target:'@UI.FieldGroup#harish'
        },{

            $Type : 'UI.ReferenceFacet',
            Label:'Statuses',
            Target:'@UI.FieldGroup#vineela'
        }]},{
            $Type : 'UI.ReferenceFacet',
            Target : 'ITEMS/@UI.LineItem#Itemtable',}],
        UI.Identification:[{

            $Type:'UI.DataField',
            Value:PO_ID

        },{

            $Type:'UI.DataField',
            Value:PARTNER_GUID_NODE_KEY
        },{
           $Type:'UI.DataField',
            Value:PARTNER_GUID.BP_ID
        }],
        UI.FieldGroup #harish:{
            Label:'Price Data',
            Data:[
                {
                    $Type:'UI.DataField',
                    Value:GROSS_AMOUNT
                },
                 {
                    $Type:'UI.DataField',
                    Value:NET_AMOUNT
                },
                 {
                    $Type:'UI.DataField',
                    Value:TAX_AMOUNT
                }
            ]
        },
        UI.FieldGroup #vineela:{
            Label:'Status',
            Data:[{  
                    $Type:'UI.DataField',
                    Value:OVERALL_STATUS
                },
                 {
                    $Type:'UI.DataField',
                    Value:LIFECYCLE_STATUS
                }
            ]
        }
        
);

annotate service.POItems with @(

    UI.LineItem #Itemtable:[{
        $Type : 'UI.DataField',
        Value : PO_ITEM_POS
    },{
        $Type : 'UI.DataField',
        Value : PRODUCT_GUID_NODE_KEY
    },{
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT
    },{
        $Type : 'UI.DataField',
        Value : CURRENCY_code
    }],

    UI.HeaderInfo:{
        TypeName : 'Item',
        TypeNamePlural : 'Items',
        Title:{
            $Type:'UI.DataField',
            Value:PO_ITEM_POS
        },
        Description : {
             $Type:'UI.DataField',
            Value:PRODUCT_GUID.DESCRIPTION
        },
    },

    UI.Facets:[{
        $Type:'UI.CollectionFacet',
        Label:'Item Info',
        Facets:[{
            $Type:'UI.ReferenceFacet',
            Label:'Details',
            Target:'@UI.FieldGroup#ItemDetail'
        },
        {
            $Type:'UI.ReferenceFacet',
            Label:'Price',
            Target:'@UI.FieldGroup#Price'
        },
        {
            $Type:'UI.ReferenceFacet',
            Label:'Product Details',
            Target:'@UI.FieldGroup#Product'
        }
        ]
    }],

    UI.FieldGroup #ItemDetail:{

        Data:[{
            $Type:'UI.DataField',
            Value:PO_ITEM_POS
        },
        {
            $Type:'UI.DataField',
            Value:PRODUCT_GUID_NODE_KEY
        },
        {
            $Type:'UI.DataField',
            Value:CURRENCY_code
        }]

    },
    UI.FieldGroup #Price:{

        Data:[{
            $Type:'UI.DataField',
            Value:GROSS_AMOUNT
        },
        {
            $Type:'UI.DataField',
            Value:NET_AMOUNT
        },
        {
            $Type:'UI.DataField',
            Value:TAX_AMOUNT
        }]

    },
    UI.FieldGroup #Product:{

        Data:[{
            $Type:'UI.DataField',
            Value:PRODUCT_GUID.DESCRIPTION
        },
        {
            $Type:'UI.DataField',
            Value:PRODUCT_GUID.CATEGORY
        },
        {
            $Type:'UI.DataField',
            Value:PRODUCT_GUID.PRICE
        }]

    }
);

annotate service.POs with {

    PARTNER_GUID@(
        Common.Text:PARTNER_GUID.COMPANY_NAME,
        Common.ValueList.entity:service.BusinessPartnerSet
    )

};

annotate service.POItems with{
    PRODUCT_GUID@(
        Common.Text:PRODUCT_GUID.DESCRIPTION,
        Common.ValueList.entity:service.ProductSet
    )
};
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification:[{
            $Type : 'UI.DataField',
            Value:COMPANY_NAME
    }]
);

@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification:[{
        $Type:'UI.DataField',
        Value:DESCRIPTION
    }]
) ;
