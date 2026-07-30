Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8334A41A79C;
	Thu, 30 Jul 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417925; cv=none; b=OscJaTmZtbdEYYJ7F8RzmJiYc6K1ldMK0m93Yhme3dhQHLm0Qt8mukpqKuHL2JJ/pQidWc+NyKEhDzI5SAganR1z048LTijvl8jYbBFz+EqLTR9jKPF+HrZ7raPJ5W8wKI9hKQRX6maoSy3G54Nac+ExYV5Ch6g3BvA8/JnH8Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417925; c=relaxed/simple;
	bh=8zuPcYe6YeDw+nQk96oQdixYnPJAq85NOtNVYiD8cEo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f9tfthuMh5eTktwscoC3zc6ozqEAXfYoXQ9IxR9WqHqjyUAk7J86no/dx+iOb4PK3bYZfTxce3MLhX7H14zJAIaKygAULngRrCv9gldicFPivo4J+o/tIjOfXZWb9ZhDXdtB18IOKIlp+Atb9aFnVuFQNUaOJAd7nDRM1UhxV60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oL6Ifn//; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oL6Ifn//"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4DD1F000E9;
	Thu, 30 Jul 2026 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785417924;
	bh=wUwbgcLOVFPavtoGOcVAMTWfyeoCYkGILvWHWmr+swo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oL6Ifn//mohCqlh5JbwPhTT6ToGtEL0AtSOkCT4oj3GWLKCpt0kDYYD5sQCtxSVME
	 piprWMjanpxlX2NLsa2JJSjkIqso/80tApnoBcYtbr6gHRr+O0y3TaQ5IXjh7IMvUk
	 1o/X3j17PGoK2pz8sg/eu9xmgjAx+iaZYVBXMukq6y7VhanxQhYp37/wWT3ulBGfjQ
	 cMvtpOXwbAMZWGqUJFSFe6HTMSOrZZG4iA/wQxuHUukjxDZ3tcdgnKNpeyNjuLetk0
	 a3Q7V0EVoTFZl6fx5rO6hD94qlqnwA6YW9i4pJu5pM9JnfZPpy9eIwH+9WY28JbUv3
	 KAjbGylNYsrVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: adc: add adi,max40080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730131738.822405-2-stefan.popa@analog.com>
References: <20260730131738.822405-1-stefan.popa@analog.com>
 <20260730131738.822405-2-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:25:23 +0000
Message-Id: <20260730132524.0F4DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The MAINTAINERS entry for 'MAXIM MAX40080 CURRENT SENSE AMPLIFIER D=
RIVER' is incorrectly appended to the very end of the file, placing it afte=
r the catch-all 'THE REST' section.
--

--- Patch [1]: [PATCH v6 1/2] dt-bindings: iio: adc: add adi,max40080 ---
commit 4f01f75006cab658c6276517a4096c41a91e9b17
Author: Stefan Popa <stefan.popa@analog.com>

dt-bindings: iio: adc: add adi,max40080

This commit adds device tree bindings for the Analog Devices MAX40080
bidirectional current-sense amplifier. It outlines the required properties
and creates a new maintainer entry for the driver.

> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

[ ... ]

> @@ -27447,3 +27447,11 @@ S:	Buried alive in reporters
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>  F:	*
>  F:	*/
> +
> +MAXIM MAX40080 CURRENT SENSE AMPLIFIER DRIVER

[Severity: Low]
This isn't a bug, but should this new entry be sorted alphabetically within
the file? Appending it at the very bottom places it after the catch-all
fallback section, which violates the standard sorting convention.

> +M:	Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> +M:	Stefan Popa <stefan.popa@analog.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Supported
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/iio/adc/adi,max40080.yaml

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730131738.8224=
05-1-stefan.popa@analog.com?part=3D1
