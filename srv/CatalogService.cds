using { harishdb.master,harishdb.transaction} from '../db/data-model';

service CatalogService @(path:'CatalogService'){

entity BusinessPartnerSet as projection on master.businesspartner;
entity AddressSet as projection on master.address;
entity ProductSet as projection on master.product;
entity EmployeesSet as projection on master.employees;
entity POs as projection on transaction.purchaseorder actions{

    action boost() returns POs;
    function largestOrder() returns POs;

};
entity POItems as projection on transaction.poitems; 

}
