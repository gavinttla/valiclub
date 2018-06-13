<?php

namespace App\Http\Manager\Form\Field;

class Url extends Text
{
    protected $rules = 'url';

    public function render()
    {
        $this->prepend('<i class="fa fa-internet-explorer"></i>')
            ->defaultAttribute('type', 'url');

        return parent::render();
    }
}
