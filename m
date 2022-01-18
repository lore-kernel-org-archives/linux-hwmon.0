Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A55C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jan 2022 07:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343741AbiARH4l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jan 2022 02:56:41 -0500
Received: from mail-co1nam11on2081.outbound.protection.outlook.com ([40.107.220.81]:49438
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230082AbiARH4k (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jan 2022 02:56:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Te0Z7UlNPGPKBfjKjaPn8xBXZgtbxPE0aMLq/q+ppdaVI9UBodu8Z0oDTnu66ZEHYkmSyhuAN62tZ7I3fg6AC9FspT6B/Qnj2lgXPEZGvE7l3hgEjoFYWAN0CvUgiaNjrvFuouN9cDzaU3pdpnip3edbkakEQTWscFYmertaZWnBhlxU080A29Ryd4FeXLTSSxAzuQ+6cI4NTrgMbIoPpbOWgba/p5lc8eiJFEaewyVjOd5rQXt5rI5QCdFRHARdi+518mV/cCn05vtE+9Xys5XYEX50IwdjFkyW68DNEpBSQjmy5Uz4wvEczRld/mMpr9u8TckPYmgnzkjUiBD1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FpvxvRLTEgiVMnWKaNn77jlXMzpcLfGhYLJB7zSBUU=;
 b=gbIgtQUnFHKzEeD69jowbOTASYFr41AvguoMoXImnBTCe8LUmCDD5kdBZzvBQw2M74pR2mLlIehRJnzyTFyLTUpkYPrIOonHNZjCcoQ7PYQKA3OGTGoQkLZYsm0UBwqXc6JxEIISl0N7qtyIroxeWqy5Qvk9FFjdmY4VXqLtCvQXkc5RsMT2wbkX9rr+Wwa5YbLKdfLaxOQVwllXncPg1JsqFiW5ZIU1goEeTMmPYF5pWR1hO8Dj3+AptI64KMhLE3i8JkvtpWfmdPU08kk+tidsuQXjYzCqLOlLy4FcXcoDAwhCafHJWN0rjw0dLnSAJu+Zbclh5W2cldo34ZoMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FpvxvRLTEgiVMnWKaNn77jlXMzpcLfGhYLJB7zSBUU=;
 b=fo5XjSQdr2JBZM0ByosJDwS20lsVG5cOwTBIhlFxtsL5FcpvYPrwkE1XkmGpZDfVKjFa2ukm7w6dkRyleEkCV7NAKkpNJpC5ugRBBv19QYuQd9mueXbyr4LqoQZz0Fn4Uep+9+GAinpZG8Kss3j09e9Z6wElLJjAZyd2NLD8eZwDMi+eh4XyE4MBW76NNHQYguZkD7rfV8cJtYtgYWpMrs3NPuWB6Za4OX2Zx1lFYu3HW16X5KPF5kz+tDX6U+Aat0eKy/pg86gzjGEoDjgBly3nW5Senpz1Vwztgjm4LdxI8wzxoRNeHsnxs0MCQposRMRR3Ce96Ge9UeBqPJRqig==
Received: from DM6PR18CA0005.namprd18.prod.outlook.com (2603:10b6:5:15b::18)
 by DM6PR12MB3065.namprd12.prod.outlook.com (2603:10b6:5:3c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 07:56:38 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::61) by DM6PR18CA0005.outlook.office365.com
 (2603:10b6:5:15b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 07:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 07:56:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 18 Jan
 2022 07:56:37 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9;
 Mon, 17 Jan 2022 23:56:35 -0800
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v3 2/3] hwmon: powr1220: Upgrade driver to support hwmon info infrastructure
Date:   Tue, 18 Jan 2022 09:56:10 +0200
Message-ID: <20220118075611.10665-3-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220118075611.10665-1-michaelsh@nvidia.com>
References: <20220118075611.10665-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.127.8.9]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5136b20f-ff93-4731-8326-08d9da580e93
X-MS-TrafficTypeDiagnostic: DM6PR12MB3065:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3065A4ACF8F092E0CBE2A61BD4589@DM6PR12MB3065.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y26j008oWVetGv4gFZsiRy1nEaWTWKyFybSNAXEXjv+K1UKtOUktkhGcifJI/q5ZIkmPFdTbNEK9umbkfsQKjAjvbUJ5mgL7Fnkn8wOpOJ2LmbVWN23btdGG1Z0EFDntQhj0BKjgj0DMYe/mI7SgwEbrVWqWLRtB9gLdEr+fiRryDxIfHb/EWE3e2dxQv0krekQVJArudKyoWsjQuzo0HM7eYyRwx8m/z9uAlINCcUIqPbvTEDf6XMXLVYxNDDZhcglW1Xfh0ymRL7kBWL9ODrSj+QHnz1yf2Ca9UAjYmTG32KNvbHMrY6IfXkuSorBh49/pWzIIll+awfYRaakKD87HnGnjY3wEptK8bgnbG3sGpQGi5aEFZwHhMYxdqHcSRaB3ihSLkANgR2eEGc1el6+ll5Ev3CkoYmMtiQJcfdxhFcFJT/HXydTWYtWByOKiKWK7Q8fOJ+vuLs5K1yaomUsFy1zkcJ0NbmoLVqB+4XEYJsnASWNMBNBo9gFVD2bs19ZKsFhUZAbw9Qx8p2XpWyXP3h1/jsvP3Mr0LE1H8IVUPzU6tfVh67TYXjK3/nnq7Uo12UQneALF+PJ6ODLmqynwwConJencVBnKziW1oyVkcmvY+Pkdy3y3+CJ76ZfeKvWyjRB8XIaG6jxLPyc80JdOFxJecRPDz6EHVyL+KZrOvJ03Q9IuZV7lDIaaZXmQCOv2h2zUJKBGg/8IskcI8ud4WmgHrOkW3cpT0swN7wp+moK7y2zmBaouVVDiBWMKYA0jXB8yuzWLHr100IK9s46jqsRSk/tP+kilibKpua1uhB+WCbISfasiLhQv/2lY
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(36756003)(508600001)(81166007)(26005)(82310400004)(83380400001)(356005)(47076005)(40460700001)(86362001)(70206006)(336012)(426003)(1076003)(2876002)(2906002)(70586007)(107886003)(4326008)(8936002)(8676002)(16526019)(2616005)(316002)(6666004)(6636002)(186003)(110136005)(36860700001)(5660300002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 07:56:38.2724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5136b20f-ff93-4731-8326-08d9da580e93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3065
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
v2->v3
Fixes according to Guenter Roeck notes.
1. Don't change usleep instead udelay.
2. Move code aligments to separate patch.
---
 drivers/hwmon/powr1220.c | 207 +++++++++++++++++++++--------------------------
 1 file changed, 92 insertions(+), 115 deletions(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 542e4a7b0234..1d4e005977b6 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -167,135 +167,109 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
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
+}
 
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
@@ -312,8 +286,11 @@ static int powr1220_probe(struct i2c_client *client)
 	mutex_init(&data->update_lock);
 	data->client = client;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
-			client->name, data, powr1220_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(&client->dev,
+							 client->name,
+							 data,
+							 &powr1220_chip_info,
+							 NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.14.1

