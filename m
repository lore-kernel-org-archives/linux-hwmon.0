Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B4339FD4;
	Mon, 20 Jul 2026 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517730; cv=none; b=QqGx+egzq+NPo6sdAm5fatH/2fjDTdiXSYM28jp/oNxIECZW9c2c8cVtjCOrrc+RIHyTGPg1hQrRrRiqqxZ11NtuNY9fOqHaEsJfC3pydcfvZ0g8O3/lHJfXNP4U4MHd7N5l9QdjmJjN8OrebRohof67c4oqGa3qrnPozZXLCIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517730; c=relaxed/simple;
	bh=Y33+fAhSGf+OK7SygoUMc3jDpvF6a4aDg+QNopP4hbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K/S75cJHnKBdR0HQXxsWOjoB6Z0V79hCRtUn0zFCAzw/iAutYV6uPQwiDoWCyDBlRb0tSGmTWs4t9EcBkUf4pWBSDum+hVh2o9QJXmpN+BU/b7+9KMRtS26iv57ysb+xu9RfhEe/+slcWNS4Sem9iEbtvo77x0YnIv2kNQFn/4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTkOX0A1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTkOX0A1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A9A1F000E9;
	Mon, 20 Jul 2026 03:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784517729;
	bh=2V9L/zZcFAB3oXCpbWVCOPWvZz2mCWf8UJxGLHHW9zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OTkOX0A1RnCbynQWVRfKew+A3HAxI/cFdbR9z0k53WkZcyffOTNXo8sWE969GZOpE
	 28WE5CqCsMX68cGPCIDC7sisiaqFO66gH/bDKnj/LUKfzhQBbVKWpvVOgcThxRraXy
	 haPDQgczMY4oSv2pjh3fZ7moFr3WNoyBjoS9z7kU6fKD3P/dcyR9XSVQx7ieHIpQUF
	 x4mleBEgHK9PXGWfQSCW9jDwW4TvrYbUxzOjWGQitUGSDjYRjeBVnIt9ZhA26HG9Ms
	 4y3O9QFhM2dZYwCpsLzaFnsa0zXWbdIpdEWB+4Dw+UBMFQB+JNZfIGTFojklbASwa4
	 A7foW4qRVxGyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:22:07 +0000
Message-Id: <20260720032207.E5A9A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#include <dt-bindings/gpio/gpio.h>` in the examples sectio=
n causes `make dt_binding_check` to fail.
--

--- Patch [1]: [PATCH v3 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOU=
T feedback resistor properties and complete examples ---
commit f18524325452b02a7accd64c49a8b82f9362d94c
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

dt-bindings: hwmon: (pmbus/max20830): add VOUT feedback resistor properties=
 and complete examples

This commit adds properties for external voltage divider configuration for
VOUT sensing (adi,vout-rfb1-ohms and adi,vout-rfb2-ohms) to the MAX20830
binding. It also adds missing entries to the example device tree node.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml

[ ... ]

> @@ -61,6 +76,11 @@ examples:
>              compatible =3D "adi,max20830";
>              reg =3D <0x30>;
>              vddh-supply =3D <&vddh>;
> +            avdd-supply =3D <&avdd>;
> +            ldoin-supply =3D <&ldoin>;
> +            pwr-good-gpios =3D <&gpio 2 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does the missing #include <dt-bindings/gpio/gpio.h> here cause make
dt_binding_check to fail due to the unexpanded GPIO_ACTIVE_HIGH macro?

> +            adi,vout-rfb1-ohms =3D <10000>;
> +            adi,vout-rfb2-ohms =3D <2000>;
>          };
>      };
>  ...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-dev-max208=
30c-v3-0-9d06d27d6da3@analog.com?part=3D1
