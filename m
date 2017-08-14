Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35944 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750771AbdHNSxL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Aug 2017 14:53:11 -0400
Date: Mon, 14 Aug 2017 11:53:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: robh+dt@kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH v3 3/3] Documentation: hwmon: Document the IBM CFF power
 supply
Message-ID: <20170814185308.GA11090@roeck-us.net>
References: <1502724390-17411-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502724390-17411-4-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502724390-17411-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 14, 2017 at 10:26:30AM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  Documentation/hwmon/ibm-cffps | 54 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/hwmon/ibm-cffps
> 
> diff --git a/Documentation/hwmon/ibm-cffps b/Documentation/hwmon/ibm-cffps
> new file mode 100644
> index 0000000..e091ff2
> --- /dev/null
> +++ b/Documentation/hwmon/ibm-cffps
> @@ -0,0 +1,54 @@
> +Kernel driver ibm-cffps
> +=======================
> +
> +Supported chips:
> +  * IBM Common Form Factor power supply
> +
> +Author: Eddie James <eajames@us.ibm.com>
> +
> +Description
> +-----------
> +
> +This driver supports IBM Common Form Factor (CFF) power supplies. This driver
> +is a client to the core PMBus driver.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +details.
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

Just noticed. Are you sure you mean 'fault' here and below ?
'alarm' attributes normally report an over- or under- condition,
but not a fault. Faults should be reported with 'fault' attributes.
In PMBus lingo (which doesn't distinguish a real 'fault' from
a critical over- or under- condition), the "FAULT" condition
usually maps with the 'crit_alarm' or 'lcrit_alarm' attributes.
Also, under-voltages would normally be reported as min_alarm
or clrit_alarm, not in_alarm.

> +in1_input		Measured input voltage in mV.
> +in1_label		"vin"
> +in2_alarm		Output voltage over-voltage fault.
> +in2_input		Measured output voltage in mV.
> +in2_label		"vout1"
> +
> +power1_alarm		Input fault.

Another example; this maps to PMBUS_PIN_OP_WARN_LIMIT which is an
input power alarm, not an indication of a fault condition.

> +power1_input		Measured input power in uW.
> +power1_label		"pin"
> +
> +temp1_alarm		PSU inlet ambient temperature over-temperature fault.
> +temp1_input		Measured PSU inlet ambient temp in millidegrees C.
> +temp2_alarm		Secondary rectifier temp over-temperature fault.

Interestingly, PMBus does not distinguish between a critical temperature
alarm and an actual "fault". Makes me wonder if the IBM PS reports
CFFPS_MFR_THERMAL_FAULT if there is an actual fault (chip or sensor failure),
or if it has the same meaning as PB_TEMP_OT_FAULT, ie an excessively high
temperature.

If it is a real fault (a detected sensor failure), we should possibly
consider adding a respective "virtual" temperature status flag. The same
is true for other status bits reported in the manufacturer status
register if any of those reflect a "real" fault, ie a chip failure.

> +temp2_input		Measured secondary rectifier temp in millidegrees C.
> +temp3_alarm		ORing FET temperature over-temperature fault.
> +temp3_input		Measured ORing FET temperature in millidegrees C.
> -- 
> 1.8.3.1
> 
