Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F01439012;
	Tue, 16 Jun 2026 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604916; cv=none; b=qAHbnzSbCSqJkvs2I2zfdxkDBPnL5Bd9TyRwyfok7cdgZtfX8p56UdhI4Vtql7h0lvLO/DFYN0FAq4ynSqhYk0WAjrIR7ZGnTWD3Xwt6bjz6ADB1MohW6cGMy86boszCLsJtmLeCVMuDW14zJzccL1+KdY6abeG4lhjpaZHkABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604916; c=relaxed/simple;
	bh=jVxZqG++GBxKXDZyzha0onjzrScxFqTXLKfQwpV07wc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uY72Zm8vpEL238DlYp7sMDWnmMMsNPZpQTvo05Eb8Dm4QmniG4RgHI6iTX77QvbeEmNuja5kpzw85ymKHQaIlry4HDQkTjOLsRA3L8CTbI8mPgjq6q3Ir2+mUliwwjsh1HsHFg1F9yjwyDk45bhpvzPm3QmMh8VOZ0KcUoeeWy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDjoQv1d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDjoQv1d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CA61F000E9;
	Tue, 16 Jun 2026 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604915;
	bh=I6LjlW3vrOnGbGuc+NHtPE5P8Pt2pMpEkhpCgCmbOWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDjoQv1dL7ZDzjQg4glK7MurOirFHj0rwuJHJvtG+o6UxXPQR4AbOf+3E3idLd60v
	 wccYOaYS5pD5CQ0vPExbCO2RnNj924+c18fkBJbsJUjL8ozv71DeX/r5M+W/d83Bdy
	 ibcq+d0mmQk65AcWw4fnL3TGFWCUpvAXau6g4GeohWbm4KCzENox7V9k59JJqrrkPF
	 ZI4uiJvacbj1sG4jrcSIX4wQyLLISIWtP1TWkdOmK459bLd4jbjysiN52RNUGnmH96
	 cjRRnzDU4SqOoMXbZ7821rq7J7abd4ZA+kVi4zb9bNiICJhQbtnSfNo4vhg2kXsdns
	 Lbp9I67e/bH3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/12] i3c: master: Support ACPI enumeration of child
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260616095429.3947205-4-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:15:14 +0000
Message-Id: <20260616101515.34CA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] devm_kzalloc allocated 'boardinfo' is leaked for every ACPI chil=
d node that is ignored because it lacks I2C/I3C resources.
--

commit 9a388c2056a553d628ce4b8b623a812d4aa08951
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Support ACPI enumeration of child devices

This commit adds support for describing I3C and I2C devices via ACPI tables,
rather than relying solely on the device tree reg property. It implements
reading _ADR and LVR properties from ACPI resources to retrieve the static
address and other device properties.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3b19a5e8f46d0..f0e05bcac26da 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -2708,6 +2762,74 @@ static int i3c_master_add_dev(struct i3c_master_co=
ntroller *master,
>  	return ret;
>  }
> =20
> +#ifdef CONFIG_ACPI
> +static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
> +				   struct fwnode_handle *fwnode)
> +{
> +	struct acpi_device *adev =3D to_acpi_device_node(fwnode);
> +	acpi_bus_address adr;
> +	u32 reg[3] =3D { 0 };
> +	int ret;
> +
> +	/*
> +	 * If the ACPI table entry has _ADR method, it's an I3C device.
> +	 * Otherwise it may be an I2C device described by an I2cSerialBus
> +	 * resource. If no I2cSerialBus resource is found, ignore the entry.
> +	 */
> +	if (!acpi_has_method(adev->handle, "_ADR")) {
> +		ret =3D i3c_master_add_i2c_boardinfo(master, fwnode, reg);
> +		if (ret =3D=3D -ENODEV)
> +			return 0;

[Severity: Medium]
Does this leak the boardinfo allocated in i3c_master_add_i2c_boardinfo()?

If an ACPI child lacks an _ADR method, i3c_master_add_i2c_boardinfo()
unconditionally allocates boardinfo using devm_kzalloc().

If the node also lacks an I2cSerialBus resource, i3c_acpi_add_i2c_boardinfo=
()
returns -ENODEV. This causes i3c_master_add_i2c_boardinfo() to return -ENOD=
EV
without freeing the allocated boardinfo.

Because we catch -ENODEV here and return 0, the overall bus probe continues
and ultimately succeeds. This means the devres-allocated memory stays tied
to the master device, leaking sizeof(struct i2c_dev_boardinfo) for every
ignored ACPI child node.

> +
> +		return ret;
> +	}
> +
> +	adr =3D acpi_device_adr(adev);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D3
