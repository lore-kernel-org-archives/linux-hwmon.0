Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064953B47D7
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775734993; cv=none; b=SQNn+aJdp+mmdscMS697paHstp4hGL+b3XXi87Zo3eMueXNB2BvchJrdy2SPs0QJTy3398FjOOqBwdTH80KpDdKz8cbPIw6v17z3h2a5tl0L/m1zEAA6yxet9zf94AA6VEU5TdLJw0V6mudmXaEeOB0fgr1dWqU6pmepjapIQDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775734993; c=relaxed/simple;
	bh=jWULjaClLANgUJTXFNz9kExd5bqodh391CNjYGv62QA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f32uNDFsfSZvrhpxg3glFooxyAm+bGr1WwGBkQhawreZkqvGDg2NTlTth4D8ZgwijlidwmHqE5fJNTPRdGZVwKSg58hBZCWGn3ynAPo+Kgyp7YPWHTP5NDES0wxjazbtgEp7Ni0GVSXhmnEMZZ5sWbxjropVsQisys2CHx2d5ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdfihd6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdfihd6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B44FC4CEF7;
	Thu,  9 Apr 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775734992;
	bh=jWULjaClLANgUJTXFNz9kExd5bqodh391CNjYGv62QA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cdfihd6pigWTasf3Nmn1xRU5rsMdk+R3WA2g+RHwHU4T6uCGZJevkvwGIHsIlXIhX
	 xyZ4twbMPguB48o1At5YHrmxpkA0R1EIqzzAWVRx6rQ+zGgmdN2lY3i06E9fL344gs
	 Z537o84Vv53XBz1oyiRq3SluGC/JTCy00Aai0dXNs68GNRS3opbHRejMSbGW089oPx
	 njIs/pJfCfcDpsb5zFQjzTnI8Q0j7qN9vmxIY14W7I7UrI9wW5MFBDBlYfwmraLNhx
	 Y+12TEehlKbQ+QMUcdRMgjJ9CVFAMqM+KewSjC0leS8utY9V6jgx1Fn0bYAGCPYjUu
	 EflaQ7wWCI6yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/13] i3c: master: Support ACPI enumeration of child
 devices
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260409105747.48158-5-akhilrajeev@nvidia.com>
References: <20260409105747.48158-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 11:43:11 +0000
Message-Id: <20260409114312.7B44FC4CEF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] Multiple `I2cSerialBus` resources in an ACPI device cause resource=
 overwrite and flag accumulation.
- [High] I3C master bus registration aborts completely if an unrelated ACPI=
 child node is encountered.
--

commit 7f83af82c694a0667ad1907d9e9d179bdad37ecb
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Support ACPI enumeration of child devices

This commit adds support for enumerating I3C and I2C child devices of an I3C
master controller via ACPI. It extracts static addresses, LVR, and PID
information from ACPI resources instead of relying exclusively on Device Tr=
ee
properties.

[ ... ]

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5e0e926f61f3d..08d0fcabd6f10 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -2403,6 +2404,53 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
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

If an ACPI device defines multiple I2cSerialBus resources, will this callba=
ck
overwrite boardinfo->base.addr and lvr with the values from the last parsed
resource?

Also, since boardinfo->base.flags uses a bitwise OR without clearing, if any
of the parsed resources are 10-bit but the final one is 7-bit, could the fi=
nal
device be registered with a 7-bit address but with the 10-bit flag incorrec=
tly
set?

[ ... ]

> @@ -2526,7 +2639,13 @@ static int fwnode_populate_i3c_bus(struct i3c_mast=
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

If the ACPI child node happens to be a non-device companion node (like a
PowerResource or thermal zone) lacking an _ADR method and an I2cSerialBus
resource, i3c_master_add_acpi_dev() will return -ENODEV.

Will returning an error here cause the entire I3C master controller bus
registration to abort just because of an unrelated companion node in the
ACPI namespace?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409105747.4815=
8-1-akhilrajeev@nvidia.com?part=3D4
