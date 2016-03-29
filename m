Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawell.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC] Addition of Altera Arria10 System Resource Chip
Date: Tue, 29 Mar 2016 14:13:03 -0500
Message-ID: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

The Altera Arria10 Development Kit includes a system resource chip
that fits under the Multi-Function Device framework. The chip has
hardware monitoring functions and a GPIO expander over the SPI bus.

[RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip
[RFC 2/8] MAINTAINERS: Addition of Altera Arria10 System Resource
[RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System Resource
[RFC 4/8] gpio: altera-a10sr: Add A10 System Resource Chip GPIO
[RFC 5/8] ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
[RFC 6/8] ARM: socfpga: dts: Add LED framework to A10-SR GPIO
[RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
[RFC 8/8] ARM: socfpga: dts: Add Devkit Arria10-SR HWMON
