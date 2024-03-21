module 0x42::Demo{
    use std::debug;
    use std::signer;

    // drop
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

    #[test]
    fun test3(){
        let c = CanCopy{x: 42, y: 43};
        let c2 = copy c;
        let CanCopy{x,y} = &mut c2;
        *x = 44;
        debug::print(&c.x);
        debug::print(&c2.x);
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
        let s = Struct{x: 42};
        let k = Key{s: s};
        debug::print(&k.s.x);
    }

}