Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB126F28D;
	Wed, 29 Apr 2026 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472906; cv=none; b=Zdvm7mH0rA2cNzvkh/VeroOlLVUvfNyjkf7or7AZ4Q39N6tFtAQ6VzkOf2JWVAMNE556QhM2FiLNAVi5Vb2LwfK+q/pRWbP3Y6UJZK6iwzCwm1ujtM+lRumQnP5WAk3zRgy4gCPIDGMj05gLHBbl8TZQYN5dMtgOGDH5C1JCv9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472906; c=relaxed/simple;
	bh=NG7wnStbNGVSAyuO0z858ZLJDnWlS6H44BMy/Yc3QyU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CuVRgm8DS3hQQlGLBdDOkjlxrp6kmYxbXk4gn1xXnMltEHFPKorrvNlagFeiR6dGjNeuEUx721STS9Q1kcEPOyuUZhmI0IzYeeI2Qy+xr1xH/0XOQTCZXQ/vUrd0D0/4TjsNvpUUxqMl3P5M6wUAcOjiFcAk5afhrKpDR4couhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIRtjrT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIRtjrT0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9C9DC19425;
	Wed, 29 Apr 2026 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777472905;
	bh=NG7wnStbNGVSAyuO0z858ZLJDnWlS6H44BMy/Yc3QyU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eIRtjrT07U1BuQAtMlrSVQZ9LmUGDj10M3/RVMnxp8+ifKGkZ4HpSEdXylsvcZoa2
	 4eoZZh08xiM59d1o6JqyZaW8H2mcet+yuE6eEBe93VKmO9HLLS0GLWvFyvw3JAqgTt
	 AV2BCubKb/ZNSFVz5cV4kHens53FQjHOvmIv0Po1bKjFfe/45CGl85AQ/ZMCu9JQPp
	 x1yZAAdPmd1ro7acS5VpP219rPEHzisn3sySQsfGbLO02edqL/FE2QhcD7edekH5uA
	 UD92jG/IRJ3vco1XKUQU5IJyEd+ceH7h8IluhqXscOERnR34ytpEZvIQlNCdihhMuV
	 +OfEdbIQDF8nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B159DFF8875;
	Wed, 29 Apr 2026 14:28:25 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v11 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Wed, 29 Apr 2026 15:28:25 +0100
Message-Id: <20260429-ltc4283-support-v11-0-27ccde619dad@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOQW7DIBAF0KtErEs0DHjAWfUeURcUQ4KUGgtcK
 1Xkuxdnk0Qoy/+leX9urPgcfWGH3Y1lv8QS01iDEB875s52PHkeh1owBCSQIPlldgqN5OV3mlK
 eOZAM2ljnOqtYvZqyD/F6J49fNZ9jmVP+uy8stLXvrYU4cB+8EB1gsAN+2tFe0mnv0g/bsMU8A
 ahbwFRAaTF47LpBo2mA/gEooBboK/BN5ILTqkcSDSDgSUDTCgK2HwJSUKR64eQLsa7rP79Y2VF
 1AQAA
X-Change-ID: 20260303-ltc4283-support-063f78acc5a4
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777472958; l=2151;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=NG7wnStbNGVSAyuO0z858ZLJDnWlS6H44BMy/Yc3QyU=;
 b=gUGEFQCje73mGm/tKWu/14p63uX6sHrdYTPKrCSRt8QAir2sDiCmCa7D2DItWF0PGosEJ/Mp2
 Vhz5mDIKiJQADoYmyy6Ws5DoYACSB+kweAMtxjZlw5RGo8vAY8goH54
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

This is v8 for the LTC4283 how swap controller. 

Similar to the LTC4282 device, we're clearing some fault logs in the
reset_history attributes.

Guenter, for my last email worrying about rsense low values, this is
what I got internally:

"10uOhm at the smallest sense voltage of 15mV would be 1500A and 72kW, which
seems a tad excessive. The highest currents I’ve seen are around 200A, and
the -48V market 4283 serves is generally a lot lower than that. Normal values
are around 200uOhm.  I’d say the resolution should be around 1uohm and if a
minimum is needed, 50uOhm is probably safe."

For the resolution, I'm pretty sure I got the tenths of micro
resolution for ltc4282 so I just kept it in here. So, if you don't mind
I would prefer to keep it this way to be safer and changing that now would
require me to change some formulas and I would prefer not to do that at
this stage.

---
Changes in v11:
- Patch 2:
  * s/LTC4283_VPWR/LTC4283_CHAN_VPWR in ltc4283_read_in_alarm()
- Link to v10: https://patch.msgid.link/20260428-ltc4283-support-v10-0-4f26f46491c3@analog.com

---
Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4283.rst                    |  266 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  218 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1795 ++++++++++++++++++++
 10 files changed, 2590 insertions(+)
---
base-commit: 30a90fa04af6937493fbba20e3e923b5b5a162b4
change-id: 20260303-ltc4283-support-063f78acc5a4
--

Thanks!
- Nuno Sá


