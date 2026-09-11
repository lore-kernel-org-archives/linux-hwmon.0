Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE94BA1FC
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161704; cv=none; b=fLxc2LbDOx5m0idQnmzT9o1KHtYm/StgRtrPdeptxeUNNYvAZqSahaPmNDTNelHdhORF9o0Ag9lF4TBFT5FZYxdzLFj8UhzoFkruvLtbkK972ZqNYVs9ZZqGqqqfp/Z7nOLvN9mC2PcjLcfvPenrAWFDXnEspbk6zszEX6vU/5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161704; c=relaxed/simple;
	bh=MvzV/Tv6v0vMrEkQEhaJjBQGaQkETc0b36m6FYYas0A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ILGdCao7Kj8wwiXE/CCmvmpyRcSk87rttNkku9iwyfawRrN9V1/SEGiaBlHuUaUl3Ztd9oduBbgQgkXEbYCPrgKhOHs7T+1Us6d5n4jpAMb62NFBvmPeV93Pg+qsFuFrU3+plWdWi9xYiwc/lQcqYoxaPLufrOgoLxvinOUCmHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHzu+CC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHzu+CC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535861F000FF;
	Fri, 11 Sep 2026 21:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789161702;
	bh=r4E8k96H7dpGkRg9V///RyiymeywzlTi8LMpRuYA+GQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VHzu+CC16J405OCwOpj0lnMId5mYykqyI+hOZY2paehAWj8o1kWn2PZZ8NmQ3s62G
	 ah0w+3jvoLSNvMduxYsMiKYuqZ8S8Cr/0C3Tbn8DMx0F5nsOVtogDw6Db2M7OKozMg
	 Qnd2v4Bd2sNO76bpoDqXMCPO5WbgOeE7dnDu9II1CHXdmmn++jzHoBvyeGASQO8H8r
	 zJApgPcUQ5DqRR7QmqUb7rTDuB2zJgvBrvLNBhoW/FuD4+q+IQyKFTTLDkwXLp0spB
	 +rjICf6zGGunCbyF2s5AkVUsXwt/+O7+kj86DMxRcC4ahztXdncqqkOVJZ6p/3uHpi
	 0ReyHfGzkx/Yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] i3c: add i3cdev character device module for
 user-space access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Meagan Lloyd" <meaganlloyd@linux.microsoft.com>
Cc: linux-hwmon@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260911210935.1353126-4-meaganlloyd@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-4-meaganlloyd@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 21:21:41 +0000
Message-Id: <20260911212142.535861F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Max Write Length (MWL) check is bypassed in `i3cdev_write` due t=
o uninitialized length field.
- [Medium] Mixing goto-based error handling and `scoped_guard()` declaratio=
ns in the same function violates the cleanup subsystem guidelines.
- [Medium] Memory and reference count leak on the `dev_set_name()` error pa=
th in `i3cdev_probe()`.
- [Medium] Un-ratelimited kernel logging in `print_i3c_err` allows unprivil=
eged users to flood dmesg.
--

commit 691a30342eecac1b5bf88181bfab4ade443f2923
Author: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: i3c: add i3cdev character device module for user-space access

This commit introduces a character device driver for I3C devices. It allows
user-space applications to perform basic SDR reads and writes by binding
devices manually via sysfs driver_override.

> diff --git a/drivers/i3c/i3cdev.c b/drivers/i3c/i3cdev.c
> new file mode 100644
> index 0000000000000..da0e6910a4f72
> --- /dev/null
> +++ b/drivers/i3c/i3cdev.c

[ ... ]

