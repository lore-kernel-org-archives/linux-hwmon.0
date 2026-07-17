Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B88E2F6560;
	Fri, 17 Jul 2026 21:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322281; cv=none; b=j6yhO7Lf3Qit1EsfZNK3SD33aAMCBV+N6Ydy9qgpq/GWAuSPhM4IFqpA1dHsMOcZplywySLYgUXfRYkiru697QBQMizjXWn2w+yGL79TJuXFOI9qFfNcgwbYoH31euM5dHxU9kM1SBVR2ncTN0afOgS4oZd601w2XW2w4KQxwDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322281; c=relaxed/simple;
	bh=yekfXRmwlRMvH84INcz8e9jagUUnoXVHiB38rlBCarE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aVI/kEgcbdCsL25Qe4HTvTiQ/5wtMYuBHSgjBEgJNZplEV0jiUZpNtel+VzWZgzM7CAqifrhKKIfxMDbIub3YJ87W+L8IQi2DGkjmNC0ZJeYI6bP+oKvM/djCnNp5nwKKIoZcTP6QJDYnhyz88RGx9EeJ+ZvXFJABAKEp2n+BFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1qRUmvd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1qRUmvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356FF1F000E9;
	Fri, 17 Jul 2026 21:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784322279;
	bh=YgOjt/3apkL/eAsD4E5satsvN/a+k1K4/m4OipOPBFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1qRUmvd/lhSIjYou20LJDSfZuHn1WmFoydWJtOP2r566y2xEpoh+zL+QU2lnZvOW
	 hwymQUF6+Z9rcJrA60z7GCjg2PBHUzEi1VxETHpFylwFS5kfbzAYoxmMGkvksj/6eB
	 fKYkmiCoQYCwM9v9w4ANNHtGEfwNOW479VCvvuMF7B7dbW9Agw1YE2pL1rwHtG12Wt
	 Vg4js+grsmeygUNK6lwtjxv0LQ71gJkS4eR8io60fu+0QLxI0mdrHZMecN4AGSXxhe
	 OmPmTJduB9wHp5dSazuaCGczCI54KYmp53qWL1GRu7Z9qIORVKA17v9t8LGXJtZ9sn
	 ShXC6zUXL4e6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 21:04:38 +0000
Message-Id: <20260717210439.356FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding defines PWM output and thermal sensor provider capab=
ilities but fails to include `#pwm-cells` and `#thermal-sensor-cells` in th=
e `required` list.
--

--- Patch [1]: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt74=
70 ---
commit 6372aff696282f1ac0ec9a8f1372c186734704a2
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

dt-bindings: hwmon: add binding for adi,adt7470

The ADT7470 hardware monitoring chip supports PWM fan control and temperatu=
re
monitoring. This commit introduces the YAML device tree binding schema for =
it,
defining PWM and thermal sensor provider capabilities.

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> new file mode 100644
> index 0000000000000..14bb6359c91f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: adi,adt7470
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +    description: |
> +      Number of cells in a PWM specifier.
> +      - The first cell is the PWM channel (0 to 3).
> +      - The second cell is the PWM period in nanoseconds.
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +    description: |
> +      Number of cells required to uniquely identify the temperature sens=
ors.
> +      Valid index values are 0 to 9, corresponding to temp1 through temp=
10.
> +
> +required:
> +  - compatible
> +  - reg

[Severity: Medium]
Should #pwm-cells and #thermal-sensor-cells be included in this required li=
st?

Because this binding defines the device as a PWM output and thermal sensor
provider, omitting these cell properties from the required list allows
incomplete device tree nodes to silently pass schema validation.=20

If an adt7470 node is created without them, dependent drivers attempting to
reference it as a provider may fail at runtime when parsing the provider
specifier.

Could both #pwm-cells and #thermal-sensor-cells be added to the required
array to enforce complete node validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_th=
ermalzone-v2-0-a55147958fad@gmail.com?part=3D1
