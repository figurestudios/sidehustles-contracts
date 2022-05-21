# EscrowTrustedPaymentV1

> EscrowTrustedPaymentV1 is the first `sidehustles` Solidity work contract where two parties (worker and requestor) are both secured by having an escrow overlooking their contract and deliverables.

## Inner workings of [EscrowTrustedPaymentV1](https://github.com/figurestudios/sidehustles-contracts/blob/main/EscrowTrustedPaymentV1/contracts/EscrowTrustedPaymentV1.sol)

1) Multiple addresses; requestor, worker, and escrow, are defined.

2) Data fields are defined for, for example, work descriptions and deliverables. This includes whether or not the deliverable must be encrypted and similar.

3) Off-chain, the requestor and worker can communicate with each other.

4) The worker will get paid, or a dispute is created.

5) If a dispute is made, an escrow will overlook the contract and the deliverables.

6) Depending on the escrow's judgement, the payment will be sent to the correct party.
