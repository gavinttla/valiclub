<div class="{{$viewClass['form-group']}} {!! !$errors->has($errorKey) ? '' : 'has-error' !!}">

    <label for="{{$id}}" class="{{$viewClass['label']}} control-label">{{$label}}</label>

    <div class="{{$viewClass['field']}}">

        @include('manager::form.error')

        <input type="file" class="{{$class}}" name="{{$name}}[]" {!! $attributes !!} />

        @include('manager::form.help-block')

    </div>
</div>
