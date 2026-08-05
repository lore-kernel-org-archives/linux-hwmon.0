Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E439B49D
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895920; cv=none; b=QSvag+1TNU7iQ5zdUgk0MvMHunqyANu5XH7XVVVNRUvheqQy8jNulBSapyDbbXGINnpw20GEOyik8zQBmcnDgZJdc+NYdhW1bYNy3Z4dnT6yZQsrll23u4n4CsV0BoPCbRim4kBPzfrq+1DpIZIzNk5ndyBsdL2RkZ2xgQDNI+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895920; c=relaxed/simple;
	bh=CB9LIOYKHhyae84sDg7NKQcXZGMnW2qVYY/y82v1H9Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BaBRfhOs19FJeC+HcXHgxk8RPXNY6quCGN736VUpOza8WJkC/Wr2FZeR5VBPc5J6mhlaIqefZWLVMKSCvmhkgBB/uCCBoGBf10TfSLJalGdeVf0MAgOXHBTswuprG6kT7LMxSjrsCiby0Y/VbYJbBfHb0RkaBiIPk0kX96qvRw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/oSPgmv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/oSPgmv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FC71F000E9;
	Wed,  5 Aug 2026 02:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785895918;
	bh=U4UL4jd3KUcGmNLA6mig0AY5KB6fpztFbWcsf2sVS2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e/oSPgmvQrObeufSoXFIMp/VM+e0i64IOuAk6nCw/JfE1cRnwmqPFVZVYn0Dt1Lqo
	 u9s3OmCEk93f96AJEZ1t1V3omRULirEi/EQ40GVb+iKxvgmB8/aRxuMJxmspxKgQTG
	 PT+BqSuS5WQyXP89rLdBAZ2UtjINj+Yu+uv5DipfeEISSZffADuriy7cZTmtdxqpDZ
	 P5mn8ndG7OlzioLEY1tBBwTvu/O2BKEUbvBzkQEGwyQwsLdOyoAes5SMSALYsFyBDU
	 5skWhJRwZuLw7UkFHcpiipXUJa6yGOMsy6DxDgfyP5MJs0qM32VxehK1WbaoKjQ1Iw
	 JV7ovqaporz+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (ads7828) Properly handle -EPROBE_DEFER from
 devm_regulator_get_optional()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qingshuang Fu" <fffsqian@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805020506.958722-1-fffsqian@163.com>
References: <20260805020506.958722-1-fffsqian@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 02:11:58 +0000
Message-Id: <20260805021158.79FC71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver masks genuine errors from `devm_regulator_get_optional(=
)` by explicitly only checking for `-EPROBE_DEFER`.
- [High] The driver fetches an optional external VREF regulator but never c=
alls `regulator_enable()` to turn it on.
--

--- Patch [1]: [PATCH] hwmon: (ads7828) Properly handle -EPROBE_DEFER from =
devm_regulator_get_optional() ---
commit 78230277b5f05df9416cedbd8b4b4816183523e1
Author: Qingshuang Fu <fuqingshuang@kylinos.cn>

hwmon: (ads7828) Properly handle -EPROBE_DEFER from devm_regulator_get_opti=
onal()

This commit explicitly checks for -EPROBE_DEFER when calling
devm_regulator_get_optional() in ads7828_probe(). It ensures the error is
propagated to trigger probe deferral, rather than incorrectly falling back
to the internal VREF.

> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
> index 149cfcec78dcc..1c4a04cb023c0 100644
> --- a/drivers/hwmon/ads7828.c
> +++ b/drivers/hwmon/ads7828.c
> @@ -133,6 +133,8 @@ static int ads7828_probe(struct i2c_client *client)
>  			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
>  				return -EINVAL;
>  			ext_vref =3D true;

[Severity: High]
This is a pre-existing issue, but does this code need to enable the external
regulator?

After retrieving the optional regulator, the driver queries its voltage but
never calls regulator_enable() to turn it on. If the external regulator is
not configured as 'always-on' in the device tree, the VREF pin will remain
unpowered, causing the ADC to return zero or floating conversion results.

> +		} else if (PTR_ERR(reg) =3D=3D -EPROBE_DEFER) {
> +			return PTR_ERR(reg);

[Severity: High]
This isn't a bug introduced by this patch, but does this error handling mask
genuine failures from the regulator core?

By only propagating -EPROBE_DEFER, legitimate errors from
devm_regulator_get_optional() like -ENOMEM or -EINVAL are treated as if no
regulator exists (-ENODEV). This causes the driver to incorrectly fall back
to the internal VREF.

If the pin is physically connected to an external regulator, driving it
internally could create a voltage conflict and lead to hardware damage.
Should we check for -ENODEV to decide whether to fall back, and propagate
all other errors?

>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805020506.9587=
22-1-fffsqian@163.com?part=3D1
