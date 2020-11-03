Return-Path: <SRS0=Pxzt=EJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1470FC2D0A3
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Nov 2020 19:33:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B11AB216C4
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Nov 2020 19:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com header.b="bGiuoEjM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgKCTdl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Nov 2020 14:33:41 -0500
Received: from mail-eopbgr670071.outbound.protection.outlook.com ([40.107.67.71]:2112
        "EHLO CAN01-TO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726660AbgKCTdl (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 3 Nov 2020 14:33:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lc3Cw/OUoW1dWmc3IUH/Jo0nBtFxhel6mreGK2UGPARCWVookuytW0LsIhjW1TYWVifagBHZAIG3OKwoXyIzpbbKFcZM4crEFxbWEC4IOzzxCc2ei9fIsekbCUQZJoSPm1Nh+VtNmvZdrt1vElgJkrN9kx1SrDA2gq1CZbCig5aSQJr4a/Q00ek8ejzbDhK+nQojaSWQx6gzMP9fSUKywA0nNdm3jHeIipSG3CBR6rcuWC3nqAZk0VQh31jk0XHtXF3OHDGG/2u7mNP+96cFco9aWVF/0UuWwxqjVivrZgY8BznEq4ICejylQtKYRhI/jphjKyALpgXbjvhwIxILBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzk1vgd+g7M+bs1KMD1LATs/D27ZdRFChitF2zNb7OQ=;
 b=Cq9jFoMZ+jDIRo7SuW+ZDv8U/yhQg4Rhy+ir2xQNxsWt+WhH4KIZakZJ+leI5Q1o8/UCTwBwm5TUTDrW4r0Y4icKV+dk7GlwVmsZ5mUbPGTlTCr9OL9GhW7klKQUowLshDvZ7x6xdh/OKOFN3Kx1TALM0rjoPoN8JZmYqzguUOoSsaClZ6oJWBgjqsoC216MFDQ/LNZ1aRgw1cdrLGg5DrQp1SYNq42VClg36TrMBpNP4x+8npHbVUzdqpZPUYX4ExPDeQTOEaF8la18bsACxCiR2wKNZ9jP3YgmNlzMpkFCpEdCJikkHYf0PO14/2R4P8AjVH0giEHnGkeqV7ritQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzk1vgd+g7M+bs1KMD1LATs/D27ZdRFChitF2zNb7OQ=;
 b=bGiuoEjMDl/Lj5nQtNr7KBOKrxnv8IZrX/QHx2TFd+LnEKAKHnwfj4WE1bBcJlPX3et+VeYTL/Ayk3Npcpv963tMBy3rqFKW6KGm4Fz6EZ1oI0xdmYG3KmXo13Dpvv3AO4gbmGOXWj6x0rWLTXl3QiGOU6wwiqaHWX5OUrpG4gE=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2618.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 19:33:38 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5c60:6462:fef4:793]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5c60:6462:fef4:793%3]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 19:33:38 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux@roeck-us.net, jdelvare@suse.com
Cc:     xqiu@google.com, linux-hwmon@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH] hwmon: (pmbus) Add mutex locking for sysfs reads
Date:   Tue,  3 Nov 2020 13:33:15 -0600
Message-Id: <20201103193315.3011800-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MWHPR01CA0028.prod.exchangelabs.com (2603:10b6:300:101::14)
 To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MWHPR01CA0028.prod.exchangelabs.com (2603:10b6:300:101::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22 via Frontend Transport; Tue, 3 Nov 2020 19:33:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffb4bdb8-255c-47ec-f056-08d8802f5ce4
X-MS-TrafficTypeDiagnostic: YT1PR01MB2618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB261868BD3EC0A9FC76AE1A45EC110@YT1PR01MB2618.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 640MI1MdRiRlFBY8yECRZ5EfkLuKL2q2M4EQLmFJjlRciZZKU2mN5x/giEdxiKAXeAmxmCxeBbpWuz9eRFZpXZjYwahnjUyZhDjuq6dSUPhL82OILHMKSB8o1rPQqRPVrBbXjYIck8YnntiNt0Tp/Fi2Sy5hjCJRkrosujCeB5JJNT6mZfm60seduTv2m2wFXxk+kC7YWWBiYm/UuVOnpUO32NDNTkb5sFxPPPLmgLY2sz8qgry18OPGZ9WlxEiczlZmQntimr036bjObz9QF1wtKaeBZREsc5IG+z92MPTaeH+x635EBk9MAC3d0cUyJn8gjhHMcKRVjYDWgzfHn3eGocb7vNPFfXd1h3tTH8TorbJXArc9Kh4pyOlfhX0A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(6486002)(8676002)(52116002)(1076003)(83380400001)(8936002)(66946007)(66476007)(66556008)(5660300002)(86362001)(478600001)(316002)(2906002)(186003)(4326008)(6512007)(36756003)(2616005)(956004)(44832011)(16526019)(69590400008)(6666004)(26005)(107886003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: YN23i9+NCDZIZiWQgdYuf4o1Zp/9otIAp2P+kHmwklevtQILl76Vxnbc0mU6Jq3NDBJA4J9iTc0uAYjMaqovlHLK7A9xtQj3h+PhVBOM6KpLAC/F9BarMCWN2O/sUV2AVqgsTfsJEP9c/IM+mKSQ54VmkhQWAtP+FOJoM2KH6r8tdHMRZmtU4NfDL4XH7zvS5SUJHgdGTuqOVzjKtoalPbqVYnmu6jPn1gcLr2dYZ5FI+iXC6ENjzLzzcqY8/DP380huZSN7vfy/o0vSAEXcZwxgcz3GGZvGdWp77dKZ3wufpoY4mqJsekF//5Qqk/grau3JSAK6fi39qkgLtLCeMGYf2rlaDDpU0w7m8IVutpQdYZMMcCfzDSPsO9jOlTJgN8HfLCUlPxfFzwW2ujJi7+OBDcbz6jrpP+rH5dzR9FRJS7fbK68vmFVSvIz3I0PDZ6pFD19vIfVW3CnDgHjs5njhOqNhk2xUCY5BufwQF34Tas2bmBk0npfeNtLpRGjOi2DKzW411Q5uXTrfqcXp89veMo8dSvwxZ4v4PcVGrGdIAtgsR1+iYnXP7XZDiM7FjIVb9oKaQ1Rk6xzc+XUN8K/xxl5BtCuFT6SbAlwjpavlOboQSjXSrABaRoEsgwWcKReCxB1J7P67pBK3nu/8cQ==
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb4bdb8-255c-47ec-f056-08d8802f5ce4
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 19:33:38.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GAEkrOeoZO3X/fHXix0Jxk6pi44iHYnhwp95CWZg+NMX/DrZTDnC9JXxsCmUu+DbVExi7j77v1ewVplLdEdJbyuT6BoHg4BXkE/yFqrraI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2618
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

As part of commit a919ba06979a7 ("hwmon: (pmbus) Stop caching register
values"), the update of the sensor value is now triggered directly by the
sensor attribute value being read from sysfs. This created (or at least
made much more likely) a locking issue, since nothing protected the device
page selection from being unexpectedly modified by concurrent reads. If
sensor values on different pages on the same device were being concurrently
read by multiple threads, this could cause spurious read errors due to the
page register not reading back the same value last written, or sensor
values being read from the incorrect page.

Add locking of the update_lock mutex in pmbus_show_sensor and
pmbus_show_samples so that these cannot result in concurrent reads from the
underlying device.

Fixes: a919ba06979a7 ("hwmon: (pmbus) Stop caching register values")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 170a9f82ca61..b0e2820a2d57 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -941,12 +941,16 @@ static ssize_t pmbus_show_sensor(struct device *dev,
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
 	struct pmbus_data *data = i2c_get_clientdata(client);
+	ssize_t ret;
 
+	mutex_lock(&data->update_lock);
 	pmbus_update_sensor_data(client, sensor);
 	if (sensor->data < 0)
-		return sensor->data;
-
-	return snprintf(buf, PAGE_SIZE, "%lld\n", pmbus_reg2data(data, sensor));
+		ret = sensor->data;
+	else
+		ret = snprintf(buf, PAGE_SIZE, "%lld\n", pmbus_reg2data(data, sensor));
+	mutex_unlock(&data->update_lock);
+	return ret;
 }
 
 static ssize_t pmbus_set_sensor(struct device *dev,
@@ -2012,8 +2016,11 @@ static ssize_t pmbus_show_samples(struct device *dev,
 	int val;
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
+	struct pmbus_data *data = i2c_get_clientdata(client);
 
+	mutex_lock(&data->update_lock);
 	val = _pmbus_read_word_data(client, reg->page, 0xff, reg->attr->reg);
+	mutex_unlock(&data->update_lock);
 	if (val < 0)
 		return val;
 
-- 
2.18.4

