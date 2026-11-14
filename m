Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617163;
	b=3mo16K4Gj0ea6wpQHPRaoGsThfflUzeUGc613p3D5bp78BP//FuUzF7YToIYqxV1XDBO
	 GRWO7gPdSZQrhEWyHUk5oP5M+5HLg1eKtzQRBRHy21KCSFXxQt5wteO9dy/WT+wVsZ8NO
	 DstRjT10/ynzHotgUW/Emz6U8YqSAJeYkRcFKmLTLzHa8cohlSjQr3zXBW58grievwkIL
	 VjeVUplhXuGq+EGUw7mO2NfghojZXdgFFeQNRQOJfNlA/BtwmyPRsUQRGUDDMKfES9Myw
	 /WNL5TrzmSZWAC8llhxy1/JHaN3PYRVyWVBlx9Pb7Jomi8txFnk+GKnlb6mG2o4k4Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617163;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=siFKUSQ98d/aOk9+Ou6YXIP8DfN69LVHzc8AFLt7Aug=;
	b=D7DTCF/iuz11vgo3kP2ZRiDtnw/Rv1Ov+V/MARBJ026G9IUTedCxtbpIvCNzhpOMCMCM
	 GinYOHEzdCqx1SOkGq0km1p8ZziuS+Ym7Unn3b15u5i8RZK5dKr8GITG7bnYmTFcRN7gd
	 md30UnOO3XtAcdb0Fom+D5hJaE2e7xdIR0ft6cIt4kx6WhwpxORsIx+QgQPPXneQMp8wU
	 72E+MlqPeL5h3m05vTcSoVNzNmisX4GjYdns98ikTuv8QKLVOZdQYLAl3AKxyWSvk8O2s
	 xWJjUBSA09ITDmNmA4ucPxD4DD72iHfNlH13wrl31QTppLXgie9ArOMMcKEDfOS5MxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMnlDyIx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937B606A32D
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 00:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMnlDyIx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0132D1F000C5;
	Sat, 14 Nov 2026 00:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617163;
	bh=siFKUSQ98d/aOk9+Ou6YXIP8DfN69LVHzc8AFLt7Aug=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=UMnlDyIxm7EewLW02cu4gFgGL3UuRt6jpfdebqEvlxvhXDdr7gLsZn/IVowhT8dAt
	 +wB0vkQyMB3TVhteACvCre1FU+wdKsjAgcUpLRoQSoDCAbc6v4geqKJ4PrCsTvQ2tO
	 h6Jy242AC5Mg7mX/NOVPyd7czqxY9UjtK/Wi/9feu2+GYms7vo20+SxgKvCaqu1Fmr
	 qu6CDf8SJ/+LUotU7j2ZQDKp8nipZ3R3MvdU9VYhY1HrHc/4UZ6JjQNxfi1Iys3XTG
	 ZfE+DniKmrIZZ8m0TN4xDRFzGsJ/PB+DorZV7TMo37MiRK0zwScjTM3zXBdmuQXGBn
	 uUCmqqlLTuPkg==
Message-ID: <sashiko-outbox-213946@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] hwmon: (adt7475) Add thermal zone sensor support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2w63DsCBTdGVpbm4gR2VpcnNzb24=?= <david@dsg.is>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261114004110.328050-4-david@dsg.is>
References: <20261114004110.328050-1-david@dsg.is>
 <20261114004110.328050-4-david@dsg.is>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 00:46:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Register the temperature channels as thermal zone sensors. Sensor id N
> is temperature channel N, i.e. temp(N+1). Document this in adt7475.rst.
>=20
> The hwmon core reads a sensor's temperature while registering the
> thermal zone, from within hwmon_device_register_with_info(). Read the
> chip limits before registering, so that the temperature encoding
> (CONFIG5 two's complement bit) is known for that first read.
>=20
> With CONFIG_THERMAL_OF, devices that have a devicetree node, or sit
> below one (the hwmon core uses the nearest ancestor's node), see two
> changes:
> - Each temperature channel that no thermal zone uses logs
>   "tempN_input not attached to any thermal zone" once at probe.
> - When a thermal zone uses a channel, the hwmon core sets that
>   channel's min and max limit registers to the zone's current trip
>   window, as it does for other drivers registering thermal sensors.
>=20
> Signed-off-by: Dav=C3=AD=C3=B0 Steinn Geirsson <david@dsg.is>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114004110.3280=
50-1-david@dsg.is?part=3D3

