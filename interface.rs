pub struct Account {
    pub identifier: String,
    pub principals: Vec<String>,
}

impl Account {
    pub fn new(identifier: String) -> Self {
        Self {
            identifier,
            principals: Vec::new(),
        }
    }

    pub fn add_principal(&mut self, principal: String) {
        self.principals.push(principal);
    }

    pub fn get_principals(&self) -> &Vec<String> {
        &self.principals
    }

    pub fn remove_principal(&mut self, principal: &str, auth_principal: &str) -> Option<String> {
        // Verify that the auth_principal is authorized to modify this account.
        if self.principals.contains(auth_principal) {
            if let Some(index) = self.principals.iter().position(|p| p == principal) {
                return Some(self.principals.remove(index));
            }
        }
        None
    }

    pub fn verify_signature(&self, principal: &str, signature: &[u8], message: &[u8]) -> bool {
        // Verify the signature using one of the principals associated with the account.
        // Return true if the signature is valid, false otherwise.
        self.principals.contains(principal) && false
    }

    pub fn lookup_by_principal(principal: &str, accounts: &[Account]) -> Option<&Account> {
        accounts.iter().find(|account| account.principals.contains(&principal.to_string()))
    }
}
