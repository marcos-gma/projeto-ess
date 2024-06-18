import { defineFeature, loadFeature } from "jest-cucumber";
import supertest from "supertest";
import app from "../../..";

const feature = loadFeature("./tests/promo/castrarPromo/cadastrarPromo.feature");
const request = supertest(app);

defineFeature(feature, (test) => {
    
});