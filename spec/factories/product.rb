FactoryBot.define do
    factory :product1, class: Product do
        name {"Curso de NodeJS"}
        image {"https://edteam-media.s3.amazonaws.com/courses/original/3cc48fa0-8327-4561-aa04-dafc3b799909.png"}
        price {100}
        currency {"USD"}
        quantity {2}
    end

    factory :product2, class: Product do
        name {"Curso de Ruby on Rails"}
        image {"https://edteam-media.s3.amazonaws.com/courses/original/39dd6eb2-bb40-409f-b95f-c21d6542bb78.png"}
        price {150}
        currency {"ARS"}
        quantity {3}
    end

    factory :product3, class: Product do
        name {"Curso de ReactJS"}
        image {"https://dc722jrlp2zu8.cloudfront.net/media/fbads-react-principiantes2.png"}
        price {199.99}
        currency {"USD"}
        quantity {4}
    end
end 