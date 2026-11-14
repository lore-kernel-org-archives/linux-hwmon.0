Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649154;
	b=ZHLsHoG1/964LRNGceWKhjUeZtNl8cecJLKOG1rx/+nzyYxdbhhjYEK2uBwcFi+pdxGv
	 GNrQPL86SqXqUnRpcSQX227rHMM5L02OoJMuftSQS47BJTA6p2bH/z/ZS0FXJ5BVPzvja
	 azL8smIdsryz4XKaHbjQZzIwOE9ToD3UeG7aURW2nYFN0Ce2YHQiw5PJT1IW1rrEl8lOM
	 YQUGX+wVS+QwAd8jjSTNhgavUnEk0zhS+5329yBrK6NM7qrva37jbcTzPmSWepxI9Gi4B
	 fzk64jE1Zid0MfHt2RPFz7mhf3sB7VT47nLDEJTaz+qzk+CnWEvFK4IbhyhbGDhDo3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649154;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vkbrpNMgbiqgAuN6PEEpt85TLtNuQFk/77AqpBw4qFs=;
	b=mOrYmjoLGRS+2JSuTu6Bt/uC7xbp0gqEr3aGiPYx2WnbQ9WP16cF4HHZVl6m4q3fYZdw
	 FtYoS98yUpnZYVFzPda6TQWMFAcT5by2rgJ+QJuLobO4kEWYr7/tR/wL08JpCkMET+BNL
	 nSFXEIAq/0fB1Josfxk+OKz1ZJD07+kh0yKqxJhOHRBKz2w1xXgM3Etk6RDRpXthPceZs
	 kV5SugVC8m8YkulJ/8KiHIHu04r2b8kAoYmUlCyuujla63pUCo5Lkl0I0PQALjwmylm/a
	 Ll+wfnmROm21elEP131lk2krASL3KtGLTu53Dwr07l6kg+3yLVyx2W1TeFs8Ia+AHHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQpJbWBd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89A606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQpJbWBd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A60F1F000C4;
	Sat, 14 Nov 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794649154;
	bh=vkbrpNMgbiqgAuN6PEEpt85TLtNuQFk/77AqpBw4qFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQpJbWBd/UwlWxnp9sGgPlCuQWjADj016Iferl1Be2C2L8oJ5Q7N8AFrnCVsDi4ZH
	 xNM6pPxLIOgjaHY9rpnyNqchIvpLzSzgBl76ddB/5jP/AwpDl/rsjCqAbXxKJKi8f0
	 sHKx7p13LP1sBGrSFtb5fqy7rMjX0C+adsdXnmloqoDlVvawyARA0Fzy35ZYVnAuXV
	 4+H9sLVqalRY2GZRmOAODPuAYwUQLFatejXE3KNXWDNu9WEYGOUsYC+6LOdbOfbxIh
	 JwbP/cRHoXdRyLPy5FtN+QsOU2NTBMueRwKBu5qYx0J5U5Y5ndItvxbBVTiUx8aZjE
	 w8r46F6/DGmDA==
Message-ID: <sashiko-outbox-214331@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Add customer ID for ASRock X600DC-ITX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Herdman" <lk.gzpc0@passmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261114-nct6683-asrock-x600dc-itx-v1-1-cbccf1a627fe@passmail.com>
References: <20261114-nct6683-asrock-x600dc-itx-v1-1-cbccf1a627fe@passmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 09:39:13 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Samuel Herdman <lk.gzpc0@passmail.com>
>=20
> The ASRock X600DC-ITX (BIOS 2.02) has an NCT6686D with customer ID
> 0x165f, which the driver does not know, so it only binds with force=3D1:
>=20
>   nct6683: Found NCT6686D or compatible chip at 0x2e:0xa20
>   nct6683 nct6683.2592: Enabling support for unknown customer ID 0x165f
>   nct6683 nct6683.2592: NCT6686D EC firmware version 1.0 build 12/23/25
>=20
> The change:
>=20
> Add the customer ID so the driver binds on this board without force=3D1,
> and add the board to the list of tested boards.
>=20
> Tests:
>=20
> - With force=3D1 the readings are plausible: the CPU temperature (AMD TSI
>   Addr 98h) is within a few degrees of k10temp's Tctl, VCC, VSB and
>   AVSB read 3.36 V, VBAT reads 3.2 V, and fan1 reads about 1450 RPM.
> - With the same change applied to v7.3.3 on this board, the driver
>   binds without force=3D1 and reports temperature and fan readings.
>=20
> The patch and this changelog were drafted with an AI coding assistant
> (Claude Code); I reviewed them and ran the tests above on my board.
>=20
> Signed-off-by: Samuel Herdman <lk.gzpc0@passmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-nct6683-as=
rock-x600dc-itx-v1-1-cbccf1a627fe@passmail.com?part=3D1

