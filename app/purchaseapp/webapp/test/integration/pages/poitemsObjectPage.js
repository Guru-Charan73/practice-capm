sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'purchaseapp',
            componentId: 'poitemsObjectPage',
            contextPath: '/POs/Items'
        },
        CustomPageDefinitions
    );
});