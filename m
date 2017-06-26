Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
Date: Mon, 26 Jun 2017 14:01:36 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
	mark.rutland@arm.com, gregkh@linuxfoundation.org,
	cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
	andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH 1/7] drivers/hwmon: Add On-Chip Controller (OCC) hwmon
 driver
Message-ID: <20170626190136.xtc2qjbkiwyrgnzs@rob-hp-laptop>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1498171716-26620-2-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498171716-26620-2-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Jun 22, 2017 at 05:48:30PM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> The OCC is a device embedded on a POWER processor that collects and
> aggregates sensor data from the processor and system. The OCC can
> provide the raw sensor data as well as perform thermal and power
> management on the system.
> 
> This driver provides a hwmon interface to the OCC from a service
> processor (e.g. a BMC). The driver supports both POWER8 and POWER9 OCCs.
> Communications with the POWER8 OCC are established over standard I2C
> bus. The driver communicates with the POWER9 OCC through the FSI-based
> OCC driver, which handles the lower-level communication details.
> 
> This patch lays out the structure of the OCC hwmon driver. There are two
> platform drivers, one each for P8 and P9 OCCs. These are probed through
> the I2C tree and the FSI-based OCC driver, respectively. The patch also
> defines the first common structures and methods between the two OCC
> versions.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt   | 18 ++++++
>  .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   | 25 ++++++++
>  drivers/hwmon/Kconfig                              |  2 +
>  drivers/hwmon/Makefile                             |  1 +
>  drivers/hwmon/occ/Kconfig                          | 28 +++++++++
>  drivers/hwmon/occ/Makefile                         | 11 ++++
>  drivers/hwmon/occ/common.c                         | 43 +++++++++++++
>  drivers/hwmon/occ/common.h                         | 41 +++++++++++++
>  drivers/hwmon/occ/p8_i2c.c                         | 70 ++++++++++++++++++++++
>  drivers/hwmon/occ/p9_sbe.c                         | 65 ++++++++++++++++++++
>  10 files changed, 304 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
>  create mode 100644 drivers/hwmon/occ/Kconfig
>  create mode 100644 drivers/hwmon/occ/Makefile
>  create mode 100644 drivers/hwmon/occ/common.c
>  create mode 100644 drivers/hwmon/occ/common.h
>  create mode 100644 drivers/hwmon/occ/p8_i2c.c
>  create mode 100644 drivers/hwmon/occ/p9_sbe.c
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> new file mode 100644
> index 0000000..0ecebb7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> @@ -0,0 +1,18 @@
> +Device-tree bindings for FSI-based On-Chip Controller hwmon driver
> +------------------------------------------------------------------
> +
> +This node MUST be a child node of an OCC driver node.

Bindings describe h/w, not drivers. And hwmon is a Linuxism.

> +
> +Required properties:
> + - compatible = "ibm,p9-occ-hwmon";
> +
> +Examples:
> +
> +    occ@1 {
> +        compatible = "ibm,p9-occ";
> +        reg = <1>;
> +
> +        occ-hwmon@1 {
> +            compatible = "ibm,p9-occ-hwmon";

See my comment in the other version I just reviewed...

> +        };
> +    };
