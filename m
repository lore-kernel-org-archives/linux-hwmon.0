Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460E33F8B1
	for <linux-hwmon@vger.kernel.org>; Thu,  3 Sep 2026 09:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427987; cv=none; b=A0syQt8hKz2oKstljumk2xM641E5Jfe0EaoOc/jqkkf4hjyHCQIvEfpkUW51mvjRVWvGfWLIsuJ/nAlm65mmQ878yM7QMgeAmv00BvoNINDKsFcgsbKdmSmsLhMcol7ew0HKAVKqLFViDc3K4TYcKQb7lRHx2vTSFFG5arcUjhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427987; c=relaxed/simple;
	bh=CYYIWfTSYi4FjT0ezSKzWqaU70nZmM22kdjlmLdlaTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DYtfNb1f+agy+qbLtEvNIp9RqvokTGk21E7uH63LbKSDwnQwb//Jz2EdlKKggeNpGIk8lRXlh/NXywmrmsth/TXpoNTouwiZEPan7kqUpg81aSomZJZUS0DLn93G7luy7K+s8+rHG7aBQ4lUSrxt3l3E0nE2T6XRZ1G5OClDR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfQhqoPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfQhqoPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDEB1F000E9;
	Thu,  3 Sep 2026 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427985;
	bh=gSGKdlWrItLgiMQKsBOrFuq+w5wojKhp7SSIWBqkCL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TfQhqoPnaJDnKHqEV/oRooC8PKQOIpVyGPuDWzyhcgQaZYxgMvA2Tl/T3ss4ko561
	 rNL30uigSEaaUK0Tnsr0DKGkf4E0dtrphkLh235qx4G3YDQxnPuJelWAWKQQCtBwiC
	 q7EX6CgB/xnokE8yCut03C6BMf1D2onk97OswC2PDZ8DlqComBplsT5Vv9GUHt1Wb9
	 OTactWYDg7d3FNFEPsqhc135z81DZe9gyfct6DtyPCFcOzHem1ApiFGKP0SVWpwQal
	 HyVgmxA5L9OKQWzU25YzodiCB62V4mqUzy+Hp+/T7KR+vR0VDoFw3u4K6V6psdHypV
	 AWfHa++cVJIJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/ltc4286) Add runtime shunt_resistor
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carl Lee" <carl.lee@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v1-1-aca2d49a1418@amd.com>
References: <20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v1-1-aca2d49a1418@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 09:33:05 +0000
Message-Id: <20260903093305.7CDEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The shared variable `data->rsense` is read without lock protection =
in the sysfs show function, causing a data race with concurrent store opera=
tions.
--

commit ba83e29a82adf5c7ae93ecbb0408db51473aa280
Author: Carl Lee <carl.lee@amd.com>

hwmon: (pmbus/ltc4286) Add runtime shunt_resistor control
   =20
This commit exposes a writable shunt_resistor sysfs attribute for the
ltc4286/ltc4287 drivers. It allows userspace to update the shunt resistor
value at runtime and updates the corresponding direct-format scaling
coefficients.

> diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
> index 8715d380784a0..e80c9ecea0997 100644
> --- a/drivers/hwmon/pmbus/ltc4286.c
> +++ b/drivers/hwmon/pmbus/ltc4286.c
[ ... ]
> @@ -16,6 +17,75 @@
> =20
>  #define LTC4286_MFR_ID_SIZE	3
> =20
> +struct ltc4286_data {
> +	struct pmbus_driver_info info;
> +	u32 rsense;
> +	bool vrange_low_enable;
> +};
> +
> +#define to_ltc4286_data(x) container_of((x), struct ltc4286_data, info)
> +
> +static ssize_t ltc4286_rsense_show(struct device *dev,
> +				   struct device_attribute *devattr,
> +				   char *buf)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
> +	struct ltc4286_data *data =3D to_ltc4286_data(info);
> +
> +	return sysfs_emit(buf, "%u\n", data->rsense);

[Severity: Low]
Is it safe to read data->rsense here without holding a lock?

Since ltc4286_rsense_store() updates data->rsense under the protection of
pmbus_lock_interruptible(), a concurrent sysfs read and write could trigger
a KCSAN data race warning.

> +}
> +
> +static ssize_t ltc4286_rsense_store(struct device *dev,
> +				    struct device_attribute *devattr,
> +				    const char *buf, size_t count)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	const struct pmbus_driver_info *info_ro =3D pmbus_get_driver_info(clien=
t);
> +	struct ltc4286_data *data =3D to_ltc4286_data(info_ro);
> +	struct pmbus_driver_info *info =3D &data->info;
> +	u32 rsense;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 10, &rsense);
> +	if (ret)
> +		return ret;
> +
> +	if (rsense =3D=3D 0)
> +		return -EINVAL;
> +
> +	if (rsense > (INT_MAX / 1024))
> +		return -EINVAL;
> +
> +	ret =3D pmbus_lock_interruptible(client);
> +	if (ret)
> +		return ret;
> +
> +	data->rsense =3D rsense;
> +	info->m[PSC_CURRENT_OUT] =3D 1024 * rsense;
> +	info->m[PSC_POWER] =3D data->vrange_low_enable ? 4 * rsense : rsense;
> +
> +	pmbus_unlock(client);
> +
> +	return count;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-hwmon-pmbu=
s-ltc4286-add-runtime-shunt-resistor-control-v1-1-aca2d49a1418@amd.com?part=
=3D1
