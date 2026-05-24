Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18333438B5;
	Sun, 24 May 2026 21:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779657038; cv=none; b=mnfwZ6+PvvsX4TUUDoNbQfZ0RBVskBRr3Y1xc74TxgX7sqd/8W3G2bHj3RRLpXjPMxSpFTQZL60ns+wOSa+xRb8/ylt4QxSur5mmZRTyWdP7HAowZjBnMc+4+2SfnAq7qntr5mnuK2Q5AHNt7gXmKFtpkE1imAWGPX8QwbjOFUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779657038; c=relaxed/simple;
	bh=dovpXzTHzfv/TnWIMuEk9euAGZY3jVhci3YQORr5P6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PYo32IrQpmDLtnT+w5aWDBJAbnTAei3dxWBur7wt6ROVEFRrJr3hGQFJ1tzm77EJz23fbExcxJlWhBr4tU/2DfciDHaFZ1LblZUG8g/o0T46CSsCjCepCezjECDRyVGGbsoczBCau44WtzYZsNUTIAJAthpvXfKoxjsT1/Oy6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFec0i/o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFec0i/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708731F000E9;
	Sun, 24 May 2026 21:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779657036;
	bh=33zPHmGJGeusotAVngAKC9iNgWqkRPCbhDhPpdsst5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YFec0i/onfAyVhENCLg5nYxb+oV8sgQoPGuEOFY3tcXkkzx4bQCZsGnPnEHfYMdHS
	 pEeuhkV1tBhzgoR8SLDaRx4nZdtsAESfxp49AO0mYY7r8ip/l0TzlOvxBpGfPOQIGU
	 fXkIErZjLmlR8verhVbCfb6/S54IC7eWaXf27W9K0XPIxuuMElDrgxdbcXXS41vHZC
	 6HpbaR8KPpqnF5YP2ccTz2iDgk/TE0qsQgT23v0mQ/rS6caGjVIj786YJeCA0kZAEe
	 od2loxNp4WYOfR11C6zsR//0WdxE3WKbMpaUCsdMcSkNXPIlpMNpDGp39FugqoaXbe
	 FJdtu9Pd6ysXg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 2/4] dt-bindings: iio: flow: add Sensirion SLF3x
 liquid flow sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524205112.26638-3-wafgo01@gmail.com>
References: <20260524205112.26638-3-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 21:10:35 +0000
Message-Id: <20260524211036.708731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding defines a generic compatible string `sensirion,slf3s` i=
nstead of specific hardware part numbers.
--

commit 5a08fd855b770d7594ec38ac7c89f4642153097b
Author: Wadim Mueller <wadim.mueller@cmblu.de>

dt-bindings: iio: flow: add Sensirion SLF3x liquid flow sensor

This commit adds a device tree binding for the Sensirion SLF3x family of I2C
liquid-flow sensors. It exposes a single generic compatible string and reli=
es
on runtime detection to differentiate between sub-types.

> diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.y=
aml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - sensirion,slf3s

[Severity: Low]
Should this define specific hardware part numbers like "sensirion,slf3s-060=
0f"
and "sensirion,slf3s-4000b" instead of just a generic string?

Standard device tree practice usually requires describing the exact hardware
present on the board rather than relying solely on driver auto-detection
logic. Including specific compatibles, potentially with this generic string=
 as
a fallback, could ensure forward compatibility if future hardware revisions
modify or break the auto-detection mechanism.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524205112.2663=
8-1-wafgo01@gmail.com?part=3D2
