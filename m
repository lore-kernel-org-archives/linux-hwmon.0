Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B6D428828;
	Tue, 16 Jun 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605030; cv=none; b=D1IGd5PAf00YdXwszaVJEqS3ltgDZpXHbxKhyKZODBMLLU5y66lKOLOcjWkxy5QppbUZFjTMjBG8R+2dZv9wANWj3mhOQtUZEVfJX6qyVH/tsvlC9cCUQeheDQRNYG4DzM/zCTxf4ypBCFIrf6MM63jEGaBASmUCDcBITugBc4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605030; c=relaxed/simple;
	bh=3G1b1u1mhyqIsPwQuBGQ0BRkQlCXxKVSs3nG/7kw2cg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UWA9KJ5LROGkbDdI0EgoofbdOZyuMHmUaxNlMl7nW+R4T5JUD5BZxPnWbsOiJAG7LY/PtLMH+lqX0OLhRoiKwSLNu5Sb0EypAdS9AdR63y8aQWKgUxiI4Qh4hgu301tnFaU+UJPXav1VosaYKYSvgokXrq8nHvwlCNcQpmzBrGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSLKqiCR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSLKqiCR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2BD1F000E9;
	Tue, 16 Jun 2026 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781605029;
	bh=EKmMWJCcYI6rOjOLTtJx1zGlMKl2tGx/GPxF/7QCcCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WSLKqiCRyOrS+TzBfjgTLfPE3Fmg/xqAYhJLw0KJpA6wXkmYrMhTFDN2bnE0B25Y4
	 LZ8rcimc4AsHbFCwWSKR7By8PBKkyw766gPNgeMYJraGOSnpUaG8D3flurJqjTHgKi
	 eAHUh/wdTME8WkjuBUhxTtVeT8rcuGb5AlrcU/59+CjsaicOCO2OmzAYF2nMS+QXKh
	 6YRdAoY2///IfsjDhDmaX2x7Kel75x0jFfgkCVr5s3hOerh1wl8JBOI7rf233SFqmy
	 nkm43YFZDc2iZim+p67YnvT34/bBbte+vB4vEHc0/fFP/j/glpKTRwUJQ1xWAOT6yw
	 r3oaVSJ9xadaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/12] i3c: master: Use unified device property
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260616095429.3947205-3-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:17:08 +0000
Message-Id: <20260616101709.1B2BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Permanent leak of firmware node references in I2C and I3C boardi=
nfo structures.

Pre-existing issues:
- [High] Dangling pointer `desc->dev` causes Use-After-Free on device unreg=
istration if device_register() fails.
--

commit 89419216775e33fb2b850943aa4a2781f19278a1
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Use unified device property interface

Replace all OF-specific functions with unified device property functions
as a prerequisite to support both ACPI and device tree.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 109aa50eb1f8f..3b19a5e8f46d0 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -1902,7 +1904,8 @@ i3c_master_register_new_i3c_devs(struct i3c_master_=
controller *master)
>  			     desc->info.pid);
> =20
>  		if (desc->boardinfo)
> -			desc->dev->dev.of_node =3D desc->boardinfo->of_node;
> +			device_set_node(&desc->dev->dev,
> +					fwnode_handle_get(desc->boardinfo->fwnode));
> =20
>  		ret =3D device_register(&desc->dev->dev);
>  		if (ret) {

[Severity: High]
This is a pre-existing issue, but can this error path cause a use-after-free
and double-free?

If device_register() fails, put_device() is called which frees the memory
backing desc->dev, but the desc->dev pointer is not set to NULL.

Later during cleanup, the dangling pointer bypasses the NULL check:

i3c_master_unregister_i3c_devs() {
    ...
    if (!i3cdev->dev)
        continue;

    i3cdev->dev->desc =3D NULL;
    ...
}

Does desc->dev need to be set to NULL after put_device() to prevent this?

[ ... ]
> @@ -2623,14 +2630,14 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master=
_controller *master,
>  	boardinfo->lvr =3D reg[2];
> =20
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
> -	of_node_get(node);
> +	fwnode_handle_get(fwnode);
> =20
>  	return 0;
>  }

[Severity: Medium]
Does this code leak the fwnode reference?

The result of fwnode_handle_get() is completely discarded. Since
i2c_new_client_device() separately takes and drops its own fwnode reference,
does this initial reference remain unreleased?

[ ... ]
> @@ -2670,14 +2677,14 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master=
_controller *master,
>  		return -EINVAL;
> =20
>  	boardinfo->init_dyn_addr =3D init_dyn_addr;
> -	boardinfo->of_node =3D of_node_get(node);
> +	boardinfo->fwnode =3D fwnode_handle_get(fwnode);
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
> =20
>  	return 0;
>  }

[Severity: Medium]
Does this also leak the fwnode reference?

The reference is acquired and stored in the devres-managed boardinfo
structure, but there seems to be no teardown logic for the master->boardinfo
lists to drop it before devres frees them.

As seen earlier in i3c_master_register_new_i3c_devs():

device_set_node(&desc->dev->dev, fwnode_handle_get(desc->boardinfo->fwnode)=
);

A second reference is taken there which is properly dropped by
i3c_device_release(), but does the first reference stored in
boardinfo->fwnode remain stranded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D2
