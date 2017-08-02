Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56301 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751083AbdHBVR3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Aug 2017 17:17:29 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v72LE9kA163558
        for <linux-hwmon@vger.kernel.org>; Wed, 2 Aug 2017 17:17:28 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2c3fxx3f0x-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Aug 2017 17:17:28 -0400
Received: from localhost
        by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 2 Aug 2017 15:17:28 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 3/4] Documentation: hwmon: Add IBM power supply documentation
Date: Wed,  2 Aug 2017 16:17:12 -0500
In-Reply-To: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1501708633-2964-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/hwmon/ibmps | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/hwmon/ibmps

diff --git a/Documentation/hwmon/ibmps b/Documentation/hwmon/ibmps
new file mode 100644
index 0000000..7f13fd4
--- /dev/null
+++ b/Documentation/hwmon/ibmps
@@ -0,0 +1,53 @@
+Kernel driver ibmps
+====================
+
+Supported chips:
+  * IBM Witherspoon power supply
+
+Author: Eddie James <eajames@us.ibm.com>
+
+Description
+-----------
+
+This driver supports the IBM power supply. This driver is a client to the core
+PMBus driver.
+
+Usage Notes
+-----------
+
+This driver should auto-detect devices. In the event that it does not, you will
+have to instantiate the devices explicitly. Please see
+Documentation/i2c/instantiating-devices for details.
+
+Sysfs entries
+-------------
+
+The following attributes are supported:
+
+curr1_alarm		Output current over-current fault.
+curr1_input		Measured output current in mA.
+curr1_label		"iout1"
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+fan2_alarm		Fan 2 warning.
+fan2_fault		Fan 2 fault.
+fan2_input		Fan 2 speed in RPM.
+
+in1_alarm		Input voltage under-voltage fault.
+in1_input		Measured input voltage in mV.
+in1_label		"vin"
+in2_alarm		Output voltage over-voltage fault.
+in2_input		Measured output voltage in mV.
+in2_label		"vout1"
+
+power1_input		Measured input power in uW.
+power1_label		"pin"
+
+temp1_alarm		PSU inlet ambient temperature over-temperature fault.
+temp1_input		Measured PSU inlet ambient temp in millidegrees C.
+temp2_alarm		Secondary rectifier temp over-temperature fault.
+temp2_input		Measured secondary rectifier temp in millidegrees C.
+temp3_alarm		ORing FET temperature over-temperature fault.
+temp3_input		Measured ORing FET temperature in millidegrees C.
-- 
1.8.3.1

