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
public class FuncionarioDAO extends DataBaseDAO {

    public void inserir(Funcionario f) throws Exception {
        String sql = "INSERT INTO funcionario (nome, data_nascimento, data_cadastro, cpf, rg, telefone,"
                + " email, endereco,cep,sexo, login, senha, status,id_perfil )VALUES(?,?,now(),?,?,?,?,?,?,?,?,?,'ativo',?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setDate(2, (Date) f.getData_nascimento());
        pstm.setString(3,f.getCpf());
        pstm.setString(4, f.getRg());
        pstm.setString(5, f.getTelefone());
        pstm.setString(6, f.getEmail());
        pstm.setString(7, f.getEndereco());
        pstm.setString(8, f.getCep());
        pstm.setString(9, f.getSexo());
        pstm.setString(10, f.getLogin());
        pstm.setString(11, f.getSenha());
        pstm.setInt(12, f.getPerfil().getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Funcionario> listar() throws Exception {
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        String sql = "SELECT * FROM funcionario";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            f.setId(rs.getInt("id"));
            f.setNome(rs.getString("nome"));
            f.setData_nascimento(rs.getDate("data_nascimento"));
            f.setData_cadastro(rs.getDate("data_cadastro"));
            f.setCpf(rs.getString("cpf"));
            f.setRg(rs.getString("rg"));
            f.setTelefone(rs.getString("telefone"));
            f.setEmail(rs.getString("email"));
            f.setEndereco(rs.getString("endereco"));
            f.setCep(rs.getString("cep"));
            f.setLogin(rs.getString("login"));
            f.setSenha(rs.getString("senha"));
            f.setSexo(rs.getString("sexo"));
            
            PerfilDAO pDAO = new PerfilDAO();
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            lista.add(f);
        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM funcionario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Funcionario carregarPorId(int id) throws Exception {
        Funcionario f = new Funcionario();
        String sql = "SELECT * FROM funcionario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            f.setId(rs.getInt("id"));
            f.setNome(rs.getString("nome"));
            f.setData_nascimento(rs.getDate("data_nascimento"));
            f.setData_cadastro(rs.getDate("data_cadastro"));
            f.setCpf(rs.getString("cpf"));
            f.setRg(rs.getString("rg"));
            f.setTelefone(rs.getString("telefone"));
            f.setEmail(rs.getString("email"));
            f.setEndereco(rs.getString("endereco"));
            f.setCep(rs.getString("cep"));
            f.setLogin(rs.getString("login"));
            f.setSenha(rs.getString("senha"));
            f.setStatus(rs.getString("status"));
            PerfilDAO pDAO = new PerfilDAO();
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
        }
        this.desconectar();
        return f;
    }

    public void alterar(Funcionario f) throws Exception {
        String sql = "UPDATE funcionario SET nome=?, data_nascimento=?, cpf=?, rg=?, telefone=?,"
                + " email=?, endereco=?,cep=?,sexo=?, login=?, senha=?, id_perfil=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setDate(2, (Date) f.getData_nascimento());
        pstm.setString(3,f.getCpf());
        pstm.setString(4, f.getRg());
        pstm.setString(5, f.getTelefone());
        pstm.setString(6, f.getEmail());
        pstm.setString(7, f.getEndereco());
        pstm.setString(8, f.getCep());
        pstm.setString(9, f.getSexo());
        pstm.setString(10, f.getLogin());
        pstm.setString(11, f.getSenha());
        pstm.setInt(12, f.getPerfil().getId());
        pstm.setInt(13, f.getId());
        pstm.execute();
        this.desconectar();
    }

    public Funcionario logar(String login, String senha) throws Exception {
        Funcionario f = new Funcionario();
        String sql = "SELECT * FROM funcionario WHERE login=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setLogin(rs.getString("login"));
                f.setSenha(rs.getString("senha"));
                f.setStatus(rs.getString("status")); 
                PerfilDAO pDAO = new PerfilDAO();
                f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            }
        }
        this.desconectar();
        return f;
    }

}
