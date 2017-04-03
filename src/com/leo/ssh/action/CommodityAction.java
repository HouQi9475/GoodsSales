package com.leo.ssh.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.leo.ssh.biz.IBigcommodityclassBiz;
import com.leo.ssh.biz.ICommodityBiz;
import com.leo.ssh.biz.ICommodityclassBiz;
import com.leo.ssh.domain.Bigcommodityclass;
import com.leo.ssh.domain.Commodity;
import com.leo.ssh.domain.Commodityclass;
import com.leo.ssh.domain.Orderitem;
import com.leo.ssh.domain.Users;
import com.leo.ssh.page.PageBean;
import com.leo.ssh.tools.Cart;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class CommodityAction extends BaseAction implements RequestAware, ModelDriven<Commodity> {

	private Commodity commodity;
	private ICommodityclassBiz commodityclassBiz;
	private IBigcommodityclassBiz bigcommodityclassBiz;
	private ICommodityBiz commodityBiz;
	private Date begin;
	private Date end;
	private int currentPage;
	private String commodityIds;
	private File goodspicture;
	private String goodspictureFileName;
	private String goodspictureContentType;
	private Map<String, Object> request;
	private int quantity;
	private int commodityid;
	private int commodityclassid;
	private int smallcommodityclassid;
	private String findBycommodityName;
	

	public String getFindBycommodityName() {
		return findBycommodityName;
	}

	public void setFindBycommodityName(String findBycommodityName) {
		this.findBycommodityName = findBycommodityName;
	}

	public void setBigcommodityclassBiz(IBigcommodityclassBiz bigcommodityclassBiz) {
		this.bigcommodityclassBiz = bigcommodityclassBiz;
	}

	public void setCommodityclassid(int commodityclassid) {
		this.commodityclassid = commodityclassid;
	}

	public int getCommodityid() {
		return commodityid;
	}

	public void setSmallcommodityclassid(int smallcommodityclassid) {
		this.smallcommodityclassid = smallcommodityclassid;
	}

	public void setCommodityid(int commodityid) {
		this.commodityid = commodityid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public File getGoodspicture() {
		return goodspicture;
	}

	public void setGoodspicture(File goodspicture) {
		this.goodspicture = goodspicture;
	}

	public String getGoodspictureFileName() {
		return goodspictureFileName;
	}

	public void setGoodspictureFileName(String goodspictureFileName) {
		this.goodspictureFileName = goodspictureFileName;
	}

	public String getGoodspictureContentType() {
		return goodspictureContentType;
	}

	public void setGoodspictureContentType(String goodspictureContentType) {
		this.goodspictureContentType = goodspictureContentType;
	}

	public String getCommodityIds() {
		return commodityIds;
	}

	public void setCommodityIds(String commodityIds) {
		this.commodityIds = commodityIds;
	}

	public void setCommodityclassBiz(ICommodityclassBiz commodityclassBiz) {
		this.commodityclassBiz = commodityclassBiz;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Date getBegin() {
		return begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public void setCommodityBiz(ICommodityBiz commodityBiz) {
		this.commodityBiz = commodityBiz;
	}

	@Override
	public Commodity getModel() {
		// TODO Auto-generated method stub
		return this.commodity;
	}

	public String checkout() throws Exception {
		Map session = (Map) ActionContext.getContext().getSession();
		Cart cart = (Cart) session.get("cart");
		if (cart == null) {
			this.addActionError("空订单别乱提交！");
			return "index";
		}
		return Action.SUCCESS;
	}

	public String addToCart() throws Exception {
		Map session = (Map) ActionContext.getContext().getSession();
		Users users = (Users) session.get("users");
		if (users == null) {
			return Action.ERROR;
		}
		Commodity commodity = this.commodityBiz.findById(commodityid);
		Orderitem orderitem = new Orderitem();
		if (quantity > commodity.getCommodityLeaveNum()) {
			orderitem.setQuantity(commodity.getCommodityLeaveNum());
		} else {
			orderitem.setQuantity(quantity);
		}
		orderitem.setCommodity(commodity);

		System.out.println("购物车数量" + quantity);

		Cart cart = (Cart) session.get("cart");
		if (cart == null) {
			cart = new Cart();
		}
		cart.addCart(commodityid, orderitem);
		int n = cart.getTotalPrice();
		int y = cart.yuanjia();
		session.put("y", y);
		session.put("n", n);
		System.out.println(n);
		session.put("cart", cart);
		return Action.SUCCESS;
	}

	public String updateCart() throws Exception {

		Map session = (Map) ActionContext.getContext().getSession();
		Cart cart = (Cart) session.get("cart");
		Commodity comm = commodityBiz.findById(commodityid);
		System.out.println("更新数量" + quantity);
		System.out.println("该商品的名称：" + comm.getCommodityName());
		if (quantity > comm.getCommodityLeaveNum()) {
			cart.updateCart(commodityid, comm.getCommodityLeaveNum());
		} else {
			cart.updateCart(commodityid, quantity);
		}

		int n = cart.getTotalPrice();
		int y = cart.yuanjia();
		session.put("y", y);
		session.put("n", n);
		session.put("cart", cart);
		return Action.SUCCESS;
	}

	public String deleteCart() throws Exception {
		Map session = (Map) ActionContext.getContext().getSession();
		Cart cart = (Cart) session.get("cart");
		cart.deleteCart(commodityid);
		int n = cart.getTotalPrice();
		int y = cart.yuanjia();
		session.put("y", y);
		session.put("n", n);
		session.put("cart", cart);
		return Action.SUCCESS;
	}

	public String removeCart() throws Exception {
		Map session = (Map) ActionContext.getContext().getSession();
		session.remove("cart");
		session.remove("n");
		session.remove("y");
		return Action.SUCCESS;

	}

	public String findByClass() throws Exception {
		Bigcommodityclass bcc = this.bigcommodityclassBiz.findById(commodityclassid);
		String HQL = "select c from Commodity as c where c.commodityclass.bigcommodityclass.bigclassid=?";
		int bigclassid = bcc.getBigclassid();
		List<Commodity> lstCommodity = this.commodityBiz.findByHQL(HQL, bigclassid);
		// System.out.println("大小:"+lstCommodity.size());
		Map session = (Map) ActionContext.getContext().getSession();
		session.put("bcc", bcc);
		session.put("lstCommodity", lstCommodity);
		return Action.SUCCESS;
	}

	public String findBySmallClass() throws Exception {
		System.out.println("小类别：" + smallcommodityclassid);
		String HQL = "select c from Commodity as c where c.commodityclass.commodityClassId=?";
		List<Commodity> lstCommodity = this.commodityBiz.findByHQL(HQL, smallcommodityclassid);
		Map session = (Map) ActionContext.getContext().getSession();
		session.put("lstCommodity", lstCommodity);
		return Action.SUCCESS;
	}

	public String findById() throws Exception {
		int id = this.commodity.getCommodityId();
		Commodity commodity = this.commodityBiz.findById(id);
		this.getRequest().setAttribute("commodity", commodity);
		return Action.SUCCESS;
	}

	public String findByid() throws Exception {
		int cid = this.commodity.getCommodityId();
		System.out.println(cid);
		Commodity newcommodity = this.commodityBiz.findById(cid);
		request.put("commodity", newcommodity);
		return Action.SUCCESS;
	}

	public String findAll() throws Exception {
		List<Commodity> lstCommodities = this.commodityBiz.findAll();
		this.getRequest().setAttribute("lstCommodities", lstCommodities);

		return Action.SUCCESS;
	}

	public String preupdate() throws Exception {
		int commodityId = this.commodity.getCommodityId();
		Commodity commodity = this.commodityBiz.findById(commodityId);
		this.getRequest().setAttribute("commodity", commodity);
		List<Commodityclass> lstClass = this.commodityclassBiz.findAll();
		this.getRequest().setAttribute("lstClass", lstClass);
		return Action.SUCCESS;
	}

	public String update() throws Exception {
		System.out.println("更新时图片：" + commodity.getImage());
		System.out.println("更新时名字：" + commodity.getCommodityName());
		System.out.println("更新时时间：" + commodity.getRegTime());
		this.commodityBiz.update(commodity);
		return Action.SUCCESS;
	}

	public String delete() throws Exception {
		int commodityId = this.commodity.getCommodityId();
		this.commodityBiz.delete(commodityId);
		return Action.SUCCESS;
	}

	public String preadd() throws Exception {
		List<Commodityclass> lstClasss = commodityclassBiz.findAll();
		getRequest().setAttribute("lstClasss", lstClasss);
		return Action.SUCCESS;
	}

	public String add() throws Exception {
		// 处理上传的文件
		if (goodspicture != null) {
			// 存储目录
			String path = ServletActionContext.getServletContext().getRealPath("images/goodsimage");
			File fpath = new File(path);
			if (!fpath.exists()) {
				fpath.mkdirs();
			}
			// 验证类型
			if (!goodspictureContentType.contains("image")) {
				this.clearMessages();
				this.addActionMessage("图书图片必须是图片文件！");
				return Action.ERROR;
			}
			// 验证大小
			if (goodspicture.length() > 500 * 1024) {
				this.clearMessages();
				this.addActionMessage("图书图片必须小于500K！");
				return Action.ERROR;
			}
			// 文件名
			String[] fns = goodspictureFileName.split("\\.");
			String filename = System.currentTimeMillis() + "." + fns[fns.length - 1];
			// 使用流保存文件
			try {
				FileInputStream fis = new FileInputStream(goodspicture);
				FileOutputStream fos = new FileOutputStream(path + "/" + filename);
				byte[] buff = new byte[1024];
				int len = 0;
				while ((len = fis.read(buff, 0, buff.length)) > 0) {
					fos.write(buff, 0, len);
				}
				fos.flush();
				fos.close();
				fis.close();
				this.commodity.setImage(filename);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				this.clearMessages();
				this.addActionMessage("商品图片存储失败！");
				return Action.ERROR;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				this.clearMessages();
				this.addActionMessage("商品图片存储失败！");
				return Action.ERROR;
			}
		}
		boolean flag = commodityBiz.add(commodity);
		if (flag) {

			this.clearMessages();
			this.addActionMessage("<script>alert('商品添加成功！');</script>");
			this.commodity.setCommodityName(null);
			this.commodity.setCommodityclass(null);
			this.commodity.setCommodityDepict(null);
			this.commodity.setCommodityPrice(null);
			this.commodity.setCommodityAmount(null);
			this.commodity.setCommodityLeaveNum(null);
			this.commodity.setRegTime(null);
			this.commodity.setManufacturer(null);
			this.commodity.setFcPrice(null);
			return Action.SUCCESS;

		} else {
			this.clearMessages();
			this.addActionMessage("商品添加失败！");
			return Action.ERROR;
		}
	}

	public String delBatchClass() throws Exception {
		String[] cids = this.commodityIds.split(",");
		for (int i = 0; i < cids.length; i++) {
			this.commodity.setCommodityId(Integer.parseInt(cids[i]));
			this.commodityBiz.delete(this.commodity.getCommodityId());
		}
		return Action.SUCCESS;
	}

	public String show() throws Exception {
		String strHQL = "select g from Commodity as g where";
		if(findBycommodityName!=null){
			strHQL=strHQL+" commodityName like'%"+findBycommodityName+"%' or commodityDepict like '%"+findBycommodityName+"%'"+" and ";
		}
		strHQL = strHQL.substring(0, strHQL.length() - 5);
		System.out.println("首页sql:"+strHQL);
		Map session = (Map) ActionContext.getContext().getSession();
		List<Bigcommodityclass> lstBigclass = this.bigcommodityclassBiz.findAll();
		session.put("lstBigclass", lstBigclass);
		/*List<Commodity> lstCommodities = this.commodityBiz.findAll();
		this.getRequest().setAttribute("lstCommodities", lstCommodities);
		request.put("lstCommodities", lstCommodities);*/
		Object[] params = new Object[] {};
		if (currentPage == 0) {
			currentPage = 1;
		}
		PageBean pageBean = commodityBiz.findByPage(strHQL, currentPage, 8, params);
		System.out.println("商品数量："+pageBean.getTotalRows());
		if(pageBean.getTotalRows()==0){
			return Action.ERROR+"num0";
		}
		this.getRequest().setAttribute("commodityPage", pageBean);
		return Action.SUCCESS;
	}

	public String findByPages() throws Exception {

		String strHQL = "select g from Commodity as g where";
		// 条件1：按照种类进行筛选
		if (commodity.getCommodityclass() == null || commodity.getCommodityclass().getCommodityClassId() == 0) {
			System.out.println("条件1：类别无限制");
		} else {
			System.out.println("条件1：种类编号为" + commodity.getCommodityclass().getCommodityClassId());
			strHQL += " g.commodityclass.commodityClassId=" + commodity.getCommodityclass().getCommodityClassId()
					+ " and ";
		}
		if (this.begin == null && this.end == null) {
			System.out.println("条件2：上架时间区间无限制");
		}
		if (this.begin != null && this.end == null) {
			String beginTime = new SimpleDateFormat("yyyy-MM-dd").format(begin);
			System.out.println("条件2：上架时间为" + begin + "之后的物品：");
			strHQL += " g.regTime > " + beginTime + " and ";
		}
		if (this.begin == null && this.end != null) {
			String endTime = new SimpleDateFormat("yyyy-MM-dd").format(end);
			System.out.println("条件2：上架时间为" + end + "之前的物品：");
			strHQL += " g.regTime < " + endTime + " and ";
		}
		if (this.begin != null && this.end != null) {
			String beginTime = new SimpleDateFormat("yyyy-MM-dd").format(begin);
			String endTime = new SimpleDateFormat("yyyy-MM-dd").format(end);
			System.out.println("条件2：上架时间为" + begin + "和" + end + "之间的物品：");
			strHQL += " (g.regTime between " + beginTime + " and " + endTime + ") and ";
		}
		strHQL = strHQL.substring(0, strHQL.length() - 5);
		System.out.println(strHQL);
		// ------------部分2：初始化条件选项
		List<Commodityclass> lstClass = commodityclassBiz.findAll();
		this.getRequest().setAttribute("lstClass", lstClass);

		// ------------部分3：分页查询显示
		Object[] params = new Object[] {};
		if (currentPage == 0) {
			currentPage = 1;
		}
		PageBean pageBean = commodityBiz.findByPage(strHQL, currentPage, 5, params);
		this.getRequest().setAttribute("commodityPage", pageBean);
		return Action.SUCCESS;
	}
}
