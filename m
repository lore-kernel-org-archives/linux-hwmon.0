Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C05515ADC;
	Mon, 13 Nov 2023 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWmrFS/8"
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C70510D2;
	Mon, 13 Nov 2023 01:21:11 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso6428540a12.3;
        Mon, 13 Nov 2023 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699867269; x=1700472069; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=innazYWQ+vfDVD6O9tD7wqR7CsMf1eNCHewBVoN6FZQ=;
        b=hWmrFS/8Yc1hhrUrrTzzf2hY0N7K8F0SXuSWYTrD5OVfZ8UAZHZzetOBBMYTp983qv
         4GE9jRr6Zv68YzkP9SIgt4CAHxWPdQNfTmCOwhAD+r8eABw2zBCSry5bv38HAiMfpJg0
         L/+n0u93D9asLI36BjDq9OGZIl/MTFYnt7ueUiHM/d1M+jk2KSHRwNumNmg/21FRIViJ
         /pVgg63HyFFyIIgw68AiCEsR1EuF8UU8nNhdGJRekTf7HlaLdew8av8Jz8afTblUUYXn
         42vu7kwI9Rd5CKr5ap1Qpl7reRiMJ2KKLU0OV3lr2JNPbatqaf8x+9WeTECT4rW3+kia
         9Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699867269; x=1700472069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=innazYWQ+vfDVD6O9tD7wqR7CsMf1eNCHewBVoN6FZQ=;
        b=KrpLOcyLfSZt379PZ9hOMEzNmQnxLivyZb0CN8+6fQC9aR2wvvG1AJiCrcSWBaO8Id
         JxlpRjQ1/D4pEMhytIRZLxfFQXxhQfPT9gv4lxGuFEhdhVky7zV/IHCGX/h15P73RoYd
         iBQ06eYFO9d5gEt8vw3nLUEQm/8ALlYz1BNeBnj9dT5Qj8bd6+PBPDyqDaEdzeLkiF54
         1sTW3zriLhj3L5s1m1rx2uOCwGj88knbiTiYwAw5cATsusPEn5mKUSkI79LWChHu9pLR
         uzqu1z/c9nOtDatiOu5Eg0UCUx1R/x0P0KypEzah8ajVdkyTkKWGl9VfAyBkGqIVyCP1
         L+8g==
X-Gm-Message-State: AOJu0Yy9Pn6hMDumyVUjnGlM6KQmvoc4BLNvRnP/fG3ovY7zhcVmWXEe
	0TK4YgDF/bXrxgdDkNhznKo=
X-Google-Smtp-Source: AGHT+IE/yHqCsz8fOsM0/tA+3xAZiacNNneJ05q/bRI0sXEOz5r/evw1Q8PnuelLGXDqd50NtDD3Rg==
X-Received: by 2002:a05:6402:192:b0:540:194f:5781 with SMTP id r18-20020a056402019200b00540194f5781mr4452326edv.33.1699867268824;
        Mon, 13 Nov 2023 01:21:08 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:361b:8f29:1cbf:5e69? (p200300f6ef1b2000361b8f291cbf5e69.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:361b:8f29:1cbf:5e69])
        by smtp.gmail.com with ESMTPSA id n11-20020a50934b000000b00540e894609dsm3465822eda.17.2023.11.13.01.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 01:21:08 -0800 (PST)
Message-ID: <b99a7f2ca57ff371eb661a11ab4ecc8f14917d7a.camel@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Nuno Sa <nuno.sa@analog.com>, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy
 Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.com>, Conor
 Dooley <conor+dt@kernel.org>
Date: Mon, 13 Nov 2023 10:24:05 +0100
In-Reply-To: <f03d0171-7da1-4823-8465-f276d90fbd0a@roeck-us.net>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
	 <20231110151905.1659873-3-nuno.sa@analog.com>
	 <f03d0171-7da1-4823-8465-f276d90fbd0a@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2023-11-11 at 09:22 -0800, Guenter Roeck wrote:
> On 11/10/23 07:18, Nuno Sa wrote:
> > The LTC4282 hot swap controller allows a board to be safely inserted an=
d
> > removed from a live backplane. Using one or more external N-channel pas=
s
> > transistors, board supply voltage and inrush current are ramped up at a=
n
> > adjustable rate. An I2C interface and onboard ADC allows for monitoring
> > of board current, voltage, power, energy and fault status.
> >=20
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> > =C2=A0 Documentation/hwmon/ltc4282.rst |=C2=A0 101 ++
>=20
> As reported by 0-day, this must be added to index.rst.
>=20

ack...

>=20
> Anyway, partial review only. Also, since it registers a gpio driver,
> it will need to be reviewed by a gpio maintainer. I am not comfortable
> with some of the gpio code.
>=20

Yeah, I'm also far from being sure on the GPIO stuff (I have some words
regarding that in the cover) and I did already CC'ed the maintainers + Andy
which is a reviewer.

> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 2 +
> > =C2=A0 drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 11 +
> > =C2=A0 drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/hwmon/ltc4282.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1518 +++++++++++++++++++++++++++++++
> > =C2=A0 5 files changed, 1633 insertions(+)
> > =C2=A0 create mode 100644 Documentation/hwmon/ltc4282.rst
> > =C2=A0 create mode 100644 drivers/hwmon/ltc4282.c
> >=20
> > diff --git a/Documentation/hwmon/ltc4282.rst
> > b/Documentation/hwmon/ltc4282.rst
> > new file mode 100644
> > index 000000000000..2fab5d165aa4
> > --- /dev/null
> > +++ b/Documentation/hwmon/ltc4282.rst
> > @@ -0,0 +1,101 @@
> > +Kernel drivers ltc4282
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chips:
> > +
> > +=C2=A0 * Analog Devices LTC4282
> > +
> > +=C2=A0=C2=A0=C2=A0 Prefix: 'ltc4282'
> > +
> > +=C2=A0=C2=A0=C2=A0 Addresses scanned: - I2C 0x40 - 0x5A (7-bit)
> > +=C2=A0=C2=A0=C2=A0 Addresses scanned: - I2C 0x80 - 0xB4 with a step of=
 2 (8-bit)
> > +
> > +=C2=A0=C2=A0=C2=A0 Datasheet:
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ltc=
4282.pdf
> > +
> > +Author: Nuno S=C3=A1 <nuno.sa@analog.com>
> > +
> > +Description
> > +___________
> > +
> > +The LTC4282 hot swap controller allows a board to be safely inserted a=
nd
> > removed
> > +from a live backplane. Using one or more external N-channel pass
> > transistors,
> > +board supply voltage and inrush current are ramped up at an adjustable
> > rate. An
> > +I2C interface and onboard ADC allows for monitoring of board current,
> > voltage,
> > +power, energy and fault status. The device features analog foldback cu=
rrent
> > +limiting and supply monitoring for applications from 2.9V to 33V. Dual=
 12V
> > gate
> > +drive allows high power applications to either share safe operating ar=
ea
> > across
> > +parallel MOSFETs or support a 2-stage start-up that first charges the =
load
> > +capacitance followed by enabling a low on-resistance path to the load.=
 The
> > +LTC4282 is well suited to high power applications because the precise
> > monitoring
> > +capability and accurate current limiting reduce the extremes in which =
both
> > loads
> > +and power supplies must safely operate. Non-volatile configuration all=
ows
> > for
> > +flexibility in the autonomous generation of alerts and response to fau=
lts.
> > +
> > +Sysfs entries
> > +_____________
> > +
> > +The following attributes are supported. Limits are read-write and all =
the
> > other
> > +attributes are read-only.
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +in0_input		Output voltage (mV).
> > +in0_min			Undervoltage threshold
> > +in0_max=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Overvoltage threshold
> > +in0_lowest		Lowest measured voltage
> > +in0_highest		Highest measured voltage
> > +in0_min_alarm		Undervoltage alarm
> > +in0_max_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Overvoltage alarm
> > +in0_label		Channel label (VSOURCE)
> > +
> > +in1_input		Input voltage (mV).
> > +in1_lcrit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Critic=
al Undervoltage alarm
> > +in1_lcrit_fault_log=C2=A0=C2=A0=C2=A0=C2=A0 Undervoltage Fault Log. In=
 some setups, clearing
