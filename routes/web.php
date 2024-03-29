<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->group([
    'prefix' => 'api'
], function ($router) {
    // basic
    $router->post('login', 'AuthController@login');
    
});

$router->group([
        'prefix' => 'api',
        'middleware' => 'auth'
], function ($router) {
    // manage
    $router->post('register', 'AuthController@register');
    
    $router->get('profile', 'ProfileController@getProfiles');
    $router->post('profile', 'ProfileController@create');
    $router->delete('profile', 'ProfileController@delete');

    // subject
    $router->get('subject', 'SubjectController@getSubjects');
    $router->post('subject', 'SubjectController@create');
    $router->delete('subject', 'SubjectController@delete');

    // select / get value
    $router->get('selection', 'SelectionController@get');
    $router->post('selection', 'SelectionController@createOrUpdate');

    // select / get value
    $router->get('page', 'SelectionController@getPage');
    $router->get('allselected', 'SelectionController@getAllPages');

    $router->post('filter', 'SelectionController@filter');
    $router->post('allselectedfilterf', 'SelectionController@getAllSelectionProfilesById');


    // template page
    $router->get('templatepage', 'SelectionController@templatePage');
    
    // languate createOrUpdate
    $router->post('editlanguage', 'SelectionController@createOrUpdateLang');

    // user out
    $router->get('me', 'AuthController@me');
    $router->post('logout', 'AuthController@logout');
});

$router->get('/', function () use ($router) {
    return '!!!';
});

