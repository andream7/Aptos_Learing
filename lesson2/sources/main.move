module 0x42::Lesson2{
    use std::debug::print;

    struct Wallet has drop {
        balance: u64
    }

    #[test]
    fun test_wallet() {
        let wallet = Wallet { balance: 1000 };
        let waller2 = wallet;
        // print(&wallet.balance);

        // 所有权从wallet转移到wallet2
        print(&waller2.balance)
    }
}