module suitokenlearning::suitokenlearning {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};


    struct SUITOKENLEARNING has drop {}

    fun init(witness: SUITOKENLEARNING, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"SUITOKENLEARNING", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        coin::mint_and_transfer(&mut treasury, 1000000000000, tx_context::sender(ctx), ctx);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}