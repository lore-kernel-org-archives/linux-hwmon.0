Return-Path: <rail@esenciatech.com>
Return-path: <rail@esenciatech.com>
MIME-Version: 1.0
From: Rail Shafigulin <rail@esenciatech.com>
Date: Wed, 16 May 2018 14:39:16 -0700
Message-ID: <CAOLNbFZoEfG_unGXMpT76ShEyJNpAqWVos44PNFr4v_ZzT6Lww@mail.gmail.com>
Subject: Units for measurements and page 1 temperature for LTM4676A
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net
Content-Type: multipart/alternative; boundary="00000000000001f02b056c598d45"
List-ID: <linux-hwmon@vger.kernel.org>

--00000000000001f02b056c598d45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My team is working on a custom board. We have LTM4676A on it. I'm trying to
understand what are the units of measurement for a given register. For
example:

root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# ls -l
total 0
lrwxrwxrwx 1 root root    0 Apr 12 07:51 device -> ../../../1-0044
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_crit
-r--r--r-- 1 root root 4096 Apr 12 07:51 in1_crit_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_highest
-r--r--r-- 1 root root 4096 Apr 12 07:51 in1_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in1_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_lowest
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_min
-r--r--r-- 1 root root 4096 Apr 12 07:51 in1_min_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_reset_history
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_crit
-r--r--r-- 1 root root 4096 Apr 12 07:51 in2_crit_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_highest
-r--r--r-- 1 root root 4096 Apr 12 07:51 in2_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in2_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_lcrit
-r--r--r-- 1 root root 4096 Apr 12 07:51 in2_lcrit_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_max
-r--r--r-- 1 root root 4096 Apr 12 07:51 in2_max_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_min
-r--r--r-- 1 root root 4096 Apr 12 07:51 in2_min_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_reset_history
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_crit
-r--r--r-- 1 root root 4096 Apr 12 07:51 in3_crit_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_highest
-r--r--r-- 1 root root 4096 Apr 12 07:51 in3_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in3_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_lcrit
-r--r--r-- 1 root root 4096 Apr 12 07:51 in3_lcrit_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_max
-r--r--r-- 1 root root 4096 Apr 12 07:51 in3_max_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_min
-r--r--r-- 1 root root 4096 Apr 12 07:51 in3_min_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_reset_history
-r--r--r-- 1 root root 4096 Apr 12 07:51 in4_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in4_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in4_reset_history
-r--r--r-- 1 root root 4096 Apr 12 07:51 in5_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in5_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in5_reset_history
-r--r--r-- 1 root root 4096 Apr 12 07:51 in6_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in6_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in6_reset_history
-r--r--r-- 1 root root 4096 Apr 12 07:51 in7_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in7_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in7_reset_history
-r--r--r-- 1 root root 4096 Apr 12 07:51 in8_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in8_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in8_reset_history
-r--r--r-- 1 root root 4096 Apr 12 07:51 in9_input
-r--r--r-- 1 root root 4096 Apr 12 07:51 in9_label
-rw-r--r-- 1 root root 4096 Apr 12 07:51 in9_reset_history
-r--r--r-- 1 root root 4096 Apr 12 07:51 name
drwxr-xr-x 2 root root    0 Apr 12 07:51 power
lrwxrwxrwx 1 root root    0 Apr 12 07:51 subsystem ->
../../../../../../../../class/hwmon
-rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_crit
-r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_crit_alarm
-r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_input
-rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_lcrit
-r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_lcrit_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_max
-r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_max_alarm
-rw-r--r-- 1 root root 4096 Apr 12 07:49 uevent

root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat nam=
e
ltm4676

root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat
in1_label
vin

root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat
in1_input
11953

root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat
temp1_input
40937


What are the units of in1_input and temp1_input? Are those milli-volts
(10^-3 V) and milli-celcius (10^-3 C)? Or these are raw values and I need
to do a conversion?

LTM4676A and LTM4676 have 2 pages for reporting READ_TEMPERATURE_1
register. How do I change a page value? The LTM4676 driver also doesn't
seem to be aware that there should be a READ_TEMPERATURE_2 register. At
least I don't see it in sysfs.

