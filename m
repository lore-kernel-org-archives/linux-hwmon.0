Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415150;
	b=uCo1nt+r9oLuMSTKaJAgTy6ijSfo3BT+6UIyuP/VP+vIuX5GwQlZesReVeYNWwm+Bd5J
	 G0nFwE9W+ueUx1knspD6NGAqW1nJL8a+4x9GNR0wXofv/war48qKFJXAbEu4vD7Lea7Jp
	 4WPL/9j2ZMkGfo2V2VbDEPiNFQ6BDUt5VxGvdx8Ge9Ayic19I6MFlY3Kf1MbVXqqjmQ2T
	 saIRyO3JNjy1F/wyAZInfQ9q1ajSKtvE0xCKI2CE09/4QjkK4NxxD/gVi4g8AQOigS3gQ
	 jUVBn22VMQvEmQq2CqlZMQS89H8tv6XRBMMBgMjrvm3OhhIVsJD2FIUHXA6QxQ3pARw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415150;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5J0yu4HwvsfqgTfPJEsXkj+XO4ZeyjSXCkstNP1O/so=;
	b=JDiqGY44Gv2Tk+AVuY8Lnok40hV7I9+YTcEyGA4XkPdTZxQOqMgK49EGcOQShBzA/QcP
	 MNfLmvHXE97FmY6wXoqVA4Q3uPR28peJ1e/6cUt/8N4Cx/Gu2P2PSz9N3PZKEiKA8WVnb
	 F+E48Ie6Mu+PibBM9WPZwQ2awOAN+Yb6i+DsysG6uAeUywn4qYUEsVtaRt0Dah64WbgQJ
	 8e3GBl3xr+4mJ4Oe5vRakq8ATM0VKZE+2qMJkL8YYxn01Wg1hMaHNaI8hz52C8lvFUIQt
	 jzVFgEKCsvchkzcYcPjBMdLyVpLypcnWzQvHxtr7pvfqqYdnb8F8YQgp9yPzwIij75w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/vdz5fF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62D5606A32E
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/vdz5fF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2971F00A0B;
	Wed, 11 Nov 2026 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415150;
	bh=5J0yu4HwvsfqgTfPJEsXkj+XO4ZeyjSXCkstNP1O/so=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=H/vdz5fF0VlnoeUhx0HPNLIaINfadVn5T1vdLdMy6zMOniU689Uc51U43jeRrllR8
	 SX9fBW/JfVDcN742Jeh3tj6eRicSUxcasFeqtEeydqKdqQtx/6weh/a2LBDEctL4/k
	 QwQGN8Kl4jn75BtM49VslOeXynICp8EWNMONGR2thyHzby1BPc6y5yGKOqkAoburAJ
	 cMYLZGscOWpZnvszRJE0LVtQU0J3ptf4+AldbwOxQ+ZUN2/FXdoGRPye0FIlU5/yrf
	 q3TTe56sVZCRZ8ji7yTZqXicQBPb1WoEU4hvNXrPIzj9H5CWbugtbNheAvGRIhe2Xd
	 gTV6JlN6rhGFQ==
Message-ID: <sashiko-outbox-209302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero
 pulses per revolution
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:39:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A fan sensor cannot produce zero tachometer pulses per revolution.
> Add a minimum of one to the shared fan schema so every user rejects
> this invalid value.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111161619.2321=
41-1-robert.marko@sartura.hr?part=3D1

