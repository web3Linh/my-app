module helloworld::hello_world {
    use sui::object::{Self,UID};
    use sui::transfer;
    use sui::tx_context::TxContext;
    use std::string::{Self,String};
    struct Message has key {
        id : UID,
        value: String
    }

    fun init(ctx: &mut TxContext) {
        transfer::share_object(Message{
            id: object::new(ctx),
            value: string::utf8(b"")
        })
    }

    public entry fun setMessage(message_object: &mut Message,message: String) {
        message_object.value = message
    }
}