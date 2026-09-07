Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0547242983C
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Sep 2026 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768236; cv=none; b=Ax3j9RkKh8L4IL3u+k2P5yVtI+M0BaGhJATTIuTWJfmb+0zNjoDOmezexOiUw82XBwCaSDHbmab3j3YlBo7EFZH2gpqgvK+0Q8EEOedKp3iAFwp/SzUY2ZRnwhl6bmp9UaByK/e5LqS0i20txtI92zvvno5Ip8IbpDkMJ8/yguw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768236; c=relaxed/simple;
	bh=+1WALVSgU+96ydsznM42DBPttqsYA8kTW33dzeoE6M0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XC+oglDK5RSZeS4VQIGoUSR/52/S3i92uUmrWy846bcnTwYLsYmLENmU0yFwJeWP9oLnPMij6vxDkK5mJXzpigA79U/cBhG3nO8xqDG5RzSPpWEumroeU028ThUjUr+2YH+BUaga6g7NBvf0Cu/zBOC+5HLlFOySfJOGqG4tmYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdmM1nko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdmM1nko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4EA1F00A3A;
	Mon,  7 Sep 2026 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788768234;
	bh=+1WALVSgU+96ydsznM42DBPttqsYA8kTW33dzeoE6M0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cdmM1nkono6DJtL65aXr5sTg4osPcswdfRmN23iL1BuLsHHtPgziNl1DQ+V8t4pTS
	 vBPBaWqfFMlxwmP47GfqkaU4HihhiEWPBo2/HU3oFvTagkqx8HnpE5XzTsTuCSopUN
	 JNe5D1Tp0og0Yr26st0YHG46udfnBG/Bkoz/Pdym4RmlQcGadEq3GiQOnDkOs/dzdv
	 dvPzVaTzrolyufbKkVMvI2dpP7M8i7o9vgqbrdaRjxcM0xXYw2Aca/koZ6bmvm+GFS
	 uVL3yVGN/M67jUt5hXGg271Mq0ooN7YGMVUM/d/7XfzZmXM7mCn2dd9SjVak9/6bou
	 yx+qGp4XcnOPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/ltc4286) Add writable shunt_resistor
 sysfs attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carl Lee" <carl.lee@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260907-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v2-1-5f47f7e5a1bb@amd.com>
References: <20260907-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v2-1-5f47f7e5a1bb@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:03:54 +0000
Message-Id: <20260907080354.8C4EA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The LTC4286/LTC4287 driver uses rsense to scale current and power
> telemetry. rsense is board-specific rather than a fixed device
> characteristic, and may differ across qualified BOM variants using the
> same software image.
>=20
> If rsense does not match the installed board configuration, current and
> power readings are mis-scaled.
>=20
> Add a writable shunt_resistor sysfs attribute so userspace can update
> the board calibration value after platform identification. Initialize
> rsense from shunt-resistor-micro-ohms as before (or the existing default
> when absent), and validate runtime updates before recalculating the
> current/power scaling coefficients.
>=20
> Signed-off-by: Carl Lee <carl.lee@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-hwmon-pmbu=
s-ltc4286-add-runtime-shunt-resistor-control-v2-1-5f47f7e5a1bb@amd.com?part=
=3D1

