Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157A27B32C;
	Wed, 24 Jun 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297771; cv=none; b=ZzTopL2z66INFMAN63JhT8gzDPYUvkw1il3e6M7F4Omx1OllGt8T/JSq98r3RoWzEevtzJHP2WZntLvhbC0Dyr4aPs2FsJO6aBCY+jFalufKWl/A1WMF01pcWsO06myDg+mzgy7PkRiTXFdgUXhrtz6aBsy9wi0MjFtYjmh75oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297771; c=relaxed/simple;
	bh=7vMgiDxC25cDwLt6IPHLPBFlcuXUC3VRxNZ4GRVi4qg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YrvEuqNe7YPARyxNL7/cnfEONmU/Kzo9ndeRA2WL/QiL4/EDEnp55XkMfCs3wWlyE+5ZRXydPoh4Ig1miWnOEuNmZFik8qK5ueazCV84ObjijeaoGjBQkk9XKyp9CzaOb0hGn0anO5yeKc2GLu4g1QbCnooQ6IpbtmMV1kWNKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXOiJLHP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXOiJLHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B70F1F000E9;
	Wed, 24 Jun 2026 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297770;
	bh=ZcjgP38cjWYdr7E6ud8AHj1/uFReGcwtnGz5RuqwhO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QXOiJLHP/52hcW8BlHWsEsgQ6977qap4SQaQz6eFx4QJR3tt5Yv2Lk8KWjCNRVGPq
	 mnkSGEqIw88s/wVQd02g/pbVy+Agf1t4MC+lrASsSV508MlLywY4rv4glEPm42boyY
	 VBboOsxGGGFeMRxSgKbRvLAI870xPvBHNr8VyAUX/rMoMz+YszdXvPxAbyfi2Rqbyv
	 3OFA7Uw0Eo+KYIAgq6ZMQUrYMkId3zttjwMiDlFQa36gGKwou31d1Ik41FIqHBmfP7
	 fdO2JZVWwcGw0B28iKQtANp0lypvzvdwef2sPsR9L2/0nSXWLRu4eQ0rZJkdiMQkG1
	 u+A4ty0pyQgiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/12] i3c: master: match I3C device through DT and
 ACPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624102153.1770072-7-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-7-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:42:49 +0000
Message-Id: <20260624104250.2B70F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Suppressing the native I3C modalias breaks module autoloading for =
standard (non-SETAASA) I3C devices that possess an OF or ACPI node.

Pre-existing issues:
- [Critical] Kernel stack memory disclosure in `i3c_device_uevent`, `modali=
as_show`, and `i3c_device_match_id` when `i3cdev->desc` is NULL.
- [High] Lockless access to `i3cdev->desc` in `i3c_device_match()` can lead=
 to a Use-After-Free during concurrent DAA or Hot-Join operations.
--

commit 027ebb9082e984584613be936bd42a0829ebd9c6
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: match I3C device through DT and ACPI

This patch allows SETAASA-based I3C devices to match through Device Tree
or ACPI when they cannot be identified by PID or DCR. It emits OF and ACPI
modaliases so firmware-matched devices can autoload their drivers.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -320,6 +321,15 @@ static int i3c_device_uevent(const struct device *de=
v, struct kobj_uevent_env *e
>  	const struct i3c_device *i3cdev =3D dev_to_i3cdev(dev);
>  	struct i3c_device_info devinfo;
>  	u16 manuf, part, ext;
> +	int rc;
> +
> +	rc =3D of_device_uevent_modalias(dev, env);
> +	if (rc !=3D -ENODEV)
> +		return rc;

[Severity: High]
Does returning early here break module autoloading for standard I3C devices
that have an OF or ACPI node?

If a standard non-SETAASA device has an OF node, it will only emit the
of: modalias and skip generating the standard i3c: modalias.

If the device's driver only provides an I3C id_table, udev might fail to
find a matching module. Furthermore, since i3c_device_match() restricts
of_driver_match_device() strictly to devices with the
I3C_ADDR_METHOD_SETAASA flag, standard I3C devices wouldn't be able to match
via Device Tree either.

> +
> +	rc =3D acpi_device_uevent_modalias(dev, env);
> +	if (rc !=3D -ENODEV)
> +		return rc;
> =20
>  	if (i3cdev->desc)
>  		devinfo =3D i3cdev->desc->info;

[Severity: Critical]
This is a pre-existing issue, but can this leak uninitialized stack memory
to userspace?

When a device is unregistered, i3c_master_unregister_i3c_devs() sets
i3cdev->dev->desc =3D NULL before calling device_unregister(). This triggers
a uevent that calls i3c_device_uevent().

If i3cdev->desc is NULL, the devinfo stack variable is never initialized,
but its contents (like devinfo.pid and devinfo.dcr) are still used to
construct the modalias string right below this block.

Could this expose kernel stack memory via netlink messages, or via sysfs
reads in modalias_show()? A similar uninitialized read also occurs in
i3c_device_match_id() when i3c_device_get_info() is called with a NULL
descriptor.

[ ... ]
> @@ -345,15 +355,32 @@ static int i3c_device_match(struct device *dev, con=
st struct device_driver *drv)
>  {
>  	struct i3c_device *i3cdev;
>  	const struct i3c_driver *i3cdrv;
> +	u8 static_addr_method =3D 0;
> =20
>  	if (dev->type !=3D &i3c_device_type)
>  		return 0;
> =20
>  	i3cdev =3D dev_to_i3cdev(dev);
>  	i3cdrv =3D drv_to_i3cdrv(drv);
> -	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
> +
> +	if (i3cdev->desc && i3cdev->desc->boardinfo)
> +		static_addr_method =3D i3cdev->desc->boardinfo->static_addr_method;

[Severity: High]
This is a pre-existing issue, but is it safe to access i3cdev->desc here
without holding the bus read lock?

During dynamic address assignment or hot-join operations,
__i3c_master_add_i3c_dev_locked() may find a duplicate device, reassign
a new descriptor, and free the old descriptor.

Since i3c_device_match() is called by the driver core without acquiring
the bus lock, might a concurrent hot-join thread free i3cdev->desc while
it is being dereferenced here, leading to a use-after-free? This same race
could happen when i3cdev->desc->info is accessed by i3c_device_get_info()
during matching.

> +
> +	/*
> +	 * SETAASA-based devices need not always have a matching ID since
> +	 * it is not mandatory for such devices to implement deviceinfo
> +	 * CCC commands. Allow them to register through DT or ACPI.
> +	 */
> +	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
>  		return 1;
> =20
> +	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (of_driver_match_device(dev, drv))
> +			return 1;
> +		if (acpi_driver_match_device(dev, drv))
> +			return 1;
> +	}
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D6
