use aztec::test::helpers::test_environment::TestEnvironment;
use counter_contract::Main;

#[test]
unconstrained fn test_constructor() {
    let mut env = TestEnvironment::new();
    let deployer = env.create_light_account();

    let _contract_address = env.deploy("@counter_contract/Main")
        .with_private_initializer(deployer, Main::interface().constructor());
}
