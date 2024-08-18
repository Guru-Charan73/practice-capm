namespace test.services;

using {
    test.schema.master,
    test.schema.transaction
} from '../db/schema';

using {test.views} from '../db/views';
using {test.schema} from '../db/schema';


service ProjectServices @(path: 'ProjectServices') {

    entity ProductSet                       as projection on schema.master.product;
    entity BusinessPartnerSet               as projection on master.businesspartner;
    entity BusinessAddressSet               as projection on master.address;
    entity EmployeeSet                      as projection on master.employees;
    entity POs @(odata.draft.enabled: true) as projection on transaction.purchaseorder;
//exposing the cds-views
// entity Products as projection on  views.CDS.ProductView;
}
