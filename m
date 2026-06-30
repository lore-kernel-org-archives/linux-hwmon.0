Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A6E2D9EE7
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853829; cv=none; b=oAPJDSNt0epnZPYgRTPMAcocO88AEsgQNaYp6N76eDVI/c7vF/ZGqc0GXR8TWvoe/WnWL9i2L9ZssdU417sF/0iOX4tebMVV+/pn0Vq7RUtM8bizsT7ASayNqxvBPVKG12zMpf1YyKUqVJ1CoL4UNgsbeCfAIl2V7wjy1NEsxZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853829; c=relaxed/simple;
	bh=MyyjJZL2BLPSQ8xZA19Zj49YHfNIu4Ar7KUtTwOcv9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oPS5AlIbP4+sWqLZvUHZFMl+22RJmJbFISmPNfBKNsD8r71AI1ur2TMx78XF8v+mVCTN0IKzYEiXqxl5yCJYbTulpl4qtebGfyFMns7DUHdEE7nSR9Xls8rqClA0ibPkRLLMH5N+AUIx2KVP9gFtOaO2Nkfe6hMaBZ4mwHUHtMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Su4ly13m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Su4ly13m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BA21F000E9;
	Tue, 30 Jun 2026 21:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782853828;
	bh=h5rEP155sJ3QTbrZBJI1K3HcCP/swDrHrsHklhwMbOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Su4ly13m7sT1c9iov0Fmp0kzcsjuZqZIgbVt7KdXmAh78JspHUd+PZEXqR5HBhu9a
	 RarlS5m3BoYe/Z8i7X5mYD+PsiDa57fU653NMx8KjdNhOzap+iAsshpgBko5nUzcUp
	 ol7hwrEkg2W8b38sO+c/hVBz0jyGWuK8I+bJi7SID4vwoyjlrXi1+3SL0RXR6rMC1S
	 GqvQTG+a5lIYQUnuD3GglH+gTXUZ0xt1YFSlM/7YQ/GE4T/PNvS7YDFmqdqulA1y7l
	 mpIG/wNTpfteDMO/RG8/eYhSvCPm6r/o+VNqmCk+MLE6zIjbsxF3Vjax+3opzgEbJf
	 4Dcp6YQFUu+NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260630-cros_ec-hwmon-overflow-v1-2-3d2ecd3eb0f2@weissschuh.net>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
 <20260630-cros_ec-hwmon-overflow-v1-2-3d2ecd3eb0f2@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 21:10:27 +0000
Message-Id: <20260630211028.69BA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Using `BUILD_BUG()` with runtime variables introduces build fragili=
ty because it relies on compiler Value Range Propagation (VRP) to eliminate=
 the branch.
--

commit a22cd7f1036247302ddc232e1cbd36ceb641e202
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (cros_ec) Handle temperature conversion overflows

The calculations converting between the different temperature units can
overflow, resulting in incorrect data. Detect these overflows and report th=
em.

> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 44291799dd8e4..4b402142b46f3 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c

[ ... ]

> @@ -150,14 +152,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
>  /* This differs slightly from the variant in units.h to avoid rounding i=
nconsistencies. */
>  #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)

[ ... ]

> -static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> +static long __flatten cros_ec_hwmon_temp_to_millicelsius(u8 temp)
>  {
> -	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SEN=
SOR_OFFSET));
> +	long ret;
> +
> +	if (check_add_overflow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
> +		BUILD_BUG();

[Severity: Low]
Does the use of BUILD_BUG() with the runtime variable temp risk spurious bu=
ild
failures?

Relying on the compiler's Value Range Propagation (VRP) to eliminate the
check_add_overflow() branch can lead to broken builds when compiling with
CONFIG_CC_OPTIMIZE_FOR_DEBUGGING (which uses -Og) or on older toolchains wh=
ere
VRP fails to eliminate the branch.

> +
> +	if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(ret, &ret))
> +		BUILD_BUG();
> +
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-cros_ec-hw=
mon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net?part=3D2
