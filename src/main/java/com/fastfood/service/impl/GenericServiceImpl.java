package com.fastfood.service.impl;

import com.fastfood.dao.GenericDao;
import com.fastfood.service.GenericService;
import com.fastfood.service.KeyValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


@Service
@Transactional
public abstract class GenericServiceImpl<T, PK> implements GenericService<T, PK> {

    @Autowired
    GenericDao<T, PK> genericDao;

    public GenericServiceImpl() {
    }

    public GenericServiceImpl(GenericDao<T, PK> genericDao) {
        this.genericDao = genericDao;
    }

    public void delete(T persistentObject, PK paramID) throws Exception {
        genericDao.delete(persistentObject, paramID);
    }

    public void deleteAll() throws Exception {
        genericDao.deleteAll();
    }

    @Override
    public void deleteBatch(List<T> paramT) throws Exception {
        genericDao.deleteBatch(paramT);
    }

    public void merge(T transientObject)throws Exception{
        genericDao.merge(transientObject);
    }

    public List<T> findAll() throws Exception {
        return genericDao.findAll();
    }

    public List<T> findByExample(T exampleInstance) throws Exception {
        return genericDao.findByExample(exampleInstance);
    }

    public T findById(PK id) throws Exception {
        return genericDao.findById(id);
    }

    public T findByIdUnique(PK id) throws Exception {
        return genericDao.findByIdUnique(id);
    }

    public PK persist(T newInstance) throws Exception {
        return genericDao.persist(newInstance);
    }

    @Override
    public void persistBatch(List<T> paramT) throws Exception {
        genericDao.persistBatch(paramT);
    }

    public void update(T transientObject) throws Exception {
        genericDao.update(transientObject);
    }

    public void saveOrUpdate(T transientObject) throws Exception {
        genericDao.saveOrUpdate(transientObject);
    }

    public Date getSystemDate() throws Exception {
        return genericDao.getSystemDate();
    }

    public T findByIdLock(PK id, boolean lock) throws Exception {
        return genericDao.findByIdLock(id, lock);
    }

    public List<T> findByKeyValue(List<KeyValue> lstKeyValue) throws Exception {
        return genericDao.findByKeyValue(lstKeyValue);
    }

    public List<T> findByExample(T exampleInstance, String orderByColumn, boolean ascendingOrder) throws Exception {
        return genericDao.findByExample(exampleInstance, orderByColumn, ascendingOrder);
    }

    public List<T> findByKeyValue(List<KeyValue> lstKeyValue, String orderByColumn, boolean ascendingOrder)
            throws Exception {
        return genericDao.findByKeyValue(lstKeyValue, orderByColumn, ascendingOrder);
    }

    public List<T> findAll(List<KeyValue> lstKeyValue, String[] arrOrderByColumn, boolean blnAscOrder,
                           int intFirstItemIndex, int intMaxItems, boolean blnExactMatch) throws Exception {
        return genericDao.findAll(lstKeyValue, arrOrderByColumn, blnAscOrder, intFirstItemIndex, intMaxItems,
                blnExactMatch);
    }

    public PK countAll(List<KeyValue> lstKeyValue, boolean blnExactMatch) throws Exception {
        return genericDao.countAll(lstKeyValue, blnExactMatch);
    }


}
