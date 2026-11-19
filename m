Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047262;
	b=bJaY7PCw681thcftdDMGRBzVAL/ywYy7aeyawWAqK3kGexdggbzTBYKS4vwCwnNPly+m
	 pyLJOJbWBJ2djmiU5bQWE6NeH/uYEyY/uNGdi0pXHxxzrZocyEs9RtK1iFRATgj+x0cqA
	 clABwpie4qjdTRvS01e+Fz/I6gZp395/1KXh5slS8IWTTaL0i16RctPM81bNdcED7r4I+
	 QrsPoHC2Gl+BgqYywSpYQGHiLCI3RsWpcOTmKYXIPL50eyetluJwLfkD8qIjMoP1WozsX
	 hWJR2P1A/mDlVvXtWaI0ymeZ/C2/Ctx+o1w9cxCP5QyERAOr7SSscQrStF/Y7cPuW6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047262;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aJ6RXnWvUlLjnvBnI/AiZTS+x5R+CJ3ka3Z1tghdPvs=;
	b=t7Jh8umavvJdwy3Veunm81+0OL5g+QUR8tIgIwUCOb7z+8MLDvTeBwrA/cdH/+/DeeyO
	 tARU3sBg36hpIdUoEk816VN8Upy61q+D7hJgdYNG6Dr7rQbg44oH3N/dBGGDD4lsKaEH6
	 fBLwLh/baZjNUk3DzadxrRTpdQv7e4UsbcUxDeIWT6iOaFgZAGfRyvA4EyBDtUUw2qCKK
	 vwyTyL+hCYaE3haZu4O1en6RH0i4bcZxGJzNMoYLvrT1WjPB7qykgEVb9kaAHI8TixQ9U
	 jrp6mJJOHqMeDpy38RF8Q0dwF3VJfN5z8HLtmkqKBS4hwSTc1qpwCKYpLCX1DqJp5FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fEK/iZJ3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B799C606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fEK/iZJ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2CE1F000C4;
	Thu, 19 Nov 2026 00:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047262;
	bh=aJ6RXnWvUlLjnvBnI/AiZTS+x5R+CJ3ka3Z1tghdPvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fEK/iZJ3SJparGNTp8MZzC1hym9HK0TqukT18daWsn7FJrhA67jSNzJq49INQ3Rgh
	 JuoMKouCgja+yPztNqMEMrGAfXKrWGKk6SnZxEASJo5cIbxlXffAhK3T4lmAfIwbkK
	 SBvMgHcFnDJiMsoodmZT46XjHEFrAN5VPCGF2W955TBKs4rs0WAGc+EzIXltwErksR
	 Trpg9QarVzn/BTob1fkcPmdGDRmspQs+rm/gTgGujSoaD47HRCjiV7vg73vEk5CHpo
	 teUDaGOTvCeLREnS8g8ttqypD4jNetQrfYNMrPGZQ1+I31vmiprbrHH1XMZESNyt17
	 awNFibDxb2zmQ==
Message-ID: <sashiko-outbox-222238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] alpha: marvel: refresh environmental readings
 through the console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118-marvel-env-v4-3-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-3-200317e496c2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:14:21 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The SRM console keeps the readings of the temperature, fan, voltage and
> power supply sensors in the power and environment (P&E) nodes of the
> config tree (GCT), and refreshes those of one node when asked through
> config tree callback 0x28, function 0x1f. The Alpha Architecture
> Reference Manual reserves every callback code it does not list, so this
> is a Marvel console extension; its code and function number come from
> Tru64 UNIX. Define CCB_CFGTREE in asm/console.h, and add the callback
> and marvel_cfgtree_partial_update() for a sensor driver to use,
> retrying, as Tru64 UNIX does, while the console reports busy.
>=20
> On an ES47 the callback takes 13 to 300 ms per node with interrupts
> disabled. The console callbacks are not reentrant: a refresh on one CPU
> while another printed to the SRM console killed the second CPU, and the
> service processor reset the partition. So export the srmcons callback
> lock and hold it around the call. The lock is declared even when SRM
> support is not built; there alpha_using_srm is the constant 0, and the
> call is compiled out.
>=20
> Tru64 UNIX makes this and its other runtime config tree callbacks only on
> the master CPU, and the Marvel PAL TOY calls are already known to work
> only on the boot CPU, so make the call there as well.
>=20
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-marvel-env=
-v4-0-200317e496c2@gmail.com?part=3D3

