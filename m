Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1D319C553;
	Wed, 29 Jul 2026 04:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300567; cv=none; b=aRPcYu8JSeqz6WiGkP3lzsqHF2BgAUCRch2e4f+7Yhv5IAKruXTE1u3l/JG9Ucc60aGJEYBIaRpNFYrFLmhQm9ngPT2ot+Ac/ISJMdxwGb9rtbNK7ed0qQE5F0ypWSdPYp0gZkCAQfQnc/v1SJ6S6YEG+C9BO6J0V88dWKI94GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300567; c=relaxed/simple;
	bh=V3myAySNoVA6ASEUtmc/Ct83Nxq/57IY7+5a8JoU2/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iE7fR2cHUX7oADTOUYCR4rSSAogy8YjaNHEHQC3qXIRnwJCsRWWH6Gj90u4+nQdlS1RdSzItOsQef+jqoNMfIH5Weo9yQRY0O+D1NZF3godITzrhfcHoAnNO6zE0RzOK78T4FvmcpqamUvbbBD45IZPPIX2EarmFuC0qYFO/2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4WuOfS0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4WuOfS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6E01F000E9;
	Wed, 29 Jul 2026 04:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785300566;
	bh=g4HfpK+EzeeSnWhswJJr4zIIkjcPyrNI1L8Kt/dhGwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e4WuOfS0yUydWGXOhpbgTfszlbSN4LHdKpliEoQx8lQYCbO/eoaZ7+qvkj5O8JV/q
	 JjEt0eAlRjJeFx3sake+WD2ARwLTjdHHHC5UG+q4f0p+9seCu4V84mb7RpjQf1fdS1
	 MuZSSvZVZBNqmaQ2AtZzJPYFJy+vcxkg0EYO901P3adiZ/nhQVGEAhs3JXziRmzz69
	 k+NMHJ1GlFIBrH/tKYwgjjMlDxXR1fFqM5Qvqmc5BWRrLy2OAnUXhq9od4OuRMkfgu
	 0uevr1g4tFEW54xbqUf9R3iDZ96vpvCHIjTZHDiK4gVzkHLc9LZXL/XHegXdD0sxkW
	 /iH+KyK8TaJWA==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v4 1/4] dt-bindings: hwmon: add adi,adt7470
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-adt7470_thermalzone-v4-1-c14039dfa0e6@gmail.com>
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-1-c14039dfa0e6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 04:49:25 +0000
Message-Id: <20260729044925.BA6E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding defines PWM capabilities for the fan control lines b=
ut fails to include `#pwm-cells` in the `required` array.
--

--- Patch [1]: [hwmon-next PATCH v4 1/4] dt-bindings: hwmon: add adi,adt747=
0 ---
commit d94dd40d08b4e7af2118277171ae57575a6cb4c8
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

dt-bindings: hwmon: add adi,adt7470

This commit adds the device tree binding documentation for the Analog Devic=
es
ADT7470 multichannel temperature sensor and PWM fan controller. It includes
support for the thermal framework and models fan control lines as PWM chann=
els.

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
[ ... ]
> +  "#pwm-cells":
> +    const: 3
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +    description:
> +      Valid index values are 0 to 9, corresponding to temp1 through temp=
10.
> +
> +required:
> +  - compatible
> +  - reg

[Severity: Medium]
Since the binding defines PWM capabilities for the fan control lines, should
#pwm-cells be included in the required properties list? Without it, a device
tree node omitting the property will still pass schema validation, which
could lead to runtime failures in drivers or dependent subsystems attempting
to use the PWM functionality.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-adt7470_th=
ermalzone-v4-0-c14039dfa0e6@gmail.com?part=3D1
