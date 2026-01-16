Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02B335573;
	Fri, 16 Jan 2026 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573461; cv=pass; b=mnTVf6gCuK2U8twG7RHlN8k5ne5A+G2Xm4CT8wDnxZfL9LC7u59hZvuGnpa6ZCYojjw+Eb+0Qx1yXMEtTsGqkT0D6VXVwooP+mL6N4jEz4swR7aS32sb5kREOPkXBWOKHr476+hRt8J2zzmyE/PjatQBYqBvVAYOPvl9OPw20j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573461; c=relaxed/simple;
	bh=FWs2PnNmGEuxoZDT5I8S2yiVJoMVZrIC0GaKbsB13T4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aVZttRYuw93I6EamRmA5jEQAjlDAPwW/bGrFHk5ycSKK+jrzMIM6Eh/jfiYkUd1ATjqZZDiqy3hT3J3ku/Kg4S6SrkEsmdDaESdA1o+lKm3AtihWlmLrrgbb6lGrKYOdfWg5qSh8Bn95FpGnPvMAHRwRBSsYY1lqpCTUVigSMCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=3e9Wa6p0; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="3e9Wa6p0"
ARC-Seal: i=1; a=rsa-sha256; t=1768573439; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B6jfxmp9ErQRSsa0PPST3oAGpxa/tE9ah5I8INtTik+R5ra0F2i9eqT7otaMcPVCJDHeCd8dPxg3fMzIFzKqUENR/+gc9n6yir3SEykRmIafTjhJTBFu+mx04obYwk64OEfInrrp09WnVjkcAeoSY4LcemnQuoWfrurZCNRbUWg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768573439; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oR4IvstyNLo0TnU7LDaYtEwwMXHddPYbx12W1UWDNKg=; 
	b=AMek1bu8OiwGfTAfSalT+j5/PXDxPHRcUniIXFrhgU+tJS5HKNgAOT6Onmpmkv2ro/6FQXbawTcnjhj4ehsqSP6gICOMnA6pv+BC/INIG5mDCAsGhCXP3Z/TEIIwju/lSwSP8j6ABgRUCwCOP2r7k5VHYKUJJQ7+ZWFhLDtg72g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768573439;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=oR4IvstyNLo0TnU7LDaYtEwwMXHddPYbx12W1UWDNKg=;
	b=3e9Wa6p0gBEPobqL4YhIG3j3IBv+PcmGxSxZaFxOLxeMOvlBylVy919xJNY/xjqy
	5bx/xGkKKXW9VEskfxfQr62A5Pc+Xy+P2+vfVdoXhnglFBzvmGdi0grzkfn9VqAecL6
	GDwgMVVQGKpfma2uU0VZwNSicdAXuIp6+IHvn84c=
Received: by mx.zohomail.com with SMTPS id 1768573436264872.731941015765;
	Fri, 16 Jan 2026 06:23:56 -0800 (PST)
