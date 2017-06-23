Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37504 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751180AbdFWEwM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Jun 2017 00:52:12 -0400
Subject: Re: [PATCH 0/7] drivers/hwmon: Add On-Chip Controller (OCC) hwmon
 driver
To: Eddie James <eajames@linux.vnet.ibm.com>,
        linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, mark.rutland@arm.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, cbostic@linux.vnet.ibm.com,
        jk@ozlabs.org, joel@jms.id.au, andrew@aj.id.au,
        "Edward A. James" <eajames@us.ibm.com>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7806f15f-a594-2cfb-777a-29f1e8a3fd97@roeck-us.net>
Date: Thu, 22 Jun 2017 21:52:08 -0700
MIME-Version: 1.0
In-Reply-To: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/22/2017 03:48 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> This series adds a hwmon driver to support the OCC on POWER8 and POWER9
> processors. The OCC is an embedded processor that provides realtime power and
> thermal monitoring and management.
> 
> This driver has two different platform drivers as a "base" for the
> hwmon stuff, as the means of communicating with the OCC on P8 and P9 is
> completely different. For P8, the driver is an I2C client driver. For P9 the
> driver is an FSI-based OCC client driver, and uses the OCC driver in-kernel
> API.
> 
> There was a previous version of this driver that wasn't written with the
> differences in communication methods between the two versions in mind. This
> driver has been considerably simplified.
> 

I thought I did see this before.

It is customary to use "v2" in such situations, and add a change log.
You expect me to go into the two versions and compare them to figure
out what changed to evaluate if it makes sense. Do you really believe that
I have enough time to do that, and that I would be willing to spend that
time in the first place ?

Presumably you know what changed. Why not just tell me ?

Guenter

> Edward A. James (7):
>    drivers/hwmon: Add On-Chip Controller (OCC) hwmon driver
>    drivers/hwmon/occ: Add command transport method for P8 and P9
>    drivers/hwmon/occ: Parse OCC poll response
>    drivers/hwmon/occ: Add sensor types and versions
>    drivers/hwmon/occ: Add sensor attributes and register hwmon device
>    drivers/hwmon/occ: Add non-hwmon attributes
>    drivers/hwmon/occ: Add error handling
> 
>   Documentation/ABI/testing/sysfs-driver-occ-hwmon   |   77 ++
>   .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt   |   18 +
>   .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   |   25 +
>   Documentation/hwmon/occ                            |   84 ++
>   drivers/hwmon/Kconfig                              |    2 +
>   drivers/hwmon/Makefile                             |    1 +
>   drivers/hwmon/occ/Kconfig                          |   28 +
>   drivers/hwmon/occ/Makefile                         |   11 +
>   drivers/hwmon/occ/common.c                         | 1242 ++++++++++++++++++++
>   drivers/hwmon/occ/common.h                         |  151 +++
>   drivers/hwmon/occ/p8_i2c.c                         |  250 ++++
>   drivers/hwmon/occ/p9_sbe.c                         |  144 +++
>   12 files changed, 2033 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon
>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
>   create mode 100644 Documentation/hwmon/occ
>   create mode 100644 drivers/hwmon/occ/Kconfig
>   create mode 100644 drivers/hwmon/occ/Makefile
>   create mode 100644 drivers/hwmon/occ/common.c
>   create mode 100644 drivers/hwmon/occ/common.h
>   create mode 100644 drivers/hwmon/occ/p8_i2c.c
>   create mode 100644 drivers/hwmon/occ/p9_sbe.c
> 

