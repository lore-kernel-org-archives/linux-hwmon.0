Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2348831D72E
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 01:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778723827; cv=none; b=WMr+A/cWt5wIf8jCccSz76Jlo5CARYBRdY/GtAyagqwGR8ZyF923QJpe0kzCJv9yjS+TukLHXIM/NIH2bkT3xgwOr3lQ3jSlFxgq2lKs7HrE9x56TvRr/2u1VipqEjaydHLDs2acixkThb0vpSOBGVHTDfBA7qIKIR7Qb2NlGeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778723827; c=relaxed/simple;
	bh=D70dKEPXSb4/Y9LAdtlhTG1No7n1jnUla3hWAva02VA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ht4WTZbZ3/fCPBg6cOUzeJE2l2edNiAZAuy6Od9mFQEsgN10btaf3i8moG+zU4yEYJlzwfGO2XM53R4eTBDu4cuYH4rpByFII4mzdzGjtl9YotznIdh2e0rX/VHezcivM5iFZOLcfJDtwsTua2iMdL7CZeEZv7WqULlJAMLLnxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN2ekvJl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN2ekvJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E91C19425;
	Thu, 14 May 2026 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778723827;
	bh=D70dKEPXSb4/Y9LAdtlhTG1No7n1jnUla3hWAva02VA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aN2ekvJlvo9GAQ+NPehB8yAMtP93wPWyLHNL0GTTCiqflxiF4XVyxHKqbqIEQN8A+
	 6HAvZOaxtR2gfRBmRblzcprvlzBXqR3wixLMDxmnH4lUin2up/lO29+wW1Ofd4tfV3
	 gcXP+TCiuIpa8dfzt+LtKtqPnbeBD2Q6UvGYuWJHXdMcCXjhTwZLQjkA6nGEuhv4tZ
	 pGnFy9EopmmFsP9YkG1234KO2uPZe4Y6m3Dr3XrPq8J6VxKhKniFB4+B8SE2853iJN
	 CBKwi4v8a6/Hekwv0XkNgfFuCEIUCk+EyjcTh1/nZHNk3HR7qtdty1QeqKwK96Hhhd
	 E7ipAG9uEYIrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC
 seed with rtc_class device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
References: <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 01:57:06 +0000
Message-Id: <20260514015706.D7E91C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing Kconfig dependency on RTC_CLASS causing potential build fai=
lures.
--

commit f54ef3c53db957606d5afd59cb615359c244ece4
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class device

This commit drops the probe-time seed and adm1266_set_rtc() entirely. It ad=
ds
an rtc_class device whose read_time and set_time callbacks read and write t=
he
SET_RTC frame to expose the time stamp policy properly.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 080e7dbd0c069..05b31bb08f38c 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

> @@ -517,21 +517,73 @@ static int adm1266_config_nvmem(struct adm1266_data=
 *data)

[ ... ]

> +static int adm1266_register_rtc(struct adm1266_data *data)
> +{
> +	struct rtc_device *rtc;
> +
> +	rtc =3D devm_rtc_allocate_device(&data->client->dev);

Could this introduce a build regression if CONFIG_RTC_CLASS is disabled?

The patch unconditionally adds calls to RTC subsystem functions like
devm_rtc_allocate_device() and devm_rtc_register_device(). These functions
are implemented in the RTC core, which is governed by CONFIG_RTC_CLASS.

There are no fallback stubs in linux/rtc.h for these allocation functions
when the subsystem is disabled. Does CONFIG_SENSORS_ADM1266 need a dependen=
cy
on RTC_CLASS in drivers/hwmon/pmbus/Kconfig to prevent unresolved external
symbols during linking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-adm1266-v3=
-0-a81a479b0bb0@nexthop.ai?part=3D4
