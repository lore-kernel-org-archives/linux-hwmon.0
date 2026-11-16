Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790253;
	b=l6ELKVe5c76/ButHld2b/dYVAyv46jYGjnkyvCtcILeGcpKUam6Aou6s499ZBrLl726l
	 0ew385YG1JQW9jWcs8Us0XB5niuOFM00xuEbHTaXFF3Wy9OeQQNSbbgcbQC7ymOZje4js
	 E55DDwPeNnU0s+rUXbsIQ3FHdyNrSq3ctX2txkwkxgFwhTIJuzDhky5RJU7ldnV8NxGoq
	 H+2h3qwdkkJGo8guFzPQA1rLR6ipOXIUZFQldlt/ts3hywUx42GasiibCWN/PufHQYwvU
	 WXRBTbYrzzdWT3FOwbX8EJutHfi5IecGL/KM7C6Ld83VZh1NuD23kx02AfaH9wx1Z7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790253;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FgQdmN6pb/iJ9+Fcr4KArtomVN6atYpIRsjjFKoOpYw=;
	b=aTKp7ufu+u6Iu7t4MdsGyAZ3v4j7QNGYKzKlofwTfmBstHWP55eSZq33wld6+hWXldcj
	 G7+QdcQsoPRWiyJwzCN+m+ijhOnt5tF7eUqxNDk1uOsJOJPzAXPD/vOZjLP/QJQYuJRJZ
	 L6qoYdvyQ2oqYwKHctBQVy45cpzfVbLf/RlwI8H8vZL4um0OcPMWSGWND99NpRRU0vBwH
	 6/ut7o7MO/FL6tlapo/REXybLk9ULKpEtbCFtWFdqbyck69cD8mI4Oi6MlMz0fOeVqbWF
	 in5EuWNVtIve3cx7HXeB4anS+RiYecokX/dCM9GkvggCxyGKBa+LV2YeXaO3QO4h/kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5VgJdhp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98995606A31F
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 00:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5VgJdhp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BB21F000C4;
	Mon, 16 Nov 2026 00:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794790253;
	bh=FgQdmN6pb/iJ9+Fcr4KArtomVN6atYpIRsjjFKoOpYw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=T5VgJdhpgMl2mtc6yFzsN8FlKk0beQAOAjombx4xqbjuz9I3AmPABaazwHm2SSou8
	 4JKhrxGMyTDwdK9WKuIiDyxpf1jcNPPyRWMAh6w8jmgPrpKvbFEKzGgc4Mb2lMokl1
	 niN9EHsbPyVRhoUSUBRDh+s4j8XYaz1J7DB7Bi/3NY3k7xemUo8UQgP/A66rv9tCny
	 gNydIdyRdI6o0XYbCm8JbIh7KnugQZAjSjnnwhYuihtB7H5eocdh7PAcI9MT3fOL0p
	 XURR0kIW0FiHIw81+kGaZukmT31sDGzXFOSlufBMoBMlhJ6j5qxba5O1to2frvhA+s
	 Ne9DWjl5zZiFA==
Message-ID: <sashiko-outbox-215972@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: Use per-device lockdep keys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, "Hardware Monitoring" <linux-hwmon@vger.kernel.org>
In-Reply-To: <20261116004209.2570779-1-linux@roeck-us.net>
References: <20261116004209.2570779-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 00:50:52 +0000
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
- [Low] hwmon: missing Fixes: trailer for lockdep false-positive fix
--

commit 4d05c24302d1083670a8cf3177a400690315c5c3
Author: Guenter Roeck <linux@roeck-us.net>

> hwmon: Use per-device lockdep keys
>
> Currently, mutex_init(&hwdev->lock) in __hwmon_device_register() assigns
> a single static lockdep key to all hardware monitoring device locks. If
> one hardware monitoring device accesses another hardware monitoring
> device (for example, pwm-fan controlling a PWM output provided by
> adt7470), lockdep sees two instances of the same lock class acquired in
> sequence and reports a false-positive recursive locking warning.
>
> Give each struct hwmon_device its own dynamic struct lock_class_key,
> registered via lockdep_register_key() and initialized with
> mutex_init_with_key() before any error path that calls
> hwmon_dev_release(), and cleaned up with mutex_destroy() and
> lockdep_unregister_key() in hwmon_dev_release(). This allows nested
> locking across distinct hwmon devices while preserving full lockdep
> deadlock and self-recursion detection.
>
> Cc: Dav=C3=AD=C3=B0 Steinn Geirsson <david@dsg.is>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

[Severity: Low]
Since this fixes the false-positive lockdep warning introduced with
hwdev->lock, should it include a Fixes tag?

  Fixes: 3ad2a7b9b15d ("hwmon: Serialize accesses in hwmon core")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116004209.2570=
779-1-linux@roeck-us.net?part=3D1
