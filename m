Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035B537C0FC
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 17:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583830; cv=none; b=kNuVIPuXn0gmglteBzFeg7tpr+7zH5VAkFvPveu8XJCPpLgEjhPZjWVV8hrqW3pMaUbLf5jMmawzZOOTGG7L0npp4r0yGwl43lwG3D/JRL31HCy3GD+bfAlGydbGGE+/bt8+V51028swAKi2mrWjb81hZN3z4y7xFGKQuzb3ICI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583830; c=relaxed/simple;
	bh=8NIdsHO4R7Z+ITNhfbm3oeuM2cLj1tSAVYP1uCUbvnU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pM1HGTNLvVfU6Myx0FCGbffZunH4fbet7IyJ/LFvzba8bkETRj/BSL+5niBXhcUhhaL+XZxaHhN/b24Owa+RhttSs1e9QUcbxr3rugQ+nc/84ddXGk4C8/I1YZRb8nSyD/LMrhTA8jUpoeyyF0RZxsMg1dPX4fitRBisRnDrLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6/1BR8R; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6/1BR8R"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5eea75115ceso2392235137.1
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 09:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768583825; x=1769188625; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efGgTmZq2s8Wr+4vLiVPiPXTWhArQuy6Lzh7ja4nxnI=;
        b=N6/1BR8RUaxX6cGefsjmCMMF9Sw11EDcX9jY0Af/DP/hldoUvRutYyVAZ0w1NX8lol
         nUXkpmbvShEWD0E5IkGyXkw0L/CmED6Ablz5TLHZC2OSZrjlxCbVuKve4nh+IeLtAnBh
         RXN2pq4+/wOcLEijqAqeu0r9FiC6E/vvZx4NrA6x1fKOSOUWd0D8Ua4pgUBdZM7TLRjo
         2YiAdzxvp64yBvpFyeBQCpc+mJyjssvKZsjvNnLNBRhKqfKXDPg9P9rm8jR/TJSC1Ego
         KY1kZvLwD1WaKijom39sj8l93Y2ZFDTOFHZ3HpxIOrqlp6WdxxclKdU9Wt7ND1fl2UcF
         cscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768583825; x=1769188625;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efGgTmZq2s8Wr+4vLiVPiPXTWhArQuy6Lzh7ja4nxnI=;
        b=MkpaYrEn5UOnFVfG2bssbODfl29+Aw16sH99cBDRoXKzGmPhCBlxOP3oJiktD4aAF4
         74z1+jqlBi7EkrrKhYAorVdDL3n3t7aXMiXAnUQhk3Ns8RmFrUC1BgHEDow8q/OIplha
         O3wa55vj3pFRiXjXIbMBiP2P5ohrFdgN86p6ZXdPXKwawfKjfzmQPWSPygGI9OuSwZNL
         FCb4iTXLzirK5IkCb+cf808cYGlihH3sjInPh8UZsSb2LgdOAR21mJ3XIMWSK/2b0ZEc
         WpJ2pXRPSNQgbBYySOwH53cQQO/NFd3UL8SY5vMVJpoRmfu8brpayPdDWdyOdzK02QDg
         LLFw==
X-Forwarded-Encrypted: i=1; AJvYcCU8mqGzWpg1dPv/yjTtDJYqTS0uWeLPCM3Sh8BXVzj6xCKCXfbziH56QobjvMrsIJgKcvqB+VYaFM8C4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjPzNlJ7P0itA7GL5kzlgYIPd5Ik43K13zcIfdLextFZItErov
	NZd/BxG9cHLCWWogAFWdszaMxfUr9E9kGpUQX/9abGV3l8DYzbFoYKdH
X-Gm-Gg: AY/fxX7W3LI5ig9qLO/shWSYESArHir9roEPWWL2fwxECIl2Hl1Mo1UlzFPJ5LHvJ8n
	fyu++xYNml3oEsrTdyUH8Efwtn13GpSmdwWy+DCURyAADjq2rvpbAhluOQiGxugVA7xKdWLkoya
	rmAGnL7qi/H3tji4ZXUvy0RJ3+OfV3nLHrKN/VYoE5HqrxO8pESsL4ECb+IBCO+fFfl87Ye6kNg
	4p5ZqcWHWuLMDokVAh7HUxPHPecFMWzMqZh84DNw4OIwwzBYfNImv2OwlitnBBW60iGtJpfgHCv
	ZnviEYthPshG66gJKqru8JctKidNC5dhYIfDxU+xmDnkKW8UyJud0YZq/lZXdA0AhZZUh8ECl7j
	2GeUON81Td3SLIubzf5T3ehukVK9c0QLKiyx6mSWs+bnRvKaXNAMAdvkKHSdTiXvgaiwDCnNTVg
	M9J4fPC5A=
