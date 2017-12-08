import os
from notebook.auth import passwd

c.NotebookApp.ip = '*'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.MultiKernelManager.default_kernel_name = 'python3'

if 'JUPYTER_NOTEBOOK_PASSWORD' in os.environ:
    c.NotebookApp.password = passwd(os.environ['JUPYTER_NOTEBOOK_PASSWORD'])
    del os.environ['JUPYTER_NOTEBOOK_PASSWORD']
