<?php

if (!function_exists('manager_path')) {

    /**
     * Get manager path.
     *
     * @param string $path
     *
     * @return string
     */
    function manager_path($path = '')
    {
        return ucfirst(config('manager.directory')).($path ? DIRECTORY_SEPARATOR.$path : $path);
    }
}

if (!function_exists('manager_path')) {

    /**
     * Get manager path.
     *
     * @param string $path
     *
     * @return string
     */
    function manager_path($path = '')
    {
        return ucfirst(config('manager.directory')).($path ? DIRECTORY_SEPARATOR.$path : $path);
    }
}

if (!function_exists('manager_url')) {
    /**
     * Get manager url.
     *
     * @param string $path
     *
     * @return string
     */
    function manager_url($path = '')
    {
        if (\Illuminate\Support\Facades\URL::isValidUrl($path)) {
            return $path;
        }

        return url(manager_base_path($path));
    }
}

if (!function_exists('manager_url')) {
    /**
     * Get manager url.
     *
     * @param string $path
     *
     * @return string
     */
    function manager_url($path = '')
    {
        if (\Illuminate\Support\Facades\URL::isValidUrl($path)) {
            return $path;
        }

        return url(manager_base_path($path));
    }
}

if (!function_exists('manager_base_path')) {
    /**
     * Get manager url.
     *
     * @param string $path
     *
     * @return string
     */
    function manager_base_path($path = '')
    {
        $prefix = '/'.trim(config('manager.route.prefix'), '/');

        $prefix = ($prefix == '/') ? '' : $prefix;

        return $prefix.'/'.trim($path, '/');
    }
}

if (!function_exists('manager_toastr')) {

    /**
     * Flash a toastr message bag to session.
     *
     * @param string $message
     * @param string $type
     * @param array  $options
     *
     * @return string
     */
    function manager_toastr($message = '', $type = 'success', $options = [])
    {
        $toastr = new \Illuminate\Support\MessageBag(get_defined_vars());

        \Illuminate\Support\Facades\Session::flash('toastr', $toastr);
    }
}

if (!function_exists('manager_asset')) {

    /**
     * @param $path
     *
     * @return string
     */
    function manager_asset($path)
    {
        return asset($path, config('manager.secure'));
    }
}
