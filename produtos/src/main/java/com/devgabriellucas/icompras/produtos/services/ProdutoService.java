package com.devgabriellucas.icompras.produtos.services;

import com.devgabriellucas.icompras.produtos.model.Produto;
import com.devgabriellucas.icompras.produtos.repository.ProdutoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProdutoService {

    private ProdutoRepository repository;

    public ProdutoService(ProdutoRepository repository) {
        this.repository = repository;
    }

    public Produto save(Produto produto) {
        return repository.save(produto);
    }

    public Optional<Produto> findById(Long id) {
        return repository.findById(id);
    }

    public List<Produto> findAll() {
        return repository.findAll();
    }


}
