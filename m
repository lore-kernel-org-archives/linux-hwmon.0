Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1439B946;
	Tue, 19 May 2026 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178182; cv=none; b=JCKtKj9aRIaIWcm8fwSi8GTCaTvhfxZQQegXLi6T9oqwqjTCKYUDhugt0em2JAzpwqlz30ze+6LHavbipL2sYGd9YICMByxvjPxawtprffzVpNhDrwReHbJB/3MEvQYU+LZv88UBsmhNamZ5GGdQdER1qCbfVOF3PIZaTrJsqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178182; c=relaxed/simple;
	bh=1z0llbB/5MqtIw5ayrIuuamzLbbMx2Z9ClWX/iI01wE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DkAyoUY5VIfBUl8QRydNyKp8Ffw6mJemPrBM2pCaCgBOGIuFxsPqbhLiNFRCVGTEAt5JsjojzikHCl3JuqQ85WX9Q0qXs0GxMxVDdatBBofO20iK+G+98Gqkn/BtOnX30u0ARCeanrqvi4NPA2NOcTfvzeqjzNeBlkiS2cODo28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0GqzFDa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0GqzFDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E303C2BCB3;
	Tue, 19 May 2026 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178182;
	bh=1z0llbB/5MqtIw5ayrIuuamzLbbMx2Z9ClWX/iI01wE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U0GqzFDaAHF4SV+6AoryrTMx4VDaJcodtR7HsUVCl5G4DiL8GbaNl+yMrGXR3Hlbe
	 7wD3bOl5yemVuIDUXlT5IpLdbQAbo+AOy3TapFJzK8iOTDovB9KMsPg+bfOTr/nKqt
	 YcaELomtNj4bGvM0kPc7we3dZrmBSDjkLDuYfmH7RE9GqT/ln6yVR+qaGuY/k6Kq8u
	 dWGAZFDUhSm1nWTYOyWYcbyRH5+kdL+8pLmKx7Pm6uhVa9YQqxf0gY46KBCSeI3+FG
	 uRYf8oTrTFqupJlX9qcLBIi2JrB2ugdUe2o6rCrLdzt49y5RxGejmJfO/Ah6lyJwn0
	 Ga6OpoAEhNVsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519075558.91466-2-Ashish.Yadav@infineon.com>
References: <20260519075558.91466-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:09:40 +0000
Message-Id: <20260519080941.7E303C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The device tree example node is named `hwmon@11`, which uses a Linu=
x-specific subsystem name instead of a generic hardware function name.
- [Low] The new device tree binding `infineon,xdp730.yaml` unnecessarily du=
plicates the schema of the existing `infineon,xdp720.yaml`.
--

commit e021e1d189da7e8470a3c273fdd6ec12f7ed6280
Author: Ashish Yadav <ashish.yadav@infineon.com>

dt-bindings: hwmon/pmbus: Add Infineon XDP730

Add documentation for the device tree binding of the XDP730 eFuse.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp73=
0.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
> new file mode 100644
> index 0000000000000..a7361a07891c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp730.yaml#

Does this file needlessly duplicate the existing infineon,xdp720.yaml schem=
a?

The properties, required fields, and constraints here appear identical
to infineon,xdp720.yaml. Creating duplicate YAML schema files for
devices in the same hardware family with identical constraints can
fragment the schemas.

Could the infineon,xdp730 compatible string be added to the enum in the
existing schema file instead?

[ ... ]

> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hwmon@11 {

This isn't a bug, but does this node name follow the Devicetree
specification for generic names?

The spec requires node names to reflect the hardware function
(like efuse@11 or sensor@11), rather than pointing to a specific
OS subsystem like hwmon.

> +            compatible =3D "infineon,xdp730";
> +            reg =3D <0x11>;
> +            vdd-vin-supply =3D <&vdd_vin>;
> +            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm */
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519075558.9146=
6-1-Ashish.Yadav@infineon.com?part=3D1
