Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37227 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752830AbdIEUSe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Sep 2017 16:18:34 -0400
Received: by mail-pg0-f67.google.com with SMTP id 63so581149pgc.4
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Sep 2017 13:18:34 -0700 (PDT)
Date: Tue, 5 Sep 2017 13:18:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>,
        Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Matt Spinler <mspinler@linux.vnet.ibm.com>,
        msbarth@linux.vnet.ibm.com
Subject: Re: [PATCH v2 00/10] drivers/hwmon: Add On-Chip Controller (OCC)
 hwmon driver
Message-ID: <20170905201831.GA16996@roeck-us.net>
References: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
 <2AE5F533-8701-42BC-B542-0875DECC1B92@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2AE5F533-8701-42BC-B542-0875DECC1B92@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 05, 2017 at 03:07:10PM -0500, Eddie James wrote:
> Hi Guenter,
> 
> I have some additional features to add to this driver to handle some special temperature sensor values. Wanted to run it by you before submitting a new version to the list, since I’m not sure if there is a standard way of addressing this or not.
> 
> Temp sensor may return 0 for “data unavailable; may be available later” and 0xFF for error. It makes sense to map 0xFF to a tempX_fault attribute. However, for the “unavailable” case, should I use tempX_alarm for this? I think with “alarm” the sensor data is usually available in a normal hwmon device? We would either have to return a cached value for the tempX_input or return an error, since the data is not there.
> 
mapping 0xff to fault makes sense. Mapping 0x00 to alarm, however, doesn't
really make sense, since there is not really an alarm condition
(over/undertemperature/voltage). I can see two options: Either return a cached
value, or return something like -EAGAIN. Question though is if the condition
is or can be permanent. If yes, -EAGAIN would not be a good idea since it
most likely results in an immediate retry by userspace. If the condition is
or can be permanent, all you can probably do would be to report a cached
value for some period of time and then switch to reporting a fault condition.

[ sorry for not being more proactive with the review ]

Guenter


> Thanks,
> Eddie
> 
> > On Jul 27, 2017, at 9:30 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> > 
> > From: "Edward A. James" <eajames@us.ibm.com>
> > 
> > This series adds a hwmon driver to support the OCC on POWER8 and POWER9
> > processors. The OCC is an embedded processor that provides realtime power and
> > thermal monitoring and management.
> > 
> > This driver has two different platform drivers as a "base" for the
> > hwmon interface, as the means of communicating with the OCC on P8 and P9 is
> > completely different. For P8, the driver is an I2C client driver. For P9 the
> > driver is an FSI-based OCC client driver, and uses the OCC driver in-kernel
> > API. The OCC driver is on the LKML (latest https://lkml.org/lkml/2017/7/5/633).
> > 
> > Changes since v1:
> > * Remove wait loop in P9 code, as that is now handled by FSI OCC driver.
> > * Removed dt binding documentation for P9, FSI OCC driver will probe OCC hwmon
> >   driver automatically.
> > * Moved OCC response code definitions to the OCC include file.
> > * Fixed includes.
> > * Changed some structure fields to __beXX as that is what they are.
> > * Changed some errnos.
> > * Removed some dev_err().
> > * Refactored P8 code a bit to use #defined addresses and magic values, and
> >   changed "goto retry" to a loop.
> > * Refactored error handling a bit.
> > 
> > Edward A. James (10):
> >  drivers/hwmon: Add On-Chip Controller (OCC) hwmon driver
> >  drivers/hwmon/occ: Add command transport method for P8 and P9
> >  drivers/hwmon/occ: Parse OCC poll response
> >  drivers/hwmon/occ: Add sensor types and versions
> >  drivers/hwmon/occ: Add sensor attributes and register hwmon device
> >  drivers/hwmon/occ: Add non-hwmon attributes
> >  drivers/hwmon/occ: Add error handling
> >  Documentation: hwmon: Add OCC documentation
> >  Documentation: ABI: Add occ-hwmon driver sysfs documentation
> >  dt-bindings: i2c: Add P8 OCC hwmon driver documentation
> > 
> > Documentation/ABI/testing/sysfs-driver-occ-hwmon   |   77 ++
> > .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   |   25 +
> > Documentation/hwmon/occ                            |   74 ++
> > drivers/hwmon/Kconfig                              |    2 +
> > drivers/hwmon/Makefile                             |    1 +
> > drivers/hwmon/occ/Kconfig                          |   28 +
> > drivers/hwmon/occ/Makefile                         |   11 +
> > drivers/hwmon/occ/common.c                         | 1289 ++++++++++++++++++++
> > drivers/hwmon/occ/common.h                         |  119 ++
> > drivers/hwmon/occ/p8_i2c.c                         |  261 ++++
> > drivers/hwmon/occ/p9_sbe.c                         |  124 ++
> > 11 files changed, 2011 insertions(+)
> > create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon
> > create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> > create mode 100644 Documentation/hwmon/occ
> > create mode 100644 drivers/hwmon/occ/Kconfig
> > create mode 100644 drivers/hwmon/occ/Makefile
> > create mode 100644 drivers/hwmon/occ/common.c
> > create mode 100644 drivers/hwmon/occ/common.h
> > create mode 100644 drivers/hwmon/occ/p8_i2c.c
> > create mode 100644 drivers/hwmon/occ/p9_sbe.c
> > 
> > -- 
> > 1.8.3.1
> > 
> 
