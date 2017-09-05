Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v2 00/10] drivers/hwmon: Add On-Chip Controller (OCC)
 hwmon driver
From: Eddie James <eajames@linux.vnet.ibm.com>
In-Reply-To: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Tue, 5 Sep 2017 15:07:10 -0500
Cc: linux-hwmon@vger.kernel.org, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>,
        Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Matt Spinler <mspinler@linux.vnet.ibm.com>, msbarth@linux.vnet.ibm.com
Content-Transfer-Encoding: quoted-printable
References: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Message-Id: <2AE5F533-8701-42BC-B542-0875DECC1B92@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

I have some additional features to add to this driver to handle some =
special temperature sensor values. Wanted to run it by you before =
submitting a new version to the list, since I=E2=80=99m not sure if =
there is a standard way of addressing this or not.

Temp sensor may return 0 for =E2=80=9Cdata unavailable; may be available =
later=E2=80=9D and 0xFF for error. It makes sense to map 0xFF to a =
tempX_fault attribute. However, for the =E2=80=9Cunavailable=E2=80=9D =
case, should I use tempX_alarm for this? I think with =E2=80=9Calarm=E2=80=
=9D the sensor data is usually available in a normal hwmon device? We =
would either have to return a cached value for the tempX_input or return =
an error, since the data is not there.

Thanks,
Eddie

> On Jul 27, 2017, at 9:30 AM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This series adds a hwmon driver to support the OCC on POWER8 and =
POWER9
> processors. The OCC is an embedded processor that provides realtime =
power and
> thermal monitoring and management.
>=20
> This driver has two different platform drivers as a "base" for the
> hwmon interface, as the means of communicating with the OCC on P8 and =
P9 is
> completely different. For P8, the driver is an I2C client driver. For =
P9 the
> driver is an FSI-based OCC client driver, and uses the OCC driver =
in-kernel
> API. The OCC driver is on the LKML (latest =
https://lkml.org/lkml/2017/7/5/633).
>=20
> Changes since v1:
> * Remove wait loop in P9 code, as that is now handled by FSI OCC =
driver.
> * Removed dt binding documentation for P9, FSI OCC driver will probe =
OCC hwmon
>   driver automatically.
> * Moved OCC response code definitions to the OCC include file.
> * Fixed includes.
> * Changed some structure fields to __beXX as that is what they are.
> * Changed some errnos.
> * Removed some dev_err().
> * Refactored P8 code a bit to use #defined addresses and magic values, =
and
>   changed "goto retry" to a loop.
> * Refactored error handling a bit.
>=20
> Edward A. James (10):
>  drivers/hwmon: Add On-Chip Controller (OCC) hwmon driver
>  drivers/hwmon/occ: Add command transport method for P8 and P9
>  drivers/hwmon/occ: Parse OCC poll response
>  drivers/hwmon/occ: Add sensor types and versions
>  drivers/hwmon/occ: Add sensor attributes and register hwmon device
>  drivers/hwmon/occ: Add non-hwmon attributes
>  drivers/hwmon/occ: Add error handling
>  Documentation: hwmon: Add OCC documentation
>  Documentation: ABI: Add occ-hwmon driver sysfs documentation
>  dt-bindings: i2c: Add P8 OCC hwmon driver documentation
>=20
> Documentation/ABI/testing/sysfs-driver-occ-hwmon   |   77 ++
> .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   |   25 +
> Documentation/hwmon/occ                            |   74 ++
> drivers/hwmon/Kconfig                              |    2 +
> drivers/hwmon/Makefile                             |    1 +
> drivers/hwmon/occ/Kconfig                          |   28 +
> drivers/hwmon/occ/Makefile                         |   11 +
> drivers/hwmon/occ/common.c                         | 1289 =
++++++++++++++++++++
> drivers/hwmon/occ/common.h                         |  119 ++
> drivers/hwmon/occ/p8_i2c.c                         |  261 ++++
> drivers/hwmon/occ/p9_sbe.c                         |  124 ++
> 11 files changed, 2011 insertions(+)
> create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon
> create mode 100644 =
Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> create mode 100644 Documentation/hwmon/occ
> create mode 100644 drivers/hwmon/occ/Kconfig
> create mode 100644 drivers/hwmon/occ/Makefile
> create mode 100644 drivers/hwmon/occ/common.c
> create mode 100644 drivers/hwmon/occ/common.h
> create mode 100644 drivers/hwmon/occ/p8_i2c.c
> create mode 100644 drivers/hwmon/occ/p9_sbe.c
>=20
> --=20
> 1.8.3.1
>=20
