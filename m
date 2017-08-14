Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56374 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752275AbdHNWhT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Aug 2017 18:37:19 -0400
Date: Mon, 14 Aug 2017 15:37:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: robh+dt@kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH v3 3/3] Documentation: hwmon: Document the IBM CFF power
 supply
Message-ID: <20170814223717.GA21561@roeck-us.net>
References: <1502724390-17411-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502724390-17411-4-git-send-email-eajames@linux.vnet.ibm.com>
 <20170814185308.GA11090@roeck-us.net>
 <0d016c77-4e3e-b9df-b131-604ab6f15e4c@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d016c77-4e3e-b9df-b131-604ab6f15e4c@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 14, 2017 at 02:26:20PM -0500, Eddie James wrote:
> 
> 
> On 08/14/2017 01:53 PM, Guenter Roeck wrote:
> >On Mon, Aug 14, 2017 at 10:26:30AM -0500, Eddie James wrote:
> >>From: "Edward A. James" <eajames@us.ibm.com>
> >>
> >>Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >>---
> >>  Documentation/hwmon/ibm-cffps | 54 +++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 54 insertions(+)
> >>  create mode 100644 Documentation/hwmon/ibm-cffps
> >>
> >>diff --git a/Documentation/hwmon/ibm-cffps b/Documentation/hwmon/ibm-cffps
> >>new file mode 100644
> >>index 0000000..e091ff2
> >>--- /dev/null
> >>+++ b/Documentation/hwmon/ibm-cffps
> >>@@ -0,0 +1,54 @@
> >>+Kernel driver ibm-cffps
> >>+=======================
> >>+
> >>+Supported chips:
> >>+  * IBM Common Form Factor power supply
> >>+
> >>+Author: Eddie James <eajames@us.ibm.com>
> >>+
> >>+Description
> >>+-----------
> >>+
> >>+This driver supports IBM Common Form Factor (CFF) power supplies. This driver
> >>+is a client to the core PMBus driver.
> >>+
> >>+Usage Notes
> >>+-----------
> >>+
> >>+This driver does not auto-detect devices. You will have to instantiate the
> >>+devices explicitly. Please see Documentation/i2c/instantiating-devices for
> >>+details.
> >>+
> >>+Sysfs entries
> >>+-------------
> >>+
> >>+The following attributes are supported:
> >>+
> >>+curr1_alarm		Output current over-current fault.
> >>+curr1_input		Measured output current in mA.
> >>+curr1_label		"iout1"
> >>+
> >>+fan1_alarm		Fan 1 warning.
> >>+fan1_fault		Fan 1 fault.
> >>+fan1_input		Fan 1 speed in RPM.
> >>+fan2_alarm		Fan 2 warning.
> >>+fan2_fault		Fan 2 fault.
> >>+fan2_input		Fan 2 speed in RPM.
> >>+
> >>+in1_alarm		Input voltage under-voltage fault.
> >Just noticed. Are you sure you mean 'fault' here and below ?
> >'alarm' attributes normally report an over- or under- condition,
> >but not a fault. Faults should be reported with 'fault' attributes.
> >In PMBus lingo (which doesn't distinguish a real 'fault' from
> >a critical over- or under- condition), the "FAULT" condition
> >usually maps with the 'crit_alarm' or 'lcrit_alarm' attributes.
> >Also, under-voltages would normally be reported as min_alarm
> >or clrit_alarm, not in_alarm.
> 
> Thanks, I better change this doc to "alarm." The spec reports all these as
> "faults" but many of them are merely over-temp or over-voltage, etc, and
> should be "alarm" to be consistent with PMBus.
> 
> The problem with this power supply is that it doesn't report any "limits."
> So unless I set up my read_byte function to return some limits, we can't get
> any lower or upper limits and therefore won't get the crit_alarm,
> lcrit_alarm, etc. Do you think I should "fake" the limits in the driver?
> 
Good question. Are the limits documented ? If yes, that would make sense.
I am quite sure that limits are word registers, though.

Guenter

> >
> >>+in1_input		Measured input voltage in mV.
> >>+in1_label		"vin"
> >>+in2_alarm		Output voltage over-voltage fault.
> >>+in2_input		Measured output voltage in mV.
> >>+in2_label		"vout1"
> >>+
> >>+power1_alarm		Input fault.
> >Another example; this maps to PMBUS_PIN_OP_WARN_LIMIT which is an
> >input power alarm, not an indication of a fault condition.
> 
> Hm, with my latest changes to look at the higher byte of STATUS_WORD, it
> looks like we now have the same name for both the pin generic alarm
> attribute and the pin_limit_attr... So in this device's case, it would map
> to PB_STATUS_INPUT bit of STATUS_WORD. Didn't think about that... any
> suggestions? Can't really change the name of the limit one without breaking
> people's code...
> 
> >
> >>+power1_input		Measured input power in uW.
> >>+power1_label		"pin"
> >>+
> >>+temp1_alarm		PSU inlet ambient temperature over-temperature fault.
> >>+temp1_input		Measured PSU inlet ambient temp in millidegrees C.
> >>+temp2_alarm		Secondary rectifier temp over-temperature fault.
> >Interestingly, PMBus does not distinguish between a critical temperature
> >alarm and an actual "fault". Makes me wonder if the IBM PS reports
> >CFFPS_MFR_THERMAL_FAULT if there is an actual fault (chip or sensor failure),
> >or if it has the same meaning as PB_TEMP_OT_FAULT, ie an excessively high
> >temperature.
> 
> Will change these to "alarm" in the doc too.
> 
> >
> >If it is a real fault (a detected sensor failure), we should possibly
> >consider adding a respective "virtual" temperature status flag. The same
> >is true for other status bits reported in the manufacturer status
> >register if any of those reflect a "real" fault, ie a chip failure.
> 
> Yea, that would probably be helpful. The CFFPS_MFR_THERMAL_FAULT bit is a
> fault (so the spec says), but I'm not sure what is triggering it.
> 
> Thanks,
> Eddie
> 
> >
> >>+temp2_input		Measured secondary rectifier temp in millidegrees C.
> >>+temp3_alarm		ORing FET temperature over-temperature fault.
> >>+temp3_input		Measured ORing FET temperature in millidegrees C.
> >>-- 
> >>1.8.3.1
> >>
> 
