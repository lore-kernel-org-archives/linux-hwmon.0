Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7FA360EC3;
	Mon, 24 Aug 2026 18:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597377; cv=none; b=l+u7MNbqLPlB8Xt091ijnmufLd8VTsz9H0Azt5AXB0WKLjKBuYSvk0iZ/xcIstQNG0uRkKxv2qpjwbOt9kXOaEg+kZF8NEIyvSRK54eym2/TgUbgH2A7ZI6tnKADOalY+SZTLsSVug05h0daDvR3JuPqnnbfej12WIhWdwQTbBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597377; c=relaxed/simple;
	bh=qSIYCXdd4YkX+cw5IzGPvA/5MS5JpUvrgS88qrijbos=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h2NZmIz5rSYVKgbGXHn3el1RE92TDaqXTCcuvV1YE9XyGEj2sD+UJsRy9wmJkuj/0K5gRugJ5T5246t1+wK6vuR0sMgcLP8/x8Q8DHy1y8xp3Kg4sTr+FiKNnSjEDm8PfMI4uI3asImonfhFwXOkbdGkV/3fCHcYPj6VU/UYra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTrdVyKU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTrdVyKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482AA1F000E9;
	Mon, 24 Aug 2026 18:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787597375;
	bh=l02lZTEg8V/1CYt5fClPRUD/jLWlP2QFX6cbobChipI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTrdVyKU0bmLjB3UlujXrN6kIl8u5Ik8UHklrGiGHqKFfPLP5BimshW3nfUJ8bnKK
	 sS5O73PtRLT5FobPTrsNVhGsQqyLr11cSzatXUq+vrDElxBdWSk0uVmezrFXiAK52w
	 kq1KAmhkTNfWk+mgTDlaD6RuM+ABfdE0p6b3lBcrCLmid1TTqFYRGa3+dICESzPjXx
	 smsfrCy/YGBqDrLPFlRZzHGq9UyulpalZthWupdf0YZySfjDUCUvNhq/DAL/R/BnPb
	 vEpaDykzoJLiDdLQljreLoiE+xFag89yFvzUXvlBlWfWRbDceRE5DCVcXZ5kWKaYjd
	 k4R6OfHlvAYZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: national,lm90: Fix channel
 constraints for temperature offset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824183900.8983-2-flaviu.nistor@gmail.com>
References: <20260824183900.8983-1-flaviu.nistor@gmail.com>
 <20260824183900.8983-2-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:49:34 +0000
Message-Id: <20260824184935.482AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unanchored regular expressions in `patternProperties` violate dt-bi=
ndings conventions by matching substrings instead of exact node names.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: hwmon: national,lm90: Fix channel c=
onstraints for temperature offset ---
commit 9782538dd0bd62fc7f4323e17bb521a9d2fa819b
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

dt-bindings: hwmon: national,lm90: Fix channel constraints for temperature =
offset

This commit limits the temperature-offset-millicelsius property to remote
channels only, as it doesn't apply to the local channel 0. It also rejects
channel 2 for devices that do not support a second remote channel.

> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 164068ba069d7..a7f82b202b861 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
[ ... ]
> @@ -113,6 +113,29 @@ allOf:
>        properties:
>          ti,extended-range-enable: false
> =20
> +  - patternProperties:
> +      "channel@0":

[Severity: Low]
Should this regular expression be anchored as "^channel@0$"?

Without anchors, this matches any child node containing "channel@0" as a
substring (such as "mychannel@0"), causing incorrect schema validation rules
to be applied during dt_binding_check execution.

> +        type: object
> +        properties:
> +          temperature-offset-millicelsius: false
> +
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
> +        "channel@2": false

[Severity: Low]
Does this pattern also need to be anchored as "^channel@2$"?

As written, it behaves as a substring match and might inadvertently reject
node names containing it as a substring.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824183900.8983=
-1-flaviu.nistor@gmail.com?part=3D1
