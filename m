Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3406A3C0605
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733267; cv=none; b=cQx5B0/QLwuNToaZXlS+l8HmfBdOC/N2FILHxJkvqcjbTmDa1C7R9TRP3ESbtBMnoODie7WXI5MDly20rYvbrBoSC4mwbbJi/9Y0KZKR1WaJrqB3veHBsC2O2iTevdT2p6FVnfKKfvGXa5LyW19N1NBxZpvV/NBvJ9TMkj/sz/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733267; c=relaxed/simple;
	bh=kc4h3hRqC/HS7P7Z/lizMtYzsxXmCSn0MahdXD3K05w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q+Bk0I2y97yLyOZgkN+AGTHVnNXaW+LOir/l4NnYm+MJ+nRMdEnXsEbkxQzy9Xrh0hZpVOdIgbTLCU+JXwXaYRhIM2n0mc8Usrd2STfbDV8CtrSpaclb4LCMnPxms2/Se0aWKzWJ6sp86ycmWy4M+Zb3F6QaNWA7FBW1PMnaEuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBOLEUDo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBOLEUDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9944C4CEF7;
	Thu,  9 Apr 2026 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775733266;
	bh=kc4h3hRqC/HS7P7Z/lizMtYzsxXmCSn0MahdXD3K05w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KBOLEUDoCXbZFf9LCTOoc+GwGF4SDkft1s433SKCK9W8mzg85j1N0D5RealyAkvvV
	 tiXLAtJ+CBKuXxLZ8WMOY6C4apAN8OVaoSBFztZfyQqeaej9mUrlh3BkSNzmoCLJ/l
	 9mrw0bHWRx+TyQCf35o17EZ/5yAl7YnCLU4SliJlDKQrGJa9glOXrXLajjGCQqcOgO
	 aL7444IJB/Lu4VZH62vt6s0eR5h6vzQjYxriT2ybVmwLRvgnK1xSElwXCcjxWFu9KM
	 UMdzZia3CQvUAGSaX+axQt012wxJHaIKmMUl9LwlbrwUiqFt8/PHZXQvJKIfe7VCI+
	 3kGCFNdMVqfSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260409105747.48158-2-akhilrajeev@nvidia.com>
References: <20260409105747.48158-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 11:14:26 +0000
Message-Id: <20260409111426.A9944C4CEF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Medium] The `minimum: 0x1` constraint prevents setting the bitmap to 0, =
which is required to indicate that a device does not support any static ass=
ignment methods.
--

commit 5ee586d2db5968f1eb0c491d74258e50f54fd66a
Author: Akhil R <akhilrajeev@nvidia.com>

dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA

This commit adds the mipi-i3c-static-method property to specify the discove=
ry
methods supported by an I3C device during bus initialization. The property =
is
a bitmap that defaults to 1 (SETDASA) if not present.

Link: https://www.mipi.org/mipi-disco-for-i3c-download

> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentati=
on/devicetree/bindings/i3c/i3c.yaml
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
[ ... ]
> @@ -147,6 +149,26 @@ patternProperties:
>            through SETDASA. If static address is not present, this addres=
s is assigned
>            through SETNEWDA after assigning a temporary address via ENTDA=
A.
> =20
> +      mipi-i3c-static-method:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0x1

Does this minimum constraint prevent setting the bitmap to 0?

The property description states that a bit value of 0 indicates a lack of
support for a given method. Because the schema defaults to 1 (SETDASA) when
the property is absent, an I3C target that has a static address but does
not support any static methods must explicitly set this to 0 to override
the default. The current constraint appears to reject a value of 0, which
would cause validation to fail for such configurations.

> +        maximum: 0xff
> +        default: 1
> +        description: |
> +          Bitmap describing which methods of Dynamic Address Assignment =
from a
> +          static address are supported by this I3C Target. A bit value o=
f 1
> +          indicates support for that method, and 0 indicates lack of sup=
port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409105747.4815=
8-1-akhilrajeev@nvidia.com?part=3D1
