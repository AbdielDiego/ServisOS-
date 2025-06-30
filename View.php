<?php

// Define el namespace para la clase View
namespace App\Views;

class View {

    /**
     * Método principal que se encarga de mostrar una vista
     * @param string $vista Nombre de la vista (sin extensión .php)
     * @param array $dat Datos que se pasarán a la vista
     */
    public function render($vista, $dat) {

        // Extrae los datos del array asociativo como variables
        // Ej: ['title' => 'Hola'] se convierte en $title = 'Hola';
        extract($dat);

        // Inicia el almacenamiento en búfer de salida
        ob_start();

        // Incluye la vista (archivo .php) desde la misma carpeta que esta clase
        include(__DIR__ . "/$vista" . ".php");

        // Guarda todo el contenido renderizado en $content y limpia el búfer
        $content = ob_get_clean();

        // Inserta ese contenido dentro del layout principal
        include(__DIR__ . "/layouts/main.php");
    }

}

