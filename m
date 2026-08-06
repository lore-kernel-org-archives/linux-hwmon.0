Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E4385D82
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997250; cv=none; b=sgdCmOJNRlzKryrlaSZ8nfKUDuD7zGedVq+1xOfhmvRUbtR8eAb8THPau8F3yaOSgKI9gP0NvsMU0aPm/hKrEWI+MYoWLhQGbI1q/UeFeJ8YPNGEeowXT3PStH5EAmMsQ5g2YMNsMCbhT9mf8uCAmiWufg5jHZsAX2Ax86Hhqgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997250; c=relaxed/simple;
	bh=LKYVFnTf9AFmto1teEQuugNMKB35K7YOXgqPDWyOi8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BZ8jhVBz1FGMUz4lGYY622f8dw/Cr4jr8UBRr5olTyk+IrMAtjF3IDInDFnNPJTYmuYL0OyoazfvwT67cEVZEe7clBM++x1CeG2m7L3MkVEYpl/ZUDxB3N7QmSJpvF3kbg6HwNQsQVrZIqUDtpXxlhay3SwzuNmO9fFftA+W4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxXV5Mye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxXV5Mye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAABB1F00A3A;
	Thu,  6 Aug 2026 06:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785997249;
	bh=UEo5B5GWncpjQEjIqPSgSZVI3zPBodpCwm15aQ/bg/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxXV5MyefrJcp3NtLMhgAC6Hy8VmIhYqjgzc4HeQp2tVSZQvkB8m/8TVZ4kNYjXPK
	 fIYzfyVZcz9ILol2HLkz2nHstUnfdHPdn0V4HMHnffYso9MJfMXVtTRKQqCjAa6qlr
	 3S3NxQR2+V2R3AivPTNWZZB6qZ1ycCncDlzP5mUDHB3MZRYR6KGULTQaN5kuA1UlLO
	 Aq40BKHJ/Xeo4OlRba1EwArWtqWslmqL3tQ0Ms0XKQlCXDpCdk9z1tL4YxwiJz4bC1
	 e9AwQAa68ts6bMtXzddCOZaICiyVK11Dt4qbObHBbqcIh7P+UgL//SwtlD7mzqjxAl
	 5tsHWqhojgF0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (core) Constify device attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260806-sysfs-const-attr-hwmon-v2-1-22fee8b85509@weissschuh.net>
References: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
 <20260806-sysfs-const-attr-hwmon-v2-1-22fee8b85509@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 06:20:48 +0000
Message-Id: <20260806062048.EAABB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete constification of device attributes: the `pec` attribute=
 was missed.
--

--- Patch [1]: [PATCH v2 1/3] hwmon: (core) Constify device attributes ---
commit 63bf6c9fac5c27892b6188fad21e12ff51c4b53a
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (core) Constify device attributes

This commit updates the hwmon core to mark device attribute structures as c=
onst
since they are never modified. It also updates the show callbacks and visib=
ility
functions to accept const arguments.

> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 55a9a3ddd4aac..84108a16ef60c 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -71,27 +71,27 @@ struct hwmon_thermal_data {
>  };
> =20
>  static ssize_t
> -name_show(struct device *dev, struct device_attribute *attr, char *buf)
> +name_show(struct device *dev, const struct device_attribute *attr, char =
*buf)
>  {
>  	return sysfs_emit(buf, "%s\n", to_hwmon_device(dev)->name);
>  }
> -static DEVICE_ATTR_RO(name);
> +static const DEVICE_ATTR_RO(name);
> =20
>  static ssize_t
> -label_show(struct device *dev, struct device_attribute *attr, char *buf)
> +label_show(struct device *dev, const struct device_attribute *attr, char=
 *buf)
>  {
>  	return sysfs_emit(buf, "%s\n", to_hwmon_device(dev)->label);
>  }
> -static DEVICE_ATTR_RO(label);
> +static const DEVICE_ATTR_RO(label);

[Severity: Low]
This isn't a bug, but should the pec attribute also be constified?

The pec attribute is defined further down in drivers/hwmon/hwmon.c but seem=
s to
have been missed by this refactoring:

static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
			char *buf)

static ssize_t pec_store(struct device *dev, struct device_attribute *devat=
tr,
			 const char *buf, size_t count)

static DEVICE_ATTR_RW(pec);

Since device_create_file() accepts a const struct device_attribute, could we
update pec_show(), pec_store(), and the pec device attribute to be const as
well?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-sysfs-cons=
t-attr-hwmon-v2-0-22fee8b85509@weissschuh.net?part=3D1
