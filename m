Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873529;
	b=dwNgMxRJlY5KFFpk1oQlEDFbEuDZBffldW5ytLGIGgQoXwfFv8Dlh8E/QD44HoP5+MUq
	 8PC76ZWMj4KrZARbW16JYZ890zFil2GEyw2pvoUC3d9IE4j9M9q1Hilg69C0hkQlha8St
	 7/QHYeKj1zpmEG6T4qgiO4UVsZAJRbe4fvMblUU+b6cc9sGpGcg9qCY4a7hYmlV1+34lo
	 Iaank3TCh+9opUZUgKZ0ZOy6pBuc+GzgYIShhnGAEwYnJt4F240zHSjeui+4M95NBo/p+
	 ZuW5PPy7cZQbk7hgIf+B0tmM82zNEELzxJbVGtBEsOFKdD1D8qfdaRbnbzpEwk6UmzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873529;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=59RGq2kW1TgnByOviFdbYwV11+0Zal228LPJgwrNTww=;
	b=gYbKdqbXb7j67/mCYAnxSRFYktbyTvRdjIxzDqZu/jEDwEKkcuuBcZ9VyUQZpytBUID3
	 6TAo5H7Rl8y5dC6X3Ibe3GwkEhhDgHyyn4lW+n4NYB6uxgLuBjpznEIfGqJo45fzQKjhM
	 l0ofd2mJfBeLXiYm+mHvRPqDkzRH2YNxma+9J6TfLUeZcgBx0E6Bmg2Bg9UlpeMzVPilb
	 FS9BrExJxc3QACfJl86J+RVBfTymJ9JzSZgZTstXjcE3C5QFCRjbaF38smuwOTFMzSslz
	 o7ZPgnoO47BPAgBBeeaAVhNu7QLLMEKpCyRse6jtg3XQ7CI1Qif9RL0/cXPxola9g3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uv3JNnKb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B450606A323;
	Mon, 16 Nov 2026 23:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uv3JNnKb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F581F000C4;
	Mon, 16 Nov 2026 23:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873528;
	bh=59RGq2kW1TgnByOviFdbYwV11+0Zal228LPJgwrNTww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uv3JNnKbMP0H/wvyrv8LKPCoPxdIzKM7ToX0KAo8XwgSDeE6kwnCopQj3le5+POyD
	 4kiJHbXrcCycQMTml07E0wbsVOpPqxGNZw1dtBrGHfC+B2CBHvf7Dv2eyLAjUMtb1p
	 wXsHbAIvJiZiM4Pl15IAx4M6Pk9vmWTmAiZQkLs2ZFzyVetPvhVJUFDNoRPGp6VzSb
	 /Siq+sqKQ9TiAxmeyA920jPfMlcXymcoK3Uii/GjrFKslNJ+2/V0Nq9FdIBLdNAa6X
	 66svIvaVPaa6Jr8gn5sXBOvsHb1GamBZeSUQApyNtHvf9JdhiunJpbTDH/heAOImA0
	 /+gt2Q/a7yOMw==
Message-ID: <sashiko-outbox-217957@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] hwmon: Add Broadcom PMB PVTMON monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-xg6846b-bcmbca-xrdp-reset-v5-6-f584e8b8e696@kernel.org>
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-6-f584e8b8e696@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:58:48 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-xg6846b-bc=
mbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org?part=3D6

