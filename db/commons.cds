namespace test.commons;

using {Currency} from '@sap/cds/common';

type Gender   : String(1) enum {
    male        = 'M';
    female      = 'F';
    undisclosed = 'U';
};

type AmountD  : Decimal(10, 2) @(
    Semantics.amount.currencyCode: 'CURRENYC_CODE',
    sap.unit                     : 'CURRENCY_CODE'
);

aspect amount : {
    Currency  : Currency @(title: '{i18n>Currency}');
    GROSS_AMT : AmountD  @(title: '{i18n>Gross Amount}');
    NET_AMT   : AmountD  @(title: '{i18n>Net Amount}');
    TAX_AMT   : AmountD  @(title: '{i18n>Tax Amount}');
}

type Guid     : String(32);
type PhoneNum : String(30) @assert.format: '^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
type Email    : String(255) @assert.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
