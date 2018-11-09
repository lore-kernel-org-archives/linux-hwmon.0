Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41666 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbeKJIqj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Nov 2018 03:46:39 -0500
Date: Fri, 9 Nov 2018 15:03:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, mark.rutland@arm.com, rdunlap@infradead.org,
        benh@kernel.crashing.org, Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 00/10] hwmon and fsi: Add On-Chip Controller Driver
Message-ID: <20181109230354.GA31326@roeck-us.net>
References: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 08, 2018 at 03:05:19PM -0600, Eddie James wrote:
> From: Eddie James <eajames@linux.vnet.ibm.com>
> 
> This series adds a hwmon driver to support the OCC on POWER8 and POWER9
> processors. The OCC is an embedded processor that provides realtime power and
> thermal monitoring and management.
> 
> The series also adds a "bus" driver to handle atomic communication between the
> service processor and the OCC on a POWER9 chip. This communication takes place
> over FSI bus to the SBE (Self-Boot engine) FIFO, which in turn communicates
> with the OCC. The driver for the SBEFIFO is already available as an FSI client
> driver.
> 
> For POWER8 OCCs, communication between the service processor and the OCC is
> achieved over I2C bus.
> 
I am not entirely happy with the series - there are still lots of proprietary
attributes, and I would have preferred the use of the _info API at this point -
but this has taken long enough. Series applied to hwmon-next. Please send any
fixes as follow-up patches.

Thanks,
Guenter

> Changes since v5:
>  * Makefile fix when compiling both P8 and P9 versions
>  * Spelling fix in hwmon doc
>  * Added an additional sentence for P9 binding doc to explain that OCC isn't
>    an FSI slave device.
> 
> Changes since v4:
>  * Make the hwmon attributes conform almost completely to standard names and
>    values. The only exception is powerX_cap_user and powerX_cap_user_source.
>  * Improve hwmon documentation.
>  * Add ibm,p9-occ dt documentation.
> 
> Changes since v3:
>  * Add the FSI OCC driver.
>  * Pull the sysfs attribute code into it's own file for cleanliness.
>  * Various fixes for attribute creation and integer overflow.
> 
> Changes since v2:
>  * Add sysfs_notify for the error and throttling attributes when change is
>    detected.
>  * Removed occs_present counting of devices bound.
>  * Improved remove() of P9 driver to avoid bad behavior with relation to OCC
>    driver when unbound.
>  * Added default cases (return EINVAL) for all sensor show functions.
>  * Added temperature fault sensor.
>  * Added back dt binding documentation for P9 to address checkpatch warning.
>  * Added occs_present attribute from the poll response.
> 
> Changes since v1:
>  * Remove wait loop in P9 code, as that is now handled by FSI OCC driver.
>  * Removed dt binding documentation for P9, FSI OCC driver will probe OCC hwmon
>    driver automatically.
>  * Moved OCC response code definitions to the OCC include file.
>  * Fixed includes.
>  * Changed some structure fields to __beXX as that is what they are.
>  * Changed some errnos.
>  * Removed some dev_err().
>  * Refactored P8 code a bit to use #defined addresses and magic values, and
>    changed "goto retry" to a loop.
>  * Refactored error handling a bit.
> 
> Eddie James (10):
>   dt-bindings: fsi: Add P9 OCC device documentation
>   fsi: Add On-Chip Controller (OCC) driver
>   Documentation: hwmon: Add OCC documentation
>   dt-bindings: i2c: Add P8 OCC hwmon device documentation
>   hwmon: Add On-Chip Controller (OCC) hwmon driver
>   hwmon (occ): Add command transport method for P8 and P9
>   hwmon (occ): Parse OCC poll response
>   hwmon (occ): Add sensor types and versions
>   hwmon (occ): Add sensor attributes and register hwmon device
>   hwmon (occ): Add sysfs attributes for additional OCC data
> 
>  .../devicetree/bindings/fsi/ibm,p9-occ.txt         |   16 +
>  .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   |   25 +
>  Documentation/hwmon/occ                            |  112 ++
>  drivers/fsi/Kconfig                                |   10 +
>  drivers/fsi/Makefile                               |    1 +
>  drivers/fsi/fsi-occ.c                              |  599 +++++++++++
>  drivers/hwmon/Kconfig                              |    2 +
>  drivers/hwmon/Makefile                             |    1 +
>  drivers/hwmon/occ/Kconfig                          |   31 +
>  drivers/hwmon/occ/Makefile                         |    5 +
>  drivers/hwmon/occ/common.c                         | 1098 ++++++++++++++++++++
>  drivers/hwmon/occ/common.h                         |  128 +++
>  drivers/hwmon/occ/p8_i2c.c                         |  255 +++++
>  drivers/hwmon/occ/p9_sbe.c                         |  106 ++
>  drivers/hwmon/occ/sysfs.c                          |  188 ++++
>  include/linux/fsi-occ.h                            |   25 +
>  16 files changed, 2602 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
>  create mode 100644 Documentation/hwmon/occ
>  create mode 100644 drivers/fsi/fsi-occ.c
>  create mode 100644 drivers/hwmon/occ/Kconfig
>  create mode 100644 drivers/hwmon/occ/Makefile
>  create mode 100644 drivers/hwmon/occ/common.c
>  create mode 100644 drivers/hwmon/occ/common.h
>  create mode 100644 drivers/hwmon/occ/p8_i2c.c
>  create mode 100644 drivers/hwmon/occ/p9_sbe.c
>  create mode 100644 drivers/hwmon/occ/sysfs.c
>  create mode 100644 include/linux/fsi-occ.h
> 
> -- 
> 1.8.3.1
> 
