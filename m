Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58235 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753494AbdHJWUF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 18:20:05 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7AMJZ7o022898
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 18:20:05 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2c8yxbgpfw-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 18:20:04 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 10 Aug 2017 18:20:03 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: robh+dt@kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        joel@jms.id.au, jk@ozlabs.org, andrew@aj.id.au,
        eajames@linux.vnet.ibm.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 3/3] Documentation: hwmon: Add POWER system power supply documentation
Date: Thu, 10 Aug 2017 17:19:46 -0500
In-Reply-To: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502403586-20549-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/hwmon/powerps | 54 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/hwmon/powerps

diff --git a/Documentation/hwmon/powerps b/Documentation/hwmon/powerps
new file mode 100644
index 0000000..a4fbe92
--- /dev/null
+++ b/Documentation/hwmon/powerps
@@ -0,0 +1,54 @@
+Kernel driver powerps
+=====================
+
+Supported chips:
+  * POWER system power supply
+
+Author: Eddie James <eajames@us.ibm.com>
+
+Description
+-----------
+
+This driver supports POWER system power supplies. This driver is a client
+to the core PMBus driver.
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
+power1_alarm		Input fault.
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

