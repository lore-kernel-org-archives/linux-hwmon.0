Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C113BC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Jan 2022 18:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234925AbiACSSm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Jan 2022 13:18:42 -0500
Received: from mail-sn1anam02on2071.outbound.protection.outlook.com ([40.107.96.71]:41675
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235437AbiACSSm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 Jan 2022 13:18:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZIQ+7/e0daZoguJ3/+PUf3dbqsfFaKXHlne/mVwFHBrYMuvYzeYelE8C6n4JpShbw29Gunz8Udf3uVwTcBaaceLbKLQ4YoIDVFYNFDpTxPOfGtnZ2GS7FyL8LCo2q3Vi36d/wUbETm0Mw0No80hlFKjyLJBYge3X3aZl+7UzjMYrgl9rwFUZVd+SJvlwlYs7VcRmJYgWeBgMbroHpRoahBfTMqTRcTzN95bBx7gnKI/y33CT1elK07eZjZ6O7OR333IOr7LztURPqDk89AipYk0JGU1RFRElDPRDpD1r/HHe/4ulp+YGvY0cDozdwRSRrsGjEZDM/enAY7EYEd4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhcUnRY7XGHeF1abNfN1nAlr0N0qNXevaTDUPkQssuA=;
 b=MeEiWp+iZqSPSYe5rJt6AOhU/L4d8i8TjIEj3hr2A9c+IXwI/H57RBaz4VYxBHEAh1Ibl0VLKOqRYHFi4VjJQvULkT4mQTlicLSME59i3Jhah2dO6AOgfvTNy2OJ0tLNsk5IS+LCu7KhTxwCMmDXbx2+NMsggOpKIAbIooHuzoqUsmFKjiMvBo+Rbo5Jq+pxISMGV8UpBM5HFmWFYoQOZONbveyfGknBVMoUckd6TKy8m1k5G9FOsfWbZrVfEmb/jAe85bRIvQXRH2ao8smQLReq34dZei14T20aHOHNnMoBTDtOushGBJ3ikseIN2CbEpwuUcG53saazJ+l1DLFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhcUnRY7XGHeF1abNfN1nAlr0N0qNXevaTDUPkQssuA=;
 b=NmCsUzQaExZrs+1XDa6LXweLOt6f987RLjY5IJsxzauHqJ6YtPajxLfnKxYEsa9hoRtXm+sHV2/sk/LkGTgf8qdnWA6F99VP6eHq48ErW98auUMuasRBEPU1X7vRCufkiBspjQm/cOT66wpuVEAc81ORbIVouT8Bofvei6z0Ti7+hbOUN+R886fMLX8f403ukZjNVGhH/rxUi09RsOvKK9nuAo15cfRDykuqWx2kHvjhKRjFA2hreMYuCZLQKRLvs73z9wJ/DBFOO0BOnN6ApDqGv2dU18jET2rHUGWDTct2kYk8pHACOaJZV5mkjG4Sm3s6c+JzvG6VHG0aptYbPQ==
Received: from DS7PR03CA0258.namprd03.prod.outlook.com (2603:10b6:5:3b3::23)
 by BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Mon, 3 Jan
 2022 18:18:38 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::84) by DS7PR03CA0258.outlook.office365.com
 (2603:10b6:5:3b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Mon, 3 Jan 2022 18:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4844.14 via Frontend Transport; Mon, 3 Jan 2022 18:18:38 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 3 Jan
 2022 18:18:37 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 3 Jan
 2022 18:18:36 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 3 Jan 2022 18:18:35 +0000
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 1/2] hwmon: powr1220: Upgrade driver to support hwmon info infrastructure
Date:   Mon, 3 Jan 2022 20:18:24 +0200
Message-ID: <20220103181825.313067-2-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20220103181825.313067-1-michaelsh@nvidia.com>
References: <20220103181825.313067-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd72ef85-08d8-495b-6172-08d9cee576a8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5176AFC6E2780BF482B07D09D4499@BL1PR12MB5176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rl10xm0Kd99+owaqpr2EGSjnpWNqgk5oF3iqm61LzjlnsJfxIfL+QkEwgWfnbDWlh0enRmo5WKnvR8YpHGtZfULJTC6aXHnjBh8BOJ6VGh+xFwr/HbBomFeuh8r/c+my5EawCFxa8w9qLEFWDDIHyzZALFO/hg666m7dg3r7lUouLvnGF6X4VkVyMMkTJR1YGfzE0RqJ6J9c+YNZko7AJXua0dcMumAHCBUkderNE+dAC8egQRwccGxPvKqf6QY6LdzWuq3g5i5wNRpLVXl0EdDLbxiEX8yoAcZJbRsQNL1XMrfkVKoQz+5kKsq7JmyTNWqBo2VDM1O0BII/7lNgl/FTss0qYOLFZsL6yyX/w9/OOBNL8OFvRbx46gilKUeXuu8t9zxMcy43k/Kb//zehoRC79TXMYjx7IFtMZSm7Yvy0S6yhLanykbGv42110vM95ZWjvRhDyg1Lsg0BsG2XdxRJGFfL6eAzm93kT0z2YRLmUJidRPbnnQdhU5AgwkzRl1SJWnNOmb8uif3KeuHnMUUcIoK2jMrvG0awvAc4eaUhZauzC1uLCL5pKBUovZwOQ9jFDUqmLH5BpQxvOC/I9tQnAUlr+lAw0sxT3xVknZxFigJL7bIBswFEDnSbltTX1FWTwBxEq1+WxtCGPhuS8cv/ti0x6Sa5t2cPylckqqYSMWKJtH1S9VqhCFKYrwgSOTi9V22em3KErd1qF7ahU/knWsgdcvY7rSbr413EvLE/gvSDAHfeivU+sUseThNS112Xp6jJhziitEH4qAdYYwnj6PG6RthGdDVxFzmrFO7s9EFxjZ+O7LlZEq4OabM
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(81166007)(4326008)(316002)(83380400001)(356005)(107886003)(36860700001)(2616005)(26005)(336012)(8936002)(5660300002)(2876002)(47076005)(86362001)(110136005)(40460700001)(30864003)(70206006)(6666004)(2906002)(186003)(426003)(82310400004)(36756003)(70586007)(6636002)(508600001)(1076003)(8676002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 18:18:38.1965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd72ef85-08d8-495b-6172-08d9cee576a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5176
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Reduce code by using devm_hwmon_device_register_with_groups() API by
devm_hwmon_device_register_with_info() API.
The motivation is to reduce code and to allow easy support for similar
devices by the same driver.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/powr1220.c | 216 +++++++++++++++++++++--------------------------
 1 file changed, 95 insertions(+), 121 deletions(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 9e086338dcba..1b833781e89d 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -111,7 +111,7 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->adc_last_updated[ch_num] + HZ) ||
-			!data->adc_valid[ch_num]) {
+	    !data->adc_valid[ch_num]) {
 		/*
 		 * figure out if we need to use the attenuator for
 		 * high inputs or inputs that we don't yet have a measurement
@@ -119,12 +119,12 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 		 * max reading.
 		 */
 		if (data->adc_maxes[ch_num] > ADC_MAX_LOW_MEASUREMENT_MV ||
-				data->adc_maxes[ch_num] == 0)
+		    data->adc_maxes[ch_num] == 0)
 			adc_range = 1 << 4;
 
 		/* set the attenuator and mux */
 		result = i2c_smbus_write_byte_data(data->client, ADC_MUX,
-				adc_range | ch_num);
+						   adc_range | ch_num);
 		if (result)
 			goto exit;
 
