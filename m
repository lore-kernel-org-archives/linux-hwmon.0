Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F253B8920
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137706; cv=none; b=t4DFw4+8fFum7wzt9PEk8YGHqU5Xf31sv+Gv5ZbycSEPUKbFz5ubcR1mKJLMZKWc9bL+FDHAL0+U2RzV+i5pn0FQzXSRYYiqnG9btJ4txSjau7uPU7TK42ASsZ4CXGNwNwh+Hw/RLmilRATeSBhQk6YA75Wxa9Mn4i9cjTqSuuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137706; c=relaxed/simple;
	bh=k54LJF9z1YDJT7G3VKZiGH3mIM0l4n+mQMnpeBx/k70=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=elgYEdj8rGdVfV7HgxC3yfK4/UzLTtsD+N9FmqhOcLszcqHn22KRbZZFlzXyDll6kGuQJU007OStQZ0VhW1cd9HvB9EFi+IAoPawAJ0sfSLvyQ2ZEYWddPWcIJiE/rvLve4VE90MhdZRlagzro9KT0EVbA++7gJ0w6ugwoUKah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWET4w3U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWET4w3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8D91F00A3D;
	Mon, 22 Jun 2026 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137705;
	bh=MYw8A/9T7ynX4ukuh6ahMI0eEWd9jN7PHNo74nZSAQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IWET4w3UjGPSu8S2ZQw+z6jSnfladAskGQglAevSHR1WN12DcX5Z0jkz0k9BVmSDD
	 6UMfoWg95YA5zvj3/YpXXEWdep6OM64ryAVpDxUfvRQ+lgUcC46dksDv7gIPjl1fc3
	 daTIz9iQfpiibMyEmQfID5IdPLgLQaMIPVGX5HpkXk48WZBVlD8Hl6aODES+Xs1tEj
	 mM7Q340u9evzIeEzZcunYy4bzOQUNZM8APd4RTRTJK6WpG0ubnur4UMTpYLJwXDsT3
	 rt4SktjVXm+y6vqVdgwjIYXHlX7HMF6H1aK9hO2lNZLNlldPFZR1bGk2DfCknumYKg
	 WZx5X4LvMGObA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] misc: amd-sbi: Add SBTSI ioctl register transfer
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-7-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-7-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:15:04 +0000
Message-Id: <20260622141504.EF8D91F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] TOCTOU race in IOCTL during device unbind leads to use-after-free =
of I2C/I3C device.
- [High] Using `devm_add_action()` instead of `devm_add_action_or_reset()` =
fails to unregister the misc device on error, causing a use-after-free.
--

commit 68509c62bd1860c432a2e05da7ef0faad793172b
Author: Prathima <Prathima.Lk@amd.com>

misc: amd-sbi: Add SBTSI ioctl register transfer interface

Implement ioctl interface for SB-TSI driver to enable userspace access
to TSI register read/write operations through the AMD Advanced Platform
Management Link (APML) protocol. Serialize access with a mutex shared
between the hwmon and ioctl paths.

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> index 9278d06d8e5f6..688b9221868fe 100644
> --- a/drivers/misc/amd-sbi/tsi-core.c
> +++ b/drivers/misc/amd-sbi/tsi-core.c
[ ... ]
> @@ -80,7 +95,108 @@ int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *v=
al, bool is_read)
[ ... ]
> +static int apml_tsi_reg_xfer(struct sbtsi_data *data,
> +			     struct apml_tsi_xfer_msg __user *arg)
> +{
> +	struct apml_tsi_xfer_msg msg =3D { 0 };
> +	int ret;
> +
> +	if (data->detached)
> +		return -ENODEV;
> +
> +	if (copy_from_user(&msg, arg, sizeof(struct apml_tsi_xfer_msg)))
> +		return -EFAULT;

[Severity: High]
Is there a time-of-check to time-of-use race here if the device is unbound
during this ioctl?

Since copy_from_user() can sleep, if the device is removed or unbound while
the thread is sleeping, devres cleanup will execute sbtsi_misc_unregister().

This sets data->detached =3D true locklessly and the subsystem frees
the data->client or data->i3cdev pointer.

Since sbtsi_data is kept alive by the kref, the ioctl thread can wake up, c=
all
sbtsi_xfer_ioctl(), acquire data->lock, and call sbtsi_xfer().

Could this cause a use-after-free since sbtsi_xfer_ioctl() doesn't
re-check data->detached under the lock before accessing the freed client?

> +
> +	if (msg.pad)
> +		return -EINVAL;
> +
> +	ret =3D sbtsi_xfer_ioctl(data, msg.reg_addr, &msg.data_in_out, msg.rfla=
g);
> +
> +	if (msg.rflag && !ret) {
> +		if (copy_to_user(arg, &msg, sizeof(struct apml_tsi_xfer_msg)))
> +			return -EFAULT;
> +	}
> +	return ret;
> +}
[ ... ]
> diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
> index 8fb17ccab73de..6649cd8cdf850 100644
> --- a/drivers/misc/amd-sbi/tsi.c
> +++ b/drivers/misc/amd-sbi/tsi.c
[ ... ]
> @@ -89,6 +104,13 @@ static int sbtsi_probe_common(struct device *dev, str=
uct sbtsi_data *data)
[ ... ]
>  	dev_set_drvdata(dev, data);
> -	return sbtsi_create_hwmon_adev(dev, data->dev_addr);
> +	err =3D sbtsi_create_hwmon_adev(dev, data->dev_addr);
> +	if (err < 0)
> +		return err;
> +
> +	err =3D create_misc_tsi_device(data, dev);
> +	if (err)
> +		return err;
> +
> +	return devm_add_action(dev, sbtsi_misc_unregister, data);

[Severity: High]
If devm_add_action() fails here, will it leave the misc device registered?

Unlike devm_add_action_or_reset(), devm_add_action() returns an error on
failure without executing the provided callback.

If this fails (e.g. due to memory allocation failure), the probe aborts and
devres cleanup frees struct sbtsi_data.

Because sbtsi_misc_unregister() is never called, the misc device would rema=
in
registered. Any subsequent attempt to open or interact with the leaked devi=
ce
node would access the freed sbtsi_data.

Should this use devm_add_action_or_reset() instead?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D6
