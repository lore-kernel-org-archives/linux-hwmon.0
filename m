Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	linux@roeck-us.net,
	jdelvare@suse.com,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v6 0/4] pmbus: Expand fan support and add MAX31785 driver
Date: Mon, 20 Nov 2017 15:12:02 +1030
Message-Id: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew@aj.id.au>
List-ID: <linux-hwmon@vger.kernel.org>

Hello,

This series introduces support for the MAX31785 intelligent fan controller, a
PMBus device providing closed-loop fan control among a number of other
features. Along the way the series adds support to control fans and create
virtual pages to the PMBus core, the latter to support some of the more
annoying design decisions found in the 'A' variant of the chip.

This is the sixth spin of the series. v5 can be found here:

    https://lkml.org/lkml/2017/11/17/910

v6 fixes an error-handling bug I introduced in pmbus_set_page() with PATCH 3/4,
as pointed out by Guenter on v5[1]. The rework implements his suggested
solution.

A few other other minor fixes are included:

* PATCH 1/4:
  * Avoid potential NULL dereference in pmbus_get_fan_rate(). It
    amounts to being an error path that should never happen in practice, but
    lets make sure we don't die if we do hit it.
  * Drop a redundant test for the presence of FAN_COMMAND_x in
    pmbus_add_fan_ctrl(); document that its presence is a precondition to
    calling it (this was already tested at the one call-site).

* PATCH 2/4: Avoid scaling an error code in pmbus_pwm_enable(). Rather, test
  the result of pmbus_get_fan_rate_cached() before performing the scaling when
  switching to PWM mode.

[1] https://lkml.org/lkml/2017/11/19/280

Please review!

Andrew

Andrew Jeffery (4):
  pmbus (core): Add fan control support
  pmbus (max31785): Add fan control
  pmbus (core): Add virtual page config bit
  pmbus (max31785): Add dual tachometer support

 Documentation/hwmon/max31785     |  15 +-
 drivers/hwmon/pmbus/max31785.c   | 285 +++++++++++++++++++++++++++++++-
 drivers/hwmon/pmbus/pmbus.h      |  41 ++++-
 drivers/hwmon/pmbus/pmbus_core.c | 265 +++++++++++++++++++++++++++---
 4 files changed, 575 insertions(+), 31 deletions(-)

base-commit: ded0eb83449e8fcba22fd2736826336e101ffbcb
-- 
git-series 0.9.1
