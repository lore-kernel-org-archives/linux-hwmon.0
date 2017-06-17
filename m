Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from forward1j.cmail.yandex.net ([5.255.227.19]:49905 "EHLO
        forward1j.cmail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752027AbdFQOms (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Jun 2017 10:42:48 -0400
From: Evgeniy Polyakov <zbr@ioremap.net>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
In-Reply-To: <20170614215944.24984-1-jaghu@google.com>
References: <20170614215944.24984-1-jaghu@google.com>
Subject: Re: [PATCH linux v1 0/3] Export 1-wire thermal sensors as hwmon device
MIME-Version: 1.0
Message-Id: <3137281497710254@web33j.yandex.ru>
Date: Sat, 17 Jun 2017 17:37:34 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi

15.06.2017, 00:59, "Jaghathiswari Rankappagounder Natarajan" <jaghu@google.com>:
> Our board has 4 DS18B20 1-wire temperature sensors. Each 1-wire bus and the
> sensor under it is already configured against the Linux 1-wire driver
> (called w1). They have a sysfs file(e.g.
> /sys/bus/w1/devices/w1_bus_master1/28-000007704f4c/w1_slave) which, when read,
> runs code to read the temperature. We'd like the temperatures to show up in
> hwmon, so that the BMC IPMI sensor plumbing can forward those to host.
>
> This patchset is based on linux mainline version v4.10.

Looks good to me, thank you.

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
