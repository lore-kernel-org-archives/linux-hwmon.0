Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA5483819;
	Wed, 23 Sep 2026 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159099; cv=none; b=NSEblt9l2q5Xd0iCKFsHLa4TKHoxuvHDqIzt/exPLNAs9qnkVN6oSCyTmYlReFk+uxUI7td275DVLIEpBaRJK/JvKybpw0cHVKy9Q1M1bvvNvvaE/RRXHYbkDIGthtABC7dq8VwEHZYpMo9jDE7luchPAJXX5DfiD/fajav2bi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159099; c=relaxed/simple;
	bh=hzewqaTjqjDjb5gutbAPb57IWxVWZzy/HnJJbow/GQ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H3UVwNiqINJ/sFntggmEOOgjT0zpOEGdST/n8GUouq2TPguAKTjKOt1nTwoYBriAJMiujcPGhUVHcSE7rGanwbh1eFx85acCam3hL3Ps4NyXgLymxD1spZ3CDnOhqpmTRUpUoVipzXvcRLVCYFRAicXGRwkvrb+W5gWGj2Viiaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkOkgHHK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkOkgHHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14611F00898;
	Wed, 23 Sep 2026 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790159090;
	bh=2jdPYcdDsSoyO0/75JjnuQqWSX/Qg3oXmCZgMK6+M2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FkOkgHHKBt4PEkGa7LptBFfSAJ/1KKNb9aZ3i5TYk5JJFTd8c+VoB8+Md0sPs+jP4
	 w3Lft2fzRSwsGR7s8QCpUAEuvFM7zAUId4vdLp3rAg0pjIeaS+/9bIyI2y8re9ilNe
	 I7HrRS8p9SAM06FTC8WjcoUlQAkxTLS2gUy0/vHVyCbUlyqH8LJ9u3TRyPWOhF9QO3
	 iujS89JxFwaqPjjjcbQiVHmSm4ezLYx2ZewEG67V62k4bpJPJg6mZGacMldqvbPoQN
	 +FCOtSw2rSN6rGyoru9uVwT+dliaCk1oQBGo47QtJvV3XsSdGQVH/Zn/9CmxguMTyG
	 Y560wVQ+vTvgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] platform: arm64: Add a driver for the EC found
 on ASUS Glymur machines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260923-topic-asus_ec-v3-2-2bf3bb9da879@oss.qualcomm.com>
References: <20260923-topic-asus_ec-v3-0-2bf3bb9da879@oss.qualcomm.com>
 <20260923-topic-asus_ec-v3-2-2bf3bb9da879@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 10:24:49 +0000
Message-Id: <20260923102449.E14611F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] hwmon: direct registration in platform driver violates subsystem la=
yering
- [Low] kconfig: unnecessary dependency on INPUT subsystem
--

commit e53dc01a9d2f191fcc367745d68b96bde8983fd7
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

platform: arm64: Add a driver for the EC found on ASUS Glymur machines

This commit introduces a new platform driver for the EC found on ASUS Glymur
machines. It allows for fan speed reporting, keyboard backlight setting, and
receiving miscellaneous sideband events.

> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index e32e01b2a9bdd..84c475c62990b 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
[ ... ]
> @@ -33,6 +33,22 @@ config EC_ACER_ASPIRE1
>  	  laptop where this information is not properly exposed via the
>  	  standard ACPI devices.
> =20
> +config EC_ASUS_GLYMUR
> +	tristate "ASUS Zenbook A16 (Qualcomm) Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on HWMON
> +	depends on INPUT

[Severity: Low]
Is this dependency on the INPUT subsystem necessary? The driver source code
does not appear to include linux/input.h, register any input devices, or
use any input APIs, which restricts build combinations unnecessarily.

> +	depends on PM
> +	depends on THERMAL || THERMAL=3Dn
> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	help
> +	  Say M or Y here to enable the EC driver for the Qualcomm Snapdragon-
> +	  based ASUS Zenbook A16 (UX3607OA) and similar machines. It provides
> +	  temperature sensors readout, fan monitoring, keyboard and EC event
> +	  reporting.
> +
>  config EC_HUAWEI_GAOKUN
>  	tristate "Huawei Matebook E Go Embedded Controller driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/asus-glymur-ec.c b/drivers/platform/a=
rm64/asus-glymur-ec.c
> new file mode 100644
> index 0000000000000..3e7706e3bdaac
> --- /dev/null
> +++ b/drivers/platform/arm64/asus-glymur-ec.c
[ ... ]
> @@ -0,0 +1,600 @@
[ ... ]
> +static int asus_glymur_ec_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ec->hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
> +							     "asus_glymur_ec",
> +							     ec,
> +							     &asus_ec_hwmon_chip_info,
> +							     NULL);

[Severity: Low]
Does registering the hwmon device directly from this platform driver bypass=
 the
hwmon subsystem architecture rules?

According to the hwmon subsystem guidelines, if a multifunction device supp=
orts
hardware monitoring as a secondary functionality, its hardware monitoring
features should be implemented as an auxiliary driver located in
drivers/hwmon/.

> +	if (IS_ERR(ec->hwmon_dev)) {
> +		return dev_err_probe(dev, PTR_ERR(ec->hwmon_dev),
> +				     "Failed to register hwmon\n");
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-topic-asus=
_ec-v3-0-2bf3bb9da879@oss.qualcomm.com?part=3D2
