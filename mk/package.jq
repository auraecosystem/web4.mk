package web4.marketplace

version "1.0"

import "queries/marketplace.jqi"
import "queries/ai.jqi"
import "queries/blockchain.jqi"

config {

    output = "build"

    api = "/api"

    environment = "production"

}
