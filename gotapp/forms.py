from flask_wtf import FlaskForm
from wtforms import StringField, RadioField
from wtforms.validators import DataRequired, Length

class gametipform(FlaskForm):
    username = StringField(
        'Username', 
        validators=[DataRequired(), Length(min=3, max=25)]
    )
    
    jonsnow = RadioField('Gender', choices = [('M','Male'),('F','Female')])
    

    
