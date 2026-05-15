Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C74D8D90
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859194; cv=none; b=s6PqMa/AxZ95/PTMQqD94e1wPsnBVd4wIp+FNUcnd+rMqbr5EI01vCP5Nq7Q6Xz9++h/xyM7qxdA9d0vk4L89HNJbi0oBGi6n7h8umeVQHU5e0kYJhaMGS21WIdHfIKl9jJWWdGwEkqvkq41/30WDe6yyxVnGUReWDHut8L3qaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859194; c=relaxed/simple;
	bh=RoisI8HrW7pvHVVCCcxV/HJojK77w2k7RQhZsoOnuF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HcHnwWl1FH8W1DIs/TV6K/vOWSCjV5UEA6WfVL2bvY657Hopq4nfnWJCT2Nr2KqF31BWf01Cl3iyTm18QgCc74IBD7wmWBZJz2Uh/lYu9RVWj+7Ur2bvuGVpvcILkdW1cC05FpKbrwvCdlaQvrhf/z+ImDCQgIShHpiRZGZFvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMptPwiC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMptPwiC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3A6C32782;
	Fri, 15 May 2026 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778859193;
	bh=RoisI8HrW7pvHVVCCcxV/HJojK77w2k7RQhZsoOnuF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hMptPwiClp7SbOD+3G2lDw71nEOSEmVqC73VrEARwfyDqEcBDaGZHgxSkTptQKyE1
	 YVNqe3p1E3faQNWACLzXVP1CWm/aldUqJ8jT3rhqUrJ8CuUWjEz1u7paOflHGsxXoC
	 WJrJYW1dNxAvV+zFGur5OMe3JRnMNFhqgJ5+rbi9D+2xP4aVSEAnQG/TJxqNGH8KPu
	 5c5i/En/A8XmdcYu5X7SfbuT8m+qGtqdtR9LNWsts7NYTQMlYPdALNpdH7HZTCIYMO
	 5kjjgYk9MfvBpxHtKVSdjgl8asskkDPMwmTayqstBurtMlnO4dr3WKHjOo4XGqUdCp
	 ZXYzdkbJWe2JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] misc: amd-sbi: Add support for SB-TSI over I3C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515134506.397649-5-Akshay.Gupta@amd.com>
References: <20260515134506.397649-5-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 15:33:12 +0000
Message-Id: <20260515153312.DB3A6C32782@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Kconfig dependency uses a non-existent symbol (`I3C_OR_I2C`), caus=
ing silent build failures.
- [High] I3C transfer functions pass stack-allocated buffers for DMA transf=
ers, risking memory corruption and panics.
- [Medium] The driver violates I3C subsystem API boundaries by including `<=
linux/i3c/master.h>` to access opaque internal structures.
--

commit fd51ed18b45ce179c5ee6ea15c970ec2d140c6c7
Author: Prathima <Prathima.Lk@amd.com>

misc: amd-sbi: Add support for SB-TSI over I3C

Extend the SB-TSI driver to support both I2C and I3C bus interfaces
by selecting the appropriate transport based on the probed bus type.
The driver registers both I2C and I3C drivers using module_i3c_i2c_driver().

> diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
> --- a/drivers/misc/amd-sbi/Kconfig
> +++ b/drivers/misc/amd-sbi/Kconfig
> @@ -23,13 +23,13 @@ config AMD_SBRMI_HWMON
> =20
>  config AMD_SBTSI
>  	tristate "AMD side band TSI support"
> -	depends on I2C
> +	depends on I3C_OR_I2C

Is this a valid Kconfig symbol? It looks like it will evaluate as a single
config symbol named CONFIG_I3C_OR_I2C instead of a logical OR. Could this
cause the driver to be silently unbuildable? Perhaps it should be written
as depends on I3C || I2C?

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> --- a/drivers/misc/amd-sbi/tsi-core.c
> +++ b/drivers/misc/amd-sbi/tsi-core.c
[ ... ]
> +/* I3C read transfer function */
> +static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
> +{
> +	struct i3c_xfer xfers[2] =3D { };
> +
> +	/* Add Register data to read/write */
> +	xfers[0].rnw =3D false;
> +	xfers[0].len =3D 1;
> +	xfers[0].data.out =3D &reg;
> +
> +	xfers[1].rnw =3D true;
> +	xfers[1].len =3D 1;
> +	xfers[1].data.in =3D val;
> +
> +	return i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);
> +}

Does i3c_device_do_xfers() map the buffers for DMA? If so, passing stack
memory like &reg and val could lead to memory corruption or kernel panics
when CONFIG_VMAP_STACK is enabled. Could these buffers be allocated on the
heap, for example by embedding them in the sbtsi_data structure?

> +/* I3C write transfer function */
> +static int sbtsi_i3c_write(struct sbtsi_data *data, u8 reg, u8 val)
> +{
> +	u8 buf[2];
> +	struct i3c_xfer xfers =3D {
> +		.rnw =3D false,
> +		.len =3D 2,
> +		.data.out =3D buf,
> +	};
> +
> +	buf[0] =3D reg;
> +	buf[1] =3D val;
> +
> +	return i3c_device_do_xfers(data->i3cdev, &xfers, 1, I3C_SDR);
> +}

Similarly, does buf[2] on the stack present a DMA mapping issue here?

> diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
> --- a/drivers/misc/amd-sbi/tsi.c
> +++ b/drivers/misc/amd-sbi/tsi.c
[ ... ]
> +static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	struct device *dev =3D i3cdev_to_dev(i3cdev);
> +	struct sbtsi_data *data;
> +	int err;
> +	u8 val;
> +
> +	/*
> +	 * AMD OOB devices differ on basis of Instance ID,
> +	 * for SBTSI, instance ID is 0.
> +	 * As the device Id match is not on basis of Instance ID,
> +	 * add the below check to probe the SBTSI device only and
> +	 * not other OOB devices.
> +	 */
> +	if (I3C_PID_INSTANCE_ID(i3cdev->desc->info.pid) !=3D 0)
> +		return -ENXIO;

Is accessing i3cdev->desc->info.pid directly safe? The i3c_device struct is
typically treated as opaque to client drivers. Would it be better to use
i3c_device_get_info() to populate a struct i3c_device_info and read the
fields from there to ensure internal locking is respected?

[ ... ]
> +	data->ext_range_mode =3D FIELD_GET(BIT(SBTSI_CONFIG_EXT_RANGE_SHIFT), v=
al);
> +	data->read_order =3D FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), val);
> +
> +	dev_set_drvdata(dev, data);
> +	return sbtsi_create_hwmon_adev(dev, i3cdev->desc->info.dyn_addr);
> +}

Similarly here, can this direct access to i3cdev->desc->info.dyn_addr be
replaced with the public i3c_device_get_info() API?

> diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
> --- a/include/linux/misc/tsi.h
> +++ b/include/linux/misc/tsi.h
> @@ -9,18 +9,26 @@
>  #define _LINUX_TSI_H_
> =20
>  #include <linux/i2c.h>
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/master.h>

Does the driver need to include linux/i3c/master.h? Client drivers normally
only include linux/i3c/device.h, and relying on master.h might break the
I3C API boundaries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515134506.3976=
49-1-Akshay.Gupta@amd.com?part=3D4
