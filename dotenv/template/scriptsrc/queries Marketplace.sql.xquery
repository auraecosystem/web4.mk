query Products {

    from marketplace.products

    where status == "active"

    order by rating desc

    limit 100

    output json

}
