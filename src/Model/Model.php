<?php

namespace App\Model;

abstract class Model
{
    protected $pdo;

    public function __construct()
    {
        $pdo = new \PDO('mysql:host=localhost;dbname=social-network;charset=utf8', 'root', '');
        $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(\PDO::ATTR_DEFAULT_FETCH_MODE, \PDO::FETCH_ASSOC);
        $this->pdo = $pdo;

        return $pdo;
    }

    /**
     * Permet de savoir si un utilisateur existe déjà en base de données, si oui : changer de pseudo
     *
     * @param $table
     * @param $column
     * @param $value
     * @return mixed
     */
    public function alreadyExist($table, $column, $value)
    {
        $query = $this->pdo->prepare('SELECT ' . $column . ' FROM ' . $table . ' WHERE ' . $column . ' = ?');
        $query->execute([$value]);

        return $query->fetch(\PDO::FETCH_ASSOC);
    }

    /**
     * Permet de selectionner toute les valeurs attribuer a une recherche en base de données
     *
     * @param $table
     * @param $column
     * @param $value
     * @return mixed
     */
    public function selectAll($table, $column, $value)
    {
        $query = $this->pdo->prepare('SELECT * FROM ' . $table . ' WHERE ' . $column . ' = ?');
        $query->execute([$value]);

        $result = $query->fetch(\PDO::FETCH_ASSOC);

        return $result;
    }

    /**
     * Permet de savoir si une valeur existe ou pas
     *
     * @param $table
     * @param $column
     * @param $login
     * @return bool
     */
    public function checkOneValue($table, $column, $login)
    {
        $query = $this->pdo->prepare('SELECT ' . $column . ' FROM ' . $table . ' WHERE login = :login');
        $query->bindValue(':login', $login);
        $query->execute();

        $result = $query->fetch(\PDO::FETCH_ASSOC);
        if ($result) {
            return true;
        } else {
            echo 'Ce compte n\'existe pas.';
            return false;
        }
    }

    /**
     * Permet d'update uniquement une valeur précise
     *
     * @param $table
     * @param $column1
     * @param $column2
     * @param $value1
     * @param $value2
     */
    public function updateOneValue($table, $column1, $column2, $value1, $value2)
    {
        $query = $this->pdo->prepare('UPDATE ' . $table . ' SET ' . $column1 . ' = :value1 WHERE ' . $column2 . ' = :value2');
        $query->bindValue(':value1', $value1);
        $query->bindValue(':value2', $value2, \PDO::PARAM_INT);

        $query->execute();
    }
}
