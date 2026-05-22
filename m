Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC773537F8
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 04:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779425362; cv=none; b=ZB0JFw6KT7Tt/WOOlIzw7X9N4dr4VYwkEt+W215G2SDPGAdYq+Xeq4rO2gL5mXNBJIMUl4dGF+3kNcNOhtwVNNwGNCQMwiZjCif36OC76fUJgyFVXkfI7czHHS0adA7c+Abb3ta3jp04R0u2sZGrcHrdsblZSf9bJBYcTGHRxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779425362; c=relaxed/simple;
	bh=bzToLbFrLMw+az6HPNL8kxWfdbTtKRZXGnMYlWc8CGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sZ7z0CQ0dWSKaL+MnrxS/q+6LtDvk5EJQ6H1M3gLMnsmbpNJ8wctL6r3wyQFTgXFmtu/lUfH0tqLoa5rJYQsHyWH1sdyWmrLLj4lY6ePhx8TLKL7Uv5G9XbPCsqgZVIWFiDAkawO89IvcOxYEVXN+U1Nu15Oaniie55OpiHK+hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1wQHof-0007eo-AQ; Fri, 22 May 2026 06:48:57 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wQHod-001DGg-2O;
	Fri, 22 May 2026 06:48:56 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wQHoe-00000007RA6-0udG;
	Fri, 22 May 2026 06:48:56 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v14 0/6] mfd: Add support for NXP MC33978/MC34978 MSDI
Date: Fri, 22 May 2026 06:48:49 +0200
Message-ID: <20260522044855.1772639-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

 .../bindings/pinctrl/nxp,mc33978.yaml         |  160 ++
 drivers/hwmon/Kconfig                         |   10 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/mc33978-hwmon.c                 |  580 ++++++++
 drivers/mfd/Kconfig                           |   16 +
 drivers/mfd/Makefile                          |    2 +
 drivers/mfd/mc33978.c                         |  195 +++
 drivers/mux/Kconfig                           |   14 +
 drivers/mux/Makefile                          |    2 +
 drivers/mux/mc33978-mux.c                     |  141 ++
 drivers/pinctrl/Kconfig                       |   16 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/core.c                        |   40 +-
 drivers/pinctrl/pinconf.c                     |    9 +-
 drivers/pinctrl/pinctrl-mc33978.c             | 1042 +++++++++++++
 drivers/platform/Kconfig                      |    2 +
 drivers/platform/Makefile                     |    1 +
 drivers/platform/misc/Kconfig                 |   10 +
 drivers/platform/misc/Makefile                |    6 +
 drivers/platform/misc/mc33978-core.c          | 1284 +++++++++++++++++
 include/linux/mfd/mc33978.h                   |  196 +++
 21 files changed, 3721 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
 create mode 100644 drivers/hwmon/mc33978-hwmon.c
 create mode 100644 drivers/mfd/mc33978.c
 create mode 100644 drivers/mux/mc33978-mux.c
 create mode 100644 drivers/pinctrl/pinctrl-mc33978.c
 create mode 100644 drivers/platform/misc/Kconfig
 create mode 100644 drivers/platform/misc/Makefile
 create mode 100644 drivers/platform/misc/mc33978-core.c
 create mode 100644 include/linux/mfd/mc33978.h

--
2.47.3

