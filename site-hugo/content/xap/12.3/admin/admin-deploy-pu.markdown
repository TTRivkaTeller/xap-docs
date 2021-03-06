---
type: post123
title:  Deploying a Processing Unit
categories: XAP123ADM,PRM
weight: 400
canonical: auto
parent: admin-spaces-pu.html
---
 
 
 
**To deploy a Processing Unit to the Service Grid:**
 

{{%tabs%}}
{{%tab "Command Line Interface"%}}

*Command:*

`xap pu deploy`

*Description:*

Deploys a Processing Unit to the service grid.

*Parameters and Options:*

|Item | Name| Description |
|:----|:----|:------------|
|Parameter | name |Name of the Processing Unit to deploy|
|Parameter | file |Path to the Processing Unit file (.jar or .zip). |
|Option    | backups=\<backups\> |Specify the number of backups per partition.|
|Option    | instances=\<instances\> |Number of instances.|
|Option    | max-instances-per-machine=\<maxInstancesPerMachine\>|Define the maximum number of instances on same machine (from each partition).|
|Option    | max-instances-per-vm=\<maxInstancesPerVM\>| Define the maximum number of instances on same VM (from each partition). |
|Option    |partitions=\<partitions\> | Number of partitions. |
|Option    |property=\<String,String\>|Context properties.|
|Option    |schema=\<schema\>|Cluster schema/topology (partitioned, sync_replicated, async_replicated).|
|Option    |requires-isolation| If this Processing Unit should not share a container, adding this option provisions the Processing Unit in a dedicated container. |
|Option    |zones=\<zones\>| Define which zones can host this Processing Unit.|
|Option    |primary-zones=\<a,b,c\>| Define a list of preferred zones for primary instances (applies only when [Deterministic Deployment](./the-sla-deterministic.html) is configured).|

 
*Input Example:*

This example deploys a PU named **myPu** with 2 partitions using the mypu.jar file.

```bash
<XAP-HOME>/bin/xap pu deploy --partitions=2  myPu  mypu.jar
```
{{%/tab%}}


{{%tab "REST Manager API"%}}

*Path*

`POST /pus`


*Description:*

Deploys a Processing Unit to the service grid.

*Example:*
 
```bash
curl -X POST --header 'Content-Type: application/json' --header 'Accept: text/plain' -d '{ \ 
    "name": "myPu", \ 
    "resource": "myPu.jar", \ 
    "sla": { \ 
      "requiresIsolation": true, \ 
      "zones": [ \ 
        "string" \ 
      ], \ 
      "maxInstancesPerVM": 1, \ 
      "maxInstancesPerMachine": 1 \ 
    }, \ 
    "contextProperties": {} \ 
  }' 'http://localhost:8090/v1/deployments'
```

*Options:*

| Option | Description | Required |
|:-------|:------------|:---------|
|name | Name of the Processing Unit.| Yes |
|resource|File/Path to the Processing Unit file (.jar or .zip). | Yes|
|schema | Type of clustering schema/topology to use. | No| 
|instances | Number of instances to deploy. | No|
|partitions| Number of partitions. | No|
|backupsPerPartition|Number of backups per partition. | No| 
|requiresIsolation| If this Processing Unit should not share a container, adding this option provisions the Processing Unit in a dedicated container. | No|
|zones|Which zones can host this processing unit. | No|
|primaryZones|Define a list of preferred zones for primary instances (applies only when [Deterministic Deployment](./the-sla-deterministic.html) is configured). | No|
|contextProperties  |Context properties. | No|
 

{{%/tab%}}


{{%tab "Web Management Console"%}}

1. From the Deploy menu on the menu bar, select **Processing Unit**.
1. In the Processing Unit Deployment dialog box, do the following:

	<ol type="a">
		<li>To search an external repository for the relevant resource file, select the <b>Upload jar/war/zip file</b> option, click the Browse button next to the <b>Upload file</b> box, and select the required file.</li>
		<li>To use a local resource file, select the <b>Select from list</b> option and select the required file from the dropdown list.</li>
		<li>(Optional) If you want this Processing Unit to have a different name from the one specified in the resource file, type the new name in the <b>Override Processing Unit name</b> box.</li>
		<li>(Optional) If you want this Processing Unit to be secure, do the following In the <b>User Login Details</b> area:
		<ul>
			<li>Select <b>Secured Space</b>.</li>
			<li>Provide the user credentials in the <b>User Name</b> and <b>Password</b> boxes.</li>
		</ul></li>
	</ol>
	
1.	In the **Cluster Info** area, apply the required configuration details:

	<ol type="a">
		<li>In the <b>Cluster schema</b> box, specify the SLA definitions (cluster topology):
		<ul>
			<li><b>None</b> - A standalone Processing Unit with an embedded Space.</li>
			<li><b>Partitioned</b> - A cluster that is partitioned across the instances that are specified.</li>
			<li><b>Sync_replicated</b> - A cluster with synchronous replication across the instances that are specified.</li>
			<li><b>Async_replicated</b> - A cluster with asynchronous replication across the instances that are specified.</li>
		</ul></li>
		<li>In the <b>Number of Instances</b> box,  specify the number of primary Processing Unit instances to deploy in the cluster.</li>
		<li>(For partitioned clusters) In the <b>Number of Backups</b> box, define the number of backup Processing Units for each primary Processing Unit.</li>
		<li>In the <b>Max Inst. per VM</b> box, define the maximum number of Processing Unit instances each virtual host may contain (the default is 1).</li>
		<li>In the <b>Max Inst. per VM</b> box, define the maximum number of Processing Unit instances each physical host may contain.</li>
		<li>If you have more than one host, you can specify on which host to deploy the primary Processing Unit instances.</li>
	</ol>
	
1. Click **Deploy**.
 
{{%/tab%}}

{{%tab "GigaSpaces Management Center"%}}

Refer to the [GigaSpaces Management Center](./gigaspaces-management-center.html) topics in the Administration section.

{{%/tab%}}


{{%tab "Administration API"%}}
Refer to the [Admin API](../dev-java/administration-and-monitoring-overview.html) topics in the Developer Guide.
{{%/tab%}}

{{% /tabs %}}

