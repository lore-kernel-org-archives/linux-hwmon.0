Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617771;
	b=UErh0PlYZOQiWICoI7tYTzOyQ8lMQLp8bOzfLJLTpFVoqs53sAf6kTJB1Yb1tNC6az3m
	 FwcRSSjFLkaTLEs9CaHYlcRWVXQXLR/sjMvCusII6lk+plOeyyFqROPDW0cNrkPln2Mau
	 Z0aSxZOmHUJn7DSjSrMY/0ZU8wfLe2Ttm+l28xl2pUfKF90X3ClfZJCuW2e7F30lwlN08
	 POkpUObSP/IxwjuWGgBxDrccwUadPUlsCQpagYwiulwRLDKV559Ygxws/VTQsPumMcEkv
	 ip8G3SJq91urO8JQEtfsLmQtgXAghOzXXNi17njFNq3dEWsHtcVI3UbREtyDoRp9ZmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617771;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EfY64VEo9ECr+07HAK6wrCS8mfonVp0Emtab9vlKi3I=;
	b=XSQ4s8ISHBDWx7poRqC8xothpTdzB+NSPnt13ZbI06qHfSd/0RLwxjr7mFFHkKExPANg
	 g/Ktb+b8vdY6EK6VsFNvSTK+mSjVgY8RVGRzm7sR3ARtgJJBxkn6YhZO6KU6VyPTorWnN
	 vXkwM6HvnQSUB8vesz1+C+xw+sMGvcMiYmJ5kfiizIaomKhtlO8iwMEzqtjTAuo3dL1bu
	 Jz7Jmb4cAJGVq2V9NCxrR4VQO2rCDhx5EpN4ZTCzet5495GJSHAerqJJ/qNSG6TNiOesR
	 evKgqhehCgIo41G2jucHC5uN1EzBQQPnS8fwFprle37jtbcrjoDwDR/zipq4ZINRlOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8B4QYFf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5D606A337
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 00:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8B4QYFf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421971F000C4;
	Sat, 14 Nov 2026 00:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617771;
	bh=EfY64VEo9ECr+07HAK6wrCS8mfonVp0Emtab9vlKi3I=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Z8B4QYFf3Rn4Lx4gPQiVR7R0rtAx2vXqCqGZAUwrgcd6ACw17znzukJMj6mM7Rzlv
	 IifPaM60F9H+7TRpYBrVMNMEm/Gs/t6g+cvwDDziZohLWtO3rTVruN+NKVTSXQ+1mh
	 kkhlCTUi31GX/I9bjfwVeEEqTw+jmn0h20Nrv1bcEbZQUGtNm/uIiwe0alJ0m8GjEe
	 L2V6XU+dIn0hVYkK3N6t76w753ZtCY80QaMVTXVEFHTOjyE5vspV1cqbGb3K0XuAWs
	 yGbrwV6+t4erAfSNrw2rAU2/4swzO6GrYUrEQT/V1bT3jsdb1OCl7t4H6QnQhA1xiz
	 3yvrc6J2BvjrA==
Message-ID: <sashiko-outbox-213958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] hwmon: (adt7475) Convert to
 hwmon_device_register_with_info()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2w63DsCBTdGVpbm4gR2VpcnNzb24=?= <david@dsg.is>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261114004110.328050-3-david@dsg.is>
References: <20261114004110.328050-1-david@dsg.is>
 <20261114004110.328050-3-david@dsg.is>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 00:56:10 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Convert the driver from hwmon_device_register_with_groups() to
> hwmon_device_register_with_info(). The standard voltage, temperature,
> fan and PWM attributes move to hwmon_ops. The chip-specific attributes
> stay driver-defined and are passed as extra groups: the automatic fan
> control points, temperature smoothing, PWM stall disable,
> pwm_use_point2_pwm_at_crit and the VID attributes.
>=20
> The driver keeps data->lock, although the hwmon core serialises the
> hwmon_ops callbacks. The attributes in the extra groups run outside that
> serialisation, and they share the register cache and its periodic update
> with the hwmon_ops callbacks. They do not take hwmon_lock() instead, to
> keep this conversion free of locking changes.
>=20
> The sysfs attribute names, permissions, values and register writes are
> unchanged. This was checked with i2c-stub on all four chip types and
> several register images, comparing the attribute list, every value read
> and written, and the final register contents before and after the
> conversion.
>=20
> The hwmon core parses the standard attributes with kstrtol() and
> returns its error, which gives two differences for input that is out of
> range:
> - Writing a number that does not fit in a long now fails with -ERANGE
>   instead of -EINVAL.
> - fanN_min was parsed with kstrtoul(), so values above LONG_MAX were
>   accepted (and set the lowest limit). They now fail with -ERANGE. On
>   32-bit systems this applies from 2147483648 rpm, far beyond any real
>   fan.
>=20
> Signed-off-by: Dav=C3=AD=C3=B0 Steinn Geirsson <david@dsg.is>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114004110.3280=
50-1-david@dsg.is?part=3D2

