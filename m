Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A242C11CB
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059217; cv=none; b=QjC3lijnnuV/PCPrrYnO9u77qV/Q5Z53bO/iz9MMtvwkKqLTpo9Lo3xJ8ghtIIAZ/mYIrfX9/IrQQTKCGs1hg2Ujia/meT6nf3AF/KgSBXQwUSaLEOorhV7GdaECQbEN4VJiiiC6qIO6AmdbQQj/YUybDqr8zu79IrmCPSmJh48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059217; c=relaxed/simple;
	bh=eEBw/r2nrl88uP2q0kqV+03yIwZVkOOo8j+Qhp8HoDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C6Vl4m7VGrcYzTNAQqksD3d2+WI2ONnvinKu1+V78qIBLRQ/xtcz2z0LZUgxcpI90X2y1ZbR5XKaMPL9KPE/1jQ2N6aXZtpu0CgEZJENKZoGqmMMVCglQ2ETQr0IbRjCfnvFClfAblTkZ+SM6toJceTmLHhbBDdifla3aFclRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShjeRBWa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShjeRBWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47011F00893;
	Fri, 29 May 2026 12:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780059215;
	bh=ib7bDcF45BXmv3nt8Hkn4UnTJGGemkowQ7/whleGu7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ShjeRBWaOMEVo/CFl/AtwU87qi4jY2Jm/8WbUMFldvV305vWqEq+Y/lHlCZ+ttctq
	 VltHRWE2XblfbHqVUx7vtuzqYEv9kzojykipyzjj/KR2XYN/nZPztuV+NBBrdA38GH
	 eL3f5B3VoWWDWUCaICctJNuu9q9M/oWDXXkrJqM3LxbWMj9PQhaMp+rIcnQlG7KE/P
	 4/4WGCNZJbMTlzv0n2+wXrvWLViqPqHeHVrpGuzNkc2idL1TZhunR2if17yrv6xNnc
	 omdWLmz8xBuwQV4NOo+icrAFxegy/w3LgXBtmIId9VBsE5dZovXyEqY7HNZQAV73CJ
	 SqB/w+TfEJndw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: it87: Reject negative values in set_fan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikita Zhandarovich" <n.zhandarovich@fintech.ru>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529121141.1633588-1-n.zhandarovich@fintech.ru>
References: <20260529121141.1633588-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 12:53:35 +0000
Message-Id: <20260529125335.A47011F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Returning -EINVAL for out-of-range negative values breaks establ=
ished hwmon ABI behavior, which expects out-of-bounds inputs to be clamped.

Pre-existing issues:
- [High] The patch fails to prevent signed integer overflows in `FAN16_TO_R=
EG()` for large positive inputs, resulting in incorrectly calculated fan sp=
eed limits.
- [High] Other sysfs store functions (`set_in` and `set_temp`) lack upper b=
oundary checks, leading to signed integer overflows and logically incorrect=
 limits.
--

commit f17137aa0859283c1c9cba428192374fa60038f1
Author: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

hwmon: it87: Reject negative values in set_fan()

This patch rejects negative values inputted to set_fan() in the it87 driver
by returning -EINVAL. It aims to prevent invalid arithmetic and undefined
behavior from signed overflow in the register conversion path.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 5fd310662ee43..888db19758763 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -1412,6 +1412,9 @@ static ssize_t set_fan(struct device *dev, struct d=
evice_attribute *attr,
>  	if (kstrtol(buf, 10, &val) < 0)
>  		return -EINVAL;
> =20
> +	if (val < 0)
> +		return -EINVAL;
> +

[Severity: Medium]
Does rejecting negative values with -EINVAL break backward compatibility
with userspace tools?

The hwmon subsystem documentation dictates that out-of-range inputs for
continuous limit attributes (like fan limits) should be clamped to their
minimum or maximum boundaries.

Would it be better to clamp the input here instead of abruptly returning
-EINVAL?

>  	err =3D it87_lock(data);
>  	if (err)
>  		return err;

[Severity: High]
This is a pre-existing issue, but does FAN16_TO_REG() still suffer from
signed integer overflows for excessively large positive inputs further down
in this function?

On 32-bit systems, if val is an extremely large positive RPM (e.g.,
2,147,000,000), the calculations in FAN16_TO_REG() can overflow to negative
values. The subsequent division could yield a positive value that is then
clamped and written to the register, resulting in a very low RPM limit
instead of capping at the maximum limit.

Could we clamp val to a safe upper bound before the register conversion
to prevent these overflows?

[Severity: High]
This isn't a bug introduced by this patch, but do the sysfs store functions
set_in() and set_temp() have similar signed integer overflow issues due to
missing upper boundary checks?

In set_in(), reading a large unsigned value into a long can cause
val * 10 to overflow to a negative value on 32-bit systems. After division,
it clamps to 0 instead of the maximum limit of 255.

Similarly, in set_temp(), a large positive input causes val + 500 to overfl=
ow
to a negative value, which is then divided and clamped to -128 instead of 1=
27.

Should boundary checks or clamping be added to these functions as well to
ensure safe arithmetic and logically correct limits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529121141.1633=
588-1-n.zhandarovich@fintech.ru?part=3D1
