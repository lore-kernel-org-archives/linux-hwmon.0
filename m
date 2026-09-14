Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAED0442374
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 22:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423965; cv=none; b=JJvAvW/nfXm0cHXV9x6Jk876DT6PuUCNA25upKe9F28WxQp2WZn3gskw8CWGZNXxRMDTKYjCyBN/r47BzXci2YdxFuUHTBR05oLzo/Fmh8BoemEv5uBuNHbi+8XeJd2jpIIV1uO/Df3mzl2RU8xKS13eNJqQZlGWZNETh9a130c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423965; c=relaxed/simple;
	bh=Zi5rvwuY8hw6ApPGg62zNUfpdP1KQ91Nda84sM2oE/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B/fjDl1vl+3Alztc7MYAXz69bq19shQo69CrPQH2VibE28sZbXqI9RiR3WPl4x+F1IyA0+MlSXfoFiJ3iD25jdddtW3hpuVx6lew01FzJPupqaoVcxdbR5oncz8ziAfdoeG+Pji2QlgdIJ2+EtongyiqRIt94QLKaC9CYkHh0E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/p9a35M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/p9a35M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B711F00893;
	Mon, 14 Sep 2026 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789423964;
	bh=Zi5rvwuY8hw6ApPGg62zNUfpdP1KQ91Nda84sM2oE/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/p9a35MK2Z3btx/vXNstPUhWpv85+OJFV/uBd2ZqACcBWMkmEVJ9I+v/VFM59da7
	 QO0IZvXQ4G6FzWjX7HZrEpivFyrjryan9yIl1am+VGiLEUXj9+dlg229R/WKrBmytZ
	 AYcsp3GLI00k63FfzmD/1galR4fLkF0vna894qGHexeQ95Wcjo63uyauYzkw5BR19+
	 v3PUKWvNqmM3a9x0RWApTo4zsAt0zILxXcjf3p8jAwndXTcTuKTv1EQvmi4Rdm2RBp
	 jeWy+Wn+dfCj2GtOqYdpnIP68Nxqpu+t7rhR9DILkylgJeRAj6uxxmuv6uffT2oTpQ
	 k0sC0gohIWPgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (aquacomputer_d5next) Add AMPINEL support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260914220128.287145-1-contact@vasily.cc>
References: <20260914220128.287145-1-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 22:12:44 +0000
Message-Id: <20260914221244.81B711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Aquacomputer AMPINEL power monitor currently exposes no hwmon
> readings. Add read-only support for total power, total current, input
> voltage, hotspot temperature, six channel currents and the device's
> reported current deviation.
>=20
> Decode the unsolicited 544-byte input reports from USB interface 1.
> Validate the vendor collection, report length and ID, and use the
> existing two-second expiry check to reject missing or stale readings.
> Keep aggregate power and current in wire units in the existing caches
> and convert them on read to avoid overflowing those caches. Reject power
> values that cannot be represented by the hwmon long value on 32-bit
> systems.
>=20
> Require the USB HID transport before accessing the USB interface; a UHID
> device can advertise BUS_USB without having a USB interface parent.
>=20
> HID matching also claims the separate keyboard interface for this product
> ID. Preserve its input and hidraw handling, including reset-resume, while
> keeping it outside the sensor decoder.
>=20
> Document the sensor mapping and update the Kconfig help. Channel labels
> follow report order. No vendor configuration requests are sent, and
> protection settings and alarm reporting are not implemented.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914220128.2871=
45-1-contact@vasily.cc?part=3D1

