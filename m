Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F5BC4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 21:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8846860F39
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 21:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233487AbhHPVLF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Aug 2021 17:11:05 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:19586 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233498AbhHPVLD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Aug 2021 17:11:03 -0400
X-Greylist: delayed 2012 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Aug 2021 17:11:03 EDT
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17G9jc8u007429;
        Mon, 16 Aug 2021 16:36:43 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2059.outbound.protection.outlook.com [104.47.60.59])
        by mx0c-0054df01.pphosted.com with ESMTP id 3afnm6rdq0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 16 Aug 2021 16:36:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1yTAYr+mM/XDrqfChAkEsLEVsbQzShNCIVw4x79CRRhDErI12QfByqWxthWmi9wamrMjJ1Eg88C1r8tU0IWhvzU1wfJGQQllAR9dzGFTQgIq+L4MM2q+uRSLMhBEmZRlmDzTfXJHJSuywvqgVj8Js/FpbAKj8Ng1BHEtPbKaEvZuKaeY0C5y55gBXURKXG3pqnQMQeW3/8Qf1iANCYq6QXeHVichz0gSosl1Qn//jmVRoC1sm1y5UyXa2+xWAKWhV/3/zCh68FHj8KYVkvSHYbzUQW9NU1M+luNvP2BfT8tsOf8VRSowVKtFAC6zl2Gn1hVxWLPqGBefL1xU+OnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZfwjkYhAetRqChPcLovl8AwSNNDb7eY1gnsWlSoMNk=;
 b=RHlaaHKIfov4f81ZSOYjcHzEavxs82ZAkJmZp9xRcbPslcIG+RUkK/8xHFg+Ex+8aFWJpdrPQcowMV0kGUev9SWwwM7VaY+3h7vSME3kMwzPzSAWAmLYjX+9WnlZzUoxwC6WM6lnTwEEycz8YIkXS86t5JsCiM61Xl8xuu76r3U3NZSkddpvj/P6EjsOPtExqMRVRNZEtOhLuNaGQQPgbCuywi7N2t86DYoqXr2j0jjFr8xnBl5qhmndpzq8nIw+XxXVx7wIiywHY5HyopqXfQELagXWtvk/QG12dD+1Vod0kclISgLuEKXkXqc3YxtLb9VHLI2Rd9Ef6jP5Agemhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZfwjkYhAetRqChPcLovl8AwSNNDb7eY1gnsWlSoMNk=;
 b=jFJeArwxAI0vxabFYwiEiwBFM79s/T+vxjsUe9hm7opfbf3Lf9BI1kjDuP1BYilJ4XPvPINTi2SYjsj+Fn7vL2wRNoY0EvGY2fCWSvETsK9xUrhOi8TWC6rAfepooBi4lvCksEavFQMSSIewG0IUjlNzB1yxAXozWZ6FdOQ7sAI=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=calian.com;
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::23)
 by QB1PR01MB3954.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:2e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 20:36:41 +0000
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::29c8:ab4d:96e2:df8b]) by YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::29c8:ab4d:96e2:df8b%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 20:36:41 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH] hwmon: (adt7470) Add support for PWM inversion
Date:   Mon, 16 Aug 2021 14:35:47 -0600
Message-Id: <20210816203547.257403-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:303:b4::8) To YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:27::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from eng-hw-cstream8.sedsystems.ca (204.83.154.189) by MW4PR03CA0243.namprd03.prod.outlook.com (2603:10b6:303:b4::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 20:36:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c584188-c46b-4987-6f75-08d960f58d6a
X-MS-TrafficTypeDiagnostic: QB1PR01MB3954:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <QB1PR01MB3954D6CD7AB49614F3AB3390ECFD9@QB1PR01MB3954.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IwsTVxUgvt+rqjFvR/OXCNGgm/AR/yDHwBSqQz6tBuncEakXumkIcsBxL2HeKDVg840+103kvTgRpCdCiZ5ib2e/CP2OomrXYGLpfUE3W8s6DbhPeZneeRFesO1B6rCzZ3BUOuT0gI7U94xUVCG6Rnfcef/fhJbVOmDwAGVjbJqaH/PWfjOvBT/xfTf0Vo+/g2o5fponHdF2yka5h1kQFDSQ8wZaCf+soD9gzkS+ADN8GMN81u6FmXR548gVI0Recbt6gUfa5oUbvcRpHwpY1Xz+Sou7RMLgdh24t79T1wM2F86gJGG/oy/L3G1yc1mW0wvacAwFA4grB4Ym5gn8gAwzBrYlCbUcb8fgzycL9qC7d78fM4OTaXS/ryN1oPwLK8wcTUGEQlvlY9r3esArIH2I21mvO5HKdbIbxtSJfkKZS38HZLeoAVRbFthVhU+NwoJrUO/DBRyAnClr2wS0TsfHTFVG74GsYEvTES9Fp0YFHr5AsBySPWTKqAKazn5+RCCylaLUDioH88MRl4f8TKMHPxIVLnw9N1tjJFLw8W2Ibr3o5VMkJ3dkkpp8TPoZ8VD+7DSDnGqKcSlKbuMzpeGRvHI5RAAWZ+Fb9oWEljE8HCk/OU8quqsgAc3b+UOpsk37UPy91W26B2U0Mejovl1fE7gQVY6m4qxwyOMa/8GfAONf6GDQdqjKoKc6bbC1ObkYD5vZqWq8OhOcb5TAtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(186003)(26005)(2616005)(2906002)(1076003)(107886003)(5660300002)(83380400001)(4326008)(316002)(956004)(8676002)(66946007)(6512007)(38350700002)(44832011)(66556008)(66476007)(38100700002)(52116002)(6486002)(6666004)(8936002)(6506007)(86362001)(36756003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zcv+KsnAzgiJfwB3Cr98mXOWyAFAz9OeCiwlmRMoTbf02q51uxGrRLUEtRlf?=
 =?us-ascii?Q?3ODeg5q1GuEfD9j4TMAdMe3wn7hbd3DYj4UbrW5XG5xvbI6wmH0+tAu7RBw7?=
 =?us-ascii?Q?kesUK4isX3/eANXYzpKVKoFGhLldpf6nLLS5fChmlhUFmqO1uXKXqPMiVRpZ?=
 =?us-ascii?Q?zIt8HIUg2QS0GxaaGbIX+G7WGTVpq7U9iFwG0v39lInx37hvI1wlA1ep43jK?=
 =?us-ascii?Q?NT+iZ4H5DMtykoNW84GUE39bB4nT6W6di9OzNGnbh/cfimpcQA29IEMljrHd?=
 =?us-ascii?Q?soAV7rDsYXUvr2m/JOFG2WNHPJIiwhdDy14wOIve26ZHW+3IOstqxNZYisz4?=
 =?us-ascii?Q?yCAbvMIBpsTvljSXHzfz10ivDEgLn1kMQRbL7UPyV77+JIGAju2Vhw/yn7rO?=
 =?us-ascii?Q?tIn5ognWKXsbClLCJyxlwXCxqWxP4YZvvPwR8FQH5mU4CDfTmMqeV1skRZCR?=
 =?us-ascii?Q?H9EuIID+GP4fkAYh9xidVL2o+uVZMfiEm+g9xeCFq4a7GzQbK6ZeQQvZRDRC?=
 =?us-ascii?Q?z18fx28l9Tq8Bgon+U2h/0RX8ax19L3stDm9tTNh72TDbz1kZBmG+ZZqJobN?=
 =?us-ascii?Q?cErDvmd48WofzQotz57s0v+uPu4h/hyrFu2cDsedZK/ULJWP1pqYKaLVPyGF?=
 =?us-ascii?Q?NKhNi89ia4Q1ndgLlLrb1+SB8QapP764BWPB1B2YWDfpAHHqT0yN5IDS/XTd?=
 =?us-ascii?Q?e1aITQhGIy+k84A3fDbviC2VVcrX9ykVubdzGhY9u3J+uANp3menLGSEtoLa?=
 =?us-ascii?Q?7WNMyMvrV3xTAMnlFb3V50rZTbbnZjyeVawh351fDMogxSK6Pa4f4ztTeh6i?=
 =?us-ascii?Q?j0rnxnpFNLJ3lbdOFMcdC+cNRDaVfu8cIiZP9uE2aSSWs3oIBSV1cYhXn8nQ?=
 =?us-ascii?Q?TbtCCD4UcGAI2XCOem28foRAnwbVbwJt3aTCMDNS+ZIDN6EhH/4OtaUlTL4I?=
 =?us-ascii?Q?VBxRtMvY3MkpFE8yNnU2haDMCTsHMRh2KaBUwg2xwNm4T88KIxbJoJurxk1X?=
 =?us-ascii?Q?85GqudWieAbqF2HD5XoIHwe54/5y/M73FXWgSdkVY/MQeGyIDqxKGLJv3Jy5?=
 =?us-ascii?Q?5d22hMnJx1E7J8JoSWa03nSxu+IvNWPHcgYfqWvzOxqXvgfAwIk6H9iBdvMW?=
 =?us-ascii?Q?4erLyj+ImFgK3zCZ4t7qIht8d/+ic3LslROisMKg7EKkLZvnTShqTILTiyYB?=
 =?us-ascii?Q?vNxTwnZAz+1hlUM0h3ugkIeQU4uHY1XoyPPiLgop8QG0UFwiXEeICuwVPtLS?=
 =?us-ascii?Q?jCXbubzaklsnhwsEGQo2UGjWIODFbS2ccTvb5ZH9olvaZvAMrs6Tc8BzSPkq?=
 =?us-ascii?Q?WH2XHm1r+bvmZkzDKn8lWw99?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c584188-c46b-4987-6f75-08d960f58d6a
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 20:36:40.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNns3j3ON06q3z/Vj1LKFd12SyOVjQlYEyA6XTr42gMX3wQbzoiviXsiAt8kaHSAK582IfKzTIc4y9HEH056MQx5cNPYGN2TqKcAvpZzuU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: QB1PR01MB3954
X-Proofpoint-ORIG-GUID: OZyMiPNjKdz8Y25YBPAvmszt5FP57oo9
X-Proofpoint-GUID: OZyMiPNjKdz8Y25YBPAvmszt5FP57oo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-16_07,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160130
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add sysfs attributes to control whether the PWM output signal from the
device is inverted (i.e. active-low rather than active-high).

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 Documentation/hwmon/adt7470.rst |  5 ++-
 drivers/hwmon/adt7470.c         | 72 ++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/adt7470.rst b/Documentation/hwmon/adt7470.rst
index d225f816e992..8293f93d6cd5 100644
--- a/Documentation/hwmon/adt7470.rst
+++ b/Documentation/hwmon/adt7470.rst
@@ -69,7 +69,10 @@ from 0 (off) to 255 (full speed).  Fan speed will be set to maximum when the
 temperature sensor associated with the PWM control exceeds
 pwm#_auto_point2_temp.
 
-The driver also allows control of the PWM frequency:
+The driver also allows control of the PWM inversion and frequency:
+
+* pwm#_invert: Controls whether the PWM output signal is inverted
+  (i.e. low when active rather than high).
 
 * pwm1_freq
 
diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 2e8feacccf84..f0863a6e1560 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -61,10 +61,14 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define ADT7470_REG_FAN_MAX_MAX_ADDR		0x67
 #define ADT7470_REG_PWM_CFG_BASE_ADDR		0x68
 #define ADT7470_REG_PWM12_CFG			0x68
+#define		ADT7470_PWM2_INVERT_MASK	0x10
+#define		ADT7470_PWM1_INVERT_MASK	0x20
 #define		ADT7470_PWM2_AUTO_MASK		0x40
 #define		ADT7470_PWM1_AUTO_MASK		0x80
 #define		ADT7470_PWM_AUTO_MASK		0xC0
 #define ADT7470_REG_PWM34_CFG			0x69
+#define		ADT7470_PWM4_INVERT_MASK	0x10
+#define		ADT7470_PWM3_INVERT_MASK	0x20
 #define		ADT7470_PWM3_AUTO_MASK		0x40
 #define		ADT7470_PWM4_AUTO_MASK		0x80
 #define	ADT7470_REG_PWM_MIN_BASE_ADDR		0x6A
@@ -162,6 +166,7 @@ struct adt7470_data {
 	u8			pwm_min[ADT7470_PWM_COUNT];
 	s8			pwm_tmin[ADT7470_PWM_COUNT];
 	u8			pwm_auto_temp[ADT7470_PWM_COUNT];
+	u8			pwm_invert[ADT7470_PWM_COUNT];
 
 	struct task_struct	*auto_update;
 	unsigned int		auto_update_interval;
@@ -300,11 +305,22 @@ static int adt7470_update_sensors(struct adt7470_data *data)
 			reg_mask = ADT7470_PWM1_AUTO_MASK;
 
 		reg = ADT7470_REG_PWM_CFG(i);
-		if (i2c_smbus_read_byte_data(client, reg) & reg_mask)
+		cfg = i2c_smbus_read_byte_data(client, reg);
+		if (cfg & reg_mask)
 			data->pwm_automatic[i] = 1;
 		else
 			data->pwm_automatic[i] = 0;
 
+		if (i % 2)
+			reg_mask = ADT7470_PWM2_INVERT_MASK;
+		else
+			reg_mask = ADT7470_PWM1_INVERT_MASK;
+
+		if (cfg & reg_mask)
+			data->pwm_invert[i] = 1;
+		else
+			data->pwm_invert[i] = 0;
+
 		reg = ADT7470_REG_PWM_AUTO_TEMP(i);
 		cfg = i2c_smbus_read_byte_data(client, reg);
 		if (!(i % 2))
@@ -935,6 +951,51 @@ static ssize_t pwm_tmin_store(struct device *dev,
 	return count;
 }
 
+static ssize_t pwm_invert_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct adt7470_data *data = adt7470_update_device(dev);
+
+	return sprintf(buf, "%d\n", (int)data->pwm_invert[attr->index]);
+}
+
+static ssize_t pwm_invert_store(struct device *dev,
+				struct device_attribute *devattr,
+				const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct adt7470_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int pwm_invert_reg = ADT7470_REG_PWM_CFG(attr->index);
+	int pwm_invert_reg_mask;
+	long temp;
+	u8 reg;
+
+	if (kstrtol(buf, 10, &temp))
+		return -EINVAL;
+
+	if (attr->index % 2)
+		pwm_invert_reg_mask = ADT7470_PWM2_INVERT_MASK;
+	else
+		pwm_invert_reg_mask = ADT7470_PWM1_INVERT_MASK;
+
+	if (temp != 1 && temp != 0)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	data->pwm_invert[attr->index] = temp;
+	reg = i2c_smbus_read_byte_data(client, pwm_invert_reg);
+	if (temp)
+		reg |= pwm_invert_reg_mask;
+	else
+		reg &= ~pwm_invert_reg_mask;
+	i2c_smbus_write_byte_data(client, pwm_invert_reg, reg);
+	mutex_unlock(&data->lock);
+
+	return count;
+}
+
 static ssize_t pwm_auto_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
@@ -1135,6 +1196,11 @@ static SENSOR_DEVICE_ATTR_RW(pwm4, pwm, 3);
 
 static DEVICE_ATTR_RW(pwm1_freq);
 
+static SENSOR_DEVICE_ATTR_RW(pwm1_invert, pwm_invert, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_invert, pwm_invert, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_invert, pwm_invert, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4_invert, pwm_invert, 3);
+
 static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_pwm, pwm_min, 0);
 static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_pwm, pwm_min, 1);
 static SENSOR_DEVICE_ATTR_RW(pwm3_auto_point1_pwm, pwm_min, 2);
@@ -1231,6 +1297,10 @@ static struct attribute *adt7470_attrs[] = {
 	&sensor_dev_attr_pwm2.dev_attr.attr,
 	&sensor_dev_attr_pwm3.dev_attr.attr,
 	&sensor_dev_attr_pwm4.dev_attr.attr,
+	&sensor_dev_attr_pwm1_invert.dev_attr.attr,
+	&sensor_dev_attr_pwm2_invert.dev_attr.attr,
+	&sensor_dev_attr_pwm3_invert.dev_attr.attr,
+	&sensor_dev_attr_pwm4_invert.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
-- 
2.27.0

