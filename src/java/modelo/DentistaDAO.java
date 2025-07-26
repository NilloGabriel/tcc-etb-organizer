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
public class DentistaDAO extends DataBaseDAO{
     public void inserir(Dentista d) throws Exception {
        String sql = "INSERT INTO dentista (nome, data_nascimento,data_cadastro,cpf,rg,cfo,telefone,"
                + " email,endereco,cep,sexo,login,senha,status,id_perfil)"
                + "VALUES(?,?,now(),?,?,?,?,?,?,?,?,?,?,'ativo',?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, d.getNome());
        pstm.setDate(2, (Date) d.getData_nascimento());
        pstm.setString(3,d.getCpf());
        pstm.setString(4, d.getRg());
        pstm.setString(5, d.getCfo());
        pstm.setString(6, d.getTelefone());
        pstm.setString(7, d.getEmail());
        pstm.setString(8, d.getEndereco());
        pstm.setString(9, d.getCep());
        pstm.setString(10, d.getSexo());
        pstm.setString(11, d.getLogin());
        pstm.setString(12, d.getSenha());
        pstm.setInt(13, d.getPerfil().getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Dentista> listar() throws Exception {
        ArrayList<Dentista> lista = new ArrayList<Dentista>();
        String sql = "SELECT * FROM dentista";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Dentista d = new Dentista();
            d.setId(rs.getInt("id"));
            d.setNome(rs.getString("nome"));
            d.setData_nascimento(rs.getDate("data_nascimento"));
            d.setData_cadastro(rs.getDate("data_cadastro"));
            d.setCpf(rs.getString("cpf"));
            d.setRg(rs.getString("rg"));
            d.setCfo(rs.getString("cfo"));
            d.setTelefone(rs.getString("telefone"));
            d.setEmail(rs.getString("email"));
            d.setEndereco(rs.getString("endereco"));
            d.setCep(rs.getString("cep"));
            d.setLogin(rs.getString("login"));
            d.setSenha(rs.getString("senha"));
            d.setSexo(rs.getString("sexo"));
            d.setStatus(rs.getString("status"));
            PerfilDAO pDAO = new PerfilDAO();
            d.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            lista.add(d);
        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM dentista WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Dentista carregarPorId(int id) throws Exception {
        Dentista d = new Dentista();
        String sql = "SELECT * FROM dentista WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            d.setId(rs.getInt("id"));
            d.setNome(rs.getString("nome"));
            d.setData_nascimento(rs.getDate("data_nascimento"));
            d.setData_cadastro(rs.getDate("data_cadastro"));
            d.setCpf(rs.getString("cpf"));
            d.setRg(rs.getString("rg"));
            d.setCfo(rs.getString("cfo"));
            d.setTelefone(rs.getString("telefone"));
            d.setEmail(rs.getString("email"));
            d.setEndereco(rs.getString("endereco"));
            d.setCep(rs.getString("cep"));
            d.setLogin(rs.getString("login"));
            d.setSenha(rs.getString("senha"));
            d.setStatus(rs.getString("status"));
            
            PerfilDAO pDAO = new PerfilDAO();
            d.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
        }
        this.desconectar();
        return d;
    }

    public void alterar(Dentista d) throws Exception {
        String sql = "UPDATE dentista SET nome=?, data_nascimento=?, cpf=?, rg=?, cfo=?, telefone=?,"
                + " email=?, endereco=?,cep=?,sexo=?, login=?, senha=?,id_perfil=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, d.getNome());
        pstm.setDate(2, (Date) d.getData_nascimento());
        pstm.setString(3,d.getCpf());
        pstm.setString(4, d.getRg());
        pstm.setString(5, d.getCfo());
        pstm.setString(6, d.getTelefone());
        pstm.setString(7, d.getEmail());
        pstm.setString(8, d.getEndereco());
        pstm.setString(9, d.getCep());
        pstm.setString(10, d.getSexo());
        pstm.setString(11, d.getLogin());
        pstm.setString(12, d.getSenha());
        pstm.setInt(13, d.getPerfil().getId());
        pstm.setInt(14, d.getId());
        pstm.execute();
        this.desconectar();
    }

    public Dentista logar(String login, String senha) throws Exception {
        Dentista d = new Dentista();
        String sql = "SELECT * FROM dentista WHERE login=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                d.setId(rs.getInt("id"));
                d.setNome(rs.getString("nome"));
                d.setLogin(rs.getString("login"));
                d.setSenha(rs.getString("senha"));
                d.setStatus(rs.getString("status"));
                
                PerfilDAO pDAO = new PerfilDAO();
                d.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            }
        }
        this.desconectar();
        return d;
    }
}
