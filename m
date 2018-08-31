Return-Path: <rdunlap@infradead.org>
Return-path: <rdunlap@infradead.org>
Subject: Re: [PATCH v5 03/10] Documentation: hwmon: Add OCC documentation
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 jdelvare@suse.com, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com,
 linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535664761-86018-4-git-send-email-eajames@linux.vnet.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4f4ff98e-f2a6-c8b1-2ad1-b16bf4305fdd@infradead.org>
Date: Fri, 31 Aug 2018 16:01:10 -0700
MIME-Version: 1.0
In-Reply-To: <1535664761-86018-4-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 08/30/2018 02:32 PM, Eddie James wrote:
> Document the hwmon interface for the OCC.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

Hi,
Please see comments below.

> ---
>  Documentation/hwmon/occ | 112 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/hwmon/occ
> 
> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> new file mode 100644
> index 0000000..adc2fa4
> --- /dev/null
> +++ b/Documentation/hwmon/occ
> @@ -0,0 +1,112 @@
> +Kernel driver occ-hwmon
> +=======================
> +
> +Supported chips:
> +  * POWER8
> +  * POWER9
> +
> +Author: Eddie James <eajames@linux.vnet.ibm.com>
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for the On-Chip Controller (OCC)
> +embedded on POWER processors. The OCC is a device that collects and aggregates
> +sensor data from the processor and the system. The OCC can provide the raw
> +sensor data as well as perform thermal and power management on the system.
> +
> +The P8 version of this driver is a client driver of I2C. It may be probed
> +manually if an "ibm,p8-occ-hwmon" compatible device is found under the
> +appropriate I2C bus node in the device-tree.
> +
> +The P9 version of this driver is a client driver of the FSI-based OCC driver.
> +It will be probed automatically by the FSI-based OCC driver.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported. All attributes are read-only unless
> +specified.
> +
> +The OCC sensor ID is an integer that represents the unique identififer of the

                                                              identifier

> +sensor with respect to the OCC. For example, a temperature sensor for the 3rd

prefer s/3rd/third/

> +DIMM slot in the system may have a sensor ID of 7. This mapping is unavailable
> +to the device driver, which must therefore export the sensor ID as-is.
> +
> +Some entries are only present with certain OCC sensor versions or only on
> +certain OCCs in the system. The version number is not exported to the user
> +but can be inferred.

[snip]


-- 
~Randy
