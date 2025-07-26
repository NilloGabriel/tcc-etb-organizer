/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



/**
 *
 * @author Administrador
 */
public class ClienteDAO  extends DataBaseDAO{

   public void inserir(Cliente c) throws Exception {
        String sql = "INSERT INTO cliente (nome, data_nascimento, data_cadastro, cpf, rg, "
                + "telefone, email, endereco,cep,sexo) VALUES(?,?,now(),?,?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setDate(2, (Date) c.getData_nascimento());
        pstm.setString(3, c.getCpf());
        pstm.setString(4, c.getRg());
        pstm.setString(5, c.getTelefone());
        pstm.setString(6, c.getEmail());
        pstm.setString(7, c.getEndereco());
        pstm.setString(8, c.getCep());
        pstm.setString(9, c.getSexo());
                
        
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setData_nascimento((rs.getDate("data_nascimento")));
            c.setData_cadastro((rs.getDate("data_cadastro")));
            c.setCpf(rs.getString("cpf"));
            c.setRg(rs.getString("rg"));
            c.setTelefone(rs.getString("telefone"));
            c.setEmail(rs.getString("email"));
            c.setEndereco(rs.getString("endereco"));
            c.setCep(rs.getString("cep"));
            c.setSexo(rs.getString("sexo"));
            
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
    public Cliente carregarPorId(int id) throws Exception{
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setData_nascimento((rs.getDate("data_nascimento")));
            c.setData_cadastro((rs.getDate("data_cadastro")));
            c.setCpf(rs.getString("cpf"));
            c.setRg(rs.getString("rg"));
            c.setTelefone(rs.getString("telefone"));
            c.setEmail(rs.getString("email"));
            c.setEndereco(rs.getString("endereco"));
            c.setCep(rs.getString("cep"));
            c.setSexo(rs.getString("sexo"));
        }
        this.desconectar();
        return c;
    }
     public void alterar(Cliente c) throws Exception{
        String sql = "UPDATE cliente SET nome=?, data_nascimento=?, cpf=?, rg=?, "
                + "telefone=?, email=?, endereco=?,cep=?,sexo=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setDate(2, (Date) c.getData_nascimento());
        pstm.setString(3, c.getCpf());
        pstm.setString(4, c.getRg());
        pstm.setString(5, c.getTelefone());
        pstm.setString(6, c.getEmail());
        pstm.setString(7, c.getEndereco());
        pstm.setString(8, c.getCep());
        pstm.setString(9, c.getSexo());
        pstm.setInt(10, c.getId());
        pstm.execute();
        this.desconectar();
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    
}
