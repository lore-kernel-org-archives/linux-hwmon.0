Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5943BED5C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Mar 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064188; cv=none; b=tCFaxALMUmzUN9ri9QYTrgFWCheE1X7Uqxm7FgX02M1bj6S4HSSQlWJ7fWgSCFcwQylxI17Vy9Ubyz8B358x8TuK8Al7xk2wHsvvA24W1bQ05FB1LwKx8VKmc7/RfwasfAAxQWtHzg1HO8hG44cKWqu9ey2dezCuOWpFKQtqc94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064188; c=relaxed/simple;
	bh=LtKJpqnPikpofhbIz9ppZHkNTL8KnqXyqyr//Dganwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mf5Fhw46tDNH9iVHU0CNZXHOwHgwFrY7B9VPU03DDT8LSlRIiHRWg5YVkz44C0mwsPAX4NnqRUEVwVYRyCPvQmf26PSLxOgkQnplFEiKO3tN3wxOEXDOHTNjQibYGUZEnJKxT+flSUmjeCKsWLm76ve+mzX4M7sr6CIdy8xqpsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz5-0006fe-Ed; Mon, 09 Mar 2026 14:49:23 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz2-004XYb-1T;
	Mon, 09 Mar 2026 14:49:21 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz3-0000000833W-32Qn;
	Mon, 09 Mar 2026 14:49:21 +0100
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
Subject: [PATCH v3 0/8] mfd: Add support for NXP MC33978/MC34978 MSDI
Date: Mon,  9 Mar 2026 14:49:11 +0100
Message-ID: <20260309134920.1918294-1-o.rempel@pengutronix.de>
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

Oleksij Rempel (6):
  dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
  mfd: add NXP MC33978/MC34978 core driver
  pinctrl: core: Make pin group callbacks optional
  gpio: gpiolib: fix allocation order in hierarchical IRQ domains
  hwmon: add NXP MC33978/MC34978 driver
  mux: add NXP MC33978/MC34978 AMUX driver

 .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 112 +++
 .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 ++
 drivers/gpio/gpiolib.c                        |  32 +-
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/mc33978-hwmon.c                 | 430 +++++++++
 drivers/mfd/Kconfig                           |  15 +
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/mc33978.c                         | 870 ++++++++++++++++++
 drivers/mux/Kconfig                           |  14 +
 drivers/mux/Makefile                          |   2 +
 drivers/mux/mc33978-mux.c                     | 119 +++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/core.c                        |  25 +-
 drivers/pinctrl/pinconf.c                     |  18 +-
 drivers/pinctrl/pinctrl-mc33978.c             | 749 +++++++++++++++
 include/linux/mfd/mc33978.h                   |  86 ++
 18 files changed, 2557 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
 create mode 100644 drivers/hwmon/mc33978-hwmon.c
 create mode 100644 drivers/mfd/mc33978.c
 create mode 100644 drivers/mux/mc33978-mux.c
 create mode 100644 drivers/pinctrl/pinctrl-mc33978.c
 create mode 100644 include/linux/mfd/mc33978.h

--
2.47.3

