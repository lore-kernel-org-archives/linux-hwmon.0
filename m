Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0110726C3BD
	for <linux-hwmon@vger.kernel.org>; Thu,  3 Sep 2026 00:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396565; cv=none; b=WbxqqGrAxCF1pPYCz+igCSeC8OSSDG/gmxDX9ft27bN5cW8V+mHpUoAXOqnVfuPEhU5qQ0y0SB9Ox45Mqc40prIKZ//DmVhoP2kDtCIC9dBzFu04ppLukRsVgB2ZtcXmP2204RBj+VMSfO1qvpcoStQEY5e4MqdAtMo7NRim7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396565; c=relaxed/simple;
	bh=Hs+/AMuqtPbOhJaaByK1DvEjYwiOYwzRG7XEMfiRT/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JVS3VNYTdblTji9Q7+snkoTf2vJQi2W7FbvaHmPwWwaWXXqaLgAvK1s8ifuV+Vi+pSvRYE2B4pwiK+ns8TypNPevYMpV+aV80ooKISwZ63M4GR4ZQm5uIEfb1hfQt0Foobs3qLZTX82TKk6NIAMpzpmje/iKHnZqz0+ZiGEvgKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ej5Re6QK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ej5Re6QK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EC71F000E9;
	Thu,  3 Sep 2026 00:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788396563;
	bh=Hs+/AMuqtPbOhJaaByK1DvEjYwiOYwzRG7XEMfiRT/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ej5Re6QKlWkCGA8vWHCJVFWQATIzOD1sVpvMU8ng1IJYN4kIrt3WUeiM0zzntW1sE
	 uBa5NykiWssbUocXzS+mTsFaoCvploZPtzNe+1eOZPQZDcFa9D3ORwqItBaKWTigbN
	 z9FdEDRiqocIcuVOnZ5LAPqesLcdIqVDSKQlFv/rE0IvZArAEN7duck//9fPs8yOr4
	 9LeVBfKzXH+Qm4v9ayj9xOrHXvkyP7VbFmSG05HoNz29B9yUDQDLRSsxHQb7gx6Hwb
	 vi/ii81qzNy5b6A1/uCJWHvQVYXXkXoML0P5KNlHTlM2lfnk0otq71a/r8wSyhHxT2
	 zRYkgmuUkGU/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus_rog_ryujin) Add ROG Ryujin III 360
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zac Lanzon" <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260903004054.502171-1-lanzonza@gmail.com>
References: <20260903004054.502171-1-lanzonza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 00:49:22 +0000
Message-Id: <20260903004923.62EC71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the USB product ID of the base ASUS ROG RYUJIN III 360 (0b05:1aa2,
> USB product string "ROG RYUJIN III"). It uses the same status report
> layout and cooler duty channel as the RYUJIN III EXTREME, EVA and
> WHITE editions, so it can share rog_ryujin_iii_info.
>=20
> Tested on a ROG RYUJIN III 360: coolant temperature, pump speed and
> internal fan speed report plausible values that track load, and the
> internal fan follows pwm2 (30% -> 870 RPM, 40% -> 1590 RPM).
>=20
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903004054.5021=
71-1-lanzonza@gmail.com?part=3D1

