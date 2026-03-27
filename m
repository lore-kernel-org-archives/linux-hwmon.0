Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666F534DB4B
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629325; cv=none; b=ip4MV5oVUlqC72WNWTsC4hd8N7mXPBfZDYYozeOt8e4nYmJE0U1jxOsmp+ihdLcU3boF6WQCxBGWoTLzM/zOQn6pU1F/fOpMfEv1yWl2imfIV/WQxxeV8TQvCBhCazbDbL7IkSGRVJjGXAaLh11Jo4W1+2eKkyrVgej5nOKKf28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629325; c=relaxed/simple;
	bh=wqiNOl1lDvijilY9uyMxJI00M0Y8PmMX/abDalPSgVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEBylke9xk1hdPtj0Ga8rrmKJlBRQbPv7PQrnxvKAetI27ClQxmmRTp9DHpMSN/H761jR6qVR4aMBoR8qfglr+9HlA01+cQAytkHaRCMiouAs3fmzX48T33XrvUA1KEctBWDC6KK9GjanNvzdxmFddCrglBWl+p9H8MnmNbSZeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w6A9G-00066Y-6l; Fri, 27 Mar 2026 17:35:02 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w6A9F-002PtL-0i;
	Fri, 27 Mar 2026 17:35:01 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w6A9F-0000000DnCt-0aqk;
	Fri, 27 Mar 2026 17:35:01 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v7 0/6] mfd: Add support for NXP MC33978/MC34978 MSDI
Date: Fri, 27 Mar 2026 17:34:44 +0100
Message-ID: <20260327163450.3287313-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

changes v7:
- drop gpiolib irq fix and make pinctrl more robust against NULL point
  dereference.

This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
Interface (MSDI) via the MFD framework.

Architecture overview:
* mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
  linear irq_domain. Harvests status bits from SPI MISO MSB.
* pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
  the MFD domain.
* hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
  fault alarms.
* mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
  temperature, VBATP) to an external ADC.

Initial pinctrl implementation by David Jander, reworked into this MFD
architecture.

Best regards,
Oleksij

David Jander (1):
  pinctrl: add NXP MC33978/MC34978 pinctrl driver

Oleksij Rempel (5):
  dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
  mfd: add NXP MC33978/MC34978 core driver
  pinctrl: core: Make pin group callbacks optional for pin-only drivers
  hwmon: add NXP MC33978/MC34978 driver
  mux: add NXP MC33978/MC34978 AMUX driver

 .../bindings/pinctrl/nxp,mc33978.yaml         | 153 +++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/mc33978-hwmon.c                 | 548 ++++++++++
 drivers/mfd/Kconfig                           |  15 +
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/mc33978.c                         | 933 ++++++++++++++++++
 drivers/mux/Kconfig                           |  14 +
 drivers/mux/Makefile                          |   2 +
 drivers/mux/mc33978-mux.c                     | 136 +++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/core.c                        |  41 +-
 drivers/pinctrl/pinconf.c                     |   9 +-
 drivers/pinctrl/pinctrl-mc33978.c             | 836 ++++++++++++++++
 include/linux/mfd/mc33978.h                   |  92 ++
 16 files changed, 2800 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
 create mode 100644 drivers/hwmon/mc33978-hwmon.c
 create mode 100644 drivers/mfd/mc33978.c
 create mode 100644 drivers/mux/mc33978-mux.c
 create mode 100644 drivers/pinctrl/pinctrl-mc33978.c
 create mode 100644 include/linux/mfd/mc33978.h

--
2.47.3

