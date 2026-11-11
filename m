Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386031;
	b=Tqs3bNK1EIukvdgaAYVAOWQ7LUBtawIX4cHJvyV6YZ2dqu/BkUlQByahIU6cJ0eyqSEp
	 0imvE4yvxym2iKk5TIeTlpTnMU0FpECo8OQU7guObH9pA8quN8PTp2DfcDRnSzO4inuJi
	 dw3JSDbwRgr+sGOwOjPiSFtiYW7+F37lDvceDLC1wZhCzGabEGqRN52RD214zg0BH7Eka
	 kVXi2uY9i4Dgz1THIT9AVjYsk6aq2WPZLYujsZ0Q/mger/L/e+gFUqewHwc461vPFxZ3/
	 L1+aWcNdlARYHjB2no2ZR8YvXsjwYTeEEeZkZ0jbtBeubyxbh4TfCGBRPsccO3n880w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386031;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bzlDCzzebDJMtka76NXAheJzm61wj8wuWXLPaI3MFbk=;
	b=O5OwyxT2VfsYAKrY3PfWyggZC0lorNugd+A6EVPBuI0wog6cXWoVMVGPV4zrI0ymS3pG
	 KiKrQNb2yQtgresQy0SCwOB3481pwuEKRptsirWWyjI5NzO98xJHQF0KIAJ4gbkD+XWzl
	 SOmxDaa42AFOhUV5sXxXuu5vYqHmsyOG2zpTr/T9o3JQPT7pkXKlK69rZcCSpoNj80Je6
	 GmuV/3HjYBYt62BuKaZaAFkWxl15BDJr0j5HX+9frj3r2l7pOgyv80q7XAQPIb2ha51X9
	 WH1XHo3v1hZv8MBz45G9J0SM8LzT7Q2vEfAYfsSjvQdogm5WdT22LOHyDPUABqrgA1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PF05DCpl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF7E606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PF05DCpl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912D91F00A05;
	Wed, 11 Nov 2026 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386030;
	bh=bzlDCzzebDJMtka76NXAheJzm61wj8wuWXLPaI3MFbk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PF05DCplGnSNiucEqNhfV+MNb2USDznu6HDZhb/YrAGyEbSzaX7GNcvzebHKZ2D3e
	 mOEL/BIl/CJZG1VraphZIo52kx37gpG0b2je0viFHIpk4tAfYfiwfaQKmwvF5Fswk5
	 wxcprDeqnN8ywgLHwfuSYDvpxxLcE73m1TQazElEmvMZL1/vngKflDnnuJvESMxYqt
	 2qyQFhYbgbqeZClrubeTfoQzBYiGMu/ddAytgpWyc9dELsnaSN8FUF58ry0YTLdaRQ
	 fK5c8zZtirVjQynZcwcdpfpMHlnoZ3ybKMt8QInKLE1YsutZz+kNbxM1At4p1P6c6+
	 1xpBTJf69+eFg==
Message-ID: <sashiko-outbox-208615@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] hwmon: (nct6683) Restore automatic fan control
 on driver removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111082838.1418051-3-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-3-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:33:50 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A fan switched to manual mode through pwmN_enable keeps its last duty
> cycle after the driver is unloaded, with nothing left to adjust it.
>=20
> Return the channels the driver switched to manual mode to automatic mode
> when the device is removed, using the bitmap kept for resume. Other
> channels are not touched.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111082838.1418=
051-1-jdahlin@gmail.com?part=3D2

