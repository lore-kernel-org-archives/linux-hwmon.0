Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42E2C028F;
	Thu, 15 Jan 2026 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496595; cv=pass; b=MFIFOY04aY9IG054UaBYmjinCk2g9RL8VAsl6vJurOSMwZ5gQ84j7P+QJV44g/81mIv8wl0gwYe196BS8y0vLs8l49RgSl4qZqK4aj5vCto1GDmwZM3tRxKJvS7iiJfhZrPO+I8uWAMoe6sOQ9pG1DsA2qoU0hAjAP9MOwMxByI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496595; c=relaxed/simple;
	bh=l6sVhh0kKlne+9ROSMcYHRtFARgpwWhFz3ZUtjCHSuk=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RX/p+IY6KL71gvuHMXCEJOa0kA/76ZksZVcfZ+m8kBxpcdjVsg+AooPccvg/jUvjSfkMxCobfguzRLOkI/AtoxJbLB73He7dms1xpqKaFWYsuSZna0wmRIDz4zq1cUzGm9OjPliHOFZBQkGgWr1Meb7VTifxt8KYCiftXXwbGH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=T8Hte4uc; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="T8Hte4uc"
ARC-Seal: i=1; a=rsa-sha256; t=1768496572; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j/yU7JO0WDWZ5aIaAzEi5r75NfqC6Xb5o24/Kzi9lKCM2sR/+/ZZV1K6nDVLsCBYKj6GdAruyxTacD8+rs7FU/jnuTOCKZ4jzs2Nz1VY6pULWzqAqZVHuhjMvhNuyWCmUsDMH7UC39oemOmEsZkC8dWZ//i4UrGGQAjUenJXqtk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768496572; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6uZEoFYfSJ865J79wtdo8eztp3deXrJkRzBhOv9flHE=; 
	b=brDLtC8CCSAXveatDckbyhG/jusnyfwRr6SN3MkXOJTIzwJg2sx7A5z6m1y/7O0x0FMhutT8Xoap5pfo6StBGoT3hD4ahRvER3piFxPZ0hcCrQ3zJQI34q865nu/dvV146Eld9b0xJ4jzyKloj1aJdwtX0D1Qznc5IjzNkZZ2bw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768496572;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=6uZEoFYfSJ865J79wtdo8eztp3deXrJkRzBhOv9flHE=;
	b=T8Hte4uc9iLPaUpCUDJX5YFu+ZbiJVD5HJA/pI4bzSDBUYl3IFUeY1y5BobWupjl
	/P95fHsaaK0BdGywqP/rQKv+Um8o8uIapZlxI5ZzKSudmgYhRfp89saYy9j2RQSW3GK
	4ZqOzxXRH4knGa6bNHI3jcCKkQVP8sTxtSAeZo6s=
Received: by mx.zohomail.com with SMTPS id 1768496570571653.2246695988532;
	Thu, 15 Jan 2026 09:02:50 -0800 (PST)
Message-ID: <9ff2b73e30f06be69b6c0b72b91a19d766310db7.camel@rong.moe>
Subject: Re: [PATCH v9 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: Rong Zhang <i@rong.moe>
To: Kurt Borja <kuurtb@gmail.com>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
In-Reply-To: <DFP7SAGSD32N.3SIIV8JMYHWRM@gmail.com>
References: <20260114122745.986699-1-i@rong.moe>
	 <20260114122745.986699-8-i@rong.moe> <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
	 <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe>
	 <DFP7SAGSD32N.3SIIV8JMYHWRM@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Jan 2026 00:57:42 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Kurt,

On Thu, 2026-01-15 at 08:58 -0500, Kurt Borja wrote:
> On Thu Jan 15, 2026 at 8:03 AM -05, Rong Zhang wrote:
> > Hi Kurt,
> >=20
> > On Wed, 2026-01-14 at 19:16 -0500, Kurt Borja wrote:
> > > Hi Rong,
> > >=20
> > > On Wed Jan 14, 2026 at 7:27 AM -05, Rong Zhang wrote:
> > > > Register an HWMON device for fan reporting/tuning according to
> > > > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) prov=
ided
> > > > by lenovo-wmi-capdata. The corresponding HWMON nodes are:
> > > >=20
> > > >  - fanX_enable: enable/disable the fan (tunable)
> > > >  - fanX_input: current RPM
> > > >  - fanX_max: maximum RPM
> > > >  - fanX_min: minimum RPM
> > > >  - fanX_target: target RPM (tunable)
> > > >=20
> > > > Information from capdata00 and capdata_fan are used to control the
> > > > visibility and constraints of HWMON attributes. Fan info from capda=
ta00
> > > > is collected on bind, while fan info from capdata_fan is collected =
in a
> > > > callback. Once all fan info is collected, register the HWMON device=
.
> > > >=20
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > ---
> > >=20
> > > ...
> > >=20
> > > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Docum=
entation/wmi/devices/lenovo-wmi-other.rst
> > > > index 821282e07d93c..bd1d733ff286d 100644
> > > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > > @@ -31,6 +31,8 @@ under the following path:
> > > > =20
> > > >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attr=
ibute>/
> > > > =20
> > > > +Additionally, this driver also exports attributes to HWMON.
> > > > +
> > > >  LENOVO_CAPABILITY_DATA_00
> > > >  -------------------------
> > > > =20
> > > > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E`=
`
> > > >  The LENOVO_CAPABILITY_DATA_00 interface provides various informati=
on that
> > > >  does not rely on the gamezone thermal mode.
> > > > =20
> > > > +The following HWMON attributes are implemented:
> > > > + - fanX_enable: enable/disable the fan (tunable)
> > >=20
> > > I was testing this series and I'm a bit confused about fanX_enable.
> >=20
> > Thanks for testing!
>=20
> Thanks for working on this!
>=20
> >=20
> > > Judging by this comment and also by taking a quick look at the code, =
it
> > > looks like writting 0 to this attribute disables the fan.
> > >=20
> > > This is however (per hwmon ABI documentation [1]) not how this attrib=
ute
> > > should work. IIUC, it is intended for devices which can disable the f=
an
> > > sensor, not the actual fan.
> >=20
> > Hmm, what a confusing name :-/
> >=20
> > > I fail to see how this feature is useful and I also find it dangerous
> > > for this to be exposed by default, considering the same could be
> > > achieved with the relaxed module parameter, which at least tells the
> > > user to be careful.
> >=20
> > Makes sense. I will remove the attribute and mention such behavior in
> > the module parameter.
>=20
> Also, it would be worth to mention that writting 0 to the fanY_target
> attribute is auto mode, right?

