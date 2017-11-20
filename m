Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47752 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751895AbdKTXxx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Nov 2017 18:53:53 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAKNnNJw056168
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:53:53 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ec5ue8as4-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:53:52 -0500
Received: from localhost
        by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 20 Nov 2017 16:53:51 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 02/12] Documentation: ABI: Add occ-hwmon driver sysfs documentation
Date: Mon, 20 Nov 2017 17:53:31 -0600
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1511222021-562-3-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Detail the sysfs attributes provided by the occ-hwmon driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/ABI/testing/sysfs-driver-occ-hwmon | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon

diff --git a/Documentation/ABI/testing/sysfs-driver-occ-hwmon b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
new file mode 100644
index 0000000..8873cc3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
@@ -0,0 +1,85 @@
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_active
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC is in the "active" state.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_ot
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has limited the processor
+		frequency due to over-temperature.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_power
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has limited the processor
+		frequency due to power usage.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_error
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates any error condition
+		observed by the OCC or detected by the driver. Reading the
+		attribute will return an integer. A negative integer indicates
+		either an error response from the OCC or bus error or other
+		error condition detected by the driver. A "0" indicates no
+		error.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_master
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC is the "master" OCC.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_mem_throttle
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not the OCC has throttled memory due
+		to over-temperature.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occs_present
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates the number of OCCs present
+		on the system.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_quick_drop
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has asserted the "quick
+		power drop" signal.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_status
+Date:		November 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates the current OCC state. The
+		value of the attribute will be one of the following states:
+		0: Reserved
+		1: Standby
+		2: Observation
+		3: Active
+		4: Safe
+		5: Characterization
-- 
1.8.3.1

