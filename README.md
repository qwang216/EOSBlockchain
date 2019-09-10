# EOSBlock

### App Demo
  #### EOSBlockListController
     * On initial app launch, tableview will be hidden until `Get Recent 20 Block` button is pressed
     * Pull to refresh will fetch the most recent `last_irreversible_block_num` generate 20 block numbers. 
  #### EOSBlockDetailController
     * Displays Producer, Producer's Signature, Transactions count, and raw JSON
     * Toggle can switch on and off to show and hide raw JSON contents
<img src="https://github.com/qwang216/EOSBlockchain/blob/master/Media/EOS_Demo_Gif.gif" width="400" height="800"/>

### App Icon
<img src="https://github.com/qwang216/EOSBlockchain/blob/master/Media/Icon.jpg" width="200" height="110"/>

### Scheme
  * There are two  build config this project can run.
      - 1 Debug: App will fetch Mock Data from a JSON file
      - 2 Release: App will hit API to fetch Data.
  * EOSManager
      - Object that manges API Endpoints
      - Calls Endpoints and parse response data
<img src="https://github.com/qwang216/EOSBlockchain/blob/master/Media/Scheme.png" width="800" height="240"/>
<img src="https://github.com/qwang216/EOSBlockchain/blob/master/Media/BuildFlag.png" width="500" height="200"/>