Ah, yes.

> I was testing the fanX_target attribute and it does work as intended,
> i.e. the fan speed changes to the desired speed. However, every time I
> write to this attribute I'm getting -EIO error and it always reads 0.
>=20
> For example:
>=20
> 	$ echo 3550 | sudo tee fan*_target
> 	3550
> 	tee: fan1_target: Input/output error
> 	tee: fan2_target: Input/output error
> 	$ cat fan*_target
> 	0
> 	0
>=20
> But as I said, the fans do reach the desired speed (an approximation of
> it):
>=20
> 	$ cat fan*_input
> 	3500
> 	3500
>=20
> This is a bit weird, but I haven't look in depth into it. I will find
> some time to do it later. This happens on a 83KY (Legion 7 16IAX1)
> laptop.

I'd like to fix it in the next revision. Looking forward to your
progress in debugging :-)

It seems to me that the corresponding ACPI method did not return 1 on
success. There should be some clues in the decompiled ASL code. Could
you attach it in your reply? The HWMON implementation was developed
mostly based on my understanding on the decompiled ASL code of my
device. I'd like to check the one of your device as a cross-reference
to see if there are more potential bugs.

> As it seems that you can change the RPM in 100 increments,

Yeah. That's also true on my device, but I am not sure if all devices
with the interface behave like this. I'd prefer not making such an
assumption.

> maybe you
> could look into the pwmY attributes [1]. I think it is a better fit for
> this feature because pwmY_enable allows you to select between manual and
> auto fan control [2], and I believe some user-space tools already use
> this attribute.

For pwmY, I don't see the point why the kernel should adapt to
userspace tools... If we don't have to, don't be overfit.

For pwmY_enable, it is only a good choice if we adopt pwmY. It's weird
to mix pwmY_enable and fanY_target.

@Derek, may I ask for your opinion here? Should we adopt pwmY*?

> On the implementation you can use fixp_linear_interpolate() [3] to
> convert between and from pwm duty cycle.

If we adopt this, I could imagine three ways to create a PWM-RPM curve:
(1) PWM[0,255] =3D> RPM[min,max]
(2) PWM[0,255] =3D> RPM[0,max]
(3) PWM[0,255] =3D> RPM[0,a_large_number]

relax_fan_constraint=3D1 definitely needs (3) as the fan can spin
slower/faster than min/max_rpm. I don't want to create scale mismatches
between relax_fan_constraint=3D1 and =3D0, so only (3) looks viable to me
in any case. Hmm, we are creating a weird PWM-RPM curve with two
plateau [1].

> This is just a suggestion though, I know I came in too late to the
> discussion but I just got this laptop :P

Happy hacking :P

ThinkBook (my device) only implements few Legion interfaces, so your
information here is very valuable.

> [1] https://elixir.bootlin.com/linux/v6.19-rc5/source/Documentation/ABI/t=
esting/sysfs-class-hwmon#L297
> [2] https://elixir.bootlin.com/linux/v6.19-rc5/source/Documentation/ABI/t=
esting/sysfs-class-hwmon#L312
> [3] https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/fixp-=
arith.h#L145

[1]: Typical curves look like
https://www.overclock.net/threads/are-voltage-controllers-for-fans-bad-and-=
pwm-controlled-fans-better.1627409/#post-25993378

Thanks,
Rong