X-Received: by 2002:a05:6102:dd1:b0:5ef:a315:28e5 with SMTP id ada2fe7eead31-5f1923fbde7mr3035107137.3.1768583825301;
        Fri, 16 Jan 2026 09:17:05 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6925726sm1017693137.5.2026.01.16.09.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 09:17:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 12:17:02 -0500
Message-Id: <DFQ6N3R4HO0M.2L0HZMH3N0N49@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Mark Pearson"
 <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede"
 <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Guenter Roeck" <linux@roeck-us.net>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v9 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260114122745.986699-1-i@rong.moe>
 <20260114122745.986699-8-i@rong.moe> <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
 <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe>
 <DFP7SAGSD32N.3SIIV8JMYHWRM@gmail.com>
 <9ff2b73e30f06be69b6c0b72b91a19d766310db7.camel@rong.moe>
 <DFPEEI5LNJXZ.2E32AHA8VUJW3@gmail.com>
 <0e7dfebcaa4509e907faa7b43fc8d49ca6729ca2.camel@rong.moe>
In-Reply-To: <0e7dfebcaa4509e907faa7b43fc8d49ca6729ca2.camel@rong.moe>

On Fri Jan 16, 2026 at 9:18 AM -05, Rong Zhang wrote:
> Hi Kurt,
>
> On Thu, 2026-01-15 at 14:09 -0500, Kurt Borja wrote:
>> On Thu Jan 15, 2026 at 11:57 AM -05, Rong Zhang wrote:
>> > Hi Kurt,
>> >=20
>> > On Thu, 2026-01-15 at 08:58 -0500, Kurt Borja wrote:
>> > > On Thu Jan 15, 2026 at 8:03 AM -05, Rong Zhang wrote:
>> > > > Hi Kurt,
>> > > >=20
>> > > > On Wed, 2026-01-14 at 19:16 -0500, Kurt Borja wrote:
>> > > > > Hi Rong,
>> > > > >=20
>> > > > > On Wed Jan 14, 2026 at 7:27 AM -05, Rong Zhang wrote:
>> > > > > > Register an HWMON device for fan reporting/tuning according to
>> > > > > > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan)=
 provided
>> > > > > > by lenovo-wmi-capdata. The corresponding HWMON nodes are:
>> > > > > >=20
>> > > > > >  - fanX_enable: enable/disable the fan (tunable)
>> > > > > >  - fanX_input: current RPM
>> > > > > >  - fanX_max: maximum RPM
>> > > > > >  - fanX_min: minimum RPM
>> > > > > >  - fanX_target: target RPM (tunable)
>> > > > > >=20
>> > > > > > Information from capdata00 and capdata_fan are used to control=
 the
>> > > > > > visibility and constraints of HWMON attributes. Fan info from =
capdata00
>> > > > > > is collected on bind, while fan info from capdata_fan is colle=
cted in a
>> > > > > > callback. Once all fan info is collected, register the HWMON d=
evice.
>> > > > > >=20
>> > > > > > Signed-off-by: Rong Zhang <i@rong.moe>
>> > > > > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
>> > > > > > ---
>> > > > >=20
>> > > > > ...
>> > > > >=20
>> > > > > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/=
Documentation/wmi/devices/lenovo-wmi-other.rst
>> > > > > > index 821282e07d93c..bd1d733ff286d 100644
>> > > > > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
>> > > > > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
>> > > > > > @@ -31,6 +31,8 @@ under the following path:
>> > > > > > =20
>> > > > > >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/=
<attribute>/
>> > > > > > =20
>> > > > > > +Additionally, this driver also exports attributes to HWMON.
>> > > > > > +
>> > > > > >  LENOVO_CAPABILITY_DATA_00
>> > > > > >  -------------------------
>> > > > > > =20
>> > > > > > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB=
300E``
>> > > > > >  The LENOVO_CAPABILITY_DATA_00 interface provides various info=
rmation that
>> > > > > >  does not rely on the gamezone thermal mode.
>> > > > > > =20
>> > > > > > +The following HWMON attributes are implemented:
>> > > > > > + - fanX_enable: enable/disable the fan (tunable)
>> > > > >=20
>> > > > > I was testing this series and I'm a bit confused about fanX_enab=
le.
>> > > >=20
>> > > > Thanks for testing!
>> > >=20
>> > > Thanks for working on this!
>> > >=20
>> > > >=20
>> > > > > Judging by this comment and also by taking a quick look at the c=
ode, it
>> > > > > looks like writting 0 to this attribute disables the fan.
>> > > > >=20
>> > > > > This is however (per hwmon ABI documentation [1]) not how this a=
ttribute
>> > > > > should work. IIUC, it is intended for devices which can disable =
the fan
>> > > > > sensor, not the actual fan.
>> > > >=20
>> > > > Hmm, what a confusing name :-/
>> > > >=20
>> > > > > I fail to see how this feature is useful and I also find it dang=
erous
>> > > > > for this to be exposed by default, considering the same could be
>> > > > > achieved with the relaxed module parameter, which at least tells=
 the
