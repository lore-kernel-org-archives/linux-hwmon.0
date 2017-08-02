Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47427 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751898AbdHBVRc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Aug 2017 17:17:32 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v72LE974099997
        for <linux-hwmon@vger.kernel.org>; Wed, 2 Aug 2017 17:17:31 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2c3g8htr3a-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Aug 2017 17:17:31 -0400
Received: from localhost
        by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 2 Aug 2017 15:17:30 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 4/4] Documentation: ABI: Add IBM power supply sysfs documentation
Date: Wed,  2 Aug 2017 16:17:13 -0500
In-Reply-To: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1501708633-2964-5-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/ABI/testing/sysfs-driver-ibmps | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-ibmps

diff --git a/Documentation/ABI/testing/sysfs-driver-ibmps b/Documentation/ABI/testing/sysfs-driver-ibmps
new file mode 100644
index 0000000..1645685
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-ibmps
@@ -0,0 +1,49 @@
+What:		/sys/bus/i2c/devices/<dev>/clear_faults
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Clears pmbus faults for this power supply.
+
+What:		/sys/bus/i2c/devices/<dev>/status_word
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_WORD register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_vout
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_VOUT register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_iout
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_IOUT register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_input
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_INPUT register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_temp
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_TEMPERATURE register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_cml
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_CML register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_other
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_OTHER register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_mfr
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_MFR_SPECIFIC register.
+
+What:		/sys/bus/i2c/devices/<dev>/status_fan
+KernelVersion:	4.13
+Contact:	eajames@us.ibm.com
+Description:	Displays the STATUS_FAN register.
-- 
1.8.3.1

