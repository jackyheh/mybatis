package cn.heh.order.entity.test02;

import javax.persistence.*;

@Table(name = "app_order")
public class AppOrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 订单号
     */
    @Column(name = "orderId")
    private String orderid;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取订单号
     *
     * @return orderId - 订单号
     */
    public String getOrderid() {
        return orderid;
    }

    /**
     * 设置订单号
     *
     * @param orderid 订单号
     */
    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }
}