I tried using a generic driver, pmbus, and here is what I got

root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0041/hwmon/hwmon0# ls -l
total 0
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_input
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_label
-rw-r--r-- 1 root root 4096 Apr 11 03:04 curr1_max
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_max_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 curr2_crit
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_crit_alarm
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_input
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_label
-rw-r--r-- 1 root root 4096 Apr 11 03:04 curr2_max
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_max_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 curr3_crit
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_crit_alarm
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_input
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_label
-rw-r--r-- 1 root root 4096 Apr 11 03:04 curr3_max
-r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_max_alarm
lrwxrwxrwx 1 root root    0 Apr 11 03:04 device -> ../../../1-0041
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in1_crit
-r--r--r-- 1 root root 4096 Apr 11 03:04 in1_crit_alarm
-r--r--r-- 1 root root 4096 Apr 11 03:04 in1_input
-r--r--r-- 1 root root 4096 Apr 11 03:04 in1_label
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in1_min
-r--r--r-- 1 root root 4096 Apr 11 03:04 in1_min_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_crit
-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_crit_alarm
-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_input
-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_label
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_lcrit
-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_lcrit_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_max
-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_max_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_min
-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_min_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_crit
-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_crit_alarm
-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_input
-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_label
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_lcrit
-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_lcrit_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_max
-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_max_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_min
-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_min_alarm
-r--r--r-- 1 root root 4096 Apr 11 03:04 name
drwxr-xr-x 2 root root    0 Apr 11 03:04 power
-r--r--r-- 1 root root 4096 Apr 11 03:04 power1_input
-r--r--r-- 1 root root 4096 Apr 11 03:04 power1_label
-r--r--r-- 1 root root 4096 Apr 11 03:04 power2_input
-r--r--r-- 1 root root 4096 Apr 11 03:04 power2_label
lrwxrwxrwx 1 root root    0 Apr 11 03:04 subsystem ->
../../../../../../../../class/hwmon
-rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_crit
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_crit_alarm
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_input
-rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_lcrit
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_lcrit_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_max
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_max_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_crit
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_crit_alarm
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_input
-rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_lcrit
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_lcrit_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_max
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_max_alarm
-rw-r--r-- 1 root root 4096 Apr 11 03:04 uevent

This one does seem to be aware that there is READ_TEMPERATURE_2 register,
but when it comes to READ_TEMPERATURE_1 I see the same problem. How do I
know for which page this is reported and what are the units?

Any help is appreciated.

--=20
Rail Shafigulin
Software Engineer
Esencia Technologies

--=20







*ESENCIA
TECHNOLOGIES, INC.
*2350 Mission College Blvd. Suite #490

Santa Clara CA 95054

________________________________________________________

Phone: +1 408 736=20
8284 Fax: +1 408 519 3475=C2=A0
http://www.esenciatech.com=20
<http://www.esenciatech.com/>
| http://www.lnttechservices.com=20
<http://www.lnttechservices.com/>





--00000000000001f02b056c598d45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>My team is working on a custom board. We have LTM4676=
A on it. I&#39;m trying to understand what are the units of measurement for=
 a given register. For example:</div><div><br></div><div><div>root@custom-b=
