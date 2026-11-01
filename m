Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571649;
	b=Qjn6OrxIk2rPv8E+Nvxtf8Tb6Na/8s9TcqQWFzpf71Ic6wTR3WMdW6EtIOVC0t6Wtgx5
	 TL4xLUWFvS7ctcZPlzP7YKZJm4u+EpwIM6sAyaVgUdFRhLmt83GwhEULQE0J09nU/x7kn
	 JoOOTbouOTUMoAis8Ijo9ouGf3gjeqbHIwOaNF0E3HTgus/OEMKr8Knw4tISTaVp0eUEF
	 XFG0nNxg9vgvP87RRdp4KsgXoEcLLjYBWEIYQ0+4tqlMqkqCeH4jd0+1XknbX3fVMf2Fx
	 IpKy1INNYOrxF33tYJLGR//0maoWUUiNxEAOVnnHq6HJOQrzqFIwwWFsJg3BY4h0KIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571649;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U0hFfZFqkn7CoDWwgk8yDqp8fa+VP07aEXq9RW+yvIk=;
	b=1dJiS6R7porwHG7ijQBHvyMWpqOGr14lFAu0wMgkvJenV0pAUsogICY9Y6ZHT9quPzbD
	 uzpUXYfif9IgD1ig4xWmaOzllT+8poLe6tPaHBAo6eUxiiaJpOMKowdIYwmhd/6oClzny
	 Y6A+ddV4hSa2K/OQRk2t0MxjwSO4NY8KkCnS0WnTrwT10cj9sqfgjDPL3g6kZwhZCnXUC
	 SuI0R19BX6Gz1vUbgCV9uaL6T43N3jAI5qgobBaAOpu2zsDsxJVuM3VS1wcRnj6Xa8yF6
	 /z35kjM/VcPLXBDV82IVOm4xCwaUykWYzbFgsuiT2aeAPTEBArc/c0lzpn3jRvI1/OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5zbtFJU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3ED606A32D;
	Sun,  1 Nov 2026 22:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5zbtFJU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEBF1F000C1;
	Sun,  1 Nov 2026 22:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571648;
	bh=U0hFfZFqkn7CoDWwgk8yDqp8fa+VP07aEXq9RW+yvIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b5zbtFJUox77/qiH81MzGEqFAAZqchI14dcoMcPHQLeg+4UjIuDlVUHxEs8ZjUWjW
	 v0J9u9bk6ehqHlJ/wx2vRD5UnVHNHd0Xl2IbRS3k3DbAKHS36e3z6pJ+UNGNc9UTr8
	 ow/IFMLiyY0tG3RNEHBFOc5wRsLa/JdP+/MXng2YTrdoec76PXPRpx/EZWBb87ASSj
	 d1W8zZ5dS3+AayDam+VloTjhD8bbmV3Qb1FE6X/2F1OFx9Cf/0LL9aa1Y4OVzIeo9S
	 PqFmAnRrL0VjcDdNy9MrdSElYCF5GT50rK0zd10747zRQRTizHHG5oujKtODPkGOk6
	 IEvrOWIuxsVTA==
Message-ID: <sashiko-outbox-192706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] hwmon: Add Broadcom PMB PVTMON monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-6-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-6-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:20:47 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Expose the BCM6846 die temperature and seven voltage inputs through
> hwmon using the shared Processor Monitor Bus (PMB) regmap.
>=20
> Register the temperature channel with the thermal framework so
> existing zero-cell device-tree thermal sensor references work.
>=20
> Poll for valid samples with a bounded timeout, releasing the PMB lock
> between reads. Report temperature in millidegrees Celsius, including
> negative values, and voltages in millivolts.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-xg6846b-bc=
mbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org?part=3D6

