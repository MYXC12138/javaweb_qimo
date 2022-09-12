package dao;

public class Shopindent {
    int id;          //订单编号，自增长
    String sname;    //商品名字
    String nname;    //用户名字
    String nadd;     //地址
    int shuliang;    //数量
    String jianum;   //价格总和

    public String getNadd() {
        return nadd;
    }

    public void setNadd(String nadd) {
        this.nadd = nadd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getNname() {
        return nname;
    }

    public void setNname(String nname) {
        this.nname = nname;
    }

    public int getShuliang() {
        return shuliang;
    }

    public void setShuliang(int shuliang) {
        this.shuliang = shuliang;
    }

    public String getJianum() {
        return jianum;
    }

    public void setJianum(String jianum) {
        this.jianum = jianum;
    }
}