@@ -132,7 +132,7 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 		 * wait at least Tconvert time (200 us) for the
 		 * conversion to complete
 		 */
-		udelay(200);
+		usleep(200);
 
 		/* get the ADC reading */
 		result = i2c_smbus_read_byte_data(data->client, ADC_VALUE_LOW);
@@ -163,139 +163,112 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 
 exit:
 	mutex_unlock(&data->update_lock);
-
 	return result;
 }
 
-/* Shows the voltage associated with the specified ADC channel */
-static ssize_t powr1220_voltage_show(struct device *dev,
-				     struct device_attribute *dev_attr,
-				     char *buf)
+static umode_t
+powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
+		    attr, int channel)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	int adc_val = powr1220_read_adc(dev, attr->index);
-
-	if (adc_val < 0)
-		return adc_val;
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_highest:
+		case hwmon_in_label:
+			return 0444;
+		default:
+			break;
+		}
+
+	default:
+		break;
+	}
 
-	return sprintf(buf, "%d\n", adc_val);
+	return 0;
 }
 
-/* Shows the maximum setting associated with the specified ADC channel */
-static ssize_t powr1220_max_show(struct device *dev,
-				 struct device_attribute *dev_attr, char *buf)
+static int
+powr1220_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+		     int channel, const char **str)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct powr1220_data *data = dev_get_drvdata(dev);
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_label:
+			*str = input_names[channel];
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
 