oard:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# ls -l</div><div>tota=
l 0</div><div>lrwxrwxrwx 1 root root=C2=A0 =C2=A0 0 Apr 12 07:51 device -&g=
t; ../../../1-0044</div><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_c=
rit</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in1_crit_alarm</div>=
<div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_highest</div><div>-r--r--=
r-- 1 root root 4096 Apr 12 07:51 in1_input</div><div>-r--r--r-- 1 root roo=
t 4096 Apr 12 07:51 in1_label</div><div>-rw-r--r-- 1 root root 4096 Apr 12 =
07:51 in1_lowest</div><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_min=
</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in1_min_alarm</div><div=
>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_reset_history</div><div>-rw-r=
--r-- 1 root root 4096 Apr 12 07:51 in2_crit</div><div>-r--r--r-- 1 root ro=
ot 4096 Apr 12 07:51 in2_crit_alarm</div><div>-rw-r--r-- 1 root root 4096 A=
pr 12 07:51 in2_highest</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 =
in2_input</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in2_label</div=
><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_lcrit</div><div>-r--r--r=
-- 1 root root 4096 Apr 12 07:51 in2_lcrit_alarm</div><div>-rw-r--r-- 1 roo=
t root 4096 Apr 12 07:51 in2_max</div><div>-r--r--r-- 1 root root 4096 Apr =
12 07:51 in2_max_alarm</div><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 i=
n2_min</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in2_min_alarm</di=
v><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_reset_history</div><div=
>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_crit</div><div>-r--r--r-- 1 r=
oot root 4096 Apr 12 07:51 in3_crit_alarm</div><div>-rw-r--r-- 1 root root =
4096 Apr 12 07:51 in3_highest</div><div>-r--r--r-- 1 root root 4096 Apr 12 =
07:51 in3_input</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in3_labe=
l</div><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_lcrit</div><div>-r=
--r--r-- 1 root root 4096 Apr 12 07:51 in3_lcrit_alarm</div><div>-rw-r--r--=
 1 root root 4096 Apr 12 07:51 in3_max</div><div>-r--r--r-- 1 root root 409=
6 Apr 12 07:51 in3_max_alarm</div><div>-rw-r--r-- 1 root root 4096 Apr 12 0=
7:51 in3_min</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in3_min_ala=
rm</div><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_reset_history</di=
v><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in4_input</div><div>-r--r--=
r-- 1 root root 4096 Apr 12 07:51 in4_label</div><div>-rw-r--r-- 1 root roo=
t 4096 Apr 12 07:51 in4_reset_history</div><div>-r--r--r-- 1 root root 4096=
 Apr 12 07:51 in5_input</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 =
in5_label</div><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in5_reset_hist=
ory</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in6_input</div><div>=
-r--r--r-- 1 root root 4096 Apr 12 07:51 in6_label</div><div>-rw-r--r-- 1 r=
oot root 4096 Apr 12 07:51 in6_reset_history</div><div>-r--r--r-- 1 root ro=
ot 4096 Apr 12 07:51 in7_input</div><div>-r--r--r-- 1 root root 4096 Apr 12=
 07:51 in7_label</div><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 in7_res=
et_history</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in8_input</di=
v><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 in8_label</div><div>-rw-r--=
r-- 1 root root 4096 Apr 12 07:51 in8_reset_history</div><div>-r--r--r-- 1 =
root root 4096 Apr 12 07:51 in9_input</div><div>-r--r--r-- 1 root root 4096=
 Apr 12 07:51 in9_label</div><div>-rw-r--r-- 1 root root 4096 Apr 12 07:51 =
in9_reset_history</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:51 name</=
div><div>drwxr-xr-x 2 root root=C2=A0 =C2=A0 0 Apr 12 07:51 power</div><div=
>lrwxrwxrwx 1 root root=C2=A0 =C2=A0 0 Apr 12 07:51 subsystem -&gt; ../../.=
./../../../../../class/hwmon</div><div>-rw-r--r-- 1 root root 4096 Apr 12 0=
7:50 temp1_crit</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_cr=
it_alarm</div><div>-r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_input</di=
v><div>-rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_lcrit</div><div>-r--r=
--r-- 1 root root 4096 Apr 12 07:50 temp1_lcrit_alarm</div><div>-rw-r--r-- =
1 root root 4096 Apr 12 07:50 temp1_max</div><div>-r--r--r-- 1 root root 40=
96 Apr 12 07:50 temp1_max_alarm</div><div>-rw-r--r-- 1 root root 4096 Apr 1=
2 07:49 uevent</div></div><div><br></div><div><div>root@custom-board:/sys/c=
lass/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat name</div><div>ltm4676</div=
></div><div><br></div><div><div>root@custom-board:/sys/class/i2c-adapter/i2=
c-1/1-0044/hwmon/hwmon2# cat in1_label</div><div>vin</div></div><div><br></=
div><div><div>root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/h=
wmon2# cat in1_input</div><div>11953</div></div><div><br></div><div>root@cu=
stom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat temp1_inpu=
t</div><div>40937</div><div><br></div><div><br></div><div>What are the unit=
s of in1_input and temp1_input? Are those milli-volts (10^-3 V) and milli-c=
elcius (10^-3 C)? Or these are raw values and I need to do a conversion?</d=
iv><div><br></div><div>LTM4676A and LTM4676 have 2 pages for reporting READ=
_TEMPERATURE_1 register. How do I change a page value? The LTM4676 driver a=
lso doesn&#39;t seem to be aware that there should be a READ_TEMPERATURE_2 =
register. At least I don&#39;t see it in sysfs.</div><div><br></div><div>I =
tried using a generic driver, pmbus, and here is what I got</div><div><br><=
/div><div><div>root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0041/hwmon/=
hwmon0# ls -l</div><div>total 0</div><div>-r--r--r-- 1 root root 4096 Apr 1=
1 03:04 curr1_input</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 curr=
1_label</div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 curr1_max</div><=
div>-r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_max_alarm</div><div>-rw-=
r--r-- 1 root root 4096 Apr 11 03:04 curr2_crit</div><div>-r--r--r-- 1 root=
 root 4096 Apr 11 03:04 curr2_crit_alarm</div><div>-r--r--r-- 1 root root 4=
