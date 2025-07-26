/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;



import java.sql.Time;
import java.util.Date;

/**
 *
 * @author Administrador
 */
public class Consulta {
    private int id;
    private Date data_consulta;
    private Time hora_consulta;
    private double valor_consulta;
    private String status_consulta;
    private Date pagou;
    private String tipo_pagamento;
    private Cliente cliente;
    private Dentista dentista;
    private Funcionario funcionario;
    private Servicos servicos;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getData_consulta() {
        return data_consulta;
    }

    public void setData_consulta(Date data_consulta) {
        this.data_consulta = data_consulta;
    }

    public Time getHora_consulta() {
        return hora_consulta;
    }

    public void setHora_consulta(Time hora_consulta) {
        this.hora_consulta = hora_consulta;
    }

    public double getValor_consulta() {
        return valor_consulta;
    }

    public void setValor_consulta(double valor_consulta) {
        this.valor_consulta = valor_consulta;
    }

    public String getStatus_consulta() {
        return status_consulta;
    }

    public void setStatus_consulta(String status_consulta) {
        this.status_consulta = status_consulta;
    }

    public Date getPagou() {
        return pagou;
    }

    public void setPagou(Date pagou) {
        this.pagou = pagou;
    }

    public String getTipo_pagamento() {
        return tipo_pagamento;
    }

    public void setTipo_pagamento(String tipo_pagamento) {
        this.tipo_pagamento = tipo_pagamento;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Dentista getDentista() {
        return dentista;
    }

    public void setDentista(Dentista dentista) {
        this.dentista = dentista;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public Servicos getServicos() {
        return servicos;
    }

    public void setServicos(Servicos servicos) {
        this.servicos = servicos;
    }
    
    
  
   

}