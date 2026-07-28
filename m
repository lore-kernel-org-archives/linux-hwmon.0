Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C8717BED0
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198661; cv=none; b=ZLN9dRZjMRh88oqxRFRrYLUFbOgQIIS3uUrHhVaqx1dqRSoPc2uvg3lpWnHMsRZkSdGlDzFeMEyYJRIBTxACoyXzD8EDxqoeRqlchjIRdwGthhALSSicGbSwaLAuvoHciO7DEEEF/NsRtNisGO6iadymTgf1Felt+jBr/l4KPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198661; c=relaxed/simple;
	bh=vijDjqP5e8JatwAvE3hhDS+Zkq4Ft9PLl086rKG76MU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jgK1Gk+fRzZ470XQj1Q7uwB7VlWloC+MIpWBU1ux05X8ytefheKvrOHGSOy+g2Ek1zbaFXtLTzVS5EZG1qf17ygT7r3ghw19dO3CI2ZckNZPGP0FF5Mq6obEYabde7LXvC4ZaYjxrmfz8GZe5mwIME7YXoNkil8auc/dwZiHpyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oySTdD2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oySTdD2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AD11F000E9;
	Tue, 28 Jul 2026 00:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785198659;
	bh=vijDjqP5e8JatwAvE3hhDS+Zkq4Ft9PLl086rKG76MU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oySTdD2QxISDpUY/9qqDFe4kRRaBmX3OhWTCpG9+1Rh7HSq7kHMMg7PLj5nCjdwic
	 3/VR0qhC9ZiF1RMYWjVAcBxwp+QpqebmycAijDyM7GBueviB99BiMzP52c8IPET760
	 AB3WQMzWq4NjJydeQMh6HBEj5RbN31vKlHGcdWX9RSUKVgNCG7iky1UPlQFKx079ng
	 5h4eP7MP1P41Wjz043CA5sjOumzLE6Z4rIsZ3ye3gkQn+5qfaWnSP48Krjf2kq+bxN
	 q7i2lF8oOHn4MaendlbL1EtQFOFW1A1QKPx+/1cjgjHtjsLq48hFRYq0Tb0vtksDWS
	 F/Z8cUPlzayfg==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 1/8] hwmon: (adt7470) Fix fans stuck in manual
 mode on I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_fixes-v2-1-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-1-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:30:59 +0000
Message-Id: <20260728003059.B0AD11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> During adt7470_read_temperatures(), the driver temporarily switches
> the PWM channels to manual mode, performs the temperature collection,
> and then restores the original configuration registers.
>=20
> However, if an I2C transaction fails at any point after entering manual
> mode, the function aborts and returns immediately. This leaves the
> configuration registers un-restored, permanently trapping the fans in
> manual mode.
>=20
> Introduce a recovery path to ensure that the original PWM configuration
> registers are always restored, even when intermediate I2C operations
> fail.
>=20
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel=
.org
> Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_fi=
xes-v2-0-598e38a46ba6@gmail.com?part=3D1

