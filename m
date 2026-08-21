Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C292F5A2D
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313908; cv=none; b=SEuI/pohqJzOuymr9o0HD3hUsaCjsa532KnvTAcYQ4vX/wlPkNgJeb648NbNyhBfONTqNQ9fucu9AFW4nkPAX+3ypMxckNI+sfgbyoOUf1EYKZNmGsuleRsr3jh8d4jNuGivFfhI7fdmyXis6nwArEmYhqq7sZEwXJ5DVYnRusk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313908; c=relaxed/simple;
	bh=8zjhh9Marup0xjb+znrLCc82gjZYAZkyVDWofYwcJMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqJ2npNfP8VJ31eN1zY2S8r7ROwbACZAT3yZbDouWMSvI2HtjPoK2qlo3JDKR24PUScb5UjwAN0Mv4+ucE2x8TjuXIPXdGhY49i2ha6lMyvx06Sz0WwakhIXymJQl/79cuUhtNuNQr7RlwIh5IQLoHaInxCPAz2xq47eJz5AQlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSk/p0Sm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSk/p0Sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3921F000E9;
	Fri, 21 Aug 2026 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787313905;
	bh=8zjhh9Marup0xjb+znrLCc82gjZYAZkyVDWofYwcJMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PSk/p0Sm6FD0fT3t+az7NG217o//oEAkn6ZOJdtxIO++nNSym+QHB8wup/DBOYwGS
	 SWkyPyCmcfPyERE15nYnocLCdjD0acSQdSsm0F8BwsvIDYZE3pmoGAp43nf8W1nFGu
	 yERqsYSLOgp5wiSxPV7mdPk/7JAExaDoXSVyW2U3OjuDakj0cZA4Mqu8Kw6zW1zU39
	 42lEfPYIP97WXh9G/Y7NrOG61X72pjirqICm4czZdoIn52vrmT25d8k/zpt6W+k/vG
	 VP9gpryIvSwmeCakEBWPfrSkBjcX2ecj3WdZl7EoVdtNv80p6qGX2u359Ix4e/rkuf
	 Ddf9I9nvfLC7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) fix format-truncation warning
Reply-To: sashiko-reviews@lists.linux.dev
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821115703.2017414-1-hanzhijian1991@gmail.com>
References: <20260821115703.2017414-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:05:04 +0000
Message-Id: <20260821120504.CA3921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> snprintf() with "%02X" and "%04X" specifiers on an int argument
> triggers -Wformat-truncation (and thus a build failure with
> CONFIG_WERROR) because GCC assumes the int can hold a value wider
> than the destination buffer.
>=20
> The value comes from i2c_smbus_read_byte_data() and
> i2c_smbus_read_word_data(), which return at most 8 and 16 bits
> respectively, so mask the value to make that explicit and silence
> the warning.
>=20
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821115703.2017=
414-1-hanzhijian1991@gmail.com?part=3D1

