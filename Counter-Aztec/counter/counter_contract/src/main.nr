use aztec::macros::aztec;

#[aztec]
 contract Counter {

    use aztec:{
        macros::storage::storage,
        protocol::AztecAddress::AztecAddress,
        state_vars::{Map, PublicMutable},
    }

    // impoert the macros that we need to use 
    // counter storage variable (mapping from address to uint256)

    #[storage]

    struct  Storage <Context>{
        counter: Map<AztecAddress, PublicMutable<u128, Context>, Context>,

    }

    // constructor to initialize   the state  - deploy have a counter head start


    // private fucntin to kncrement 

    // privater fucntion to decremenrt by one


    // getter function to ber able to spend my  counter value 


   
}
