Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B48731714C
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783480574; cv=none; b=Ar2lCMG4HkQCdN00mTBqiFWAj3rh1H+2Tg+sDNeC+D4d5NqTB+0ldrLNA3ipd5iKvmflZ7k+3uJPmIiNqPc9a3qEXJrssC54qLdgCy4lDH4qqOeSqvVECK1JJZh67AWUy3jUmTnBaC48AbtUwJjVtXWmzmMmHtZ0cNGRiqLHeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783480574; c=relaxed/simple;
	bh=lXsirI0CxFUYrq//Su6TQMT0P/Mv9vW8PXA2XKP+t48=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kZvB5uEFpX3FgVWVCxSkFA/KeVvZFbLm9PiL73XmL7btS6JAR+EOOvaQmSeIZRH3sBXuRHhBPAcqKCpw5iG06MjGgGjMT3vc7PqYtsrdWbkGBB1QgZvXbR2H+94kx3fQWayX3Bt/ikX9BWd1yBHOIgboBN/esI91CYmRyRoOWSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfNur93u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfNur93u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7E61F000E9;
	Wed,  8 Jul 2026 03:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783480572;
	bh=7T1hkrRBfVc3XhiWXcn5SGX2542Kt+wsMMshRBywbe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KfNur93u90Sg485C4+cVavQiTJ5kr520ITRStaMq2K8pcM1c/cpaO4pAuJr23H7N5
	 aYJjuX9KLDyq0YEwHK2SEUNhFvOR7Eu8Q0A1jVSKo9fw4GIKJ35BOEHm7Oy11jwO6x
	 6fROVPhv5UXvsSC3pOMhXnLvtMaDcm9Wa3fcTfad5105rNOwbe/abiivYrdw11w1zD
	 1K9vDy430Ro9ymhxiuvLb5fJLGwfJ/PZtbLXhCoHxbzP8kWdm1c27csGavz6PbuZ3R
	 /DigltaR7QLfdwELa8Vg+6KeICsqndvC1c2vuJU5+qj9jK8WsP7LX5jjYjUkVprmh1
	 eJVmnzOotjC5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (corsair-cpro) Stop device IO before
 calling hid_hw_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708030507.227193-2-linux@roeck-us.net>
References: <20260708030507.227193-1-linux@roeck-us.net>
 <20260708030507.227193-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 03:16:12 +0000
Message-Id: <20260708031612.BD7E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup of debugfs files in probe error path leads to a Us=
e-After-Free vulnerability.
--

--- Patch [1]: [PATCH v2 1/4] hwmon: (corsair-cpro) Stop device IO before c=
alling hid_hw_stop ---
commit 93ea292134a6e9bcca068675cf1869020bdac096
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (corsair-cpro) Stop device IO before calling hid_hw_stop

This commit fixes a UAF vulnerability caused by a race condition between
hid_input_report() and driver probe failure by calling hid_device_io_stop()
before hid_hw_stop().

> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index b6e508e43fa17..8354a002f4c5e 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -645,6 +645,7 @@ static int ccp_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
> =20
>  out_hw_close:
>  	hid_hw_close(hdev);
> +	hid_device_io_stop(hdev);

[Severity: High]
This is a pre-existing issue, but does this error path also need to clean up
the debugfs files?

In ccp_probe(), the debugfs files are created just before registering the
hwmon device:

	ccp_debugfs_init(ccp);

	ccp->hwmon_dev =3D hwmon_device_register_with_info(&hdev->dev, ...
	if (IS_ERR(ccp->hwmon_dev)) {
		ret =3D PTR_ERR(ccp->hwmon_dev);
		goto out_hw_close;
	}

If hwmon_device_register_with_info() fails, we jump here to out_hw_close, b=
ut
we don't remove the newly created ccp->debugfs.=20

Since devres automatically frees the ccp structure when the probe function
returns, this leaves dangling files in debugfs.

If a user-space process later reads these leaked files, won't callback
functions like firmware_show() dereference the freed ccp pointer and cause
a Use-After-Free?

>  out_hw_stop:
>  	hid_hw_stop(hdev);
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708030507.2271=
93-1-linux@roeck-us.net?part=3D1
