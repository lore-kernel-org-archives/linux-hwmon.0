Return-path: <venture@google.com>
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Sat, 27 May 2017 19:10:30 -0700
Message-ID: <CAO=notwYZ2Zsa7VeuOMxbR6mY+3kkJBDxoJf9T17BhBAJ+TQZA@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (aspeed-pwm-tacho) On read failure return -ETIMEDOUT
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Content-Type: multipart/alternative; boundary="f403045d139258ddae05508c147d"
List-ID: <linux-hwmon@vger.kernel.org>

--f403045d139258ddae05508c147d
Content-Type: text/plain; charset="UTF-8"

When the controller fails to provide an RPM reading within the alloted
time; the driver returns -ETIMEDOUT and no file contents.

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
b/drivers/hwmon/aspeed-pwm-tacho.c
index 48403a2115be..12b716b70ead 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -7,6 +7,7 @@
  */

 #include <linux/clk.h>
+#include <linux/errno.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/hwmon.h>
@@ -494,7 +495,7 @@ static u32 aspeed_get_fan_tach_ch_measure_period(struct
aspeed_pwm_tacho_data
  return clk / (clk_unit * div_h * div_l * tacho_div * tacho_unit);
 }

-static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
+static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
       u8 fan_tach_ch)
 {
  u32 raw_data, tach_div, clk_source, sec, val;
@@ -510,6 +511,9 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct
aspeed_pwm_tacho_data *priv,
  msleep(sec);

  regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
+ if (!(val & RESULT_STATUS_MASK))
+ return -ETIMEDOUT;
+

> We don't know why the value reported is 0. Maybe it is because no fan is
connected. We can not just return -EAGAIN; this might result in a tight
loop if the problem is permanent. A retry loop which returns -ETIMEOUT
after some reasonable timeout might be more appropriate if the controller
just needs more time, and if reading "0" is an indication that the
controller is not ready.

I've run experiments where it returns 0 when the controller timed out
reading a fan.  But it does make more sense to use -ETIMEDOUT.

I'm also adding a check to see if the result status bit was not set --
versus the value being zero -- there is a semantic difference.

  raw_data = val & RESULT_VALUE_MASK;
  tach_div = priv->type_fan_tach_clock_division[type];
  tach_div = 0x4 << (tach_div * 2);
@@ -561,12 +565,14 @@ static ssize_t show_rpm(struct device *dev, struct
device_attribute *attr,
 {
  struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
  int index = sensor_attr->index;
- u32 rpm;
+ int rpm;
  struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);

  rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
+ if (rpm < 0)
+ return rpm;

- return sprintf(buf, "%u\n", rpm);
+ return sprintf(buf, "%d\n", rpm);
 }

 static umode_t pwm_is_visible(struct kobject *kobj,
-- 
2.13.0.219.gdb65acc882-goog




On Fri, May 26, 2017 at 10:54 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> On 05/26/2017 07:48 AM, Patrick Venture wrote:
>
>> When the controller fails to provide an RPM reading within the allotted
>> time; the driver returns -EAGAIN instead of 0.
>>
>> Signed-off-by: Patrick Venture <venture@google.com <mailto:
>> venture@google.com>>
>> ---
>>   drivers/hwmon/aspeed-pwm-tacho.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
>> b/drivers/hwmon/aspeed-pwm-tacho.c
>> index 48403a2115be..ec57be4a4a55 100644
>> --- a/drivers/hwmon/aspeed-pwm-tacho.c
>> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
>> @@ -7,6 +7,7 @@
>>    */
>>   #include <linux/clk.h>
>> +#include <linux/errno.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/delay.h>
>>   #include <linux/hwmon.h>
>> @@ -516,7 +517,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct
>> aspeed_pwm_tacho_data *priv,
>> clk_source = priv->clk_freq;
>> if (raw_data == 0)
>> -return 0;
>> +return -EAGAIN;
>>
>
> We don't know why the value reported is 0. Maybe it is because no fan is
> connected.
> We can not just return -EAGAIN; this might result in a tight loop if the
> problem is
> permanent. A retry loop which returns -ETIMEOUT after some reasonable
> timeout
> might be more appropriate if the controller just needs more time, and if
> reading "0"
> is an indication that the controller is not ready.
>
> Note that you can not just return an error without changing the function
> type to int.
>
> return (clk_source * 60) / (2 * raw_data * tach_div);
>>   }
>> @@ -566,7 +567,7 @@ static ssize_t show_rpm(struct device *dev, struct
>> device_attribute *attr,
>> rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
>> -return sprintf(buf, "%u\n", rpm);
>> +return sprintf(buf, "%d\n", rpm);
>>
>
> rpm is u32. This is incorrect. This would also return a negative speed to
> the user,
> not an error. To return an error, the variable would have to be an int,
> and the
> code would have to be something like
>
>         int rpm;
>         ...
>         rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
>         if (rpm < 0)
>                 return rpm;
>
>         return sprintf(...);
>
> Guenter
>
>
>   }
>>   static umode_t pwm_is_visible(struct kobject *kobj,
>> --
>> 2.13.0.219.gdb65acc882-goog
>>
>
>

--f403045d139258ddae05508c147d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When the controller fails to provide an RPM reading w=
ithin the alloted<br></div><div><div>time; the driver returns -ETIMEDOUT an=
d no file contents.</div><div><br></div><div>Signed-off-by: Patrick Venture=
 &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&gt;</div>=
<div>---</div><div>=C2=A0drivers/hwmon/aspeed-pwm-tacho.c | 12 +++++++++---=
</div><div>=C2=A01 file changed, 9 insertions(+), 3 deletions(-)</div><div>=
<br></div><div>diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmo=
n/aspeed-pwm-tacho.c</div><div>index 48403a2115be..12b716b70ead 100644</div=
><div>--- a/drivers/hwmon/aspeed-pwm-tacho.c</div><div>+++ b/drivers/hwmon/=
aspeed-pwm-tacho.c</div><div>@@ -7,6 +7,7 @@</div><div>=C2=A0 */</div><div>=
=C2=A0</div><div>=C2=A0#include &lt;linux/clk.h&gt;</div><div>+#include &lt=
;linux/errno.h&gt;</div><div>=C2=A0#include &lt;linux/gpio/consumer.h&gt;</=
div><div>=C2=A0#include &lt;linux/delay.h&gt;</div><div>=C2=A0#include &lt;=
linux/hwmon.h&gt;</div><div>@@ -494,7 +495,7 @@ static u32 aspeed_get_fan_t=
ach_ch_measure_period(struct aspeed_pwm_tacho_data</div><div>=C2=A0<span cl=
ass=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>return clk /=
 (clk_unit * div_h * div_l * tacho_div * tacho_unit);</div><div>=C2=A0}</di=
v><div>=C2=A0</div><div>-static u32 aspeed_get_fan_tach_ch_rpm(struct aspee=
d_pwm_tacho_data *priv,</div><div>+static int aspeed_get_fan_tach_ch_rpm(st=
ruct aspeed_pwm_tacho_data *priv,</div><div>=C2=A0<span class=3D"gmail-Appl=
e-tab-span" style=3D"white-space:pre">				</span> =C2=A0 =C2=A0 =C2=A0u8 fa=
n_tach_ch)</div><div>=C2=A0{</div><div>=C2=A0<span class=3D"gmail-Apple-tab=
-span" style=3D"white-space:pre">	</span>u32 raw_data, tach_div, clk_source=
, sec, val;</div><div>@@ -510,6 +511,9 @@ static u32 aspeed_get_fan_tach_ch=
_rpm(struct aspeed_pwm_tacho_data *priv,</div><div>=C2=A0<span class=3D"gma=
il-Apple-tab-span" style=3D"white-space:pre">	</span>msleep(sec);</div><div=
>=C2=A0</div><div>=C2=A0<span class=3D"gmail-Apple-tab-span" style=3D"white=
-space:pre">	</span>regmap_read(priv-&gt;regmap, ASPEED_PTCR_RESULT, &amp;v=
al);</div><div>+<span class=3D"gmail-Apple-tab-span" style=3D"white-space:p=
re">	</span>if (!(val &amp; RESULT_STATUS_MASK))</div><div>+<span class=3D"=
gmail-Apple-tab-span" style=3D"white-space:pre">		</span>return -ETIMEDOUT;=
</div><div>+</div><div><br></div><div><div>&gt;=C2=A0<span style=3D"font-si=
ze:12.8px">We don&#39;t know why the value reported is 0. Maybe it is becau=
se no fan is connected.=C2=A0</span><span style=3D"font-size:12.8px">We can=
 not just return -EAGAIN; this might result in a tight loop if the problem =
is=C2=A0</span><span style=3D"font-size:12.8px">permanent. A retry loop whi=
ch returns -ETIMEOUT after some reasonable timeout=C2=A0</span><span style=
=3D"font-size:12.8px">might be more appropriate if the controller just need=
s more time, and if reading &quot;0&quot;=C2=A0</span><span style=3D"font-s=
ize:12.8px">is an indication that the controller is not ready.</span><br></=
div><div><br></div><div><span style=3D"font-size:12.8px"></span>I&#39;ve ru=
n experiments where it returns 0 when the controller timed out reading a fa=
n.=C2=A0 But it does make more sense to use -ETIMEDOUT.</div><div><br></div=
><div>I&#39;m also adding a check to see if the result status bit was not s=
et -- versus the value being zero -- there is a semantic difference.</div><=
/div><div><br></div><div>=C2=A0<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>raw_data =3D val &amp; RESULT_VALUE_MASK;</div=
><div>=C2=A0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">=
	</span>tach_div =3D priv-&gt;type_fan_tach_clock_division[type];</div><div=
>=C2=A0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>tach_div =3D 0x4 &lt;&lt; (tach_div * 2);</div><div>@@ -561,12 +565,14 @=
@ static ssize_t show_rpm(struct device *dev, struct device_attribute *attr=
,</div><div>=C2=A0{</div><div>=C2=A0<span class=3D"gmail-Apple-tab-span" st=
yle=3D"white-space:pre">	</span>struct sensor_device_attribute *sensor_attr=
 =3D to_sensor_dev_attr(attr);</div><div>=C2=A0<span class=3D"gmail-Apple-t=
ab-span" style=3D"white-space:pre">	</span>int index =3D sensor_attr-&gt;in=
dex;</div><div>-<span class=3D"gmail-Apple-tab-span" style=3D"white-space:p=
re">	</span>u32 rpm;</div><div>+<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>int rpm;</div><div>=C2=A0<span class=3D"gmail-=
Apple-tab-span" style=3D"white-space:pre">	</span>struct aspeed_pwm_tacho_d=
ata *priv =3D dev_get_drvdata(dev);</div><div>=C2=A0</div><div>=C2=A0<span =
class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>rpm =3D as=
peed_get_fan_tach_ch_rpm(priv, index);</div><div>+<span class=3D"gmail-Appl=
e-tab-span" style=3D"white-space:pre">	</span>if (rpm &lt; 0)</div><div>+<s=
pan class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>retur=
n rpm;</div><div>=C2=A0</div><div>-<span class=3D"gmail-Apple-tab-span" sty=
le=3D"white-space:pre">	</span>return sprintf(buf, &quot;%u\n&quot;, rpm);<=
/div><div>+<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	=
</span>return sprintf(buf, &quot;%d\n&quot;, rpm);</div><div>=C2=A0}</div><=
div>=C2=A0</div><div>=C2=A0static umode_t pwm_is_visible(struct kobject *ko=
bj,</div><div>--=C2=A0</div><div>2.13.0.219.gdb65acc882-goog</div></div><di=
v><br></div><div><div><br></div><div><br></div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Fri, May 26, 2017 at 10:54 PM, Guent=
er Roeck <span dir=3D"ltr">&lt;<a href=3D"mailto:linux@roeck-us.net" target=
=3D"_blank">linux@roeck-us.net</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail-">On 05/26/2017 07:48=
 AM, Patrick Venture wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gma=
il-">
When the controller fails to provide an RPM reading within the allotted<br>
time; the driver returns -EAGAIN instead of 0.<br>
<br></span>
Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" ta=
rget=3D"_blank">venture@google.com</a> &lt;mailto:<a href=3D"mailto:venture=
@google.com" target=3D"_blank">venture@google.com</a>&gt;&gt;<span class=3D=
"gmail-"><br>
---<br>
=C2=A0 drivers/hwmon/aspeed-pwm-tacho<wbr>.c | 5 +++--<br>
=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/hwmon/aspeed-pwm-tac<wbr>ho.c b/drivers/hwmon/aspeed-p=
wm-tac<wbr>ho.c<br>
index 48403a2115be..ec57be4a4a55 100644<br>
--- a/drivers/hwmon/aspeed-pwm-tac<wbr>ho.c<br>
+++ b/drivers/hwmon/aspeed-pwm-tac<wbr>ho.c<br>
@@ -7,6 +7,7 @@<br>
=C2=A0 =C2=A0*/<br>
=C2=A0 #include &lt;linux/clk.h&gt;<br>
+#include &lt;linux/errno.h&gt;<br>
=C2=A0 #include &lt;linux/gpio/consumer.h&gt;<br>
=C2=A0 #include &lt;linux/delay.h&gt;<br>
=C2=A0 #include &lt;linux/hwmon.h&gt;<br>
@@ -516,7 +517,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(str<wbr>uct aspee=
d_pwm_tacho_data *priv,<br>
clk_source =3D priv-&gt;clk_freq;<br>
if (raw_data =3D=3D 0)<br>
-return 0;<br>
+return -EAGAIN;<br>
</span></blockquote>
<br>
We don&#39;t know why the value reported is 0. Maybe it is because no fan i=
s connected.<br>
We can not just return -EAGAIN; this might result in a tight loop if the pr=
oblem is<br>
permanent. A retry loop which returns -ETIMEOUT after some reasonable timeo=
ut<br>
might be more appropriate if the controller just needs more time, and if re=
ading &quot;0&quot;<br>
is an indication that the controller is not ready.<br>
<br>
Note that you can not just return an error without changing the function ty=
pe to int.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
return (clk_source * 60) / (2 * raw_data * tach_div);<br>
=C2=A0 }<br>
@@ -566,7 +567,7 @@ static ssize_t show_rpm(struct device *dev, struct devi=
ce_attribute *attr,<br>
rpm =3D aspeed_get_fan_tach_ch_rpm(pri<wbr>v, index);<br></span>
-return sprintf(buf, &quot;%u\n&quot;, rpm);<br>
+return sprintf(buf, &quot;%d\n&quot;, rpm);<br>
</blockquote>
<br>
rpm is u32. This is incorrect. This would also return a negative speed to t=
he user,<br>
not an error. To return an error, the variable would have to be an int, and=
 the<br>
code would have to be something like<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rpm;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm =3D aspeed_get_fan_tach_ch_rpm(pri<wbr>v, i=
ndex);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rpm &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rpm;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(...);<br>
<br>
Guenter<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 }<br>
=C2=A0 static umode_t pwm_is_visible(struct kobject *kobj,<br>
-- <br>
2.13.0.219.gdb65acc882-goog<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div></div>

--f403045d139258ddae05508c147d--
