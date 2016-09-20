# QKR - Quality Knowledge Repository

Quality Knowledge Repository (QKR) stores Data Quality Concepts (DQC) and their methods of computation across IQ domain. We used these relationships identified through extensive literature search to design and develop a data quality meta-model.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Move to RESTful services if you do not want to deploy QKR instance of your own.

### Prerequisities

* Oracle 11g or higher (For deploying your own QKR). 
* To test Rest services: 
 * RESTClient [Firefox Users](https://addons.mozilla.org/en-US/firefox/addon/restclient/)
 * Advanced-rest-clinet [Chrome Users](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo?hl=en-US)
* Any Browser! :) 


### Installing or Access to contents

QKR can be installed imported to your own db or can be accessed via following ways.
* To import QKR-data to your db, identify 'qmdr_script.sql' located in QKR_Repo folder and simply run the script.
* To log-in to exisiting Oracle Application Express demo: Request log-in credentials for a demo instance located at www.apex.oracle.com (please send your request for a readonly access to readqkr@gmail.com)
* To access programmatically, check RESTful services documentation.

### Data Model

QKR is a meta-data repository built on ideas established by [OpenFurther's MDR] (https://github.com/openfurther/further-open-doc/blob/master/reference-manual.asciidoc). OpenFurther's MDR follows ISO 15836:2009 (Dublin Core Metadata Standard Elements) for modeling. We extended and implmented this approach towards our application. 
![alt tag](https://github.com/naresh-sundarrajan/QKR/blob/master/Images/QMDR_ER.png) 


## Running the queries

Once the data is loaded into the schema, here are the following ways by which you can query the QKR. 

Query to identify different data quality conceptual frameworks loaded in QKR.
```
Select ASSET_ID,ASSET_LABEL,ASSET_DSC,ASSET_NAMESPACE_ASSET_ID,ASSET_ACTIVATE_DT  
From ASSET
WHERE ASSET_TYPE_ASSET_ID=10001; 

```

**Results**

|ASSET_ID       | ASSET_LABEL   |   ASSET_DSC                       | ASSET_NAMESPACE_ASSET_ID  |   ASSET_ACTIVATE_DT   |
|-------------  |-------------  |---------------------------------- |-------------------------- |----------------       |
|10000000       |   NDQM        |   Rajan Data Quality Model        |   10000                   |   22-JAN-16           |
|10000008       |   JDQO        |   Jonhson Data Quality Ontology   |   10000                   |   29-JAN-16           |
|10000021       |   KDQM        |   Kahn Data Quality Model         |   10000                   |   02-FEB-16           |
|10000          |   System      |   This is the System Shared Namespace |10000                      |   22-JAN-16           |
|10000002       |   WDQM        |   Weiskopf Data Quality Concepts      |10000                      |   27-JAN-16       |
|10000027       |   WSDQM       |   Wang Data Quality Model         |   10000                   |   02-FEB-16           |
|10000064       |   ADQT            |   Almutiry Data Quality Model     |   10000       |   02-FEB-16|

## RESTful based Services

Currently, QKR features Oracle Rest Data Services (ORDS) based web-services. These are following services and their location.

API Root Endpoint: 
```
https://apex.oracle.com/pls/apex/qmdr/qmdr/{Services_Name}
```

| Parameter 	|                                           Description                                           	|                             Example                            	|
|:---------:	|:-----------------------------------------------------------------------------------------------:	|:--------------------------------------------------------------:	|
| dqms      	| Provides a JSON structured data of Data Quality Models Present in QKR                           	|     > curl https://apex.oracle.com/pls/apex/qmdr/qmdr/dqms/    	|
| dqm/{ID}  	| Provides a JSON structured data of Data Quality Model with given ASSET_ID {ID}                  	| > curl https://apex.oracle.com/pls/apex/qmdr/qmdr/dqm/10000002 	|
| jdqo      	| Provides a JSON structured data specifically for Johnson et al. Data Quality Ontology           	|     >curl https://apex.oracle.com/pls/apex/qmdr/qmdr/jdqo/     	|
| kdqm      	| Provides a JSON structured data specifically for Kahn et al. Conceptual Data Quality Framework. 	| >curl https://apex.oracle.com/pls/apex/qmdr/qmdr/kdqm/         	|


*At any point of time if an user wishes to obtain a CSV file format, prefix the word _csv_ on any service name to obtain a downloadable csv output. For example: To obtain dqms service results as CSV file, use _csvdqms_ instead. This will direct you to a page where you can download the CSV version of the data. *

## Built With

* Dropwizard - Bla bla bla
* Maven - Maybe
* Atom - ergaerga

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

(:
: Copyright (C) [2013] [The FURTHeR Project]
:
: Licensed under the Apache License, Version 2.0 (the "License");
: you may not use this file except in compliance with the License.
: You may obtain a copy of the License at
:
:         http://www.apache.org/licenses/LICENSE-2.0
:
: Unless required by applicable law or agreed to in writing, software
: distributed under the License is distributed on an "AS IS" BASIS,
: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
: See the License for the specific language governing permissions and
: limitations under the License.
:)

## Acknowledgments

This project is supported in part by the National Center for Advancing Translational Sciences of the National Institutes of Health under Award Number UL1TR001067. The content is solely the responsibility of the authors and does not necessarily represent the official views of the National Institutes of Health. NSR was partially supported by the Richard A. Fay and Carole M. Fay Endowed Graduate Fellowship for the Department of Biomedical Informatics in honor of Homer R. Warner, MD, PhD. Computer resources were provided by the Utah Center for High Performance Computing.
