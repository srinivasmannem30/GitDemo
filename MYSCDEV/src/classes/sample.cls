global class sample 
{
    public String accountName { get; set; }
    public static Account account { get; set; }
    public sample() { }
    
    @RemoteAction
    global static Account getAccount(String accountName) 
    {
        system.debug('accountName------>>>>'+accountName);
        account = [select id, name, phone, type, numberofemployees from Account where name = :accountName ];
        return account;
    }
}