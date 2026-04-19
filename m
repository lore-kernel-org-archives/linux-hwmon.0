Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCAB3A1DB
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776624195; cv=none; b=WfarOZnSaEp3A2Anw7ngQESQLHGyUuHnvQOKuWY657hgZPZTmWapch8awUYQ7l5hAIzOqctT6zcq0dkutMcMTJhWhgeLJHt2I6WVvAQfPiknRbKFwHHyuSEvXZ7RwTIgwnBiF3x+KxwyVilllUnlXu/uBDmEMEVqF4f+d/xUXNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776624195; c=relaxed/simple;
	bh=n7xiktQhjMYHRjBgQI0Vn6aenLCgj2ihy85MnH74reg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BrJaA2SuExXDjFZovWjbRk/njT1BV6m0Z/eYZWZa6xRbFD7CS+YENZVGcW8Bx2B/f5H0jdNtiCtdPsBSWFayWeFBNFI6dPEGVH6Xn3602DspWJ3d9XQusOO27vlwcAKsCDtYXcMz0lSR3sKZ4RuPENm9EvUSqjPn6iY1NipR0sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmJRSOsD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmJRSOsD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD82C2BCAF;
	Sun, 19 Apr 2026 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776624195;
	bh=n7xiktQhjMYHRjBgQI0Vn6aenLCgj2ihy85MnH74reg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PmJRSOsDUCOEi8PFi3OlRQP7HMAkSrZFpAsZbPX67q8tcs65qvPU8DRcF8GRkDIYA
	 RFde+nzk0K3xe5hPurLhNLTQAC+9EbzvMsuLt+OWQGTkeNxxuDBk96ns3sszJuczhA
	 jEq+Tp39uWgv5triaABrhYcgMGy8n5N7LNW1PcMfO/Z5lvdkRJlU+wFLSAdl7GHGi7
	 wH8Ky7ps3ncTYiZzl1ccTC0SKS8APyfq32TE2m8F86ZK/V8L6VHBos7pTIQG1qHLCa
	 Zpg57QfwogfwdZQv4xSy1ORH5FgmOAj33coCPgPw/Uht17SGqXDKfOPGYtGtK3V+Z2
	 uZpswneFWDpfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 03/14] thermal/core: Make
 thermal_cooling_device_init_complete() non static
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260419182203.4083985-4-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Apr 2026 18:43:14 +0000
Message-Id: <20260419184314.DBD82C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Missing initialization for devres-managed cooling devices leading =
to resource leaks and potential use-after-free.
--

commit 45d7db5abc941e576e78d521933630ff7a08efc5
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/core: Make thermal_cooling_device_init_complete() non static
   =20
This commit splits thermal_cooling_device_init_complete() out from
__thermal_cooling_device_register() so it can be called explicitly by
specific implementations like the thermal OF code.

> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_cor=
e.c
> index 8a70768b46ddd..35cf170f3fa1c 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c

[ ... ]

> @@ -1127,8 +1127,6 @@ __thermal_cooling_device_register(struct device_nod=
e *np,
>  	if (current_state <=3D cdev->max_state)
>  		thermal_debug_cdev_add(cdev, current_state);
> =20
> -	thermal_cooling_device_init_complete(cdev);
> -
>  	return cdev;

[ ... ]

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 398157e740fc7..35d542aac7f8d 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c

[ ... ]

> @@ -531,7 +531,15 @@ thermal_of_cooling_device_register(struct device_nod=
e *np,
>  				   const char *type, void *devdata,
>  				   const struct thermal_cooling_device_ops *ops)
>  {
> -	return __thermal_cooling_device_register(np, type, devdata, ops);
> +	struct thermal_cooling_device *cdev;
> +
> +	cdev =3D __thermal_cooling_device_register(np, type, devdata, ops);
> +	if (IS_ERR(cdev))
> +		return cdev;
> +
> +	thermal_cooling_device_init_complete(cdev);
> +
> +	return cdev;
>  }
>  EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);

Does this miss updating devm_thermal_of_cooling_device_register() which also
calls __thermal_cooling_device_register() directly?

Because thermal_cooling_device_init_complete() was removed from the inner
helper, cooling devices registered via the devm variant will no longer be
added to the global thermal_cdev_list, and consequently won't bind to any
thermal zones.

Furthermore, when devres calls thermal_cooling_device_release() on driver
unload, thermal_cooling_device_unregister() aborts early because the
device is missing from thermal_cdev_list:

void thermal_cooling_device_unregister(struct thermal_cooling_device *cdev)
{
        ...
        if (!thermal_cooling_device_present(cdev))
                return;
        ...
}

This skips device_unregister(), permanently leaking the memory and IDA,
and leaving dangling sysfs entries which can trigger a use-after-free if
accessed later.

While this is fixed later in the patch series by commit "thermal/of: Move
the node pointer assignation in the OF code file", will this temporary
breakage impact bisectability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260419182203.4083=
985-1-daniel.lezcano@oss.qualcomm.com?part=3D3
