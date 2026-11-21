Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289732;
	b=jCBM9IwI/9KvpALjAlt+6CdA8sVrsPAq0Ur7GcOVtzEoif8+aG+YKf7LWXZtF4CmYprO
	 mvOTKkGNs+ts7o3217wOG2JTfb2iz3h4xCs97N8q3tveUCjFRbVy5/IzqKcgIrCCF/2XT
	 +YvujtvBvWuYYom75y66TxMFzCsocIeZ0rHwRU/tWuUTyvjxFvWyusEccp7IHyJmNDOYQ
	 fIEM0qbnHqvucdjb+Qv+4KkKrEhmKqe0WE3v4CuGbBPYM29qz/ORgGPTSrKr9dZEUHFRg
	 yXQsndPY50AY3FXn9xcnhY6PKn3e0NPA2rFyKoqvn+p2PrUx5FmZT5A/Qjqu2Ihfukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CsDaR96uSC+AjdY88DjuIns1ANIUrH+gjUfwgk8qVRw=;
	b=dT5dygS69WS1iD3ZSjQzHSyUT0ESSi4hCT7S/2x/XUnourx4QZMBTeXRimrijGU33x2e
	 y6qF8q7DBTR4p9zmhgR639nicleA2jW8j3YMyhTU7Cm3gyCb38BTBjxyz3CvKjGifJL3W
	 EWNj/fmBJq+s+qN39K4+tgEhnaiF15fPYQBafrkLl6Y/8f5Snke4W2IBzolud+seaGz17
	 10VZO/DAbqd18lL/GfDViGQq4RzqSkfAhjDoZdbPrF5f2h2yQ17XDKXPSHQH5EosiPmla
	 Ikxm5apW1L0cvhyl+b5j47mWsYpnLznhdxe0MaSWF9zoyMzUCdAagrMk0BmOJLztDgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bFDAEiyX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50F8606A320
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 19:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bFDAEiyX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3E81F000C6;
	Sat, 21 Nov 2026 19:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795289731;
	bh=CsDaR96uSC+AjdY88DjuIns1ANIUrH+gjUfwgk8qVRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFDAEiyX8ntMxb7/D31Sy8U4zqKUsR28Yh7hAEP3Ax02GDLQ1UcfD8C/rVz48gP4b
	 nlZlTVyOefU2ov/QRVqHmdCUP1Y9Z6kku1w56YCEuto5HQ7jfHcRUUHRvDcJ4mQ31p
	 r+MGV27MU4Iu5Wq9K7VvAnn9VkryPh8eK7wM4GNQ5R+m0CPFQiLByVJJvDVSCH9LJz
	 rau19NSf2luKCgEGrLbwvyEiaeXIT+2MII+KtkfvdXHr+LfTxkSee1YBQpsXpk5M7/
	 KyoY7PNf8raqEAJnUuyjXDZA4coB/H/NnV8AgbuIBnfChUwI9vBsWpFIHsxad8UirU
	 sAcfCUWj7poBw==
Message-ID: <sashiko-outbox-227313@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control
 whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivan Popovych" <ivan@ipvych.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261121193227.9408-1-ivan@ipvych.com>
References: <20261121193227.9408-1-ivan@ipvych.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 19:35:31 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
> running "echo 1 > pwm1_enable" disables automatic fan control and
> "echo 2 > pwm1_enable" enables it back.
>=20
> Signed-off-by: Ivan Popovych <ivan@ipvych.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121193227.9408=
-1-ivan@ipvych.com?part=3D1