> > this
> > +			fault (writing on the file) might be needed.
> > +in1_crit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 C=
ritical Overvoltage alarm
> > +in1_crit_fault_log	Overvoltage Fault Log. In some setups, clearing
> > this
> > +			fault (writing on the file) might be needed
> > +in1_label		Channel label (VDD)
> > +
> > +in2_input		GPIO voltage (mV)
> > +in2_min			Undervoltage threshold
> > +in2_max			Overvoltage threshold
> > +in2_lowest		Lowest measured voltage
> > +in2_highest		Highest measured voltage
> > +in2_min_alarm		Undervoltage alarm
> > +in2_max_alarm		Overvoltage alarm
> > +in2_label		Channel label (VGPIO)
> > +
> > +curr1_input		Sense current (mA)
> > +curr1_min		Undercurrent threshold
> > +curr1_max		Overcurrent threshold
> > +curr1_lowest		Lowest measured current
> > +curr1_highest		Highest measured current
> > +curr1_min_alarm		Undercurrent alarm
> > +curr1_max_alarm		Overcurrent alarm
> > +curr1_crit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Critical Ov=
ercurrent alarm
> > +curr1_crit_fault_log	Overcurrent Fault Log. In some setups, clearing
> > this
> > +			fault (writing on the file) might be needed
> > +curr1_label		Channel label (ISENSE)
> > +
> > +power1_input		Power (in uW)
> > +power1_min		Low power threshold
> > +power1_max		High power threshold
> > +power1_average=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 A=
verage Power use
> > +power1_input_lowest	Historical minimum power use
> > +power1_input_highest	Historical maximum power use
> > +power1_min_alarm	Low power alarm
> > +power1_max_alarm	High power alarm
> > +power1_good		Power considered good
> > +power1_fault_log	Power bad Fault log
> > +power1_label		Channel label (Power)
> > +
> > +energy1_input		Measured energy over time (in microJoule)
> > +energy1_enable		Enable/Disable Energy accumulation
> > +
> > +fet_short_fault		FET short alarm
> > +fet_short_fault_log	FET short Fault log
> > +fet_bad_fault		FET bad alarm
> > +fet_bad_fault_log	FET bad Fault log
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9f9527f6057b..ba7f0439d8e8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12486,6 +12486,8 @@ M:	Nuno Sa <nuno.sa@analog.com>
> > =C2=A0 L:	linux-hwmon@vger.kernel.org
> > =C2=A0 S:	Supported
> > =C2=A0 F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> > +F:	Documentation/hwmon/ltc4282.rst
> > +F:	drivers/hwmon/ltc4282.c
> > =C2=A0=20
> > =C2=A0 LTC4306 I2C MULTIPLEXER DRIVER
> > =C2=A0 M:	Michael Hennerich <michael.hennerich@analog.com>
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index cf27523eed5a..2f1a0cf2e1e4 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1027,6 +1027,17 @@ config SENSORS_LTC4261
> > =C2=A0=C2=A0	=C2=A0 This driver can also be built as a module. If so, t=
he module will
> > =C2=A0=C2=A0	=C2=A0 be called ltc4261.
> > =C2=A0=20
> > +config SENSORS_LTC4282
> > +	tristate "Analog Devices LTC4282"
> > +	depends on I2C
> > +	select REGMAP_I2C
> > +	help
> > +	=C2=A0 If you say yes here you get support for Analog Devices LTC4282
> > +	=C2=A0 High Current Hot Swap Controller I2C interface.
> > +
> > +	=C2=A0 This driver can also be built as a module. If so, the module w=
ill
> > +	=C2=A0 be called ltc4282.
> > +
> > =C2=A0 config SENSORS_LTQ_CPUTEMP
> > =C2=A0=C2=A0	bool "Lantiq cpu temperature sensor driver"
> > =C2=A0=C2=A0	depends on SOC_XWAY
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index e84bd9685b5c..cbf22d1d736f 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_LTC4222)	+=3D ltc4222.o
> > =C2=A0 obj-$(CONFIG_SENSORS_LTC4245)	+=3D ltc4245.o
> > =C2=A0 obj-$(CONFIG_SENSORS_LTC4260)	+=3D ltc4260.o
> > =C2=A0 obj-$(CONFIG_SENSORS_LTC4261)	+=3D ltc4261.o
> > +obj-$(CONFIG_SENSORS_LTC4282)	+=3D ltc4282.o
> > =C2=A0 obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) +=3D ltq-cputemp.o
> > =C2=A0 obj-$(CONFIG_SENSORS_MAX1111)	+=3D max1111.o
> > =C2=A0 obj-$(CONFIG_SENSORS_MAX127)	+=3D max127.o
> > diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> > new file mode 100644
> > index 000000000000..738312cf212e
> > --- /dev/null
> > +++ b/drivers/hwmon/ltc4282.c
> > @@ -0,0 +1,1518 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2=
C
> > + *
> > + * Copyright 2023 Analog Devices Inc.
> > + */
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/math.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/mutex.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/property.h>
> > +#include <linux/units.h>
> > +
> > +#define LTC4282_CTRL_LSB			0x00
> > +=C2=A0 #define LTC4282_CTRL_OV_RETRY_MASK		BIT(0)
> > +=C2=A0 #define LTC4282_CTRL_UV_RETRY_MASK		BIT(1)
> > +=C2=A0 #define LTC4282_CTRL_OC_RETRY_MASK		BIT(2)
> > +=C2=A0 #define LTC4282_CTRL_ON_ACTIVE_LOW_MASK	BIT(5)
> > +=C2=A0 #define LTC4282_CTRL_ON_DELAY_MASK		BIT(6)
> > +#define LTC4282_CTRL_MSB			0x01
> > +=C2=A0 #define LTC4282_CTRL_VIN_MODE_MASK		GENMASK(1, 0)
> > +=C2=A0 #define LTC4282_CTRL_OV_MODE_MASK		GENMASK(3, 2)
> > +=C2=A0 #define LTC4282_CTRL_UV_MODE_MASK		GENMASK(5, 4)
> > +#define LTC4282_FAULT_LOG			0x04
> > +=C2=A0 #define LTC4282_OV_FAULT_MASK			BIT(0)
> > +=C2=A0 #define LTC4282_UV_FAULT_MASK			BIT(1)
> > +=C2=A0 #define LTC4282_OC_FAULT_MASK			BIT(2)
> > +=C2=A0 #define LTC4282_POWER_BAD_FAULT_MASK		BIT(3)
> > +=C2=A0 #define LTC4282_FET_SHORT_FAULT_MASK		BIT(5)
> > +=C2=A0 #define LTC4282_FET_BAD_FAULT_MASK		BIT(6)
> > +#define LTC4282_ADC_ALERT_LOG			0x05
> > +=C2=A0 #define LTC4282_GPIO_ALARM_L_MASK		BIT(0)
> > +=C2=A0 #define LTC4282_GPIO_ALARM_H_MASK		BIT(1)
> > +=C2=A0 #define LTC4282_VSOURCE_ALARM_L_MASK		BIT(2)
> > +=C2=A0 #define LTC4282_VSOURCE_ALARM_H_MASK		BIT(3)
> > +=C2=A0 #define LTC4282_VSENSE_ALARM_L_MASK		BIT(4)
> > +=C2=A0 #define LTC4282_VSENSE_ALARM_H_MASK		BIT(5)
> > +=C2=A0 #define LTC4282_POWER_ALARM_L_MASK		BIT(6)
> > +=C2=A0 #define LTC4282_POWER_ALARM_H_MASK		BIT(7)
> > +#define LTC4282_FET_BAD_FAULT_TIMEOUT		0x06
> > +=C2=A0 #define LTC4282_FET_BAD_MAX_TIMEOUT		255
> > +#define LTC4282_GPIO_CONFIG			0x07
> > +=C2=A0 #define LTC4282_GPIO_2_FET_STRESS_MASK	BIT(1)
> > +=C2=A0 #define LTC4282_GPIO_1_OUT_MASK		BIT(3)
> > +=C2=A0 #define LTC4282_GPIO_1_CONFIG_MASK		GENMASK(5, 4)
> > +=C2=A0 #define LTC4282_GPIO_2_OUT_MASK		BIT(6)
> > +=C2=A0 #define LTC4282_GPIO_3_OUT_MASK		BIT(7)
> > +#define LTC4282_VGPIO_MIN			0x08
> > +#define LTC4282_VGPIO_MAX			0x09
> > +#define LTC4282_VSOURCE_MIN			0x0a
> > +#define LTC4282_VSOURCE_MAX			0x0b
> > +#define LTC4282_VSENSE_MIN			0x0c
> > +#define LTC4282_VSENSE_MAX			0x0d
> > +#define LTC4282_POWER_MIN			0x0e
> > +#define LTC4282_POWER_MAX			0x0f
> > +#define LTC4282_CLK_DIV				0x10
> > +=C2=A0 #define LTC4282_CLK_DIV_MASK			GENMASK(4, 0)
> > +=C2=A0 #define LTC4282_CLKOUT_MASK			GENMASK(6, 5)
> > +#define LTC4282_ILIM_ADJUST			0x11
> > +=C2=A0 #define LTC4282_GPIO_MODE_MASK		BIT(1)
> > +=C2=A0 #define LTC4282_VDD_MONITOR_MASK		BIT(2)
> > +=C2=A0 #define LTC4282_FOLDBACK_MODE_MASK		GENMASK(4, 3)
> > +=C2=A0 #define LTC4282_ILIM_ADJUST_MASK		GENMASK(7, 5)
> > +#define LTC4282_ENERGY				0x12
> > +#define LTC4282_TIME_COUNTER			0x18
> > +#define LTC4282_ALERT_CTRL			0x1C
> > +=C2=A0 #define LTC4282_ALERT_OUT_MASK		BIT(6)
> > +#define LTC4282_ADC_CTRL			0x1D
> > +=C2=A0 #define LTC4282_FAULT_LOG_EN_MASK		BIT(2)
> > +=C2=A0 #define LTC4282_METER_HALT_MASK		BIT(5)
> > +=C2=A0 #define LTC4282_METER_RESET_MASK		BIT(6)
> > +=C2=A0 #define LTC4282_RESET_MASK			BIT(7)
> > +#define LTC4282_STATUS_LSB			0x1E
> > +=C2=A0 #define LTC4282_OV_STATUS_MASK		BIT(0)
> > +=C2=A0 #define LTC4282_UV_STATUS_MASK		BIT(1)
> > +=C2=A0 #define LTC4282_VDD_STATUS_MASK		(LTC4282_OV_STATUS_MASK |
> > LTC4282_UV_STATUS_MASK)
> > +=C2=A0 #define LTC4282_OC_STATUS_MASK		BIT(2)
> > +=C2=A0 #define LTC4282_POWER_GOOD_MASK		BIT(3)
> > +=C2=A0 #define LTC4282_FET_SHORT_MASK		BIT(5)
> > +=C2=A0 #define LTC4282_FET_BAD_STATUS_MASK		BIT(6)
> > +#define LTC4282_STATUS_MSB			0x1F
> > +=C2=A0 #define LTC4282_METER_TICK_OVERFLOW_MASK	GENMASK(1, 0)
> > +=C2=A0 #define LTC4282_ALERT_STATUS_MASK		BIT(4)
> > +=C2=A0 #define LTC4282_GPIO_1_STATUS_MASK		BIT(5)
> > +=C2=A0 #define LTC4282_GPIO_2_STATUS_MASK		BIT(6)
> > +=C2=A0 #define LTC4282_GPIO_3_STATUS_MASK		BIT(7)
> > +#define LTC4282_RESERVED_1			0x32
> > +#define LTC4282_RESERVED_2			0x33
> > +#define LTC4282_VGPIO				0x34
> > +#define LTC4282_VGPIO_LOWEST			0x36
> > +#define LTC4282_VGPIO_HIGHEST			0x38
> > +#define LTC4282_VSOURCE				0x3a
> > +#define LTC4282_VSOURCE_LOWEST			0x3c
> > +#define LTC4282_VSOURCE_HIGHEST			0x3e
> > +#define LTC4282_VSENSE				0x40
> > +#define LTC4282_VSENSE_LOWEST			0x42
> > +#define LTC4282_VSENSE_HIGHEST			0x44
> > +#define LTC4282_POWER				0x46
> > +#define LTC4282_POWER_LOWEST			0x48
> > +#define LTC4282_POWER_HIGHEST			0x4a
> > +#define LTC4282_RESERVED_3			0x50
> > +
> > +#define LTC4282_CLKIN_MIN	(250 * KILO)
> > +#define LTC4282_CLKIN_MAX	(15500 * KILO)
> > +/* this assumes 12bit ADC */
> > +#define LTC4282_TCONV_US	65535
> > +#define LTC4282_GPIO_NR		4
> > +/*
> > + * relaxed version of FIELD_PREP() to be used when mask is not a compi=
le
> > time constant
> > + * u32_encode_bits() can't also be used as the compiler needs to be ab=
le to
> > evaluate
> > + * mask at compile time.
> > + */
> > +#define LTC4282_FIELD_PREP(m, v)	(((v) << (ffs(m) - 1)) & (m))
> > +
> > +struct ltc4282_state {
> > +	struct regmap *map;
> > +	struct device *dev;
>=20
> This is only used for an inappropriate warning message and during probe.
> Pass it to initialization functions where needed.
>=20

will do...

> > +	/* Protect against multiple accesses to the device registers */
> > +	struct mutex lock;
> > +	struct gpio_chip gc;
> > +	u64 saved_energy;
> > +	long power_max;
>=20
> I do not understand how this is used in the code. It seems to avoid overf=
lows
> due to unreasonable values of rsense. That adds a lot of complexist to th=
e
> code
> and makes it hard to understand.
>=20

It's not about unreasonable rsense... More details below in your other comm=
ent
about this...

> > +	u32 gpio_map[LTC4282_GPIO_NR];
> > +	u32 rsense;
> > +	u32 vin_mode;
> > +	u16 vfs_out;
> > +};
> > +
> > +struct ltc4282_gpio {
> > +	u32 out_reg;
> > +	u32 out_mask;
> > +	u32 in_reg;
> > +	u32 in_mask;
> > +	bool active_high;
> > +	u8 n_funcs;
> > +};
> > +
> > +enum {
> > +	LTC4282_VIN_3_3V,
> > +	LTC4282_VIN_5V,
> > +	LTC4282_VIN_12V,
> > +	LTC4282_VIN_24V,
> > +};
> > +
> > +enum {
> > +	LTC4282_CHAN_VSOURCE,
> > +	LTC4282_CHAN_VDD,
> > +	LTC4282_CHAN_VGPIO,
> > +};
> > +
> > +enum {
> > +	LTC4282_GPIO_1,
> > +	LTC4282_GPIO_2,
> > +	LTC4282_GPIO_3,
> > +	LTC4282_ALERT,
> > +};
> > +
> > +static const struct ltc4282_gpio ltc4282_gpios[] =3D {
> > +	[LTC4282_GPIO_1] =3D {
> > +		.in_reg =3D LTC4282_STATUS_MSB,
> > +		.in_mask =3D LTC4282_GPIO_1_STATUS_MASK,
> > +		.out_reg =3D LTC4282_GPIO_CONFIG,
> > +		.out_mask =3D LTC4282_GPIO_1_OUT_MASK,
> > +		.active_high =3D true,
> > +		.n_funcs =3D 3,
> > +	},
> > +	[LTC4282_GPIO_2] =3D {
> > +		.in_reg =3D LTC4282_STATUS_MSB,
> > +		.in_mask =3D LTC4282_GPIO_2_STATUS_MASK,
> > +		.out_reg =3D LTC4282_GPIO_CONFIG,
> > +		.out_mask =3D LTC4282_GPIO_2_OUT_MASK,
> > +		.n_funcs =3D 3,
> > +	},
> > +	[LTC4282_GPIO_3] =3D {
> > +		.in_reg =3D LTC4282_STATUS_MSB,
> > +		.in_mask =3D LTC4282_GPIO_3_STATUS_MASK,
> > +		.out_reg =3D LTC4282_GPIO_CONFIG,
> > +		.out_mask =3D LTC4282_GPIO_3_OUT_MASK,
> > +		.n_funcs =3D 2,
> > +	},
> > +	[LTC4282_ALERT] =3D {
> > +		.in_reg =3D LTC4282_STATUS_MSB,
> > +		.in_mask =3D LTC4282_ALERT_STATUS_MASK,
> > +		.out_reg =3D LTC4282_ALERT_CTRL,
> > +		.out_mask =3D LTC4282_ALERT_OUT_MASK,
> > +	},
> > +};
> > +
> > +static int ltc4282_gpio_input_set(struct gpio_chip *chip, unsigned int
> > offset)
> > +{
> > +	struct ltc4282_state *st =3D gpiochip_get_data(chip);
> > +	u32 gpio_pin =3D st->gpio_map[offset];
> > +
> > +	/* we can only control this for GPIO_1 */
> > +	if (gpio_pin !=3D LTC4282_GPIO_1)
> > +		return 0;
> > +
> > +	return regmap_set_bits(st->map, LTC4282_GPIO_CONFIG,
> > LTC4282_GPIO_1_CONFIG_MASK);
> > +}
> > +
> > +static int ltc4282_gpio_output_set(struct gpio_chip *chip, unsigned in=
t
> > offset, int val)
> > +{
> > +	struct ltc4282_state *st =3D gpiochip_get_data(chip);
> > +	u32 gpio_pin =3D st->gpio_map[offset];
> > +	const struct ltc4282_gpio *gpio =3D &ltc4282_gpios[gpio_pin];
> > +
> > +	guard(mutex)(&st->lock);
> > +	/*
> > +	 * Explicitly setting the pin as output can only be done for
> > GPIO_1. For the
> > +	 * other pins we just pull the line down or high-z.
> > +	 */
> > +	if (gpio_pin =3D=3D LTC4282_GPIO_1) {
> > +		int ret;
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4282_GPIO_CONFIG,
> > LTC4282_GPIO_1_CONFIG_MASK,
> > +				=09
> > FIELD_PREP(LTC4282_GPIO_1_CONFIG_MASK, 2));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	/* GPIO_2,3 and the ALERT pin require setting the bit to 1 to pull
> > down the line */
> > +	if (!gpio->active_high)
> > +		val =3D !val;
> > +
> > +	return regmap_update_bits(st->map, gpio->out_reg, gpio->out_mask,
> > +				=C2=A0 LTC4282_FIELD_PREP(gpio->out_mask, val));
> > +}
> > +
> > +static void ltc4282_gpio_set(struct gpio_chip *chip, unsigned int offs=
et,
> > int val)
> > +{
> > +	struct ltc4282_state *st =3D gpiochip_get_data(chip);
> > +	u32 gpio_pin =3D st->gpio_map[offset];
> > +	const struct ltc4282_gpio *gpio =3D &ltc4282_gpios[gpio_pin];
> > +
> > +	if (!gpio->active_high)
> > +		val =3D !val;
> > +
> > +	regmap_update_bits(st->map, gpio->out_reg, gpio->out_mask,
> > +			=C2=A0=C2=A0 LTC4282_FIELD_PREP(gpio->out_mask, val));
> > +}
> > +
> > +static int ltc4282_gpio_get(struct gpio_chip *chip, unsigned int offse=
t)
> > +{
> > +	struct ltc4282_state *st =3D gpiochip_get_data(chip);
> > +	u32 gpio_pin =3D st->gpio_map[offset];
> > +	const struct ltc4282_gpio *gpio =3D &ltc4282_gpios[gpio_pin];
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret =3D regmap_read(st->map, gpio->in_reg, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return !!(val & gpio->in_mask);
> > +}
> > +
> > +static int ltc4282_read_voltage_word(const struct ltc4282_state *st, u=
32
> > reg, u32 fs, long *val)
> > +{
> > +	__be16 in;
> > +	int ret;
> > +
> > +	ret =3D regmap_bulk_read(st->map, reg, &in, sizeof(in));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * This is also used to calculate current in which case fs comes in
> > 10 * uV.
> > +	 * Hence the ULL usage.
> > +	 */
> > +	*val =3D DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs, U16_MAX);
> > +	return 0;
> > +}
> > +
> > +static int ltc4282_read_voltage_byte(const struct ltc4282_state *st, u=
32
> > reg, u32 fs, long *val)
> > +{
> > +	int ret;
> > +	u32 in;
> > +
> > +	ret =3D regmap_read(st->map, reg, &in);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(in * fs, U8_MAX);
> > +	return 0;
> > +}
> > +
> > +static int ltc4282_read_vdd(struct ltc4282_state *st, u32 fs, long *va=
l)
> > +{
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	/* ADC now monitors VDD */
> > +	ret =3D regmap_clear_bits(st->map, LTC4282_ILIM_ADJUST,
> > LTC4282_VDD_MONITOR_MASK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Wait for two ADC conversions so we are sure we get one full VDD
> > +	 * measurement.
> > +	 */
> > +	msleep(2 * LTC4282_TCONV_US / MILLI);
> > +
> > +	ret =3D ltc4282_read_voltage_word(st, LTC4282_VSOURCE, st->vfs_out,
> > val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* back to VSOURCE */
> > +	return regmap_set_bits(st->map, LTC4282_ILIM_ADJUST,
> > LTC4282_VDD_MONITOR_MASK);
>=20
> Handle this with _enable attributes if the chip only reports one measurem=
ent.
> Sleeping 130+ ms for each reading is unacceptable. Besides, subsequent VS=
OURCE
> readings would have to be delayed as well.
>=20
> I'll have to read the datasheet in lore detail to understand how this
> translates
> into limits. I see that the chip has limit registers for the various volt=
ages,
> which doesn't really make sense if the chip doesn't measure those voltage=
s.
>=20

I see... This together with the sleeps in alarms make, for example, the
'sensors' command to run really slow. The _enable is indeed a good idea and
something that I did not remembered. There's only one thing that is not rea=
lly
optimal with that:

We have 2 ADCs, one where we can mux between VSOURCE/VDD and the other is f=
or
GPIO2/GPIO3. ON top of that we only have one set of registers for VSOURCE/V=
DD.
For the min/max alarms is not an issue as userspace could easily handle the=
m
when changing between VDD/VSOURCE. Hmm, and actually when I was just writti=
ng
this email, I remembered to check the datasheet and just realized that the
highest/lowest registers are R/W. So, what comes to mind is that I can supp=
ort=20
'_reset_history' and then userspace can easily handle the switch between
VDD/VSOURCE. I guess the driver could even automatically clear the history =
when
changing between source. Would that be appropriate? Or do you think it's be=
tter
to be done explicitly by userspace?

This also brings me the question if I should have the same handling for cha=
nging
between GPIO2/GPIO3. Right now, that choice is done via dts because this ki=
nd of
stuff typically means that you really need to have some kind of HW plugged =
in
the PIN. But , yeah, nowadays things are more and more "dynamic" so, not su=
re...

> > +}
> > +
> > +static int ltc4282_read_alarm(struct ltc4282_state *st, u32 reg, u32 m=
ask,
> > long *val)
> > +{
> > +	u32 alarm;
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	/* if not status, clear first the alarm by clearing the bit */
> > +	if (reg !=3D LTC4282_STATUS_LSB && reg !=3D LTC4282_FAULT_LOG) {
> > +		ret =3D regmap_clear_bits(st->map, reg, mask);
> > +		if (ret)
> > +			return ret;
> > +
> > +		msleep(LTC4282_TCONV_US / MILLI);
> > +	}
>=20
> Normally one would want to have historic alarms reported at least once,
> even if the alarm since went away. This code seems to clear alarm bits
> prior to reading them, which will result in under-reporting. This will
> need to be explained, especially since it results in a 65+ ms delay for
> each alarm report if alarms are active which seems excessive and
> unnceessary.

Hmm, I see. Well, my thinking for this was really to not see those "histori=
c"
alarms and only see things that are still present. But I see now that's not=
 the
expectation. I'll move this to after reading the alarms...

>=20
> > +
> > +	ret =3D regmap_read(st->map, reg, &alarm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D !!(alarm & mask);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4282_read_in(struct device *dev, u32 attr, long *val, u3=
2
> > channel)
> > +{
> > +	struct ltc4282_state *st =3D dev_get_drvdata(dev);
> > +
> > +	switch (attr) {
> > +	case hwmon_in_input:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_read_voltage_word(st,
> > LTC4282_VSOURCE, st->vfs_out, val);
> > +		if (channel =3D=3D LTC4282_CHAN_VDD)
> > +			return ltc4282_read_vdd(st, st->vfs_out, val);
> > +
> > +		return ltc4282_read_voltage_word(st, LTC4282_VGPIO, 1280,
> > val);
> > +	case hwmon_in_highest:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_read_voltage_word(st,
> > LTC4282_VSOURCE_HIGHEST,
> > +							 st->vfs_out, val);
> > +
> > +		return ltc4282_read_voltage_word(st, LTC4282_VGPIO_HIGHEST,
> > 1280, val);
> > +	case hwmon_in_lowest:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_read_voltage_word(st,
> > LTC4282_VSOURCE_LOWEST,
> > +							 st->vfs_out, val);
> > +
> > +		return ltc4282_read_voltage_word(st, LTC4282_VGPIO_LOWEST,
> > 1280, val);
> > +	case hwmon_in_max_alarm:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_read_alarm(st,
> > LTC4282_ADC_ALERT_LOG,
> > +						=C2=A0
> > LTC4282_VSOURCE_ALARM_H_MASK, val);
> > +
> > +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
> > LTC4282_GPIO_ALARM_H_MASK,
> > +					=C2=A0 val);
> > +	case hwmon_in_min_alarm:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_read_alarm(st,
> > LTC4282_ADC_ALERT_LOG,
> > +						=C2=A0
> > LTC4282_VSOURCE_ALARM_L_MASK, val);
> > +
> > +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
> > LTC4282_GPIO_ALARM_L_MASK,
> > +					=C2=A0 val);
> > +	case hwmon_in_alarm:
> > +		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
> > +					=C2=A0 LTC4282_FET_BAD_STATUS_MASK,
> > val);
> > +	case hwmon_in_crit_alarm:
> > +		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
> > LTC4282_OV_STATUS_MASK, val);
> > +	case hwmon_in_lcrit_alarm:
> > +		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
> > LTC4282_UV_STATUS_MASK, val);
> > +	case hwmon_in_max:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_read_voltage_byte(st,
> > LTC4282_VSOURCE_MAX,
> > +							 st->vfs_out, val);
> > +
> > +		return ltc4282_read_voltage_byte(st, LTC4282_VGPIO_MAX,
> > 1280, val);
> > +	case hwmon_in_min:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_read_voltage_byte(st,
> > LTC4282_VSOURCE_MIN,
> > +							 st->vfs_out, val);
> > +
> > +		return ltc4282_read_voltage_byte(st, LTC4282_VGPIO_MIN,
> > 1280, val);
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4282_read_current_word(const struct ltc4282_state *st, u=
32
> > reg, long *val)
> > +{
> > +	long in;
> > +	int ret;
> > +
> > +	/*
> > +	 * We pass in full scale in 10 * micro (note that 40 is already
> > millivolt) so we
> > +	 * have better approximations to calculate current.
> > +	 */
> > +	ret =3D ltc4282_read_voltage_word(st, reg, DECA * 40 * MILLI, &in);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(in * MILLI, st->rsense);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4282_read_current_byte(const struct ltc4282_state *st, u=
32
> > reg, long *val)
> > +{
> > +	long in;
> > +	int ret;
> > +
> > +	ret =3D ltc4282_read_voltage_byte(st, reg, DECA * 40 * MILLI, &in);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(in * MILLI, st->rsense);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4282_read_curr(struct device *dev, const u32 attr, long =
*val)
> > +{
> > +	struct ltc4282_state *st =3D dev_get_drvdata(dev);
> > +
> > +	switch (attr) {
> > +	case hwmon_curr_input:
> > +		return ltc4282_read_current_word(st, LTC4282_VSENSE, val);
> > +	case hwmon_curr_highest:
> > +		return ltc4282_read_current_word(st,
> > LTC4282_VSENSE_HIGHEST, val);
> > +	case hwmon_curr_lowest:
> > +		return ltc4282_read_current_word(st, LTC4282_VSENSE_LOWEST,
> > val);
> > +	case hwmon_curr_max:
> > +		return ltc4282_read_current_byte(st, LTC4282_VSENSE_MAX,
> > val);
> > +	case hwmon_curr_min:
> > +		return ltc4282_read_current_byte(st, LTC4282_VSENSE_MIN,
> > val);
> > +	case hwmon_curr_max_alarm:
> > +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
> > LTC4282_VSENSE_ALARM_H_MASK,
> > +					=C2=A0 val);
> > +	case hwmon_curr_min_alarm:
> > +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
> > LTC4282_VSENSE_ALARM_L_MASK,
> > +					=C2=A0 val);
> > +	case hwmon_curr_crit_alarm:
> > +		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
> > LTC4282_OC_STATUS_MASK, val);
> > +	default:
> > +		return -ENOTSUPP;
>=20
> checkpatch:
>=20
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
>=20
> Please run checkpatch --strict on your patches.
>=20

Bahh, I'm pretty sure I ran it but forgot --strict

> > +	}
> > +}
> > +
> > +static int ltc4282_read_power_word(const struct ltc4282_state *st, u32=
 reg,
> > long *val)
> > +{
> > +	u64 temp =3D=C2=A0 DECA * 40ULL * st->vfs_out * 1 << 16, temp_2;
> > +	__be16 raw;
> > +	u16 power;
> > +	int ret;
> > +
> > +	ret =3D regmap_bulk_read(st->map, reg, &raw, sizeof(raw));
> > +	if (ret)
> > +		return ret;
> > +
> > +	power =3D be16_to_cpu(raw);
> > +	/*
> > +	 * Power is given by:
> > +	 *	P =3D CODE(16b) * 0.040 * Vfs(out) * 2^16 / ((2^16 - 1)^2 *
> > Rsense)
> > +	 */
> > +	if (check_mul_overflow(power * temp, MICRO, &temp_2)) {
> > +		temp =3D DIV_ROUND_CLOSEST_ULL(power * temp, U16_MAX);
> > +		*val =3D DIV64_U64_ROUND_CLOSEST(temp * MICRO, U16_MAX *
> > (u64)st->rsense);
> > +		return 0;
> > +	}
> > +
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp_2, st->rsense *
> > int_pow(U16_MAX, 2));
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4282_read_power_byte(const struct ltc4282_state *st, u32=
 reg,
> > long *val)
> > +{
> > +	u32 power;
> > +	u64 temp;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &power);
> > +	if (ret)
> > +		return ret;
> > +
> > +	temp =3D power * 40 * DECA * st->vfs_out * 256ULL;
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp * MICRO, int_pow(U8_MAX, 2) *
> > st->rsense);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4282_read_energy(const struct ltc4282_state *st, u64 *va=
l)
> > +{
> > +	u64 temp, energy;
> > +	u32 status;
> > +	__be64 raw;
> > +	int ret;
> > +
> > +	ret =3D regmap_bulk_read(st->map, LTC4282_ENERGY, &raw, 6);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D regmap_read(st->map, LTC4282_STATUS_MSB, &status);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (status & LTC4282_METER_TICK_OVERFLOW_MASK) {
> > +		dev_warn(st->dev, "Got overflow in meter/ticker
> > counters\n");
>=20
> This is a big no-go. A normal operation must not generate any messages,
> much less warnings.
>=20
> > +		/*
> > +		 * This resets the meter and the tick counter and holds
> > them
> > +		 * reset.
> > +		 */
> > +		ret =3D regmap_set_bits(st->map, LTC4282_ADC_CTRL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4282_METER_RESET_MASK);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* start accumulating again */
> > +		ret =3D regmap_clear_bits(st->map, LTC4282_ADC_CTRL,
> > +					LTC4282_METER_RESET_MASK);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/*
> > +		 * Let the callers know a reset happened. Important when
> > calling
> > +		 * from power1_average.
> > +		 */
>=20
> Only I won't accept in-kernel calculated power average value attributes.
> If the chip does not report averages, they must be calculated in
> userspace.

I see... So in userspace we won't have the "TIME COUNTER" value used for th=
e
average calculation (as per DS). You mean, userspace could just do simple
averaging on the power values read?

Anyways, I can drop this and with that (as mentioned in the cover) I can al=
so
drop the overflow handling. It will make things much simpler and is trivial=
 for
userspace to detect an energy overflow (the chip automatically rolls over t=
he
meter counter).

>=20
> > +		ret =3D 1;
> > +	}
> > +
> > +	energy =3D=C2=A0 be64_to_cpu(raw) >> 16;
> > +	/*
> > +	 * The formula for energy is given by:
> > +	 *	E =3D CODE(48b) * 0.040 * Vfs(out) * Tconv * 256 / ((2^16 -
> > 1)^2 * Rsense)
> > +	 *
> > +	 * Since we only support 12bit ADC, Tconv =3D 0.065535s. Passing
> > Vfs(out) and 0.040 to
> > +	 * mV and Tconv to us, we can simplify the formula to:
> > +	 *	E =3D CODE(48b) * 40 * Vfs(out) * 256 / (U16_MAX * Rsense)
> > +	 *
> > +	 * As Rsense is in tens of micro-ohm, we need to multiply by DECA
> > to get
> > +	 * microujoule.
> > +	 */
> > +	if (check_mul_overflow(DECA * st->vfs_out * 40 * 256, energy,
> > &temp)) {
> > +		temp =3D DIV_ROUND_CLOSEST(DECA * st->vfs_out * 40 * 256,
> > U16_MAX);
> > +		*val =3D DIV_ROUND_CLOSEST_ULL(temp * energy, st->rsense);
> > +		return ret;
>=20
> return 0
>=20
> > +	}
> > +
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp, U16_MAX * (u64)st->rsense);
> > +
> > +	return ret;
>=20
> return 0
>=20
> > +}
> > +
> > +static int ltc4282_read_power_average(struct ltc4282_state *st, long *=
val)
> > +{
> > +	u64 energy, temp;+static int ltc4282_probe(struct i2c_client *i2c)
> > +{
> > +	struct device *dev =3D &i2c->dev, *hwmon;
> > +	struct ltc4282_state *st;
> > +	int ret;
> > +
> > +	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> > +	if (!st)
> > +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate
memory\n");
> > +
> > +	st->dev =3D dev;
> > +	st->map =3D devm_regmap_init_i2c(i2c, &ltc4282_regmap_config);
> > +	if (IS_ERR(st->map))
> > +		return dev_err_probe(dev, PTR_ERR(st->map), "failed regmap
init\n");
> > +
> > +	ret =3D ltc4282_power_on(st);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Soft reset */
> > +	ret =3D regmap_set_bits(st->map, LTC4282_ADC_CTRL, LTC4282_RESET_MASK=
);
> > +	if (ret)
> > +		return ret;
> > +
> > +	msleep(3200);
> > +
> > +	ret =3D ltc428_clks_setup(st);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4282_setup(st);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mutex_init(&st->lock);
> > +	hwmon =3D devm_hwmon_device_register_with_info(dev, "ltc4282", st,
> > &ltc2947_chip_info,
> > +						     ltc4282_groups);
> > +	return PTR_ERR_OR_ZERO(hwmon);
> > +}
> > +
> > +static const struct of_device_id ltc4282_of_match[] =3D {
> > +	{ .compatible =3D "adi,ltc4282" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, ltc4282_of_match);
> > +
> > +static struct i2c_driver ltc4282_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ltc4282",
> > +		.of_match_table =3D ltc4282_of_match,
> > +	},
> > +	.probe =3D ltc4282_probe,
> > +};
> > +module_i2c_driver(ltc4282_driver);
> > +
> > +MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
> > +MODULE_DESCRIPTION("LTC4282 I2C High Current Hot Swap Controller");
> > +MODULE_LICENSE("GPL");
>=20
> > +	__be32 raw;
> > +	u32 count;
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	ret =3D ltc4282_read_energy(st, &energy);
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret =3D=3D 1) {
> > +		/*
> > +		 * reset happened... let's read the new energy value that
> > +		 * together with the new tick counter should give a sane
> > average
> > +		 * value. Furthermore, we save whatever value we had
> > accumulated
> > +		 * so that the next energy read will have it into account.
> > +		 */
> > +		st->saved_energy =3D energy;
> > +		/* give some time for accumulation... */
> > +		msleep(2 * LTC4282_TCONV_US / MILLI);
> > +		ret =3D ltc4282_read_energy(st, &energy);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D regmap_bulk_read(st->map, LTC4282_TIME_COUNTER, &raw,
> > sizeof(raw));
> > +	if (ret)
> > +		return ret;
> > +
> > +	count =3D be32_to_cpu(raw);
> > +	if (!count) {
> > +		*val =3D 0;
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * AVG =3D E / (Tconv * counter)
> > +	 * We get energy in microJoule, hence dividing it by microSeconds
> > gives Watts. Therefore,
> > +	 * multiplying by MICRO gives us microWatts.
> > +	 */
> > +	if (check_mul_overflow(energy, MICRO, &temp)) {
> > +		temp =3D DIV_ROUND_CLOSEST_ULL(energy, LTC4282_TCONV_US);
> > +		*val =3D DIV_ROUND_CLOSEST_ULL(temp * MICRO, count);
> > +		return 0;
> > +	}
> > +
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp, LTC4282_TCONV_US *
> > (u64)count);
> > +	return 0;
> > +}
>=20
> No. If the chip doesn't report power averages, calculate it in userspace.
>=20
> > +
> > +static int ltc4282_read_power(struct device *dev, const u32 attr, long
> > *val)
> > +{
> > +	struct ltc4282_state *st =3D dev_get_drvdata(dev);
> > +
> > +	switch (attr) {
> > +	case hwmon_power_input:
> > +		return ltc4282_read_power_word(st, LTC4282_POWER, val);
> > +	case hwmon_power_input_highest:
> > +		return ltc4282_read_power_word(st, LTC4282_POWER_HIGHEST,
> > val);
> > +	case hwmon_power_input_lowest:
> > +		return ltc4282_read_power_word(st, LTC4282_POWER_LOWEST,
> > val);
> > +	case hwmon_power_max_alarm:
> > +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
> > LTC4282_POWER_ALARM_H_MASK,
> > +					=C2=A0 val);
> > +	case hwmon_power_min_alarm:
> > +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
> > LTC4282_POWER_ALARM_L_MASK,
> > +					=C2=A0 val);
> > +	case hwmon_power_average:
> > +		return ltc4282_read_power_average(st, val);
> > +	case hwmon_power_max:
> > +		return ltc4282_read_power_byte(st, LTC4282_POWER_MAX, val);
> > +	case hwmon_power_min:
> > +		return ltc4282_read_power_byte(st, LTC4282_POWER_MIN, val);
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4282_energy_enable(struct device *dev, long *val)
> > +{
> > +	const struct ltc4282_state *st =3D dev_get_drvdata(dev);
> > +	u32 reg_val;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, LTC4282_ADC_CTRL, &reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D !FIELD_GET(LTC4282_METER_HALT_MASK, reg_val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4282_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> > +			u32 attr, int channel, long *val)
> > +{
> > +	switch (type) {
> > +	case hwmon_in:
> > +		return ltc4282_read_in(dev, attr, val, channel);
> > +	case hwmon_curr:
> > +		return ltc4282_read_curr(dev, attr, val);
> > +	case hwmon_power:
> > +		return ltc4282_read_power(dev, attr, val);
> > +	case hwmon_energy:
> > +		return ltc4282_energy_enable(dev, val);
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4282_write_power_byte(const struct ltc4282_state *st, u3=
2
> > reg, long val)
> > +{
> > +	u32 power;
> > +	u64 temp;
> > +
> > +	if (val > st->power_max)
> > +		val =3D st->power_max;
> > +
> > +	temp =3D val * int_pow(U8_MAX, 2) * st->rsense;
> > +	power =3D DIV64_U64_ROUND_CLOSEST(temp, MICRO * DECA * 256ULL * st-
> > >vfs_out * 40);
> > +
> > +	return regmap_write(st->map, reg, power);
> > +}
> > +
> > +static int ltc4282_write_power(const struct ltc4282_state *st, u32 att=
r,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_power_max:
> > +		return ltc4282_write_power_byte(st, LTC4282_POWER_MAX,
> > val);
> > +	case hwmon_power_min:
> > +		return ltc4282_write_power_byte(st, LTC4282_POWER_MIN,
> > val);
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4282_write_voltage_byte(const struct ltc4282_state *st, =
u32
> > reg, u32 fs, long val)
> > +{
> > +	u32 in;
> > +
> > +	if (val >=3D fs)
> > +		in =3D U8_MAX;
> > +	else
> > +		in =3D DIV_ROUND_CLOSEST(val * U8_MAX, fs);
> > +
> > +	return regmap_write(st->map, reg, in);
> > +}
> > +
> > +static int ltc4282_write_in(const struct ltc4282_state *st, u32 attr, =
long
> > val,
> > +			=C2=A0=C2=A0=C2=A0 int channel)
> > +{
> > +	switch (attr) {
> > +	case hwmon_in_max:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_write_voltage_byte(st,
> > LTC4282_VSOURCE_MAX,
> > +							=C2=A0 st->vfs_out,
> > val);
> > +
> > +		return ltc4282_write_voltage_byte(st, LTC4282_VGPIO_MAX,
> > 1280, val);
> > +	case hwmon_in_min:
> > +		if (channel =3D=3D LTC4282_CHAN_VSOURCE)
> > +			return ltc4282_write_voltage_byte(st,
> > LTC4282_VSOURCE_MIN,
> > +							=C2=A0 st->vfs_out,
> > val);
> > +
> > +		return ltc4282_write_voltage_byte(st, LTC4282_VGPIO_MIN,
> > 1280, val);
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4282_write_curr(const struct ltc4282_state *st, u32 attr=
,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long val)
> > +{
> > +	/* need to pass it in millivolt */
> > +	u32 in =3D DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA *
> > MICRO);
> > +
> > +	switch (attr) {
> > +	case hwmon_curr_max:
> > +		return ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MAX,
> > 40, in);
> > +	case hwmon_curr_min:
> > +		return ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MIN,
> > 40, in);
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4282_write(struct device *dev,
> > +			 enum hwmon_sensor_types type,
> > +			 u32 attr, int channel, long val)
> > +{
> > +	const struct ltc4282_state *st =3D dev_get_drvdata(dev);
> > +
> > +	switch (type) {
> > +	case hwmon_power:
> > +		return ltc4282_write_power(st, attr, val);
> > +	case hwmon_in:
> > +		return ltc4282_write_in(st, attr, val, channel);
> > +	case hwmon_curr:
> > +		return ltc4282_write_curr(st, attr, val);
> > +	case hwmon_energy:
> > +		/* setting the bit halts the meter */
> > +		return regmap_update_bits(st->map, LTC4282_ADC_CTRL,
> > +					=C2=A0 LTC4282_METER_HALT_MASK,
> > +					=C2=A0
> > FIELD_PREP(LTC4282_METER_HALT_MASK, !!!val));
>=20
>=20
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4282_in_is_visible(const struct ltc4282_state *st, u32 a=
ttr)
> > +{
> > +	switch (attr) {
> > +	case hwmon_in_input:
> > +	case hwmon_in_highest:
> > +	case hwmon_in_lowest:
> > +	case hwmon_in_max_alarm:
> > +	case hwmon_in_min_alarm:
> > +	case hwmon_in_label:
> > +	case hwmon_in_lcrit_alarm:
> > +	case hwmon_in_crit_alarm:
> > +		return 0444;
> > +	case hwmon_in_max:
> > +	case hwmon_in_min:
> > +		return 0644;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static int ltc4282_curr_is_visible(u32 attr)
> > +{
> > +	switch (attr) {
> > +	case hwmon_curr_input:
> > +	case hwmon_curr_highest:
> > +	case hwmon_curr_lowest:
> > +	case hwmon_curr_max_alarm:
> > +	case hwmon_curr_min_alarm:
> > +	case hwmon_curr_crit_alarm:
> > +	case hwmon_curr_label:
> > +		return 0444;
> > +	case hwmon_curr_max:
> > +	case hwmon_curr_min:
> > +		return 0644;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static int ltc4282_power_is_visible(u32 attr)
> > +{
> > +	switch (attr) {
> > +	case hwmon_power_input:
> > +	case hwmon_power_input_highest:
> > +	case hwmon_power_input_lowest:
> > +	case hwmon_power_label:
> > +	case hwmon_power_max_alarm:
> > +	case hwmon_power_min_alarm:
> > +	case hwmon_power_average:
> > +		return 0444;
> > +	case hwmon_power_max:
> > +	case hwmon_power_min:
> > +		return 0644;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static umode_t ltc4282_is_visible(const void *data,
> > +				=C2=A0 enum hwmon_sensor_types type,
> > +				=C2=A0 u32 attr, int channel)
> > +{
> > +	switch (type) {
> > +	case hwmon_in:
> > +		return ltc4282_in_is_visible(data, attr);
> > +	case hwmon_curr:
> > +		return ltc4282_curr_is_visible(attr);
> > +	case hwmon_power:
> > +		return ltc4282_power_is_visible(attr);
> > +	case hwmon_energy:
> > +		/* hwmon_energy_enable */
> > +		return 0644;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static const char * const ltc4282_in_strs[] =3D {
> > +	"VSOURCE", "VDD", "VGPIO"
> > +};
> > +
> > +static int ltc4282_read_labels(struct device *dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum hwmon_sensor_types type,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 attr, int channel, const c=
har **str)
> > +{
> > +	switch (type) {
> > +	case hwmon_in:
> > +		*str =3D ltc4282_in_strs[channel];
> > +		return 0;
> > +	case hwmon_curr:
> > +		*str =3D "ISENSE";
> > +		return 0;
> > +	case hwmon_power:
> > +		*str =3D "Power";
> > +		return 0;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static ssize_t ltc4282_show_energy(struct device *dev,
> > +				=C2=A0=C2=A0 struct device_attribute *da, char *buf)
> > +{
> > +	struct ltc4282_state *st =3D dev_get_drvdata(dev);
> > +	u64 energy;
> > +	long en;
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	ret =3D ltc4282_energy_enable(dev, &en);
> > +	if (ret)
> > +		return ret;
> > +	if (!en)
> > +		return -ENODATA;
> > +
>=20
> This should be stored in a flag. Reading it from the chip for each
> energy reading is too expensive.

will do...

>=20
> > +	ret =3D ltc4282_read_energy(st, &energy);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* see @ltc4282_read_power_average */
> > +	if (st->saved_energy) {
> > +		energy +=3D st->saved_energy;
> > +		st->saved_energy =3D 0;
> > +	}
> > +
> > +	return sysfs_emit(buf, "%llu\n", energy);
> > +}
> > +
> > +static ssize_t ltc4282_show_fault(struct device *dev,
> > +				=C2=A0 struct device_attribute *da,
> > +				=C2=A0 u32 reg, char *buf)
> > +{
> > +	struct ltc4282_state *st =3D dev_get_drvdata(dev);
> > +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> > +	long alarm;
> > +	int ret;
> > +
> > +	ret =3D ltc4282_read_alarm(st, reg, attr->index, &alarm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return sysfs_emit(buf, "%lu\n", alarm);
> > +}
> > +
> > +static ssize_t ltc4282_show_status(struct device *dev,
> > +				=C2=A0=C2=A0 struct device_attribute *da, char *buf)
> > +{
> > +	return ltc4282_show_fault(dev, da, LTC4282_STATUS_LSB, buf);
> > +}
> > +
> > +static ssize_t ltc4282_show_fault_log(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_attribute *da, char
> > *buf)
> > +{
> > +	return ltc4282_show_fault(dev, da, LTC4282_FAULT_LOG, buf);
> > +}
> > +
> > +static ssize_t ltc4282_clear_fault_log(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_attribute *da,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t len)
> > +{
> > +	struct ltc4282_state *st =3D dev_get_drvdata(dev);
> > +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> > +	int ret;
> > +
> > +	ret =3D regmap_clear_bits(st->map, LTC4282_FAULT_LOG, attr->index);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return len;
> > +}
> > +
> > +static int ltc4282_power_on(const struct ltc4282_state *st)
> > +{
> > +	u32 n_tries =3D 5, reg;
> > +	int ret;
> > +
> > +	ret =3D devm_regulator_get_enable(st->dev, "vdd");
> > +	if (ret)
> > +		return dev_err_probe(st->dev, ret, "Failed vdd
> > get/enable\n");
> > +
> > +	/*
> > +	 * Make sure vdd is stable. From the datasheet:
> > +	 * The state of the UV and OV comparators is indicated by the
> > STATUS register
> > +	 * bits 0 and 1 and must be stable for at least 50ms to qualify for
> > turn-on.
> > +	 */
> > +	do {
> > +		ret =3D regmap_read_poll_timeout(st->map, LTC4282_STATUS_LSB,
> > reg,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg &
> > LTC4282_VDD_STATUS_MASK, 10000, 50000);
> > +		if (!ret)
> > +			continue;
> > +		if (ret !=3D -ETIMEDOUT)
> > +			return dev_err_probe(st->dev, ret, "Failed regmap
> > read\n");
> > +
> > +		/* Alright. We got timeout which means UV and OV are stable
> > for 50ms */
> > +		break;
> > +	} while (n_tries--);
> > +
> > +	if (!n_tries)
> > +		return dev_err_probe(st->dev, -ETIMEDOUT, "VDD not
> > stable\n");
> > +
> > +	return 0;
> > +}
>=20
>=20
> This is a hot swap controller. Turning it on in its hardware monitoring
> driver is highly inappropriate. I don't know where and how it is supposed
> to be turned on, but that can not be done here. Also, turning it off when
> unloading the driver (presumably that will happen since it is turned on
> with a device managed function) is even more inappropriate.
>=20
> It is even more inappropriate to delay the probe function by at least 50 =
ms
> just to check if two status register bits changed state.
>=20

Ohh yeah... I see now its completely inappropriate even more when unloading=
 the
driver. Will drop this.

> > +
> > +enum {
> > +	LTC4282_CLKOUT_INT,
> > +	LTC4282_CLKOUT_TICK,
> > +};
> > +
> > +static int ltc428_clks_setup(const struct ltc4282_state *st)
> > +{
> > +	unsigned long rate;
> > +	struct clk *clkin;
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret =3D device_property_read_u32(st->dev, "adi,clkout-mode", &val);
> > +	if (ret)
> > +		return 0;
> > +
> > +	if (val > LTC4282_CLKOUT_TICK)
> > +		return dev_err_probe(st->dev, -EINVAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid val(%u) for adi,clkout-
> > mode\n", val);
> > +
> > +	ret =3D regmap_update_bits(st->map, LTC4282_CLK_DIV,
> > LTC4282_CLKOUT_MASK,
> > +				 FIELD_PREP(LTC4282_CLKOUT_MASK, val + 1));
> > +	if (ret)
> > +		return ret;
> > +
>=20
> If the chip generates a clock output, the driver needs to register a cloc=
k
> device.

Ohh, I forgot to mention this in the cover. I did thought about it but the =
chip
is only capable of outputting either the conversion time or the internal sy=
stem
clock. So, I figured this would be to specific to matter to any in kernel
consumers. Anyways, I can add support for it and maybe always round to the
closest frequency someone asks for (again, the chip only supports outputtin=
g two
frequencies). Or maybe keep the attr and have a kind of "read only" clk?

>=20
> > +	clkin =3D devm_clk_get_optional_enabled(st->dev, NULL);
> > +	if (IS_ERR(clkin))
> > +		return dev_err_probe(st->dev, PTR_ERR(clkin), "Failed to
> > get clkin");
> > +	if (!clkin)
> > +		return 0;
> > +
> > +	rate =3D clk_get_rate(clkin);
> > +	if (rate < LTC4282_CLKIN_MIN || rate > LTC4282_CLKIN_MAX)
> > +		return dev_err_probe(st->dev, -EINVAL, "Invalid clkin
> > range(%lu) [%lu %lu]\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 rate, LTC4282_CLKIN_MIN,
> > LTC4282_CLKIN_MAX);
> > +
> > +	/*
> > +	 * Clocks faster than 250KHZ should be reduced to 250KHZ. The clock
> > frequency
> > +	 * is divided by twice the value in the register.
> > +	 */
> > +	val =3D rate / (2 * LTC4282_CLKIN_MIN);
> > +
> > +	return regmap_update_bits(st->map, LTC4282_CLK_DIV,
> > LTC4282_CLK_DIV_MASK,
> > +				=C2=A0 FIELD_PREP(LTC4282_CLK_DIV_MASK, val));
> > +}
> > +
> > +static const int ltc4282_curr_lim_uv[] =3D {
> > +	12500, 15625, 18750, 21875, 25000, 28125, 31250, 34375
> > +};
> > +
> > +static int ltc4282_get_defaults(struct ltc4282_state *st, u32 *curr_li=
m_uv)
> > +{
> > +	u32 reg_val, ilm_adjust;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, LTC4282_CTRL_MSB, &reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	st->vin_mode =3D FIELD_GET(LTC4282_CTRL_VIN_MODE_MASK, reg_val);
> > +
> > +	ret =3D regmap_read(st->map, LTC4282_ILIM_ADJUST, &reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ilm_adjust =3D FIELD_GET(LTC4282_ILIM_ADJUST_MASK, reg_val);
> > +	*curr_lim_uv =3D ltc4282_curr_lim_uv[ilm_adjust];
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Set max limits for ISENSE and Power as that depends on the max volt=
age
> > on rsense
> > + * that is defined in ILIM_ADJUST. This is specially important for pow=
er
> > because for
> > + * some rsense and vfsout values, if we allow the default raw 255 valu=
e,
> > that would
> > + * overflow long in 32bit archs when reading back the max power limit.
> > + */
>=20
> Wouldn't it make more sense to limit rsense to reasonable values instead =
?

The thing is, what would be that reasonable value? I honestly have no idea.=
 The
problem with the overflow is that the default value in the max_alarm regist=
er is
255. And with that, even for a reasonable value of rsense, we could get an
overflow.

Given the above, we could just defer handling for usersapce (meaning, they
should write a reasonable value in max_alarm) or keep the below. And the be=
low
sounded like a good idea because, at this stage, we do have all the info to
calculate the theoretical max_power (we have the max output voltage and
current).
=20
>=20
> > +static int ltc4282_set_max_limits(struct ltc4282_state *st, u32 val_uv=
)
> > +{
> > +	int ret;
> > +
> > +	ret =3D ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MAX, 40 *
> > MILLI, val_uv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Power is given by ISENSE * Vout. */
> > +	st->power_max =3D DIV_ROUND_CLOSEST(val_uv * DECA * MILLI, st-
> > >rsense) * st->vfs_out;
> > +	return ltc4282_write_power_byte(st, LTC4282_POWER_MAX, st-
> > >power_max);
> > +}
> > +
> > +/* valid GPIO functions */
> > +enum {
> > +	LTC4282_PIN_GPIO,
> > +	/* Power functions only for GPIO_1*/
> > +	LTC4282_PIN_POWER_BAD,
> > +	LTC4282_PIN_POWER_GOOD,
> > +	/* ADC monitor only for GPIO_2 and 3 */
> > +	LTC4282_PIN_ADC =3D 2,
> > +	/* Only for GPIO_2 */
> > +	LTC4282_PIN_FET_STRESS,
> > +};
> > +
> > +static int ltc4282_non_gpio_setup(struct ltc4282_state *st, u32 pin, u=
32
> > func, bool *adc_in)
> > +{
> > +	if (pin =3D=3D LTC4282_GPIO_1) {
> > +		u32 val =3D LTC4282_PIN_POWER_BAD;
> > +
> > +		if (func =3D=3D LTC4282_PIN_POWER_GOOD)
> > +			val =3D 0;
> > +
> > +		return regmap_update_bits(st->map, LTC4282_GPIO_CONFIG,
> > LTC4282_GPIO_1_CONFIG_MASK,
> > +					=C2=A0
> > FIELD_PREP(LTC4282_GPIO_1_CONFIG_MASK, val));
> > +	}
> > +
> > +	if (func =3D=3D LTC4282_PIN_FET_STRESS)
> > +		return regmap_update_bits(st->map, LTC4282_GPIO_CONFIG,
> > +					=C2=A0 LTC4282_GPIO_2_FET_STRESS_MASK,
> > +					=C2=A0
> > FIELD_PREP(LTC4282_GPIO_2_FET_STRESS_MASK, 1));
> > +
> > +	/*
> > +	 * Then, let's point the given GPIO to the ADC input. We need to
> > ensure that
> > +	 * function is only given once.
> > +	 */
> > +	if (*adc_in)
> > +		return dev_err_probe(st->dev, -EINVAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Only one gpio can be given to the ADC
> > input\n");
> > +
> > +	*adc_in =3D true;
> > +
> > +	/* setting the bit to 1 cause the ADC to monitor GPIO2 */
> > +	return regmap_update_bits(st->map, LTC4282_ILIM_ADJUST,
> > LTC4282_GPIO_MODE_MASK,
> > +				=C2=A0 FIELD_PREP(LTC4282_GPIO_MODE_MASK, pin =3D=3D
> > LTC4282_GPIO_2));
> > +}
> > +
> > +static const char * const ltc4282_gpio_prop[] =3D {
> > +	"adi,gpio1-mode", "adi,gpio2-mode", "adi,gpio3-mode"
> > +};
> > +
> > +static int ltc4282_gpio_setup(struct ltc4282_state *st)
> > +{
> > +	struct device *dev =3D st->dev;
> > +	u32 gpio, func, ngpios =3D 0;
> > +	bool adc_in =3D false;
> > +	int ret;
> > +
> > +	if (!IS_ENABLED(CONFIG_GPIOLIB))
> > +		return 0;
> > +
> > +	for (gpio =3D 0; gpio <=3D LTC4282_GPIO_3; gpio++) {
> > +		ret =3D device_property_read_u32(dev,
> > ltc4282_gpio_prop[gpio], &func);
> > +		if (ret)
> > +			continue;
> > +		if (func >=3D ltc4282_gpios[gpio].n_funcs)
> > +			return dev_err_probe(dev, ret, "Invalid func(%u >=3D
> > %u) for gpio%u\n",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 func,
> > ltc4282_gpios[gpio].n_funcs, gpio + 1);
> > +		if (func =3D=3D LTC4282_PIN_GPIO) {
> > +			st->gpio_map[ngpios++] =3D gpio;
> > +			if (gpio =3D=3D LTC4282_GPIO_1) {
> > +				/* default to input GPIO */
> > +				ret =3D regmap_set_bits(st->map,
> > LTC4282_GPIO_CONFIG,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > LTC4282_GPIO_1_CONFIG_MASK);
> > +				if (ret)
> > +					return ret;
> > +			}
> > +
> > +			continue;
> > +		}
> > +
> > +		ret =3D ltc4282_non_gpio_setup(st, gpio, func, &adc_in);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,gpio-alert"))
> > +		st->gpio_map[ngpios++] =3D LTC4282_ALERT;
> > +
> > +	if (!ngpios)
> > +		return 0;
> > +
> > +	st->gc.parent =3D dev;
> > +	st->gc.base =3D -1;
> > +	st->gc.ngpio =3D ngpios;
> > +	st->gc.can_sleep =3D true;
> > +	st->gc.label =3D "ltc4282";
> > +	st->gc.direction_input =3D ltc4282_gpio_input_set;
> > +	st->gc.direction_output =3D ltc4282_gpio_output_set;
> > +	st->gc.set =3D ltc4282_gpio_set;
> > +	st->gc.get =3D ltc4282_gpio_get;
> > +
> > +	return devm_gpiochip_add_data(dev, &st->gc, st);
> > +}
> > +
> > +/* This maps the Vout full scale for the given Vin mode */
> > +static const u16 ltc4282_vfs_milli[] =3D { 5540, 8320, 16640, 33280 };
> > +
> > +enum {
> > +	LTC4282_DIV_EXTERNAL,
> > +	LTC4282_DIV_5_PERCENT,
> > +	LTC4282_DIV_10_PERCENT,
> > +	LTC4282_DIV_15_PERCENT,
> > +};
> > +
> > +static int ltc4282_setup(struct ltc4282_state *st)
> > +{
> > +	struct device *dev =3D st->dev;
> > +	u32 val, curr_lim_uv;
> > +	int ret;
> > +
> > +	/* The part has an eeprom so let's get the needed defaults from it
> > */
> > +	ret =3D ltc4282_get_defaults(st, &curr_lim_uv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D device_property_read_u32(dev, "adi,rsense-nano-ohms", &st-
> > >rsense);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to read adi,rsense-
> > nano-ohms\n");
> > +
> > +	/*
> > +	 * The resolution for rsense is tens of micro which means we need
> > nano in the bindings.
>=20
> Assuming this is supposed to mean "tenths of micro", not "tens of micro",=
 do
> such sense
> resistors really exist in practice ? The smallest I was able to find has =
25
> micro-ohm.
>=20

Oh my bad. What I mean is that we can have values like 62.5 micro-ohm and
approximating it for these systems adds reasonable approx errors.

> > +	 * However, to make things easier to handle (with respect to
> > overflows) we divide it by
> > +	 * 100 as we don't really need the last two digits.
> > +	 */
> > +	st->rsense /=3D CENTI;
> > +
>=20
> This blindly accepts rsense values of < 100 which results in st->rsense =
=3D=3D 0
> and
> division by zero crashes.

Right...

>=20
> > +	ret =3D device_property_read_u32(dev, "vin-mode-microvolt", &val);
>=20
> No adi, prefix ?

will fix

> Anyway, this is really the input voltage range, or rather the maximum acc=
epted
> input voltage.
>=20

Hmm so is this not a valid property? Should I just user regulators to get V=
DD? I
know already that I should not enable/disable it :)

>=20
> > +	if (!ret) {
> > +		switch (val) {
> > +		case 3300000:
> > +			st->vin_mode =3D LTC4282_VIN_3_3V;
> > +			break;
> > +		case 5000000:
> > +			st->vin_mode =3D LTC4282_VIN_5V;
> > +			break;
> > +		case 12000000:
> > +			st->vin_mode =3D LTC4282_VIN_12V;
> > +			break;
> > +		case 24000000:
> > +			st->vin_mode =3D LTC4282_VIN_24V;
> > +			break;
> > +		default:
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid val(%u) for vin-mode-
> > microvolt\n", val);
> > +		}
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4282_CTRL_MSB,=C2=A0
> > LTC4282_CTRL_VIN_MODE_MASK,
> > +				=09
> > FIELD_PREP(LTC4282_CTRL_VIN_MODE_MASK, st->vin_mode));
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* Foldback mode should also be set to the input voltage */
> > +		ret =3D regmap_update_bits(st->map, LTC4282_ILIM_ADJUST,
> > LTC4282_FOLDBACK_MODE_MASK,
> > +				=09
> > FIELD_PREP(LTC4282_FOLDBACK_MODE_MASK, st->vin_mode));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	st->vfs_out =3D ltc4282_vfs_milli[st->vin_mode];
> > +
> > +	ret =3D device_property_read_u32(dev, "adi,current-limit-microvolt",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &curr_lim_uv);
>=20
> Current is measured in Ampere. Yes, that translates to volt through the s=
ense
> resistor,
> but it is still Ampere. No idea how that is normally handled in devicetre=
e.

Yes, but this translates directly from the datasheet and what's used in the
device. Otherwise, to give this in current, I would need rsense to translat=
e in
voltage. I could change the name but this uses the terminology used the
datasheet. I mean, there we have "current limit sense voltage". So maybe,=
=20
'adi,current-limit-sense-microvolt'?

>=20
> > +	if (!ret) {
> > +		int reg_val;
> > +
> > +		switch (val) {
> > +		case 12500:
> > +			reg_val =3D 0;
> > +			break;
> > +		case 15625:
> > +			reg_val =3D 1;
> > +			break;
> > +		case 18750:
> > +			reg_val =3D 2;
> > +			break;
> > +		case 21875:
> > +			reg_val =3D 3;
> > +			break;
> > +		case 25000:
> > +			reg_val =3D 4;
> > +			break;
> > +		case 28125:
> > +			reg_val =3D 5;
> > +			break;
> > +		case 31250:
> > +			reg_val =3D 6;
> > +			break;
> > +		case 34375:
> > +			reg_val =3D 7;
> > +			break;
> > +		default:
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid val(%u) for
> > adi,current-limit-microvolt\n",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 val);
> > +		}
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4282_ILIM_ADJUST,
> > LTC4282_ILIM_ADJUST_MASK,
> > +				=09
> > FIELD_PREP(LTC4282_ILIM_ADJUST_MASK, reg_val));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4282_set_max_limits(st, curr_lim_uv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D device_property_read_u32(st->dev, "adi,overvoltage-dividers",
> > &val);
> > +	if (!ret) {
> > +		if (val > LTC4282_DIV_15_PERCENT)
> > +			return dev_err_probe(st->dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid val(%u) for
> > adi,overvoltage-divider\n", val);
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4282_CTRL_MSB,
> > LTC4282_CTRL_OV_MODE_MASK,
> > +				=09
> > FIELD_PREP(LTC4282_CTRL_OV_MODE_MASK, val));
> > +	}
> > +
> > +	ret =3D device_property_read_u32(st->dev, "adi,undervoltage-
> > dividers", &val);
> > +	if (!ret) {
> > +		if (val > LTC4282_DIV_15_PERCENT)
> > +			return dev_err_probe(st->dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid val(%u) for
> > adi,undervoltage-divider\n", val);
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4282_CTRL_MSB,
> > LTC4282_CTRL_UV_MODE_MASK,
> > +				=09
> > FIELD_PREP(LTC4282_CTRL_UV_MODE_MASK, val));
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,overcurrent-retry")) {
> > +		ret =3D regmap_set_bits(st->map, LTC4282_CTRL_LSB,
> > LTC4282_CTRL_OC_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,overvoltage-retry-
> > disable")) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4282_CTRL_LSB,
> > LTC4282_CTRL_OV_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,undervoltage-retry-
> > disable")) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4282_CTRL_LSB,
> > LTC4282_CTRL_UV_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
> > +		ret =3D regmap_set_bits(st->map, LTC4282_ADC_CTRL,
> > LTC4282_FAULT_LOG_EN_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D device_property_read_u32(dev, "adi,fet-bad-timeout-ms",
> > &val);
> > +	if (!ret) {
> > +		if (val > LTC4282_FET_BAD_MAX_TIMEOUT)
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid value(%u) for
> > adi,fet-bad-timeout-ms", val);
> > +
> > +		ret =3D regmap_write(st->map, LTC4282_FET_BAD_FAULT_TIMEOUT,
> > val);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return ltc4282_gpio_setup(st);
> > +}
> > +
> > +static bool ltc4282_readable_reg(struct device *dev, unsigned int reg)
> > +{
> > +	if (reg =3D=3D LTC4282_RESERVED_1 || reg =3D=3D LTC4282_RESERVED_2)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static bool ltc4282_writable_reg(struct device *dev, unsigned int reg)
> > +{
> > +	if (reg =3D=3D LTC4282_STATUS_LSB || reg =3D=3D LTC4282_STATUS_MSB)
> > +		return false;
> > +	if (reg =3D=3D LTC4282_RESERVED_1 || reg =3D=3D LTC4282_RESERVED_2)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static const struct regmap_config ltc4282_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D LTC4282_RESERVED_3,
> > +	.readable_reg =3D ltc4282_readable_reg,
> > +	.writeable_reg =3D ltc4282_writable_reg,
> > +};
> > +
> > +static const struct hwmon_channel_info * const ltc4282_info[] =3D {
> > +	HWMON_CHANNEL_INFO(in,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_MAX_ALARM | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LCRIT_ALARM |
> > HWMON_I_CRIT_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_MAX_ALARM | HWMON_I_LABEL),
> > +	HWMON_CHANNEL_INFO(curr,
> > +			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> > +			=C2=A0=C2=A0 HWMON_C_LABEL),
> > +	HWMON_CHANNEL_INFO(power,
> > +			=C2=A0=C2=A0 HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
> > +			=C2=A0=C2=A0 HWMON_P_INPUT_HIGHEST | HWMON_P_MAX |
> > HWMON_P_MIN |
> > +			=C2=A0=C2=A0 HWMON_P_AVERAGE | HWMON_P_MAX_ALARM |
> > HWMON_P_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_P_LABEL),
> > +	HWMON_CHANNEL_INFO(energy,
> > +			=C2=A0=C2=A0 HWMON_E_ENABLE),
> > +	NULL
> > +};
> > +
> > +static const struct hwmon_ops ltc4282_hwmon_ops =3D {
> > +	.read =3D ltc4282_read,
> > +	.write =3D ltc4282_write,
> > +	.is_visible =3D ltc4282_is_visible,
> > +	.read_string =3D ltc4282_read_labels,
> > +};
> > +
> > +static const struct hwmon_chip_info ltc2947_chip_info =3D {
> > +	.ops =3D &ltc4282_hwmon_ops,
> > +	.info =3D ltc4282_info,
> > +};
> > +
> > +/* energy attributes are 6bytes wide so we need u64 */
> > +static SENSOR_DEVICE_ATTR(energy1_input, 0444, ltc4282_show_energy, NU=
LL,
> > 0);
> > +/* power1_fault */
> > +static SENSOR_DEVICE_ATTR(power1_good, 0444, ltc4282_show_status, NULL=
,
> > +			=C2=A0 LTC4282_POWER_GOOD_MASK);
> > +/* FET faults */
> > +static SENSOR_DEVICE_ATTR(fet_short_fault, 0444, ltc4282_show_status, =
NULL,
> > +			=C2=A0 LTC4282_FET_SHORT_MASK);
> > +static SENSOR_DEVICE_ATTR(fet_bad_fault, 0444, ltc4282_show_status, NU=
LL,
> > +			=C2=A0 LTC4282_FET_BAD_STATUS_MASK);
> > +/*
> > + * Fault log failures. These faults might be important in systems wher=
e
> > auto-retry is not enabled
> > + * since they will cause the part to latch off until they are cleared.
> > Typically that happens
> > + * when the system admin is close enough so he can check what happened=
 and
> > manually clear the
> > + * faults. Moreover, manually clearing the faults might only matter wh=
en
> > ON_FAULT_MASK in the
> > + * CONTROL register is set (which is the default) as in that case, a t=
urn
> > off signal from the
> > + * ON pin won't clear them.
> > + */
>=20
> I'd argue that such an operator would only be interested in clearing all
> faults
> at the same time. Your call, but all this does is making life hard for
> operators.

Hmm, So you mean having a single attr like 'fault_logs_reset? And having=
=20
the single logs in debugFS?

>=20
> > +static SENSOR_DEVICE_ATTR(in1_crit_fault_log, 0644, ltc4282_show_fault=
_log,
> > +			=C2=A0 ltc4282_clear_fault_log, LTC4282_OV_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(in1_lcrit_fault_log, 0644,
> > ltc4282_show_fault_log,
> > +			=C2=A0 ltc4282_clear_fault_log, LTC4282_UV_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(curr1_crit_fault_log, 0644,
> > ltc4282_show_fault_log,
> > +			=C2=A0 ltc4282_clear_fault_log, LTC4282_OC_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(power1_fault_log, 0644, ltc4282_show_fault_l=
og,
> > +			=C2=A0 ltc4282_clear_fault_log,
> > LTC4282_POWER_BAD_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(fet_bad_fault_log, 0644, ltc4282_show_fault_=
log,
> > +			=C2=A0 ltc4282_clear_fault_log,
> > LTC4282_FET_BAD_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(fet_short_fault_log, 0644,
> > ltc4282_show_fault_log,
> > +			=C2=A0 ltc4282_clear_fault_log,
> > LTC4282_FET_SHORT_FAULT_MASK);
> > +
> > +static struct attribute *ltc4282_attrs[] =3D {
> > +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> > +	&sensor_dev_attr_power1_good.dev_attr.attr,
> > +	&sensor_dev_attr_fet_bad_fault.dev_attr.attr,
> > +	&sensor_dev_attr_fet_short_fault.dev_attr.attr,
> > +	&sensor_dev_attr_in1_crit_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_in1_lcrit_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_curr1_crit_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_power1_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_fet_bad_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_fet_short_fault_log.dev_attr.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(ltc4282);
> > +
>=20
> Move all those except for energy1_input to debugfs.
>=20

I want only to mention 'power1_good'. Is not a fault log but a status bit. =
I
mention it in the cover as I'm not so sure about is "added value". I even t=
hough
about exporting it as 'power1_fault' but that's not ok because that bit bei=
ng is
0 does not necessarily means something is wrong.

- Nuno S=C3=A1
>=20
