Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E52C11F9;
	Fri, 19 Jun 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862372; cv=none; b=ojU582jZnxktQWq2q35YsaMV0dCIGJJN9Djvcxo5Yky+BFRm6tk/Qa5s2zPe4+2KcSLP5hpX4ZWD6g+6okPGiHBZRlvjJPFIbO03BJwYgLl2EoLs06l2zD0GwVt04//7kXEi1bsRMgb7QJmQFT6TW4V/PBv5SmleiQcefdQ8gfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862372; c=relaxed/simple;
	bh=WZajdgffR6G7RhVh2pSANB6xHRwJLUx0qj0fmaFCS/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ToOQ0Dkl13IsLuYt7Vs9cxvasKFS/HCupI1qocP7R/hO0jE5wEAUcFMpuIWX4osfmfr1JF3L8EG+5MhDLTcsnvp6w238qLpRx4TPEZrj1Tc9vt3wU3SZbdcR7FbcB7pHhDHrkRBpIzMzTZ0fD+f50LO53vyaOHV/EmZpiU4SbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n//g08HV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n//g08HV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8167A1F000E9;
	Fri, 19 Jun 2026 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781862368;
	bh=r6vlm7miECol73NfoJOubyCBbQNVJsbfn82mBnUCbE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n//g08HVP/XG6zVPncPbpp6s8WCQUX+nrdOj2KG26+x/WwXKed8N/pdICpapZwBZA
	 06UP+dk6oV7xRrLrfCzQUwWjDR/L/NnwG2GuDDlVKXiGX0Y/F7p+lt505g6W2jn7VK
	 5mRqNAVv/YLuqRBJW3Nlai4msjN1n7kLmxc/1WPDYZRVOQHWt1yqEIN2qGH5eGtmw1
	 jLQXjq2SCUSCAGzLA/gg10guhFhiIOipLiXsUJIf+iW4FMA/MOHnszSERlnZKWIjsQ
	 Ex4VCjRazXkIv4fCounkcltxtr8dLmLu5MjQVdqqZpTCzBzCxuPv0vrK+pVu1l79SH
	 Zx0OhvYvTpzxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: hwmon: add Altera Stratix 10 hardware
 monitor binding
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <ac5a118394e96f707823463fedd32b6a484c1ceb.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <ac5a118394e96f707823463fedd32b6a484c1ceb.1781861409.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 09:46:08 +0000
Message-Id: <20260619094608.8167A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The pattern property `^input(@[0-9a-f]+)?$` allows child nodes w=
ith a `reg` property to omit the unit-address, violating Devicetree specifi=
cations.
- [Medium] The `reg` property in the child input nodes is missing `maxItems=
: 1`, allowing multiple register entries.
- [Low] The MAINTAINERS file entries are not sorted alphabetically.
- [Low] The Signed-off-by chain does not match the patch authorship.
--

commit d11da1e6aa7b26667b6a632670fdfdcc9fd27dee
Author: Tze Yee Ng <tze.yee.ng@altera.com>

dt-bindings: hwmon: add Altera Stratix 10 hardware monitor binding

This commit documents the device tree binding for the Altera Stratix 10
SoC FPGA hardware monitor. It adds bindings for temperature and voltage
sensor nodes.

> Author: Tze Yee Ng <tze.yee.ng@altera.com>
> Date:   Fri Jun 19 09:38:52 2026 +0000
>=20
>     dt-bindings: hwmon: add Altera Stratix 10 hardware monitor binding
>    =20
>     Document the device tree binding for the Altera Stratix 10 SoC FPGA
>     hardware monitor, including temperature and voltage sensor nodes.
>    =20
>     Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@alter=
a.com>
>     Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

[Severity: Low]
The commit author is Tze Yee Ng, but the first Signed-off-by tag belongs
to Nazim Amirul.

According to the patch submission guidelines, the primary author must be
the first person to sign off on the patch.

Should the authorship be corrected with a From: line in the commit message
body, or should the Signed-off-by order be fixed?

> diff --git a/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon=
.yaml b/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
> new file mode 100644
> index 0000000000000..5bd98660ee7b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml

[ ... ]

> +  temperature:
> +    description:
> +      The temperature node specifies mappings of temperature sensor diod=
es on
> +      the Stratix 10 SoC FPGA main die and tile die.
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +    patternProperties:
> +      "^input(@[0-9a-f]+)?$":

[Severity: Medium]
The Devicetree specification requires that if a node has a reg property,
its name must include a unit-address matching the first address in reg.

The regex ^input(@[0-9a-f]+)?$ makes the unit-address optional, which
allows dt-validate to pass syntactically invalid device trees.

Could this be updated to require the unit-address when a reg property
is present?

> +        description:
> +          The input node specifies each individual temperature sensor.
> +        type: object
> +        properties:
> +          reg:
> +            description:

[Severity: Medium]
The reg property in the child input nodes is missing maxItems: 1.

Because dt-schema treats reg as an array of arrays, omitting this allows
a device tree to specify an arbitrary number of register pairs, which
would erroneously pass schema validation.

Should maxItems be added here to restrict it to a single entry?

[ ... ]

> +  voltage:
> +    description:
> +      The voltage node specifies mappings of voltage sensors on the Stra=
tix 10
> +      SoC FPGA analog to digital converter of the Secure Device Manager =
(SDM).
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +    patternProperties:
> +      "^input(@[0-9a-f]+)?$":

[Severity: Medium]
Similar to the temperature node, this regex makes the unit-address optional.

Does this pattern allow child nodes with a reg property to omit the
unit-address, violating Devicetree specifications?

> +        description:
> +          The input node specifies each individual voltage sensor.
> +        type: object
> +        properties:
> +          reg:
> +            description:

[Severity: Medium]
The reg property here is also missing maxItems: 1.

Can we add a maximum item constraint to ensure multiple register entries
are not allowed for voltage sensors?

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcd09e02337b8..5a07cefe3aeee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -938,6 +938,13 @@ ALPS PS/2 TOUCHPAD DRIVER
>  R:	Pali Roh=C3=A1r <pali@kernel.org>
>  F:	drivers/input/mouse/alps.*
> =20
> +ALTERA STRATIX 10 SoC FPGA HWMON DRIVER
> +M:	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> +M:	Tze Yee Ng <tze.yee.ng@altera.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
> +
>  ALTERA MAILBOX DRIVER

[Severity: Low]
The MAINTAINERS file entries are typically sorted alphabetically to
maintain organization and avoid merge conflicts.

Here, ALTERA STRATIX 10 SoC FPGA HWMON DRIVER is placed before
ALTERA MAILBOX DRIVER.

Should this block be moved further down to maintain alphabetical order?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781861409.gi=
t.tze.yee.ng@altera.com?part=3D1
