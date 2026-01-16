Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577322370A;
	Fri, 16 Jan 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768572445; cv=pass; b=RKV9WGCL/TkZr6vg0w9S33RUoHmmzavii/X6rogyp38qCPAcDuxilF7AIWeCjKrLeByOfbhHBp5h9G7/1x8IrbAsFKzFHIcfKovrCf9PDWV9Ms9hwfzL0NoRoWYmO5zvNJsf7OiGRbHJ2lS6zo7zuQj1Uy0kBYVesaRRd8ODpgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768572445; c=relaxed/simple;
	bh=/4ASKZwlU8ZF2UcAQ4vTTj7D7jdgA5IZCT6ICaI7BgQ=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BE7Qhc02KWWWia4kIxbsFr4sSC8rVfidBJgnF9CK7/ECkWelxseOhumXaBfKGq1FRC7a+MH/BRCE54T4Red93hM5f5LDJTrn3SBRfLVdqIZhPZ0xbPJFz8K7GFnHuONvEuba3W1PukQikfcx9Bz+RA0M9HAnk1mYrYtcmtDt7S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=b9p7gxSm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="b9p7gxSm"
ARC-Seal: i=1; a=rsa-sha256; t=1768572420; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h9Dw2f5cq9pDMxWhq8PSL7inSv7bGSrZnwUUW9oFk0aWZnnDC4jABwYdMLjvVi7VxxoLLJKrfWW7qULn/YucgNubV03mxrc0oS07oLRvBViK0a77+EFSaAEQxp9VqTaGrP5LFmTDZlF0/ofEjFlHhL7xo0fGKshQNxt6m301aRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768572420; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xnRNbo0xQDEhzV7jDjVEKSf/HoadXSTu8ftSzAGBtRc=; 
	b=d78wDqQYrIcnjCD8Q/rkVfHpiidCvhA9ElyBveEVW/apfET0SulUCxKCTg3wObng938wf26vEY2sNo1t79s7xCSz2lPv31+SZ7vo/GKMkP0F/Vk7Hp3KFRKBNxq1gvWUBsauZyDA3zY3FBDwTyeJ2nB+i1lNhoAo3q3+s66D9uw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768572420;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=xnRNbo0xQDEhzV7jDjVEKSf/HoadXSTu8ftSzAGBtRc=;
	b=b9p7gxSmZ4wH1sILeFEes3Z2z8a8z368dV4YwfBFeDzMHmNayxYsvaV0wB4FgQEl
	RWVosUPXD4+WM6FE2YYeyU3v4XQ8DirV9Y6mXxCwFXLQ03HAXSrfYgMnDHWZ60i2IAZ
	K0B+IIq/+Xg9nXz9jHo6kcX2V6Ex3ggqogtOBOBs=
Received: by mx.zohomail.com with SMTPS id 1768572418485265.3517825505879;
	Fri, 16 Jan 2026 06:06:58 -0800 (PST)
