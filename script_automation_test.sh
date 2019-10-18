for collection in ./test-postman/Flows/*;
 do newman run "$collection" --environment ./test-postman/Environments/environment_postman.json --reporter-html-export ./test-postman/ --reporters=cli,htmlextra; 
 done
