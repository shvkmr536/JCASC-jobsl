multibranchPipelineJob("supplychain-storepromptedcounts-service-v1") {

	branchSources {

       git  {

	   		id('supplychain-storepromptedcounts-service-v1')

			// Add credential to access the BitBucket repository...

			credentialsId('BBCREDENTIALS')

			// BitBucket repository path...

			remote('https://morrisonsjenkins@bitbucket.org/morrisonsplc/supplychain-storepromptedcounts-service-v1.git')

        }

	}


	orphanedItemStrategy {	

		discardOldItems {

            numToKeep(-1)

        }

	}


/*triggers {
            periodic(300)
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

			includes('develop dev-* sit-* uat-* pre-* prd-*')

			excludes('master') // master branch is not exposed to Jenkins builds...

		}

	}

} 
