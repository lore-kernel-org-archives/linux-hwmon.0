Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DDF3B27D8;
	Mon, 21 Sep 2026 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975194; cv=none; b=pn0Fw6hiTibIMXsmeTPjFSWhAFcwyz9OLpeNSz2u4FXMTTl2xDytw9G1V364j1O4lcNOsvnhPKTdX63X7bpsilEW7w72SKt2vLQvEcGAAX4Pxmd4X9ah0CwFqIV3TmuHGzc8xpXT5BJAwqm8+zwy94EGXoBrvXw3j7kmee2Bep8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975194; c=relaxed/simple;
	bh=hZMNM9L5Ot47uD7Xuv67Vt+qzrHh+5ysWGC07qpyfpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eDHYR4vO1HUjt3idDLImvgcf1qRkAUUbsO2Yh5rI16UkC+B5Rz0uIGVpTxqFNmnD0eEBH8wE2sxDEzGSZBGwHDrYwFr+auLSyXA9zDujyzUuQAYs6hrdQbidr3DerLtUhNKb6UiTKHzb88+OtRim3ebrYd8nOSY2WkoYdGXIf18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1MjsJ6H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1MjsJ6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0130A1F000FF;
	Mon, 21 Sep 2026 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789975193;
	bh=hZMNM9L5Ot47uD7Xuv67Vt+qzrHh+5ysWGC07qpyfpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O1MjsJ6HO4GVdJoESAgpwAhSo7u3Z0EJP/907mx5MVhFuw2efSSfnjy2kfdYO6cTz
	 /TAJNGMc3OUUg8Rp2Kavwxk/xZbyJ8JOeZinCjTYDyGy17zfnt+71IT+kbHLGHrPtz
	 ApYVbB0XoP7fHf95IH0pviYDwlrbwQ7LrgDd40+96tieT1b+PMecMFHpqUw92xRtkB
	 vNs6eVnGnWW7zkrr7778F5ncrj9WQZD+89LrygEVyUKMLKpH0kRVXM1VNwHEy3KMi7
	 K35s5lJXtjj7LJGuKomDMzCNOZWqwFBig1YnQE9McaIK15l7deloioSslW96vqXKbx
	 LSnOaFdlMQp6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:19:52 +0000
Message-Id: <20260921071953.0130A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.
>=20
> They are compatible with existing 2-rail non-TC controllers
> and use renesas,raa228244 as fallback compatible
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-add-raa229=
639-and-raa229640-v3-0-b104ee8a70b2@gmail.com?part=3D1

