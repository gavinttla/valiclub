<?php

namespace App\Http\Manager\Grid\Filter\Presenter;

use App\Http\Manager\Facades\Manager;

class Checkbox extends Radio
{
    protected function prepare()
    {
        $script = "$('.{$this->filter->getId()}').iCheck({checkboxClass:'icheckbox_minimal-blue'});";

        Manager::script($script);
    }
}
