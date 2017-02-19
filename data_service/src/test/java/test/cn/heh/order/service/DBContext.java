
package test.cn.heh.order.service;


public class DBContext {
    private static final ThreadLocal<String> tlDbKey = new ThreadLocal<String>();

    public static String getDBKey() {
        return tlDbKey.get();
    }

    public static void setDBKey(String dbKey) {
        tlDbKey.set(dbKey);
    }
}