>> > > > > user to be careful.
>> > > >=20
>> > > > Makes sense. I will remove the attribute and mention such behavior=
 in
>> > > > the module parameter.
>> > >=20
>> > > Also, it would be worth to mention that writting 0 to the fanY_targe=
t
>> > > attribute is auto mode, right?
>> >=20
>> > Ah, yes.
>> >=20
>> > > I was testing the fanX_target attribute and it does work as intended=
,
>> > > i.e. the fan speed changes to the desired speed. However, every time=
 I
>> > > write to this attribute I'm getting -EIO error and it always reads 0=
.
>> > >=20
>> > > For example:
>> > >=20
>> > > 	$ echo 3550 | sudo tee fan*_target
>> > > 	3550
>> > > 	tee: fan1_target: Input/output error
>> > > 	tee: fan2_target: Input/output error
>> > > 	$ cat fan*_target
>> > > 	0
>> > > 	0
>> > >=20
>> > > But as I said, the fans do reach the desired speed (an approximation=
 of
>> > > it):
>> > >=20
>> > > 	$ cat fan*_input
>> > > 	3500
>> > > 	3500
>> > >=20
>> > > This is a bit weird, but I haven't look in depth into it. I will fin=
d
>> > > some time to do it later. This happens on a 83KY (Legion 7 16IAX1)
>> > > laptop.
>> >=20
>> > I'd like to fix it in the next revision. Looking forward to your
>> > progress in debugging :-)
>> >=20
>> > It seems to me that the corresponding ACPI method did not return 1 on
>> > success. There should be some clues in the decompiled ASL code. Could
>> > you attach it in your reply? The HWMON implementation was developed
>> > mostly based on my understanding on the decompiled ASL code of my
>> > device. I'd like to check the one of your device as a cross-reference
>> > to see if there are more potential bugs.
>>=20
>> Yep, the ACPI method retval is 0 instead of 1.
>
> Given the divergence between your device and mine, I think we could
> just accept both 0 and 1. That should be fine considering that we've
> strictly checked LENOVO_CAPABILITY_DATA_00 and LENOVO_FAN_TEST_DATA
> before exposing fan channels.

Thanks! This fixes the -EIO issue.

>
>> Here is a snippet of what I believe is the fan control stuff on my
>> device (L: 50393):
>>=20
>>=20
>> 	If ((SFV0 =3D=3D 0x04030001))
>> 	{
>> 		Local0 =3D (SFV1 / 0x64)
>> 		^^PC00.LPCB.EC0.LECR (0xD1, One, Local0, 0x02)
>> 		Return (Zero)
>> 	}
>>=20
>> 	If ((SFV0 =3D=3D 0x04030002))
>> 	{
>> 		Local0 =3D (SFV1 / 0x64)
>> 		^^PC00.LPCB.EC0.LECR (0xD1, 0x02, Local0, 0x02)
>> 		Return (Zero)
>> 	}
>>=20
>> 	If ((SFV0 =3D=3D 0x04030004))
>> 	{
>> 		Local0 =3D (SFV1 / 0x64)
>> 		^^PC00.LPCB.EC0.LECR (0xD1, 0x03, Local0, 0x02)
>> 		Return (Zero)
>> 	}
>
> On my device, 0x04030001 always returns 1 after writing to EC
> registers. 0x04030002 is a stub and always returns 0. That was the
> reason why I assumed 1 =3D> success and 0 =3D> failure. Here's the
> corresponding code snippet on my device:

