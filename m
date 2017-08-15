Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45204 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752971AbdHOUwv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Aug 2017 16:52:51 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7FKmdgZ105031
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Aug 2017 16:52:50 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2cc6f94xdd-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Aug 2017 16:52:50 -0400
Received: from localhost
        by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 15 Aug 2017 14:52:49 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, corbet@lwn.net,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v4 3/3] Documentation: hwmon: Document the IBM CFF power supply
Date: Tue, 15 Aug 2017 15:52:35 -0500
In-Reply-To: <1502830355-502-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502830355-502-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502830355-502-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/hwmon/ibm-cffps | 54 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/hwmon/ibm-cffps

diff --git a/Documentation/hwmon/ibm-cffps b/Documentation/hwmon/ibm-cffps
new file mode 100644
index 0000000..e05ecd8
--- /dev/null
+++ b/Documentation/hwmon/ibm-cffps
@@ -0,0 +1,54 @@
+Kernel driver ibm-cffps
+=======================
+
+Supported chips:
+  * IBM Common Form Factor power supply
+
+Author: Eddie James <eajames@us.ibm.com>
+
+Description
+-----------
+
+This driver supports IBM Common Form Factor (CFF) power supplies. This driver
+is a client to the core PMBus driver.
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices for
+details.
+
+Sysfs entries
+-------------
+
+The following attributes are supported:
+
+curr1_alarm		Output current over-current alarm.
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
+in1_alarm		Input voltage under-voltage alarm.
+in1_input		Measured input voltage in mV.
+in1_label		"vin"
+in2_alarm		Output voltage over-voltage alarm.
+in2_input		Measured output voltage in mV.
+in2_label		"vout1"
+
+power1_alarm		Input fault or alarm.
+power1_input		Measured input power in uW.
+power1_label		"pin"
+
+temp1_alarm		PSU inlet ambient temperature over-temperature alarm.
+temp1_input		Measured PSU inlet ambient temp in millidegrees C.
+temp2_alarm		Secondary rectifier temp over-temperature alarm.
+temp2_input		Measured secondary rectifier temp in millidegrees C.
+temp3_alarm		ORing FET temperature over-temperature alarm.
+temp3_input		Measured ORing FET temperature in millidegrees C.
-- 
1.8.3.1

