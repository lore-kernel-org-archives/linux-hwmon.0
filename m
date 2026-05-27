Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604D2C1595
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871322; cv=none; b=nlg+Z5oEwiBs6JA6PC6N2RHKcr35JtEFfkVgjOlfe3099vgSq8nvBTohwhl+OXhe+J48CZqs3a5isRjhr1JCXshExvaLOiCbSkEOSmXWuoobJMuyK/oiu3ytGegt38mcXHjZ1VjKcdLuCs+o2yggeagk5OeB/M212dPGPxwYB2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871322; c=relaxed/simple;
	bh=cYNUolI433zHqdF6bKNZwNhkRIm98PCjlmoQ2FHXk9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iVzKzYfoUm22gMhc9BFGvgtqrzWT/YZftpLTdVHqJpl/tCj6BkwRigEQpS1Qhy10zDBdAIp3mwK37VMeLvcTzhvSkPtdOBjNGHuQXRK3F1zvy+2aw+oQqOPfs9m4xWnmbjUzvU2WC5mv5xDmfCasNIc11QxK/qUko01SRC8iMgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRUNPl6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRUNPl6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDE11F000E9;
	Wed, 27 May 2026 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871321;
	bh=GavRcOyYtKTQmVFJyfrMpdlhdweTyU9ZWJ0kIpJ7LnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cRUNPl6EW1XbVF9pgvhycRVk8jHWZ+cYSEPhz0kxBCXCDqUhFcJDjIbHP/EN6dOeO
	 7SmwzAbJQH8qYrEGz2ZXeOEuDIQuHZqrvlXW64cwr6RSuIwHLUzwU/JJVDfkc8Tb+d
	 FKm23XnhnozR9M4SDRknt9ifjZlg2ESwRRTfz1C66Ehdy05fk4878czsw/gSN9SYsX
	 lzZGDvW7sw3JRcU8F5Oanb28+N+q6l1Ywh0k9+JQq3geh3Bjwzg8dU2XLLoJcgy9lW
	 X9lGpZmaC2YvBXHLqCiMFVzNvO+PbW4/otf6ruY8JCgt354RSn7jBIGdiaMO/q9TbZ
	 MtDwEiCdFWPIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (gpd-fan): drop global driver data and
 use per-device allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_E54E78E6CA5D212364B95FA8BC2061BD3009@qq.com>
References: <tencent_E54E78E6CA5D212364B95FA8BC2061BD3009@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 08:42:00 +0000
Message-Id: <20260527084201.5BDE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware state is modified in `remove()` while the hwmon sysfs int=
erface is still active and exposed to userspace.
--

commit 82f2cbed811b5a2cabcdd0b58df62f0677956bb4
Author: Pei Xiao <xiaopei01@kylinos.cn>

hwmon: (gpd-fan): drop global driver data and use per-device allocation

This commit replaces the global gpd_driver_priv state with a per-device
private data structure allocated during probe. This allows the driver to
support multiple instances and aligns with kernel best practices.

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 80de5f20781eb..7284babd4f5c9 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
[ ... ]
> @@ -611,7 +614,9 @@ static int gpd_fan_probe(struct platform_device *pdev)
[ ... ]
> -static void gpd_fan_remove(__always_unused struct platform_device *pdev)
> +static void gpd_fan_remove(struct platform_device *pdev)
>  {
> -	gpd_driver_priv.pwm_enable =3D AUTOMATIC;
> -	gpd_set_pwm_enable(AUTOMATIC);
> +	struct gpd_fan_data *data =3D dev_get_drvdata(&pdev->dev);
> +
> +	if (data) {
> +		data->pwm_enable =3D AUTOMATIC;
> +		gpd_set_pwm_enable(data, AUTOMATIC);

[Severity: High]
This is a pre-existing issue, but I wanted to ask about a potential
concurrency problem during device removal.

Because the driver uses devm_hwmon_device_register_with_info() during
initialization, the hwmon sysfs interface is unregistered during the devres
cleanup phase. This cleanup occurs after gpd_fan_remove() completes.

While gpd_fan_remove() runs and resets the fan to AUTOMATIC mode, the sysfs
attributes are still fully active. If a concurrent sysfs read or write arri=
ves
from userspace, can its multi-step EC I/O sequences interleave with the
teardown sequence?

Since the EC I/O relies on a shared address and data port without a global
lock, it appears this interleaving could write random values to unintended =
EC
registers, potentially causing hardware malfunctions.

Could this race be avoided by scheduling the fan reset using
devm_add_action_or_reset() prior to registering the hwmon device, rather
than performing it inside the remove() hook?

> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779868768.gi=
t.xiaopei01@kylinos.cn?part=3D1
