Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879AD1A08AF;
	Tue,  8 Sep 2026 02:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788833948; cv=none; b=RZcYOIL1mRYes9gOsAW+87IXPd3LvzH+7vR2B0z1PZCccgwPYrg7TaK2TU6w53/x4qshORSOR//p7AatGzJIvyEqz2/BAtdX9Va1OZSgUM48+40iCvXZiShm7lsbu+w1UjjPvfR1eTsezIVAk9zRZGiM8JoEgSCSO/9wkP0bfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788833948; c=relaxed/simple;
	bh=ckZPKP6MIV+rGzRcTmVrwD7IJjzrjIx54TsqsetafqI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCv5UMaZd8HNpSd1h95jv1Nx2PW+vv440SFC0E5KNaAFFWvP3ysLpiD4wOzniH7ftRFygDmtR4xfH+gDikWQUCWxjSfj/+q4uuH9+YJzcDubnUUF0AmSMSlDN4NcFjwLUuROn/IMp1GroHaHIc8bXeBOEproDZD/Bgtm0i5OV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=J1VzTJPN; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="J1VzTJPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788833937; x=1789093137;
	bh=ckZPKP6MIV+rGzRcTmVrwD7IJjzrjIx54TsqsetafqI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J1VzTJPN3PJEscotfVTzDLDuDl6fXWsyan3PL/N2t175BG17LRYNdIFgZf6ND0tCm
	 MyIOWAqDbTc9joEQrcyXNyocVXtrMPZJymXoX463FBnm2ET0UdEvlI6TEhuXCPjOu2
	 2pDICjFgbkW9kGVFz3AQgqHsGIzMHWhvLJlPME3Cd7vdoTl2y1c06lcqba8KZYi2Rs
	 DKLf+sighk64oUPE87BliJgGaeFeyAJuIqleFSSgdlB9qs/7Bw94CQd11a/f8IGjCS
	 8lSqM81YR0u9O13NJ2CixiSe+I620FvlB/iD6+i9/Ms/Rm1wxYYHL19xXdn+5euQqr
	 7uQORjiGzk//g==
Date: Tue, 08 Sep 2026 02:18:54 +0000
To: sashiko-bot@kernel.org
From: Birk Skyum <birk.skyum@pm.me>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>, Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] platform: arm64: qcom-hamoa-ec: test sensor and variant handling
Message-ID: <20260908021844.42118-1-birk.skyum@pm.me>
In-Reply-To: <20260908020711.ED17B1F00A3A@smtp.kernel.org>
References: <20260908015650.84401-1-birk.skyum@pm.me> <20260908015650.84401-3-birk.skyum@pm.me> <20260908020711.ED17B1F00A3A@smtp.kernel.org>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: a76c158dbe87dbe248d5d35c808c3c4721c06681
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for checking this.

The test client is bound to the I2C core's dummy driver by
i2c_new_dummy_device(). Unregistering it unbinds that driver and releases
the managed hwmon child before the adapter is deleted. I reran the arm64
KUnit image on the stated 7.3-rc2 base; all seven cases completed and the
guest rebooted normally, including cleanup after the sensor-probe test.

The dummy-driver binding is also documented here:
https://docs.kernel.org/driver-api/i2c.html#c.i2c_new_dummy_device

For the hwmon placement, I kept the small read-only sensor path in the
existing EC driver, as huawei-gaokun-ec does. Guenter and linux-hwmon are
already copied. Would an auxiliary driver under drivers/hwmon be preferred
here? I'm happy to split it if that is the preferred direction.

