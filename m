Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395401;
	b=32aRNhdV3YVw5aJ2wrqY5EBKy6gyjCpmWQGjd89djKFVBkuCbTmNnFqeiOSTIqqum9Fo
	 vX3qI8ZXzYhkHZHOP/B5yC6+UBYifka+gg5+hML6/KtryhY1ocY2owmjyXKBG1iEpj1tJ
	 s9XRTZi7EL/BIQhrzula0/4BHM7tGt7diezqABC4NszSvHHBjiyUpa783p3Zlq6+C/lN0
	 +X4Xwf9W8QtSeePU9oNfNZ/jO6vBodSmqBRCnmjDshtp8awBOBX/PVWp47oRGONZaB94d
	 Bs9KvR/eSTpTpLcizVCibU/FNx2pQWIK9iTAP2C6M7SfhEAnEeUlQ2f1ylTUEwmf6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395401;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JKVhhv/riFcWM5bsNkbJ8k4WRE/IHo1N8aU+n7Es9q8=;
	b=gM5bhfiZWpiOWwr0kFgHNNJMCfoJsKg7WQAn1JjdqC+Y+m1H9lY9IabtcwQ6+RKjrlfb
	 D19Z7XvdUr/yIxPENkp4TcosHcI0AORSIvRyxYGsBHKrO/pncML4vrUrhbEgKmwdgE+Sl
	 bIRRH1M5TEh8s+1eAZDkDa3Gp+vbdYbnAQ67BFCdi8t/4BF/sKjgdabr1XKuOe6Udq4S0
	 Yq8i+5OQmPsVQsd4ThLXVhPUZKR9XJ3KNPqWO9ijRPdwfm8qde1qe2DeXVO75Af+lb1K/
	 FD4V2LEHmgk8Sdf32K9P33kVErAIJGxD1LiqvSRk2y1vozRBWbezGf/XxQJ6ykEn7LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wxf8n9hx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051AD606A334;
	Wed, 11 Nov 2026 11:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wxf8n9hx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC3A1F00A05;
	Wed, 11 Nov 2026 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395400;
	bh=JKVhhv/riFcWM5bsNkbJ8k4WRE/IHo1N8aU+n7Es9q8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wxf8n9hxw+C2g1+YjgTro4QgU6z57ICL0/knqtIhk7T8Uz19jwiu0wchNpk5kgpNI
	 EPlOSGIDOfmwfufvIbaVU76Fdhocj0VeFfL4spzjlgkaZ0Z+WnuRXkVk7aSKmsd1tg
	 FVivowfc9PjEhs12h8zL6YB14toD0OdGayfiL4p29gQpccG4sNf6TgBJwcI9PrceBo
	 ftKehQ+DXTVWNbFIhx8HiiTnVpgmcxlAUbefBthvfAZdKS1sRFDK3VQ4C7TpQp6+y5
	 mYnyO4gvXF8jQUaIv8PdK+ozIPV+wgmrgGgE6oXnTjWnkjxhInJELDAwl7XqAFMW/A
	 jG21Y1lxnQmdw==
Message-ID: <sashiko-outbox-208853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] hwmon: Add Broadcom PMB PVTMON monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-7-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-7-17035a5e8ad2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:10:00 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Expose the BCM6846 die temperature and seven voltage inputs through
> hwmon using the shared Power Management Bus (PMB) regmap.
>=20
> Register the temperature channel with the thermal framework so
> existing zero-cell device-tree thermal sensor references work.
>=20
> Poll for valid samples with a bounded timeout, releasing the PMB lock
> between reads. Report temperature in millidegrees Celsius, including
> negative values, and voltages in millivolts.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-xg6846b-bc=
mbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org?part=3D7

