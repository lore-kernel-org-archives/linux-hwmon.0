Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE0D1E9B3D
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776624718; cv=none; b=T5LcTXPSsE7RtzUDU2/gxMu12/s6+f/2Afp8DJC8PXfFjwe6FeReU+uikbMDr9mMgg47KqiKwMZ6Y2q+eA2JAgl+oFMlqWKctsmcC9xxAqoZ6TUK/HwKyEFIiYHAo+p2/PwTu8XLn0ZXRskfISg7SEocYmdLoKaJeSb9as/E5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776624718; c=relaxed/simple;
	bh=j+Mk0DGKjrFAPQgJvKxLESxYfdhq35aBvt/8c6WL+Zs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CAJUO3D9oYyCuHdKmE+ZF1GqkyBdHa4EUVR3OKKE3A8a2GjnqJCOLkkgkNNPsID04+jwpWhozYmVOBPPGfzk8Rl9EIAcswlitF+ij5sJLXY41aV+xl0cPItIUR5TSUhKhuhwAxkHpJkNxESuLuJKQEqcfOmFGGJZOxoopDSmmQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3GdIOSa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3GdIOSa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AE0C2BCAF;
	Sun, 19 Apr 2026 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776624718;
	bh=j+Mk0DGKjrFAPQgJvKxLESxYfdhq35aBvt/8c6WL+Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=i3GdIOSatPaHer1pYpYka5yCxF874WnGS36lxQ2iKPXg+y3HywL4wyoXEy4//wntV
	 bNuLNYkuWbFYWigy1mgLcSWJz3xkmAcDi2UeyDW4/o4DSi5pEqneFfAbGJ5Ka70p3T
	 uDL4YixbwCF+V2CZq2bGmGCB5OlI+98veihPER3u2NhBXIT5HhiK4WKOhb+YznUiN+
	 9lLkOGJaRAYo3nvGEHaR/UP+s3UoSYw/sQcJTS2XUjZ9IAKAZ4JyTiOrTNSlbscBZZ
	 y97AKVjWwryDwhmlkCLLnalcnN35IhHIKsgKV48Sz8tmVFlHjf2lBYuODwWx6EiTwt
	 1BCSE5Lfz36eA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 13/14] thermal/of: Process cooling device index in
 cooling-spec
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260419182203.4083985-14-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-14-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Apr 2026 18:51:57 +0000
Message-Id: <20260419185158.50AE0C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Medium] Brittle logic uses an exact `args_count =3D=3D 3` check to ident=
ify the new binding format, leading to silent misparsing of bindings with m=
ore than 3 cells.
--

commit 90bb7215d764688a8fd719c59ad60bede0aee71e
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/of: Process cooling device index in cooling-spec

This commit updates thermal OF binding parsing to support a new format that
includes a cooling device index alongside mitigation limits. It checks the
argument count from the device tree specifier to differentiate between the
legacy and new formats.

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index d9bd7dc01e19a..e9b39d625b0ce 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
[ ... ]
> @@ -264,11 +264,29 @@ static bool thermal_of_get_cooling_spec(struct devi=
ce_node *map_np, int index,
>  		return false;
>  	}
> =20
> +	/*
> +	 * There are two formats:
> +	 * - Legacy format :	<&cdev lower upper>
> +	 * - New format    :	<&cdev of_index lower upper>
> +	 *
> +	 * With the new format, along with the device node pointer,
> +	 * the of_index must match with the cooling device of_index in
> +	 * order to bind
> +	 */
> +	if (cooling_spec.args_count =3D=3D 3 &&
> +	    cooling_spec.args[0] !=3D cdev->of_index)
> +		return false;

Does this code bypass the index validation for malformed bindings or future
extensions? If a device tree specifies a cell count greater than 3, this
condition evaluates to false and skips the check entirely.

> +
>  	if (cooling_spec.np !=3D cdev->np)
>  		return false;
> =20
> -	c->lower =3D cooling_spec.args[0];
> -	c->upper =3D cooling_spec.args[1];
> +	if (cooling_spec.args_count !=3D 3) {
> +		c->lower =3D cooling_spec.args[0];
> +		c->upper =3D cooling_spec.args[1];

Will this incorrectly parse the limits if the argument count is greater tha=
n 3?

Since a count greater than 3 falls into this legacy branch, it would assign
the device index from args[0] to the lower limit, instead of args[1].

Should this logic either explicitly reject counts greater than 3, or use a
greater-than-or-equal condition to identify the new format?

> +	} else {
> +		c->lower =3D cooling_spec.args[1];
> +		c->upper =3D cooling_spec.args[2];
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260419182203.4083=
985-1-daniel.lezcano@oss.qualcomm.com?part=3D13
