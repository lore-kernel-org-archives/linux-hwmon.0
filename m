Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB83B313E03;
	Tue, 16 Jun 2026 06:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592932; cv=none; b=l+TNehd1n9LnXtLIKpKEUOnRGIQE4R4Rl1Onoe7jK4FfqvhAKv7gIePuP6jutz3gf4FYDhwYz9tJtpxsGAWui/tMFmy1STIIDcsOR8skPWk/sDNJUFkxei2M6fLnYkaHRknuPqVDNs8H1fpgz6nCp+/j0vuTMAcLfHvA+jfpcBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592932; c=relaxed/simple;
	bh=SJUZLfcG0biGx+NeTcD+HTp+oXwGv8rQF6gT2/a/W8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QeYxOqM8O1TKsZFJ+NBrK+Wg2lbZCe8MHwX90OyY2XyZzIMRRU8WAcJvX7RJfHuUlJ7TQPOHfdmPTMKQ/hYk5CbGcl45fHwwZ9k74++Nrx942TxlP0yHT5tGsxiWw8f3nd4AkN9fJF6WJ5bNOZQR+lfsdp05sTb9s1Dx0YTDzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLjQ6NqS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLjQ6NqS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6EF1F000E9;
	Tue, 16 Jun 2026 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781592931;
	bh=bpZYGDrmSn78eqxjEFUihe5bbNpc1j5k/u8osduPMQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CLjQ6NqSHa+3M2IjD10S2tINXrRhrkRahc+zneqw4Zr2c+WIGC8HjLQnmUeUNIOJR
	 L/fL++pSYWYCFUypUPeZfu0EssETZA8GNC2LUR9dNAgGTj2xSDS8a7UEOD714ZD+it
	 rlXZC/O9gIWjUGlwvLDwFoF9Nn4QruhrmOifhYkgKAWo7QID31qZCD5zJPruJ6z5eX
	 ukFb1rtb7VtRYLaTOyhkUVdVOx49ix6qTnXclbM/TLG3cGHwb+DlmUTjp3HSDsa1FE
	 Sy6UQeKLjZt7nLjlV54MnS5TbFHSr4EyBx7Lynwwi/xsTDWINwN7OTxNspqIlylg6e
	 zVkTyChTMV8Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: adm1275: ROHM BD12780 hot-swap
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d63c4df5e9df845bc4f94b4abdcd068a23929974.1781591132.git.mazziesaccount@gmail.com>
References: <d63c4df5e9df845bc4f94b4abdcd068a23929974.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:55:30 +0000
Message-Id: <20260616065531.3A6EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Invalid use of the `items` object for the single-string compatible =
enum, allowing arrays of multiple arbitrary compatible strings.
--

commit 7132123aae357451c411a0cee036262cc9f62a45
Author: Matti Vaittinen <mazziesaccount@gmail.com>

dt-bindings: adm1275: ROHM BD12780 hot-swap controller

This commit adds support for the ROHM BD12780 and BD12780A hot-swap
controllers to the adm1275 device tree bindings. It introduces new
compatible strings, requiring BD12780A to use BD12780 as a fallback.

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,adm1275.yaml
> index d6a7517f2a50c..bc67510ef3ab1 100644
> --- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml

[ ... ]

> @@ -25,19 +25,35 @@ description: |
>  properties:
>    compatible:
> -    enum:
> -      - adi,adm1075
> -      - adi,adm1272
> -      - adi,adm1273
> -      - adi,adm1275
> -      - adi,adm1276
> -      - adi,adm1278
> -      - adi,adm1281
> -      - adi,adm1293
> -      - adi,adm1294
> -      - silergy,mc09c
> +    oneOf:
> +      - items:
> +          enum:
> +            - adi,adm1075
> +            - adi,adm1272
> +            - adi,adm1273

[Severity: Low]
Does wrapping this enum inside an items list inadvertently allow multiple
exclusive strings instead of restricting it to exactly one?

In dt-schema, applying an items object directly to a string-array property
like compatible defines the schema for all elements of the array, but does
not impose bounds on the array length. This might allow a device tree to
define a compatible property with multiple strings from this list, such as:
compatible =3D "adi,adm1075", "adi,adm1272";

To enforce exactly one string from the list, should the items wrapper be
removed so that the enum resides directly under oneOf?

> +            - adi,adm1275
> +            - adi,adm1276
> +            - adi,adm1278
> +            - adi,adm1281
> +            - adi,adm1293
> +            - adi,adm1294
> +            - rohm,bd12780
> +            - silergy,mc09c
> +
> +# Require BD12780 as a fall-back for BD12780A.
> +      - items:
> +          - const: rohm,bd12780a
> +          - const: rohm,bd12780

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D1
