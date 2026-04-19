Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C87C3A1DB
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776624447; cv=none; b=Dg9mMUg/Sj1iARqtFmNEyMSC51tp9v5SRhUKZb7dk1hgW4gkEPnATbmofNI+kn5qLmCv9gH+kZs0qSzRgx9c/NssFYiAR/PcIkF7jbb43ErpSINFe5RqLH7IifqUbSJhngbv6yL5RM1O1KmL/TnuP1WzRKuNZfyeMG7G4q87gEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776624447; c=relaxed/simple;
	bh=TKz9A0tAKqAtRZRs1EVY6ssM6cWWKKjCpzS4cs79wfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eDI1PiD/0jDwukgMDtnq1jDn3a/6YXuXG+g9znMXnokLtR7Mbgz5+utyw4VKdlhXjBZNf/I0VAkRMqrxxwRjqIrJK5shhrgbvN6tiYzjUrd9eZ1jONJhd8EiqOH+goYCxQXIO7NKP8r1jPeQr3Edvm8/tubfB6h8JhTBhvQ5/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSOEZQD2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSOEZQD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8ABC2BCAF;
	Sun, 19 Apr 2026 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776624446;
	bh=TKz9A0tAKqAtRZRs1EVY6ssM6cWWKKjCpzS4cs79wfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lSOEZQD23LXANvN8BPnpexzDi+s7/PEolbFI8mv8MngDqU7h8GS3/gDSgyCv7EWCM
	 PqO1DYANLR5sgvdf4bodHABQ1jq8BRV06l+d3uRncBmxORwhaKCQ1/9FxyFljHtYAF
	 hEXCOLSuMBp4LQ9gdZQipbKaDl0o/n0YF8C96xUb0Ea5p6gk0mfRABW9pbvdqSsaix
	 DRnGaTKFu/GWB1vhhC62xxP0mzxFvTpcu0khvZ+7gzdPiSbjAij99UaJy3+jncLb7T
	 oVQfIsyDHqjL3vXIW1Za7i3M3hPDFudLbd4QNhpHVDmmKuspCxX3V1X9rbvPY8CvIH
	 66e6XeNxQtkUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 01/14] thermal/of: Move OF code where it belongs to
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260419182203.4083985-2-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Apr 2026 18:47:25 +0000
Message-Id: <20260419184726.6A8ABC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Low] Moving `[devm_]thermal_of_cooling_device_register()` to `thermal_of=
.c` causes undefined reference build errors on non-OF platforms.
--

commit 10b09a7422c3dc398ce39daac38970f758efdaee
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/of: Move OF code where it belongs to

This commit moves the OF-specific cooling device registration functions
from the thermal core to the thermal-of implementation.

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 99085c806a1f6..398157e740fc7 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
[ ... ]
> +struct thermal_cooling_device *
> +devm_thermal_of_cooling_device_register(struct device *dev,
> +					struct device_node *np,
> +					const char *type, void *devdata,
> +					const struct thermal_cooling_device_ops *ops)
> +{
> +	struct thermal_cooling_device **ptr, *tcd;

Will moving these functions to thermal_of.c cause undefined reference
linker errors on non-OF platforms?

Several non-OF drivers, such as dell-smm-hwmon on x86, use these variants
unconditionally by passing a NULL pointer for the device tree node. Since
thermal_of.c is only compiled when CONFIG_THERMAL_OF is enabled, and the
headers do not provide dummy stubs for the disabled case, this move appears
to break the build for those platforms.

I see this is addressed later in the patch series by commits 18601ab408a18,
c24a43d962cbf, and 06c743d31c831. Could the dummy stubs or non-OF variants
be introduced before or during this move to prevent bisectability issues?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260419182203.4083=
985-1-daniel.lezcano@oss.qualcomm.com?part=3D1
