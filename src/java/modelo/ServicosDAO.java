/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class ServicosDAO  extends DataBaseDAO{
    
    public void inserir(Servicos s) throws Exception{
        String sql = "INSERT INTO servicos (nome) VALUES(?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, s.getNome());;
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Servicos> listar() throws Exception{
        ArrayList<Servicos> lista = new ArrayList<Servicos>();
        String sql = "SELECT * FROM servicos";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Servicos s = new Servicos();
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            lista.add(s);
        }
        this.desconectar();
        return lista;
    }
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM servicos WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Servicos carregarPorId(int id) throws Exception{
        Servicos s = new Servicos();
        String sql = "SELECT * FROM servicos WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
        this.desconectar();
        } 
        return s;
    }
    
    public void alterar(Servicos s) throws Exception{
        String sql = "UPDATE servicos SET nome=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, s.getNome());
        pstm.setInt(2, s.getId());
        pstm.execute();
        this.desconectar();
         }
    }
    

