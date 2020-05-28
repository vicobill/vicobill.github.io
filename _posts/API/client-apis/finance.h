/* 金融 */

/// 支付
int fr_finance_buy_async(void*);       // 购买
int fr_finance_pay_async(void*);       
int fr_finance_charge_async(void*);

/// 商城。
int fr_mall_list_async(void*);
int fr_mall_shelf_async(void*);     // 租赁小摊，商家商品
int fr_mall_unshelf_async(void*);
int fr_mall_alt_price_async(void*);     // 修改商品价格

int fr_mall_shelf_options(void*);   // 商店上架条件
int fr_mall_sort(void*);
int fr_mall_goods_info_async(void*);


/// 拍卖行。每个物品都有起价和每次加价，物品可被流拍
int fr_auction_list_async(void*);   // 列出拍卖的物品
int fr_auction_call_async(void*);   // 叫价
int fr_auction_order_async(void*);  // 预约拍卖

int fr_auction_shelf_async(void*);
int fr_auction_unshelf_async(void*);

int fr_auction_shelf_options(void*);    // 拍卖上架条件
int fr_auction_sort(void*);
int fr_auction_goods_info_async(void*);

/// 交易所。交易所是自由交易所，可以联系买家，实时商议价格
int fr_exshop_shelf_async(void*);
int fr_exshop_unshelf_async(void*);
int fr_exshop_bargin_async(void*);  // 讨价还价
int fr_exshop_deal_async(void*);    // 成交

int fr_exshop_shelf_options(void*);
int fr_exshop_sort(void*);

int fr_exshop_goods_info_async(void*);