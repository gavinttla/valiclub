<?php

namespace App\Http\Manager\Form\Field;

use Closure;
use App\Http\Manager\Form\Field;

class Display extends Field
{
    protected $callback;

    public function with(Closure $callback)
    {
        $this->callback = $callback;
    }

    public function render()
    {
        if ($this->callback instanceof Closure) {
            $this->value = $this->callback->call($this->form->model(), $this->value);
        }

        return parent::render();
    }
}
