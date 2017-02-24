Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 23 Feb 2017 18:42:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Edward James <eajames@us.ibm.com>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, jdelvare@suse.com, joel@jms.id.a,
        linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        wsa@the-dreams.de, Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux v8 0/6] drivers: hwmon: Add On-Chip Controller
 driver
Message-ID: <20170224024241.GA25676@roeck-us.net>
References: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
 <OF68CFA9BA.DAF80746-ON002580D0.007C5BAD-862580D0.007CD16A@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF68CFA9BA.DAF80746-ON002580D0.007C5BAD-862580D0.007CD16A@notes.na.collabserv.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Feb 23, 2017 at 04:43:20PM -0600, Edward James wrote:
> Hi Guenter,
> 
> Any thoughts on this patch set? Others welcome to chime in too.
> 
Sorry, I have been busy. Weekend or next week, hopefully.

Guenter

> Thanks,
> Eddie
> 
> Eddie James <eajames@linux.vnet.ibm.com> wrote on 02/14/2017 02:34:17 PM:
> 
> > From: Eddie James <eajames@linux.vnet.ibm.com>
> > To: linux@roeck-us.net
> > Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-
> > hwmon@vger.kernel.org, linux-doc@vger.kernel.org, jdelvare@suse.com,
> > corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-
> > dreams.de, andrew@aj.id.au, benh@kernel.crashing.org,
> > joel@jms.id.au, Edward James/Austin/IBM@IBMUS
> > Date: 02/14/2017 02:34 PM
> > Subject: [PATCH linux v8 0/6] drivers: hwmon: Add On-Chip Controller
> driver
> >
> > From: "Edward A. James" <eajames@us.ibm.com>
> >
> > This patchset adds a hwmon driver to support the OCC (On-Chip Controller)
> > on the IBM POWER8 and POWER9 processors, from a BMC (Baseboard Management
> > Controller). The OCC is an embedded processor that provides real time
> > power and thermal monitoring.
> >
> > The driver provides an interface on a BMC to poll OCC sensor data, set
> > user power caps, and perform some basic OCC error handling. It interfaces
> > with userspace through hwmon.
> >
> > The driver is currently functional only for the OCC on POWER8 chips.
> > Communicating with the POWER9 OCC requries FSI support.
> >
> > Since v7:
> >  * change Makefile and Kconfig to build a single module for the driver
> >  * include p9 file in build
> >  * change Kconfig from "PPC" to "IBM"
> >  * remove EXPORT_SYMBOL
> >  * bundle occ_config and occ_ops structures into occ_init_data structure
> >  * few style tweaks suggested by Joel
> >
> > Edward A. James (6):
> >   hwmon: Add core On-Chip Controller support for POWER CPUs
> >   hwmon: occ: Add sysfs interface
> >   hwmon: occ: Add I2C transport implementation for SCOM operations
> >   hwmon: occ: Add callbacks for parsing P8 OCC datastructures
> >   hwmon: occ: Add hwmon implementation for the P8 OCC
> >   hwmon: occ: Add callbacks for parsing P9 OCC datastructures
> >
> >  Documentation/devicetree/bindings/hwmon/occ.txt |  13 +
> >  Documentation/hwmon/occ                         | 116 +++++++
> >  MAINTAINERS                                     |   7 +
> >  drivers/hwmon/Kconfig                           |   2 +
> >  drivers/hwmon/Makefile                          |   1 +
> >  drivers/hwmon/occ/Kconfig                       |  39 +++
> >  drivers/hwmon/occ/Makefile                      |   5 +
> >  drivers/hwmon/occ/occ.c                         | 440 +++++++++++++
> > +++++++++++
> >  drivers/hwmon/occ/occ.h                         |  77 +++++
> >  drivers/hwmon/occ/occ_p8.c                      | 256 ++++++++++++++
> >  drivers/hwmon/occ/occ_p8.h                      |  25 ++
> >  drivers/hwmon/occ/occ_p8_i2c.c                  |  99 ++++++
> >  drivers/hwmon/occ/occ_p9.c                      | 320 +++++++++++++++++
> >  drivers/hwmon/occ/occ_p9.h                      |  25 ++
> >  drivers/hwmon/occ/occ_scom_i2c.c                |  69 ++++
> >  drivers/hwmon/occ/occ_scom_i2c.h                |  21 ++
> >  drivers/hwmon/occ/occ_sysfs.c                   | 245 +++++++++++++
> >  drivers/hwmon/occ/occ_sysfs.h                   |  25 ++
> >  drivers/hwmon/occ/scom.h                        |  42 +++
> >  19 files changed, 1827 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
> >  create mode 100644 Documentation/hwmon/occ
> >  create mode 100644 drivers/hwmon/occ/Kconfig
> >  create mode 100644 drivers/hwmon/occ/Makefile
> >  create mode 100644 drivers/hwmon/occ/occ.c
> >  create mode 100644 drivers/hwmon/occ/occ.h
> >  create mode 100644 drivers/hwmon/occ/occ_p8.c
> >  create mode 100644 drivers/hwmon/occ/occ_p8.h
> >  create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c
> >  create mode 100644 drivers/hwmon/occ/occ_p9.c
> >  create mode 100644 drivers/hwmon/occ/occ_p9.h
> >  create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
> >  create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
> >  create mode 100644 drivers/hwmon/occ/occ_sysfs.c
> >  create mode 100644 drivers/hwmon/occ/occ_sysfs.h
> >  create mode 100644 drivers/hwmon/occ/scom.h
> >
> > --
> > 1.8.3.1
> >
