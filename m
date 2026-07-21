Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E973C7E16;
	Tue, 21 Jul 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627826; cv=none; b=gnAHKt+wZRvzOg3n9Bh1kaAqg8b7jw9K+YEgSspVwwRTKqgSdzgLiaqTBdHGA1MtKevwgTpeCp5LpT6lo5wY3pD7IOGomlHg8BwWHT8DaoFV+lz9mka1nb6VdAsL/jiDR2QgI/bHtnQZ/KevVCBSqq9lEu8HS9e6Jra67gQqNDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627826; c=relaxed/simple;
	bh=8Lmm5PKbHaWnDsX95k0AYEcYrOnjFkdCUo7v2IAI7fw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=erzu43FXl17rOTQgdd73z9hBzDEZqpZNrnyqgdPs/EsrMArS+TdpOlBl6Pob5uLSTRT8r1PnUWh8VSRfCLYMM6qhlN6B6DHtDWYMFm1oJHL2zMh94LZE0pr7bHSdwVZ2jG6aqZRgn6/ncM/srcLPQ6B4a4ItRiJ0x4Y/ytGjyy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDTY5z84; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDTY5z84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B361F000E9;
	Tue, 21 Jul 2026 09:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627825;
	bh=//HbIyDGZv7/WClipYtvJYh6LOk4MoA2hEF/UMx/Fac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KDTY5z84W/SgP7VhxujtOUyJkLZgGUKgR9KezSi0IJ1EmMV5x+GRtt+YNLwicQVMR
	 MG4DDZ7Qj1oUwRUh/o/ZTF+sc8ychpZtknCBx5h13/P8/J3ZVhK63zroYBYCxWcsfI
	 bu2WcplavFKPaKJeZPNtVaYjvWUify1UTzDxSw32mTRNgr/VRGF5jI04vyl9rY6q/l
	 7wj2fLDM8H2qflFcgptBFH0Rl0luM6MxOn625O1F2r4WvloV6s4SIGPkFmqKpai+6I
	 Wtb6TKOMX6KKr0JMCAzJwDXJv7Yd61wNgN8LSlYgoMcVC6u7R5GZoWMxjHKqHNvScz
	 o3oySV4g3sXAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:57:04 +0000
Message-Id: <20260721095704.E9B361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `sensylink,ctf2301` compatible string is added to a flat `en=
um` instead of allowing a fallback, preventing the device from using existi=
ng driver support.
--

--- Patch [3]: [PATCH v2 3/6] dt-bindings: hwmon: Add Sensylink CTF2301 ---
commit 2d1df9d4d4d9fa27f7828b7715766842a51c0154
Author: Troy Mitchell <troy.mitchell@linux.dev>
Subject: dt-bindings: hwmon: Add Sensylink CTF2301

This commit adds the Sensylink CTF2301 temperature sensor and fan controller
to the LM63 family binding. It updates the device tree schema to accept the
new compatible string.

> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> index 92b0094ff3034..4a1ffebfdbef6 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
[ ... ]
> @@ -23,6 +24,7 @@ properties:
>        - national,lm63
>        - national,lm64
>        - national,lm96163
> +      - sensylink,ctf2301

[Severity: Medium]
Since the commit message mentions this device follows the LM63 register
model, should this compatible string allow a fallback to "national,lm63"
instead of being added to this flat enum?

Without a fallback, and since no driver update is included to add the new
ID, could this cause a regression where the existing Linux driver fails to
match and probe the device when a device tree specifies only
"sensylink,ctf2301"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-ctl2301-v2=
-0-ef5fb342872a@linux.dev?part=3D3
