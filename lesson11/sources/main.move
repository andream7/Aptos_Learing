module 0x42::myObject {
    use std::debug::print;
    use aptos_framework::object;
    use aptos_framework::object::{Object, ConstructorRef, ObjectCore};

    use std::signer;

    const NAME:vector<u8> = b"myObject"; 

    // 1. deleteable object
    // 创建可删除的普通对象
    // caller 代表是谁创建的
    public fun createDeleteableObject(caller: &signer):ConstructorRef {
        // 使用address_of 拿到地址
        let caller_addr = signer::address_of(caller);
        // 创建普通object
        let obj = object::create_object(caller_addr);
        obj
    }

    // 2. undeleteable object
    // 创建不可删除的对象，只能创建一次
    public fun createNamedObject(caller: &signer):ConstructorRef {
        let obj = object::create_named_object(caller, NAME);
        obj
    }

    // 3. undeleteable object
    // 粘性对象，可以创建多次
    public fun createStickyObject(caller: &signer):ConstructorRef {
        let caller_addr = signer::address_of(caller);
        let obj = object::create_sticky_object(caller_addr);
        obj
    }


    #[test(caller = @0x88)]
    fun testCreateDeleteableObject(caller: &signer) {
        let obj = createDeleteableObject(caller);
        print(&obj);
    }

    #[test(caller = @0x88)]
    fun testCreateNamedObject(caller: &signer) {
        let obj = createNamedObject(caller);
        // let obj2 = createNamedObject(caller);
        print(&obj);
        // print(&obj2);
    }

    #[test(caller = @0x88)]
    fun testCreateStickyObject(caller: &signer) {
        let obj = createStickyObject(caller);
        let obj2 = createStickyObject(caller);
        print(&obj);
        print(&obj2);
    }
}