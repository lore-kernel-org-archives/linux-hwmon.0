Return-Path: <flip101@gmail.com>
Return-path: <flip101@gmail.com>
MIME-Version: 1.0
From: Philippe L <flip101@gmail.com>
Date: Wed, 28 Nov 2018 16:20:38 +0000
Message-ID: <CACQKD__b7a7-R_LBLiaAxpwD2xUkHAWY6Dhhqg2gazbnPZavJQ@mail.gmail.com>
Subject: amdgpu creating fan attribute for integrated graphics
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	"David (ChunMing) Zhou" <David1.Zhou@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000069a7b057bbbf360"
List-ID: <linux-hwmon@vger.kernel.org>

--000000000000069a7b057bbbf360
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm writing to you after discussing a fancontrol issue on the lm-sensors
issue tracker. I have a AMD Ryzen 5 2400G APU (with integrated graphics).
The amdgpu driver is loaded and also creates a fan1_input attribute.
However there is no separate GPU fan, there is only the CPU (APU) fan which
is controlled by the motherboard. The fan1_input also seems to give some
invalid readouts. I have not yet reached the bottom of this investigation,
but so far my conclusion is that this causes fancontrol to choke up.

Specifically the comment by Guenter Roeck here
https://github.com/lm-sensors/lm-sensors/issues/144#issuecomment-442165451
describes the findings regarding the amdgpu driver.

I'm writing to notify you about this problem, perhaps there can be some
improvement in the amdgpu driver. I'm not really knowledgeable to discuss
the workings of these drivers but i can provide debug output if needed.

Best regards,
Philippe

--000000000000069a7b057bbbf360
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,99)">Hello,</di=
v><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;colo=
r:rgb(7,55,99)"><br></div><div class=3D"gmail_default" style=3D"font-family=
:verdana,sans-serif;color:rgb(7,55,99)">I&#39;m writing to you after discus=
sing a fancontrol issue on the lm-sensors issue tracker. I have a AMD Ryzen=
 5 2400G APU (with integrated graphics). The amdgpu driver is loaded and al=
so creates a fan1_input attribute. However there is no separate GPU fan, th=
ere is only the CPU (APU) fan which is controlled by the motherboard. The f=
an1_input also seems to give some invalid readouts. I have not yet reached =
the bottom of this investigation, but so far my conclusion is that this cau=
ses fancontrol to choke up.</div><div class=3D"gmail_default" style=3D"font=
-family:verdana,sans-serif;color:rgb(7,55,99)"><br></div><div class=3D"gmai=
l_default" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,99)">Spec=
ifically the comment by Guenter Roeck here <a href=3D"https://github.com/lm=
-sensors/lm-sensors/issues/144#issuecomment-442165451">https://github.com/l=
m-sensors/lm-sensors/issues/144#issuecomment-442165451</a> describes the fi=
ndings regarding the amdgpu driver.</div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif;color:rgb(7,55,99)"><br></div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,9=
9)">I&#39;m writing to notify you about this problem, perhaps there can be =
some improvement in the amdgpu driver. I&#39;m not really knowledgeable to =
discuss the workings of these drivers but i can provide debug output if nee=
ded.</div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-se=
rif;color:rgb(7,55,99)"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif;color:rgb(7,55,99)">Best regards,</div><div cla=
ss=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:rgb(7,55=
,99)">Philippe<br></div></div></div></div>

--000000000000069a7b057bbbf360--
