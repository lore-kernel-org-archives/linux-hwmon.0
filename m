Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from forward4j.cmail.yandex.net ([5.255.227.22]:49609 "EHLO
        forward4j.cmail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750792AbdH0Hg6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Aug 2017 03:36:58 -0400
From: Evgeniy Polyakov <zbr@ioremap.net>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
In-Reply-To: <20170717230906.4084-1-jaghu@google.com>
References: <20170717230906.4084-1-jaghu@google.com>
Subject: Re: [PATCH linux v5 0/3] Export 1-wire thermal sensors as hwmon device
MIME-Version: 1.0
Message-Id: <1202371503819110@web4g.yandex.ru>
Date: Sun, 27 Aug 2017 10:31:50 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi

18.07.2017, 02:09, "Jaghathiswari Rankappagounder Natarajan" <jaghu@google.com>:
> Hi Greg,
> Please pull in this patchset into the tree. Thanks!

Here is a patchset, is it visible in your mailbox?
If so, please pull it into your tree.

> Summary of what this patchset does:
>
> Our board has 4 DS18B20 1-wire temperature sensors. Each 1-wire bus and the
> sensor under it is already configured against the Linux 1-wire driver
> (called w1). They have a sysfs file(e.g.
> /sys/bus/w1/devices/w1_bus_master1/28-000007704f4c/w1_slave) which, when read,
> runs code to read the temperature. We'd like the temperatures to show up in
> hwmon, so that the BMC IPMI sensor plumbing can forward those to host.
>
> This patchset is based on linux mainline version v4.10.
>
> Tested:
> Yes; On a board with 4 DS18B20 1-wire temperature sensors:
> root@zaius:/sys/class/hwmon# ls
> hwmon0 hwmon1 hwmon2 hwmon3 hwmon4 hwmon5
> root@zaius:/sys/class/hwmon# cd hwmon0
> root@zaius:/sys/class/hwmon/hwmon0# ls
> device name subsystem temp1_input uevent
> root@zaius:/sys/class/hwmon/hwmon0# cat temp1_input
> 24500
> root@zaius:/sys/class/hwmon/hwmon0# cd ..
> root@zaius:/sys/class/hwmon# cd hwmon1
> root@zaius:/sys/class/hwmon/hwmon1# cat temp1_input
> 26562
> root@zaius:/sys/class/hwmon/hwmon1# cd ..
> root@zaius:/sys/class/hwmon# cd hwmon2
> root@zaius:/sys/class/hwmon/hwmon2# cat temp1_input
> 27250
> root@zaius:/sys/class/hwmon/hwmon2# cd ..
> root@zaius:/sys/class/hwmon# cd hwmon3
> root@zaius:/sys/class/hwmon/hwmon3# cat temp1_input
> 22250
> root@zaius:/sys/class/hwmon/hwmon3#
>
> Jaghathiswari Rankappagounder Natarajan (3):
>   drivers: w1: add hwmon support structures
>   drivers: w1: refactor w1_slave_show to make the temp reading
>     functionality separate
>   drivers: w1: add hwmon temp support for w1_therm
>
>  drivers/w1/slaves/w1_therm.c | 164 +++++++++++++++++++++++++++++++++++--------
>  drivers/w1/w1.c | 18 ++++-
>  drivers/w1/w1.h | 2 +
>  drivers/w1/w1_family.h | 2 +
>  4 files changed, 156 insertions(+), 30 deletions(-)
>
> --
> 2.13.2.932.g7449e964c-goog
