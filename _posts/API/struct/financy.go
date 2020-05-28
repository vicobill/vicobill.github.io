
package financy;

/*< 货币 */
type Currency struct  { 
    coin            int64;           /*< 应流通货币 */
    xcoin           int64;          /*< 数字流通货币 */
};

type ReqFrom struct {
    rt_appid        string;
    rt_platform     int32;
    pay_platform    int16;
    time            int64;
}

// 收入记录
type   IncomingRec struct {
    from            int16;               /*< 来源类型 */
    income          Currency;         /*< 获得流通货币值 */

    next            *IncomingRec;
};

// 充值记录
type  ChargeRec struct {
    order           Order;     /*< 订单信息 */
    
    currency        Currency;
    ReqFrom

    next            *ChargeRec;
};


/* 订单信息 */
type OrderInfo struct {
    order_id        string ;                /*< 订单号 */
    state           int32;
    time            string;
};

type OrderRec struct {
    OrderInfo 
    next    *OrderRec;
}

/**
 * 支付记录项
 */
type  PayRec struct {
    order       OrderInfo;

    item_id     int32;         /** 购买道具列表 */
    item_num    int32;
    
    ReqFrom

    next        *PayRec;
};


/** 消费记录项 */
type CostRec struct{
    currency        Currency;       /*< 消耗的货币数量 */
    item_id         int32;         /*< 消耗的道具ID */
    item_num        int32;
    ReqFrom          

    next            *CostRec;
};

/* 银行信息 */
type BankInfo struct  {
    Currency
    IncomingRec
    ChargeRec
    CostRec
    PayRec
    
    unproc_orders OrderRec;          // 未处理的订单记录
    
};
