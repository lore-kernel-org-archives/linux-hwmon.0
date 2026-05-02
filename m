Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD021AA1F4
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777749553; cv=none; b=in8kFUWxkk/7QbFtKvErGUmABfibwNasf4JqA1tJ39DupvZ2K2H7bmRVZlExY0AfZdKUsCdjrFqivcl7bFaml7g+C2r3bL1NWWMFxB6I8uUl9lCPLE7t6VeX6YCp0rfdowgW1W3cS2dNw0JpIltFpZ3R0zCU0u9nGpb4AXqH1us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777749553; c=relaxed/simple;
	bh=jqjVmQOHoPxCwCSSDWOkvtBe+m/L50ccDYKYvmQI7LM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ko2J/ZSAfW9qp7sy/P2f62811dtoDsZcQ3+VRhKsvsGv7iuN5zllWPNS2axnvkglhMxysEon4qRK46alOZl4hgIyyqm+nu0SRjHkqxkV8inosNN4PC2fZLZokCL0M0qwSkdjmPHN8L5OVns/o2rweFwDXQVJeaegEjfBHK1VfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sb/mFoQm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sb/mFoQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F50AC19425;
	Sat,  2 May 2026 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777749552;
	bh=jqjVmQOHoPxCwCSSDWOkvtBe+m/L50ccDYKYvmQI7LM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Sb/mFoQmOj/GJv0C6M1aWgc3JRYeZYw/YacaHVoX7CYo0BNB9dp7ZR3awTvajEBfY
	 UvUd4cr57PNSFTQdVxECUBEDYsLI7RH7e9CfSSyCc2Rmxo+YrUMqyUnu90RxoCAlT6
	 A6nQKnA4rhhPBVI93KM5o0Gf1EG35xqBua9btFmarbBiPgznD+FFJpwt86zURvhkAy
	 VvJucl5QkznHp50jyFoJyXBGXBRQHRqhstSy5wo6fCPZn/Pblnd4OQLHnkoOjXHpFa
	 qyXxFZ0y1rGlwd6T5Hd4OMEyoiVisFAl09OWz5POCGF9xusVKT0K/SXUqLt2IYoZsl
	 IGw46Rctuuu7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: lm75: Add
 ti,alert-polarity-active-high property
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502190408.3577731-2-markus.stockhausen@gmx.de>
References: <20260502190408.3577731-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 19:19:11 +0000
Message-Id: <20260502191912.7F50AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The implementation of the alert polarity property in the driver is=
 structurally broken and non-functional.
- [Medium] Vendor prefix violation and missing schema constraints for a gen=
eric hardware feature.
--

commit 92fb69393cd7ead8fd2be55819f1d1f0b77724f6
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

dt-bindings: hwmon: lm75: Add ti,alert-polarity-active-high property

This commit adds an optional boolean property ti,alert-polarity-active-high
to configure the alert pin polarity for the LM75 hardware monitor.

> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Document=
ation/devicetree/bindings/hwmon/lm75.yaml
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml

[ ... ]

> @@ -54,6 +54,13 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  ti,alert-polarity-active-high:
> +    description: Alert pin is asserted based on the value of alert polar=
ity
> +      bit of configuration register. Default value is normal (0 which ma=
ps to
> +      active-low). The other value is inverted (1 which maps to active-h=
igh).
> +      Specify this property to set the alert polarity to active-high.
> +    $ref: /schemas/types.yaml#/definitions/flag

Is the OS polarity (bit 2) a generic feature of the LM75 specification? If =
so,
should this property be named without the vendor prefix (e.g.,
alert-polarity-active-high)?

If this is instead intended as a TI-specific extension, should it be
constrained via an allOf -> if block restricted to ti,* compatible strings?
As currently defined in the root properties block, it globally allows non-TI
compatible devices (such as nxp,pct2075 or maxim,max6625) to pass schema
validation with a TI-specific property.

Also, regarding the implementation in the subsequent driver patch ("hwmon:
(lm75) Support active-high alert polarity"), does the register update actua=
lly
take effect?

The driver code adds LM75_ALERT_POLARITY_HIGH_8_BIT (BIT(2)) to set_mask, b=
ut
does it also update clr_mask? The helper function lm75_write_config() passes
clr_mask | LM75_SHUTDOWN as the mask argument to regmap_update_bits().=20

Because BIT(2) does not appear to be included in the static clr_mask
definitions for devices in device_params, the bit would be excluded from the
regmap_update_bits() mask. This would cause the register update to ignore t=
he
new polarity setting and preserve the existing hardware state.

> +
>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502190408.3577=
731-1-markus.stockhausen@gmx.de?part=3D1