096 Apr 11 03:04 curr2_input</div><div>-r--r--r-- 1 root root 4096 Apr 11 0=
3:04 curr2_label</div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 curr2_m=
ax</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_max_alarm</div>=
<div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 curr3_crit</div><div>-r--r--r=
-- 1 root root 4096 Apr 11 03:04 curr3_crit_alarm</div><div>-r--r--r-- 1 ro=
ot root 4096 Apr 11 03:04 curr3_input</div><div>-r--r--r-- 1 root root 4096=
 Apr 11 03:04 curr3_label</div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:0=
4 curr3_max</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_max_al=
arm</div><div>lrwxrwxrwx 1 root root=C2=A0 =C2=A0 0 Apr 11 03:04 device -&g=
t; ../../../1-0041</div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 in1_c=
rit</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 in1_crit_alarm</div>=
<div>-r--r--r-- 1 root root 4096 Apr 11 03:04 in1_input</div><div>-r--r--r-=
- 1 root root 4096 Apr 11 03:04 in1_label</div><div>-rw-r--r-- 1 root root =
4096 Apr 11 03:04 in1_min</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:0=
4 in1_min_alarm</div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_crit=
</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_crit_alarm</div><di=
v>-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_input</div><div>-r--r--r-- 1=
 root root 4096 Apr 11 03:04 in2_label</div><div>-rw-r--r-- 1 root root 409=
6 Apr 11 03:04 in2_lcrit</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04=
 in2_lcrit_alarm</div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_max=
</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 in2_max_alarm</div><div=
>-rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_min</div><div>-r--r--r-- 1 ro=
ot root 4096 Apr 11 03:04 in2_min_alarm</div><div>-rw-r--r-- 1 root root 40=
96 Apr 11 03:04 in3_crit</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04=
 in3_crit_alarm</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_inpu=
t</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_label</div><div>-r=
w-r--r-- 1 root root 4096 Apr 11 03:04 in3_lcrit</div><div>-r--r--r-- 1 roo=
t root 4096 Apr 11 03:04 in3_lcrit_alarm</div><div>-rw-r--r-- 1 root root 4=
096 Apr 11 03:04 in3_max</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04=
 in3_max_alarm</div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_min</=
div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 in3_min_alarm</div><div>-=
r--r--r-- 1 root root 4096 Apr 11 03:04 name</div><div>drwxr-xr-x 2 root ro=
ot=C2=A0 =C2=A0 0 Apr 11 03:04 power</div><div>-r--r--r-- 1 root root 4096 =
Apr 11 03:04 power1_input</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:0=
4 power1_label</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 power2_in=
put</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 power2_label</div><d=
iv>lrwxrwxrwx 1 root root=C2=A0 =C2=A0 0 Apr 11 03:04 subsystem -&gt; ../..=
/../../../../../../class/hwmon</div><div>-rw-r--r-- 1 root root 4096 Apr 11=
 03:04 temp1_crit</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_=
