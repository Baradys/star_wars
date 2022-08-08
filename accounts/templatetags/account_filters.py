from django import template

register = template.Library()


@register.filter(name='url_split')
def url_split(value: str, key='/'):
    return value.split(key)[-1].capitalize()