Message-ID: <a712de4bd8a34da27f896a6772b80d89f75a40ec.camel@rong.moe>
Subject: Re: [PATCH v9 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  Armin Wolf <W_Armin@gmx.de>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
In-Reply-To: <59A79FD4-0A1C-4FFE-B4BC-D24588785717@gmail.com>
References: <20260114122745.986699-1-i@rong.moe>
	 <20260114122745.986699-8-i@rong.moe> <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
	 <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe>
	 <DFP7SAGSD32N.3SIIV8JMYHWRM@gmail.com>
	 <9ff2b73e30f06be69b6c0b72b91a19d766310db7.camel@rong.moe>
	 <59A79FD4-0A1C-4FFE-B4BC-D24588785717@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Jan 2026 22:01:45 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek,

On Thu, 2026-01-15 at 09:45 -0800, Derek J. Clark wrote:
> On January 15, 2026 8:57:42 AM PST, Rong Zhang <i@rong.moe> wrote:
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
>=20
> I agree, it's just for disabling the reporting of the rpm, not for disabl=
ing the fan. I didn't catch this before.
>=20
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
> >=20
> > > As it seems that you can change the RPM in 100 increments,
> >=20
> > Yeah. That's also true on my device, but I am not sure if all devices
> > with the interface behave like this. I'd prefer not making such an
> > assumption.
> >=20
>=20
> fanY_div maybe makes sense here, defaulting to the known 100 and adjustab=
le with a DMI quirk table if we find devices that do 200/50/20/etc.?

Documentation/ABI/testing/sysfs-class-hwmon says

   Integer value in powers of two (1, 2, 4, 8, 16, 32, 64, 128).

I think we have some minor deviation here, other than that it makes
sense to me.

Perhaps it's acceptable as long as we mention this in our
documentation?

> > > maybe you
> > > could look into the pwmY attributes [1]. I think it is a better fit f=
or
> > > this feature because pwmY_enable allows you to select between manual =
and
> > > auto fan control [2], and I believe some user-space tools already use
> > > this attribute.
> >=20
> > For pwmY, I don't see the point why the kernel should adapt to
> > userspace tools... If we don't have to, don't be overfit.
> >=20
> > For pwmY_enable, it is only a good choice if we adopt pwmY. It's weird
> > to mix pwmY_enable and fanY_target.
> >=20
> > @Derek, may I ask for your opinion here? Should we adopt pwmY*?
> >=20
>=20
> All the platform drivers I've written used pwmY/pwmY_enable and fanY_inpu=
t for reporting speed. There is additionally a pwmY_enable mode that sets t=
he fan to max speed. TBS, I think it's a fundamentally different interface.
>=20
> > > On the implementation you can use fixp_linear_interpolate() [3] to
> > > convert between and from pwm duty cycle.
> >=20
> > If we adopt this, I could imagine three ways to create a PWM-RPM curve:
> > (1) PWM[0,255] =3D> RPM[min,max]
> > (2) PWM[0,255] =3D> RPM[0,max]
> > (3) PWM[0,255] =3D> RPM[0,a_large_number]
> >=20
>=20
> I don't believe this is canonical for pwm, normally you set a fixed speed=
 with pwmY, let the BIOS handle it with auto, or set to max speed with the =
enable function. Fan curves would need to be under pwmY_auto_point_pwm[X|Z]=
, but they're usually paired with tempY_auto_point_pwm[X|Y] to set a speed =
at a given temperature, not necessary to restrict a min/max.
>=20
> Docs: https://docs.kernel.org/hwmon/sysfs-interface.html
>=20
> The nature of pwm is that a fixed pulse width determines a fixed fan spee=
d. It is necessarily a single set value. If you want a range, fanY_[min|max=
] seems the way to go.
>=20
> Using pwmY* will also collide with the fan curve patch I'm adding after t=
his series since newer devices have a 10 value speed Y at temp X curve buil=
t into the WMI interface. Not insurmountable, but I'd rather avoid the conf=
lict so we're not matching on GUID or something like that.

Thanks for your detailed information. I'll stick with fanY_target,
remove fanY_enable, and mention 0 =3D> auto mode in the documentation.

Thanks,
Rong

> Cheers,
> Derek
>=20
> > relax_fan_constraint=3D1 definitely needs (3) as the fan can spin
> > slower/faster than min/max_rpm. I don't want to create scale mismatches
> > between relax_fan_constraint=3D1 and =3D0, so only (3) looks viable to =
me
> > in any case. Hmm, we are creating a weird PWM-RPM curve with two
> > plateau [1].
> >=20
> > > This is just a suggestion though, I know I came in too late to the
> > > discussion but I just got this laptop :P
> >=20
> > Happy hacking :P
> >=20
> > ThinkBook (my device) only implements few Legion interfaces, so your
> > information here is very valuable.
> >=20
> > > [1] https://elixir.bootlin.com/linux/v6.19-rc5/source/Documentation/A=
BI/testing/sysfs-class-hwmon#L297
> > > [2] https://elixir.bootlin.com/linux/v6.19-rc5/source/Documentation/A=
BI/testing/sysfs-class-hwmon#L312
> > > [3] https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/f=
ixp-arith.h#L145
> >=20
> > [1]: Typical curves look like
> > https://www.overclock.net/threads/are-voltage-controllers-for-fans-bad-=
and-pwm-controlled-fans-better.1627409/#post-25993378
> >=20
> > Thanks,
> > Rong
