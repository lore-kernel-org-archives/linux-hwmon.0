Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DB6C07E9C
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07F6A61469
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhGHMCY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jul 2021 08:02:24 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:2354 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231397AbhGHMCX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:23 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 168BteFn005563;
        Thu, 8 Jul 2021 07:58:37 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 39mehm2qju-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jul 2021 07:58:37 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 168BwaMX042553
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 8 Jul 2021 07:58:36 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5;
 Thu, 8 Jul 2021 07:58:35 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5;
 Thu, 8 Jul 2021 07:58:35 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.858.5 via Frontend
 Transport; Thu, 8 Jul 2021 07:58:35 -0400
Received: from nsa.ad.analog.com ([10.44.3.58])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 168BwPtt020146;
        Thu, 8 Jul 2021 07:58:34 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        "Jean Delvare" <jdelvare@suse.com>
Subject: [RFC PATCH 6/6] hwmon: axi-fan-control: support temperature vs pwm points
Date:   Thu, 8 Jul 2021 14:01:11 +0200
Message-ID: <20210708120111.519444-7-nuno.sa@analog.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708120111.519444-1-nuno.sa@analog.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 9IbDYt3Okw1I8wB2WXlxaUUBMsXkCydU
X-Proofpoint-GUID: 9IbDYt3Okw1I8wB2WXlxaUUBMsXkCydU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-08_06:2021-07-08,2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080067
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The HW has some predefined points where it will associate a PWM value.
However some users might want to better set these points to their
usecases. This patch exposes these points as pwm auto_points:

 * pwm1_auto_point1_temp: temperature threshold below which PWM should be
   0%;
 * pwm1_auto_point2_temp: temperature threshold above which PWM should be
   25%;
 * pwm1_auto_point3_temp: temperature threshold below which PWM should be
   25%;
 * pwm1_auto_point4_temp: temperature threshold above which PWM should be
   50%;
 * pwm1_auto_point5_temp: temperature threshold below which PWM should be
   50%;
 * pwm1_auto_point6_temp: temperature threshold above which PWM should be
   75%;
 * pwm1_auto_point7_temp: temperature threshold below which PWM should be
   75%;
 * pwm1_auto_point8_temp: temperature threshold above which PWM should be
   100%;

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/axi-fan-control.c | 74 ++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index 59c9babb3850..80b216448f47 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/fpga/adi-axi-common.h>
 #include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -31,6 +32,14 @@
 #define ADI_REG_TACH_50_TOL	0x0154
 #define ADI_REG_TACH_75_TOL	0x0158
 #define ADI_REG_TACH_100_TOL	0x015c
+#define ADI_REG_TEMP_00_H	0x0100
+#define ADI_REG_TEMP_25_L	0x0104
+#define ADI_REG_TEMP_25_H	0x0108
+#define ADI_REG_TEMP_50_L	0x010c
+#define ADI_REG_TEMP_50_H	0x0110
+#define ADI_REG_TEMP_75_L	0x0114
+#define ADI_REG_TEMP_75_H	0x0118
+#define ADI_REG_TEMP_100_L	0x011c
 
 #define ADI_REG_IRQ_MASK	0x0040
 #define ADI_REG_IRQ_PENDING	0x0044
@@ -70,6 +79,39 @@ static inline u32 axi_ioread(const u32 reg,
 	return ioread32(ctl->base + reg);
 }
 
+/*
+ * The core calculates the temperature as:
+ *	T = /raw * 509.3140064 / 65535) - 280.2308787
+ */
+static ssize_t axi_fan_control_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	u32 temp = axi_ioread(attr->index, ctl);
+
+	temp = DIV_ROUND_CLOSEST_ULL(temp * 509314ULL, 65535) - 280230;
+
+	return sprintf(buf, "%u\n", temp);
+}
+
+static ssize_t axi_fan_control_store(struct device *dev, struct device_attribute *da,
+				     const char *buf, size_t count)
+{
+	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	u32 temp;
+	int ret;
+
+	ret = kstrtou32(buf, 10, &temp);
+	if (ret)
+		return ret;
+
+	temp = DIV_ROUND_CLOSEST_ULL((temp + 280230) * 65535ULL, 509314);
+	axi_iowrite(temp, attr->index, ctl);
+
+	return count;
+}
+
 static long axi_fan_control_get_pwm_duty(const struct axi_fan_control_data *ctl)
 {
 	u32 pwm_width = axi_ioread(ADI_REG_PWM_WIDTH, ctl);
@@ -418,6 +460,36 @@ static const struct hwmon_chip_info axi_chip_info = {
 	.info = axi_fan_control_info,
 };
 
+/* temperature threshold below which PWM should be 0% */
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_temp, axi_fan_control, ADI_REG_TEMP_00_H);
+/* temperature threshold above which PWM should be 25% */
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point2_temp, axi_fan_control, ADI_REG_TEMP_25_L);
+/* temperature threshold below which PWM should be 25% */
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point3_temp, axi_fan_control, ADI_REG_TEMP_25_H);
+/* temperature threshold above which PWM should be 50% */
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point4_temp, axi_fan_control, ADI_REG_TEMP_50_L);
+/* temperature threshold below which PWM should be 50% */
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point5_temp, axi_fan_control, ADI_REG_TEMP_50_H);
+/* temperature threshold above which PWM should be 75% */
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point6_temp, axi_fan_control, ADI_REG_TEMP_75_L);
+/* temperature threshold below which PWM should be 75% */
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point7_temp, axi_fan_control, ADI_REG_TEMP_75_H);
+/* temperature threshold above which PWM should be 100% */
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point8_temp, axi_fan_control, ADI_REG_TEMP_100_L);
+
+static struct attribute *axi_fan_control_attrs[] = {
+	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(axi_fan_control);
+
 static const u32 version_1_0_0 = ADI_AXI_PCORE_VER(1, 0, 'a');
 
 static const struct of_device_id axi_fan_control_of_match[] = {
@@ -502,7 +574,7 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 							 name,
 							 ctl,
 							 &axi_chip_info,
-							 NULL);
+							 axi_fan_control_groups);
 
 	return PTR_ERR_OR_ZERO(ctl->hdev);
 }
-- 
2.32.0

