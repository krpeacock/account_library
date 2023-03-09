# Multi-Principal Account Libraries

This repository contains two libraries that provide an interface for managing user accounts that can have multiple principals. The libraries are implemented in Rust and Motoko and provide a similar interface across both languages.

## Account Interface
The Account interface represents a user account that can have multiple principals. A principal is a public key or other identifier that can be used to authenticate the user.

The Account interface provides the following methods:

new(identifier: String): creates a new Account with the specified identifier.
add_principal(principal: String): adds a new principal to the account.
get_principals() -> &Vec<String>: returns a reference to the Vec of principals associated with the account.
remove_principal(principal: &str, auth_principal: &str) -> Option<String>: removes the specified principal from the account. The auth_principal parameter is the principal that is authorized to make the call.
verify_signature(principal: &str, signature: &[u8], message: &[u8]) -> bool: verifies a signature using one of the principals associated with the account.
lookup_by_principal(principal: &str, accounts: &[Account]) -> Option<&Account>: finds an Account that has the specified principal among its principals.

## Rust Library
The Rust library provides an implementation of the Account interface in Rust. The library is located in the rust directory.

To use the library in your Rust project, add the following to your Cargo.toml:
```rs
[dependencies]
multi_principal_account = { git = "https://github.com/example/multi-principal-account", package = "rust" }

```rs
You can then import the Account struct and use it as follows:
use multi_principal_account::Account;

// Create a new account
let mut account = Account::new("user@example.com".to_string());

// Add a principal to the account
account.add_principal("public-key-1".to_string());

// Verify a signature using one of the principals associated with the account
let signature = [0u8; 32];
let message = [1u8; 32];
let is_valid = account.verify_signature("public-key-1", &signature, &message);

// Lookup an account by principal
let accounts = vec![account];
let found_account = Account::lookup_by_principal("public-key-1", &accounts);
```

## Motoko Library
The Motoko library provides an implementation of the Account interface in Motoko. The library is located in the motoko directory.

To use the library in your Motoko project, import the Account class and use it as follows:

```mo
import "mo:github.com/example/multi-principal-account/motoko" as Account;

// Create a new account
let account = Account.Account("user@example.com");

// Add a principal to the account
await account.addPrincipal("public-key-1");

// Verify a signature using one of the principals associated with the account
let signature = [0:Nat8; 32];
let message = [1:Nat8; 32];
let is_valid = await account.verifySignature("public-key-1", signature, message);

// Lookup an account by principal
let accounts = [account];
let found_account = await Account.lookupByPrincipal("public-key-1", accounts);
```

License
This code is licensed under the [MIT License](https://mit-license.org/).