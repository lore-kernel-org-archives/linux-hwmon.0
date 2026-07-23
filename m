Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C818397E85;
	Thu, 23 Jul 2026 21:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840780; cv=none; b=Z94oVByXyFnsUxLYtRylRqYCpD/mIL4muVmdxabSG94yGfjLBYsulDlOwoCZejyWjzdBeH8i71hEBbBv1CvuROBBkQIoWb8bIp3pqB75YlXnyG78MYMPMdu/rbv1Uq2obMVaNMasTuopMwHKIfykA1ghLHEP6YIZHh54bbh2Zt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840780; c=relaxed/simple;
	bh=rcn2II9B6ow9JioOrBjPB8A2h3FoEeF3hy8FoQTt4g4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uio/rp7/r1EeSBbkYdtyBcDLuVCaApQSFkV1RP5+w6pdnBfnW00R5J++2zBIg8MvLEQrr86jNzrEF2nazIFkSQp6nXN1lMDeLxUaLlod4+5sYdw17JhZHacPVtrWfo5K9KwTl5QitAuLRBaOzcG5I76HjvbQqdS4MfUu8cjY7iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6ygMjRS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6ygMjRS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A85A1F000E9;
	Thu, 23 Jul 2026 21:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784840778;
	bh=Whl81c0nCWOuMbl4DOy/9NiU8ikeUHg65Y/2RRdsyIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R6ygMjRSXWv47obPqvuRmNYPMq0B+l+CVIqCY2lXJFVyjNsmgfdGTkFnaU7XvEAxK
	 4X18PvT+CexW2bZwfIoZRgoBRqRDpaRsOjSFM++9AkBHUt+StfIB9WxrArAbhv1KEU
	 a5sjaoSPYcIIl7eDPBEGtxiLaL+d31Qrme0bjxaQYv0w+C5gEUHxZcVyiJdOv107c6
	 mZCPIwhzcUfdu1vAdhyYvUYKBZYkcI+ckCbDFqBnwKHgyuH0m8X/NcC31m487Go8JA
	 mvX3qQpkiMlBLkRIdfcbQ3V/PeNADcX21aa8Mf1asXbCjjCMheM4bInTqBD+ko5sKG
	 6tyk8SeBConuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260723-mpq8646_v0-v3-2-1af1f3d38848@free.fr>
References: <20260723-mpq8646_v0-v3-0-1af1f3d38848@free.fr>
 <20260723-mpq8646_v0-v3-2-1af1f3d38848@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 21:06:17 +0000
Message-Id: <20260723210618.5A85A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The DT binding introduces a custom property required for correct=
 hardware operation, but no driver matches the compatible string to parse i=
t.
- [Low] Device tree bindings must describe the hardware, not the OS driver.
--

--- Patch [2]: [PATCH v3 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 bi=
nding ---
commit eedf00342aacf25d6a0fb94f444aca85e5a1697f
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding

This commit adds a device-tree binding for the Monolithic Power Systems
MPQ8646 step-down converter as a PMBus device.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.yaml
> @@ -0,0 +1,50 @@
[ ... ]
> +description: |
> +  PMBus driver for the MPS MPQ8646 step-down converter.

[Severity: Low]
This isn't a bug, but the description describes an OS driver rather than
the hardware. Device tree bindings are meant to be OS-agnostic. Should
this be reworded to describe the hardware component itself, such as
MPS MPQ8646 PMBus step-down converter?

> +
> +properties:
> +  compatible:
> +    const: mps,mpq8646

[Severity: Medium]
Since this compatible string uses a const value without a fallback to an
existing driver like mps,mpq8785, is there a missing patch in this
series to add the corresponding driver match table entry?

> +
> +  reg:
> +    maxItems: 1
> +
> +  mps,vout-fb-divider-ratio-permille:
> +    description:
> +      The feedback resistor divider ratio, expressed in permille
> +      (Vfb / Vout * 1000). This value is written to the
> +      PMBUS_VOUT_SCALE_LOOP register and is required for correct output
> +      voltage presentation.

[Severity: Medium]
Since this custom property is required for correct hardware operation,
does the kernel currently have a driver capable of parsing it?

Because there is no driver support for the mps,mpq8646 compatible string
in this patch series, this property will be completely ignored by the
kernel. Was the corresponding driver implementation omitted from this
series?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v3-0-1af1f3d38848@free.fr?part=3D2
