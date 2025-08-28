// Entry point for the build script in your package.json

import { Application } from '@hotwired/stimulus'

import { Datepicker } from 'stimulus-datepicker'

import { definitions } from 'stimulus:./controllers'

const app = Application.start()
app.load(definitions)
app.register('datepicker', Datepicker)
