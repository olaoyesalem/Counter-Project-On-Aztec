use aztec::macros::aztec;


#[aztec]
 contract Counter {
    use aztec::{
        macros::{functions::{external, initializer}, storage::storage},
        protocol::address::AztecAddress,
        state_vars::{ Map, PublicMutable,Owned, PrivateMutable},
    };
 
 use uint_note::UintNote;

    #[storage]
    struct Storage<Context> {
        public_counters: Map<AztecAddress,PublicMutable< u128,Context>, Context>,
        private_counters:  Owned<PrivateMutable<UintNote, Context>, Context>,
    }


    #[initializer]
    #[external("public")]
    fn initialize_public(headstart: u128, owner: AztecAddress) {
        self.storage.public_counters.at(owner).write(headstart);
    }


    // private function to increment  the counter 

     // public function to increment  the counter 
     #[external("public")]
     fn increment_public() {
       let current_value =  self.storage.public_counters.at(self.msg_sender()).read();
       self.storage.public_counters.at(self.msg_sender()).write(current_value + 1);

     }

     // public function to decrement the counter
         #[external("public")]
      fn decrement_public() {
     
       let current_value =  self.storage.public_counters.at(self.msg_sender()).read();
       assert(current_value > 0, "Counter value cannot be negative");
       self.storage.public_counters.at(self.msg_sender()).write(current_value - 1);

     }


     // private function to increment  the counter 
     #[external("private")]
     fn increment_private() {
        self.storage.private_counters.at(self.msg_sender()).initialize_or_replace(|option_note: Option<UintNote>| {
           let note_value : u128 = option_note.unwrap_or(default: UintNote(value: 0)).value + 1;
        }).deliver();
     }

}
