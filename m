Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A89331ED4
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124372; cv=none; b=mnNz8s9N5wYQapvsY1tEj6X44vLrZHtuRUQ1F3OjMbfo8MVROuDUckT9OiDkOGwHTbJEQk1kH5v6QkUCZNinCYIn30twQ0pqLtJBHSxOUHwlTtzKk3v2nbJ9w/pXx3+bxs+RFybeEF3wLpYjuYMdZDdYgUv4HuJqDdxb3tw4r9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124372; c=relaxed/simple;
	bh=PqpEFUXVcQAmG1ndrZudy5DG9iV8E2rCQCNFcNBVcWY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KNw68128JviJADiEkLYNKG8i3tpZZOph9G6eVpQrl+FS5c3QZqOqYdHIwYEh4PV5mTI4ujGW2yX7/CSzUGrmfm324dd5zhY/ajgWsqt+DN19q8CIAZxK3EZVBjEjxSjMOhhOkoT68EWgBL01YhrTFD5QeYmvIezOghLHdmAN8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mk+4e3bX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mk+4e3bX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AAD1F00893;
	Wed, 10 Jun 2026 20:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124370;
	bh=XM7WELpMQIMhyAE6EktV2BfK15WJk7RZOyMDl5TsKY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mk+4e3bXlV9Us81F4EfNgRwuES/dMiTPUtEqAknkZnjnIVjzYoLOhrutzDvXXHOM1
	 zLbsR6vDwUcjmX81OnBuQ2D99paqEetxDYQ5w4ATgngADY4k0rgGbl5BnLGdqPKIkb
	 rB4WtjdLdubqQQAFNgcLbt9Kg4LebRPh+Xj28ne3YOWSVZkROtUGzi35/RxxdDyenu
	 dLUoZVc5doaPfwgFky+fFCqwU26nToVhQkFfxj30baGM9yL8wGvTa+2y9MnLpa/avl
	 i0b2GKux99MLvLCnKbgKHmq1GLcWa42+mKhNq++lNC7rgLhm0PDZQV83eI/aLXyG1Z
	 haffWJW/6b6Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/9] platform/x86: dell-wmi-base: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-5-W_Armin@gmx.de>
References: <20260610203453.816254-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:46:09 +0000
Message-Id: <20260610204610.33AAD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] An out-of-bounds read occurs in `dell_wmi_process_key()` when proc=
essing an Eprivacy toggle WMI event with a truncated payload.
- [Medium] The dynamically allocated `tabletswitch_dev` input device does n=
ot have its `dev.parent` field set before registration, violating input sub=
system hierarchy guidelines.
--

commit 64182cf85689e767a05985e35c108182a367628c
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-wmi-base: Use new buffer-based WMI API

This commit updates the driver to use the new buffer-based WMI API.
This also supports ACPI firmware implementations that do not use ACPI
buffers for the event data.

> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform=
/x86/dell/dell-wmi-base.c
> index 2a5804efd3ea8..997383ba18465 100644
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c

[ ... ]

> @@ -446,15 +448,15 @@ static int dell_wmi_process_key(struct wmi_device *=
wdev, int type, int code, u16
>  	} else if (type =3D=3D 0x0011 && code =3D=3D 0xe070 && remaining > 0) {
>  		dell_wmi_switch_event(&priv->tabletswitch_dev,
>  				      "Dell tablet mode switch",
> -				      SW_TABLET_MODE, !buffer[0]);
> +				      SW_TABLET_MODE, !le16_to_cpu(buffer[0]));

[Severity: Medium]
This isn't a bug introduced by this patch, but does dell_wmi_switch_event()
register the input device without assigning dev->dev.parent?

Looking at the dell_wmi_switch_event() definition:

	if (!*subdev) {
		struct input_dev *dev =3D input_allocate_device();
		...
		(dev)->name =3D devname;
		(dev)->id.bustype =3D BUS_HOST;
		if (input_register_device(dev)) {

Without explicitly setting dev->dev.parent before registration, the device
might appear under /sys/devices/virtual/input/ instead of correctly rooting
in the sysfs hierarchy.

>  		return 1;
>  	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000c && remaining > 0) {
>  		/* Eprivacy toggle, switch to "on" key entry for on events */
> -		if (buffer[0] =3D=3D 2)
> +		if (le16_to_cpu(buffer[0]) =3D=3D 2)
>  			key++;
>  		used =3D 1;
>  	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000d && remaining > 0) {
> -		value =3D (buffer[2] =3D=3D 2);
> +		value =3D (le16_to_cpu(buffer[2]) =3D=3D 2);

[Severity: High]
This is a pre-existing issue, but does this cause an out-of-bounds read
when the payload is truncated?

Since remaining > 0 only guarantees that buffer[0] is accessible, could
accessing buffer[2] read memory past the end of the validated WMI buffer
if the remaining event length is 1 or 2?

>  		used =3D 1;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D4