-	return sprintf(buf, "%d\n", data->adc_maxes[attr->index]);
+	return -EOPNOTSUPP;
 }
 
-/* Shows the label associated with the specified ADC channel */
-static ssize_t powr1220_label_show(struct device *dev,
-				   struct device_attribute *dev_attr,
-				   char *buf)
+static int
+powr1220_read(struct device *dev, enum hwmon_sensor_types type, u32
+	      attr, int channel, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
+	struct powr1220_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			ret = powr1220_read_adc(dev, channel);
+			if (ret < 0)
+				return ret;
+			*val = ret;
+			break;
+		case hwmon_in_highest:
+			*val = data->adc_maxes[channel];
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
 
-	return sprintf(buf, "%s\n", input_names[attr->index]);
+	return 0;
 }
 
-static SENSOR_DEVICE_ATTR_RO(in0_input, powr1220_voltage, VMON1);
-static SENSOR_DEVICE_ATTR_RO(in1_input, powr1220_voltage, VMON2);
-static SENSOR_DEVICE_ATTR_RO(in2_input, powr1220_voltage, VMON3);
-static SENSOR_DEVICE_ATTR_RO(in3_input, powr1220_voltage, VMON4);
-static SENSOR_DEVICE_ATTR_RO(in4_input, powr1220_voltage, VMON5);
-static SENSOR_DEVICE_ATTR_RO(in5_input, powr1220_voltage, VMON6);
-static SENSOR_DEVICE_ATTR_RO(in6_input, powr1220_voltage, VMON7);
-static SENSOR_DEVICE_ATTR_RO(in7_input, powr1220_voltage, VMON8);
-static SENSOR_DEVICE_ATTR_RO(in8_input, powr1220_voltage, VMON9);
-static SENSOR_DEVICE_ATTR_RO(in9_input, powr1220_voltage, VMON10);
-static SENSOR_DEVICE_ATTR_RO(in10_input, powr1220_voltage, VMON11);
-static SENSOR_DEVICE_ATTR_RO(in11_input, powr1220_voltage, VMON12);
-static SENSOR_DEVICE_ATTR_RO(in12_input, powr1220_voltage, VCCA);
-static SENSOR_DEVICE_ATTR_RO(in13_input, powr1220_voltage, VCCINP);
-
-static SENSOR_DEVICE_ATTR_RO(in0_highest, powr1220_max, VMON1);
-static SENSOR_DEVICE_ATTR_RO(in1_highest, powr1220_max, VMON2);
-static SENSOR_DEVICE_ATTR_RO(in2_highest, powr1220_max, VMON3);
-static SENSOR_DEVICE_ATTR_RO(in3_highest, powr1220_max, VMON4);
-static SENSOR_DEVICE_ATTR_RO(in4_highest, powr1220_max, VMON5);
-static SENSOR_DEVICE_ATTR_RO(in5_highest, powr1220_max, VMON6);
-static SENSOR_DEVICE_ATTR_RO(in6_highest, powr1220_max, VMON7);
-static SENSOR_DEVICE_ATTR_RO(in7_highest, powr1220_max, VMON8);
-static SENSOR_DEVICE_ATTR_RO(in8_highest, powr1220_max, VMON9);
-static SENSOR_DEVICE_ATTR_RO(in9_highest, powr1220_max, VMON10);
-static SENSOR_DEVICE_ATTR_RO(in10_highest, powr1220_max, VMON11);
-static SENSOR_DEVICE_ATTR_RO(in11_highest, powr1220_max, VMON12);
-static SENSOR_DEVICE_ATTR_RO(in12_highest, powr1220_max, VCCA);
-static SENSOR_DEVICE_ATTR_RO(in13_highest, powr1220_max, VCCINP);
-
-static SENSOR_DEVICE_ATTR_RO(in0_label, powr1220_label, VMON1);
-static SENSOR_DEVICE_ATTR_RO(in1_label, powr1220_label, VMON2);
-static SENSOR_DEVICE_ATTR_RO(in2_label, powr1220_label, VMON3);
-static SENSOR_DEVICE_ATTR_RO(in3_label, powr1220_label, VMON4);
-static SENSOR_DEVICE_ATTR_RO(in4_label, powr1220_label, VMON5);
-static SENSOR_DEVICE_ATTR_RO(in5_label, powr1220_label, VMON6);
-static SENSOR_DEVICE_ATTR_RO(in6_label, powr1220_label, VMON7);
-static SENSOR_DEVICE_ATTR_RO(in7_label, powr1220_label, VMON8);
-static SENSOR_DEVICE_ATTR_RO(in8_label, powr1220_label, VMON9);
-static SENSOR_DEVICE_ATTR_RO(in9_label, powr1220_label, VMON10);
-static SENSOR_DEVICE_ATTR_RO(in10_label, powr1220_label, VMON11);
-static SENSOR_DEVICE_ATTR_RO(in11_label, powr1220_label, VMON12);
-static SENSOR_DEVICE_ATTR_RO(in12_label, powr1220_label, VCCA);
-static SENSOR_DEVICE_ATTR_RO(in13_label, powr1220_label, VCCINP);
-
-static struct attribute *powr1220_attrs[] = {
-	&sensor_dev_attr_in0_input.dev_attr.attr,
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in6_input.dev_attr.attr,
-	&sensor_dev_attr_in7_input.dev_attr.attr,
-	&sensor_dev_attr_in8_input.dev_attr.attr,
-	&sensor_dev_attr_in9_input.dev_attr.attr,
-	&sensor_dev_attr_in10_input.dev_attr.attr,
-	&sensor_dev_attr_in11_input.dev_attr.attr,
-	&sensor_dev_attr_in12_input.dev_attr.attr,
-	&sensor_dev_attr_in13_input.dev_attr.attr,
-
-	&sensor_dev_attr_in0_highest.dev_attr.attr,
-	&sensor_dev_attr_in1_highest.dev_attr.attr,
-	&sensor_dev_attr_in2_highest.dev_attr.attr,
-	&sensor_dev_attr_in3_highest.dev_attr.attr,
-	&sensor_dev_attr_in4_highest.dev_attr.attr,
-	&sensor_dev_attr_in5_highest.dev_attr.attr,
-	&sensor_dev_attr_in6_highest.dev_attr.attr,
-	&sensor_dev_attr_in7_highest.dev_attr.attr,
-	&sensor_dev_attr_in8_highest.dev_attr.attr,
-	&sensor_dev_attr_in9_highest.dev_attr.attr,
-	&sensor_dev_attr_in10_highest.dev_attr.attr,
-	&sensor_dev_attr_in11_highest.dev_attr.attr,
-	&sensor_dev_attr_in12_highest.dev_attr.attr,
-	&sensor_dev_attr_in13_highest.dev_attr.attr,
-
-	&sensor_dev_attr_in0_label.dev_attr.attr,
-	&sensor_dev_attr_in1_label.dev_attr.attr,
-	&sensor_dev_attr_in2_label.dev_attr.attr,
-	&sensor_dev_attr_in3_label.dev_attr.attr,
-	&sensor_dev_attr_in4_label.dev_attr.attr,
-	&sensor_dev_attr_in5_label.dev_attr.attr,
-	&sensor_dev_attr_in6_label.dev_attr.attr,
-	&sensor_dev_attr_in7_label.dev_attr.attr,
-	&sensor_dev_attr_in8_label.dev_attr.attr,
-	&sensor_dev_attr_in9_label.dev_attr.attr,
-	&sensor_dev_attr_in10_label.dev_attr.attr,
-	&sensor_dev_attr_in11_label.dev_attr.attr,
-	&sensor_dev_attr_in12_label.dev_attr.attr,
-	&sensor_dev_attr_in13_label.dev_attr.attr,
+static const struct hwmon_channel_info *powr1220_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL),
 
 	NULL
 };
 
-ATTRIBUTE_GROUPS(powr1220);
+static const struct hwmon_ops powr1220_hwmon_ops = {
+	.read = powr1220_read,
+	.read_string = powr1220_read_string,
+	.is_visible = powr1220_is_visible,
+};
+
+static const struct hwmon_chip_info powr1220_chip_info = {
+	.ops = &powr1220_hwmon_ops,
+	.info = powr1220_info,
+};
 
 static int powr1220_probe(struct i2c_client *client)
 {
@@ -312,9 +285,10 @@ static int powr1220_probe(struct i2c_client *client)
 	mutex_init(&data->update_lock);
 	data->client = client;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
-			client->name, data, powr1220_groups);
-
+	hwmon_dev = devm_hwmon_device_register_with_info(&client->dev,
+							 client->name, data,
+							 &powr1220_chip_info,
+							 NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.14.1

