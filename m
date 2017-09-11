Return-Path: <marco.franchi@nxp.com>
Return-path: <marco.franchi@nxp.com>
From: Marco Franchi <marco.franchi@nxp.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"arm@kernel.org" <arm@kernel.org>, Marco Franchi <marco.franchi@nxp.com>,
	"d@videhug.ch" <d@videhug.ch>, "jic23@cam.ac.uk" <jic23@cam.ac.uk>,
	"jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
Date: Mon, 11 Sep 2017 17:35:35 +0000
Message-ID: <HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
 <CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>,<CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>,<HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
In-Reply-To: <HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HE1PR0402MB35625D52800B1810FDFB8774F6680HE1PR0402MB3562_"
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

--_000_HE1PR0402MB35625D52800B1810FDFB8774F6680HE1PR0402MB3562_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, 10 Sep 2017 11:44:46 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:


> After finding out there are active users of this sensor I noticed:
>
> - It has a single PXA27x board file using the platform data
> - The platform data is only used to carry two GPIO pins, all other
>   fields are unused
> - The driver does not use GPIO descriptors but the legacy GPIO
>   API
>
> I saw we can swiftly fix this by:
>
> - Killing off the platform data entirely
> - Define a GPIO descriptor lookup table in the board file
> - Use the standard devm_gpiod_get() to grab the GPIO descriptors
>   from either the device tree or the board file table.
>
> This compiles, but needs testing.
>
> Cc: arm@kernel.org
> Cc: Marco Franchi <marco.franchi@nxp.com>
> Cc: Davide Hug <d@videhug.ch>
> Cc: Jonathan Cameron <jic23@cam.ac.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix the return value from devm_gpiod_get() with PTR_ERR()
>   so we defer etc correctly.
>
> ARM SoC folks: please ACK this so the HWMON maintainer can merge
> it when it is in reasonable shape.
>
> Marco: can you test this patch with your setup?

I tested it using the i.MX 7D SABRE-SD and device tree support and it works=
 good.

>
> Davide: can you test this patch with your setup?
>
> Jonathan: I gues you may feel this sensor needs migrating to IIO or
> so, like the Imote and Stargate2 needs migrating to device tree,
> but this helps a bit with that.

Thanks for your help!

Tested by: Marco Franchi <marco.franchi@nxp.com>

--_000_HE1PR0402MB35625D52800B1810FDFB8774F6680HE1PR0402MB3562_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p><span style=3D"font-size: 12pt;"><span style=3D"color: rgb(33, 33, 33); =
font-family: wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;=
, Tahoma, Arial, sans-serif, serif, EmojiFont; font-size: 13.3333px;">On Su=
n, 10 Sep 2017 11:44:46 &#43;0200</span><br style=3D"color: rgb(33, 33, 33)=
; font-family: wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quo=
t;, Tahoma, Arial, sans-serif, serif, EmojiFont; font-size: 13.3333px;">
<span style=3D"color: rgb(33, 33, 33); font-family: wf_segoe-ui_normal, &qu=
ot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif, serif, =
EmojiFont; font-size: 13.3333px;">Linus Walleij &lt;linus.walleij@linaro.or=
g&gt; wrote:</span></span></p>
<p><span style=3D"font-size: 12pt;"><span style=3D"color: rgb(33, 33, 33); =
font-family: wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;=
, Tahoma, Arial, sans-serif, serif, EmojiFont; font-size: 13.3333px;"><br>
</span></span></p>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<div style=3D"color:rgb(0,0,0)"><font size=3D"2"><span style=3D"font-size:1=
0pt">
<div class=3D"PlainText">&gt; After finding out there are active users of t=
his sensor I noticed:<br>
&gt;<br>
&gt; - It has a single PXA27x board file using the platform data<br>
&gt; - The platform data is only used to carry two GPIO pins, all other<br>
&gt;&nbsp;&nbsp; fields are unused<br>
&gt; - The driver does not use GPIO descriptors but the legacy GPIO<br>
&gt;&nbsp;&nbsp; API<br>
&gt;<br>
&gt; I saw we can swiftly fix this by:<br>
&gt;<br>
&gt; - Killing off the platform data entirely<br>
&gt; - Define a GPIO descriptor lookup table in the board file<br>
&gt; - Use the standard devm_gpiod_get() to grab the GPIO descriptors<br>
&gt;&nbsp;&nbsp; from either the device tree or the board file table.<br>
&gt;<br>
&gt; This compiles, but needs testing.<br>
&gt;<br>
&gt; Cc: arm@kernel.org<br>
&gt; Cc: Marco Franchi &lt;marco.franchi@nxp.com&gt;<br>
&gt; Cc: Davide Hug &lt;d@videhug.ch&gt;<br>
&gt; Cc: Jonathan Cameron &lt;jic23@cam.ac.uk&gt;<br>
&gt; Signed-off-by: Linus Walleij &lt;linus.walleij@linaro.org&gt;<br>
&gt; ---<br>
&gt; ChangeLog v1-&gt;v2:<br>
&gt; - Fix the return value from devm_gpiod_get() with PTR_ERR()<br>
&gt;&nbsp;&nbsp; so we defer etc correctly.<br>
&gt;<br>
&gt; ARM SoC folks: please ACK this so the HWMON maintainer can merge<br>
&gt; it when it is in reasonable shape.<br>
&gt;<br>
&gt; Marco: can you test this patch with your setup?<br>
<br>
I tested it using the i.MX 7D SABRE-SD and device tree support and it works=
 good.<br>
<br>
&gt;<br>
&gt; Davide: can you test this patch with your setup?<br>
&gt;<br>
&gt; Jonathan: I gues you may feel this sensor needs migrating to IIO or<br=
>
&gt; so, like the Imote and Stargate2 needs migrating to device tree,<br>
&gt; but this helps a bit with that.<br>
<br>
Thanks for your help!<br>
<br>
Tested by: Marco Franchi &lt;marco.franchi@nxp.com&gt;<br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_HE1PR0402MB35625D52800B1810FDFB8774F6680HE1PR0402MB3562_--
