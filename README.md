# pytest-xunit-xslt
## this xslt file used for transformation of junit xml generated using pytest --junit-xml option. 
## Thanks to UTscapy web-gui which consize the result to better look

### add below line to your xml on second line after the tag ...

```
<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet href="pytest.xslt" type="text/xsl" ?> <--------- add in here. 
<testsuite errors="0" failures . . . .
```

### Thanks
