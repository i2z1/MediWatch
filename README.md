
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MediWatch

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of MediWatch is to present advanced scientific-based analytics
of health index using accessible indicators such as body temperature,
blood pressure, blood parameters etc.

## Installation

### As docker container

1.  Install [docker](https://docs.docker.com/engine/install/ubuntu/)
2.  Run

<!-- -->

    docker run -p 8080:80  ghcr.io/i2z1/mediwatch:latest

3.  Browse <http://127.0.0.1:8080/> at your browser

### As R package

You can install the released version of MediWatch from
[Github](https://github.com/i2z1/MediWatch) with:

``` r
devtools::install_github("i2z1/MediWatch")
options('shiny.port'=8080,shiny.host='127.0.0.1');MediWatch::run_app()
```

And then browse <http://127.0.0.1:8080/> at your browser
