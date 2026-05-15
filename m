Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027B305668
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860689; cv=none; b=hM/fEL7k0NojlP/TVm5+l+YosJjOy6pO/EEXKhgoME378amMcsF5uYjKLD1eHVjGI766EbADVB09saw6LGQ6LeZrchKl1DoNCTPTq6wE7boi++61Hm12q26q3XCR2tajPqWk4jwNTvteNpCqA1ehxC9d4279BoTwDdF20WzYCZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860689; c=relaxed/simple;
	bh=2QxrSXh3RfVdD9VPrsCvlhcHYFMiXQKs1ERqRgbEjEM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FNpm7nGQiRnxmZ9cbjMt2/KXpEr5UBqcpKJrFN9RgAGYE81auwfMiiRP19hbh+9/y/iGKuQvL9lKKonu8z245O2pidV4QXMiyti0dEipq+LL/HYBBgl/AsTHtpDQyhyauNhrBd/0eMfFACeRfGkKQ8l17lKpgajKgXUAe9TCdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZwVaSOj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZwVaSOj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC27CC2BCB3;
	Fri, 15 May 2026 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778860688;
	bh=2QxrSXh3RfVdD9VPrsCvlhcHYFMiXQKs1ERqRgbEjEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YZwVaSOje00wcAWC19cBpOq9CIgTQlLx3i5i8Z3TXa0f+17c4OwD06s64kcv597ox
	 BdIUvwypEqyUiQyGnBVKrVlEyHqhablnNRsvTviQlGtfAZqccWuuWf6ORDQbV79pZT
	 PWwmPM44vyYAsHeDbx9KorPxPne3xQe2+WNADNu1iHYfXIOfPlBpDQQ/5kMITdnTwf
	 v7/+5M/rR0BhIo74jeWTO3L7J2W0UOExlkRhBXdcGESDWE6AYXIZJOP9FOF7wM05cB
	 vVHi/c8tTR7H31YRv9iQTBLYUlPC7yo/kxU6bIy3kxtS0sUrsti5XRpvWTr1KiSDvG
	 iGV+rs5Med1oA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] misc: amd-sbi: Add SBTSI ioctl register transfer
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515134506.397649-6-Akshay.Gupta@amd.com>
References: <20260515134506.397649-6-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 15:58:07 +0000
Message-Id: <20260515155808.AC27CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Use-After-Free of `sbtsi_data` due to misaligned devres and VF=
S lifecycles
- [High] Unsafe DMA Buffer Allocation from stack variables
- [High] Subsystem Guideline Violation: Redundant custom lock instead of hw=
mon_lock()
- [High] sysfs name collision for miscdevice on multi-bus systems
- [Medium] Hardware state desynchronization via unrestricted IOCTL writes
- [Medium] UAPI Flaw: Unvalidated padding byte in IOCTL message
--

commit a076ef47ca989260af804712d32ac63c2aaf11cb
Author: Prathima <Prathima.Lk@amd.com>

misc: amd-sbi: Add SBTSI ioctl register transfer interface

Implement IOCTL interface for SB-TSI driver to enable userspace access
to TSI register read/write operations through the AMD Advanced Platform
Management Link (APML) protocol.
Add an ioctl command (SBTSI_IOCTL_REG_XFER_CMD) that accepts a register
address, data byte, and direction flag.

> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> index d7ae986d824c4..00e982f4c716c 100644
> --- a/drivers/hwmon/sbtsi_temp.c
> +++ b/drivers/hwmon/sbtsi_temp.c
> @@ -64,12 +64,15 @@ static inline void sbtsi_mc_to_reg(s32 temp, u8 *inte=
ger, u8 *decimal)
>  /*
>   * Read integer and decimal parts of an SB-TSI temperature register pair
>   * The read order is determined by the ReadOrder bit to ensure atomic la=
tching.
> + * The mutex protects against concurrent access to the shared I2C/I3C bu=
s by
> + * the hwmon sysfs and a userspace ioctl
>   */
>  static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
>  			   u8 *val1, u8 *val2)
>  {
>  	int ret;
> =20
> +	guard(mutex)(&data->lock);

Does this custom lock bypass the standardized hwmon core synchronization
mechanism? The hwmon subsystem guidelines appear to mandate using
hwmon_lock() and hwmon_unlock() to serialize sysfs operations against
attributes registered by other means.

[ ... ]

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> index 19388737b225e..c5bd60409d5bb 100644
> --- a/drivers/misc/amd-sbi/tsi-core.c
> +++ b/drivers/misc/amd-sbi/tsi-core.c
[ ... ]
> +static int apml_tsi_reg_xfer(struct sbtsi_data *data,
> +			     struct apml_tsi_xfer_msg __user *arg)
> +{
> +	struct apml_tsi_xfer_msg msg =3D { 0 };
> +	int ret;
> +
> +	if (copy_from_user(&msg, arg, sizeof(struct apml_tsi_xfer_msg)))
> +		return -EFAULT;
> +
> +	ret =3D sbtsi_xfer_ioctl(data, msg.reg_addr, &msg.data_in_out, msg.rfla=
g);

Could passing &msg.data_in_out to sbtsi_xfer_ioctl() eventually result in
a DMA transfer from stack memory?

If the transfer goes over I3C, sbtsi_i3c_read() uses this pointer directly:

static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
{
	struct i3c_xfer xfers[2] =3D { };

	xfers[0].rnw =3D false;
	xfers[0].len =3D 1;
	xfers[0].data.out =3D &reg;

	xfers[1].rnw =3D true;
	xfers[1].len =3D 1;
	xfers[1].data.in =3D val;

	return i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);
}

Since I3C host controllers commonly use DMA, and stack variables are not
cacheline aligned (and reside in virtually mapped memory with
CONFIG_VMAP_STACK enabled), this might violate the DMA API and lead to adja=
cent
stack corruption.

Furthermore, does this unrestricted IOCTL write capability allow userspace
to overwrite the SBTSI_REG_CONFIG register?

During probe, the driver caches hardware state (ext_range_mode and
read_order) from this register. If userspace modifies it without the
driver intercepting the write to update its cache, the hwmon interface
could report incorrect temperatures.

[ ... ]

> +static long sbtsi_ioctl(struct file *fp, unsigned int cmd, unsigned long=
 arg)
> +{
> +	void __user *argp =3D (void __user *)arg;
> +	struct sbtsi_data *data;
> +
> +	data =3D container_of(fp->private_data, struct sbtsi_data, sbtsi_misc_d=
ev);

Can this lead to a use-after-free if the device is unbound?

The sbtsi_data structure is allocated with devm_kzalloc(), tying its
lifetime to the device's driver binding. When the device unbinds, devres
calls misc_deregister() and frees sbtsi_data.

Since misc_deregister() does not close or revoke existing file descriptors,
a process could retain its file descriptor and call ioctl() after the unbin=
d,
extracting the freed sbtsi_data pointer and attempting to lock data->lock.

[ ... ]

> +int create_misc_tsi_device(struct sbtsi_data *data, struct device *dev)
> +{
> +	int ret;
> +
> +	data->sbtsi_misc_dev.name =3D devm_kasprintf(dev, GFP_KERNEL,
> +						   "sbtsi-%x", data->dev_addr);

Will this naming scheme cause a sysfs name collision on systems with
multiple I2C/I3C buses?

If identically-addressed sensors exist on different buses, it looks like
misc_register() will attempt to create a duplicate sysfs entry
(e.g., /sys/class/misc/sbtsi-4c), fail with -EEXIST, and abort the probe.

[ ... ]

> diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
> index 745b3338fc06f..8a85f79b0938d 100644
> --- a/include/uapi/misc/amd-apml.h
> +++ b/include/uapi/misc/amd-apml.h
> @@ -73,6 +73,13 @@ struct apml_reg_xfer_msg {
>  	__u8 rflag;
>  };
> =20
> +struct apml_tsi_xfer_msg {
> +	__u8 reg_addr;		/* TSI register address offset */
> +	__u8 data_in_out;	/* Register data for read/write */
> +	__u8 rflag;		/* Register read or write */
> +	__u8 pad;		/* Explicit padding */
> +};

Should msg.pad be validated in apml_tsi_reg_xfer() to ensure it is zero?

Without this check, userspace can pass uninitialized garbage in the padding
field, which might prevent safely repurposing this field for new flags or
extensions in the future.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515134506.3976=
49-1-Akshay.Gupta@amd.com?part=3D5
