Return-Path: <rene@exactcode.de>
Return-path: <rene@exactcode.de>
Content-Type: multipart/alternative; boundary="Apple-Mail=_BDEB1BAA-0DDF-404E-9341-07C0160E750D"
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH] k10temp support for AMD Ryzen w/ Vega gfx
From: =?iso-8859-1?Q?Ren=E9_Rebe?= <rene@exactcode.de>
In-Reply-To: <20180305230350.GA13099@roeck-us.net>
Date: Tue, 6 Mar 2018 07:48:25 +0100
Cc: linux-hwmon@vger.kernel.org,
 Clemens Ladisch <clemens@ladisch.de>,
 linux-kernel@vger.kernel.org
Message-Id: <E39517F8-AEF1-444D-BA90-DE84CF656D7F@exactcode.de>
References: <1769691A-DD1D-4641-B7BA-62C1BA571EBF@exactcode.de> <20180305230350.GA13099@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>


--Apple-Mail=_BDEB1BAA-0DDF-404E-9341-07C0160E750D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Hi,

On 06 Mar 2018, at 00:03, Guenter Roeck <linux@roeck-us.net> wrote:

> On Mon, Mar 05, 2018 at 11:38:24PM +0100, Ren=E9 Rebe wrote:
>> Hi,
>>=20
>> This enables k10temp for the new AMD Ryzen APUs w/ Vega Mobile Gfx.
>> Tested on Ryzen 5 2500U, the temperature looked plausible.
>>=20
>>  Signed-off-by: Ren=E9 Rebe <rene@exactcode.de>
>>=20
>> PS: 1st RFC - might get white-space damaged, will resend when ACKed.
>> Sorry my Xemacs/Mew broke.
>>=20
>> --- linux-4.15/drivers/hwmon/k10temp.c.vanilla	2018-03-05 =
22:22:30.974331180 +0000
>> +++ linux-4.15/drivers/hwmon/k10temp.c	2018-03-05 =
22:24:17.186327291 +0000
>> @@ -40,6 +40,10 @@
>> #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
>> #endif
>>=20
>> +#ifndef PCI_DEVICE_ID_AMD_17H_RR_NB
>> +#define PCI_DEVICE_ID_AMD_17H_RR_NB	0x15d0
>> +#endif
>> +
>> /* CPUID function 0x80000001, ebx */
>> #define CPUID_PKGTYPE_MASK	0xf0000000
>> #define CPUID_PKGTYPE_F		0x00000000
>> @@ -89,6 +93,8 @@
>> 	{ 0x17, "AMD Ryzen Threadripper 1950", 10000 },
>> 	{ 0x17, "AMD Ryzen Threadripper 1920", 10000 },
>> 	{ 0x17, "AMD Ryzen Threadripper 1910", 10000 },
>> +	{ 0x17, "AMD Ryzen 5 2500U with Radeon Vega Mobile Gfx", 20000 =
},
>> +	{ 0x17, "AMD Ryzen 7 2700U with Radeon Vega Mobile Gfx", 20000 =
},
>=20
> Do you have a confirmation that the temperature offset is correct ?

I tried all of the three currently used offsets and this was looked the =
most plausible.
For me having some indication of temperature is better than having none =
at all.
Maybe some contact at AMD can shed some light on it, too?

> Thanks,
> Guenter
>=20
>> };
>>=20
>> static void read_tempreg_pci(struct pci_dev *pdev, u32 *regval)
>> @@ -289,6 +2944,7 @@
>> 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
>> 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
>> 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_RR_NB) },
>> 	{}
>> };
>> MODULE_DEVICE_TABLE(pci, k10temp_id_table);
>>=20
>> --=20
>> ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin
>> http://exactcode.com | http://exactscan.com | http://ocrkit.com | =
http://t2-project.org | http://rene.rebe.de
>> --
>> To unsubscribe from this list: send the line "unsubscribe =
linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
 ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin
 http://exactcode.com | http://exactscan.com | http://ocrkit.com | =
http://t2-project.org | http://rene.rebe.de


