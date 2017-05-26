Return-path: <venture@google.com>
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 26 May 2017 07:48:31 -0700
Message-ID: <CAO=notz8jvazWfN47GNAEO-crvnbEAwVGPXRumZHxhS-0hPfgg@mail.gmail.com>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) On read failure return -EAGAIN
To: Joel Stanley <joel@jms.id.au>, jdelvare@suse.com, linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Content-Type: multipart/alternative; boundary="f403045c5d628cb4f205506e6fb3"
List-ID: <linux-hwmon@vger.kernel.org>

--f403045c5d628cb4f205506e6fb3
Content-Type: text/plain; charset="UTF-8"

When the controller fails to provide an RPM reading within the allotted
time; the driver returns -EAGAIN instead of 0.

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
b/drivers/hwmon/aspeed-pwm-tacho.c
index 48403a2115be..ec57be4a4a55 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -7,6 +7,7 @@
  */

 #include <linux/clk.h>
+#include <linux/errno.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/hwmon.h>
@@ -516,7 +517,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct
aspeed_pwm_tacho_data *priv,
  clk_source = priv->clk_freq;

  if (raw_data == 0)
- return 0;
+ return -EAGAIN;

  return (clk_source * 60) / (2 * raw_data * tach_div);
 }
@@ -566,7 +567,7 @@ static ssize_t show_rpm(struct device *dev, struct
device_attribute *attr,

  rpm = aspeed_get_fan_tach_ch_rpm(priv, index);

- return sprintf(buf, "%u\n", rpm);
+ return sprintf(buf, "%d\n", rpm);
 }

 static umode_t pwm_is_visible(struct kobject *kobj,
-- 
2.13.0.219.gdb65acc882-goog

--f403045c5d628cb4f205506e6fb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When the controller fails to provide an RPM reading w=
ithin the allotted</div><div>time; the driver returns -EAGAIN instead of 0.=
<br></div><div><br></div><div>Signed-off-by: Patrick Venture &lt;<a href=3D=
"mailto:venture@google.com">venture@google.com</a>&gt;</div><div>---</div><=
div>=C2=A0drivers/hwmon/aspeed-pwm-tacho.c | 5 +++--</div><div>=C2=A01 file=
 changed, 3 insertions(+), 2 deletions(-)</div><div><br></div><div>diff --g=
it a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c</d=
iv><div>index 48403a2115be..ec57be4a4a55 100644</div><div>--- a/drivers/hwm=
on/aspeed-pwm-tacho.c</div><div>+++ b/drivers/hwmon/aspeed-pwm-tacho.c</div=
><div>@@ -7,6 +7,7 @@</div><div>=C2=A0 */</div><div>=C2=A0</div><div>=C2=A0=
#include &lt;linux/clk.h&gt;</div><div>+#include &lt;linux/errno.h&gt;</div=
><div>=C2=A0#include &lt;linux/gpio/consumer.h&gt;</div><div>=C2=A0#include=
 &lt;linux/delay.h&gt;</div><div>=C2=A0#include &lt;linux/hwmon.h&gt;</div>=
<div>@@ -516,7 +517,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspee=
d_pwm_tacho_data *priv,</div><div>=C2=A0<span class=3D"gmail-Apple-tab-span=
" style=3D"white-space:pre">	</span>clk_source =3D priv-&gt;clk_freq;</div>=
<div>=C2=A0</div><div>=C2=A0<span class=3D"gmail-Apple-tab-span" style=3D"w=
hite-space:pre">	</span>if (raw_data =3D=3D 0)</div><div>-<span class=3D"gm=
ail-Apple-tab-span" style=3D"white-space:pre">		</span>return 0;</div><div>=
+<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>re=
turn -EAGAIN;</div><div>=C2=A0</div><div>=C2=A0<span class=3D"gmail-Apple-t=
ab-span" style=3D"white-space:pre">	</span>return (clk_source * 60) / (2 * =
raw_data * tach_div);</div><div>=C2=A0}</div><div>@@ -566,7 +567,7 @@ stati=
c ssize_t show_rpm(struct device *dev, struct device_attribute *attr,</div>=
<div>=C2=A0</div><div>=C2=A0<span class=3D"gmail-Apple-tab-span" style=3D"w=
hite-space:pre">	</span>rpm =3D aspeed_get_fan_tach_ch_rpm(priv, index);</d=
iv><div>=C2=A0</div><div>-<span class=3D"gmail-Apple-tab-span" style=3D"whi=
te-space:pre">	</span>return sprintf(buf, &quot;%u\n&quot;, rpm);</div><div=
>+<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>re=
turn sprintf(buf, &quot;%d\n&quot;, rpm);</div><div>=C2=A0}</div><div>=C2=
=A0</div><div>=C2=A0static umode_t pwm_is_visible(struct kobject *kobj,</di=
v><div>--=C2=A0</div><div>2.13.0.219.gdb65acc882-goog</div></div>

--f403045c5d628cb4f205506e6fb3--
