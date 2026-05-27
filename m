Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69DD3E6DFF
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873716; cv=none; b=kDMqFp2ffIx3Hf35Tml1XflHo914LZpN7LnkcB5cCuQSgDWTkDJzY7AMh6TLzHCN0uky/nQjWJEk7neOxWcTho9BC60TyFMFBKMRjAVGlsBciXUEc4MB2Xx5WMWVy2zbLZSEsCL8KcN/RHspVslwkpA3ztEZgWUKWywMPW22kF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873716; c=relaxed/simple;
	bh=DsJvjQufZSdtw5ODyHcDEWxdyy2KvDC96xlSbIT1sLU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iECf/fqQETIIQeyGTPF+u+LvD7HoJECWhp9GAS36ePu0OrldRqkD/XSqvozIrZcNvHUqOM8/iBkehmkdEHwlBFlwtgS1eExFhvDTtZo2VAO2rcf3JU6v4+TsHUXw3rpOdRQJ+OjEC/wt7imAIrWIbSlugnaKbeCCh++mxgL8vb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aH3VnXYA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aH3VnXYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E4E1F000E9;
	Wed, 27 May 2026 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873710;
	bh=pnr+8k45h6lkxwJiOhKLltZZbmf9wXKynRlAwfG+xHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aH3VnXYATaKTNNrlF6WsDDHdfpjBeZ5I3eAuZPVNvEA4XbYZttgD5f19QyGrWeF0Q
	 O+VZjIwrpZ7B823jGJqU/LI/IBeN2I5t3RcCytIPaSEWtqUtmFNB/obbjcwDyqAd60
	 FTUFMsizEWgyPENqaV01OBAoExRxh1IqxRqkhXEnqKzvvPDfJbljG+q8fG0UBqhI3+
	 OHTm55T6uoPD1DwlxHaUbDQggbPUPm8ukhc5055ng4riDVj7y1l6Y0cEdrIHNY+0AF
	 ABv6tRCnfskjhXN2+z5LYMp5IuLRw2+dOv17WvxQdKC2osuBivEbJ/eGw4jOuwHXd2
	 lT7B4VEVJfA+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (gpd-fan): upgrade log level from warn to
 err for platform device creation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_F6CCA9B9DA441472AB5119417E7B619DB40A@qq.com>
References: <tencent_F6CCA9B9DA441472AB5119417E7B619DB40A@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 09:21:50 +0000
Message-Id: <20260527092150.A6E4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch uses the undefined macro `pr_error` instead of `pr_err`, =
causing a build failure.
--

commit 4776670181b0643c558cd6ab2f655d2119fe4982
Author: Pei Xiao <xiaopei01@kylinos.cn>

hwmon: (gpd-fan): upgrade log level from warn to err for platform device cr=
eation failure

This commit upgrades the log message level from a warning to a fatal error
when platform_create_bundle() fails during initialization.

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 745b3fb9e3a49..b18725f4d1080 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -712,7 +712,7 @@ static int __init gpd_fan_init(void)
>  							 match, sizeof(*match));
> =20
>  	if (IS_ERR(gpd_fan_platform_device)) {
> -		pr_warn("Failed to create platform device\n");
> +		pr_error("Failed to create platform device\n");

[Severity: Low]
Does this code cause a compilation failure? The standard macro for
error-level printk messages in the Linux kernel is pr_err(), and it looks
like pr_error() is undefined.

>  		return PTR_ERR(gpd_fan_platform_device);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779868768.gi=
t.xiaopei01@kylinos.cn?part=3D3
