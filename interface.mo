public class Account {
  public let identifier : Text;
  public var principals : [Text];

  public func new(id : Text) {
    identifier = id;
    principals = [];
  }

  public func addPrincipal(p : Text) : async {
    principals := Array.append(principals, [p]);
  }

  public func getPrincipals() : async [Text] {
    principals;
  }

  public func removePrincipal(p : Text, authPrincipal : Text) : async ?Text {
    // Verify that the authPrincipal is authorized to modify this account.
    if (Array.contains(principals, authPrincipal)) {
      let index = Array.find(principals, (p) => p == p);
      switch (index) {
        null => null,
        _ => {
          let principal = Array.remove(principals, Nat32.toNat(index!));
          Some(principal);
        }
      }
    } else {
      null;
    }
  }

  public func verifySignature(principal : Text, signature : [Nat8], message : [Nat8]) : async Bool {
    // Verify the signature using one of the principals associated with the account.
    // Return true if the signature is valid, false otherwise.
    Array.contains(principals, principal) && false;
  }

  public shared func lookupByPrincipal(principal : Text, accounts : [Account]) : async ?Account {
    let account = Array.find(accounts, (a) => Array.contains(a.principals, principal));
    switch (account) {
      null => null,
      _ => Some(account)
    }
  }
}