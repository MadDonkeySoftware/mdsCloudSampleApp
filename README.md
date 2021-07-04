# mdsCloudSampleApp

## Prerequisites

* [Terraform](https://www.terraform.io/downloads.html)
  * At the time of this writing v1.0.1 was used for testing
* [mdsCloud Terraform Provider](https://github.com/MadDonkeySoftware/mdsCloudTerraformProvider/releases) installed.
  * Feel free to use the latest version of this. At the time of this writing v0.0.1-beta1 was used for testing.
* [mdsCloud CLI](https://github.com/MadDonkeySoftware/mdscloudcli)
* a mdsCloud environment to work against
  * For local development / testing we recommend [mdsCloud-in-a-box](https://github.com/MadDonkeySoftware/mdsCloudInABox)

## Quick Start

* Run `pre-terraform` script
  * Creates a sample/test user for the mdsCloud platform
  * Creates a mdsCloud file service container as an example of shared Terraform state.
* Run `run-terraform`
  * Creates various items in the mdsCloud system for testing.
* Play around!
  * If all has gone well at this point you should have a functioning mdsCloud sample application. Try out some commands through the mdsCloud CLI.
    * the `mds` cli attempts to be as discoverable as possible. All commands include a `--help` option so feel free to explore without fear of breaking your environment.
    * `mds sf list --env local` -- get a list of available serverless functions
    * `mds sf invoke --input-type object --input '{ "message": "You rock!" }' --env local orid:1:mdscloud:::1001:sf:8fc378af-46e2-48fd-ab3b-257b0b563a37` -- Invokes a serverless function directly and prints the result to the screen
    * `mds sm list --env local` -- get a list of available state machines
    * `mds sm invoke --watch --env local orid:1:mdsCloud:::1001:sm:c41c866e-41ce-47e7-9ae6-2d39f51393c5 '{ "message": "You rock!"}'` -- Invokes the state machine and polls for state changes until it is complete.