--Apple-Mail=_BDEB1BAA-0DDF-404E-9341-07C0160E750D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;">Hi,<div><br><div><div>On 06 Mar 2018, at 00:03, =
Guenter Roeck &lt;<a =
href=3D"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite">On Mon, Mar 05, 2018 at 11:38:24PM +0100, Ren=E9 Rebe =
wrote:<br><blockquote type=3D"cite">Hi,<br><br>This enables k10temp for =
the new AMD Ryzen APUs w/ Vega Mobile Gfx.<br>Tested on Ryzen 5 2500U, =
the temperature looked plausible.<br><br> &nbsp;Signed-off-by: Ren=E9 =
Rebe &lt;<a =
href=3D"mailto:rene@exactcode.de">rene@exactcode.de</a>&gt;<br><br>PS: =
1st RFC - might get white-space damaged, will resend when =
ACKed.<br>Sorry my Xemacs/Mew broke.<br><br>--- =
linux-4.15/drivers/hwmon/k10temp.c.vanilla<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>2018-03-05 22:22:30.974331180 =
+0000<br>+++ linux-4.15/drivers/hwmon/k10temp.c<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>2018-03-05 22:24:17.186327291 +0000<br>@@ -40,6 +40,10 @@<br> =
#define PCI_DEVICE_ID_AMD_17H_DF_F3<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>0x1463<br> #endif<br><br>+#ifndef =
PCI_DEVICE_ID_AMD_17H_RR_NB<br>+#define PCI_DEVICE_ID_AMD_17H_RR_NB<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>0x15d0<br>+#endif<br>+<br> /* CPUID function 0x80000001, ebx =
*/<br> #define CPUID_PKGTYPE_MASK<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>0xf0000000<br> #define =
CPUID_PKGTYPE_F<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>0x00000000<br>@@ -89,6 +93,8 @@<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ 0x17, "AMD Ryzen Threadripper =
1950", 10000 },<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ 0x17, "AMD Ryzen Threadripper =
1920", 10000 },<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ 0x17, "AMD Ryzen Threadripper =
1910", 10000 },<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ 0x17, "AMD Ryzen 5 2500U with =
Radeon Vega Mobile Gfx", 20000 },<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ 0x17, "AMD Ryzen 7 2700U with =
Radeon Vega Mobile Gfx", 20000 },<br></blockquote><br>Do you have a =
confirmation that the temperature offset is correct =
?<br></blockquote><div><br></div><div>I tried all of the three currently =
used offsets and this was looked the most plausible.</div><div>For me =
having some indication of temperature is better than having none at =
all.</div><div>Maybe some contact at AMD can shed some light on it, =
too?</div><br><blockquote =
type=3D"cite">Thanks,<br>Guenter<br><br><blockquote type=3D"cite"> =
};<br><br> static void read_tempreg_pci(struct pci_dev *pdev, u32 =
*regval)<br>@@ -289,6 +2944,7 @@<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ PCI_VDEVICE(AMD, =
PCI_DEVICE_ID_AMD_16H_NB_F3) },<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ PCI_VDEVICE(AMD, =
PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ PCI_VDEVICE(AMD, =
PCI_DEVICE_ID_AMD_17H_DF_F3) },<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{ PCI_VDEVICE(AMD, =
PCI_DEVICE_ID_AMD_17H_RR_NB) },<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{}<br> };<br> =
MODULE_DEVICE_TABLE(pci, k10temp_id_table);<br><br>-- <br> ExactCODE =
GmbH, Lietzenburger Str. 42, DE-10789 Berlin<br> <a =
href=3D"http://exactcode.com">http://exactcode.com</a> | <a =
href=3D"http://exactscan.com">http://exactscan.com</a> | <a =
href=3D"http://ocrkit.com">http://ocrkit.com</a> | <a =
href=3D"http://t2-project.org">http://t2-project.org</a> | <a =
href=3D"http://rene.rebe.de">http://rene.rebe.de</a><br>--<br>To =
unsubscribe from this list: send the line "unsubscribe linux-hwmon" =
in<br>the body of a message to <a =
href=3D"mailto:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a><br=
>More majordomo info at &nbsp;<a =
href=3D"http://vger.kernel.org/majordomo-info.html">http://vger.kernel.org=
/majordomo-info.html</a><br></blockquote></blockquote></div><br><div =
apple-content-edited=3D"true">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; color: =
rgb(0, 0, 0); font-family: Helvetica; font-style: normal; font-variant: =
normal; font-weight: normal; letter-spacing: normal; line-height: =
normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
border-spacing: 0px; -webkit-text-decorations-in-effect: none; =
-webkit-text-stroke-width: 0px;">--&nbsp;<br>&nbsp;ExactCODE =
GmbH,&nbsp;Lietzenburger Str. 42, DE-10789 Berlin<br>&nbsp;<a =
href=3D"http://exactcode.com/">http://exactcode.com</a>&nbsp;|&nbsp;<a =
href=3D"http://exactscan.com/">http://exactscan.com</a>&nbsp;|&nbsp;<a =
href=3D"http://ocrkit.com/">http://ocrkit.com</a>&nbsp;|&nbsp;<a =
href=3D"http://t2-project.org/">http://t2-project.org</a>&nbsp;|&nbsp;<a =
href=3D"http://rene.rebe.de">http://rene.rebe.de</a></span></div>
</div>
<br></div></body></html>=

--Apple-Mail=_BDEB1BAA-0DDF-404E-9341-07C0160E750D--
