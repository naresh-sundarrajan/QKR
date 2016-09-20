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
WHERE ASSET_TYPE_ASSET_ID=10001; ```

Results
ASSET_ID      | ASSET_LABEL |   ASSET_DSC                       | ASSET_NAMESPACE_ASSET_ID  |   ASSET_ACTIVATE_DT
------------- |-------------|---------------------------------- |-------------------------- |---------------- 
10000000      | NDQM        |   Rajan Data Quality Model        |   10000                   |   22-JAN-16
Content Cell  | Content Cell

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

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

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc

