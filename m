Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF24EB64D7
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jun 2023 07:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjFZHaG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 03:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjFZHaG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 03:30:06 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04olkn2020.outbound.protection.outlook.com [40.92.74.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B762E0;
        Mon, 26 Jun 2023 00:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfPcIlgHBMLUiOWWax5WYlrDAkRu/WAra6Sp+B59UOUu0KlFWeYikXKmiuY7pPzIjrk0ALkDp1xFRNGKej0JWpKs82i7PGYwAGJ0IrJrz10XuYacc+kEe/vakczP/QdR3bQ0GRPm8UJCgNvGIeZe7U/b4AOQGeMVQ01r1uktYW+Dh+dsGsPluBMhHqloOHjEzYig2mg+Uqj5y/SZwksn4J6Ffcfzk+jWvZZDTmd7d35FNzR/LedMHgfjd+aKQ+b7jus0JEC1rKx34DiuxyheUGNKhguQhw/gKx66lN7LDO2kJcylwfs88XcKWilP9L6BUlClvL6O+DwZwer2yIpYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O5NSon+OIh8MH2auHdzlANyMBfix9VHVhBDQZ2tMlM=;
 b=kBlBXrJrsXpgE5z102tgmOLJS8/CszJkrvul5cY5Yp1FWGwwHTf5bmbiHXvM/hP5d/TtI52CotVdco24iXjHZ5SnGmRbvYpoy5dMEx2+5oDRyO6Tx7LaXRNqkf3z9Z2Dm6i6wObZWthathpJckIA+TCloWuLFQyozD1F7KUvNTRUsEyvxyr/zwks2e0/5APdPu15Yt+8hIm7uSMyK2ZWFD/T9XLIoRvOVAAN2WG013uZgJlT4OQolL0xv10iKWhtCnSteQX0v3GzZyXkL7DPj+8eLa5ne0C/Hp5QPk12J3aJtmf80ZeA4l5lPpttg5CdL5ZBeM0zHUn60FV84c2QGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O5NSon+OIh8MH2auHdzlANyMBfix9VHVhBDQZ2tMlM=;
 b=urLjJK3u/bDSE2TGwy0Iv9CLa8ToaKiyJd/mA9UaQ+pQQDzBR2UIdlDjr1MoE24oLzhysQNNaOYWaZK/CsOrSnoL7aVy7TtSJBALyQTEscSV+vmAKz3lUBygSkuAeDQdarJcS8Gw3fYBp2Q7LXNbhkTYZQwE4suFH9btgGi+spg0F7Rjz1xjVFyObcI1dx0XEo+lVxCTOJbZVJ4hLlf4JHjq2aYpe+krWc5Ls8aDjsyf+Hc9Bug8zA59MEgE6a4Ns/UdByym2XcVq9XKJZoT6aIMlh5Lc1icHGbDuhktl8MS0VwdZylh+ouUbRojWd/TcycjkysfTDMhqhqn99MFEA==
Received: from DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:383::21)
 by AS8PR10MB7858.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:631::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 07:30:01 +0000
Received: from DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::628a:d617:46f:2a88]) by DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::628a:d617:46f:2a88%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 07:30:01 +0000
From:   JuenKit_Yip@hotmail.com
To:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, JuenKit Yip <JuenKit_Yip@hotmail.com>
Subject: [PATCH v1 1/3] hwmon: (sht3x) convert some of sysfs interface to hwmon
Date:   Mon, 26 Jun 2023 15:29:21 +0800
Message-ID: <DB4PR10MB626103F3A3C361C9BD4988099226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [EyGS9BttCGbheCJ6nzcgzGru0Vv0BZQg]
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:383::21)
X-Microsoft-Original-Message-ID: <20230626072923.340544-1-JuenKit_Yip@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR10MB6261:EE_|AS8PR10MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 32748e14-f9ef-4ac8-9b3f-08db7617267b
X-MS-Exchange-SLBlob-MailProps: 70qbaZjg4mtkMlMwcfBWW/BIsvQGdiItrg8zNDemJluqpg8aIs1s/6QRKDvRDy1do4vqVvmh1NKqRXuML1rJ/8uuGmN8qOzhU+lMDJfz8u0AFKwLtulhnrVgY8QODbIRHI3f7C1u9LAEVYiRsTesWwZk5F+uy7LTTP7z23LCMZ4Z8fXZtnp5YGj8cN2CNEmYr8Pd+qzjzgJhT+VUvS9ZcXuTuZ8nufZ3CPJ7LnGtzzJuJqDX9aE3IY42KsN6knIsm+SMV1fhzjZVJW22ueTRfTxeFvBnJ1DuhGcN0vQvxOEEs5pGpkjtx3YH+FjE1baBMGgDEZVdXEeK2DeASkDqEMKCKN8ixpjB57dMgXPrR323ImMRi3XOscq7gs8wQJCWNBkUgLoY2RtZVUifqDSYsMkHff96UyPzGF9+wiAUlelG3APegxsbmoBJVeVX9IOK/QpCdVuovkKnirw83MASFuicrapUt+/LOFiHs4jFwTTdapNwNkxi0NT928S9MI3zfxCrRjKxOHsbsD8pMJXcrndmb+AljaG3JWzcCfje+H+HhiAGq3suYYHbAj5EuXBl3j11Wt7oZv5RSMoYnezSQtw//qMVAdYxvld4H+qxZIWfG0Bc+yx8jiA3udXHjH0A+lNk2pPqJK7OrKuzmipbHf82nphHDYQIWOL31HKQ8GKnSpRcmxeD5eMWSSiEe4uP/1kBXehlIz8Rf/Sy1XPvnYss82eejF7nQolZ/PfD4hd5bQz7oAF4lw==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MX3hUkWxmdsY32ZKx4FXTWAKDZZznIl3PJF5UhUT8NrJfRK/g3QD4iEtZxQkzluv+Nf5S2mBqZtVPIFrE8tmY5AQCddnbZ+Yb+j8S4gtF0fGZP87QT/KnSQjgE3hjI5Sn6yYu9/ghkhkUk5M/EA0Cpdh3wyZDu3PkWU//q0azzALv91IvYdr0d+9noackKUO9oX5N2LDCk/JrO6IPUSzgVqzukg4soNEqiHoBKAnu9koF1NFDcqV03YvOProbadjJy+mdazPXKCNfvyNivKhKIa5MJyy+dpIlZ4Idwi+1dUiAusknYR0EblyzU+4drPQNVTf/MxJ6U83c+o/xas8xvQDUEDLR35JAR6LNW1K+Z4un5YLI14OBRskDp85I+QtJn+QzaCsMi1ZRFBNIN9RZ/2zXSH5WPC+ggOeO/GIu2K7NVvqX8cQ3O9cq7kiDbnF6pYbcMIwzYQFgqf7ZCsp1o5NDBUT82ve7qDBEXGPoTp/hmPnMGsr2tylSV1o4DM1uR7N/eQ21X3F/3kpykh6s1SE7Sg3+rBv1Cfte0IjSstyy/zqXwvGjl7egGJUxwzMumZJt9YmjIjfXW06x2XirRkB7lb9gucazilNU0qRbecNvi7K5+fTIxhns3DCTGXD
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ckEktHG/22+Q+aO4YGSnnlrvFRcPGGM+2sy9zok7Y/PZF9A5rDdPYLeWhRej?=
 =?us-ascii?Q?iwxHZtgrnbg0cuvvE3/3D127cl/Ls2Sa8sbZqm599DA1U+IT8W5N4x8Lix5S?=
 =?us-ascii?Q?ho3o/1MjOnPBwcV84UfKMiUl+uEkKW486REbxBPi8BhaaHX3ONPtAArKhV2L?=
 =?us-ascii?Q?TEsMTFBnrvL2tJ4Z/LbqYanucntg6iHWXJaEc4VIiIlsBkzVWgUwqtue02eA?=
 =?us-ascii?Q?/Hbrl6x48mU4H6qGPX6kOUTxNj05977x7FYWd+t1tmY1yeRLDZzHrtQOnPeK?=
 =?us-ascii?Q?T7SjUZWVze8OZzKAkoU+V1aYzf/g7z3eSz1siZV0ldrMU9NDNWGzQADLffgP?=
 =?us-ascii?Q?oiIK1vAUkVji54EMK3TLkCig2I7Aw82MTawRi34kFLbZQA9ngiIF4D3vuDuP?=
 =?us-ascii?Q?C5Bn2zX8H9RVymdw+6ZKJG/HQUbN5+8Nf1sn3rgqsW3Rd79qjvZNEqk7vSB9?=
 =?us-ascii?Q?LhazhfuyO0+/ENPSUzOTxKkPzuBL7dsvUv0jeZzkEPhxTRAwP8HQQlPChg81?=
 =?us-ascii?Q?BN6JE5QTFgyBHmmIf9VAYBzP7EYBDY4bQvJZ8EadkPGepMNXZn6Fptz91BG1?=
 =?us-ascii?Q?9kTV38MSYigAZ+U2jgx6mmPaqwcWBfYPDr7CZwDTDp51GVCTnEIEwwmVKOIp?=
 =?us-ascii?Q?GLKTOBOsrHtIdPuyB17+VfoB93qjoOk5gX73v8xl5m1U+mXdE36xCh1QdJiP?=
 =?us-ascii?Q?cJuEgfWmMb6uOmGDvj41ysSt6wugDuH5HqiBHyfySGsb0i0dIA0fpNdUtSd9?=
 =?us-ascii?Q?+xBUaVbdBQ9fTdzqKQVFFkSicTKh6MxsvnM4R0yCoDqEIiWJ7xRxx3ug1yvl?=
 =?us-ascii?Q?acGfjV5flIufUAOBhQ32U7a1tqlJglDfufpkdNNay8zNvz555N0QktxUBO0b?=
 =?us-ascii?Q?qurNGUP2hSOHrkIvoPhWfhy4PQkhYz49z75+1P5DhIFI7+psZpeQyDBXYx4x?=
 =?us-ascii?Q?P032qnZcYPmAGOwtXQyU9s/kT6zvTjXltYPX4YJ26tkPvdBU5xxNjQaNdSY3?=
 =?us-ascii?Q?QT2ubJ/HcEyrPO1KCF5CkMr1qzE14MiPJMXuunvYifW/xbDz2CkqbwgMtMXr?=
 =?us-ascii?Q?Erh40S5gWZhNl1OapDiEvxKOoeGagWtHA9MXz12MVh04ZOVwzbSz8RMnnoZp?=
 =?us-ascii?Q?YOgwBCnT4wxK7JxisZPHrbs4CF+URqKT49xOiyab6ksht6EVRv8gR9m0JmJb?=
 =?us-ascii?Q?Y1bDroj8YY3pFsReUnm7TeCKM8fCtn8Bj5AOs3pHRiA96h/Shz/zxHuJvU4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 32748e14-f9ef-4ac8-9b3f-08db7617267b
X-MS-Exchange-CrossTenant-AuthSource: DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:30:01.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7858
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: JuenKit Yip <JuenKit_Yip@hotmail.com>

update_interval, temperature/humidity max/min and hyst
were moved to new hwmon interface, and only heater and
repeatability were reserved as non-stardard sysfs interface.

Signed-off-by: JuenKit Yip <JuenKit_Yip@hotmail.com>
---
v1:
  - remove forward declearations
  - fix switch statement about "return 0" and "break" for consistency
  - convert type of "val" from string to numeric value

 Documentation/hwmon/sht3x.rst |  21 +-
 drivers/hwmon/sht3x.c         | 389 ++++++++++++++++++++++------------
 2 files changed, 254 insertions(+), 156 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index 87864ffd1777..572df2be1689 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -52,32 +52,15 @@ When the temperature and humidity readings move back between the hysteresis
 values, the alert bit is set to 0 and the alert pin on the sensor is set to
 low.
 
-sysfs-Interface
----------------
+non-standard sysfs-Interface
+----------------------------
 
 =================== ============================================================
-temp1_input:        temperature input
-humidity1_input:    humidity input
-temp1_max:          temperature max value
-temp1_max_hyst:     temperature hysteresis value for max limit
-humidity1_max:      humidity max value
-humidity1_max_hyst: humidity hysteresis value for max limit
-temp1_min:          temperature min value
-temp1_min_hyst:     temperature hysteresis value for min limit
-humidity1_min:      humidity min value
-humidity1_min_hyst: humidity hysteresis value for min limit
-temp1_alarm:        alarm flag is set to 1 if the temperature is outside the
-		    configured limits. Alarm only works in periodic measure mode
-humidity1_alarm:    alarm flag is set to 1 if the humidity is outside the
-		    configured limits. Alarm only works in periodic measure mode
 heater_enable:      heater enable, heating element removes excess humidity from
 		    sensor:
 
 			- 0: turned off
 			- 1: turned on
-update_interval:    update interval, 0 for single shot, interval in msec
-		    for periodic measurement. If the interval is not supported
-		    by the sensor, the next faster interval is chosen
 repeatability:      write or read repeatability, higher repeatability means
                     longer measurement duration, lower noise level and
                     larger energy consumption:
diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index bf18630619e0..bd483af1c5ab 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -147,8 +147,20 @@ static const u16 mode_to_update_interval[] = {
 	 100,
 };
 
+static const struct hwmon_channel_info * const sht3x_channel_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MIN |
+				HWMON_T_MIN_HYST | HWMON_T_MAX |
+				HWMON_T_MAX_HYST | HWMON_T_ALARM),
+	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_MIN |
+				HWMON_H_MIN_HYST | HWMON_H_MAX |
+				HWMON_H_MAX_HYST | HWMON_H_ALARM),
+	NULL,
+};
+
 struct sht3x_data {
 	struct i2c_client *client;
+	enum sht3x_chips chip_info;
 	struct mutex i2c_lock; /* lock for sending i2c commands */
 	struct mutex data_lock; /* lock for updating driver data */
 
@@ -276,27 +288,24 @@ static struct sht3x_data *sht3x_update_client(struct device *dev)
 	return data;
 }
 
-/* sysfs attributes */
-static ssize_t temp1_input_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static int temp1_input_read(struct device *dev)
 {
 	struct sht3x_data *data = sht3x_update_client(dev);
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->temperature);
+	return data->temperature;
 }
 
-static ssize_t humidity1_input_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+static int humidity1_input_read(struct device *dev)
 {
 	struct sht3x_data *data = sht3x_update_client(dev);
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%u\n", data->humidity);
+	return data->humidity;
 }
 
 /*
@@ -332,33 +341,24 @@ static int limits_update(struct sht3x_data *data)
 	return ret;
 }
 
-static ssize_t temp1_limit_show(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
+static int temp1_limit_read(struct device *dev, int index)
 {
 	struct sht3x_data *data = dev_get_drvdata(dev);
-	u8 index = to_sensor_dev_attr(attr)->index;
-	int temperature_limit = data->temperature_limits[index];
 
-	return sysfs_emit(buf, "%d\n", temperature_limit);
+	return data->temperature_limits[index];
 }
 
-static ssize_t humidity1_limit_show(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
+static int humidity1_limit_read(struct device *dev, int index)
 {
 	struct sht3x_data *data = dev_get_drvdata(dev);
-	u8 index = to_sensor_dev_attr(attr)->index;
-	u32 humidity_limit = data->humidity_limits[index];
 
-	return sysfs_emit(buf, "%u\n", humidity_limit);
+	return data->humidity_limits[index];
 }
 
 /*
- * limit_store must only be called with data_lock held
+ * limit_write must only be called with data_lock held
  */
-static size_t limit_store(struct device *dev,
-			  size_t count,
+static size_t limit_write(struct device *dev,
 			  u8 index,
 			  int temperature,
 			  u32 humidity)
@@ -379,7 +379,7 @@ static size_t limit_store(struct device *dev,
 	 * ST = (T + 45) / 175 * 2^16
 	 * SRH = RH / 100 * 2^16
 	 * adapted for fixed point arithmetic and packed the same as
-	 * in limit_show()
+	 * in limit_read()
 	 */
 	raw = ((u32)(temperature + 45000) * 24543) >> (16 + 7);
 	raw |= ((humidity * 42950) >> 16) & 0xfe00;
@@ -400,50 +400,35 @@ static size_t limit_store(struct device *dev,
 
 	data->temperature_limits[index] = temperature;
 	data->humidity_limits[index] = humidity;
-	return count;
+
+	return 0;
 }
 
-static ssize_t temp1_limit_store(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf,
-				 size_t count)
+static int temp1_limit_write(struct device *dev, int index, int val)
 {
 	int temperature;
 	int ret;
 	struct sht3x_data *data = dev_get_drvdata(dev);
-	u8 index = to_sensor_dev_attr(attr)->index;
 
-	ret = kstrtoint(buf, 0, &temperature);
-	if (ret)
-		return ret;
-
-	temperature = clamp_val(temperature, SHT3X_MIN_TEMPERATURE,
+	temperature = clamp_val(val, SHT3X_MIN_TEMPERATURE,
 				SHT3X_MAX_TEMPERATURE);
 	mutex_lock(&data->data_lock);
-	ret = limit_store(dev, count, index, temperature,
+	ret = limit_write(dev, index, temperature,
 			  data->humidity_limits[index]);
 	mutex_unlock(&data->data_lock);
 
 	return ret;
 }
 
-static ssize_t humidity1_limit_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf,
-				     size_t count)
+static int humidity1_limit_write(struct device *dev, int index, int val)
 {
-	u32 humidity;
+	int humidity;
 	int ret;
 	struct sht3x_data *data = dev_get_drvdata(dev);
-	u8 index = to_sensor_dev_attr(attr)->index;
 
-	ret = kstrtou32(buf, 0, &humidity);
-	if (ret)
-		return ret;
-
-	humidity = clamp_val(humidity, SHT3X_MIN_HUMIDITY, SHT3X_MAX_HUMIDITY);
+	humidity = clamp_val(val, SHT3X_MIN_HUMIDITY, SHT3X_MAX_HUMIDITY);
 	mutex_lock(&data->data_lock);
-	ret = limit_store(dev, count, index, data->temperature_limits[index],
+	ret = limit_write(dev, index, data->temperature_limits[index],
 			  humidity);
 	mutex_unlock(&data->data_lock);
 
@@ -474,7 +459,6 @@ static void sht3x_select_command(struct sht3x_data *data)
 }
 
 static int status_register_read(struct device *dev,
-				struct device_attribute *attr,
 				char *buffer, int length)
 {
 	int ret;
@@ -487,34 +471,30 @@ static int status_register_read(struct device *dev,
 	return ret;
 }
 
-static ssize_t temp1_alarm_show(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
+static int temp1_alarm_read(struct device *dev)
 {
 	char buffer[SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
 	int ret;
 
-	ret = status_register_read(dev, attr, buffer,
+	ret = status_register_read(dev, buffer,
 				   SHT3X_WORD_LEN + SHT3X_CRC8_LEN);
 	if (ret)
 		return ret;
 
-	return sysfs_emit(buf, "%d\n", !!(buffer[0] & 0x04));
+	return !!(buffer[0] & 0x04);
 }
 
-static ssize_t humidity1_alarm_show(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
+static int humidity1_alarm_read(struct device *dev)
 {
 	char buffer[SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
 	int ret;
 
-	ret = status_register_read(dev, attr, buffer,
+	ret = status_register_read(dev, buffer,
 				   SHT3X_WORD_LEN + SHT3X_CRC8_LEN);
 	if (ret)
 		return ret;
 
-	return sysfs_emit(buf, "%d\n", !!(buffer[0] & 0x08));
+	return !!(buffer[0] & 0x08);
 }
 
 static ssize_t heater_enable_show(struct device *dev,
@@ -524,7 +504,7 @@ static ssize_t heater_enable_show(struct device *dev,
 	char buffer[SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
 	int ret;
 
-	ret = status_register_read(dev, attr, buffer,
+	ret = status_register_read(dev, buffer,
 				   SHT3X_WORD_LEN + SHT3X_CRC8_LEN);
 	if (ret)
 		return ret;
@@ -560,39 +540,28 @@ static ssize_t heater_enable_store(struct device *dev,
 	return ret;
 }
 
-static ssize_t update_interval_show(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
+static int update_interval_read(struct device *dev)
 {
 	struct sht3x_data *data = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%u\n",
-			 mode_to_update_interval[data->mode]);
+	return mode_to_update_interval[data->mode];
 }
 
-static ssize_t update_interval_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf,
-				     size_t count)
+static int update_interval_write(struct device *dev, u16 val)
 {
-	u16 update_interval;
 	u8 mode;
 	int ret;
 	const char *command;
 	struct sht3x_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 
-	ret = kstrtou16(buf, 0, &update_interval);
-	if (ret)
-		return ret;
-
-	mode = get_mode_from_update_interval(update_interval);
+	mode = get_mode_from_update_interval(val);
 
 	mutex_lock(&data->data_lock);
 	/* mode did not change */
 	if (mode == data->mode) {
 		mutex_unlock(&data->data_lock);
-		return count;
+		return 0;
 	}
 
 	mutex_lock(&data->i2c_lock);
@@ -634,7 +603,7 @@ static ssize_t update_interval_store(struct device *dev,
 	if (ret != SHT3X_CMD_LENGTH)
 		return ret < 0 ? ret : -EIO;
 
-	return count;
+	return 0;
 }
 
 static ssize_t repeatability_show(struct device *dev,
@@ -668,60 +637,219 @@ static ssize_t repeatability_store(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp1_input, 0);
-static SENSOR_DEVICE_ATTR_RO(humidity1_input, humidity1_input, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_max, temp1_limit, limit_max);
-static SENSOR_DEVICE_ATTR_RW(humidity1_max, humidity1_limit, limit_max);
-static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp1_limit, limit_max_hyst);
-static SENSOR_DEVICE_ATTR_RW(humidity1_max_hyst, humidity1_limit,
-			     limit_max_hyst);
-static SENSOR_DEVICE_ATTR_RW(temp1_min, temp1_limit, limit_min);
-static SENSOR_DEVICE_ATTR_RW(humidity1_min, humidity1_limit, limit_min);
-static SENSOR_DEVICE_ATTR_RW(temp1_min_hyst, temp1_limit, limit_min_hyst);
-static SENSOR_DEVICE_ATTR_RW(humidity1_min_hyst, humidity1_limit,
-			     limit_min_hyst);
-static SENSOR_DEVICE_ATTR_RO(temp1_alarm, temp1_alarm, 0);
-static SENSOR_DEVICE_ATTR_RO(humidity1_alarm, humidity1_alarm, 0);
 static SENSOR_DEVICE_ATTR_RW(heater_enable, heater_enable, 0);
-static SENSOR_DEVICE_ATTR_RW(update_interval, update_interval, 0);
 static SENSOR_DEVICE_ATTR_RW(repeatability, repeatability, 0);
 
 static struct attribute *sht3x_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_humidity1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_humidity1_max.dev_attr.attr,
-	&sensor_dev_attr_humidity1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_hyst.dev_attr.attr,
-	&sensor_dev_attr_humidity1_min.dev_attr.attr,
-	&sensor_dev_attr_humidity1_min_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_alarm.dev_attr.attr,
-	&sensor_dev_attr_humidity1_alarm.dev_attr.attr,
 	&sensor_dev_attr_heater_enable.dev_attr.attr,
-	&sensor_dev_attr_update_interval.dev_attr.attr,
 	&sensor_dev_attr_repeatability.dev_attr.attr,
 	NULL
 };
 
-static struct attribute *sts3x_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_alarm.dev_attr.attr,
-	&sensor_dev_attr_heater_enable.dev_attr.attr,
-	&sensor_dev_attr_update_interval.dev_attr.attr,
-	&sensor_dev_attr_repeatability.dev_attr.attr,
-	NULL
+ATTRIBUTE_GROUPS(sht3x);
+
+static umode_t sht3x_is_visible(const void *data, enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	const struct sht3x_data *chip_data = data;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_alarm:
+			return 0444;
+		case hwmon_temp_max:
+		case hwmon_temp_max_hyst:
+		case hwmon_temp_min:
+		case hwmon_temp_min_hyst:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	case hwmon_humidity:
+		if (chip_data->chip_info == sts3x)
+			break;
+		switch (attr) {
+		case hwmon_humidity_input:
+		case hwmon_humidity_alarm:
+			return 0444;
+		case hwmon_humidity_max:
+		case hwmon_humidity_max_hyst:
+		case hwmon_humidity_min:
+		case hwmon_humidity_min_hyst:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int sht3x_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	enum sht3x_limits index;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			*val = update_interval_read(dev);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			*val = temp1_input_read(dev);
+			break;
+		case hwmon_temp_alarm:
+			*val = temp1_alarm_read(dev);
+			break;
+		case hwmon_temp_max:
+			index = limit_max;
+			*val = temp1_limit_read(dev, index);
+			break;
+		case hwmon_temp_max_hyst:
+			index = limit_max_hyst;
+			*val = temp1_limit_read(dev, index);
+			break;
+		case hwmon_temp_min:
+			index = limit_min;
+			*val = temp1_limit_read(dev, index);
+			break;
+		case hwmon_temp_min_hyst:
+			index = limit_min_hyst;
+			*val = temp1_limit_read(dev, index);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_humidity:
+		switch (attr) {
+		case hwmon_humidity_input:
+			*val = humidity1_input_read(dev);
+			break;
+		case hwmon_humidity_alarm:
+			*val = humidity1_alarm_read(dev);
+			break;
+		case hwmon_humidity_max:
+			index = limit_max;
+			*val = humidity1_limit_read(dev, index);
+			break;
+		case hwmon_humidity_max_hyst:
+			index = limit_max_hyst;
+			*val = humidity1_limit_read(dev, index);
+			break;
+		case hwmon_humidity_min:
+			index = limit_min;
+			*val = humidity1_limit_read(dev, index);
+			break;
+		case hwmon_humidity_min_hyst:
+			index = limit_min_hyst;
+			*val = humidity1_limit_read(dev, index);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int sht3x_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	enum sht3x_limits index;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return update_interval_write(dev, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max:
+			index = limit_max;
+			break;
+		case hwmon_temp_max_hyst:
+			index = limit_max_hyst;
+			break;
+		case hwmon_temp_min:
+			index = limit_min;
+			break;
+		case hwmon_temp_min_hyst:
+			index = limit_min_hyst;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		return temp1_limit_write(dev, index, val);
+	case hwmon_humidity:
+		switch (attr) {
+		case hwmon_humidity_max:
+			index = limit_max;
+			break;
+		case hwmon_humidity_max_hyst:
+			index = limit_max_hyst;
+			break;
+		case hwmon_humidity_min:
+			index = limit_min;
+			break;
+		case hwmon_humidity_min_hyst:
+			index = limit_min_hyst;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		return humidity1_limit_write(dev, index, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops sht3x_ops = {
+	.is_visible = sht3x_is_visible,
+	.read = sht3x_read,
+	.write = sht3x_write,
 };
 
-ATTRIBUTE_GROUPS(sht3x);
-ATTRIBUTE_GROUPS(sts3x);
+static const struct hwmon_chip_info sht3x_chip_info = {
+	.ops = &sht3x_ops,
+	.info = sht3x_channel_info,
+};
+
+/* device ID table */
+static const struct i2c_device_id sht3x_ids[] = {
+	{"sht3x", sht3x},
+	{"sts3x", sts3x},
+	{}
+};
 
-static const struct i2c_device_id sht3x_ids[];
+MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
 static int sht3x_probe(struct i2c_client *client)
 {
@@ -730,7 +858,6 @@ static int sht3x_probe(struct i2c_client *client)
 	struct device *hwmon_dev;
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
-	const struct attribute_group **attribute_groups;
 
 	/*
 	 * we require full i2c support since the sht3x uses multi-byte read and
@@ -753,6 +880,7 @@ static int sht3x_probe(struct i2c_client *client)
 	data->mode = 0;
 	data->last_update = jiffies - msecs_to_jiffies(3000);
 	data->client = client;
+	data->chip_info = i2c_match_id(sht3x_ids, client)->driver_data;
 	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
 
 	sht3x_select_command(data);
@@ -771,15 +899,11 @@ static int sht3x_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	if (i2c_match_id(sht3x_ids, client)->driver_data == sts3x)
-		attribute_groups = sts3x_groups;
-	else
-		attribute_groups = sht3x_groups;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
-							   client->name,
-							   data,
-							   attribute_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+							 client->name,
+							 data,
+							 &sht3x_chip_info,
+							 sht3x_groups);
 
 	if (IS_ERR(hwmon_dev))
 		dev_dbg(dev, "unable to register hwmon device\n");
@@ -787,15 +911,6 @@ static int sht3x_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-/* device ID table */
-static const struct i2c_device_id sht3x_ids[] = {
-	{"sht3x", sht3x},
-	{"sts3x", sts3x},
-	{}
-};
-
-MODULE_DEVICE_TABLE(i2c, sht3x_ids);
-
 static struct i2c_driver sht3x_i2c_driver = {
 	.driver.name = "sht3x",
 	.probe       = sht3x_probe,
-- 
2.30.2

