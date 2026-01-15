Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92B2857CD
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768501192; cv=none; b=bYVgYjEbJBRpu7JKYtkCygPPTEc4fz31dUXhrU7nFnooh5amB+16+gVB0Vm6naIVhOymDRXK9p1sSR7kLzJ4joH2VNqzCWrgS2w3hCiPQ2n2edLQNCQ5e+7DJgSODcjVsN/RvjhV6NVdIl/qpQGrQh0z+DwNM1A0/1Nrrc3PmyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768501192; c=relaxed/simple;
	bh=rVr1FIBNPncHBdVCWzMeQ8z+HUnfrUVEHb3LmXficQg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eT5iurmEj6hpwQ9Wnu5txQVfD3cWHTDBGouqYtoP4+uTMEOMGvv1lAhusUXGWK16VfO7lHcMzOP1KKUELJ0jYnfO8js8uT0SBTtSdQZUNLvdEz8qNNoz+iXMLTK7PB6fXs5WZKXC+TytjkJgPL2WgUwZs3Eoovb+UJLuPSSk9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtVn9WNl; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtVn9WNl"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-93f5667f944so835697241.2
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 10:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768501189; x=1769105989; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZDpoR7a6maMnnq6q5zRScbthRouyH6j3umxLCjsFhk=;
        b=WtVn9WNlngOx4dZCqDtDfQNOkncOgvT67nMQ/4ujujBWspj7Di3ZA00uf8VqUTH9tV
         MIoqgDZmuiFeQmGsL0tzQ7ezgdq0XgRweIkgZtz2Na/ZFKmTk4Ei7P868CQ/H2raxJ+1
         3uRsszo9jdIzQBKpRhTSZHaA0yQZs65Ym6drcmiE0c53OGeuhMIoVlwDnmdc4CFVuqa9
         PcHT1aS7foae9jux4E4o7K54dUxndJ5+kVPqnZtm+znU0iuv9nYTKd2eNcllA+XfdQ8Y
         8XZrpboVTMYzxAEH0VNUlzxnYqPTJ57aD2/qnAsDiAHZBoa81cxXqNs7kmkWi2lfhWPf
         duSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768501189; x=1769105989;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZDpoR7a6maMnnq6q5zRScbthRouyH6j3umxLCjsFhk=;
        b=NEDwRRdWOMXDU2fFAxzQX6dUNYqSDvpyOEKsiB60TBakus9P/P9a7vBoQKPJOk2PHD
         xZAhcjsbKnysfox8h7W+TeNWzzbsYtKKSGMJhdNd3+9EFNsRaLBVHADYd6r/YDvkX8J8
         bGLh7nU0yEhmgRCxvp1j+DHND79tHIVeGsY0QusQt7jh4MEAN0fO1OMAytmEkM+ulecT
         +IkvZB1tkm/n2ghX87MeNu+dhi361UWrpX2UCb7JiOuwuOaN4aGcby9aiUY4glYomSUG
         Nyko+I3s/ydwI1rv4fVXgU1VMYVBHqO+bSHMhZwQnaHUG6XFq3QnRSRGS1whJpBN9mrJ
         v98A==
X-Forwarded-Encrypted: i=1; AJvYcCXqgkYRWUzOPi+0NJ2t2VYh7gbjdLxCpNAm13TybRKhYGEnf5DF23haV0h2aR6etmlFoZfAFsSLOXbEbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyxyZ7ufzChf8zwSn0gLsPD7jy4Ypr/Eq69HJRueILw+3lCnCk
	tOXTW1j0AehHHDJfcjYvqx3n251QMbxqumqpZMhlbyInfc3dK28pJmon
X-Gm-Gg: AY/fxX6bA3G2kxCIFSE8ntKKxPs1DN69URPr9+ecEXtqXGoKVhMZBF/IZ2vyF2hVnnd
	uKwYc1JDBB+CU00gZQfPgFFqNAvMRbbnHdZuiKblABxfo78yng5iLx6Jld64GYlnZzVhN7anJ2G
	xr9Nm2pku2hSFQPeMG9byTWkWi8CM5FoVpBejbgQiSPbt5wZclvS57KkkpSR22VIr81ghMcPxf/
	TR/4XDHDYu9kxaJVndNJOijZnzfQp8tA6/sBAo8WbHQnUmJf6xJcnvsY/XXjhRP642UnCGvmex+
	/FRCN37MGDoeBPH/Wu17jzTGx6+5RN4fjZsNOvutioS4aO9QhI297ge/ypBwoPVAyqYHR0JuNwT
	5VwKfuom4vkGW1SSZzAFBsmqoFtUGS4TipMBCXvbg2WYmoXrcXz5Ctw4YcXJYFLupz9TgcAFzgo
	jRWA==
