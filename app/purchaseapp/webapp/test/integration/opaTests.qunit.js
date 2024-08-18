sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'purchaseapp/test/integration/FirstJourney',
		'purchaseapp/test/integration/pages/POsList',
		'purchaseapp/test/integration/pages/POsObjectPage',
		'purchaseapp/test/integration/pages/poitemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, poitemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('purchaseapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThepoitemsObjectPage: poitemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);