package com.aquent.crudapp.data.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aquent.crudapp.data.dao.ClientDao;
import com.aquent.crudapp.data.dao.jdbc.PersonJdbcDao.PersonRowMapper;
import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Person;

/**
 * Spring JDBC implementation of {@link ClientDao}.
 */
public class ClientJdbcDao implements ClientDao {

    private static final String SQL_LIST_CLIENTS = "SELECT * FROM client ORDER BY company_name, client_id";
    private static final String SQL_READ_CLIENT = "SELECT * FROM client WHERE client_id = :clientId";
    
    private static final String SQL_DELETE_CLIENT = "DELETE FROM client WHERE client_id = :clientId";
    private static final String SQL_UPDATE_CLIENT = "UPDATE client SET (company_name, website, phone, p_street_address, p_city, p_state, p_zip_code,m_street_address, m_city, m_state, m_zip_code)"
                                                  + " = (:companyName, :website, :phone, :pStreetAddress, :pCity, :pState, :pZipCode, :mStreetAddress, :mCity, :mState, :mZipCode)"
                                                  + " WHERE client_id = :clientId";
    private static final String SQL_CREATE_CLIENT = "INSERT INTO client (company_name, website, phone, p_street_address, p_city, p_state, p_zip_code,m_street_address, m_city, m_state, m_zip_code)"
                                                  + " VALUES (:companyName, :website, :phone, :pStreetAddress, :pCity, :pState, :pZipCode, :mStreetAddress, :mCity, :mState, :mZipCode)";

    private static final String SQL_DELETE_CONTACTS = "UPDATE person SET client_id = null WHERE client_id = :clientId";
    
    private static final String SQL_LOAD_CONTACTS = "SELECT person_id, client_id, first_name, last_name, email_address, street_address, city, state, zip_code FROM person WHERE client_id=:clientId";
    
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Client> list() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_CLIENTS, new ClientRowMapper());
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Client readClient(Integer clientId) {
    	Client client = namedParameterJdbcTemplate.queryForObject(SQL_READ_CLIENT, Collections.singletonMap("clientId", clientId), new ClientRowMapper());
    	loadContacts(client);
    	return client;
    }
    

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deleteClient(Integer clientId) {
    	//remove association between person and client before deleting client
    	namedParameterJdbcTemplate.update(SQL_DELETE_CONTACTS, Collections.singletonMap("clientId", clientId));
        namedParameterJdbcTemplate.update(SQL_DELETE_CLIENT, Collections.singletonMap("clientId", clientId));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updateClient(Client client) {
        namedParameterJdbcTemplate.update(SQL_UPDATE_CLIENT, new BeanPropertySqlParameterSource(client));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createClient(Client client) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_CLIENT, new BeanPropertySqlParameterSource(client), keyHolder);
        return keyHolder.getKey().intValue();
    }
    
    /**
     * load the contancts for the client
     * @param client - client object 
     */
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void loadContacts(Client client){
        Map<String, Object> params = new HashMap<>();
        params.put("clientId", client.getClientId());
        final List<Person> contacts = this.namedParameterJdbcTemplate.query(
            SQL_LOAD_CONTACTS,params,new PersonRowMapper()
        );
        client.setContacts(contacts);
    }
    

    /**
     * Row mapper for client records.
     */
    private static final class ClientRowMapper implements RowMapper<Client> {

        @Override
        public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
            Client client = new Client();
            client.setClientId(rs.getInt("client_id"));
            client.setCompanyName(rs.getString("company_name"));
            client.setPhone(rs.getString("phone"));
            client.setWebsite(rs.getString("website"));
            client.setpStreetAddress(rs.getString("p_street_address"));
            client.setpCity(rs.getString("p_city"));
            client.setpState(rs.getString("p_state"));
            client.setpZipCode(rs.getString("p_zip_code"));
            client.setmStreetAddress(rs.getString("m_street_address"));
            client.setmCity(rs.getString("m_city"));
            client.setmState(rs.getString("m_state"));
            client.setmZipCode(rs.getString("m_zip_code"));
            return client;
        }
    }
    
}
