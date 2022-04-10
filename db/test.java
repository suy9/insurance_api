package test;

import java.io.*;
import java.math.BigDecimal;
import java.math.RoundingMode;

class function {
    public String email() {
        String email = "";
        for (int i = 0; i < 8; i++) {
            email += (char) (Math.random() * 26 + 'a');
        }
        email += "@";
        for (int i = 0; i < 2; i++) {
            email += (char) (Math.random() * 26 + 'a');
        }
        email += ".";
        for (int i = 0; i < 3; i++) {
            email += (char) (Math.random() * 26 + 'a');
        }
        return email;
    }

    public String phone() {
        String phone = "";
        String[] start = {"133", "149", "153", "173", "177", "180", "181", "189", "199", "130", "131", "132",
                "145", "155", "156", "166", "171", "175", "176", "185", "186", "166", "134", "135",
                "136", "137", "138", "139", "147", "150", "151", "152", "157", "158", "159", "172",
                "178", "182", "183", "184", "187", "188", "198", "170", "171"};
        phone += start[(int) (Math.random() * start.length)];
        for (int i = 0; i < 8; i++) {
            phone += (char) (Math.random() * 10 + '0');
        }
        return phone;
    }

    public String address() {
        String address = "";
        String[] start = {"北京市", "上海市", "广州市", "深圳市", "成都市", "重庆市", "天津市", "西安市", "杭州市",
                "南京市", "武汉市", "苏州市", "郑州市", "长沙市", "青岛市", "大连市", "沈阳市", "济南市", "福州市",
                "厦门市", "合肥市", "南昌市", "南宁市", "昆明市", "贵阳市", "兰州市", "乌鲁木齐市", "西宁市", "呼和浩特市",
                "拉萨市", "银川市", "海口市", "三亚市", "香港市", "澳门市", "台湾市"};
        address += start[(int) (Math.random() * start.length)];
        return address;
    }

    public String education() {
        enum e {
            博士, 硕士, 本科, 专科, 高中, 初中, 小学, 无
        }
        e edu = e.values()[(int) (Math.random() * 8)];
        return edu.toString();
    }

    public String num() {
        // 随机生成编号
        String num = "itcast-";
        for (int i = 0; i < 13; i++) {
            num += (char) (Math.random() * 9 + '0');
        }
        return num;
    }

    public double price() {
        // 随机数带两位小数
        double price = Math.random() * 10000;
        BigDecimal bd = new BigDecimal(price);
        Double d = bd.setScale(2, RoundingMode.HALF_UP).doubleValue();
        return d;
    }

    public String sex() {
        enum e {
            男, 女
        }
        e kind = e.values()[(int) (Math.random() * 2)];
        return kind.toString();
    }

    public int order_pay() {
        // 随机生成订单支付状态
        int num = (int) (Math.random() * 3);

        return num + 1;
    }



    public String kind() {
        enum e {
            意外险,
            医疗险,
            重疾险,
            养老险,
            车险,
            企财险,
            工程险,
            责任险,
            信用险,
            保证险,
        }
        e kind = e.values()[(int) (Math.random() * 10)];
        return kind.toString();
    }

    //随机生成日期
    public String create_date() {
        String[] months = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};
        String[] days = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"};
        int year = (int) (Math.random() * 3 + 2014);
        String date = year + "-" + months[(int) (Math.random() * 12)] + "-" + days[(int) (Math.random() * 31)];
        return date;
    }

    public String update_date() {
        String[] months = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};
        String[] days = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"};
        int year = (int) (Math.random() * 3 + 2018);
        String date = year + "-" + months[(int) (Math.random() * 12)] + "-" + days[(int) (Math.random() * 31)];
        return date;
    }

    public String next_date() {
        String[] months = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};
        String[] days = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"};
        int year = 2022;
        String date = year + "-" + months[(int) (Math.random() * 12)] + "-" + days[(int) (Math.random() * 31)];
        return date;
    }
    public int pay_status(String date){
        System.out.println(date);
        int month=Integer.parseInt(date.substring(5,7));
        int day =Integer.parseInt(date.substring(8,10));
        if(month <4)
            return 1;
        else if (month==4&&day<=10)
            return 1;
        return 0;
    }
}

public class test {
    public static void main(String[] args) {
        //文件中获取数据
        BufferedReader br = null;
        BufferedWriter bwuser = null;
        BufferedWriter bwseller = null;
        BufferedWriter bworder = null;
        try {
            br = new BufferedReader(new FileReader("src/test/zzz.txt"));
            bwuser = new BufferedWriter(new FileWriter("src/test/user.txt", true));
            bwseller = new BufferedWriter(new FileWriter("src/test/seller.txt", true));
            bworder = new BufferedWriter(new FileWriter("src/test/order.txt", true));
            // 读取文件
            String line = br.readLine();


            for (int j = 1; j <= 1000; j++) {

                String email = new function().email();

                String str = line.substring(line.length() - 18);
                String birth = str.substring(6, 10) + "-" + str.substring(10, 12) + "-" + str.substring(12, 14);
                String phone = new function().phone();
                String education = new function().education();
                String sex = new function().sex();
                String address = new function().address();
                bwuser.write("INSERT INTO `sp_user`\n" +
                        "VALUES ('" + j + "', '" + str + "', 'test" + j + "', '" + birth + "', '"+address+"', '" + phone + "',\n" +
                        "        'usertest" + j + "', '123321', '" + email + "', '" + sex + "', null, '" + education + "', '1512033129', '1512033129');" + "\n");
                line = br.readLine();


                String str1 = line.substring(line.length() - 18);
                String birth1 = str1.substring(6, 10) + "-" + str1.substring(10, 12) + "-" + str1.substring(12, 14);
                String phone1 = new function().phone();
                String education1 = new function().education();
                String sex1 = new function().sex();
                String address1 = new function().address();
                bwseller.write("INSERT INTO `sp_seller`\n" +
                        "VALUES ('" + j + "', '" + str1 + "', 'seller" + j + "', '" + birth1 + "', '"+address1+"', '" + phone1 + "',\n" +
                        "        'sellertest" + j + "', '123321', '" + email + "', '" + sex1 + "', null, '" + education1 + "', '1512033129', '1512033129');" + "\n");
                line = br.readLine();

                String kind = new function().kind();
                String num = new function().num();
                double price = new function().price();
                int pay = new function().order_pay();
                String date = new function().create_date();
                String date1 = new function().update_date();
                String date2 = new function().next_date();
                int status = new function().pay_status(date2);
                bworder.write("INSERT INTO `sp_order`\n" +
                        "VALUES ('" + j + "', '" + str + "', '" + str1 + "', '" + kind + "', '" + num + "', '" + price + "', '" + pay + "', '" + status + "', '" + date + "', '" + date1 + "', '" + date2 + "');\n");


            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } finally {
            try {
                br.close();
                bwuser.close();
                bwseller.close();
                bworder.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
