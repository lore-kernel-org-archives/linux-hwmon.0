Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A809D7081E
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651042; cv=none; b=QuNFOjI+dSJmQ6VmtUttzwi6A1ENDNKhCxNcyNGnGf+GFJJIRubj+Rc3d7/JOQo78zLrb9PIgAdc+cyA5aLSuLOjGtFhsbCVC2IWJZjUQ4pC507LauPGCiezjZXWGBrXqIEhoBJpBgRQVI+rlegEF4AZs6IFwcwf4tjLedS07n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651042; c=relaxed/simple;
	bh=WPylvE5gc1fhsnmncgN4kdaXueROM5Z0BwzUbd6cNto=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rIDwhNMbjP8ZC3BL7JKskxTkzFp2js/IHl/cvcx6+sA3kI1EccDKs8mBm1Ltr3NSJZ5HUbPuG07ewR1oZaybP6CA5yVjsuIgnDkODfJaIPOUW4dbgNAei4ioKTiHYlOInqi5rZOYvP8vkn686o0qQciOIqj6qI3Cj5hN+dhdz50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlfcAcj3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlfcAcj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4391F000E9;
	Tue, 25 Aug 2026 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787651041;
	bh=Od61CLtWH1svDMq/DECtcI3JIAe/JaRQ4UHnc6Lk9bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KlfcAcj34AJkv0P0+p0vttDfAtzf7FLdqJKqmmWc1nPcsSTgz0+8l6JS68NprpwIp
	 llP4ZQKJH5P3cqZ5aEXuno3ALIj9QE6zwl1iTznI2bA927UDXzXh06pMY69Uj71rnx
	 mP8bcMzhZt/Qk4nDj6ZeoLF/jVF7z8aWp+RKFMRRYS6FQKQHCKeCKGD4iKvB+KE8o9
	 d3tZm+8NuA5/lbRqE2pIOtsJqYwX8Fwn1+OdpDCO1Mnvomqzz4RKV98y5tDyM+Nfsi
	 UVWpe70eGgCMdGy+E9n+ejXFs7LNwtKI13I1Ol2gzVNAPsm6VQvhmMNqWrpP/u6Fbd
	 +z7yLIaAJ3TPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] hwmon: (nct6683) Add pwm[1-8]_enable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260825092546.669450-4-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-4-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 09:44:00 +0000
Message-Id: <20260825094401.0E4391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The sysfs callbacks `show_pwm_enable()` and `store_pwm_enable()`=
 incorrectly cast their attribute argument to `struct sensor_device_attribu=
te_2 *`, leading to type confusion with `struct sensor_device_attribute` an=
d causing failures on Big-Endian architectures.
--

--- Patch [3]: [PATCH 3/5] hwmon: (nct6683) Add pwm[1-8]_enable ---
commit ae1360636538f417a87b23c1e1c204ef9329c018
Author: Johan Dahlin <jdahlin@gmail.com>

hwmon: (nct6683) Add pwm[1-8]_enable

This commit exposes the manual-control bitmap as pwm[1-8]_enable for fan
control on supported boards, falling back to read-only hardware control
on unsupported variants.

Link: https://github.com/Fred78290/nct6687d
Link: https://github.com/LibreHardwareMonitor/LibreHardwareMonitor

> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index b43e915f9d0fb..0324ace707a53 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
[ ... ]
> @@ -962,25 +963,93 @@ store_pwm(struct device *dev, struct device_attribu=
te *attr, const char *buf,
[ ... ]
> +static ssize_t
> +show_pwm_enable(struct device *dev, struct device_attribute *attr, char =
*buf)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);

[Severity: Medium]
Does this cast cause type confusion with struct sensor_device_attribute?

The template initializes the attribute as a struct sensor_device_attribute,
which uses an int for the index field, but it is cast here to a struct
sensor_device_attribute_2, which uses a u8 for the index.

On Big-Endian architectures, reading a u8 from an int field aliases the MSB.
Would this result in an index of 0, effectively mapping all manual fan
control operations to channel 0 and breaking functionality for fans 1-7?

> +	struct nct6683_data *data =3D dev_get_drvdata(dev);
> +	u8 mode;
> +
> +	mutex_lock(&data->update_lock);
> +	mode =3D nct6683_read(data, NCT6683_REG_FAN_CTRL_MODE);
> +	mutex_unlock(&data->update_lock);
> +
> +	return sysfs_emit(buf, "%d\n", (mode & BIT(sattr->index)) ? 1 : 2);
> +}
> +
> +static ssize_t
> +store_pwm_enable(struct device *dev, struct device_attribute *attr,
> +		 const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);

[Severity: Medium]
Is there a similar type confusion issue on the store path?

Casting to struct sensor_device_attribute_2 and reading the u8 index might
similarly fail on Big-Endian systems during store operations, causing writes
to unintended channels.

> +	struct nct6683_data *data =3D dev_get_drvdata(dev);
> +	u8 bit =3D BIT(sattr->index);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825092546.6694=
50-1-jdahlin@gmail.com?part=3D3
