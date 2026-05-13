Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A84388E58;
	Wed, 13 May 2026 02:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778639087; cv=none; b=brnkFfCID31Q9/lcpSQ6dLB6Elhp4CYxfwoSTvv7nmDDgLGBYU9cFck7jUl/uTV+gRTLZQNZkjItPRSKcBKU/teRVvmhkvJ/O4rFwDqpDLFuLOXMZ6yfWPj6H+tb6zSLpgmk/bASZZBqRbTS/3thuxo2mYyHalPMq4y7uqN2yw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778639087; c=relaxed/simple;
	bh=9cIfxuycgP8z4g23PgKgPgWRXfTbd9QvLzmPjgLbCjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CD+reL+xbkZm/PMbxEkCZakV+ScCmAVbLaYs66gTkY1eaQkcuMcWWEpPN2P3xOURYUfVhVeiJbVx2VFai+V+Bh7rwRKEvEplv6tPcY4umV/FbcW6mDEMOrDFGrJVQSl2h2RJuOjfKFqiAppRuxDY6JAgs39VntgHapTEW7+u358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cp6mP9lo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cp6mP9lo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F29C2BCB0;
	Wed, 13 May 2026 02:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778639087;
	bh=9cIfxuycgP8z4g23PgKgPgWRXfTbd9QvLzmPjgLbCjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Cp6mP9loWgeE+UlD61nyBeaRUDf+dTG/tK7LRaDWbA9+m1O/HVYfU/dt+rq1EuTeo
	 IXris+1vw0HsVBJks+2OdYJ1wZWMbcyp8HSxXQQANm3ijwvBivCFFn72qr+KEkswa9
	 ZhBVhtJ0NXlE1I1DbZn9VhYALOWhD4qPeccsVri5vscd7agfRNqtGyYN2Y+yBP/B3F
	 QWuwPGQJucJg71KjKvweWcuNUc0vW1eCk6FcNbOe+U1Juljub0ROPBAdx6I8YLP1ly
	 H/ZnoDYEwIwreQFmxc2OkxNpYoAAn3D9fYPeRu3BQY8CHUF33EbbhhmzHApCO2CPqs
	 cqrnQwuuISTMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Murata D1U74T PSU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260511-d1u74t-v1-1-623c2bc1532a@nexthop.ai>
References: <20260511-d1u74t-v1-1-623c2bc1532a@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 02:24:46 +0000
Message-Id: <20260513022447.19F29C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The 'MURATA D1U74T PSU DRIVER' MAINTAINERS entry breaks alphabetica=
l sorting.
- [Low] The devicetree example uses a non-standard node name 'psu@58'.
--

commit ff01149325e7be87488c4a95814dc42ab054bb39
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

dt-bindings: hwmon: pmbus: Add Murata D1U74T PSU

This commit adds the devicetree binding documentation and MAINTAINERS entry
for the Murata D1U74T-W PMBus power supply unit.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
[ ... ]
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        psu@58 {

Does this node name follow the standard devicetree specification? The
standard generic name for this class of device is typically "power-supply".
Should this be updated to "power-supply@58" rather than "psu@58" to better
reflect the generic function of the device?

> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6803,6 +6803,12 @@ S:	Maintained
>  F:	Documentation/hwmon/crps.rst
>  F:	drivers/hwmon/pmbus/crps.c
> =20
> +MURATA D1U74T PSU DRIVER
> +M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
> +
>  CRYPTO API

This isn't a bug, but it appears this entry was inserted out of alphabetical
order. Since "MURATA D1U74T PSU DRIVER" is currently placed just before
"CRYPTO API", should it be relocated further down the file into its proper
alphabetical position in the "M" section?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-d1u74t-v1-=
0-623c2bc1532a@nexthop.ai?part=3D1
