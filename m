Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C7556BBB;
	Tue,  8 Sep 2026 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875914; cv=none; b=lK8n5QZa2RquVTfw6UdIic6zAEiyHsB9mMcxyEjLHfTNsJkzWBXNfkkqjtDEO7SH8tUHMMzfceF2KuRBGozRxb2oftGvAPvR4Q2AG0nGCSpX62yhaEzrYIlkfLxzWDcOnTZMc5pxuisu7fwcBpK6uyy/wB/x290ZWosKTNnzDXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875914; c=relaxed/simple;
	bh=4ljdg9X/RDMMeKia53mKnphQ4jV489IigyF9Lgr2YcQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FV7zWiOyPzmE8vnZlSmZT2ZOLtB2iX6DXQqmVxklwunyR1HxIGBOh+cYfMm7B3lNgo0A4XuM77JDOy59hOE/RTZGaN6R4PJZvMpsRs7sbpLrtyBAJd8QKgEBs9yoPcfUJwnFZ1VHBxE24pbZYB4VqgUS3waYb3CJYvKiN3bW2oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lanbRVdl; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lanbRVdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788875897; x=1789135097;
	bh=J+ejzsFixXhki+ydp+rbVLM2D2aMoFR5jhFJ8lGJBDc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lanbRVdlTwRaGtWqqt/PtPAlOD9x+QCETVkOQJf8o2cL8WE8L7U1iJuxogdNDYFSU
	 EaEj6PhBGogR3BgFcHFDEV6ADIhyU3Em5BsERZ73BFI70TS/4Bk1r3XZSoOrKY1aF6
	 OYJL3j463UCy77OnI5Eh2hvO3t3o81SyMHVu2vRF0K9A0aZIFPw+rDwY4Tvd0vgTtV
	 OxWR4Fdvlv7Gjwd3VvRQUVK8i6PmqyuXCARMQi16/liiT9NVsg3P85ap05ttlKJqSB
	 bwAhVkF8EjPOssT6JwgTxrx+7UGAkIWxGdNSFgT2etLsikA8NGrPPeweYlJWWbd5++
	 khpLqs8hOtecw==
Date: Tue, 08 Sep 2026 13:58:10 +0000
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>, Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/2] Monitor Yoga Slim 7x EC sensors without taking over cooling
Message-ID: <20260908135801.81436-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 312da83be75772425d6b1a46e86e51a5b6d3e7c7
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Yoga Slim 7x firmware tested here (EC 0.99.0, BIOS NHCN62WW) returns
00 00 00 to command 0x42. The upstream driver correctly rejects that
malformed thermal capability response. Its legacy fan RPM query (0x22,
fan ID 1) and thermistor query (0x29) work, and the firmware ramps the fan
automatically under CPU load.

This series adds a Lenovo-specific, read-only path to the existing driver
and KUnit tests using a simulated I2C adapter. It does not replace the
strict reference-board response validation, guess a writable fan count,
or include calibration, LUT programming or temperature reporting.

Changes in v2:
- Move the platform-driver documentation from Documentation/hwmon/ to
  Documentation/admin-guide/laptops/, following Guenter's review [3].
- Update the documentation index and MAINTAINERS path accordingly.

Driver and test code are unchanged from v1 [4]. The hardware and KUnit
results below are from that version; no new hardware test is claimed.

This builds on Daniel J Blueman's pending binding and board patches [1].
They remain separate prerequisites, with Daniel's authorship unchanged.
The sensor transactions are documented in the public Yoga DSDT and Maya
Matuszczyk's protocol notes; Anvesh Jain P's pending fan-profile series
also implements the RPM query [2].

Testing on the Yoga with the EC node enabled and its existing 7.2 kernel:
- W=3D1 external-module build.
- Three bind/read/unload cycles; read-only fan1_input and temp1_input.
- Bounded CPU load: fan rose from 0 to approximately 2800 RPM, with a
  maximum SoC reading of 55.4 C. Original profile 0x15 was unchanged.
- Previous monitor restored after testing; boot files unchanged.

On the stated mainline base, an arm64 KUnit kernel booted in QEMU passes
all seven tests. These cover sensor decoding, error handling, compatible
selection, probe, read-only attributes and no-write PM/remove callbacks.
The QEMU results validate code paths, not Yoga suspend behavior.

Two design questions for this RFC:
- Is this read-only match-data path the preferred way to accommodate
  the Lenovo firmware alongside the reference-board work?
- Should the pending Lenovo binding omit the qcom,hamoa-crd-ec fallback,
  given that this firmware cannot satisfy the reference driver's probe?

EC standby notifications and desktop power-profile integration are not
implemented or claimed by this series. Those need separate validation.

[1] https://lore.kernel.org/all/20260526112409.66325-1-daniel@quora.org/
[2] https://lkml.iu.edu/hypermail/linux/kernel/2607.3/08806.html
[3] https://lists.openwall.net/linux-kernel/2026/09/08/290
[4] https://lists.openwall.net/linux-kernel/2026/09/08/96

Birk Skyum (2):
  platform: arm64: qcom-hamoa-ec: monitor Slim 7x legacy sensors
  platform: arm64: qcom-hamoa-ec: test sensor and variant handling

 Documentation/admin-guide/laptops/index.rst   |   1 +
 Documentation/admin-guide/laptops/qcom-ec.rst |  40 +++
 MAINTAINERS                                   |   2 +
 drivers/platform/arm64/Kconfig                |  16 +-
 drivers/platform/arm64/qcom-hamoa-ec-test.c   | 294 ++++++++++++++++++
 drivers/platform/arm64/qcom-hamoa-ec.c        | 157 +++++++++-
 6 files changed, 505 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/admin-guide/laptops/qcom-ec.rst
 create mode 100644 drivers/platform/arm64/qcom-hamoa-ec-test.c


base-commit: 28924df2a08f440c73991b83028032c901de2ae4
--=20
2.53.0

