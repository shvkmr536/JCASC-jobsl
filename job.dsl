multibranchPipelineJob("promptedcountexception-task-initiator-lambda") {

    branchSources {
    branchSource {
        source {
         git {
            id('promptedcountexception-task-initiator-lambda')

            // Add credential to access the BitBucket repository...

            credentialsId('BBCREDENTIALS')

            // BitBucket repository path...

            remote('https://morrisonsjenkins@bitbucket.org/morrisonsplc/supplychain-promptedcountexception-task-initiator-lambda.git')
        }
    }
    strategy {
                defaultBranchPropertyStrategy {
                    props {
                        noTriggerBranchProperty()
                    }
                }
            }
        }
    }
    orphanedItemStrategy {  
        discardOldItems {
            numToKeep(-1)
        }
    }
    /*triggers {
        // Automatically scan the DSL job every 120 seconds...

        // If more frequent DSL scan is needed then reduce this value to desire seconds...
        periodic(1200)
    }*/
    // Scan Branches in the repository...
    configure {
        def traits = it / sources / data / 'jenkins.branch.BranchSource' / source / traits
        traits << 'jenkins.plugins.git.traits.BranchDiscoveryTrait' {
            strategyId(3)
        }
    }
    // Scan Tags in the repository...

    configure {

        def traits = it / sources / data / 'jenkins.branch.BranchSource' / source / traits

        traits << 'jenkins.plugins.git.traits.TagDiscoveryTrait' {

            strategyId(3)
        }
    }

    // Filter unwanted Branches and Tags. The build from Brach is automatically fired in current morrisons Jenkins...

    // For this reason except develop branch no other branches should be exposed to Jenkins pipeline... 

    // All other non development builds (like sit, uat, prd, pte etc) should be done via tags...

    // Jenkins builds on tags are not automated at present and thus provides better control...

    configure {

        def traits = it / sources / data / 'jenkins.branch.BranchSource' / source / traits

        traits << 'jenkins.scm.impl.trait.WildcardSCMHeadFilterTrait' {

            includes('develop dev-* sit-* uat-* pre-*')

            excludes('master') // master branch is not exposed to Jenkins builds...
        }
    }
} 
