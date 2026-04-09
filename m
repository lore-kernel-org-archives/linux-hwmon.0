Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C43859CA
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735585; cv=none; b=KSlImQC/a9jOtpnJbIeEIFmiNuSyyBVsK3WvYrPH1NZj4ZqS+YGbbq26ay3/Rt8J2vR5Qu16nVy8pN54I1LpsHh6pSIyWsHSUPJ2x1cMaru0dFoo3GlVnAEJU9xtsB0VpglqMC3wh3DveURjCL9KGIN+dEYKr8f9Ae3XtnCa95w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735585; c=relaxed/simple;
	bh=mT493f2trWIm0tj/v0MOV/cMejbdoHEuNRwmAtvYdcw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qY9EF6lVkTqvA1AVKaL17RcrZE1zlhAqZoPv97AeKt78gfThHGByHUtRHRlVE66K0Yr45P5nuXcoBroHrVco+ci/bDTfDGAQ92cThwcV/1LXWYF6CJ/vXUE9RkNK86jq8cMjL7WgPMgAT8e6e1We2dOd8pZeNiO1r1jx7ZU1Uyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr/wwD92; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr/wwD92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0918CC4CEF7;
	Thu,  9 Apr 2026 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775735585;
	bh=mT493f2trWIm0tj/v0MOV/cMejbdoHEuNRwmAtvYdcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Hr/wwD92fwIDoIMstlvIG6nnpLCQfMX+I3JRLJzMc+GQlE/7uE0dHGdgftnfbNhha
	 qTBsSPeQWhC/Jjry7jq4HO+ctPYGXJSB+NRG5H0BvLTBIX4sIZ4n9T+hnpOpskCq0/
	 x129LyTdvOwf2zVP977IesiMuXxj7RRkc4poIJqUP8eRTQJ8pYDfgtnmUrNfzn+ibF
	 qCHZblXWR0nyVXj/3/KEI3R+wMVeC4rKcWIaN/TvQ78yswRD6+ZiF54M5jbCY/NKe5
	 jtPd3f+dufWeDkRg1Hnryi/Ry/rMlovmF0VW4fzLY8cMuq7xrgtDYh2EV/e3hn/38T
	 IIozcLxUnm8ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/13] i3c: master: Use unified device property
 interface
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260409105747.48158-4-akhilrajeev@nvidia.com>
References: <20260409105747.48158-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 11:53:04 +0000
Message-Id: <20260409115305.0918CC4CEF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] I3C master registration unconditionally fails on ACPI systems if c=
hild nodes are present, breaking existing ACPI support.
- [High] Failure during device registration leaves a dangling pointer in `d=
esc->dev`, leading to a Use-After-Free and Double Free during bus teardown.
- [High] Erroneous consumption of the `boardinfo` fwnode reference during d=
evice release causes a reference underflow and potential Use-After-Free.
--

commit 97e72c86c4ba51a8b484696ee0603781ab0f1651
Author: Akhil R <akhilrajeev@nvidia.com>
Subject: i3c: master: Use unified device property interface

This commit replaces OF-specific functions with unified device property
functions to prepare for supporting both ACPI and device tree.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -995,7 +997,7 @@ static void i3c_device_release(struct device *dev)
> =20
>  	WARN_ON(i3cdev->desc);
> =20
> -	of_node_put(i3cdev->dev.of_node);
> +	fwnode_handle_put(dev->fwnode);
>  	kfree(i3cdev);
>  }

[ ... ]

> @@ -1783,7 +1785,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_=
controller *master)
>  			     desc->info.pid);
> =20
>  		if (desc->boardinfo)
> -			desc->dev->dev.of_node =3D desc->boardinfo->of_node;
> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
> =20
>  		ret =3D device_register(&desc->dev->dev);
>  		if (ret) {

Will this cause a reference underflow on the boardinfo fwnode?

When the device is registered, device_set_node() assigns the fwnode without
taking an extra reference. If the device is released (for instance, in the
device_register error path shown above), i3c_device_release() calls
fwnode_handle_put(). This consumes the reference that is actually owned by
boardinfo.

If the device is later rediscovered via hot-join, it could match the same
boardinfo and use the freed fwnode, resulting in a use-after-free.

Additionally, does this error path leave a dangling pointer in desc->dev?

While this is a pre-existing issue, if device_register() fails, it calls
put_device() which triggers i3c_device_release() and frees desc->dev via
kfree(). However, desc->dev is not set to NULL. Later during teardown,
i3c_master_unregister_i3c_devs() might skip the !i3cdev->dev check, write
to the freed memory, and call put_device() again, causing a double-free.

[ ... ]

> @@ -2402,8 +2404,8 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
> =20
>  static int
> -of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
> -				struct device_node *node, u32 *reg)
> +i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
> +			     struct fwnode_handle *fwnode, u32 *reg)
>  {
>  	struct i2c_dev_boardinfo *boardinfo;
>  	struct device *dev =3D &master->dev;
> @@ -2413,9 +2415,13 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_=
controller *master,
>  	if (!boardinfo)
>  		return -ENOMEM;
> =20
> -	ret =3D of_i2c_get_board_info(dev, node, &boardinfo->base);
> -	if (ret)
> -		return ret;
> +	if (is_of_node(fwnode)) {
> +		ret =3D of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->bas=
e);
> +		if (ret)
> +			return ret;
> +	} else {
> +		return -EINVAL;
> +	}

[ ... ]

> -static int of_populate_i3c_bus(struct i3c_master_controller *master)
> +static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
>  {
>  	struct device *dev =3D &master->dev;
> -	struct device_node *i3cbus_np =3D dev->of_node;
> +	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>  	int ret;
>  	u32 val;
> =20
> -	if (!i3cbus_np)
> +	if (!fwnode)
>  		return 0;
> =20
> -	for_each_available_child_of_node_scoped(i3cbus_np, node) {
> -		ret =3D of_i3c_master_add_dev(master, node);
> +	fwnode_for_each_available_child_node_scoped(fwnode, child) {
> +		ret =3D i3c_master_add_dev(master, child);
>  		if (ret)
>  			return ret;
>  	}

Does this change break I3C master registration on ACPI systems?

Previously, of_populate_i3c_bus() would return 0 on ACPI platforms because
dev->of_node was NULL. Now, fwnode_populate_i3c_bus() unconditionally
iterates over all ACPI child nodes.

Since i3c_master_add_dev() expects a device tree style reg property (which
ACPI nodes typically lack in favor of _CRS or _ADR), reading it may fail.
Additionally, if a child is identified as an I2C device, the new
i3c_master_add_i2c_boardinfo() explicitly returns -EINVAL for non-OF nodes.

These errors will propagate up and completely abort i3c_master_register().
Even if ACPI support is fixed in a subsequent commit, could this intermedia=
te
patch break bisectability by causing the controller to fail probing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409105747.4815=
8-1-akhilrajeev@nvidia.com?part=3D3
