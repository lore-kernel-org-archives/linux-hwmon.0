Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5541FC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 17:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344605AbiAKRdl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:33:41 -0500
Received: from mail-mw2nam12on2087.outbound.protection.outlook.com ([40.107.244.87]:32320
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344646AbiAKRdH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 12:33:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFu+MNNdJi5k5M2ZXS4AL2SNerG1xRIix1pd4lg76ySYpOaI1PeU0jL7Uc76bJbdFiJPeHrDNo8p8zNvIhCAzdfwqiru+AirCPYqznbKCAQ8VbM6j/PIEQrMlJL+/m+6AsJx0kp+T5lf2ulUgrKqsO+/QwxQptMhp5YjcmaYuXkl5dH5C6yEIh+HWFuDRM1tEeh1znW8MxSfj+GENXh3VFBa3EqcUFg50EppvIRSI1CR+slYiYeSxN2uosQ1htZPjgqR52yNIkzA+IXiWu3FqeTFOoHYqDvU2FeSnTqLdZJ1O6cp6E7SBLhoaSMV0c922SnBpbtpORyiM4zo2kotBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhcUnRY7XGHeF1abNfN1nAlr0N0qNXevaTDUPkQssuA=;
 b=dTZ/fRNjVtIRKLWfPYcXxs+QW10xyg9n0YJRaFt/xYFneb4RUMtx3pXdrf/r/wcAtbrKd7P7E1R0enWylXfE6PSHsZ16n0L1MnCICL5Vy/b7PjZS68q0rGcHMuZhDaPMElJtjcT4ZiCRSj1xPE0MRzEontk9EwMUT2CYXTjPPBS9a6qQ8OdjW3S72pKDXhGKfvwrolBEUB795xWIZCug19IhqbxIRNvHida7vO4BfQNkwIHjyER7TXATpn2XmvpWel5XBkuvRSZPn9AKTouySfoa9ib83Qe3rBxIaqcpQVkUGgQb7iNLGLqyYjuggXwUt07rmC80+OZSDPFXfzTQpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhcUnRY7XGHeF1abNfN1nAlr0N0qNXevaTDUPkQssuA=;
 b=DszBn1Zj1rRYbF4BAE64kT29dV9rG4FP2bl2d+GrDCl26KCJhX5kj7tL9/TYVj0asr+BnqgfC96lmNjAtZkcpMRUQG/6wYNAnHmxsMADAQba11vPpFj98dYy5YSp3r5GnZagUf9YSpkbeOciOFrrCo+vDrdbpRN5L17VNxC5lQmEQTLVqTZUekSyTcGx4ATle5MfpxkyVVmFIsZB7LNX3eaIYmhebj5YM+UXxOrUovBmbzofuBWRxKaQVjwxuK9NLs1S3NwGyz0cl0mv3moDFZPDIG7Q8thXypoRb57VOTi5Smq8SpwdDCzLYTxBpRcWQbSB1JvF7517c1tkp4sdmQ==
Received: from BN9PR03CA0064.namprd03.prod.outlook.com (2603:10b6:408:fc::9)
 by MWHPR12MB1488.namprd12.prod.outlook.com (2603:10b6:301:f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 17:33:05 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::61) by BN9PR03CA0064.outlook.office365.com
 (2603:10b6:408:fc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Tue, 11 Jan 2022 17:33:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4867.7 via Frontend Transport; Tue, 11 Jan 2022 17:33:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 11 Jan
 2022 17:33:04 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9;
 Tue, 11 Jan 2022 09:33:02 -0800
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v2 1/2] hwmon: powr1220: Upgrade driver to support hwmon info infrastructure
Date:   Tue, 11 Jan 2022 19:32:38 +0200
Message-ID: <20220111173239.21006-2-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220111173239.21006-1-michaelsh@nvidia.com>
References: <20220111173239.21006-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3884dd67-5309-4f4e-9b06-08d9d5286d27
X-MS-TrafficTypeDiagnostic: MWHPR12MB1488:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB14887698D42FA2977BA5F472D4519@MWHPR12MB1488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bgautIKhK35838aWdyF2BFA4TXCRCI17dFRfjPWSByRIIkxOzl/J3E6ZR/CVbXx4W1jpm+g3sq9RHdDsD6pecvhUukfnefilETXjp5YSCPrvoM2vx5Na0xKhhUAvIAEJaSdrX30O8vHUImSUzq0SfbJE2Ouhs+dZ5471eKZ7QIMaaTMGigjhWE+9zTe4dhJoObhDtHovLks6YJrMpsma6ktulxX5L/vKZFhqOSVqmWmubNqaZRKvkAtxNLY21lRm/OUHVHq9/xdXIQRXAScj1o22j19cdFovLK7FfnoI+Aq0Zh6jHI2ZBGVjjx0+QqXlLgMK8jdlCdaEqv8gPYuYO+ibjMZRjstznELe3IldIs1V3xjTBG/wNbeDgWSYGEb1Nt+PXdJXiF0H58FtIQlsQhBh7CxXF/pMhLFSWjV2/XEFFj7Bp2PtT1dqvrfT/+pmUO2rGDYzdKCAt82b6QJhIbyJaikdwaoqoyR8BrCDlP3cfJEAUatm+j8ct5qf2uWqt7/Ght0ZshE67HM+82VR46TOoCE8H8l1QN2zdj8xIAZs5enUhaT5I6SjNJ3vCaCL9ETosUDNsHQb+Temkcj0GlkQIbesrBECE7+K9IMMttkzzZaJmjFBuHYs2SkBkHW3bUMiINcMhSjizZRlv8rawPgQQTTL5u+iSCf1DWGYNftBI0Z7lD01R3T3LCVkW1o8zAmzIoSav5XvzHezLvoCqQtIGjFq7w+SYdW1vwlBGT2y3c3SlaCHG0JhwBQ1n2BlzBhsqfdJlH54tfgoYBNJ4/SIK26w30alkHb0kM0AuOCx04g4rN2glRvB7I9lbcag
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(316002)(4326008)(6636002)(40460700001)(8676002)(2616005)(81166007)(70586007)(70206006)(47076005)(110136005)(508600001)(36756003)(36860700001)(83380400001)(82310400004)(356005)(2876002)(426003)(336012)(16526019)(8936002)(107886003)(30864003)(6666004)(1076003)(5660300002)(2906002)(186003)(26005)(86362001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 17:33:05.4637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3884dd67-5309-4f4e-9b06-08d9d5286d27
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1488
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

