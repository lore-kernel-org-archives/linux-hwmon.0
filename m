Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54372 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752909AbdHJO5S (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 10:57:18 -0400
Date: Thu, 10 Aug 2017 07:57:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH 3/4] Documentation: hwmon: Add IBM power supply
 documentation
Message-ID: <20170810145716.GD4945@roeck-us.net>
References: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501708633-2964-4-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501708633-2964-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 02, 2017 at 04:17:12PM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  Documentation/hwmon/ibmps | 53 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/hwmon/ibmps
> 
> diff --git a/Documentation/hwmon/ibmps b/Documentation/hwmon/ibmps
> new file mode 100644
> index 0000000..7f13fd4
> --- /dev/null
> +++ b/Documentation/hwmon/ibmps
> @@ -0,0 +1,53 @@
> +Kernel driver ibmps
> +====================
> +
> +Supported chips:
> +  * IBM Witherspoon power supply
> +
if the power supply is "witherspoon", maybe that should be the name of the
driver instead of "ibmps".

Guenter

> +Author: Eddie James <eajames@us.ibm.com>
> +
> +Description
> +-----------
> +
> +This driver supports the IBM power supply. This driver is a client to the core
> +PMBus driver.
> +
> +Usage Notes
> +-----------
> +
> +This driver should auto-detect devices. In the event that it does not, you will
> +have to instantiate the devices explicitly. Please see
> +Documentation/i2c/instantiating-devices for details.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported:
> +
> +curr1_alarm		Output current over-current fault.
> +curr1_input		Measured output current in mA.
> +curr1_label		"iout1"
> +
> +fan1_alarm		Fan 1 warning.
> +fan1_fault		Fan 1 fault.
> +fan1_input		Fan 1 speed in RPM.
> +fan2_alarm		Fan 2 warning.
> +fan2_fault		Fan 2 fault.
> +fan2_input		Fan 2 speed in RPM.
> +
> +in1_alarm		Input voltage under-voltage fault.
> +in1_input		Measured input voltage in mV.
> +in1_label		"vin"
> +in2_alarm		Output voltage over-voltage fault.
> +in2_input		Measured output voltage in mV.
> +in2_label		"vout1"
> +
> +power1_input		Measured input power in uW.
> +power1_label		"pin"
> +
> +temp1_alarm		PSU inlet ambient temperature over-temperature fault.
> +temp1_input		Measured PSU inlet ambient temp in millidegrees C.
> +temp2_alarm		Secondary rectifier temp over-temperature fault.
> +temp2_input		Measured secondary rectifier temp in millidegrees C.
> +temp3_alarm		ORing FET temperature over-temperature fault.
> +temp3_input		Measured ORing FET temperature in millidegrees C.
> -- 
> 1.8.3.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
