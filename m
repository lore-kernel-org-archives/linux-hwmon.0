Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF43769F5;
	Tue, 21 Jul 2026 04:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607913; cv=none; b=DNMPjxT/rXUS8mknlOnSjfeZzljJL/VxyQ+6VehlR5oexOc6DOOQyHlHXA062RQA5wD81cp9h8cazX4UG5qjXcoyaKxTBL/ECoBa/SMSIEuazMBmc74cyZmAzkaHeNvKvvghptMzvnyulH/D0NFaQnbZLkQAH3pQP0uyY3jgA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607913; c=relaxed/simple;
	bh=N9BYtsNY7YVc/fWtz//lC88ATdx0eR8vLMItpH/Y0Mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ei62UsEuP6A/Y2+6aRsPR0BIPfEl0df31PakZJN4P66Qg/PXxUcKVk8fVJ4mAz0YQFAJkqK+2HB5Rm94dYNrz5lWeptnfJl6YjeLjJQoY1X/yvnGCsXdr6yBVL96DsdmoSv9Rzoul+UpmTTPvgmaWnZCw8eG94yEF2zxfpxw4fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJf1XfG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJf1XfG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0A81F000E9;
	Tue, 21 Jul 2026 04:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607912;
	bh=D9t9Tm8bKySSKPwlYRcxEqAkJVVFL4+R1k9assworKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJf1XfG6Lgt0bUCOQJgFlWjP9n/OLcj9AYkRwyslR02a2Y5/BWytRCfaZ2XsX7lvl
	 SzGNGUx/k0rqAFrH4pua5Wed2LQY3A1S5PsAgXJ6TEukmFi2/YDZBJ/gVrYiYZNoPZ
	 R1rx1uE+emW1gcxuFkRqVa4GiUosXFjdV+ZhGoK5+H6+kENbM0urPycuR75fTZcPeH
	 str2QKO54Y7oWTswGKYixlZlZz6QecJukpNNl3RMJ6PoRRtL4h0p7DmezH/FZhwEAk
	 cxt+L9BgGVPyYGDkj0bhsrFqPxuRJ1nc5kXVimd/hi7tfyEsqdIFBzJqdJITEFOgyB
	 IuM+h5l94940w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/12] i3c: master: Use unified device property
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721040805.1696503-3-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:25:10 +0000
Message-Id: <20260721042511.7E0A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free and Double-Free on device_register() error path.
--

--- Patch [2]: [PATCH v6 02/12] i3c: master: Use unified device property in=
terface ---
commit 4cd8615c6224b9a8e9ae3761f1ef4f19b3063c29
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Use unified device property interface
   =20
Replace all OF-specific functions with unified device property functions
as a prerequisite to support both ACPI and device tree.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca1..4b3d9628bc39b 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1928,7 +1930,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_=
controller *master)
>  			     desc->info.pid);
> =20
>  		if (desc->boardinfo)
> -			desc->dev->dev.of_node =3D desc->boardinfo->of_node;
> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
> =20
>  		ret =3D device_register(&desc->dev->dev);
>  		if (ret) {
>  			dev_err(&master->dev,
>  				"Failed to add I3C device (err =3D %d)\n", ret);
>  			put_device(&desc->dev->dev);

[Severity: High]
This is a pre-existing issue, but does the error path here leave a
dangling pointer in desc->dev?

If device_register() fails, put_device() drops the reference and
i3c_device_release() frees the underlying memory via kfree().
However, desc->dev is not set to NULL.

Later, when the master controller is unregistered, could this lead to a
write-after-free and double-free when the teardown path iterates over
the devices?

drivers/i3c/master.c:i3c_master_unregister_i3c_devs() {
	...
	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
		if (!i3cdev->dev)
			continue;

		i3cdev->dev->desc =3D NULL;
		if (device_is_registered(&i3cdev->dev->dev))
			device_unregister(&i3cdev->dev->dev);
		else
			put_device(&i3cdev->dev->dev);
	...
}

>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D2
