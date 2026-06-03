Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F20383C65;
	Wed,  3 Jun 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496601; cv=none; b=CgkUrdciuXfGWG4EfAZwOd7AJRiBiP/WULCMZIIHeRvpXv8P26633x2CfDOQT0lRZfWo7hCL4ht84SJOdI8cHjoKYKcpVLbNX2GgWAs0v5UdbDdez1SUjwlLRlX6rEoR+Z+srdZxSEtFDbzc1dF7iUNTn42v4tiyYxjddzXHjro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496601; c=relaxed/simple;
	bh=kGbPyo8fXJsXOF4kC6/8eqnZ+Q+5lTSF/QptwAArjhs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j9W/5RPfc1V9zs2Ul6VPwbsfitjBgm4m86uLbqPGkihtfvOWjVfZDXgCMZuogSQRUMy5kclwwirfhgcmLN2awhZl/wz+UfPCd618h1HX+iNzvyRbb1Q56qpmc6cK2at/n9AVLBDcFnCyJJxwMAIPM2Heq1YF02oqxL5XF/2EuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRZus5fa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRZus5fa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABFF1F00893;
	Wed,  3 Jun 2026 14:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780496600;
	bh=A3Zbp8bg/8TwgNuV+aZWHIOV1U+jXBCtOs6RBJ5FSLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRZus5fayrH/y+tgQZ39Ujxf0iOQC2KNmtXSN72112+tEqigjiUB5vzft99XD4+q/
	 JhHTEdaMrmrlt6Ej6TMVwePlekLQaGmMDtKl3m7bBryR97YEGnaLEKrsLU2ABlZVBM
	 Lxz6OtmukgOMmMUL/Wu64zr02uq6uIbunOmMvD8Rnc605y6XH/+g0GDVC7PjYhpZaY
	 kUIh7ESex6UXI832IfuIyW/M+zACEeQQXrSXog33afdxt2KrnUDIp7B2hVkOxogqke
	 dRyTrfFFSlVapfjV6dJH1aFKdBtGtBNR440rYIeSMWO9HSd0jvHJS4FSYAvT2sGOD8
	 ESJihmY6IQKdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: hwmon: lm90: Document SMSC
 EMC1402/1403/1404/1428
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260603141033.111300-2-clamor95@gmail.com>
References: <20260603141033.111300-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:23:19 +0000
Message-Id: <20260603142320.4ABFF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema artificially restricts the number of allowed channels=
, rejecting valid hardware configurations for the newly added SMSC EMC1404 =
and EMC1428 devices.
- [Medium] The dt-binding incorrectly applies maximum temperature threshold=
 limits to the 'temperature-offset-millicelsius' property.
--

commit 7ac2109c4a63c7879d955565cef8a4c30bd05436
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428

Document SMSC (now Microchip) EMC1402/1403/1404/1428 thermal sensors.

> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 164068ba069d7..a1de96e0b87f3 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -12,38 +12,67 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    enum:
[ ... ]
> +    oneOf:
> +      - enum:
[ ... ]
> +          - smsc,emc1402
> +          - smsc,emc1403
> +          - smsc,emc1404
> +          - smsc,emc1428

[Severity: Medium]
Does adding smsc,emc1404 and smsc,emc1428 here without expanding the global
channel limits cause schema validation failures for valid hardware?

The emc1403 driver supports up to 4 channels for the EMC1404 and up to 8
channels for the EMC1428. However, the base schema in
Documentation/devicetree/bindings/hwmon/national,lm90.yaml globally restric=
ts
channels:

  patternProperties:
    "^channel@([0-2])$":
      type: object
      ...
      properties:
        reg:
          items:
            minimum: 0
            maximum: 2

With additionalProperties: false at the root, defining channel@3 for EMC1404
or channel@7 for EMC1428 will fail schema validation.

Can we expand the global channel regex and reg bounds, and use if-then bloc=
ks
to restrict legacy devices to fewer channels?

[ ... ]
> @@ -169,6 +198,7 @@ allOf:
>                - national,lm99
>                - nuvoton,nct7718
>                - nxp,sa56004
> +              - smsc,emc1428

[Severity: Medium]
Are we confusing the maximum temperature threshold limits with the maximum
offset limit here?

By adding smsc,emc1428 to this block, it inherits a maximum value of 127875
for temperature-offset-millicelsius. In the emc1403.c driver's
emc1403_set_temp() function, temperature thresholds are clamped using
val =3D clamp_val(val, -128000, 127875) for the emc1428. However, these are
bounds for thresholds (tempX_max, tempX_min, tempX_crit), not temperature
offsets.

The emc1403 driver doesn't seem to support an offset register. Should these
compatibles be added to the block that explicitly sets
temperature-offset-millicelsius: false instead?

>                - winbond,w83l771
>      then:
>        patternProperties:
[ ... ]
> @@ -191,6 +221,21 @@ allOf:
>              temperature-offset-millicelsius:
>                maximum: 127937
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - smsc,emc1402
> +              - smsc,emc1403
> +              - smsc,emc1404
> +    then:
> +      patternProperties:
> +        "^channel@([0-2])$":
> +          properties:
> +            temperature-offset-millicelsius:
> +              maximum: 255875

[Severity: Medium]
Does this block also incorrectly apply temperature threshold maximums to the
offset property?

In the emc1403.c driver's emc1403_set_temp() function, temperature threshol=
ds
for these devices are clamped using val =3D clamp_val(val, 0, 255875). This
limit applies to threshold registers rather than the offset register.

If the hardware lacks offset support, should
temperature-offset-millicelsius be disabled for these compatibles as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603141033.1113=
00-1-clamor95@gmail.com?part=3D1
