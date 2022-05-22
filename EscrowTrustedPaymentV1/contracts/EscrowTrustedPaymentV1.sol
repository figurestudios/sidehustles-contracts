pragma solidity ^0.5.17;

contract EscrowTrustedPaymentV1 {
   address requestorAddress; // the one who requested a job to be made
   address workerAddress;    // the one who is working on the job
   address escrow;           // the one who verifies whether the worker has completed the task or not in case of a dispute between the two
   
   uint escrowThreshodl;     // how many of the escrow addesses that must accept or decline a dispute

   bytes requestorData;      // 34 byte skylink which leads to:
                             //    1) JSON-formatted description of, for example, broadcasted messages (chat); the work requirements; how the escrow can verify; within which timeframe the worker must complete the task; part-deliverables; ETC
                             //    2) (OPTIONAL) environment files
                             //    3) (OPTIONAL) technical description of the task
                             //    4-∞) additional files
   
   bytes workerData;         // 64 byte registry public key which leads to:
                             //    1) JSON-formatted messages/detailes regarding the job (e.g. how complete it is (incl. if they request payment for being finished); any questions regarding the job)
                             //    2) work files/result

                             // 64 bytes can be split up as 2x bytes32 fields, which can be used for optimization later on

   constructor() public{
      requestorAddress = 0x0000000000000000000000000000000000000000;
      workerAddress    = 0x0000000000000000000000000000000000000000;
      escrow           = 0x0000000000000000000000000000000000000000;
      requestorData    = "default_requestor_value";
      workerData       = "default_worker_value";
   }

   function getWorkerData() public view returns(string memory) {
      string memory _workerData = string(workerData);
      return _workerData;
   }

   function getRequestorData() public view returns(string memory) {
      string memory _requestorData = string(requestorData);
      return _requestorData;
   }
   
   // TODO: MAKE FUNCTION THAT LETS THE REQUESTOR CHANGE ESCROW FOR AS LONG AS THERE IS ONLY A DEFAULT VALUE FOR THE WORKER ADDRESS

   // TODO: MAKE FUNCTION THAT LETS THE REQUESTOR CHANGE THE WORK DESCRIPTION FOR AS LONG AS THERE IS ONLY A DEFAULT VALUE FOR THE WORKER ADDRESS

   // TODO: MAKE FUNCTION THAT LETS THE WORKER START A DISPUTE, I.E., ASKING ESCROW TO OVERLOOK THE FINISHED WORK BY CHANGING A STATE BOOL

   // TODO: MAKE FUNCTION THAT LETS THE REQUESTOR START A DISPUTE, I.E., ASKING ESCROW TO GIVE BACK THE REQUESTORS' FUNDS BY CHANGING A STATE BOOL

   // TODO: MAKE FUNCTION THAT LETS ESCROW PAY THE WORKER / REQUESTOR BASED ON DISPUTES

   // TODO: MAKES FUNCTION THAT LETS THE REQUESTOR PAY OUT THE WORKER FROM THE CONTRACT'S FUNDS
}
