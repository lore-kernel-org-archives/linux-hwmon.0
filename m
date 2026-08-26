Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C697D39A04B;
	Wed, 26 Aug 2026 18:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770793; cv=none; b=FWj19Qy6GpVJcOXsgMfIc2iCimXSrKvSciTZRpt4mozI4Kzj3tOVLiNKFGSVgNXtlJVfY6/nnPUg2YPPfkO+189iZQHtb/BcUW5Y0m2RxdqhfHSS8CYYC27Eh0rrkLLAIandCeMt8alzbBC0w0n7LHxnGWdajs/49y4eUlKTTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770793; c=relaxed/simple;
	bh=QvLB8NdcOCbb7JbHVPghpajh95tq+AyUmcHPZ28Qwvs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BR0G+Za6NTAYwCBoQyamS57+plec4A6DTEPjpkf9fVef8P4qwRdemLf6c3M3pFFwqo92sgMtmVu723sbLqAvLazjdng8HEN6GgB+tyeCGOEZDjPSCtDQWyAuazjg7jLyn0ZaLVaQK8W/DX1t5dcA1Q2I6LXx9AtNhYylMwLfnZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ar903qLw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ar903qLw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2681F000E9;
	Wed, 26 Aug 2026 18:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787770785;
	bh=+SlphaLDRIa1ZPP2+j4uad2yrd2PddXn1qpW8G3k31o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ar903qLwmic6ZyK5eTjFhJ3KQa4lN5BL54pI2Mh9JiLZhZkfObyGcjOrwLCaa6fjc
	 KAm96NwOVnqfCkYRFPEqu5lA9dA9epCfQUy2wxNcAOnKKuR8tJaRdVShquUkDkPgLr
	 QlRCq8cxP4bcsRdlC+rZVOTTFP0VjLm7gtV2bWPJ/RYM2M+QPvKR4ItNYaEsWLZpkB
	 ejKOWL4L5O1SSHEqVvq/mpoe5jOk00+r1Z/y7XT+4v2j2EN126SPxe10xIqnmWsu39
	 0wTAQTvRxLCvNVZxzLATvfULSFUa053camV1YoK/orNBs86GCg4PmnGqbGH/fEsmra
	 4JWSLrJpV/E6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: national,lm90: Fix channel
 constraints for temperature offset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260826184750.4798-2-flaviu.nistor@gmail.com>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-2-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 18:59:44 +0000
Message-Id: <20260826185944.BC2681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Applying `enum: [0, 1]` directly to the `reg` property breaks dtbs =
validation because `reg` evaluates as an array.
--

commit 962bb439f62765fdf82aa8ab6bf085e5158b3bb7
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

dt-bindings: hwmon: national,lm90: Fix channel constraints for temperature =
offset

This commit restricts temperature-offset-millicelsius to remote channels and
rejects channel 2 for chips with only one remote sensor. It adds conditional
schema rules to limit the allowed channels based on the compatible string.

> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 164068ba069d7..a8b2a24501b35 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -113,6 +113,23 @@ allOf:
>        properties:
>          ti,extended-range-enable: false
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - adi,adt7481
> +                - dallas,max6695
> +                - dallas,max6696
> +    then:
> +      patternProperties:
> +        "^channel@[0-1]$":
> +          properties:
> +            reg:
> +              enum: [0, 1]

[Severity: Low]
Does this schema constraint fail validation?

The dt-schema tooling treats reg as an array based on the core schemas. Sin=
ce
this block applies enum: [0, 1] directly to reg, an array value like [0] or=
 [1]
will not match the scalar integers 0 or 1 provided in the enum constraint. =
As a
result, valid device tree nodes containing channel@0 or channel@1 could fail
make dtbs_check with a type mismatch error.

Should this be constrained inside an items block instead, such as
items: enum: [0, 1]?

> +        "channel@2": false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826184750.4798=
-1-flaviu.nistor@gmail.com?part=3D1
