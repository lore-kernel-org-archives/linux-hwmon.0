Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D0A2D6E66
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776901736; cv=none; b=JjjzMdmuN2NQwcD/llGOBsGF3iwpzo/ax216+Ud5qn8iefsfi8KEqRfpwi4wdbF059UFEcl4j3z8GrPspqhuZEwn+yfhL5xNkqKvVjO/g/89eK+sqToQRvoQn5wJjnBE6xu1pDDDUSctrOb/eXf1tQxRy1zCGaC2blkhXudWWR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776901736; c=relaxed/simple;
	bh=eh44eMSufguYGpwwnWjjjak7eb6Wgyx0jUwuWzLQl8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eEQ2ym/A21GTuC6eyiyvSD+aDl3fxlQanSaGYoOLV2xmDh3aBxVCewrjOjaJzniLf2nL+UtpW14egot/OESnCBF8PkS49nfxipJ9T3zAAV6lREb00QYA/6O3adcdejMUY4dY+D5Hw+rC5QpOrpPk1ckdU5AV+sUvLtnVniZRoYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+qh6j58; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+qh6j58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323BAC19425;
	Wed, 22 Apr 2026 23:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776901736;
	bh=eh44eMSufguYGpwwnWjjjak7eb6Wgyx0jUwuWzLQl8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=t+qh6j58viXsMzp2d6RGnj+8NXNyNGa5tBRpd6Jx/r0+DWl3pfIYFWnDAV0BhDjSI
	 LbhZlZ5sw4qArEkOCFK4YXLv9py/I4/swHgXwh1jQSSlUzB1uzp+hOBu+J98ZscH70
	 IwiLFwp2dNZ2ECLP8GhVhUypB82vg9qXFwHa9bBcH326HjC/uyUDltFCsHgEYUj4cm
	 RYCp/1wISL2c2rl0xBBsow6Ne+Gvdl7Sp1qozibxfnKx2IXQujfQk61QmRAMmeaI4N
	 DUGKs7oRdNmN2FK+k0IRYfJcvNJGEc1CHWD7dPiv9rss5VSH8IstoAlzCWZPmYHVvR
	 W8keUPiOC3fxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/12] thermal/of: Introduce cooling device of_index
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-10-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-10-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 23:48:55 +0000
Message-Id: <20260422234856.323BAC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Critical] Redundant call to `thermal_cooling_device_init_complete()` in =
`devm_thermal_of_child_cooling_device_register()` causes list corruption an=
d system hangs.
--

commit 21654d6f9a89c28278edde82f1b1199e437fb996
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/of: Introduce cooling device of_index

This commit augments thermal_of_cooling_device_register() to receive a
cooling device id. It stores this id in the cooling device structure
and updates the remaining drivers to use the new signature.

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index d06487bb5e675..a9319ff81d1d3 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c

[ ... ]

> @@ -538,6 +539,7 @@ thermal_of_cooling_device_register(struct device_node=
 *np,
>  		return cdev;
> =20
>  	cdev->np =3D np;
> +	cdev->of_index =3D of_index;
>  	thermal_cooling_device_init_complete(cdev);
> =20
>  	return cdev;

[ ... ]

> @@ -582,7 +584,7 @@ devm_thermal_of_child_cooling_device_register(struct =
device *dev,
>  	if (!ptr)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	tcd =3D thermal_of_cooling_device_register(np, type, devdata, ops);
> +	tcd =3D thermal_of_cooling_device_register(np, 0, type, devdata, ops);
>  	if (IS_ERR(tcd)) {
>  		devres_free(ptr);
>  		return tcd;

Could this regression cause list corruption by calling
thermal_cooling_device_init_complete() redundantly?

It looks like thermal_of_cooling_device_register() internally invokes
thermal_cooling_device_init_complete() just above. Immediately after,
devm_thermal_of_child_cooling_device_register() calls
thermal_cooling_device_init_complete() again on the same object:

drivers/thermal/thermal_of.c:devm_thermal_of_child_cooling_device_register(=
) {
        ...
        tcd =3D thermal_of_cooling_device_register(np, 0, type, devdata, op=
s);
        if (IS_ERR(tcd)) {
                devres_free(ptr);
                return tcd;
        }

        *ptr =3D tcd;
        devres_add(dev, ptr);

        thermal_cooling_device_init_complete(tcd);
        ...
}

Does calling list_add() twice on the same node overwrite its pointers and
create a cycle where new->next =3D new, potentially causing an infinite loop
during subsequent traversals of thermal_cdev_list if debug list checking is
not enabled?

I noticed this problem is present in the code at this commit, but it is
fixed later in the series by commit 61302b0ce72b9 ("thermal/of: Pass the
of_index and add a function to register with an index") which removes the
duplicate call.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D9
