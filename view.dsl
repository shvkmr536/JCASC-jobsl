listView('SMA-Migration') {
    description('List all jobs from project Storewalk')
    filterBuildQueue()
    filterExecutors()
    jobs {
		// Add new dsl jobs in this section...          
        name('create-count-review')
        name('create-prompted-counts')
        name('promptedcountexception-task-initiator-lambda')
        name('create-storewalk-count')
        name('supplychain-storewalk-prompted-negatives-task')
        name('supplychain-storewalk-prompted-negatives-task-initiator-lambda')
        name('supplychain-storewalk-stock-adaptor-lambda')
        name('count-schedule-service')
        name('adjustment-service-v2')
        name('supplychain-stock-v2-adjustment-bulk-data-extract-task')
        name('storewalk-data-purging-task')
        name('storewalk-stock-status-updater')
        name('storewalk-stock-transaction-updater')
        name('storewalk-stock-transaction-updater-initiator-lambda')
	}   
    columns {
        status()
        weather()
        name()
        lastSuccess()
        lastFailure()
        lastDuration()
        buildButton()
    }
}
