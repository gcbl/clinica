package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.transaction.annotation.Transactional;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.BaseEntity;

@NoRepositoryBean
public interface SoftDeleteCrudRepository<T extends BaseEntity, ID extends String> extends CrudRepository<T, ID> {
  @Override
  @Transactional( readOnly = true)
  @Query("select e from #{#entityName} e where e.isActive = true")
  List<T> findAll();

  @Override
  @Transactional(readOnly = true)
  @Query("select e from #{#entityName} e where e.id in ?1 and e.isActive = true")
  Iterable<T> findAll(Iterable<ID> ids);

  @Override
  @Transactional(readOnly = true)
  @Query("select e from #{#entityName} e where e.id = ?1 and e.isActive = true")
  T findOne(ID id);

  //Look up deleted entities
  @Query("select e from #{#entityName} e where e.isActive = false")
  @Transactional(readOnly = true)
  List<T> findInactive();

  @Override
  @Transactional(readOnly = true)
  @Query("select count(e) from #{#entityName} e where e.isActive = true")
  long count();

  @Override
  @Transactional(readOnly = true)
  default boolean exists(ID id) {
      return findOne(id) != null;
  }

  @Override
  @Query("update #{#entityName} e set e.isActive=false where e.id = ?1")
  @Transactional
  @Modifying
  void delete(String id);


  @Override
  @Transactional
  default void delete(T entity) {
      delete(entity.getId());
  }

  @Override
  @Transactional
  default void delete(Iterable<? extends T> entities) {
      entities.forEach(entitiy -> delete(entitiy.getId()));
  }

  @Override
  @Query("update #{#entityName} e set e.isActive=false")
  @Transactional
  @Modifying
  void deleteAll();
}
