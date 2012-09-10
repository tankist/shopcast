@ECHO OFF

lessc css\bootstrap\admin.less > css\admin.css && cleancss css\admin.css > css\admin.min.css && lessc css\bootstrap\login.less > css\login.css && cleancss css\login.css > css\login.min.css