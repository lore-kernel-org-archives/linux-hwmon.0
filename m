Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41354 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751972AbdHJO4U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 10:56:20 -0400
Date: Thu, 10 Aug 2017 07:56:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH 4/4] Documentation: ABI: Add IBM power supply sysfs
 documentation
Message-ID: <20170810145618.GC4945@roeck-us.net>
References: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501708633-2964-5-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501708633-2964-5-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 02, 2017 at 04:17:13PM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-ibmps | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-ibmps
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-ibmps b/Documentation/ABI/testing/sysfs-driver-ibmps
> new file mode 100644
> index 0000000..1645685
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-ibmps
> @@ -0,0 +1,49 @@
> +What:		/sys/bus/i2c/devices/<dev>/clear_faults

Please, no. If we do add driver-specific attributes, those should be added to
the hwmon device, not to the i2c device.

Guenter

> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Clears pmbus faults for this power supply.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_word
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_WORD register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_vout
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_VOUT register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_iout
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_IOUT register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_input
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_INPUT register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_temp
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_TEMPERATURE register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_cml
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_CML register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_other
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_OTHER register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_mfr
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_MFR_SPECIFIC register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_fan
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_FAN register.
> -- 
> 1.8.3.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
