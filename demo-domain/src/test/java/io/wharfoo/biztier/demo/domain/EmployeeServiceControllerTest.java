package io.wharfoo.biztier.demo.domain;

//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Description:
 * @author: xuanwei
 */
//@RunWith(SpringJUnit4ClassRunner.class)
//@SpringBootTest(classes = ApplicationTest.class)
//@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//public class EmployeeServiceControllerTest {
//    @Autowired
//    private EmployeeRepository employeeRepository;
//
//    private static Long test_id = null;
//
//    /**
//     * 创建品牌
//     */
//    @Test
//    public void createEmployee() throws UnsupportedEncodingException {
//        String url = "http://localhost:7070/api/v1/uc/employee";
//        RestTemplate restTemplate = BizRestTemplateFactory.create();
//        Employee employee = new Employee();
//        employee.setAppId("101");
//        employee.setEmpName("员工test");
//        employee.setEmpCode("yg001");
//        employee.setEmpPhone("13412345678");
//        HashMap ext = new HashMap();
//        ext.put("none", 123);
//        employee.setEmpExtension(ext);
//
//
//        HttpHeaders headers = new HttpHeaders();
//        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
//        headers.setContentType(type);
//        headers.add("Accept", MediaType.APPLICATION_JSON.toString());
//        HttpEntity<Employee> formEntity = new HttpEntity<Employee>(employee, headers);
//
//        ResObject robReturn = restTemplate.postForObject(url, formEntity, ResObject.class);
//        LinkedHashMap lhMap = (LinkedHashMap) robReturn.getData();
//        test_id = new Long(lhMap.get("id").toString());
//        assert (lhMap.get("id") != null);
//    }
//}