Message-ID: <0e7dfebcaa4509e907faa7b43fc8d49ca6729ca2.camel@rong.moe>
Subject: Re: [PATCH v9 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: Rong Zhang <i@rong.moe>
To: Kurt Borja <kuurtb@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, Mark Pearson
	 <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
In-Reply-To: <DFPEEI5LNJXZ.2E32AHA8VUJW3@gmail.com>
References: <20260114122745.986699-1-i@rong.moe>
	 <20260114122745.986699-8-i@rong.moe> <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
	 <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe>
	 <DFP7SAGSD32N.3SIIV8JMYHWRM@gmail.com>
	 <9ff2b73e30f06be69b6c0b72b91a19d766310db7.camel@rong.moe>
	 <DFPEEI5LNJXZ.2E32AHA8VUJW3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Jan 2026 22:18:36 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Kurt,

On Thu, 2026-01-15 at 14:09 -0500, Kurt Borja wrote:
> On Thu Jan 15, 2026 at 11:57 AM -05, Rong Zhang wrote:
> > Hi Kurt,
> >=20
> > On Thu, 2026-01-15 at 08:58 -0500, Kurt Borja wrote:
> > > On Thu Jan 15, 2026 at 8:03 AM -05, Rong Zhang wrote:
> > > > Hi Kurt,
> > > >=20
> > > > On Wed, 2026-01-14 at 19:16 -0500, Kurt Borja wrote:
> > > > > Hi Rong,
> > > > >=20
> > > > > On Wed Jan 14, 2026 at 7:27 AM -05, Rong Zhang wrote:
> > > > > > Register an HWMON device for fan reporting/tuning according to
> > > > > > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) =
provided
> > > > > > by lenovo-wmi-capdata. The corresponding HWMON nodes are:
> > > > > >=20
> > > > > >  - fanX_enable: enable/disable the fan (tunable)
> > > > > >  - fanX_input: current RPM
> > > > > >  - fanX_max: maximum RPM
> > > > > >  - fanX_min: minimum RPM
> > > > > >  - fanX_target: target RPM (tunable)
> > > > > >=20
> > > > > > Information from capdata00 and capdata_fan are used to control =
the
> > > > > > visibility and constraints of HWMON attributes. Fan info from c=
apdata00
> > > > > > is collected on bind, while fan info from capdata_fan is collec=
ted in a
> > > > > > callback. Once all fan info is collected, register the HWMON de=
vice.
> > > > > >=20
> > > > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > > > ---
> > > > >=20
> > > > > ...
> > > > >=20
> > > > > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/D=
ocumentation/wmi/devices/lenovo-wmi-other.rst
> > > > > > index 821282e07d93c..bd1d733ff286d 100644
> > > > > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > > > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > > > > @@ -31,6 +31,8 @@ under the following path:
> > > > > > =20
> > > > > >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<=
attribute>/
> > > > > > =20
> > > > > > +Additionally, this driver also exports attributes to HWMON.
> > > > > > +
> > > > > >  LENOVO_CAPABILITY_DATA_00
> > > > > >  -------------------------
> > > > > > =20
> > > > > > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB3=
00E``
> > > > > >  The LENOVO_CAPABILITY_DATA_00 interface provides various infor=
mation that
> > > > > >  does not rely on the gamezone thermal mode.
> > > > > > =20
> > > > > > +The following HWMON attributes are implemented:
> > > > > > + - fanX_enable: enable/disable the fan (tunable)
> > > > >=20
> > > > > I was testing this series and I'm a bit confused about fanX_enabl=
e.
> > > >=20
> > > > Thanks for testing!
> > >=20
> > > Thanks for working on this!
> > >=20
> > > >=20
> > > > > Judging by this comment and also by taking a quick look at the co=
de, it
> > > > > looks like writting 0 to this attribute disables the fan.
> > > > >=20
> > > > > This is however (per hwmon ABI documentation [1]) not how this at=
tribute
> > > > > should work. IIUC, it is intended for devices which can disable t=
he fan
> > > > > sensor, not the actual fan.
> > > >=20
> > > > Hmm, what a confusing name :-/
> > > >=20
> > > > > I fail to see how this feature is useful and I also find it dange=
rous
> > > > > for this to be exposed by default, considering the same could be
> > > > > achieved with the relaxed module parameter, which at least tells =
the
> > > > > user to be careful.
> > > >=20
> > > > Makes sense. I will remove the attribute and mention such behavior =
in
> > > > the module parameter.
> > >=20
> > > Also, it would be worth to mention that writting 0 to the fanY_target
> > > attribute is auto mode, right?
> >=20
> > Ah, yes.
> >=20
> > > I was testing the fanX_target attribute and it does work as intended,
> > > i.e. the fan speed changes to the desired speed. However, every time =
I
> > > write to this attribute I'm getting -EIO error and it always reads 0.
> > >=20
> > > For example:
> > >=20
> > > 	$ echo 3550 | sudo tee fan*_target
> > > 	3550
> > > 	tee: fan1_target: Input/output error
> > > 	tee: fan2_target: Input/output error
> > > 	$ cat fan*_target
> > > 	0
> > > 	0
> > >=20
> > > But as I said, the fans do reach the desired speed (an approximation =
of
> > > it):
> > >=20
> > > 	$ cat fan*_input
> > > 	3500
> > > 	3500
> > >=20
> > > This is a bit weird, but I haven't look in depth into it. I will find
> > > some time to do it later. This happens on a 83KY (Legion 7 16IAX1)
> > > laptop.
> >=20
> > I'd like to fix it in the next revision. Looking forward to your
> > progress in debugging :-)
> >=20
> > It seems to me that the corresponding ACPI method did not return 1 on
> > success. There should be some clues in the decompiled ASL code. Could
> > you attach it in your reply? The HWMON implementation was developed
> > mostly based on my understanding on the decompiled ASL code of my
> > device. I'd like to check the one of your device as a cross-reference
> > to see if there are more potential bugs.
>=20
> Yep, the ACPI method retval is 0 instead of 1.

Given the divergence between your device and mine, I think we could
just accept both 0 and 1. That should be fine considering that we've
strictly checked LENOVO_CAPABILITY_DATA_00 and LENOVO_FAN_TEST_DATA
before exposing fan channels.

