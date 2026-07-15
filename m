Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751640B38D;
	Wed, 15 Jul 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107005; cv=none; b=YfVrXo65IPMCDKuEl1cKx8vkGljt/qT4SC4VtYDZ2e/PGy1f7SE6dd6499Ng8H4DjTaHjpZT6PZKjjAMjPdpAy+KFWWh3KbDqOQ8cwbfse1GGlKsrstRD+gCrcHmctFs5hlWOCLqBdCaK0I1CAYqbNih/XBi10Odx/p6RFpH+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107005; c=relaxed/simple;
	bh=bVZV3g4nFTZZZL+Ob8+ickIphmNSjCBVWuDje7fE/Zg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HtG9Se/NRcyyMt4M4ncc/HSJAkTSHXOUt5D6S8koPz1Q8Z3BUJ1fVuzN7f0gUtyhPdTnU5thP4zCagmrz6V98jFW/DB2Kq7JvAxr5WpyemUoqm/Do+J4prDJszCVsaBnGo19t3fsVetRIsKedOOqV1Nsgn3NT5XB2EFDTMzIi3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPKdwCY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPKdwCY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE0F1F00A3A;
	Wed, 15 Jul 2026 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106997;
	bh=ZydBOO/RwuzXQWXyuNlVK0ItpjdCvAEQ9pZV7dcpHtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CPKdwCY9hDlKP0oryCCqrw7+vEIyXM6xOLknat8UuSG9k490tfQPx4SdPDnRPDRQ5
	 0qzGBfORmkVymUk3krSMqN07hPGsxtLUhbXMVFuwDpH39Q4KyJzCwFfnGeLUp+yzf6
	 eRuJiaRm2pF1TbFj1JW44z03o3vJkth/r8I2sAyIYY/1SJcuMQRLGO0M79rKksF4af
	 /QPbmMIbiOMk4Cth7z7n244SN7jkqvHjAc0LDqhxXZggFPfZvXRhpu08hI9WyBxeO7
	 YGI0vaaukR0z6oeGsibxDAQmoaB1BlyfGDhGWYwq1CcjxD6OVUQdpK7sEwU9SNqE6J
	 X2cIGovMRZzoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon: Add Kandou KB9002
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260715-kb9002-upstream-v2-2-2fd390383da5@amd.com>
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
 <20260715-kb9002-upstream-v2-2-2fd390383da5@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:16:36 +0000
Message-Id: <20260715091637.6DE0F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `reg` property is missing the `maxItems: 1` constraint and i=
ncorrectly applies `minimum` and `maximum` constraints directly to the arra=
y instance.
- [Low] The device tree binding for a PCIe retimer is incorrectly placed in=
 the hwmon/ directory.
--

--- Patch [2]: [PATCH v2 2/4] dt-bindings: hwmon: Add Kandou KB9002 ---
commit e4c6f2bbc23572a071a648919c1c0c0e4520ad76
Author: Andy Chung <Andy.Chung@amd.com>

dt-bindings: hwmon: Add Kandou KB9002

Add device tree bindings for the Kandou KB9002 PCIe 5.0 retimer, an
SMBus target that exposes an aggregated die temperature.

> diff --git a/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml b=
/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
> new file mode 100644
> index 0000000000000..67859e9d63c25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/kandou,kb9002.yaml#

[Severity: Low]
Does this binding belong in the hwmon directory? Since this device is
primarily an 8-lane PCIe 5.0 retimer rather than a dedicated hardware
monitor, it seems like the binding should be placed in a physical
category directory like phy/ or pci/ instead.

[ ... ]

> +properties:
> +  compatible:
> +    const: kandou,kb9002
> +
> +  reg:
> +    minimum: 0x20
> +    maximum: 0x27

[Severity: Medium]
Can this correctly constrain the I2C address? The reg property evaluates
as an array, so omitting maxItems: 1 allows multiple addresses to pass
validation.=20

Furthermore, applying numeric constraints directly to the array rather
than its items causes them to be silently ignored by the validator,
allowing out-of-range addresses to pass.

> +
> +required:
> +  - compatible
> +  - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-kb9002-ups=
tream-v2-0-2fd390383da5@amd.com?part=3D2
