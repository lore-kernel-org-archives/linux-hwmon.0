Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC23E3C62
	for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2026 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777918990; cv=none; b=K/TJSYJrJP8fXEuXFEElyFE05baQ/alhqrlDftdsfmRk1OI5yH1IuYAa4OatuDkFj5m8fWWf53Zn8e3rvjxJWGvRjPPEk+EZSidad509DelfG3NJUdRiwy1YUbNDG4Gff8zJNCXZfNsPy9M1Ivc2/PNY76ytOVu0WC7YPNeJTEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777918990; c=relaxed/simple;
	bh=FIa+BhpFUIfDiu5v0VjTJ2mVoAmyqtz/mKZp/7GTJm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EbinV7meXbyGAdVWE3IHJiM3+pmsCCo8MntLzB2dzI4/N99yAkTYiSvCCZRlpM7vQZkEkYlw5yPOcaVa2js3h+PX2FItCO1v3I/bwm/PUfIcombeDDJRqEj3saCi96MRpLurlEktaEunxpKbf+jIu4zLGa8ZY4G49DKhOikY9GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhhyBRXn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhhyBRXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC086C2BCB8;
	Mon,  4 May 2026 18:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777918989;
	bh=FIa+BhpFUIfDiu5v0VjTJ2mVoAmyqtz/mKZp/7GTJm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OhhyBRXnbGHKlUakjrgpyOETUVbkFM0VqgfpVmZ0/e5VveLLOs52zc8ERfKyG/WI/
	 jil4JpzHVpYNyfAANRxf41pT6w6P5nC0uOEdgY9/aC1QRACj9/RBfEBVgUSi6ZW7Tx
	 ay/fNCaZXUMZVHb7BxPpIYtf6n8rDoprBCAdp9LgSh6BldocF7oKFnX2SnvmFPOz1c
	 LIO/ceJl481/uEXiCEljeG0NrDcmClF0FJxdpaPTGA18zJfdAVWnN7N+AGn9JI6oHF
	 zoAGv+BhgE5z4s7lci4QdZc/ugdzlqO1NZtIBPBzJqLNiGEdlR3UKscJyF1ast2+ff
	 2nY44/TxlsfIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: lm75: Add
 ti,alert-polarity-active-high property
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260504151020.462342-2-markus.stockhausen@gmx.de>
References: <20260504151020.462342-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 04 May 2026 18:23:09 +0000
Message-Id: <20260504182309.AC086C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Redundant custom devicetree property conflicts with standard 'inte=
rrupts' polarity specifier.
- [Low] Inappropriate vendor prefix ('ti,') for a generic, multi-vendor har=
dware feature.
--

commit 05f32bdea45ff4c95a0e00cb7fb78b2bce28fd4a
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

dt-bindings: hwmon: lm75: Add ti,alert-polarity-active-high property

This commit introduces a new boolean property to configure the alert pin
polarity for LM75 hardware monitors. When specified, the alert pin
polarity is configured as active-high instead of the default active-low.

> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Document=
ation/devicetree/bindings/hwmon/lm75.yaml
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -54,6 +54,13 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  ti,alert-polarity-active-high:

This isn't a bug, but is it appropriate to use a ti prefix for a generic
hardware feature? The configuration register bit to set the overtemperature
shutdown alert polarity is a standard feature present across most compatible
parts from multiple manufacturers (like Maxim, Dallas, and ST).

Since the binding applies this property globally to all compatibles, would =
it
be better to use a vendor-neutral name like alert-polarity-active-high, or
use the original vendor prefix national?

> +    description: Alert pin is asserted based on the value of alert polar=
ity
> +      bit of configuration register. Default value is normal (0 which ma=
ps to
> +      active-low). The other value is inverted (1 which maps to active-h=
igh).
> +      Specify this property to set the alert polarity to active-high.
> +    $ref: /schemas/types.yaml#/definitions/flag

Does introducing this boolean property create a dual source of truth when
used alongside the interrupts property?

The standard interrupts property inherently encodes the IRQ trigger type and
polarity (such as IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). If the driver
configures the hardware pin polarity strictly based on this custom property
and ignores the trigger type specified in the interrupts node, it could lead
to a direct polarity mismatch.

For example, if a user configures an active-high interrupt via the standard
interrupts specifier but omits this custom property, the driver defaults the
hardware pin to active-low, which could result in missed interrupts or
interrupt storms.

Should the driver derive the hardware polarity dynamically using
irqd_get_trigger_type() when an interrupt is provided, and perhaps only
permit this custom property to be used when operating in standalone
thermostat mode without an interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260504151020.4623=
42-1-markus.stockhausen@gmx.de?part=3D1
