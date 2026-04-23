Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408C37E2EA
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776974915; cv=none; b=BlxkssvKj/bFvdAH8eami2AjBrh+h+uKNI9glP6E8kOtnC7eOj3Row6HNzr2dUgO2T3tf391vn6NEChORCPJg0r3mZt00EKVf+2PnSgB3/eI2b9sg7rO4crYaHGtu/mkc4fqvDCspSTm7z1HDjIL2n8soDNOMBmcYmsFDg9QEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776974915; c=relaxed/simple;
	bh=qE0kCVgkjyAHf/5FnVzn0PO5pkqwk5qBx12D03j0gr8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AKbbyKfQRKP2m8j1tlecvjaBYkLyjeH3Khg5tNyxBlRyPZE5pji9FvlA8kHW30Hi1EExDTM+02bEAICFq+J0O1G/80xyTnSptMIoqz/VQkCVbdr7z4DaSVsHR0wEtXSsxQYY8Bfb8Mza7oiFuVFvM/NlrJZ5LzTEBGQf5VBxmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7O0B8Pl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7O0B8Pl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A10FC2BCAF;
	Thu, 23 Apr 2026 20:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776974915;
	bh=qE0kCVgkjyAHf/5FnVzn0PO5pkqwk5qBx12D03j0gr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=g7O0B8PlixjoYguanOranVS1B5UJ9JtH7q2FSv9F9o/tG6ZF7+sWfocWCMKJRPqJm
	 vYV0ccIc+ZLdP1O52+lhrilDhAkgBeNbWx6AwC/iMKUADOdpYtZvpq7cQnjlJXHfzK
	 2rUdTdCfiu+CG2sOklL/3qvNb4pveOCRwZFG+bHfvcb3fAAiU9YER8XAli64FZiA1U
	 hKSCkApXCMuslNrGMnFcPvPIpHzXjsTJLdTCIOYSkiZA3c5s5okCgjVmzW1+YwEvv+
	 4xLoX7+a5wEEd6TQkB+qw0q+uqqD+DufQvFTbKm6Wp1vrsDv+fYhJ7+YZ05PxjPKMo
	 MQXI9TPlQvjJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/13] i3c: master: Use unified device property
 interface
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-4-akhilrajeev@nvidia.com>
References: <20260423085718.70762-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 20:08:34 +0000
Message-Id: <20260423200835.5A10FC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [Critical] Dangling fwnode pointer in boardinfo leading to Use-After-Free=
 on device hot-plug.
- [High] Master registration fails on ACPI systems due to mandatory OF-spec=
ific property checks.
--

commit bc7c2a6c59d2e2a9a674fb4e8a851cbc8852b1e2
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Use unified device property interface

This commit replaces OF-specific functions with unified device property
functions to serve as a prerequisite for supporting both ACPI and device
tree.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5cd4e5da22333..d0677061faab4 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -993,7 +995,7 @@ static void i3c_device_release(struct device *dev)
> =20
>  	WARN_ON(i3cdev->desc);
> =20
> -	of_node_put(i3cdev->dev.of_node);
> +	fwnode_handle_put(dev->fwnode);
>  	kfree(i3cdev);
>  }
> =20
[ ... ]
> @@ -1789,7 +1791,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_=
controller *master)
>  			     desc->info.pid);
> =20
>  		if (desc->boardinfo)
> -			desc->dev->dev.of_node =3D desc->boardinfo->of_node;
> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);

Can this result in a use-after-free if a device is hot-unplugged and later
re-registered?

Since device_set_node() does not increment the fwnode reference count, the
device shares the reference owned by boardinfo.

During device unregistration, i3c_device_release() unconditionally calls
fwnode_handle_put(dev->fwnode), dropping that single reference.

If the device is subsequently hot-plugged, will the cached boardinfo reuse
the now-freed fwnode pointer? Would it be safer to acquire a new reference
when setting the device node, like fwnode_handle_get(desc->boardinfo->fwnod=
e)?

[ ... ]
> @@ -2499,7 +2505,7 @@ static int of_i3c_master_add_dev(struct i3c_master_=
controller *master,
>  	if (!master)
>  		return -EINVAL;
> =20
> -	ret =3D of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
> +	ret =3D fwnode_property_read_u32_array(fwnode, "reg", reg, ARRAY_SIZE(r=
eg));
>  	if (ret)
>  		return ret;

Does this cause master registration to fail on ACPI systems?

Previously, of_populate_i3c_bus() safely ignored ACPI systems because
dev->of_node was NULL. Now, fwnode_populate_i3c_bus() retrieves the ACPI
fwnode and iterates through its child devices.

For each child, this unconditionally attempts to read the OF-specific reg
property. Since ACPI defines resources via _CRS and _ADR rather than a
reg array, this read will fail and return an error.

This error then propagates up and aborts the entire i3c_master_register()
process. I noticed this regression is fixed later in the patch series by
commit e979566482d52 (i3c: master: Support ACPI enumeration of child
devices), but I am pointing it out here as it temporarily breaks
bisectability for ACPI platforms.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D3
