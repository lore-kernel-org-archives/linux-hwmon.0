Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0CD2D8DDF
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776894592; cv=none; b=peIuAzXhdID3MAgaGN4Kj2avM1VD0vCbcg/HDjsjjio35MSTxj4jgu28qfmi0GRJHg0ifWZlpV4akyAotDpeMGxZJ8GGBv/8PuqPJEsq1i4wu7ySOdWTqGfPUbcb7iqjX43Zyxq7njZOThBTyde07EYSLzplmCTQYIY9aAQsSsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776894592; c=relaxed/simple;
	bh=m2heAE7Kzlc5BnBry5vsKjZ4ZvaPz5SGFCoKLzCQwH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MGXg6K88HcAl8aEs5M4bmk0LZ/Zk5vvX7+ZumydTBgPuReKVXVdMjbciX7K9bIHPtRsHADbcoV5M4VvMuJx2pqBnhRPMGfl3UKicU7naYoSKszTSyL30GGwkFPN+bUu/6ltAZm34xuWmyp1kCZnjtp7uym30C5Gir0cYK2Oh8o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJgGw5Mf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJgGw5Mf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EB7C19425;
	Wed, 22 Apr 2026 21:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776894591;
	bh=m2heAE7Kzlc5BnBry5vsKjZ4ZvaPz5SGFCoKLzCQwH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dJgGw5MfYHZ8buBmwUA5Ccv1Y2zGSGz/1j7hfULE2yguv+qbYfttqRajtk4m8Hd7L
	 0ljggSViy5jI3qYuoblO2nNC8cERCR0I+ZdLrwko4jUFpIG57y63bMn3BuO1w5LdBb
	 S6IO8WDI/yEO1fK3qRCO5qg6T2H6G24CJ5a3dVIGiQcNg+1I9r6qcdef6hrByl0bz/
	 Rh9Cha6ltACazTcm9pu7utpQHyJht+OQguNdMb1j3WC2Y4OhP0MCV9MTUvtzn2ZuSM
	 hIY/WheOInhHS/THNPw6nnw7L5yADQnF9+/bzqLu5q3T/sYWtWn2C+8k+kb9ItFx7T
	 /snclQyDa9HCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/12] thermal/of: Move OF code where it belongs to
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-3-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 21:49:51 +0000
Message-Id: <20260422214951.92EB7C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] A syntax error is introduced in `include/linux/thermal.h` when `CO=
NFIG_THERMAL` is disabled, breaking compilation. Note: I found the fix late=
r in the series in commit fb0063667bcf5 ("thermal/core: Remove node pointer=
 parameter when registering a tz").
- [High] The patch intentionally breaks cooling device registration for non=
-OF drivers on systems without `CONFIG_THERMAL_OF` enabled, causing runtime=
 regressions. Note: I found the fix later in the series in commit b79ce9cd7=
a188 ("hwmon:: Use non-OF thermal cooling device register function").
--

commit 7dfab179cb2bd36aaace42ff2d1aeceaaeb233da
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/of: Move OF code where it belongs to

This commit moves thermal_of_cooling_device_register and
devm_thermal_of_cooling_device_register from thermal-core to thermal-of.
It adds temporary stubs returning errors for non-OF drivers when
CONFIG_THERMAL_OF is disabled.

> As the thermal-of file depends on CONFIG_THERMAL_OF=3Dy, by moving these
> two functions in it, when non-OF drivers are using this API that
> results in a link issue. In order to prevent unnecessary
> circumvolutions with the changes, the stubs have been added in the
> header file resulting in having the non-OF drivers compiled without
> the CONFIG_THERMAL_OF=3Dy using these stubs and failing to register
> their cooling devices.
>=20
> This is temporary as the next changes introduces the functions for
> non-OF drivers and returning to the initial state.

Is it acceptable to temporarily break cooling device registration for
non-OF drivers when CONFIG_THERMAL_OF is disabled?

Since the stubs return ERR_PTR(-ENODEV), it looks like non-OF drivers will
fail to register their cooling devices during this window.

I noticed this is fixed later in the series in commit b79ce9cd7a188, but
does introducing an intentional functional regression here break git bisect?

> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h

[ ... ]

> @@ -305,18 +323,7 @@ thermal_cooling_device_register(const char *type, vo=
id *devdata,
>  	const struct thermal_cooling_device_ops *ops)
>  { return ERR_PTR(-ENODEV); }
>  static inline struct thermal_cooling_device *
> -thermal_of_cooling_device_register(struct device_node *np,
> -	const char *type, void *devdata,
> -	const struct thermal_cooling_device_ops *ops)
> -{ return ERR_PTR(-ENODEV); }
> -static inline struct thermal_cooling_device *
> -devm_thermal_of_cooling_device_register(struct device *dev,
> -				struct device_node *np,
> -				const char *type, void *devdata,
> -				const struct thermal_cooling_device_ops *ops)
> -{
> -	return ERR_PTR(-ENODEV);
> -}
> +
>  static inline void thermal_cooling_device_unregister(
>  	struct thermal_cooling_device *cdev)
>  { }

Does this leave a dangling return type that causes a compiler syntax error
when CONFIG_THERMAL is disabled?

I see this was also fixed later in the series by commit fb0063667bcf5, but
does leaving this invalid C syntax here hurt bisectability for builds
without CONFIG_THERMAL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D2
