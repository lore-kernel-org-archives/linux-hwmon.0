Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	jdelvare@suse.com,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	msbarth@linux.vnet.ibm.com,
	mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH 0/4] pmbus: Expand fan support and add MAX31785 driver
Date: Mon, 10 Jul 2017 23:26:14 +0930
Message-Id: <20170710135618.13661-1-andrew@aj.id.au>
List-ID: <linux-hwmon@vger.kernel.org>

Hello,

I recently sent a patch adding support for the MAX31785 chip[1], but
implemented in terms of hwmon rather than pmbus. The hwmon-based implementation
was driven by a lack of support for the features we needed from the pmbus
subsystem but ideally that shouldn't be a roadblock to a pmbus implementation.

[1] https://lkml.org/lkml/2017/6/6/71

So on that front, I've had a go at modifying the pmbus core to explore the
problem space and provide what we needed for the MAX31785 chip. Namely,
exposing fan interfaces for both RPM and PWM control:

* fan[1-*]_target
* pwm[1-*]
* pwm[1-*]_enable

The interfaces exposed conform to the hwmon sysfs definitions as much as
possible, though there are some warts due to the nature of PMBus. Specifically,
the following details need some discussion:

1. The PMBus spec defines FAN_COMMAND_[1-4] as the fan rate control register
2. Fan rate control can be done either in terms of PWM or RPM
3. Conversion between PWM and RPM is configuration dependent and therefore
   cannot be generic or even necessarily provided by driver callbacks.
4. Attributes for RPM and PWM control need to be exposed to userspace, but only
   one set can be operational at a given time (constrained by the one command
   register).
5. Therefore it is not generally possible to support reading both
   fan[1-*]_target and pwm[1-*] without changing the control method as
   appropriate

To address this last point the implementation currently returns -ENOTSUPP for
reads of fan[1-*]_target and pwm[1-*] if they are not associated with the
current control mode.

Further, pwm[1-*]_enable is effectively invalid whilst in RPM mode. Maybe it
too should return -ENOTSUPP when read in the RPM context, but currently it
provides a value.

Further I've implemented the change of control mode as a last-write-wins
strategy, where a write to fan[1-*]_target configures the fan for RPM mode,
whilst a write to pwm[1-*] or pwm[1-*]_target configures PWM mode. It's not
clear to me that there's any other good strategy whilst being confined to the
existing hwmon sysfs interface.

Given the fan control implementation is driven by wanting to support the
MAX31785 device, the patches add some new callbacks to struct pmbus_driver_info:

	int (*get_pwm_mode)(int id, u8 fan_config, u16 fan_command);
	int (*set_pwm_mode)(int id, long mode, u8 *fan_config,
			    u16 *fan_command);

These callbacks allow the driver to use the fan configuration and command
values to interpret or return the correct value for pwm[1-*]_enable. The
MAX31785 chip defines several value ranges for FAN_COMMAND_[1-4] that put the
chip in manual, automatic or full-speed modes.

A third callback was also added:

	const struct pmbus_coeffs *(*get_fan_coeffs)(
			const struct pmbus_driver_info *info, int index,
			enum pmbus_fan_mode mode, int command);

This was a strategy to cope with the MAX31785 chip changing its fan
coefficients when moving between RPM and PWM control modes: The current
coefficients array mechanism isn't capable of describing this behaviour.
Further, different subsets of fan-related registers are affected by the control
mode change. Thus, the simplest solution with the least impact on existing
drivers appeared to be to provide an optional callback member. To go back on
that a little, I've changed the array structure anyway to make the callback
prototype and pmbus_core implementation a little easier. This justifies the
first patch in the RFC, which simply removes the ability to build any of the
other pmbus drivers. Clearly it's a junk patch that won't exist in a non-RFC
series, as if the idea is sensible then all existing drivers will be converted.

I'm hoping this is a reasonable start to getting the support we need for the
MAX31785 chip into the PMBus subsystem, and that we can evolve it into
something acceptable.

Still on the TODO list is adding support for variants of the MAX31785 that
can perform dual-rotor measurements. I haven't yet had a good think about how
to do it given the hardware behaviour, but given the design of pmbus core it
could be a bit intrusive.  Having sent this series out I'll have a think about
the problem, and will look to send a follow-up RFC hashing out an
implementation.

Cheers,

Andrew

Andrew Jeffery (4):
  hwmon: pmbus: Disable build of non-max31785 drivers
  pmbus: Add fan configuration support
  pmbus: Allow dynamic fan coefficient values
  pmbus: Add MAX31785 driver

 drivers/hwmon/pmbus/Kconfig      |  10 +
 drivers/hwmon/pmbus/Makefile     |  25 +--
 drivers/hwmon/pmbus/max31785.c   | 201 ++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h      |  25 ++-
 drivers/hwmon/pmbus/pmbus_core.c | 439 +++++++++++++++++++++++++++++++++++++--
 5 files changed, 670 insertions(+), 30 deletions(-)
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