> Here is a snippet of what I believe is the fan control stuff on my
> device (L: 50393):
>=20
>=20
> 	If ((SFV0 =3D=3D 0x04030001))
> 	{
> 		Local0 =3D (SFV1 / 0x64)
> 		^^PC00.LPCB.EC0.LECR (0xD1, One, Local0, 0x02)
> 		Return (Zero)
> 	}
>=20
> 	If ((SFV0 =3D=3D 0x04030002))
> 	{
> 		Local0 =3D (SFV1 / 0x64)
> 		^^PC00.LPCB.EC0.LECR (0xD1, 0x02, Local0, 0x02)
> 		Return (Zero)
> 	}
>=20
> 	If ((SFV0 =3D=3D 0x04030004))
> 	{
> 		Local0 =3D (SFV1 / 0x64)
> 		^^PC00.LPCB.EC0.LECR (0xD1, 0x03, Local0, 0x02)
> 		Return (Zero)
> 	}

On my device, 0x04030001 always returns 1 after writing to EC
registers. 0x04030002 is a stub and always returns 0. That was the
reason why I assumed 1 =3D> success and 0 =3D> failure. Here's the
corresponding code snippet on my device:

   If ((DEV1 =3D=3D 0x04))
   {
       If ((FEA1 =3D=3D 0x03))
       {
           Local0 =3D Buffer (0x06){}
           Local0 [Zero] =3D 0x46
           If ((TYP1 =3D=3D One))
           {
               Local1 =3D ToInteger (DAT1)
               If ((Local1 =3D=3D Zero))
               {
                   Local0 [One] =3D 0x84
               }
               Else
               {
                   MBGS ("Fan1S")
                   Local0 [One] =3D 0x85
                   Divide (Local1, 0x64, Local2, Local1)
                   Local0 [0x02] =3D Local1
               }
           }
  =20
           If ((TYP1 =3D=3D 0x02))
           {
               MBGS ("Fan2S")
               Return (Zero)
           }
  =20
           \_SB.PCI0.LPC0.EC0.ERCD (Local0)
           Return (One)
       }
  =20
       If ((FEA1 =3D=3D 0x04))
       {
           MBGS ("wSet FanNoise")
           DB2H (DAT1)
           \_SB.FANL =3D DAT1 /* \_SB_.GZFD.WMAE.DAT1 */
           Notify (\_TZ.VFAN, 0x80) // Status Change
       }
   }

> You can find the full acpidump attached in this email.

Thanks for that.

> Do you have any idea of what 0x04030004 might be?

It's "system fan". See
https://lore.kernel.org/all/CAFqHKTkOZUfDb8cGbGnVPCS9wNbOBsiyOk_MkZR-2_Za6Z=
PMng@mail.gmail.com/

> This laptop only has 2
> fans. FW bug?

Nope, that's not a bug as long as LENOVO_CAPABILITY_DATA_00 or
LENOVO_FAN_TEST_DATA only indicates the presence of fan 1&2. Lenovo
usually reuses a lot of ASL code among different SKUs, with some other
mechanism to gate inapplicable functionalities.

So I quickly glanced at the decompiled ASL code of your device...

Method WQA9 is LENOVO_CAPABILITY_DATA_00, and it only exposes fan 4 on
specific SKUs (L: 47975):

   If (((GSKU =3D=3D 0x02) || (GSKU =3D=3D 0x03)))
   {
       Return (Buffer (0x0C)
       {
           /* 0000 */  0x04, 0x00, 0x03, 0x04, 0x07, 0x00, 0x00, 0x00,
           /* 0008 */  0x01, 0x00, 0x00, 0x00
       })
   }
   Else
   {
       Return (Buffer (0x0C)
       {
           /* 0000 */  0x04, 0x00, 0x03, 0x04, 0x00, 0x00, 0x00, 0x00,
           /* 0008 */  0x00, 0x00, 0x00, 0x00
       })
   }

I assume your device should return the latter buffer, indicating fan 4
does not exist. That being said, it won't be surprising if the former
one is returned -- my device's LENOVO_CAPABILITY_DATA_00 indicates the
presence of fan 1&2 while LENOVO_FAN_TEST_DATA only exposes fan 1.

Method WQAB is LENOVO_FAN_TEST_DATA (L: 48195). It exposes fan 1&2,
declaring their RPM range to be [1700,5700].

   Return (Buffer (0x1C)
   {
       /* 0000 */  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
       /* 0008 */  0x02, 0x00, 0x00, 0x00, 0x44, 0x16, 0x00, 0x00,
       /* 0010 */  0x44, 0x16, 0x00, 0x00, 0xA4, 0x06, 0x00, 0x00,
       /* 0018 */  0xA4, 0x06, 0x00, 0x00
   })

So these WMI interfaces on your device are implemented mostly well.
LENOVO_FAN_TEST_DATA is enough to prevent fan 4 from being exposed on
your device.

Thanks,
Rong
