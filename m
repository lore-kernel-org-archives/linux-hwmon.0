Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E982EEE7E
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 01:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780883589; cv=none; b=tLAS48zX81xWjDeZcs8b+tR3vpcdzA1n5G3zVf6RdRxfLbNmiv/BHRfN6WJW4osmECr/IPJEmJiPEtoAGThoPS/YNrG6G7ohYjJsqAzuwbC6R/9i450yu4ypau0VwAi981pEHawEGu3pz3iXL/R2Ef273Lkai5hFLkswO5oNR+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780883589; c=relaxed/simple;
	bh=B9jTDZ5BOm+3VxUGWVDPflIInqzaevdnx2VFzAsrxBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oYh/AQ5oZocXSWBFFTHe5sFsuj8MN0x76v/RvmMvscnXzzLjmtaQBqQuPlq3HIaW7Ozj8/AgbII5QBi9FR/S8L6gbnK/Bt6ybahUuNwlvxJovd+ImSKHcgfLuoRMRteRzlb6uFROYIn1GDZsNetK3FhLtXiGe5ikXLMQ4VApzbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9+HGWyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9+HGWyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166CF1F00893;
	Mon,  8 Jun 2026 01:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780883588;
	bh=/LqS2u4jyl20ckwWdskMw+YrAd/oyP1TnNN4b5DKgwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C9+HGWyhfII5/bBB8sT5GVP7/QQovFtcv+5hIBzw4l/GQjBJEAzbqFlBqiG9flBwe
	 qQ/1TP2MfIO16O7pZPR7EHE4TnCFPJklaAPSa7vfhlvMTIdXbiPN4qimFKsDIcrpHX
	 1efI9hV+Mt23ze+zfUJ8Ne//V6GwZ05rL7x6mLSA7di7g73N4GGzGJKEaiNTcuwUeX
	 7JIVBSP+Egm9nPa4OJ3DZNr85QgjzEgXutduMoPcDJHG7wp1F10nYTFE0lUJydIBQj
	 tqJsooGqEN8mS0WzDICNhayzz+rizJYKyBwKduFTShWZSSmcNfmoICAB4mXfISKe9K
	 4GQ0y5w6FgUzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] hwmon: (gpd-fan): Initialize EC before
 registering hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_BEAA4E485EAFA713FF395F57AC083EEE3507@qq.com>
References: <tencent_BEAA4E485EAFA713FF395F57AC083EEE3507@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 01:53:07 +0000
Message-Id: <20260608015308.166CF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Reading a PWM value of 0 from the EC results in an integer underfl=
ow, causing sysfs reads to return a spurious error code.
- [High] The driver statically and exclusively requests standard Super I/O =
ports, preventing dynamic resource sharing and risking I/O collisions.
--

commit 56dbaa61ebc060459a8d3ef1f7c952d1f935af40
Author: Pei Xiao <xiaopei01@kylinos.cn>
Subject: hwmon: (gpd-fan): Initialize EC before registering hwmon device

This patch moves the EC initialization before the hardware monitoring
device registration. This prevents a race condition where sysfs reads
could return invalid values before the EC is properly initialized.

> Some buggy firmware won't initialize EC properly on boot. Before its
> initialization, reading RPM will always return 0, and writing PWM will ha=
ve
> no effect. So move gpd_init_ec to before hwmon device register.

[Severity: High]
This is a pre-existing issue, but does the driver handle a valid PWM read
of 0 correctly?

Looking at gpd_wm2_read_pwm(), the raw PWM value 'var' is an unsigned 8-bit
integer. If the EC returns 0 (e.g., when the fan is stopped), the expression
'(var - 1)' mathematically underflows and promotes to a signed integer (-1).
Multiplying by 255 and passing it to DIV_ROUND_CLOSEST yields a negative va=
lue:

gpd_wm2_read_pwm() {
    ...
    return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
}

This negative return value propagates up to gpd_fan_hwmon_read(), which
interprets it as an error code (-1 mapping to -EPERM), causing the sysfs re=
ad
for pwm1 to fail. Can this be updated to safely handle a PWM value of 0?

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 7284babd4f5c9..745b3fb9e3a49 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
> =20
>  	dev_set_drvdata(dev, data);
> =20
> +	gpd_init_ec(data);
>  	hwdev =3D devm_hwmon_device_register_with_info(dev,
>  						     DRIVER_NAME,

[Severity: High]
This isn't a bug introduced by this patch, but does this probe function
exclusively claim globally shared Super I/O ports?

Looking earlier in gpd_fan_probe(), the driver statically requests standard
Super I/O address and data ports exclusively for the lifetime of the module:

gpd_fan_probe() {
    ...
    region =3D devm_request_region(dev, res->start,
                                 resource_size(res), DRIVER_NAME);
    ...
}

Because Super I/O ports are globally shared, permanently claiming them prev=
ents
other drivers (like watchdogs or RTCs) from probing. Should this use
request_muxed_region() to dynamically lock the ports around each I/O sequen=
ce
instead?

>  						     data,
> @@ -651,9 +652,6 @@ static int gpd_fan_probe(struct platform_device *pdev)
>  	if (IS_ERR(hwdev))
>  		return dev_err_probe(dev, PTR_ERR(hwdev),
>  				     "Failed to register hwmon device\n");
> -
> -	gpd_init_ec(data);
> -
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780880972.gi=
t.xiaopei01@kylinos.cn?part=3D2