X-Received: by 2002:a05:6102:38c9:b0:5ef:a4c9:58d3 with SMTP id ada2fe7eead31-5f1a554a33cmr254280137.20.1768501188997;
        Thu, 15 Jan 2026 10:19:48 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d03c29d7sm61227241.2.2026.01.15.10.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 10:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 13:19:41 -0500
Message-Id: <DFPDCIVCEI8B.19QMW0HTA0PE0@gmail.com>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf"
 <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Guenter
 Roeck" <linux@roeck-us.net>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v9 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260114122745.986699-1-i@rong.moe>
 <20260114122745.986699-8-i@rong.moe> <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
 <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe>
 <DFP7SAGSD32N.3SIIV8JMYHWRM@gmail.com>
 <9ff2b73e30f06be69b6c0b72b91a19d766310db7.camel@rong.moe>
 <59A79FD4-0A1C-4FFE-B4BC-D24588785717@gmail.com>
In-Reply-To: <59A79FD4-0A1C-4FFE-B4BC-D24588785717@gmail.com>

On Thu Jan 15, 2026 at 12:45 PM -05, Derek J. Clark wrote:
> On January 15, 2026 8:57:42 AM PST, Rong Zhang <i@rong.moe> wrote:
>>Hi Kurt,
>>
>>On Thu, 2026-01-15 at 08:58 -0500, Kurt Borja wrote:
>>> On Thu Jan 15, 2026 at 8:03 AM -05, Rong Zhang wrote:
>>> > Hi Kurt,
>>> >=20
>>> > On Wed, 2026-01-14 at 19:16 -0500, Kurt Borja wrote:
>>> > > Hi Rong,
>>> > >=20
>>> > > On Wed Jan 14, 2026 at 7:27 AM -05, Rong Zhang wrote:
>>> > > > Register an HWMON device for fan reporting/tuning according to
>>> > > > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) pr=
ovided
>>> > > > by lenovo-wmi-capdata. The corresponding HWMON nodes are:
>>> > > >=20
>>> > > >  - fanX_enable: enable/disable the fan (tunable)
>>> > > >  - fanX_input: current RPM
>>> > > >  - fanX_max: maximum RPM
>>> > > >  - fanX_min: minimum RPM
>>> > > >  - fanX_target: target RPM (tunable)
>>> > > >=20
>>> > > > Information from capdata00 and capdata_fan are used to control th=
e
>>> > > > visibility and constraints of HWMON attributes. Fan info from cap=
data00
>>> > > > is collected on bind, while fan info from capdata_fan is collecte=
d in a
>>> > > > callback. Once all fan info is collected, register the HWMON devi=
ce.
>>> > > >=20
>>> > > > Signed-off-by: Rong Zhang <i@rong.moe>
>>> > > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> > > > ---
>>> > >=20
>>> > > ...
>>> > >=20
>>> > > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Doc=
umentation/wmi/devices/lenovo-wmi-other.rst
>>> > > > index 821282e07d93c..bd1d733ff286d 100644
>>> > > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
>>> > > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
>>> > > > @@ -31,6 +31,8 @@ under the following path:
>>> > > > =20
>>> > > >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<at=
tribute>/
>>> > > > =20
>>> > > > +Additionally, this driver also exports attributes to HWMON.
>>> > > > +
>>> > > >  LENOVO_CAPABILITY_DATA_00
>>> > > >  -------------------------
>>> > > > =20
>>> > > > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300=
E``
>>> > > >  The LENOVO_CAPABILITY_DATA_00 interface provides various informa=
tion that
>>> > > >  does not rely on the gamezone thermal mode.
>>> > > > =20
>>> > > > +The following HWMON attributes are implemented:
>>> > > > + - fanX_enable: enable/disable the fan (tunable)
>>> > >=20
>>> > > I was testing this series and I'm a bit confused about fanX_enable.
>>> >=20
>>> > Thanks for testing!
>>>=20
>>> Thanks for working on this!
>>>=20
>>> >=20
>>> > > Judging by this comment and also by taking a quick look at the code=
, it
>>> > > looks like writting 0 to this attribute disables the fan.
>>> > >=20
>>> > > This is however (per hwmon ABI documentation [1]) not how this attr=
ibute
>>> > > should work. IIUC, it is intended for devices which can disable the=
 fan
