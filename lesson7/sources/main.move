module 0x42::Demo{
    use std::debug;
    use std::signer;

    // drop, 没有 drop 属性会报错
    struct Foo has drop {
       u: u64,
       b: bool
    }

    #[test]
    fun test(){
        let f = Foo{u: 42, b: true};
        debug::print(&f.u);
        debug::print(&f.b);
    }

    #[test]
    fun test2(){
        let f = Foo{u: 42, b: true};
        let Foo{u,b} = &mut f;
        *u = 43;
        debug::print(&f.u);
        debug::print(&f.b);
    }

    // copy
    struct CanCopy has copy, drop {
        x: u64,
        y: u64
    }

    // 不使用Copy会进行所有权转移
    // 使用 Copy 相当于重新创建了一个c2，不影响之前的c
    #[test]
    fun test3(){
        let c = CanCopy{x: 42, y: 43};
        let c2 = copy c;
        let CanCopy{x,y} = &mut c2;
        *x = 44;
        debug::print(&c.x);
        debug::print(&c2.x);
    }


    // key
    // key的作用是把资源存到用户的地址上
    struct Coin has key {
        value:u64
    }

    public entry fun mint(account: &signer, value: u64) {
        move_to(account, Coin{value});
    }

    // 使用 borrow_global 方法时，需要添加 acquires 修饰
    #[test(account = @0x42)]
    public fun test_mint(account: &signer) acquires Coin{
        let addr = signer::address_of(account);
        mint(account, 10);
        let coin = borrow_global<Coin>(addr).value;
        debug::print(&coin);
    }

    // store
    struct Key has key, drop {
        s: Struct
    }

    struct Struct has store, drop {
        x: u64
    }

    #[test]
    fun test4(){
        // 如果父结构体有 Key 属性，子结构体必须包含Store属性，表明可存储
        let s = Struct{x: 42};
        let k = Key{s: s};
        debug::print(&k.s.x);
    }

}