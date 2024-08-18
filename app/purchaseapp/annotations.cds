using test.services.ProjectServices as service from '../../srv/project-services';

annotate service.POs with @(
    UI.SelectionFields      : [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMT,
        OVERALL_STATUS
    ],
    UI.LineItem             : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMT,

        },
        {
            $Type: 'UI.DataField',
            Value: OVERALL_STATUS,
        },
    ],
    UI.HeaderInfo           : {
        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title         : {Value: PO_ID},
        Description   : {Value: PARTNER_GUID.COMPANY_NAME}
    },

    UI.Facets               : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Information',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Order Details',
                    Target: '@UI.Identification'

                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Configuration Details',
                    Target: '@UI.FieldGroup#Spiderman'
                },

            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'PO Items',
            Target: 'Items/@UI.LineItem',
        },
    ],

    UI.Identification       : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value: OVERALL_STATUS,
        }
    ],
    UI.FieldGroup #Spiderman: {
        Label: 'PO pricing',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: GROSS_AMT,
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMT,
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMT,
            },
            {
                $Type: 'UI.DataField',
                Value: Currency_code,
            },
        ],
    }

);

annotate service.poitems with @(

    UI.LineItem      : [
        {
            $Type: 'UI.DataField',
            Value: PO_ITEM_POS,
        },
        {
            $Type: 'UI.DataField',
            Value: PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMT,
        },
        {
            $Type: 'UI.DataField',
            Value: Currency_code,
        },
        {
            $Type: 'UI.DataField',
            Value: PRODUCT_GUID.CATEGORY,
        },
    ],
    UI.HeaderInfo    : {
        TypeName      : 'PO Item',
        TypeNamePlural: 'PO Items',
        Title         : {Value: PO_ITEM_POS},
        Description   : {Value: PRODUCT_GUID.DESCRIPTION}
    },
    UI.Facets        : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'More Info',
        Target: '@UI.Identification',
    },

    ],
    UI.Identification: [
        {
            $Type: 'UI.DataField',
            Value: PO_ITEM_POS,
        },
        {
            $Type: 'UI.DataField',
            Value: PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value: Currency_code,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMT,
        },
        {
            $Type: 'UI.DataField',
            Value: NET_AMT,
        },
        {
            $Type: 'UI.DataField',
            Value: TAX_AMT,
        }
    ]

);

annotate service.POs with {
    PARTNER_GUID   @(
        Common          : {Text: PARTNER_GUID.COMPANY_NAME, },
        ValueList.entity: ProjectServices.BusinessPartnerSet
    );
    OVERALL_STATUS @(readonly, )
};

annotate service.poitems with {
    PRODUCT_GUID @(
        Common          : {Text: PRODUCT_GUID.DESCRIPTION, },
        ValueList.entity: ProjectServies.ProductSet
    )
};

@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(UI.Identification: [{
    $Type: 'UI.DataField',
    Value: COMPANY_NAME,
}]);

@cds.odata.valuelist
annotate service.ProductSet with @(UI.Identification: [{
    $Type: 'UI.DataField',
    Value: DESCRIPTION,
}]);
