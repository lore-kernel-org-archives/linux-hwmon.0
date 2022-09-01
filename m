Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0208EECAAD1
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 14:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbiIAOVD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 10:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbiIAOVC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 10:21:02 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA233422FE
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Sep 2022 07:21:00 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281ClT4I014706;
        Thu, 1 Sep 2022 08:59:40 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3japt62bhq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Sep 2022 08:59:40 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 281CxdbB035916
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Sep 2022 08:59:39 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 1 Sep 2022 08:59:38 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 1 Sep 2022 08:59:38 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 1 Sep 2022 08:59:38 -0400
Received: from IST-LT-39247.mshome.net ([10.158.19.28])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 281CxFxK012333;
        Thu, 1 Sep 2022 08:59:28 -0400
From:   Ibrahim Tilki <Ibrahim.Tilki@analog.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        <linux-hwmon@vger.kernel.org>
Subject: [PATCH v5 2/4] docs: hwmon: add max31760 documentation
Date:   Thu, 1 Sep 2022 15:59:04 +0300
Message-ID: <20220901125906.929-3-Ibrahim.Tilki@analog.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901125906.929-1-Ibrahim.Tilki@analog.com>
References: <20220901125906.929-1-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: UlaCSEcUJOfeGQcq3ZCQUaDBkcP1frHF
X-Proofpoint-ORIG-GUID: UlaCSEcUJOfeGQcq3ZCQUaDBkcP1frHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010059
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adding documentation for max31760 fan speed controller

Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
---
 Documentation/hwmon/max31760.rst | 67 ++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/hwmon/max31760.rst

diff --git a/Documentation/hwmon/max31760.rst b/Documentation/hwmon/max31760.rst
new file mode 100644
index 000000000..fd67c1318
--- /dev/null
+++ b/Documentation/hwmon/max31760.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver max31760
+======================
+
+Supported chips:
+  * Analog Devices MAX31760
+
+    Prefix: 'max31760'
+
+    Addresses scanned: none
+
+    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31760.pdf
+
+
+Author: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
+
+Description
+-----------
+
+MAX31760 is a precision fan speed controller with nonvolatile lookup table.
+Device has one internal and one external temperature sensor support.
+Controls two fans and measures their speeds.
+Generates hardware alerts when programmable max and critical temperatures are exceeded.
+Supports direct and temperature based automatic fan control.
+
+Temperature measurement range: from -55°C to 125°C
+
+Temperature Resolution: 11 Bits, ±0.125°C
+
+Please refer how to instantiate this driver: Documentation/i2c/instantiating-devices.rst
+
+Lookup table for auto fan control
+---------------------------------
+
+========= =================================
+LUT Index Name
+========= =================================
+1         PWM value for T < +18°C
+2         PWM value for +18°C ≤ T < +20°C
+3         PWM value for +20°C ≤ T < +22°C
+...       ...
+47        PWM value for +108°C ≤ T < +110°C
+48        PWM value for T ≥ +110°C
+========= =================================
+
+Sysfs entries
+-------------
+
+=============================== =================================================================================
+fan[1-2]_input                  Fan speed (in RPM)
+fan[1-2]_enable                 Enable fan readings and fan fault alarms
+fan[1-2]_fault                  Fan fault status
+temp[1-2]_label                 "Remote" and "Local" temperature channel labels
+temp[1-2]_input                 Temperature sensor readings (in millidegrees Celsius)
+temp1_fault                     Remote temperature sensor fault status
+temp[1-2]_max                   Temperature max value. Asserts "ALERT" pin when exceeded
+temp[1-2]_max_alarm             Temperature max alarm status
+temp[1-2]_crit                  Temperature critical value. Asserts "SHDN" pin when exceeded
+temp[1-2]_crit_alarm            Temperature critical alarm status
+pwm1                            PWM value for direct fan control
+pwm1_enable                     1: direct fan control, 2: temperature based auto fan control
+pwm1_freq                       PWM frequency in hertz
+pwm1_auto_channels_temp         Temperature source for auto fan control. 1: temp1, 2: temp2, 3: max(temp1, temp2)
+pwm1_auto_point[1-48]_pwm       PWM value for LUT point
+pwm1_auto_point_temp_hyst       Temperature hysteresis for auto fan control. Can be either 2000mC or 4000mC
+=============================== =================================================================================
-- 
2.36.1

