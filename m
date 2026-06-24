Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320E29D29F;
	Wed, 24 Jun 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782298114; cv=none; b=INeFFTT3FrWlA907Inqe3LUBQ08fbmvm4AWxRsxkczGrCdwrtHS8vuRRGNUNWpkeimDz6MKXLisHhQUeJT8Wl62fMGuDL2MF691wvEHwxmzXBQv6Uru7Shs1V5AroQkAemZB4vaXXbztHG2iH+/kSt2tgjDmbiU+L4VUPprG/h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782298114; c=relaxed/simple;
	bh=NZzkqv0kR6ZYOCrdymwr4b8a4Iysy+jKFdmh4+Ib62g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ErCRNr7AbRmwO+inC1PFdaTinEalKXyX+FC86dAWn53ydxU9Ixb9aTMxR8WZe2EGF+NR9lxkxaPzwnfNrUXgx3S9oBGhYZuo0JVoYigNYLQhVhlIT297KR3L2bo2SDPkEoiCM8Uh4wFcXdHTmycc6GNizeQ2YGnBah5d/PJGvU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VW5xipDv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VW5xipDv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2241F000E9;
	Wed, 24 Jun 2026 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782298112;
	bh=1pSfilZOpgczgI3MMALVqKge1TLKEkbDSBwSHoxbtS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VW5xipDvj3DPfkKfLWwVclujeDCRlsC7Pknuh+cAKuMQ0GR24c/XJBCODhFcuXPs2
	 IaIygPEm0PAmuDfLPWBVMns2r67wJqgUFYtrj22wvGj/uUcwlevVN8zwLg17dOfZcq
	 Ob8k3X6p+ruMCaN4+0wXnx5Vz0BliHc9vdpicVR6Y6qjcNx8ZhMhYJKSB6ugePZLlC
	 /ydzDEJWtAdaK0GgXZ3ywxSUYBlhddExSdFmU0xJziMlzhScy7HQkscvT8k8UjebQz
	 8jnfYQMotmtJsahoiaMbuRzuEs7Oycve8aJ+MohON6zFLFwki5cmxbSQbdysn6bTkq
	 w2uDXTwGntiBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/12] i3c: master: Use unified device property
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260624102153.1770072-3-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:48:31 +0000
Message-Id: <20260624104832.4A2241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Fwnode references acquired for I2C and I3C boardinfo entries are p=
ermanently leaked.

Pre-existing issues:
- [High] Dangling `desc->dev` pointer causes Use-After-Free and Double Free=
 when device registration fails.
--

commit cf59bb0f706cf267c9ca158815835766a81fc214
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Use unified device property interface

Replace all OF-specific functions with unified device property functions
as a prerequisite to support both ACPI and device tree.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca1..b20f56f7b68e8 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1928,7 +1930,8 @@ i3c_master_register_new_i3c_devs(struct i3c_master_=
controller *master)
>  			     desc->info.pid);
> =20
>  		if (desc->boardinfo)
> -			desc->dev->dev.of_node =3D desc->boardinfo->of_node;
> +			device_set_node(&desc->dev->dev,
> +					fwnode_handle_get(desc->boardinfo->fwnode));

[Severity: High]
Does this take an extra reference to the fwnode that ends up leaking?

The original code simply assigned the pointer, but the new code calls
fwnode_handle_get(), acquiring an additional reference. When the device is
subsequently released via i3c_device_release(), it will drop this second
reference.

Since the original reference stored in desc->boardinfo->fwnode does not app=
ear
to be dropped during master teardown, does this cause the initial reference=
 to
permanently leak on the normal success path?

>  		ret =3D device_register(&desc->dev->dev);
>  		if (ret) {

[Severity: High]
This isn't a bug introduced by this patch, but does this error path leave a
dangling pointer in desc->dev?

If device_register() fails, put_device(&desc->dev->dev) is called, which dr=
ops
the reference count to 0 and invokes i3c_device_release(). The release
function frees desc->dev (the i3cdev structure). However, desc->dev is not =
set
to NULL.

Later, when i3c_master_unregister_i3c_devs() iterates through the bus,
it will dereference the dangling pointer:

drivers/i3c/master.c:i3c_master_unregister_i3c_devs() {
    ...
    i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
        if (!i3cdev->dev)
            continue;

        i3cdev->dev->desc =3D NULL;
        if (device_is_registered(&i3cdev->dev->dev))
            device_unregister(&i3cdev->dev->dev);
        else
            put_device(&i3cdev->dev->dev);
        i3cdev->dev =3D NULL;
    }
    ...
}

Could this lead to a use-after-free and double-free when it evaluates
i3cdev->dev and attempts to call put_device() again?

[ ... ]

> @@ -2649,14 +2656,14 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master=
_controller *master,
>  	boardinfo->lvr =3D reg[2];
> =20
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
> -	of_node_get(node);
> +	fwnode_handle_get(fwnode);
> =20
>  	return 0;
>  }

[Severity: High]
Does this code leak the fwnode reference?

The fwnode_handle_get(fwnode) call increments the reference count, but the
resulting reference is neither stored in boardinfo nor dropped before the
function returns. This appears to leak the reference immediately on the
success path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D2
