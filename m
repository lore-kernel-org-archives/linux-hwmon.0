Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024159;
	b=eFvwRxSbZMZtk5bXBwP4GkxhJdg8EbCoM7etjrRLZhcSp9llJCqC1Rm6A7tHLnllzapG
	 6S1q9TvlxhC2jka5EIkAAGh7zH6dh2U8TwpUgukWgPxoZbtONgO6CVSSHYzCDRbEhkgw7
	 U5cOlBrs8lQFk7QSlal7k4l71AytugjvGpbYcQORmFAMuZTK3LM1oj0Gop7DXsvo4leCX
	 SGmk93LR+MOp8g6FRQTpiEyJTZpzg8GTWsc+sNcG7SRJjPtU1nJP3Bl06dNLtWvWdHLGk
	 4NTEi9FGyQ+TkFgOkr2E2+DTtYPTvf2FascleiBNY1LVr0pRR8Emhmk6Vji3dCQftdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024159;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w36wnrC08V7Wnf1inhdEsJeR6DXIs1N3T37vYOkpVd0=;
	b=tCE/4xRSIfJpd1VSV9WMOFnjYE+pTh4/v/85R2r4xOON+rmaqX3ao8nKlazrt1BNMCrt
	 u815bb8c8ytDApitI/9pMpViM+VqCY7zBoC6ILg64oWMuqQGXU5m7eOUDTIAQqFgWECMI
	 F4XkGxMMc8sK7TlDfGjFpj7DJq/gB3fQKsx64D1r4xp8csESfy3eoXHon+Vz1tK1Bqewm
	 xgtYaT+QqDmu3oxUx3V05nYqRbqzREbVjlm+Z6ciT+ct2yWmnaHPHgqFvsZs2YTgIF+ac
	 WtNLmZijWQRxrZw1qm4O5w2KM5UQKDrmwd0Kp29p3viM1RjtVarGfqtZZ231yzpARfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTFMsJxM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2044606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTFMsJxM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9851F000C4;
	Wed, 18 Nov 2026 17:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795024159;
	bh=w36wnrC08V7Wnf1inhdEsJeR6DXIs1N3T37vYOkpVd0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=UTFMsJxM+aNpjwJ/RNWnhRuk6XGqaZDGtROHQA6MgRoOgRugA/J8ZZbrOwPsiXmJV
	 Cst7eyrT/ekFSdQGgXVR7+HiN6E92HUz9BwlDotBpfFad50Lt9V5lhn99Q/xrT02rQ
	 oaL/MOpXDTxukKKxkFyumJPS1rTIvk2rKpf9Gn3C9pgs5T+Zgo6HC/yQf62u3EeEqu
	 ygTeP/EcocmxwCrORrb9QuXOMDU0aDH1qByAoo3xodS93GrHCO0LHXgODiQQZ4m7WB
	 gqL316+RF5fxbFE9TeQJ+9KflIJ3IEOOgJ6aPL3XPESHuFhakh/13JoMfFGOdHsqrf
	 Gt74kgmXAwgEw==
Message-ID: <sashiko-outbox-221696@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (tmp401) add channel label support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bruno Thomsen" <bruno.thomsen@gmail.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261118174334.18759-2-bruno.thomsen@gmail.com>
References: <20261118174334.18759-1-bruno.thomsen@gmail.com>
 <20261118174334.18759-2-bruno.thomsen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 17:49:17 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Read the optional per-channel label from the device tree and expose it
> through tempX_label, so user space can select a temperature sensor by
> the name the board gives it instead of hardcoding a sysfs index.
>=20
> The channel index comes from the child node reg property. Reject a reg
> value that the detected chip does not implement, since only TMP432 has
> a second remote channel; accepting it would add a tempX_label with no
> matching tempX_input.
>=20
> This mirrors what lm90 already does.
>=20
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118174334.1875=
9-1-bruno.thomsen@gmail.com?part=3D2

