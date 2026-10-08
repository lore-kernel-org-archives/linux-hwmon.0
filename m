Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7DB3BD638;
	Thu,  8 Oct 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450181; cv=none; b=g8J0GraE+oNx3DeEhLcLC3ED2vgXwPFZ7DmFIyAX+5GMvYjF0u0r1zKAz2GtTXYfTCeK+NUYf0aeu3jJzRRYJaWgWk0+DZ/DTtydD67LJTaYvxCigm7rs9f5Ad+/JmYj8+Tu2Eav8wvlTD0QyLjavM+wlkiykwE6jBpdPQdW1Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450181; c=relaxed/simple;
	bh=TUulWu8rcYPG0hTUghVfgvj2Q0ZxzVUemAXwGFOLiy8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sj6DoTRXzObSVdj4GnL58fqdx+tVDJNkGQncqJfrVYHTTSoBml1Zq7pnM2YDEolqd6oWUNI0Jp7KaS/G8PPHktkF8i/6IHnxwY2RhPKOGAbHlRwu/jyBBDZetYNdI8mPyYuwVjsJFDK0GhiQXQzPifDj/gkvwoo1O7m+hzTl0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCr6V+7l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCr6V+7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162791F000FF;
	Thu,  8 Oct 2026 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791450179;
	bh=Y+Wix+iXONGvlb4peMW+1OGrpxAQeEihJ4GKzSyiBEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JCr6V+7lt5Y59T9LznoYuJg8xvpAE7Ne3x2EI1s8RpMSntiuL/eMSg3Vcwt+CM9qS
	 22ROiHFHuFITHcIDL943sBVtGTWFbiBECMeuIIHjkPRPj44UrHviO7mNP8ur7AUllt
	 Jh3pM0z0pLHEC6k9+/Eb2ybNFB9hgUOCYz0fKVUPAxf5lGC+Oi/jEz/DvjfFNY9Vx9
	 L5TW5/5gFacrFg9HyV786IRFFD94WndAr0bQ/xRhBsiy1Du9d/A/iLIIz8e7atdY6w
	 ljH0BOUjuVAWAB+VllaSqwwvyrWNJSqWzgQhfE0t8FsApmWeqnwl+5kFTzaP16tW0H
	 ZCgcCNTnKUlFw==
Message-ID: <sashiko-outbox-163883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (starfive-pwm-fan) Add PWM fan driver for
 StarFive JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261008071950.4772-3-changhuang.liang@starfivetech.com>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
 <20261008071950.4772-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:02:58 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add PWM fan controller driver for StarFive JHB100 SoC.
>=20
> Fan speed is controlled through up to 8 PWM channels supplied by an
> external PWM controller and exposed as pwm[1-8], and one PWM channel can
> drive up to two fans. The tachometer block supports 16 independent
> inputs and reports fan speed in RPM through the hwmon sysfs interface,
> along with stall and low-speed alarms.
>=20
> For this controller, the special clock and reset operation sequence is:
>   probe: clk_prepare_enable() then reset_control_deassert()
>   remove: clk_disable_unprepare() then reset_control_assert()
>=20
> Co-developed-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008071950.4772=
-1-changhuang.liang@starfivetech.com?part=3D2

