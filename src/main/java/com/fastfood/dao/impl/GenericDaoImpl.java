package com.fastfood.dao.impl;

import com.fastfood.dao.GenericDao;
import com.fastfood.service.KeyValue;
import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * Basic DAO operations dependent with Hibernate's specific classes
 *
 * @see SessionFactory
 */
@SuppressWarnings("unchecked")
@Repository
public abstract class GenericDaoImpl<T, PK extends Serializable> implements GenericDao<T, PK> {

    @Autowired
    private SessionFactory sessionFactory;

    protected Class<? extends T> daoType;

    /**
     * By defining this class as abstract, we prevent Spring from creating
     * instance of this class If not defined abstract
     * getClass().getGenericSuperClass() would return Object. There would be
     * exception because Object class does not have constructor with parameters.
     */
    public GenericDaoImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        daoType = (Class) pt.getActualTypeArguments()[0];
    }

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    protected Class<?> getPersistenceType() {
        return this.daoType;
    }

    public void delete(T persistentObject, PK id) throws Exception {
        getSession().load(persistentObject, id);
        getSession().delete(persistentObject);
    }

    public List<T> findAll() throws Exception {
        // return getSession().createCriteria(this.daoType.getName()).list();
        // ThanhNT edited this to set fetchSize to speed up data fetching
        Session session = getSession();
        Criteria cr = session.createCriteria(daoType);
        cr.setFetchSize(5000);
        return cr.list();
    }

    @Override
    public void deleteBatch(List<T> paramT) throws Exception {
//		System.out.println("deleteBatch: Begin");
//		Session session = getSession();
//		try {
//			int count = 0;
//			for (T e : paramT) {
//				session.delete(e);
//				count++;
//				if ((count % 500) == 0) {
//					System.out.println(paramT.size() + " deleteBatch: " + count);
//					count++;
//				}
//			}
//			System.out.println("deleteBatch: End");
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw e;
//		} finally {
//		}
    }

    public List<T> findByExample(T exampleInstance) throws Exception {
        return findByExample(exampleInstance, null, true);
    }

    public List<T> findByExample(T exampleInstance, String orderByColumn, boolean ascendingOrder) throws Exception {

        Class<? extends Object> objectClass = exampleInstance.getClass();
        Field[] fields = objectClass.getDeclaredFields();
        PropertyDescriptor propertyDescriptor;
        Method getter;
        Object result;

        Criteria criterial = getSession().createCriteria(objectClass.getName());

        for (Field currentField : fields) {
            try {
                propertyDescriptor = new PropertyDescriptor(currentField.getName(), exampleInstance.getClass());
                getter = propertyDescriptor.getReadMethod();
            } catch (Exception e) {
                continue;
            }

            if (getter != null) {
                result = getter.invoke(exampleInstance, null);
                if (result != null) {
                    criterial.add(Restrictions.eq(currentField.getName(), result));
                }

            }
        }

        if (orderByColumn != null) {
            if (ascendingOrder)
                criterial.addOrder(Order.asc(orderByColumn));
            else
                criterial.addOrder(Order.desc(orderByColumn));
        }

        List<T> results = criterial.list();

        // this.logger.debug("find by example successful, result size: " +
        // results.size());

        return results;
    }

    public T findById(PK id) throws Exception {
        return (T) getSession().get(this.daoType, id);
    }

    public T findByIdUnique(PK id) throws Exception {
        return (T) getSession().get(this.daoType, id);
    }

    public T findByIdLock(PK id, boolean lock) throws Exception {
        if (lock) {
            return (T) getSession().get(this.daoType, id, LockMode.UPGRADE);
        }
        return (T) getSession().get(this.daoType, id);
    }

    public void flush() throws Exception {
        getSession().flush();
    }

    public PK persist(T newInstance) throws Exception {
        Session session = getSession();

        return (PK) session.save(newInstance);
    }

    @Override
    public void persistBatch(List<T> paramT) throws Exception {
        System.out.println("insertBatch: Begin");
        Session session = getSession().getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            int count = 0;
            tx.begin();
            for (T e : paramT) {
                session.save(e);
                count++;
                if ((count % 500) == 0) {
                    System.out.println(paramT.size() + " insertBatch: " + count);
                    tx.commit();
                    count++;
                    tx = session.beginTransaction();
                }
            }
            tx.commit();
            System.out.println("insertBatch: End");
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
            throw e;
        } finally {
        }
    }

    public void update(T transientObject) throws Exception {
        getSession().saveOrUpdate(transientObject);
    }

    public void saveOrUpdate(T transientObject) {
        getSession().saveOrUpdate(transientObject);
    }

    public Date getSystemDate() throws Exception {
        String strDateFormat = "dd-MM-yyyy-HH:mm:ss";
        String strDateFormatOracle = "dd-MM-yyyy-HH24:mi:ss";
        SimpleDateFormat formatter = new SimpleDateFormat(strDateFormat);
        String strColumn = "systemdate";

        String strSqlSysDate = " Select to_char(sysdate, '" + strDateFormatOracle + "') " + strColumn + "  FROM dual";

        SQLQuery sqlQuery = getSession().createSQLQuery(strSqlSysDate).addScalar(strColumn, StringType.INSTANCE);

        String strDate = sqlQuery.list().get(0).toString();
        Date date = formatter.parse(strDate);

        System.out.println(date);

        return date;
    }

    public void clear() throws Exception {
        getSession().clear();
    }

    public void deleteAll() throws Exception {

    }

    public List<T> findByKeyValue(List<KeyValue> lstKeyValue) throws Exception {
        return findByKeyValue(lstKeyValue, null, true);
    }

    public List<T> findByKeyValue(List<KeyValue> lstKeyValue, String orderByColumn, boolean ascendingOrder)
            throws Exception {
        Criteria criteria = getSession().createCriteria(getPersistenceType());
        for (KeyValue keyValue : lstKeyValue) {
            criteria.add(Restrictions.eq(keyValue.getKey(), keyValue.getValue()));
        }

        if (orderByColumn != null) {
            if (ascendingOrder)
                criteria.addOrder(Order.asc(orderByColumn));
            else
                criteria.addOrder(Order.desc(orderByColumn));
        }

        return criteria.list();
    }

    private Criteria createCriteria(List<KeyValue> lstKeyValue, String[] arrOrderByColumn, boolean blnAscOrder,
                                    int intFirstItemIndex, int intMaxItems, boolean blnExactMatch) throws Exception {
        Criteria criteria = getSession().createCriteria(getPersistenceType());
        for (KeyValue keyValue : lstKeyValue) {
            criteria.add(Restrictions.eq(keyValue.getKey(), keyValue.getValue()));
        }

        if (arrOrderByColumn != null) {
            if (blnAscOrder) {
                for (String propertyName : arrOrderByColumn) {
                    criteria.addOrder(Order.asc(propertyName));
                }
            } else
                for (String propertyName : arrOrderByColumn) {
                    criteria.addOrder(Order.desc(propertyName));
                }
        }
        return criteria;
    }

    public List<T> findAll(List<KeyValue> lstKeyValue, String[] arrOrderByColumn, boolean blnAscOrder,
                           int intFirstItemIndex, int intMaxItems, boolean blnExactMatch) throws Exception {
        Criteria criteria = createCriteria(lstKeyValue, arrOrderByColumn, blnAscOrder, intFirstItemIndex, intMaxItems,
                blnExactMatch);

        if (intFirstItemIndex >= 0 && intMaxItems > 0) {
            criteria.setFirstResult(intFirstItemIndex);
            criteria.setMaxResults(intMaxItems);
        }

        return criteria.list();
    }

    public PK countAll(List<KeyValue> lstKeyValue, boolean blnExactMatch) throws Exception {
        Criteria criteria = createCriteria(lstKeyValue, null, true, 0, 0, blnExactMatch);
        criteria.setProjection(Projections.rowCount());
        return (PK) criteria.uniqueResult();
    }

    // ThanhNT
    public void merge(T object) {
         getSession().merge(object);
    }

    //vuongh
    protected String convertData(Object object) {
        if (object == null) {
            return "";
        } else {
            return object.toString();
        }
    }

}