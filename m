Return-Path: <drustafa@yandex.ru>
Return-path: <drustafa@yandex.ru>
From: Evgeniy Polyakov <zbr@ioremap.net>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"jdelvare@suse.com" <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20170712214118.4306-1-jaghu@google.com>
References: <20170712214118.4306-1-jaghu@google.com>
Subject: Re: [PATCH linux v2 0/3] Export 1-wire thermal sensors as hwmon device
MIME-Version: 1.0
Message-Id: <557981499960209@web50j.yandex.ru>
Date: Thu, 13 Jul 2017 18:36:49 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Hi

13.07.2017, 00:41, "Jaghathiswari Rankappagounder Natarajan" <jaghu@google.com>:
> Our board has 4 DS18B20 1-wire temperature sensors. Each 1-wire bus and the
> sensor under it is already configured against the Linux 1-wire driver
> (called w1). They have a sysfs file(e.g.
> /sys/bus/w1/devices/w1_bus_master1/28-000007704f4c/w1_slave) which, when read,
> runs code to read the temperature. We'd like the temperatures to show up in
> hwmon, so that the BMC IPMI sensor plumbing can forward those to host.
>
> The changes in version 2 are mentioned in the individual patches.
>
> This patchset is based on linux mainline version v4.10.

I believe this is a resend of your previous patchet, isn't it?
Greg, if you hadn't yet, please pull it into the tree.

Thank you.
