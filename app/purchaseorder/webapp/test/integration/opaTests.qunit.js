sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/po/purchaseorder/test/integration/FirstJourney',
		'com/po/purchaseorder/test/integration/pages/POsList',
		'com/po/purchaseorder/test/integration/pages/POsObjectPage',
		'com/po/purchaseorder/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/po/purchaseorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);