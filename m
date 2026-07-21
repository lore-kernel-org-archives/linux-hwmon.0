Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C323B47F7;
	Tue, 21 Jul 2026 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627903; cv=none; b=LHpJQDD4+YSNTXMNX5qkaTMFed+zJztfMh/xVXIfoEIxq7Vxn8545vlRlFo9EIKI7J/ce8RYnElrqj4sJV2Vk8WIhSmS3cXvhEE9Ri2t4s8v/WrwfGgSolb+9CXBs2XfYbKp9n3BzKikpUUpxZND041d0rM0QDkDfg3quxNZ1ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627903; c=relaxed/simple;
	bh=zA1t7UNIph+a84mkAIvFdh1osx2IOFdFWPeVROFIhDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FQT6TGgxGMnkqnLzICFaUUKDQpqG1zIUuM9AQPQmbyd3MYr8eEn8lVv2wnanog4RTQIUNRCCw/BkiywYIWw4IEvMXf6dBOa+XWvQDpjUxf/jyi98BHZ3MK3ptAQvjMC1iCpTzjJ2brLR6Z4XK1WDwXa5heeZ99yEFbFdV5gIo0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYKDqbWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYKDqbWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9631F000E9;
	Tue, 21 Jul 2026 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627902;
	bh=AJ08KbqW42e9+UoSoCcxV9emLmbWbl6VMpoKI/zLHGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NYKDqbWlwevxTW979pGholSzkkdgn3u2Rk9U2IEjFd1t4sJEQ0wVqRbk6tCJAfaj1
	 61e+uofxPa0KR9OjpdlN9E7mGCe6aAqLc9N4qvyAWHIL1bGitNwt1/nm7FjmckM7C/
	 5BqXwrYYXo0q+xPxqWK8ZqC7mTke6SoALdWO2egsSUQPwTSwuL5WbjzhswcE3lhIBf
	 zMhuqPKOfKk6GYmT9+ALjAi1P7utALhtXuASFTKsPuVMQrXYKRzoiubhG5+qrKiG0k
	 S67hegg4IK7GSpOFIdOjIb/IeWb1ehC7Dn600NwwsWy+KQvxkLLNXURchEpVpBF86T
	 gHrCF1ev0fumA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-ctl2301-v2-2-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-2-ef5fb342872a@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:58:20 +0000
Message-Id: <20260721095822.1E9631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `interrupts` property in the newly created LM63 device t=
ree binding.
--

--- Patch [2]: [PATCH v2 2/6] dt-bindings: hwmon: Move LM63 family to a ded=
icated binding ---
commit 5cb7233d8984d02f9823102bcec286ee4ef134d5
Author: Troy Mitchell <troy.mitchell@linux.dev>

dt-bindings: hwmon: Move LM63 family to a dedicated binding

This commit moves the National Semiconductor LM63, LM64, and LM96163
compatibles out of trivial-devices.yaml and into a dedicated schema. It also
describes their integrated fan control and thermal cooling device capabilit=
ies.

> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> new file mode 100644
> index 0000000000000..92b0094ff3034
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - national,lm63
> +      - national,lm64
> +      - national,lm96163
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#cooling-cells":
> +    const: 2

[Severity: Medium]
Should the interrupts property be explicitly defined in this block?

Because the LM63 family was moved out of trivial-devices.yaml (which broadl=
y=20
permitted the interrupts property) to a dedicated schema using
unevaluatedProperties: false, device trees that correctly describe the=20
hardware's interrupt capability via the ALERT# pin will now incorrectly fai=
l=20
dtbs_check validation.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-ctl2301-v2=
-0-ef5fb342872a@linux.dev?part=3D2
