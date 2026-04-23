Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E03019C556
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776986863; cv=none; b=YRq5zOnYW+TAHy5LYARSby6POd9vzraZccmcyD3sj4EdfT9wpYU04YzvxlfWDVuDITMvEXkb4HPF/uT9Flhx94TDLsbL77vbG47/U58Ev8rPoRoAJQbuTOGgeP4BtjSpjq0mU9Yb/5eCZlpofMMCy3pGCYGRPLhFt2roeCBFNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776986863; c=relaxed/simple;
	bh=KTORXB9roeNo4xhW41F3F/6vZoxEHbheWk5j/Ccge+k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IJDh6Hm6nHexhV84K6ViWO0hDTub2O9dVAZv6CRBQoKB7JJ8EXCwkqN4QDBUfCEeEztNYuhe1eUNYeEVkytl0z+QmYS1ydDZ8qzRDAANRKkoNq6ba+R37dTXImmZcaD9pbcnLTPVJKJFFxitZ31AcY5q/o/oEDmsfsQgHgd/Fd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6pB1ALq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6pB1ALq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA3AC2BCAF;
	Thu, 23 Apr 2026 23:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776986863;
	bh=KTORXB9roeNo4xhW41F3F/6vZoxEHbheWk5j/Ccge+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=G6pB1ALqdhn0pm8nu4OScF7jVHgUZ+hBLDrqxy7l0xn58gcWpTLY3HCfna8GjUKDz
	 Q+AcvBSiYWOAlEnOF2DABdRuyVDd4+sZR5VIESPTdZkQ0lG7WLJvGophKiw6Tl4667
	 hgIXDraMrl+zbawrBmGWlgcNe6tG562XVQRIi998Fp8YU0L7OQS6nVF1uKxyFK6skr
	 2UY8wMQ1yslWlzb3TTmKnkpQtJLQ0UE3C62p2uIpKHRiF8ccuhpmobtgGrREh2Mcuj
	 xFK7wHrmaO5SW+ujbfohfEXpOVEUTkF4GNQGSIMVGrOYeFQL8LJaBx5py+mYsTPLC4
	 QWzVnPvIuo1pQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/13] i3c: master: match I3C device through DT and
 ACPI
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-8-akhilrajeev@nvidia.com>
References: <20260423085718.70762-8-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 23:27:42 +0000
Message-Id: <20260423232742.DDA3AC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 4 potential issue(s):
- [High] I3C devices matched via DT or ACPI will not automatically load the=
ir corresponding kernel modules because the I3C subsystem's `uevent` handle=
r fails to generate OF or ACPI modaliases.
- [High] Lockless access to `i3cdev->desc` in `i3c_device_match()` introduc=
es a TOCTOU race and a Use-After-Free / NULL Pointer Dereference.
- [High] Uninitialized memory read in `i3c_device_match_id()` when `i3cdev-=
>desc` is NULL.
- [Medium] Architectural restriction of firmware matching to SETAASA device=
s.
--

commit b086c2a6b40084b4476548d93f6440348d3a2ee5
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: match I3C device through DT and ACPI

This patch allows SETAASA-based I3C devices to be matched through Device
Tree or ACPI, as they might not implement deviceinfo CCC commands and lack
standard ID matching.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index fbe8710c4c56f8..0be83bfdb563f5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -343,15 +344,32 @@ static int i3c_device_match(struct device *dev, con=
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

Is it safe to access i3cdev->desc and boardinfo here without holding the I3C
bus lock?

During a Dynamic Address Assignment or Hot-Join event,
i3c_master_add_i3c_dev_locked() can replace the descriptor and free the old
one. Because this match function runs without locks, it might see a non-NULL
descriptor, get preempted while the descriptor is freed, and then dereferen=
ce
freed memory.

Additionally, the compiler might fetch i3cdev->desc twice here, which could
result in a NULL pointer dereference if it gets set to NULL concurrently
during device unregistration.

> +
> +	/*
> +	 * SETAASA based device need not always have a matching ID since
> +	 * it is not mandatory for such devices to implement deviceinfo
> +	 * CCC commands. Allow them to register through DT or ACPI.
> +	 */
> +	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))

If i3cdev->desc is NULL, does i3c_device_match_id() operate on uninitialized
memory?

The check above indicates i3cdev->desc can be NULL, but i3c_device_get_info=
()
will return early without initializing the devinfo structure when the
descriptor is missing, leaving i3c_device_match_id() to extract PID
components from uninitialized stack memory.

>  		return 1;
> =20
> +	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (of_driver_match_device(dev, drv))
> +			return 1;
> +		if (acpi_driver_match_device(dev, drv))
> +			return 1;
> +	}

Is there a reason to restrict DT and ACPI matching to only SETAASA devices?

Generic firmware matching is generally available to any device with a valid
firmware node. Since of_driver_match_device() and acpi_driver_match_device()
safely return 0 if no firmware match exists, gating this behind a specific
address assignment type might unnecessarily restrict firmware-based matching
for standard I3C devices.

Also, does i3c_device_uevent() need an update to generate OF and ACPI
modaliases?

If drivers omit an id_table and rely solely on DT or ACPI matching, they
might not be automatically loaded by userspace during device discovery, sin=
ce
the uevent handler only emits standard I3C modaliases.

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D7