> +static ssize_t
> +i3cdev_read(struct file *file, char __user *buf, size_t count, loff_t *f=
_pos)
> +{

[ ... ]

> +	scoped_guard(mutex, &i3cdev->lock) {
> +		/* .remove was called so don't mess with the device */
> +		if (!i3cdev->bound) {
> +			ret =3D -ENXIO;
> +			goto out_free_kbuf;
> +		}
> +
> +		ret =3D i3c_device_do_xfers(i3c, &xfer, 1, I3C_SDR);
> +		if (ret)
> +			goto out_free_kbuf;
> +	}

[Severity: Medium]
Does this mix goto-based error handling with scoped_guard() in the same
function?

The VFS/cleanup guidelines indicate that mixing goto-based error labels with
scope-based cleanups like scoped_guard() creates confusing ownership semant=
ics
and increases the risk of double-free or resource leaks. Since the function
uses a goto label for freeing the memory buffer out_free_kbuf, could we
either convert the buffer to use a scope-based __free() or use traditional
mutex lock/unlock operations?

[ ... ]

> +static ssize_t
> +i3cdev_write(struct file *file, const char __user *buf, size_t count,
> +	     loff_t *f_pos)
> +{
> +	struct i3cdev_data *i3cdev =3D file->private_data;
> +	struct i3c_device *i3c =3D i3cdev->i3c;
> +	struct i3c_xfer xfer =3D {
> +		.rnw =3D I3C_WRITE
> +	};
> +	size_t len;
> +	char *tmp;
> +	int ret;
> +
> +	if (!i3cdev->bound)
> +		return -ENXIO;
> +
> +	/* File system operation of 0 bytes is effectively a valid, no-op */
> +	if (!count)
> +		return 0;
> +
> +	if (exceeds_mwl(i3cdev, &xfer))
> +		return -ENXIO;
> +
> +	/* Clamp transfer length within driver limits */
> +	len =3D min(count, MAX_TOTAL_DATA_BYTES);
> +	xfer.len =3D len;

[Severity: Medium]
Is the Max Write Length (MWL) check bypassed here due to an uninitialized
length field?

At the point where exceeds_mwl() is called, xfer.len is 0 because only .rnw
was initialized in the struct declaration. The actual xfer.len is assigned
after the check, meaning the MWL validation will always pass regardless of =
the
requested size. This could allow hardware to receive writes exceeding its
supported maximum length. Should the length clamp and assignment happen bef=
ore
the validation check?

[ ... ]

> +	scoped_guard(mutex, &i3cdev->lock) {
> +		/* .remove was called so don't mess with the device */
> +		if (!i3cdev->bound) {
> +			ret =3D -ENXIO;
> +			goto out_free_kbuf;
> +		}
> +
> +		ret =3D i3c_device_do_xfers(i3c, &xfer, 1, I3C_SDR);
> +		if (ret)
> +			goto out_free_kbuf;
> +	}

[Severity: Medium]
Similar to i3cdev_read(), does this mix goto-based error handling with
scoped_guard() in the write path?

[ ... ]

> +static void print_i3c_err(struct i3cdev_data *i3cdev,
> +			  struct i3cdev_xfers *metadata,
> +			  struct i3c_xfer *i3c_xfers)
> +{
> +	for (int i =3D 0; i < metadata->nxfers; i++) {
> +		/* Valid errors, e.g. M0 (now called C0) start at 1 */
> +		if (i3c_xfers[i].err > 0) {
> +			dev_warn(&i3cdev->dev,
> +				 "I3C error encountered: C%u\n",
> +				 i3c_xfers[i].err - 1);
> +			return;
> +		}
> +	}
> +}

[Severity: Medium]
Could this un-ratelimited kernel logging allow unprivileged users to flood
the dmesg log?

Since this error is triggered directly by user-supplied transfers via the
ioctl interface, a user-space application could repeatedly trigger hardware
errors to intentionally spam the kernel logs. Could we use a rate-limited
variant like dev_warn_ratelimited() here to prevent a potential local DoS?

[ ... ]

> +static int
> +i3cdev_ioctl_do_xfers(struct i3cdev_data *i3cdev,
> +		      struct i3cdev_xfers __user *uxfers)
> +{

[ ... ]

> +	scoped_guard(mutex, &i3cdev->lock) {
> +		/* .remove was called so don't mess with the device */
> +		if (!i3cdev->bound) {
> +			ret =3D -ENXIO;
> +			goto out_free_i3c_xfers;
> +		}
> +		ret =3D i3c_device_do_xfers(i3c, i3c_xfers,
> +					  metadata.nxfers, I3C_SDR);
> +		if (ret) {
> +			print_i3c_err(i3cdev, &metadata, i3c_xfers);
> +			goto out_free_i3c_xfers;
> +		}
> +	}

[Severity: Medium]
As in the read/write paths, does this also improperly mix scoped_guard()
with goto labels in the ioctl handler?

[ ... ]

> +static int i3cdev_probe(struct i3c_device *i3c)
> +{

[ ... ]

> +	i3cdev->dev.parent =3D i3c_device_dev;
> +	i3cdev->dev.devt =3D i3cdev->devt;
> +	i3cdev->dev.class =3D &i3cdev_class;
> +	i3cdev->dev.release =3D free_i3cdev_data;
> +	ret =3D dev_set_name(&i3cdev->dev, SYSFS_FORMAT, MINOR(i3cdev->devt));
> +	if (ret)
> +		goto error_free_ida;

[Severity: Medium]
Does this error path leak the i3cdev memory structure and leave an
unbalanced reference count on the underlying I3C device?

If dev_set_name() fails, execution jumps directly to error_free_ida, skippi=
ng
the release of i3cdev memory and the device reference acquired earlier in
probe. Should this instead call put_device(&i3cdev->dev) so that
free_i3cdev_data is executed to handle the cleanup properly?

[ ... ]

> +	scoped_guard(mutex, &i3cdev->lock) {
> +		ret =3D cdev_device_add(&i3cdev->cdev, &i3cdev->dev);
> +		if (ret)
> +			goto error_cleanup;
> +
> +		i3cdev->bound =3D true;
> +	}

[Severity: Medium]
Does this sequence mix scoped_guard() with a goto error cleanup label?

As with the other functions in this patch, this mixes scoped cleanup with
goto statements, which goes against the VFS/cleanup guidelines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911210935.1353=
126-1-meaganlloyd@linux.microsoft.com?part=3D3
