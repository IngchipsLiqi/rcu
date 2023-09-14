xcopy.exe ..\..\sdk\bundles\typical\ING9168xx\meta.json    .\temp\ /y
xcopy.exe ..\..\sdk\bundles\typical\ING9168xx\platform.bin .\temp\ /y
xcopy.exe ..\..\sdk\bundles\typical\ING9168xx\symdefs.m    .\temp\ /y
xcopy.exe ..\mi_rcu.bin                                    .\temp\ /y
xcopy.exe ..\0x2040000_data.bin                            .\temp\ /y
xcopy.exe ..\0xff.bin                                      .\temp\ /y
xcopy.exe ..\listing\mi_rcu.map                            .\temp\ /y
xcopy.exe .\icsdw916.exe                                   .\temp\ /y
xcopy.exe .\libgcc_s_dw2-1.dll                             .\temp\ /y
xcopy.exe ..\flash_download.ini                            .\temp\ /y
xcopy.exe .\data\*                                         .\temp\data\ /y

xcopy.exe .\temp\flash_download.ini                        .\temp\settings.ini /y