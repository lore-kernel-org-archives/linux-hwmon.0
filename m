Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673959;
	b=u/8XHtDGYfiVxPgSaoClL+clhN4XnbG/UTnOwCeAr1zpcx+HEQo7u0EH10bf7NZIVO5A
	 +QC10q4dXp9qqrwFIi0FbOje0IMk49LifOZYX7vB3fbTu8XG9tg1Gq25kPPciJz9ZDxIy
	 ooeWKjGjdRorZRlEO4VCbt474MB0StNNPkj5SEEIHMCi+oPUGg9fJJskl8akUiPJTT7w6
	 VcnEq3A6LVgytPv/+npLwfxp0W5owRk+iWuATFN0tZt7ApAaactJJ4eJ/lvvpOsRuYXTP
	 enkWMLRmK/CMP+gG/n/eack+TSR+gpA6NOFepfScd3mpz8hXQOotdaDcPOBUntLziKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673959;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tyZoF5fO1LR4/5lT5VJ+ZPM4dY7QomPIR4hI3EAVH7k=;
	b=ZR8o+NlipzcmnMxG7RGFsENn/aJsxExTJpy1NLgDye13ksacfGBXu8G4Pi+V1lVPUaOl
	 nuza3xPz8d1asR+CXNO4qPVYlYr9a6+T188fvzTzWgemWbeir4YRT/bbDMGPS9kMCw9MO
	 6IC4jqIB0o7fh4UQHxREV9CCYUYIghEKeItbVjRRaCcpMUwf5u1ZyI0W19o2BYYb6CDT3
	 hOXguIQsGQucfhY66pkpCFLAEbQRgAia5Te4nUibq95lp81PBLIxLcEB7n0Q9Duhftfyx
	 dLEgWZBXOJO1fUngmQ8dhLIHSEj0fCkNG2WBtIrkgAtFZKsvg7A4jo/LwGGNFPymqKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CTSwMArc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97B8606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CTSwMArc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEBA1F000C4;
	Sat, 14 Nov 2026 16:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794673958;
	bh=tyZoF5fO1LR4/5lT5VJ+ZPM4dY7QomPIR4hI3EAVH7k=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CTSwMArcF4Y16FfnwZLHCiqkBFviTY33+Rl3KU629f2RUYbzA1IhRAV5vAxCV/QDo
	 /+xlHm6GKQft+dTtOuKQ7NYF1EjowD5JlC8gXDjtsNvZr4/YV0kNxFKlaSQ3V36rtJ
	 asQoLySnrAJ7+ADkaIGCzpPnBC6go6tUu6mv6tt0hFrjydwJsmSKKUrw8R9y+yOJ/L
	 curcUIfMq0tVQbtSPe0yl2627pka0J77ovSb3jUfx7BukjLUZW2YXon08ppjXx+MqR
	 APkAgS2I0bAwarLwuiYUOq9FR7+VfOs9/bikeYene73neP44tZT/gl3WsjlUFb+T24
	 gJpGhdbnDpqvQ==
Message-ID: <sashiko-outbox-214754@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Use
 devm_reset_control_get_exclusive_deasserted() in aspeed_pwm_tach_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org
In-Reply-To: <bbbc7228-cf98-437d-b240-ad29ee7fb4ac@web.de>
References: <bbbc7228-cf98-437d-b240-ad29ee7fb4ac@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 16:32:38 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Nov 2026 17:11:34 +0100
>=20
> Use devm_reset_control_get_exclusive_deasserted() to replace the
> explicit reset acquisition, deassertion, and cleanup action registered
> with devm_add_action_or_reset().
> Simplify reset handling and remove the custom reset assertion callback
> while preserving reset assertion during cleanup.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bbbc7228-cf98-437d-=
b240-ad29ee7fb4ac@web.de?part=3D1