crit_alarm</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_input</=
div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_lcrit</div><div>-r-=
-r--r-- 1 root root 4096 Apr 11 03:04 temp1_lcrit_alarm</div><div>-rw-r--r-=
- 1 root root 4096 Apr 11 03:04 temp1_max</div><div>-r--r--r-- 1 root root =
4096 Apr 11 03:04 temp1_max_alarm</div><div>-rw-r--r-- 1 root root 4096 Apr=
 11 03:04 temp2_crit</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 tem=
p2_crit_alarm</div><div>-r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_inpu=
t</div><div>-rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_lcrit</div><div>=
-r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_lcrit_alarm</div><div>-rw-r-=
-r-- 1 root root 4096 Apr 11 03:04 temp2_max</div><div>-r--r--r-- 1 root ro=
ot 4096 Apr 11 03:04 temp2_max_alarm</div><div>-rw-r--r-- 1 root root 4096 =
Apr 11 03:04 uevent</div></div><div><br></div><div>This one does seem to be=
 aware that there is READ_TEMPERATURE_2 register, but when it comes to READ=
_TEMPERATURE_1 I see the same problem. How do I know for which page this is=
 reported and what are the units?</div><div><br></div><div>Any help is appr=
eciated.</div><div><br></div><div>--=C2=A0<br></div><div class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Rail Shafigulin<br></di=
v>Software Engineer <br>Esencia Technologies<br></div></div></div></div>
</div>

<br>
<p style=3D"font-family:Arial,Helvetica,sans-serif;font-size:1.3em;margin-t=
op:4pt"><br></p>

<p><b style=3D"font-family:Arial,Helvetica,sans-serif;font-size:1.3em"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Tahoma&quot;,sans-serif">ESENC=
IA
TECHNOLOGIES, INC.<br></span></b><font face=3D"Tahoma, sans-serif"><span st=
yle=3D"font-size:12px">2350 Mission College Blvd. Suite #490</span></font><=
br><span style=3D"font-family:Tahoma,sans-serif;font-size:9pt">Santa Clara =
CA 95054<br></span><font color=3D"#7f7f7f" face=3D"Tahoma, sans-serif" styl=
e=3D"font-family:Arial,Helvetica,sans-serif;font-size:1.3em"><span style=3D=
"font-size:9pt">______________________________</span></font><font color=3D"=
#7f7f7f" face=3D"Tahoma, sans-serif" style=3D"font-family:Arial,Helvetica,s=
ans-serif;font-size:1.3em"><span style=3D"font-size:9pt"><wbr>_____________=
_____________</span></font></p><p style=3D"font-family:Arial,Helvetica,sans=
-serif;font-size:1.3em"><font face=3D"Arial" size=3D"2">Phone: +1 408 736 8=
284 Fax: +1 408 519 3475=C2=A0<br></font><a href=3D"http://www.esenciatech.=
com/" style=3D"font-family:Arial,Helvetica,sans-serif;font-size:1.3em" targ=
et=3D"_blank"><span style=3D"font-size:9.0pt;font-family:&quot;Tahoma&quot;=
,sans-serif">http://www.esenciatech.com</span></a><span style=3D"font-size:=
9pt;font-family:Tahoma,sans-serif">
| </span><a href=3D"http://www.lnttechservices.com/" style=3D"font-family:A=
rial,Helvetica,sans-serif;font-size:1.3em" target=3D"_blank"><span style=3D=
"font-size:9.0pt;font-family:&quot;Tahoma&quot;,sans-serif">http://www.lntt=
echservices.com</span></a></p><p style=3D"font-family:Arial,Helvetica,sans-=
serif;font-size:1.3em"><span style=3D"font-size:9pt;font-family:Tahoma,sans=
-serif"></span></p><p style=3D"font-family:Arial,Helvetica,sans-serif;font-=
size:1.3em"><br></p>
--00000000000001f02b056c598d45--
