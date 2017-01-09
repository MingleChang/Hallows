//
//  MCMimeType.m
//  MCNetwork
//
//  Created by MingleChang on 16/7/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "MCMimeType.h"

NSString* const MIME_TYPE_IMG_PNG   =@"image/png";
NSString* const MIME_TYPE_IMG_JPEG  =@"image/jpeg";
NSString* const MIME_TYPE_IMG_GIF   =@"image/gif";
NSString* const MIME_TYPE_IMG_WEBP  =@"image/webp";


NSString* const MIME_TYPE_BINARY    =   @"application/octet-stream";
NSString* const MIME_TYPE_001       =   @"application/x-001";//001
NSString* const MIME_TYPE_301       =   @"application/x-301";//301
NSString* const MIME_TYPE_323       =   @"text/h323";//323
NSString* const MIME_TYPE_906       =   @"application/x-906";//906
NSString* const MIME_TYPE_907       =   @"drawing/907";//907
NSString* const MIME_TYPE_A11       =   @"application/x-a11";//a11
NSString* const MIME_TYPE_ACP       =   @"audio/x-mei-aac";//acp
NSString* const MIME_TYPE_PS        =   @"application/postscript";//ai,eps,ps
NSString* const MIME_TYPE_AIFF      =   @"audio/aiff";//aif,aifc,aiff
NSString* const MIME_TYPE_ANV       =   @"application/x-anv";//anv
NSString* const MIME_TYPE_ASA       =   @"text/asa";//asa
NSString* const MIME_TYPE_ASF       =   @"video/x-ms-asf";//asf,asx
NSString* const MIME_TYPE_ASP       =   @"text/asp";//asp
NSString* const MIME_TYPE_AU        =   @"audio/basic";//au,snd
NSString* const MIME_TYPE_AVI       =   @"video/avi";//avi
NSString* const MIME_TYPE_AWF       =   @"application/vnd.adobe.workflow";//awf
NSString* const MIME_TYPE_XML       =   @"text/xml";//biz,cml,dcd,,dtd,ent,fo,math,mml,mtx,rdf,spp,svg,tld,tsd,vml,vxml,wsdl,xdr,xml,xq,xql,xquery,xsd,xsl,xslt,
NSString* const MIME_TYPE_BMP       =   @"application/x-bmp";//bmp
NSString* const MIME_TYPE_BOT       =   @"application/x-bot";//bot
NSString* const MIME_TYPE_C4T       =   @"application/x-c4t";//c4t
NSString* const MIME_TYPE_C90       =   @"application/x-c90";//c90
NSString* const MIME_TYPE_CAL       =   @"application/x-cals";//cal
NSString* const MIME_TYPE_CAT       =   @"application/vnd.ms-pki.seccat";//cat
NSString* const MIME_TYPE_CDF       =   @"application/x-netcdf";//cdf
NSString* const MIME_TYPE_CDR       =   @"application/x-cdr";//cdr
NSString* const MIME_TYPE_CEL       =   @"application/x-cel";//cel
NSString* const MIME_TYPE_CER       =   @"application/x-x509-ca-cert";//cer,crt,der
NSString* const MIME_TYPE_G4        =   @"application/x-g4";//cg4,g4,,ig4
NSString* const MIME_TYPE_CGM       =   @"application/x-cgm";//cgm
NSString* const MIME_TYPE_CIT       =   @"application/x-cit";//cit
NSString* const MIME_TYPE_JAVA      =   @"java/*";//class,java
NSString* const MIME_TYPE_CMP       =   @"application/x-cmp";//cmp
NSString* const MIME_TYPE_CMX       =   @"application/x-cmx";//cmx
NSString* const MIME_TYPE_COT       =   @"application/x-cot";//cot
NSString* const MIME_TYPE_CRL       =   @"application/pkix-crl";//crl
NSString* const MIME_TYPE_CSI       =   @"application/x-csi";//csi
NSString* const MIME_TYPE_CSS       =   @"text/css";//css
NSString* const MIME_TYPE_CUT       =   @"application/x-cut";//cut
NSString* const MIME_TYPE_DBF       =   @"application/x-dbf";//dbf
NSString* const MIME_TYPE_DBM       =   @"application/x-dbm";//dbm
NSString* const MIME_TYPE_DBX       =   @"application/x-dbx";//dbx
NSString* const MIME_TYPE_DCX       =   @"application/x-dcx";//dcx
NSString* const MIME_TYPE_DGN       =   @"application/x-dgn";//dgn
NSString* const MIME_TYPE_DIB       =   @"application/x-dib";//DIB
NSString* const MIME_TYPE_DLL       =   @"application/x-msdownload";//dll,exe
NSString* const MIME_TYPE_DOC       =   @"application/msword";//doc,dot,rtf,wiz
NSString* const MIME_TYPE_DRW       =   @"application/x-drw";//drw
NSString* const MIME_TYPE_DWF       =   @"Model/vnd.dwf";//dwf
NSString* const MIME_TYPE_XDWF      =   @"application/x-dwf";//dwf
NSString* const MIME_TYPE_DWG       =   @"application/x-dwg";//dwg
NSString* const MIME_TYPE_DXB       =   @"application/x-dxb";//dxb
NSString* const MIME_TYPE_DXF       =   @"application/x-dxf";//dxf
NSString* const MIME_TYPE_EDN       =   @"application/vnd.adobe.edn";//edn
NSString* const MIME_TYPE_EMF       =   @"application/x-emf";//emf
NSString* const MIME_TYPE_EML       =   @"message/rfc822";//eml,mht,mhtml,nws
NSString* const MIME_TYPE_EPI       =   @"application/x-epi";//epi
NSString* const MIME_TYPE_XPS       =   @"application/x-ps";//eps,ps
NSString* const MIME_TYPE_ETD       =   @"application/x-ebx";//etd
NSString* const MIME_TYPE_FAX       =   @"image/fax";//fax
NSString* const MIME_TYPE_FDF       =   @"application/vnd.fdf";//fdf
NSString* const MIME_TYPE_FIF       =   @"application/fractals";//fif
NSString* const MIME_TYPE_FRM       =   @"application/x-frm";//frm
NSString* const MIME_TYPE_GBR       =   @"application/x-gbr";//gbr
NSString* const MIME_TYPE_EMPTY     =   @"application/x-";//.
NSString* const MIME_TYPE_GIF       =   @"image/gif";//gif
NSString* const MIME_TYPE_GL2       =   @"application/x-gl2";//gl2
NSString* const MIME_TYPE_GP4       =   @"application/x-gp4";//gp4
NSString* const MIME_TYPE_HGL       =   @"application/x-hgl";//hgl
NSString* const MIME_TYPE_HMR       =   @"application/x-hmr";//hmr
NSString* const MIME_TYPE_HPG       =   @"application/x-hpgl";//hpg
NSString* const MIME_TYPE_HPL       =   @"application/x-hpl";//hpl
NSString* const MIME_TYPE_HQX       =   @"application/mac-binhex40";//hqx
NSString* const MIME_TYPE_HRF       =   @"application/x-hrf";//hrf
NSString* const MIME_TYPE_HTA       =   @"application/hta";//hta
NSString* const MIME_TYPE_HTC       =   @"text/x-component";//htc
NSString* const MIME_TYPE_HTML      =   @"text/html";//htm,html,htx,jsp,plg,stm,xhtml
NSString* const MIME_TYPE_HTT       =   @"text/webviewhtml";//htt
NSString* const MIME_TYPE_ICB       =   @"application/x-icb";//icb
NSString* const MIME_TYPE_ICO       =   @"image/x-icon";//ico
NSString* const MIME_TYPE_ICO2      =   @"application/x-ico";//ico
NSString* const MIME_TYPE_IFF       =   @"application/x-iff";//iff
NSString* const MIME_TYPE_IGS       =   @"application/x-igs";//igs
NSString* const MIME_TYPE_III       =   @"application/x-iphone";//iii
NSString* const MIME_TYPE_IMG       =   @"application/x-img";//img
NSString* const MIME_TYPE_INS       =   @"application/x-internet-signup";//ins,isp
NSString* const MIME_TYPE_IVF       =   @"video/x-ivf";//IVF
NSString* const MIME_TYPE_JPEG      =   @"image/jpeg";//jfif,jpe,jpeg,jpg
NSString* const MIME_TYPE_JPE       =   @"application/x-jpe";//jpe
NSString* const MIME_TYPE_JPG       =   @"application/x-jpg";//jpg
NSString* const MIME_TYPE_JS        =   @"application/x-javascript";//js,ls,mocha
NSString* const MIME_TYPE_LA1       =   @"audio/x-liquid-file";//la1
NSString* const MIME_TYPE_LAR       =   @"application/x-laplayer-reg";//lar
NSString* const MIME_TYPE_LATEX     =   @"application/x-latex";//latex
NSString* const MIME_TYPE_LAVS      =   @"audio/x-liquid-secure";//lavs
NSString* const MIME_TYPE_LBM       =   @"application/x-lbm";//lbm
NSString* const MIME_TYPE_LMS       =   @"audio/x-la-lms";//lmsff
NSString* const MIME_TYPE_LTR       =   @"application/x-ltr";//ltr
NSString* const MIME_TYPE_MPEG      =   @"video/x-mpeg";//m1v,m2v,mpe,mps
NSString* const MIME_TYPE_M3U       =   @"audio/mpegurl";//m3u
NSString* const MIME_TYPE_MEPG4     =   @"video/mpeg4";//m4e,mp4
NSString* const MIME_TYPE_MAC       =   @"application/x-mac";//mac
NSString* const MIME_TYPE_MAN       =   @"application/x-troff-man";//man
NSString* const MIME_TYPE_MDB       =   @"application/msaccess";//mdb
NSString* const MIME_TYPE_XMDB      =   @"application/x-mdb";//mdb
NSString* const MIME_TYPE_SWF       =   @"application/x-shockwave-flash";//mfp,swf
NSString* const MIME_TYPE_MI        =   @"application/x-mi";//mi
NSString* const MIME_TYPE_MID       =   @"audio/mid";//mid,midi,rmi
NSString* const MIME_TYPE_MIL       =   @"application/x-mil";//mil
NSString* const MIME_TYPE_MND       =   @"audio/x-musicnet-download";//mnd
NSString* const MIME_TYPE_MNS       =   @"audio/x-musicnet-stream";//mns
NSString* const MIME_TYPE_MOVIE     =   @"video/x-sgi-movie";//movie
NSString* const MIME_TYPE_MP1       =   @"audio/mp1";//mp1
NSString* const MIME_TYPE_MP2       =   @"audio/mp2";//mp2
NSString* const MIME_TYPE_MP2V      =   @"video/mpeg";//mp2v,mpv2
NSString* const MIME_TYPE_MP3       =   @"audio/mp3";//mp3
NSString* const MIME_TYPE_MPA       =   @"video/x-mpg";//mpa
NSString* const MIME_TYPE_MPT       =   @"application/vnd.ms-project";//mpd,mpp,mpt,mpw,mpx
NSString* const MIME_TYPE_MPG       =   @"video/mpg";//mpeg,mpg
NSString* const MIME_TYPE_MPGA      =   @"audio/rn-mpeg";//mpga
NSString* const MIME_TYPE_MXP       =   @"application/x-mmxp";//mxp
NSString* const MIME_TYPE_NET       =   @"image/pnetvue";//net
NSString* const MIME_TYPE_NRF       =   @"application/x-nrf";//nrf
NSString* const MIME_TYPE_ODC       =   @"text/x-ms-odc";//odc
NSString* const MIME_TYPE_OUT       =   @"application/x-out";//out
NSString* const MIME_TYPE_P10       =   @"application/pkcs10";//p10
NSString* const MIME_TYPE_P12       =   @"application/x-pkcs12";//p12,pfx
NSString* const MIME_TYPE_P7B       =   @"application/x-pkcs7-certificates";//p7b,spc
NSString* const MIME_TYPE_P7M       =   @"application/pkcs7-mime";//p7c,p7m
NSString* const MIME_TYPE_P7R       =   @"application/x-pkcs7-certreqresp";//p7r
NSString* const MIME_TYPE_P7S       =   @"application/pkcs7-signature";//p7s
NSString* const MIME_TYPE_PC5       =   @"application/x-pc5";//pc5
NSString* const MIME_TYPE_PCI       =   @"application/x-pci";//pci
NSString* const MIME_TYPE_PCL       =   @"application/x-pcl";//pcl
NSString* const MIME_TYPE_PCX       =   @"application/x-pcx";//pcx
NSString* const MIME_TYPE_PDF       =   @"application/pdf";//pdf
NSString* const MIME_TYPE_PDX       =   @"application/vnd.adobe.pdx";//pdx
NSString* const MIME_TYPE_PGL       =   @"application/x-pgl";//pgl
NSString* const MIME_TYPE_PIC       =   @"application/x-pic";//pic
NSString* const MIME_TYPE_PKO       =   @"application/vnd.ms-pki.pko";//pko
NSString* const MIME_TYPE_PL        =   @"application/x-perl";//pl
NSString* const MIME_TYPE_PLS       =   @"audio/scpls";//pls,xpl
NSString* const MIME_TYPE_PLT       =   @"application/x-plt";//plt
NSString* const MIME_TYPE_PNG       =   @"image/png";//png
NSString* const MIME_TYPE_XPNG      =   @"application/x-png";//png
NSString* const MIME_TYPE_PPT       =   @"application/vnd.ms-powerpoint";//pot,ppa,pps,ppt,pwz
NSString* const MIME_TYPE_PPM       =   @"application/x-ppm";//ppm
NSString* const MIME_TYPE_XPPT      =   @"application/x-ppt";//ppt
NSString* const MIME_TYPE_PR        =   @"application/x-pr";//pr
NSString* const MIME_TYPE_PRF       =   @"application/pics-rules";//prf
NSString* const MIME_TYPE_PRN       =   @"application/x-prn";//prn
NSString* const MIME_TYPE_PRT       =   @"application/x-prt";//prt
NSString* const MIME_TYPE_PTN       =   @"application/x-ptn";//ptn
NSString* const MIME_TYPE_R3T       =   @"text/vnd.rn-realtext3d";//r3t
NSString* const MIME_TYPE_RA        =   @"audio/vnd.rn-realaudio";//ra
NSString* const MIME_TYPE_RAM       =   @"audio/x-pn-realaudio";//ram,rmm
NSString* const MIME_TYPE_RAS       =   @"application/x-ras";//ras
NSString* const MIME_TYPE_RAT       =   @"application/rat-file";//rat
NSString* const MIME_TYPE_REC       =   @"application/vnd.rn-recording";//rec
NSString* const MIME_TYPE_RED       =   @"application/x-red";//red
NSString* const MIME_TYPE_RGB       =   @"application/x-rgb";//rgb
NSString* const MIME_TYPE_RJS       =   @"application/vnd.rn-realsystem-rjs";//rjs
NSString* const MIME_TYPE_RJT       =   @"application/vnd.rn-realsystem-rjt";//rjt
NSString* const MIME_TYPE_RLC       =   @"application/x-rlc";//rlc
NSString* const MIME_TYPE_RLE       =   @"application/x-rle";//rle
NSString* const MIME_TYPE_RM        =   @"application/vnd.rn-realmedia";//rm
NSString* const MIME_TYPE_RMF       =   @"application/vnd.adobe.rmf";//rmf
NSString* const MIME_TYPE_RMJ       =   @"application/vnd.rn-realsystem-rmj";//rmj
NSString* const MIME_TYPE_RMP       =   @"application/vnd.rn-rn_music_package";//rmp
NSString* const MIME_TYPE_RMS       =   @"application/vnd.rn-realmedia-secure";//rms
NSString* const MIME_TYPE_RMVB      =   @"application/vnd.rn-realmedia-vbr";//rmvb
NSString* const MIME_TYPE_RMX       =   @"application/vnd.rn-realsystem-rmx";//rmx
NSString* const MIME_TYPE_RNX       =   @"application/vnd.rn-realplayer";//rnx
NSString* const MIME_TYPE_RP        =   @"image/vnd.rn-realpix";//rp
NSString* const MIME_TYPE_RPM       =   @"audio/x-pn-realaudio-plugin";//rpm
NSString* const MIME_TYPE_RSML      =   @"application/vnd.rn-rsml";//rsml
NSString* const MIME_TYPE_RT        =   @"text/vnd.rn-realtext";//rt
NSString* const MIME_TYPE_RTF       =   @"application/x-rtf";//rtf
NSString* const MIME_TYPE_RV        =   @"video/vnd.rn-realvideo";//rv
NSString* const MIME_TYPE_SAM       =   @"application/x-sam";//sam
NSString* const MIME_TYPE_SAT       =   @"application/x-sat";//sat
NSString* const MIME_TYPE_SDP       =   @"application/sdp";//sdp
NSString* const MIME_TYPE_SDW       =   @"application/x-sdw";//sdw
NSString* const MIME_TYPE_SIT       =   @"application/x-stuffit";//sit
NSString* const MIME_TYPE_SLB       =   @"application/x-slb";//slb
NSString* const MIME_TYPE_SLD       =   @"application/x-sld";//sld
NSString* const MIME_TYPE_SLK       =   @"drawing/x-slk";//slk
NSString* const MIME_TYPE_SMIL      =   @"application/smil";//smi,smil
NSString* const MIME_TYPE_SMK       =   @"application/x-smk";//smk
NSString* const MIME_TYPE_TEXT      =   @"text/plain";//sol,sor,txt
NSString* const MIME_TYPE_SPL       =   @"application/futuresplash";//spl
NSString* const MIME_TYPE_SSM       =   @"application/streamingmedia";//ssm
NSString* const MIME_TYPE_SST       =   @"application/vnd.ms-pki.certstore";//sst
NSString* const MIME_TYPE_STL       =   @"application/vnd.ms-pki.stl";//stl
NSString* const MIME_TYPE_STY       =   @"application/x-sty";//sty
NSString* const MIME_TYPE_TDF       =   @"application/x-tdf";//tdf
NSString* const MIME_TYPE_TG4       =   @"application/x-tg4";//tg4
NSString* const MIME_TYPE_TGA       =   @"application/x-tga";//tga
NSString* const MIME_TYPE_TIFF      =   @"image/tiff";//tif,tiff
NSString* const MIME_TYPE_XTIF      =   @"application/x-tif";//tif
NSString* const MIME_TYPE_TOP       =   @"drawing/x-top";//top
NSString* const MIME_TYPE_BT        =   @"application/x-bittorrent";//torrent
NSString* const MIME_TYPE_UIN       =   @"application/x-icq";//uin
NSString* const MIME_TYPE_ULS       =   @"text/iuls";//uls
NSString* const MIME_TYPE_VCF       =   @"text/x-vcard";//vcf
NSString* const MIME_TYPE_VDA       =   @"application/x-vda";//vda
NSString* const MIME_TYPE_VDX       =   @"application/vnd.visio";//vdx,vsd,vss,vst,vsw,vsx,vtx
NSString* const MIME_TYPE_VPG       =   @"application/x-vpeg005";//vpg
NSString* const MIME_TYPE_VSD       =   @"application/x-vsd";//vsd
NSString* const MIME_TYPE_VST       =   @"application/x-vst";//vst
NSString* const MIME_TYPE_WAV       =   @"audio/wav";//wav
NSString* const MIME_TYPE_WAX       =   @"audio/x-ms-wax";//wax
NSString* const MIME_TYPE_WB1       =   @"application/x-wb1";//wb1
NSString* const MIME_TYPE_WB2       =   @"application/x-wb2";//wb2
NSString* const MIME_TYPE_WB3       =   @"application/x-wb3";//wb3
NSString* const MIME_TYPE_WBMP      =   @"image/vnd.wap.wbmp";//wbmp
NSString* const MIME_TYPE_WK3       =   @"application/x-wk3";//wk3
NSString* const MIME_TYPE_WK4       =   @"application/x-wk4";//wk4
NSString* const MIME_TYPE_WKQ       =   @"application/x-wkq";//wkq
NSString* const MIME_TYPE_WKS       =   @"application/x-wks";//wks
NSString* const MIME_TYPE_WM        =   @"video/x-ms-wm";//wm
NSString* const MIME_TYPE_WMA       =   @"audio/x-ms-wma";//wma
NSString* const MIME_TYPE_WMD       =   @"application/x-ms-wmd";//wmd
NSString* const MIME_TYPE_WMF       =   @"application/x-wmf";//wmf
NSString* const MIME_TYPE_WML       =   @"text/vnd.wap.wml";//wml
NSString* const MIME_TYPE_WMV       =   @"video/x-ms-wmv";//wmv
NSString* const MIME_TYPE_WMX       =   @"video/x-ms-wmx";//wmx
NSString* const MIME_TYPE_WMZ       =   @"application/x-ms-wmz";//wmz
NSString* const MIME_TYPE_WP6       =   @"application/x-wp6";//wp6
NSString* const MIME_TYPE_WPD       =   @"application/x-wpd";//wpd
NSString* const MIME_TYPE_WPG       =   @"application/x-wpg";//wpg
NSString* const MIME_TYPE_WPL       =   @"application/vnd.ms-wpl";//wpl
NSString* const MIME_TYPE_WQ1       =   @"application/x-wq1";//wq1
NSString* const MIME_TYPE_WR1       =   @"application/x-wr1";//wr1
NSString* const MIME_TYPE_WRI       =   @"application/x-wri";//wri
NSString* const MIME_TYPE_WRK       =   @"application/x-wrk";//wrk
NSString* const MIME_TYPE_WS        =   @"application/x-ws";//ws,ws2
NSString* const MIME_TYPE_WSC       =   @"text/scriptlet";//wsc
NSString* const MIME_TYPE_WVX       =   @"video/x-ms-wvx";//wvx
NSString* const MIME_TYPE_XDP       =   @"application/vnd.adobe.xdp";//xdp
NSString* const MIME_TYPE_XFD       =   @"application/vnd.adobe.xfd";//xfd
NSString* const MIME_TYPE_XFDF      =   @"application/vnd.adobe.xfdf";//xfdf
NSString* const MIME_TYPE_XLS       =   @"application/vnd.ms-excel";//xls
NSString* const MIME_TYPE_XXLS      =   @"application/x-xls";//xls
NSString* const MIME_TYPE_XLW       =   @"application/x-xlw";//xlw
NSString* const MIME_TYPE_XWD       =   @"application/x-xwd";//xwd
NSString* const MIME_TYPE_XB        =   @"application/x-x_b";//x_b
NSString* const MIME_TYPE_SIS       =   @"application/vnd.symbian.install";//sis,sisx
NSString* const MIME_TYPE_XT        =   @"application/x-x_t";//x_t
NSString* const MIME_TYPE_IPA       =   @"application/vnd.iphone";//ipa
NSString* const MIME_TYPE_APK       =   @"application/vnd.android.package-archive";//apk
NSString* const MIME_TYPE_XAP       =   @"application/x-silverlight-app";//xap