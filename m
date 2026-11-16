Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873281;
	b=du1dbEjUPH6aNT+ZCvzXRo1FF/sr2Qx9qcIuBvRJmwgU54goK/8YZk9IE92/wCgTiA3k
	 tzRYy/MB1cRlLw87Kp6QQsfk8k2tREGeSjBv2BoD0EdfIxR1JO7cot46ggbhUPFi4k7/F
	 /8bNHIO1xGTxqQgJgt7QeBXuiWhAVGpzvzBeeVjsutDfo7IwiCL+QMk+rqiKRz5M8aorg
	 UL2XFzQAnxrVJaMlSf5rW9sIq+8JR/f4XxrGeCalW1aRAgnYXv0TdOndjq85AmpGx2PaH
	 49qwxHm8b8hCp0+XjGQ5+4XESinBJUGjyeFPo7PxYjhrR9W65EMdjAOL/yr6btJgcAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873281;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UAmwRgERXEcHmvj8ZrYNeo2vM35pU27K9ir/k0seK8I=;
	b=Y48Iu59xQ7MzxH56FdJcDSB7umcsiXG1XYmxzawHkoxhXYYHpZowdAyimvVXvFEzDMxd
	 kdX6EB15E/LfdX1M646IkcyBqn0YhC/5jQnVwDoxFmldX5Ld7InmeDNc91KMSmiry/Siy
	 /DqeOT4PJ1mH3k/Fu6IzKia1jbGXzsFBBdNkQRH3a1UqXFuBPnZi29fEF3qtt5IT+1A8g
	 eEMBu5IGOUv0QlrII2cbyntcHzEvXJjQz7kLx4oIBismH/Qg4b3lofMEIkK5gA/CUy3ni
	 KCBGfiXSOW6LFsGTpvWeOvEoxdKo6ydba6K7RQrgS95xndjzbE2ms5idK4vWDol6O/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx8kqFNS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD988606A31C;
	Mon, 16 Nov 2026 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx8kqFNS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753431F000C4;
	Mon, 16 Nov 2026 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873281;
	bh=UAmwRgERXEcHmvj8ZrYNeo2vM35pU27K9ir/k0seK8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fx8kqFNSlAIGYZ2+DjzL8iiKRX3KcY7fZgKkYIE+ySf9mCotjDBkLuxso3q14dg9y
	 +/5quGaiVdXuvZRfblnObzpcOZjQtP3vfBgiQE1qVxotoJOibfTeTKyPYXuLwkk640
	 WJGvo3KHdX5ESbJezEoOU8+AlhEUw5ossRFlLUfZIjP5sjWrFx+O7BSgW/BcsVQaML
	 JAb7S0Y2DtOi7v/Ws9yMuy5XwNEHsHv1qDR7NS4uccuOfC5YLQiNMcP6sPNlsP132V
	 4i7VzGSBHcSfKkRCj4jDx6sV5fMq6UQ5C8it6ktftGa+qJIntii02BOXkXMoADAM/O
	 wY9vLzRepALbg==
Message-ID: <sashiko-outbox-217937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] reset: Add BCMBCA block resets through the PMB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-xg6846b-bcmbca-xrdp-reset-v5-4-f584e8b8e696@kernel.org>
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-4-f584e8b8e696@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:54:41 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Implement the BCM6846 XRDP reset group through the shared PMB regmap.
> Assert all blocks before releasing any of them, preserving the vendor
> reset masks and ordering. Provide the independent PVTMON acquisition
> reset as well. Serialize complete sequences and hold blocks in reset
> on failure.
>=20
> Consumers must enable their power domains before triggering a reset
> pulse (i.e. the cycle of asserting/deasserting reset).
>=20
> Suppress bind attributes: it's not good to be able to unbind the
> reset driver for the SoC manually.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-xg6846b-bc=
mbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org?part=3D4

