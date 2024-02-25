s-Market-App

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <p align="center">
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template">View Demo</a>
  </p>
</div>

<!-- ABOUT THE PROJECT -->
# ABOUT THE PROJECT
![architecture](https://i.imgur.com/Qs8rcZl.png)
![architecture](https://i.imgur.com/4bNWN60.png =100x20)
![architecture](https://i.imgur.com/OBebCko.png =100x20)
![architecture](https://i.imgur.com/zApUehw.png)

	Flask REST API for a weather service which provides info about countries, cities and temperatures.

---Architecture

	    As seen in docker-compose.yml, I have 3 microservices (python-rest-api, MongoDB database and
    mongo express database utility). I have used 2 networks, one between rest api and mongo db and 
    one between mongo db and mongo express. Both mongo db and mongo express are protected by user and 
    password authentication, credentials are found in docker compose. I also used 2 volumes, one for 
    mongo db and one for mongo express. At running docker-compose, the database is initialized with the
    init-db.js script (create the 3 collections - country, city and temperatures and set for each unique
    constraints on the required fields). 
	    In Dockerfile I install the packages from requirments.txt, set the current directory, host
    and port on which the application runs. In docker-compose.yml, I drag the mongo db and mongo express
    images, I put the credentials in environment variables, and set the ports and volumes for
    data persistence. Build the api from Dockerfile.

---General aspects

	PROBLEM
	    ➤ inefficient picking
	    ➤ time & money wasted
	    ➤ limited staff resources
	SOLUTION
	    ➤ supermarket mapping
	    ➤ optimizing algorithms
	    ➤ client satisfaction

	s'Market generates the optimal route for in-store product pickers to gather all the products on 
    the customer's shopping list. Through indoor store mapping and optimization algorithms, s' Market 
    improves pickers' work and delivers 100% yield even for inexperienced pickers from day one.
	The picker scans each product in front of its shelf. We can make a decision based on the scanning 
    output. The system can print the following route once the product is successfully scanned by the 
    picker (from product 1 to product 2, then from product 2 to product 3, and so on). The "Got it" 
    button on the MVP represents the equivalent of the scan output.


### Built With
* [![Python][Python]][Python-url]
* [![Javascript][Javascript]][Javascript-url]
* [![Docker][Docker]][Docker-url]


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/CosminAvramescu/Python-MongoDB-Containerized-REST-API.git
   ```
2. Install Docker


<!-- USAGE EXAMPLES -->
## Usage

1. Run Docker daemon
2. Run "docker compose up"
3. Check mongo express at localhost:8081
4. Run the collection of tests in Postman (import postman_testing_script.json file)


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.



<!-- CONTACT -->
## Contact

Cosmin-Alexandru Avramescu - [@my_linkedin](https://www.linkedin.com/in/cosmin-avramescu/)

Project Link: [https://github.com/CosminAvramescu/Python-MongoDB-Containerized-REST-API](https://github.com/CosminAvramescu/Python-MongoDB-Containerized-REST-API)


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Docker + python rest api](https://dev.to/francescoxx/python-fullstack-rest-api-app-with-docker-1101)
* [Docker compose](https://docs.docker.com/compose/)



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[Python]: https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54
[Python-url]: https://docs.python.org/3.10/
[Javascript]: https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E
[Javascript-url]: https://devdocs.io/javascript/
[Docker]: https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://docs.docker.com/