I had this exact issue in the alienware-wmi-wmax driver. OEMs tend to be
inconsistent with return values across models.

>
>    If ((DEV1 =3D=3D 0x04))
>    {
>        If ((FEA1 =3D=3D 0x03))
>        {
>            Local0 =3D Buffer (0x06){}
>            Local0 [Zero] =3D 0x46
>            If ((TYP1 =3D=3D One))
>            {
>                Local1 =3D ToInteger (DAT1)
>                If ((Local1 =3D=3D Zero))

Here auto mode is more explicit too.

>                {
>                    Local0 [One] =3D 0x84
>                }
>                Else
>                {
>                    MBGS ("Fan1S")
>                    Local0 [One] =3D 0x85
>                    Divide (Local1, 0x64, Local2, Local1)
>                    Local0 [0x02] =3D Local1
>                }
>            }
>   =20
>            If ((TYP1 =3D=3D 0x02))
>            {
>                MBGS ("Fan2S")
>                Return (Zero)
>            }
>   =20
>            \_SB.PCI0.LPC0.EC0.ERCD (Local0)
>            Return (One)
>        }
>   =20
>        If ((FEA1 =3D=3D 0x04))
>        {
>            MBGS ("wSet FanNoise")
>            DB2H (DAT1)
>            \_SB.FANL =3D DAT1 /* \_SB_.GZFD.WMAE.DAT1 */
>            Notify (\_TZ.VFAN, 0x80) // Status Change
>        }
>    }
>
>> You can find the full acpidump attached in this email.
>
> Thanks for that.
>
>> Do you have any idea of what 0x04030004 might be?
>
> It's "system fan". See
> https://lore.kernel.org/all/CAFqHKTkOZUfDb8cGbGnVPCS9wNbOBsiyOk_MkZR-2_Za=
6ZPMng@mail.gmail.com/
>
>> This laptop only has 2
>> fans. FW bug?
>
> Nope, that's not a bug as long as LENOVO_CAPABILITY_DATA_00 or
> LENOVO_FAN_TEST_DATA only indicates the presence of fan 1&2. Lenovo
> usually reuses a lot of ASL code among different SKUs, with some other
> mechanism to gate inapplicable functionalities.
>
> So I quickly glanced at the decompiled ASL code of your device...
>
> Method WQA9 is LENOVO_CAPABILITY_DATA_00, and it only exposes fan 4 on
> specific SKUs (L: 47975):
>
>    If (((GSKU =3D=3D 0x02) || (GSKU =3D=3D 0x03)))
>    {
>        Return (Buffer (0x0C)
>        {
>            /* 0000 */  0x04, 0x00, 0x03, 0x04, 0x07, 0x00, 0x00, 0x00,
>            /* 0008 */  0x01, 0x00, 0x00, 0x00
>        })
>    }
>    Else
>    {
>        Return (Buffer (0x0C)
>        {
>            /* 0000 */  0x04, 0x00, 0x03, 0x04, 0x00, 0x00, 0x00, 0x00,
>            /* 0008 */  0x00, 0x00, 0x00, 0x00
>        })
>    }
>
> I assume your device should return the latter buffer, indicating fan 4
> does not exist. That being said, it won't be surprising if the former
> one is returned -- my device's LENOVO_CAPABILITY_DATA_00 indicates the
> presence of fan 1&2 while LENOVO_FAN_TEST_DATA only exposes fan 1.
>
> Method WQAB is LENOVO_FAN_TEST_DATA (L: 48195). It exposes fan 1&2,
> declaring their RPM range to be [1700,5700].
>
>    Return (Buffer (0x1C)
>    {
>        /* 0000 */  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
>        /* 0008 */  0x02, 0x00, 0x00, 0x00, 0x44, 0x16, 0x00, 0x00,
>        /* 0010 */  0x44, 0x16, 0x00, 0x00, 0xA4, 0x06, 0x00, 0x00,
>        /* 0018 */  0xA4, 0x06, 0x00, 0x00
>    })
>
> So these WMI interfaces on your device are implemented mostly well.
> LENOVO_FAN_TEST_DATA is enough to prevent fan 4 from being exposed on
> your device.

Yes, fan 4 is not exposed to user-space so everything is fine here.

Thanks for the detailed explaination! I'll check the structure of those
buffers to understand these drivers better.

>
> Thanks,
> Rong


--=20
Thanks,
 ~ Kurt

