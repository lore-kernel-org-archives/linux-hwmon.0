Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99133F1055
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788038236; cv=none; b=cRxPMQ3Pq+kmYRiLJT1LOQIFKRmLhgFkr7Znbf21TAGi81ua9MHUN25az3+PWLidOD0d/Vbh3kXKd0CHit7w2n6wsd37KNEoPDG1gE9SupjNB6rSqYpnk5pr8DFIgKwrSniZwLnwh8y5uEbO7waUfFqvyWBPkMsWG7miLQMrj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788038236; c=relaxed/simple;
	bh=cxoxzZDSlFdk80ea0kN57Rh0SXNaobB+Z1a3B12FkgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j6TP4aJQBREdZWF0nG7IDesjnZL1tF1aUA+4eAM01I7fKgnnBXveuiTXiDr/0MuF04xhIC+LJRgqRunziVsE/FusFgCf+ns99q0TLQoq774CGSMvCenoPI41LfR1vp/MxYXOz0KmseSnyGoccUOYS0p1mbjoMG4WRHmwQjR8PdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjAl0DDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjAl0DDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8971F000E9;
	Sat, 29 Aug 2026 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788038234;
	bh=lc0PDav9qmjr4rlF04D+RePc8QzQMVaSgO++mYfFaYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cjAl0DDzythIJGWkBmmahiJTgD/cz/lXpyoLzVSU1W3qzwBvaY0rTrz6t/ouMW9r6
	 FJADHd4wkTjU5YVa1f5ry9oTWSO+FO0l1KUYmQL3gxlbJDHMA/HPkmbZ9Ay8AuYaUk
	 ipow0wM3/hmohFnx8x6EmcqdVIwsZOGnjIktLJyz00V0Nqwuy+8VRHN7K5rlfcW5Ci
	 qUN/qIgcJyZ1bv6ZJeuOzH5n7bAN++cJWoGmy5GLOZj4HNoUedpId5hQliC6zczDnP
	 5p38cwkLae4aatikmWQRHchWgAzjzMGqPEcpBOh7043cpoyQmsGcddmIyfgwyyiHW5
	 7697aCnFuQHmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] hwmon: it87: describe per-chip temperature
 resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829210036.61136-2-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829210036.61136-1-jerome.tollet@gmail.com>
 <20260829210036.61136-2-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 21:17:13 +0000
Message-Id: <20260829211714.4C8971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver queries extended temperature limits and offsets for c=
hannels 4-6 from the hardware but fails to expose them in sysfs, making the=
 newly added feature inaccessible to userspace.
--

commit a00b7b5308a4440e2558cdfeab430801514fd5ce
Author: benoit.masson <yahoo@perenite.com>

    hwmon: it87: describe per-chip temperature resources
   =20
    Add per-chip temp limit/offset/map counts and wire the driver
    to use them.
   =20
    This keeps existing chips on the previous defaults while allowing newer
    chips to advertise larger resources.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 87edb1b6048bb..1af815b5d33a9 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
[ ... ]
> @@ -379,18 +397,24 @@ static const struct it87_devices it87_devices[] =3D=
 {
>  		.name =3D "it8728",
>  		.model =3D "IT8728F",
>  		.features =3D FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
> -		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
> +		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
>  		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
>  		  | FEAT_FANCTL_ONOFF,
> +		.num_temp_limit =3D 6,

[Severity: Medium]
With num_temp_limit updated to 6 for newer chips to support reading
temperature limits and offsets for channels 4-6 from the hardware, do these
new attributes need to be exposed to userspace?

The driver's sysfs mapping array statically lacks limit and offset
attributes for temp4-6:

drivers/hwmon/it87.c:it87_attributes_temp[] {
    ...
	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 21 */
	&sensor_dev_attr_temp5_input.dev_attr.attr,
	&sensor_dev_attr_temp6_input.dev_attr.attr,
	NULL
}

Additionally, the hardcoded logic in it87_temp_is_visible() restricts these
attributes:

drivers/hwmon/it87.c:it87_temp_is_visible() {
    ...
	if (index >=3D 21) {
		i =3D index - 21 + 3;
		a =3D 0;
	}
    ...
}

This logic forces a =3D 0 (input) for all attributes beyond index 21, which
structurally prevents the visibility of min, max, or offset attributes for
temp 4-6 even if they were appended to the array.

Does the sysfs attribute mapping and visibility logic need to be updated so
that userspace can access the newly queried hardware limits?

> +		.num_temp_offset =3D 3,
> +		.num_temp_map =3D 3,
>  		.peci_mask =3D 0x07,
>  	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829210036.6113=
6-1-jerome.tollet@gmail.com?part=3D1
