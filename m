Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064181;
	b=Zk5GdnBRqyDnT/D6FyboZtxT7lKwengaiBesZ9IWhjCfAk6Dx+vFDoF0bL91OMN+Bp3d
	 yjql6iTMIGzC4fISWRQC5lPeaAtt9mNj5XQjMVoc6p6XIGKr5UsiX10gV38qP58DiudP4
	 MXkN/8t8VNEM3ebpGPlW2QXI/IvrJLKzQJTWpuJGr5CrxqFXV9BrZj/vMD9shKmkmlhO/
	 JqPj/o52yr/IPY+9eG9P556q7y77/EyLU4Bk5QgMZUbaPr+hasxixdul4qIh6VwbTBDPv
	 /OQxcoAeYqohqfL00MPHyuVYMDIL+FKq2v3sE3IFaE7yZszUh4xXwlq038hG+ehip3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064181;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lB7F17SvBMP3e3d3dadkDswvmkoqRCdgTSO+D+ZqJ6Y=;
	b=mCyi97uidQfRxlm6wqBhwbCTZQURA0D7Sq3B1uysKY9vSDLsOyGr/lkviBzbHVzmlia+
	 L7DilsxUBeqdkZMcRPhSPVrbS3RDUC+5Cir4adrx7Bkeyy7HTM+cJuy+FXUviTmZu0DTO
	 yaxsKzjOTw8PV8jVuF8W5z0J0fphP6OzSSHqn3OoAlYmzXg7/kladtIdqPeroJasoKnM/
	 ZlmrJf8LrvxFAd4ka2nKsbJ6G8wMM0wpy+SUtIvymTOtTiPFWy58b7s6x5kbx/7fx0xHO
	 Bq6A6zbevEa+mQ9bGvILuu6TQlA1Q7bgn1trz7mMAwdPYpuxr5vCX+2b3gUQ2R6ezLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abJiGZLG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B656606D809
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abJiGZLG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C0D1F008A1;
	Sat,  7 Nov 2026 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794064181;
	bh=lB7F17SvBMP3e3d3dadkDswvmkoqRCdgTSO+D+ZqJ6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=abJiGZLGEInZvfFHzURnW+bcBUh3dGumOeVzrZ7SOsR6FZbOua7yeB92wtQLz7e7d
	 RUfarqB7wV0ctaszD67i3qCe7J8qvQGMHH8XZn1Zt+EZCa/OsL+3RzeNZ+dUdTcPBv
	 gQ8joWNEf71e99AtRBLirhSMaxs+wNZDIGDoJ9Z8shI4K4y/huxNNGH0n6HUpMwOKG
	 r2oZN2lE8yJiApT7S9yWtHbgPyYHGPvJLWGSfZqoOdIbtlVYmzB9abb6KTnM6v17HK
	 9HlCA4NYlstZ/Vz4xxtMppEScR4R9CFzQWgwp5c3ksA6NwXA7H0mtyfbpOGUzkk7hI
	 RprlS7ySPVyEA==
Message-ID: <sashiko-outbox-202986@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Remove the 32 mV voltage scale
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261107150619.297999-1-tomasz@bojanowski.me>
References: <20261107150619.297999-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 15:09:38 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> in_from_reg() is meant to scale the VCC, VSB, AVSB and VBAT sources
> by 32 mV, but show_in_reg() passes it the monitor channel of the first
> three voltage sensors instead of the source of the sensor shown. The
> 32 mV case therefore never matches, and all voltages have been scaled
> by 16 mV since commit 41082d66bfd6 ("hwmon: Driver for NCT6683D").
>=20
> According to the datasheet, there is no 32 mV LSB. On an MSI MAG
> B850M MORTAR WIFI (NCT6687D, customer ID 0x20d), VCC reads 3.31 V,
> VSB and AVSB 3.34 V and VBAT 3.10 V with 16 mV. With 32 mV they would
> read 6.6 V, 6.7 V and 6.2 V.
>=20
> Drop the source argument and the 32 mV case. No functional change.
>=20
> Link: https://lore.kernel.org/linux-hwmon/20261106144247.30507-1-tomasz@b=
ojanowski.me/
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107150619.2979=
99-1-tomasz@bojanowski.me?part=3D1

