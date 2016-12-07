<aura:application controller="ExpenseController">
    <ltng:require styles="/resource/bootstrap"/>
    <div class="bootstrap-sf1">
        <div class="navbar navbar-inverse">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">My Expenses</a>
            </div>
        </div>
        <div class="container">
		<c:formcmp />
		</div>
    </div>
</aura:application>