>>> > > sensor, not the actual fan.
>
> I agree, it's just for disabling the reporting of the rpm, not for disabl=
ing the fan. I didn't catch this before.
>
>>> >=20
>>> > Hmm, what a confusing name :-/
>>> >=20
>>> > > I fail to see how this feature is useful and I also find it dangero=
us
>>> > > for this to be exposed by default, considering the same could be
>>> > > achieved with the relaxed module parameter, which at least tells th=
e
>>> > > user to be careful.
>>> >=20
>>> > Makes sense. I will remove the attribute and mention such behavior in
>>> > the module parameter.
>>>=20
>>> Also, it would be worth to mention that writting 0 to the fanY_target
>>> attribute is auto mode, right?
>>
>>Ah, yes.
>>
>>> I was testing the fanX_target attribute and it does work as intended,
>>> i.e. the fan speed changes to the desired speed. However, every time I
>>> write to this attribute I'm getting -EIO error and it always reads 0.
>>>=20
>>> For example:
>>>=20
>>> 	$ echo 3550 | sudo tee fan*_target
>>> 	3550
>>> 	tee: fan1_target: Input/output error
>>> 	tee: fan2_target: Input/output error
>>> 	$ cat fan*_target
>>> 	0
>>> 	0
>>>=20
>>> But as I said, the fans do reach the desired speed (an approximation of
>>> it):
>>>=20
>>> 	$ cat fan*_input
>>> 	3500
>>> 	3500
>>>=20
>>> This is a bit weird, but I haven't look in depth into it. I will find
>>> some time to do it later. This happens on a 83KY (Legion 7 16IAX1)
>>> laptop.
>>
>>I'd like to fix it in the next revision. Looking forward to your
>>progress in debugging :-)
>>
>>It seems to me that the corresponding ACPI method did not return 1 on
>>success. There should be some clues in the decompiled ASL code. Could
>>you attach it in your reply? The HWMON implementation was developed
>>mostly based on my understanding on the decompiled ASL code of my
>>device. I'd like to check the one of your device as a cross-reference
>>to see if there are more potential bugs.
>>
>>> As it seems that you can change the RPM in 100 increments,
>>
>>Yeah. That's also true on my device, but I am not sure if all devices
>>with the interface behave like this. I'd prefer not making such an
>>assumption.
>>
>
> fanY_div maybe makes sense here, defaulting to the known 100 and adjustab=
le with a DMI quirk table if we find devices that do 200/50/20/etc.?
>
>>> maybe you
>>> could look into the pwmY attributes [1]. I think it is a better fit for
>>> this feature because pwmY_enable allows you to select between manual an=
d
>>> auto fan control [2], and I believe some user-space tools already use
>>> this attribute.
>>
>>For pwmY, I don't see the point why the kernel should adapt to
>>userspace tools... If we don't have to, don't be overfit.
>>
>>For pwmY_enable, it is only a good choice if we adopt pwmY. It's weird
>>to mix pwmY_enable and fanY_target.
>>
>>@Derek, may I ask for your opinion here? Should we adopt pwmY*?
>>
>
> All the platform drivers I've written used pwmY/pwmY_enable and fanY_inpu=
t for reporting speed. There is additionally a pwmY_enable mode that sets t=
he fan to max speed. TBS, I think it's a fundamentally different interface.
>
>>> On the implementation you can use fixp_linear_interpolate() [3] to
>>> convert between and from pwm duty cycle.
>>
>>If we adopt this, I could imagine three ways to create a PWM-RPM curve:
>>(1) PWM[0,255] =3D> RPM[min,max]
>>(2) PWM[0,255] =3D> RPM[0,max]
>>(3) PWM[0,255] =3D> RPM[0,a_large_number]
>>
>
> I don't believe this is canonical for pwm, normally you set a fixed speed=
 with pwmY, let the BIOS handle it with auto, or set to max speed with the =
enable function. Fan curves would need to be under pwmY_auto_point_pwm[X|Z]=
, but they're usually paired with tempY_auto_point_pwm[X|Y] to set a speed =
at a given temperature, not necessary to restrict a min/max.
>
> Docs: https://docs.kernel.org/hwmon/sysfs-interface.html
>
> The nature of pwm is that a fixed pulse width determines a fixed fan spee=
d. It is necessarily a single set value. If you want a range, fanY_[min|max=
] seems the way to go.
>
> Using pwmY* will also collide with the fan curve patch I'm adding after t=
his series since newer devices have a 10 value speed Y at temp X curve buil=
t into the WMI interface. Not insurmountable, but I'd rather avoid the conf=
lict so we're not matching on GUID or something like that.
>
> Cheers,
> Derek
>

You're right. It would not be possible to enforce limits when using
pwmY*. We should stick with fanY_target, but the 0 value auto mode
should be documented.


--=20
Thanks,
 ~ Kurt

