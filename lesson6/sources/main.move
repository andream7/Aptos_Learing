module 0x42::Demo{
   use std::debug;
   use std::signer;

   struct Coin has key {
    value:u64
   }

   public entry fun mint(account: &signer, value: u64) {
      move_to(account, Coin{value});
   }

   #[test(account = @0x42)]
    public fun test_mint(account: &signer) acquires Coin{
        let addr = signer::address_of(account);
        mint(account, 10);
        let coin = borrow_global<Coin>(addr).value;
        debug::print(&coin);
    }
}