using { harishdb.master,harishdb.transaction} from '../db/data-model';

service CatalogService @(path:'CatalogService',requires:'authenticated-user'){

entity BusinessPartnerSet as projection on master.businesspartner;
entity AddressSet as projection on master.address;
entity ProductSet as projection on master.product;
entity EmployeesSet @(restrict:[
{grant:'READ',to:'Viewer',where:'bankName=$user.bankName'},
{grant:'WRITE',to:'Admin'}
]) as projection on master.employees;
entity POs @(
    odata.draft.enabled:true
) as projection on transaction.purchaseorder{
    *,
    case OVERALL_STATUS 
            when 'N' then 'New'
            when 'P' then 'Pending'
            when 'D' then 'Delivered'
            when 'R' then 'Rejected'
            when 'A' then 'Approved'
    end as OverallStatus:String(10),
    case OVERALL_STATUS 
            when 'N' then 0
            when 'P' then 2
            when 'D' then 3
            when 'R' then 1
            when 'A' then 3
    end as ColorCoding:Integer,

} actions{
    @cds.odata.bindingparameter.name:'_harish'
    @Common.SideEffects:{
        TargetProperties:['_harish/GROSS_AMOUNT']
    }
    action boost() returns POs;
    function largestOrder() returns POs;

};
entity POItems as projection on transaction.poitems; 

}
