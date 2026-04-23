Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D85C31D371
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 22:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982262; cv=none; b=ZL4r7M5E3VChRTCnWGwKb4GJ8zfBqfGaRtWfpNPocMvxm0mCUV1/MGzfkvPDBa0Qe8rJ8Z7vd1zCtmr4sKYxl6xSPAOfygTzFZiJMCO6FEzdmeoeUY3v2vP48AO2EjExYSH7MeBuO+FhsK7ot5ttpCcj9jK46fAl7SuynxeodBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982262; c=relaxed/simple;
	bh=L8M5xOaEaMYHxQmx2S60cVyg1lfh6zsL4Okx7K2KPtw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KvrwikOqcBhhNFsgOzYb7fq4WSOX/58WqBJBRyUipxiJ9jjMKK6MgNlsdTqUjCJbtOEju10mBmq9qVNYCHsau/p18Hpd8V4yq6G4ZM36bgVlpRYkjckhRPEXUeC1qRskP2lpI0O6pw+4uk2yA/CzXdV276i+Gv92Ja50w8BFb8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZ6t9tIh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZ6t9tIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D017C2BCAF;
	Thu, 23 Apr 2026 22:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776982262;
	bh=L8M5xOaEaMYHxQmx2S60cVyg1lfh6zsL4Okx7K2KPtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uZ6t9tIhj/p5InSTZTMwVgy8e0iBgxlNj8ACd6cemOIuOzUOeIUgLb6jTWmOg+LPX
	 sgKysYv8dxS70PfJF3n4fTaYwcyPbUAOwJnDQgWCKvBgV4Q+tOnL33AG4cdbmXPGA6
	 NAb2MfOsq1ioUdspuormTD55BkSTZkooZ8ku1MARd+9/8mv72Gg/G/3OLrPQm8BJgp
	 w7iUHASPQ3r6Uj3nqVTNP6bXtjwolHymnhzp9AeoMM902gTvtbXP8mx5M/YapgOtR/
	 enENaKPA0KO8FxnUXrw5fmoj6e6f/pW/CvrTNtXXn6mTlWHWou+cLRwp7oqCU0O3qo
	 uTYAqUzwWWAjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/13] i3c: master: Support ACPI enumeration of child
 devices
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-5-akhilrajeev@nvidia.com>
References: <20260423085718.70762-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 22:11:01 +0000
Message-Id: <20260423221102.1D017C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] `i3c_acpi_get_i2c_resource()` incorrectly overwrites device config=
uration and accumulates flags when multiple `I2cSerialBus` resources are pr=
esent.
- [High] Auxiliary non-I2C/I3C ACPI child nodes cause the entire I3C master=
 bus registration to fail.
- [High] The ACPI I2C enumeration path leaves `boardinfo->base.type` uninit=
ialized, resulting in empty device names.
--

commit 32dd6acd0427ec4e092205396a3b4f2782c52903
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Support ACPI enumeration of child devices

This commit adds support for describing I3C and I2C devices using ACPI.
It extracts device configuration such as the static address and LVR
from ACPI resources to enable enumeration on the I3C bus.

Link: https://www.mipi.org/mipi-disco-for-i3c-download

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2409,6 +2410,53 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
> =20
>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
> =20
> +#ifdef CONFIG_ACPI
> +static int i3c_acpi_get_i2c_resource(struct acpi_resource *ares, void *d=
ata)
> +{
> +	struct i2c_dev_boardinfo *boardinfo =3D data;
> +	struct acpi_resource_i2c_serialbus *sb;
> +
> +	if (!i2c_acpi_get_i2c_resource(ares, &sb))
> +		return 1;
> +
> +	boardinfo->base.addr =3D sb->slave_address;
> +	if (sb->access_mode =3D=3D ACPI_I2C_10BIT_MODE)
> +		boardinfo->base.flags |=3D I2C_CLIENT_TEN;
> +
> +	boardinfo->lvr =3D sb->lvr;
> +
> +	return 0;
> +}

Does this code overwrite the device configuration if multiple I2cSerialBus
resources are present? By returning 0, it tells the ACPI core to continue
walking resources. The primary address seems to be overwritten by the last
resource, and flags like I2C_CLIENT_TEN from earlier resources will
accumulate into the final configuration.

[ ... ]

> +static int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinf=
o,
> +				      struct fwnode_handle *fwnode)
> +{
> +	struct acpi_device *adev =3D to_acpi_device_node(fwnode);
> +	LIST_HEAD(resources);
> +	int ret;
> +
> +	boardinfo->base.fwnode =3D acpi_fwnode_handle(adev);
> +
> +	ret =3D acpi_dev_get_resources(adev, &resources,
> +				     i3c_acpi_get_i2c_resource, boardinfo);

Is boardinfo->base.type left uninitialized here? Because the structure is
allocated with devm_kzalloc() earlier, the type field remains an empty
string.

Standard I2C APIs rely on this field to populate the client name, which mig=
ht
break sysfs node creation and legacy string-based driver matching.

[ ... ]

>  static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
>  {
>  	struct device *dev =3D &master->dev;
> @@ -2532,7 +2645,13 @@ static int fwnode_populate_i3c_bus(struct i3c_mast=
er_controller *master)
>  		return 0;
> =20
>  	fwnode_for_each_available_child_node_scoped(fwnode, child) {
> -		ret =3D i3c_master_add_dev(master, child);
> +		if (is_of_node(child))
> +			ret =3D i3c_master_add_of_dev(master, child);
> +		else if (is_acpi_device_node(child))
> +			ret =3D i3c_master_add_acpi_dev(master, child);
> +		else
> +			continue;
> +
>  		if (ret)
>  			return ret;
>  	}

If an auxiliary ACPI child node lacks an _ADR method and lacks I2cSerialBus
resources, i3c_master_add_acpi_dev() calls i3c_master_add_i2c_boardinfo(),
which will eventually return -ENODEV.

Will this cause the entire I3C master bus registration to fail because the
loop aborts on the first error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D4
