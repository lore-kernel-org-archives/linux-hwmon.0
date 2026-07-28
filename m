Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E33CCFB0;
	Tue, 28 Jul 2026 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223276; cv=none; b=DEegxRNkr4SJIN12d4uhIGy4ZdmK1bZPzpNJF5STCr2u4ARwJHk9a3NO4iqS40+WeJ8ge5tR8kg98C/4DtFYqwCE6ys1HVmo5nvUxK8Bah7kE/RI3bf2BNa5LemQE09b/Ogi83ct6cDMwEOqU/NWIxroLX0B91MxAm4qeqmxbp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223276; c=relaxed/simple;
	bh=XE9KkB63Bzskmyt6gocPnAHUhuBNXcx6e9sXumRM3/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l/eryEf2B8pFWsFBCXeTDLMqxBFvmULVCiIqmQqmwQbwlI9IWIsWK1acbaPyMaSdRvHG3t4iXC4ml17kbG9x/NtJHOW/yxEZOoHliu1Ayj9iM0EwFMVywEL9iRPSYlEL2QvnIkasd2T+ETVxa8HWF/+mQYs3MdHuARef8gccnhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJoFPbXV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJoFPbXV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681291F00A3E;
	Tue, 28 Jul 2026 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223274;
	bh=UD5FqAxnnxRG4tcCSNqXjm9MFcKqT5tXqiu7CaHZXKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJoFPbXVQx3rFb0DJ0kYgdtQ6k1Nw3od+8t802qXwqBmn37nGEn/usUuoJKVgnmRc
	 KJshjPwSSINMBuHxOp5sVCTpdbZGSuqHefsXSp/3o8tvOKBY8aRE6Qn7n/OtuZ5OoE
	 J+Yh4DQfAR5+4xudyX/oobpBGxEYBquoyRh/daKx0sdmLj6GG3Nkgj382bFtN4NufL
	 Sk4KyFSxNgI9khZC1stz0NuNogxleADXhY09/SBt0r77MddD8Cc+eadDbhEP5rS1To
	 dVuY9+v4oNehTMY5hsq33XRvCmW6Fpt10FugCmwXseiy3/33QU4C8FGzFLGetNP30O
	 Vxj7DjgmpZr2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/12] i3c: master: Use unified device property
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260728065955.809445-3-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:21:14 +0000
Message-Id: <20260728072114.681291F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Probing of I3C master controllers fails on ACPI platforms if they =
have child nodes.

Pre-existing issues:
- [High] Dangling pointer left in desc->dev upon device_register() failure =
leads to Use-After-Free and Double Free on teardown.
--

--- Patch [2]: [PATCH v7 02/12] i3c: master: Use unified device property in=
terface ---
commit 67a3b30ddd40ca8910b28ac5cd83aad57174f7e8
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Use unified device property interface

Replace all OF-specific functions with unified device property functions
as a prerequisite to support both ACPI and device tree.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca1..4b3d9628bc39b 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1928,7 +1930,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_=
controller *master)
>  			     desc->info.pid);
> =20
>  		if (desc->boardinfo)
> -			desc->dev->dev.of_node =3D desc->boardinfo->of_node;
> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
> =20
>  		ret =3D device_register(&desc->dev->dev);
>  		if (ret) {

[Severity: High]
This is a pre-existing issue, but it appears desc->dev is left pointing to
a freed device if device_register() fails. When put_device() frees the
underlying struct i3c_device (via i3c_device_release()), desc->dev isn't
set to NULL.

Later, if i3c_master_unregister_i3c_devs() runs during teardown, could this
lead to a use-after-free and double-free?

i3c_master_unregister_i3c_devs() {
    ...
    i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
        if (!i3cdev->dev)
            continue;

        i3cdev->dev->desc =3D NULL;
        if (device_is_registered(&i3cdev->dev->dev))
            ...
        else
            put_device(&i3cdev->dev->dev);
    }
}

[ ... ]

> -static int of_i3c_master_add_dev(struct i3c_master_controller *master,
> -				 struct device_node *node)
> +static int i3c_master_add_dev(struct i3c_master_controller *master,
> +			      struct fwnode_handle *fwnode)
>  {
>  	u32 reg[3];
>  	int ret;
> =20
>  	if (!master)
>  		return -EINVAL;
> =20
> -	ret =3D of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
> +	ret =3D fwnode_property_read_u32_array(fwnode, "reg", reg, ARRAY_SIZE(r=
eg));
>  	if (ret)
>  		return ret;

[Severity: High]
Since this function is now called for ACPI child nodes via
fwnode_populate_i3c_bus(), will this cause I3C master probe to fail on ACPI
systems?

ACPI nodes typically use _ADR or _CRS instead of a "reg" property. If "reg"
is missing, fwnode_property_read_u32_array() returns an error, which
propagates up and causes the entire master registration to abort.

Before this patch, the loop in of_populate_i3c_bus() was skipped completely
on ACPI systems because dev->of_node was NULL.

> =20
>  	/*
>  	 * The manufacturer ID can't be 0. If that's the case, we're
>  	 * dealing with an I2C device.
>  	 */
>  	if (!reg[1])

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D2
