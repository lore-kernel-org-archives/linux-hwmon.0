Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697325;
	b=YhRYwNzS6Dy4EiY6G69dPploUeCHJgD1HpuziPaBnb0FCRIdyGLEVUB3QKOb5A9lSVLc
	 6WfK6Sv+oJDyrctChx2D+HtCSbAjAD8zw8scit2CjjbxM467/r9+1zyZCv6epTjSZP6zS
	 GOL4wg79vWB6G0GgIKYjsERtXOiR7CXm6QX9wUWJeTobJMzzKYT9a0uGlUoxiDocfapCV
	 j4bxhLMwbW7RtyzR2r4v5ZyE0wv7C5qfoMmilfjTcAUBMGBDD7SJsRj3mWFKQAqXtGkwY
	 tC+/FHwV/3JVk27SukLIV2NNY+75YglSeo9eXoyDA1Le54uVkb/D79PxhR4NxSIQ0ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pghIrn8W5fzR9yCXFt2T/AQ1iAQpDoMM04Ny5aD6myA=;
	b=Kr3pGkHdCVhlWFwOTbvq8WztYKb0oqNIHuJmYLjwMZW49cXN2Kgr++01SF7a6Maj5jVN
	 7XqxfUCtXaECOv2G3ppZJUVMLNdc3xeL4BRLntts+MN7geg/zBn1xvO1fLPEcBq8IAtO5
	 3Yw6oHQl4w+QH8JI+VM/mVrSpucFRo4wMnyFzgvgaz4TIuoTR9zSTt9E8o0dzqp7ZkoUh
	 cmnEwzx9/SUxkAeH6ZcRJ/U5znDDP0JjZN+lKeHyLDHdqCfzyOH3rvGWemFW3yxI2QMqu
	 1VnB0OxjwKxXXq9+wFxxHwIjwuFPyAmoSVGtmFfAmGBAcT4hLdY4t8Cli4LiQMI9/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/E9zd+d";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BB3606A31C;
	Thu, 26 Nov 2026 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/E9zd+d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4261C1F000C0;
	Thu, 26 Nov 2026 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697324;
	bh=pghIrn8W5fzR9yCXFt2T/AQ1iAQpDoMM04Ny5aD6myA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/E9zd+d+HZLuu9Fg0gbw81NS6LZl52Zz0IAyCHTCxHi7QzOocicmhTrOtZIwbMvE
	 2xKIeF4maPlaAqyxZbL0VCbNL8Towd9a0AbwK+GSJ+RZsylTnVPwxJhOvbQQIBGjRy
	 zecr8ARNoqFhFCvg7a2ecQiJM0lt6E/6gFk7KY8g532d418flmUvZsrXNczdXGu8/V
	 Xyjntcu3uqDruV8TlNRmt8s7d0jauSagJHg1mt/kdhAGAT40JuL48oI71t7xzOhzjP
	 wiHa0mMYzQ9PLGHh25MYwuFhdXPu2JBR1jFco8C62mFdLcLsuynpwzaglNcAjU0wgW
	 dShPd4b6Zv4zQ==
Message-ID: <sashiko-outbox-235526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: hwmon: Add National/TI LM77
 temperature sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukma@nabladev.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261126124402.3015577-2-lukma@nabladev.com>
References: <20261126124402.3015577-1-lukma@nabladev.com>
 <20261126124402.3015577-2-lukma@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 12:48:43 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: hwmon: national,lm77: use items list for interrupts
  property
--

commit 1e0de9410961323eaf2b74ef56e166bc063143d4
Author: Lukasz Majewski <lukma@nabladev.com>

dt-bindings: hwmon: Add National/TI LM77 temperature sensor

This commit adds a Device Tree binding schema for the National
Semiconductor / TI LM77 temperature sensor.

> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm77.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
> new file mode 100644
> index 0000000000000..fbb6e711342ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
> @@ -0,0 +1,66 @@

[ ... ]

> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      The LM77 has two open-drain interrupt outputs.
> +      - The first interrupt should be the INT pin (window comparator).
> +      - The second (optional) interrupt is the T_CRIT_A pin (critical
> +        over-temp limit).

[Severity: Low]
Should interrupts use an items list with per-entry descriptions instead of
enumerating the INT and T_CRIT_A outputs in a free-form description?

In DT schemas, properties with fixed positional entries normally describe
each entry under items (along with minItems: 1) rather than listing the
entries and their optionality in prose with maxItems.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126124402.3015=
577-1-lukma@nabladev.com?part=3D2
