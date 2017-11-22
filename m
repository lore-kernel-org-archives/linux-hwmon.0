Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:46792 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751259AbdKVPPM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Nov 2017 10:15:12 -0500
Date: Wed, 22 Nov 2017 07:15:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [v3, 02/12] Documentation: ABI: Add occ-hwmon driver sysfs
 documentation
Message-ID: <20171122151510.GA11174@roeck-us.net>
References: <1511222021-562-3-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511222021-562-3-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 20, 2017 at 05:53:31PM -0600, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Detail the sysfs attributes provided by the occ-hwmon driver.
> 

This describes my problem with this driver: All the sysfs attributes
described here are not really hardware monitoring related. A later patch
describes this in more detail:

"The OCC can provide the raw sensor data as well as perform thermal
 and power management on the system."

Is it possible to extract the non-hwmon functionality (maybe into an
mfd driver) and limit the hwmon part to just hardware monitoring ?

Guenter


> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-occ-hwmon | 85 ++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-occ-hwmon b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
> new file mode 100644
> index 0000000..8873cc3
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
> @@ -0,0 +1,85 @@
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_active
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates (with a "1" or a "0",
> +		respectively) whether or not this OCC is in the "active" state.
> +
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_ot
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates (with a "1" or a "0",
> +		respectively) whether or not this OCC has limited the processor
> +		frequency due to over-temperature.
> +
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_power
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates (with a "1" or a "0",
> +		respectively) whether or not this OCC has limited the processor
> +		frequency due to power usage.
> +
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_error
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates any error condition
> +		observed by the OCC or detected by the driver. Reading the
> +		attribute will return an integer. A negative integer indicates
> +		either an error response from the OCC or bus error or other
> +		error condition detected by the driver. A "0" indicates no
> +		error.
> +
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_master
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates (with a "1" or a "0",
> +		respectively) whether or not this OCC is the "master" OCC.
> +
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_mem_throttle
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates (with a "1" or a "0",
> +		respectively) whether or not the OCC has throttled memory due
> +		to over-temperature.
> +
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occs_present
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates the number of OCCs present
> +		on the system.
> +
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_quick_drop
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates (with a "1" or a "0",
> +		respectively) whether or not this OCC has asserted the "quick
> +		power drop" signal.
> +
> +What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_status
> +Date:		November 2017
> +KernelVersion:	4.14
> +Contact:	eajames@us.ibm.com
> +Description:
> +		A read-only attribute that indicates the current OCC state. The
> +		value of the attribute will be one of the following states:
> +		0: Reserved
> +		1: Standby
> +		2: Observation
> +		3: Active
> +		4: Safe
> +		5: Characterization
