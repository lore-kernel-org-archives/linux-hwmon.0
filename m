Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B52C07E96
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9F6F61C3D
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhGFNEy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 09:04:54 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:43664 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232005AbhGFNEy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Jul 2021 09:04:54 -0400
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166CguQR011334;
        Tue, 6 Jul 2021 09:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=5DB2ZlQNxFh1ufgYLv5bIiTpYWZVY5GVMMz/uueDDjU=;
 b=gtprpC6aGS5/GM9gZkBS5M7Jt7sPpSj4hllBeRaCkWdwosfRS5kGVcXknntnX4p/nDX7
 BS44zbdjg0nuebB59QjW3MkG9J7gi0lfD3KlYmZGXxcCxWVERBfi64PMKJIveDD87s5N
 yaDwjDLx89fGpFv8Av9sfejDK4yPduq76qHp/PuMWG4pAffl6YB7pObWxTrL8LRoNrtf
 9vwdFUdp7q8hSt//lI91tJaFUybmUeZi8TvhkC9pWcYnK8pCs9+oK1kAJE6QXY4i1DiF
 lRzSqE5cjVJKFNH/OU1iL+TOJJ3ja4DRNb8sMxF49k0ceZHJ+1hFx1PdGJa5LfBKr5aN 5g== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 39m90ukj89-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jul 2021 09:01:58 -0400
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166D1Vsv013719;
        Tue, 6 Jul 2021 09:01:57 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        by mx0a-00154901.pphosted.com with ESMTP id 39mhn9dacj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Jul 2021 09:01:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrmltVi5fQBALclPeSLByLSEchksp8TwHBvBGbBM2iJzxzg35lvoPBIOr6lrkbYtpj37hq2jB9T8AAohadME22eGmL+TKzTIQgxAj/V3f+tStrfQUNUNZfDpV202Xb15ySUgARfEPOxyJfsXzj9WP4hvAHe/mS+XO1F6+Y7pQLUh7eV9Z6RtV3rLlVRp/luE0hl1zxRNi1O4Fd99WI7vEoZtvLtd989Nj7+8zq998rMqy7OXgf8K9Vb91fcFEWvkjHOkhJKflyhhnYH9YBpjx/oN1b+CxAzlpWz0qyAqK1L2/hx6BQ0cncmcgF7Zym2iT3kvM010BsME88wzNFDFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DB2ZlQNxFh1ufgYLv5bIiTpYWZVY5GVMMz/uueDDjU=;
 b=kuJbbq62OmmusMK5LHquKlfsNB1OaKs3QyoLFvVUbirmqVp6iHPMHasNYfvcoAUpaatj1HQuccvbcCVCXzr23T3W2NWcIJae/i8nBDKquqN2j7PM3vlOEhoirLy+en8eZIHXGFHG67WXjk7XWncBeTWFJxBxjguxC+lvqhDXMKseSBwhV8z4BvucbL5HhsQmQ4tlmWt6bfqB14ty7PIQrYUv7/IOFoFcOSVCWWnQ5t6/7YGC22/k4/wOf2ITdoE3dCs+IQzoQceuvs93hktrdANdpGNfuLV+a4IEmHr75CvaH+3aN6Pyu9RcvXFanHeHkqLyamqRhdN9Hqpd5ggeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MWHPR19MB1469.namprd19.prod.outlook.com (2603:10b6:300:d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:01:55 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372%6]) with mapi id 15.20.4308.020; Tue, 6 Jul 2021
 13:01:55 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 1/5] hwmon: Driver for MAX6620 Fan sensor
Thread-Topic: [PATCH 1/5] hwmon: Driver for MAX6620 Fan sensor
Thread-Index: AddyZTH8Yu1iaZkKQM6DT+eAcjz4oQ==
Date:   Tue, 6 Jul 2021 13:01:55 +0000
Message-ID: <MW2PR1901MB202839C66CF96C224621BD62A61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=688a970f-9369-4d1b-b41b-44d34a74be47;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-07-06T13:01:48.8424973Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f8f9870-bc1e-4411-0864-08d9407e3b58
x-ms-traffictypediagnostic: MWHPR19MB1469:
x-microsoft-antispam-prvs: <MWHPR19MB14693C02F0696C76ECF9A168A61B9@MWHPR19MB1469.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X5xEUHH2ojw6zjGGm8HrtuomeuJPE4cLxZjT9IXT9bXt4NLu6KgVoPufLIk6qV6/QnIzifLzga4HeEDkuI5duqET7IOjpZyGwBWuBZe86yTiuMcNCl6omW+PAQ26o0KPWaw1l7h+Pmz2fkBj1RvlMUbz4xZv7cGpKloNnrGOqpGPhBZKipYz7I8WmuHPgiyyJLn3ZBlqm/slkrF8KCVLUgT+4p3DE8kZp/Nhk73KN830AH10QtJtjNuKrkghYAZX6zs7vjoB8j0oHyg32kUlZXGTfWkHljeyW8xkJ0G6Py58MejXNCD6Sr/BnxWiIr/b1u73OV6T8+FFXOijfay72JKKIM7hVW9CvUSSo4HUnkATHdueRoeaHJS788zXHDhc1bRlokN0OYHTcYavxcB28fX9F7ZAL6R8DQ45G78xoLf1xR2CEOwodxgudHZBUwZ4oXrTliNjQM6eo1IDmq4QZle3RGjfkcR1nw8+xAWz6bhA8B8oQqmeY3Ir1+6KZ4dEZorKbRFkewV0nO8LomYVotQW3xP2cVM4bkMEa/YmnPuPDCB/EinQGYpKD7pJpVayRtuTIjDLLbaZ4bRsqFCQ1JV5IxS9pBGsSYCgm7jMZRRjuqSmgTxYspNKbPhfhRW0pVlK/zbckOL9OxuPHRvqY82GXz1gQ8/eyCIlJWoijswJUpj7woiUhH4Oo6pt6TwM62aL2JYpakn7yga41poU2VC5JE1dIc66OTnjQo2I97PYdlg12zVr0+enrbVMpV448saIHAviBLLeqM7g1KYfTXuCUYUO4k/Nw3ZxA3AFGIA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(5660300002)(33656002)(8936002)(66946007)(110136005)(83380400001)(66556008)(26005)(8676002)(7696005)(786003)(66476007)(30864003)(76116006)(55236004)(316002)(86362001)(6506007)(478600001)(2906002)(122000001)(64756008)(966005)(52536014)(4326008)(186003)(55016002)(9686003)(66446008)(71200400001)(38100700002)(2004002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PDOpXpZf0sBSOiTucyokcSVW42DR9IqfnbQ4XUWH8/KFp2ee1NoEWPTDcUGP?=
 =?us-ascii?Q?yItAHDQOBVD40FjVld2+Ps87L0GtHQlHFw7w1zxZEloqRmubUSSZZDLKUuT3?=
 =?us-ascii?Q?KKx6rJII1MzD1k10jK9ViItPzPIuhxMcbmw4MERRBtl8WkVbpHpskPBpv8Ic?=
 =?us-ascii?Q?CYaTflSVffhUNfWMKP2gWv8xkEeLduoCiK3kDBRqUBJdcL9EZjtnzNhGSydz?=
 =?us-ascii?Q?8dZ+frTo3HQ+XDLuFwtNjgh+PLEvqHz8HOWT74Jex65CFJw8ZunkaMhrSz/N?=
 =?us-ascii?Q?kFHU3Jmf0vSZpTvjj6ig91jjyY8lZOl3fjnZmNuvnqquZ+sba9dxxhqOHOa8?=
 =?us-ascii?Q?E4XHHkv1n5zsWvpHwEkVW9+1OCw3gyuMy6xt1qnvoxhxWxQChhjZUyXZZHnA?=
 =?us-ascii?Q?cB2RZP3aKWCtBbRN4RWVReyIk5+dfgindjsl1hpS0D03llco4ypigkcz8lWV?=
 =?us-ascii?Q?qbS3kk9SxnJo0dEcHr/mEEAJGZd6mbJYDO/UKlOBInnla/KjYc2smWBq50HA?=
 =?us-ascii?Q?kUJxzW9jZUeY+qbJ7RirENYL/7THTtS/uw1pe8TeMdhS1zO0IIyTQkjj6MPs?=
 =?us-ascii?Q?74M7rrhPi7uqLSDQ+FdpZsbmNJJ4hJPl8Lpm9ZZKa6hBFAUOkyH7RCZAwnWs?=
 =?us-ascii?Q?/dqIyRQQxTOSJTNzRN7CW297zeM69PW8LHMSKQUjnqs0T8SzSGAQfHhV/W5D?=
 =?us-ascii?Q?QqhonefZCq/UoTBNlfwUtaLWc2LXmA6vqJjx7BA2aY25HK7x5cZcVU7wx441?=
 =?us-ascii?Q?Qo3JYHwsxc2Tbdo3eRnuungmNkhvWrV0WP2FhXfU/J8YbpOVkjEhPouN1bb0?=
 =?us-ascii?Q?m/6302/bivwZHU+kOrllY3hXxwrym/G2Ptt3SQQFUhE3q63I5CDA/xFrBnpC?=
 =?us-ascii?Q?xdvaif9wYgtW2EMwKMuSPgw1WlG3TAxDtRCXaHp2Hjac09CIzxn63a1i6z/c?=
 =?us-ascii?Q?py+TX4qBx/rAfk7xA8S4z81W1qsKgE6yX1YXQ1CXiFAKz6cqRCyoF0y4ebWD?=
 =?us-ascii?Q?z3NfS3tfsZK9gfmO2YRnJ7QZpVmnEXtt1K9f9UhZjojdh9IPr4DqRlDKcXpd?=
 =?us-ascii?Q?Ca9DWTNx0l4b1Eo/vHzJFWfy9e8wCHEvREnrWEWYTAKoNBE2XVBGrIG4lJVq?=
 =?us-ascii?Q?l/NO1gglfI88C+XQBN/4VFZ7jMwJ2wN80oPWA4uv1XxHx6g06R7DVrsgCx4H?=
 =?us-ascii?Q?K86P4owJj62pvaLZ/K8GtSNrRlZKYlMwFXf260xuXZyqTJ9TXtRWilD+4eRn?=
 =?us-ascii?Q?WPmJHwYSC5dfe0mJ2sZqG42RE70ZMasWAEWVXANHs8lXR141K86lHSHkiWx5?=
 =?us-ascii?Q?2dtGy57rko4A8YSo/r/Ep0Dz?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8f9870-bc1e-4411-0864-08d9407e3b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 13:01:55.3768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81VNVPtxp2hN3tBlZQU1dSiMF+60p3NAFzWQTYDKhGtmY6nsE6gaZ7sP6eA3ts/z+m8PzeuRCFgU4EapvOaGrIXRAVPKybY8aBn8wyf5DwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1469
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_06:2021-07-02,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060062
X-Proofpoint-GUID: eseUth_I7GvnzNrDJPajrUsA7nZkHqI1
X-Proofpoint-ORIG-GUID: eseUth_I7GvnzNrDJPajrUsA7nZkHqI1
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060062
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Cumulus Networks <support@cumulusnetworks.com>

Driver for MAX6620 Fan sensor

---
 drivers/hwmon/Kconfig   |  10 +
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/max6620.c | 702 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 713 insertions(+)
 create mode 100644 drivers/hwmon/max6620.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e3675377bc5d..31478a55a3be 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1068,6 +1068,16 @@ config SENSORS_MAX6650
 	  This driver can also be built as a module. If so, the module
 	  will be called max6650.
=20
+config SENSORS_MAX6620
+	tristate "Maxim MAX6620 sensor chip"
+	depends on I2C
+	help
+	  If you say yes here you get support for the MAX6620
+	  sensor chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called max6620.
+
 config SENSORS_MAX6697
 	tristate "Maxim MAX6697 and compatibles"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d712c61c1f5e..923af2e4aecd 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -139,6 +139,7 @@ obj-$(CONFIG_SENSORS_MAX6621)	+=3D max6621.o
 obj-$(CONFIG_SENSORS_MAX6639)	+=3D max6639.o
 obj-$(CONFIG_SENSORS_MAX6642)	+=3D max6642.o
 obj-$(CONFIG_SENSORS_MAX6650)	+=3D max6650.o
+obj-$(CONFIG_SENSORS_MAX6620)	+=3D max6620.o
 obj-$(CONFIG_SENSORS_MAX6697)	+=3D max6697.o
 obj-$(CONFIG_SENSORS_MAX31790)	+=3D max31790.o
 obj-$(CONFIG_SENSORS_MC13783_ADC)+=3D mc13783-adc.o
diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
new file mode 100644
index 000000000000..3c337c7b0f4d
--- /dev/null
+++ b/drivers/hwmon/max6620.c
@@ -0,0 +1,702 @@
+/*
+ * max6620.c - Linux Kernel module for hardware monitoring.
+ *
+ * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
+ *
+ * based on code written by :
+ * 2007 by Hans J. Koch <hjk@hansjkoch.de>
+ * John Morris <john.morris@spirentcom.com>
+ * Copyright (c) 2003 Spirent Communications
+ * and Claus Gindhart <claus.gindhart@kontron.com>
+ *
+ * This module has only been tested with the MAX6620 chip.
+ *
+ * The datasheet was last seen at:
+ *
+ *        http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+
+/*
+ * Insmod parameters
+ */
+
+
+/* clock: The clock frequency of the chip the driver should assume */
+static int clock =3D 8192;
+
+module_param(clock, int, S_IRUGO);
+
+static const unsigned short normal_i2c[] =3D {0x0a, 0x1a, 0x2a, I2C_CLIENT=
_END};
+
+/*
+ * MAX 6620 registers
+ */
+
+#define MAX6620_REG_CONFIG	0x00
+#define MAX6620_REG_FAULT	0x01
+#define MAX6620_REG_CONF_FAN0	0x02
+#define MAX6620_REG_CONF_FAN1	0x03
+#define MAX6620_REG_CONF_FAN2	0x04
+#define MAX6620_REG_CONF_FAN3	0x05
+#define MAX6620_REG_DYN_FAN0	0x06
+#define MAX6620_REG_DYN_FAN1	0x07
+#define MAX6620_REG_DYN_FAN2	0x08
+#define MAX6620_REG_DYN_FAN3	0x09
+#define MAX6620_REG_TACH0	0x10
+#define MAX6620_REG_TACH1	0x12
+#define MAX6620_REG_TACH2	0x14
+#define MAX6620_REG_TACH3	0x16
+#define MAX6620_REG_VOLT0	0x18
+#define MAX6620_REG_VOLT1	0x1A
+#define MAX6620_REG_VOLT2	0x1C
+#define MAX6620_REG_VOLT3	0x1E
+#define MAX6620_REG_TAR0	0x20
+#define MAX6620_REG_TAR1	0x22
+#define MAX6620_REG_TAR2	0x24
+#define MAX6620_REG_TAR3	0x26
+#define MAX6620_REG_DAC0	0x28
+#define MAX6620_REG_DAC1	0x2A
+#define MAX6620_REG_DAC2	0x2C
+#define MAX6620_REG_DAC3	0x2E
+
+/*
+ * Config register bits
+ */
+
+#define MAX6620_CFG_RUN			0x80
+#define MAX6620_CFG_POR			0x40
+#define MAX6620_CFG_TIMEOUT		0x20
+#define MAX6620_CFG_FULLFAN		0x10
+#define MAX6620_CFG_OSC			0x08
+#define MAX6620_CFG_WD_MASK		0x06
+#define MAX6620_CFG_WD_2		0x02
+#define MAX6620_CFG_WD_6		0x04
+#define MAX6620_CFG_WD10		0x06
+#define MAX6620_CFG_WD			0x01
+
+
+/*
+ * Failure status register bits
+ */
+
+#define MAX6620_FAIL_TACH0	0x10
+#define MAX6620_FAIL_TACH1	0x20
+#define MAX6620_FAIL_TACH2	0x40
+#define MAX6620_FAIL_TACH3	0x80
+#define MAX6620_FAIL_MASK0	0x01
+#define MAX6620_FAIL_MASK1	0x02
+#define MAX6620_FAIL_MASK2	0x04
+#define MAX6620_FAIL_MASK3	0x08
+
+
+/* Minimum and maximum values of the FAN-RPM */
+#define FAN_RPM_MIN 240
+#define FAN_RPM_MAX 30000
+
+#define DIV_FROM_REG(reg) (1 << ((reg & 0xE0) >> 5))
+
+static int max6620_probe(struct i2c_client *client, const struct i2c_devic=
e_id *id);
+static int max6620_init_client(struct i2c_client *client);
+static int max6620_remove(struct i2c_client *client);
+static struct max6620_data *max6620_update_device(struct device *dev);
+
+static const u8 config_reg[] =3D {
+	MAX6620_REG_CONF_FAN0,
+	MAX6620_REG_CONF_FAN1,
+	MAX6620_REG_CONF_FAN2,
+	MAX6620_REG_CONF_FAN3,
+};
+
+static const u8 dyn_reg[] =3D {
+	MAX6620_REG_DYN_FAN0,
+	MAX6620_REG_DYN_FAN1,
+	MAX6620_REG_DYN_FAN2,
+	MAX6620_REG_DYN_FAN3,
+};
+
+static const u8 tach_reg[] =3D {
+	MAX6620_REG_TACH0,
+	MAX6620_REG_TACH1,
+	MAX6620_REG_TACH2,
+	MAX6620_REG_TACH3,
+};
+
+static const u8 volt_reg[] =3D {
+	MAX6620_REG_VOLT0,
+	MAX6620_REG_VOLT1,
+	MAX6620_REG_VOLT2,
+	MAX6620_REG_VOLT3,
+};
+
+static const u8 target_reg[] =3D {
+	MAX6620_REG_TAR0,
+	MAX6620_REG_TAR1,
+	MAX6620_REG_TAR2,
+	MAX6620_REG_TAR3,
+};
+
+static const u8 dac_reg[] =3D {
+	MAX6620_REG_DAC0,
+	MAX6620_REG_DAC1,
+	MAX6620_REG_DAC2,
+	MAX6620_REG_DAC3,
+};
+
+/*
+ * Driver data (common to all clients)
+ */
+
+static const struct i2c_device_id max6620_id[] =3D {
+	{ "max6620", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max6620_id);
+
+static struct i2c_driver max6620_driver =3D {
+	.class		=3D I2C_CLASS_HWMON,
+	.driver =3D {
+		.name	=3D "max6620",
+	},
+	.probe		=3D max6620_probe,
+	.remove		=3D __devexit_p(max6620_remove),
+	.id_table	=3D max6620_id,
+	.address_list	=3D normal_i2c,
+};
+
+/*
+ * Client data (each client gets its own)
+ */
+
+struct max6620_data {
+	struct device *hwmon_dev;
+	struct mutex update_lock;
+	int nr_fans;
+	char valid; /* zero until following fields are valid */
+	unsigned long last_updated; /* in jiffies */
+
+	/* register values */
+	u8 speed[4];
+	u8 config;
+	u8 fancfg[4];
+	u8 fandyn[4];
+	u8 tach[4];
+	u8 volt[4];
+	u8 target[4];
+	u8 dac[4];
+	u8 fault;
+};
+
+static ssize_t get_fan(struct device *dev, struct device_attribute *devatt=
r, char *buf) {
+
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct max6620_data *data =3D max6620_update_device(dev);
+	int rpm;
+
+	/*
+	 * Calculation details:
+	 *
+	 * Each tachometer counts over an interval given by the "count"
+	 * register (0.25, 0.5, 1 or 2 seconds). This module assumes
+	 * that the fans produce two pulses per revolution (this seems
+	 * to be the most common).
+	 */
+	if(data->tach[attr->index] =3D=3D 0 || data->tach[attr->index] =3D=3D 255=
) {
+		rpm =3D 0;
+	} else {
+		rpm =3D ((clock / (data->tach[attr->index] << 3)) * 30 * DIV_FROM_REG(da=
ta->fandyn[attr->index]));
+	}
+
+	return sprintf(buf, "%d\n", rpm);
+}
+
+static ssize_t get_target(struct device *dev, struct device_attribute *dev=
attr, char *buf) {
+
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct max6620_data *data =3D max6620_update_device(dev);
+	int kscale, ktach, rpm;
+
+	/*
+	 * Use the datasheet equation:
+	 *
+	 *    FanSpeed =3D KSCALE x fCLK / [256 x (KTACH + 1)]
+	 *
+	 * then multiply by 60 to give rpm.
+	 */
+
+	kscale =3D DIV_FROM_REG(data->fandyn[attr->index]);
+	ktach =3D data->target[attr->index];
+	if(ktach =3D=3D 0) {
+		rpm =3D 0;
+	} else {
+		rpm =3D ((60 * kscale * clock) / (ktach << 3));
+	}
+	return sprintf(buf, "%d\n", rpm);
+}
+
+static ssize_t set_target(struct device *dev, struct device_attribute *dev=
attr, const char *buf, size_t count) {
+
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct max6620_data *data =3D i2c_get_clientdata(client);
+	int kscale, ktach;
+	unsigned long rpm;
+	int err;
+
+	err =3D kstrtoul(buf, 10, &rpm);
+	if (err)
+		return err;
+
+	rpm =3D SENSORS_LIMIT(rpm, FAN_RPM_MIN, FAN_RPM_MAX);
+
+	/*
+	 * Divide the required speed by 60 to get from rpm to rps, then
+	 * use the datasheet equation:
+	 *
+	 *     KTACH =3D [(fCLK x KSCALE) / (256 x FanSpeed)] - 1
+	 */
+
+	mutex_lock(&data->update_lock);
+
+	kscale =3D DIV_FROM_REG(data->fandyn[attr->index]);
+	ktach =3D ((60 * kscale * clock) / rpm);
+	if (ktach < 0)
+		ktach =3D 0;
+	if (ktach > 255)
+		ktach =3D 255;
+	data->target[attr->index] =3D ktach;
+
+	i2c_smbus_write_byte_data(client, target_reg[attr->index], data->target[a=
ttr->index]);
+	i2c_smbus_write_byte_data(client, target_reg[attr->index]+0x01, 0x00);
+
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
+
+/*
+ * Get/set the fan speed in open loop mode using pwm1 sysfs file.
+ * Speed is given as a relative value from 0 to 255, where 255 is maximum
+ * speed. Note that this is done by writing directly to the chip's DAC,
+ * it won't change the closed loop speed set by fan1_target.
+ * Also note that due to rounding errors it is possible that you don't rea=
d
+ * back exactly the value you have set.
+ */
+
+static ssize_t get_pwm(struct device *dev, struct device_attribute *devatt=
r, char *buf) {
+
+	int pwm;
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct max6620_data *data =3D max6620_update_device(dev);
+
+	/*
+	 * Useful range for dac is 0-180 for 12V fans and 0-76 for 5V fans.
+	 * Lower DAC values mean higher speeds.
+	 */
+	pwm =3D ((int)data->volt[attr->index]);
+
+	if (pwm < 0)
+		pwm =3D 0;
+
+	return sprintf(buf, "%d\n", pwm);
+}
+
+static ssize_t set_pwm(struct device *dev, struct device_attribute *devatt=
r, const char *buf, size_t count) {
+
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct max6620_data *data =3D i2c_get_clientdata(client);
+	unsigned long pwm;
+	int err;
+
+	err =3D kstrtoul(buf, 10, &pwm);
+	if (err)
+		return err;
+
+	pwm =3D SENSORS_LIMIT(pwm, 0, 255);
+
+	mutex_lock(&data->update_lock);
+
+		data->dac[attr->index] =3D pwm;
+
+
+	i2c_smbus_write_byte_data(client, dac_reg[attr->index], data->dac[attr->i=
ndex]);
+	i2c_smbus_write_byte_data(client, dac_reg[attr->index]+1, 0x00);
+
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
+
+/*
+ * Get/Set controller mode:
+ * Possible values:
+ * 0 =3D Fan always on
+ * 1 =3D Open loop, Voltage is set according to speed, not regulated.
+ * 2 =3D Closed loop, RPM for all fans regulated by fan1 tachometer
+ */
+
+static ssize_t get_enable(struct device *dev, struct device_attribute *dev=
attr, char *buf) {
+
+	struct max6620_data *data =3D max6620_update_device(dev);
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	int mode =3D (data->fancfg[attr->index] & 0x80 ) >> 7;
+	int sysfs_modes[2] =3D {1, 2};
+
+	return sprintf(buf, "%d\n", sysfs_modes[mode]);
+}
+
+static ssize_t set_enable(struct device *dev, struct device_attribute *dev=
attr, const char *buf, size_t count) {
+
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct max6620_data *data =3D i2c_get_clientdata(client);
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	int max6620_modes[3] =3D {0, 1, 0};
+	unsigned long mode;
+	int err;
+
+	err =3D kstrtoul(buf, 10, &mode);
+	if (err)
+		return err;
+
+	if (mode > 2)
+		return -EINVAL;
+
+	mutex_lock(&data->update_lock);
+
+	data->fancfg[attr->index] =3D i2c_smbus_read_byte_data(client, config_reg=
[attr->index]);
+	data->fancfg[attr->index] =3D (data->fancfg[attr->index] & ~0x80)
+		       | (max6620_modes[mode] << 7);
+
+	i2c_smbus_write_byte_data(client, config_reg[attr->index], data->fancfg[a=
ttr->index]);
+
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
+
+/*
+ * Read/write functions for fan1_div sysfs file. The MAX6620 has no such
+ * divider. We handle this by converting between divider and counttime:
+ *
+ * (counttime =3D=3D k) <=3D=3D> (divider =3D=3D 2^k), k =3D 0, 1, 2, 3, 4=
 or 5
+ *
+ * Lower values of k allow to connect a faster fan without the risk of
+ * counter overflow. The price is lower resolution. You can also set count=
time
+ * using the module parameter. Note that the module parameter "prescaler" =
also
+ * influences the behaviour. Unfortunately, there's no sysfs attribute
+ * defined for that. See the data sheet for details.
+ */
+
+static ssize_t get_div(struct device *dev, struct device_attribute *devatt=
r, char *buf) {
+
+	struct max6620_data *data =3D max6620_update_device(dev);
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+
+	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fandyn[attr->index]));
+}
+
+static ssize_t set_div(struct device *dev, struct device_attribute *devatt=
r, const char *buf, size_t count) {
+
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct max6620_data *data =3D i2c_get_clientdata(client);
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	unsigned long div;
+	int err;
+	u8 div_bin;
+
+	err =3D kstrtoul(buf, 10, &div);
+	if (err)
+		return err;
+
+	mutex_lock(&data->update_lock);
+	switch (div) {
+	case 1:
+		div_bin =3D 0;
+		break;
+	case 2:
+		div_bin =3D 1;
+		break;
+	case 4:
+		div_bin =3D 2;
+		break;
+	case 8:
+		div_bin =3D 3;
+		break;
+	case 16:
+		div_bin =3D 4;
+		break;
+	case 32:
+		div_bin =3D 5;
+		break;
+	default:
+		mutex_unlock(&data->update_lock);
+		return -EINVAL;
+	}
+	data->fandyn[attr->index] &=3D 0x1F;
+	data->fandyn[attr->index] |=3D div_bin << 5;
+	i2c_smbus_write_byte_data(client, dyn_reg[attr->index], data->fandyn[attr=
->index]);
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
+
+/*
+ * Get alarm stati:
+ * Possible values:
+ * 0 =3D no alarm
+ * 1 =3D alarm
+ */
+
+static ssize_t get_alarm(struct device *dev, struct device_attribute *deva=
ttr, char *buf) {
+
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct max6620_data *data =3D max6620_update_device(dev);
+	struct i2c_client *client =3D to_i2c_client(dev);
+	int alarm =3D 0;
+
+	if (data->fault & (1 << attr->index)) {
+		mutex_lock(&data->update_lock);
+		alarm =3D 1;
+		data->fault &=3D ~(1 << attr->index);
+		data->fault |=3D i2c_smbus_read_byte_data(client,
+							MAX6620_REG_FAULT);
+		mutex_unlock(&data->update_lock);
+	}
+
+	return sprintf(buf, "%d\n", alarm);
+}
+
+static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan, NULL, 1);
+static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, get_fan, NULL, 2);
+static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, get_fan, NULL, 3);
+static SENSOR_DEVICE_ATTR(fan1_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 0);
+static SENSOR_DEVICE_ATTR(fan1_div, S_IWUSR | S_IRUGO, get_div, set_div, 0=
);
+// static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 0);
+static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 0);
+static SENSOR_DEVICE_ATTR(fan2_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 1);
+static SENSOR_DEVICE_ATTR(fan2_div, S_IWUSR | S_IRUGO, get_div, set_div, 1=
);
+// static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 1);
+static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 1);
+static SENSOR_DEVICE_ATTR(fan3_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 2);
+static SENSOR_DEVICE_ATTR(fan3_div, S_IWUSR | S_IRUGO, get_div, set_div, 2=
);
+// static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 2);
+static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 2);
+static SENSOR_DEVICE_ATTR(fan4_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 3);
+static SENSOR_DEVICE_ATTR(fan4_div, S_IWUSR | S_IRUGO, get_div, set_div, 3=
);
+// static SENSOR_DEVICE_ATTR(pwm4_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 3);
+static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 3);
+
+static struct attribute *max6620_attrs[] =3D {
+	&sensor_dev_attr_fan1_input.dev_attr.attr,
+	&sensor_dev_attr_fan2_input.dev_attr.attr,
+	&sensor_dev_attr_fan3_input.dev_attr.attr,
+	&sensor_dev_attr_fan4_input.dev_attr.attr,
+	&sensor_dev_attr_fan1_target.dev_attr.attr,
+	&sensor_dev_attr_fan1_div.dev_attr.attr,
+//	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
+	&sensor_dev_attr_pwm1.dev_attr.attr,
+	&sensor_dev_attr_fan2_target.dev_attr.attr,
+	&sensor_dev_attr_fan2_div.dev_attr.attr,
+//	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
+	&sensor_dev_attr_pwm2.dev_attr.attr,
+	&sensor_dev_attr_fan3_target.dev_attr.attr,
+	&sensor_dev_attr_fan3_div.dev_attr.attr,
+//	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
+	&sensor_dev_attr_pwm3.dev_attr.attr,
+	&sensor_dev_attr_fan4_target.dev_attr.attr,
+	&sensor_dev_attr_fan4_div.dev_attr.attr,
+//	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
+	&sensor_dev_attr_pwm4.dev_attr.attr,
+	NULL
+};
+
+static struct attribute_group max6620_attr_grp =3D {
+	.attrs =3D max6620_attrs,
+};
+
+
+/*
+ * Real code
+ */
+
+static int __devinit max6620_probe(struct i2c_client *client, const struct=
 i2c_device_id *id) {
+
+	struct max6620_data *data;
+	int err;
+
+	data =3D devm_kzalloc(&client->dev, sizeof(struct max6620_data), GFP_KERN=
EL);
+	if (!data) {
+		dev_err(&client->dev, "out of memory.\n");
+		return -ENOMEM;
+	}
+
+	i2c_set_clientdata(client, data);
+	mutex_init(&data->update_lock);
+	data->nr_fans =3D id->driver_data;
+
+	/*
+	 * Initialize the max6620 chip
+	 */
+	dev_info(&client->dev, "About to initialize module\n");
+
+	err =3D max6620_init_client(client);
+	if (err)
+		return err;
+	dev_info(&client->dev, "Module initialized\n");
+
+	err =3D sysfs_create_group(&client->dev.kobj, &max6620_attr_grp);
+	if (err)
+		return err;
+dev_info(&client->dev, "Sysfs entries created\n");
+
+	data->hwmon_dev =3D hwmon_device_register(&client->dev);
+	if (!IS_ERR(data->hwmon_dev))
+		return 0;
+
+	err =3D PTR_ERR(data->hwmon_dev);
+	dev_err(&client->dev, "error registering hwmon device.\n");
+
+	sysfs_remove_group(&client->dev.kobj, &max6620_attr_grp);
+	return err;
+}
+
+static int __devexit max6620_remove(struct i2c_client *client) {
+
+	struct max6620_data *data =3D i2c_get_clientdata(client);
+
+	hwmon_device_unregister(data->hwmon_dev);
+
+	sysfs_remove_group(&client->dev.kobj, &max6620_attr_grp);
+	return 0;
+}
+
+static int max6620_init_client(struct i2c_client *client) {
+
+	struct max6620_data *data =3D i2c_get_clientdata(client);
+	int config;
+	int err =3D -EIO;
+	int i;
+
+	config =3D i2c_smbus_read_byte_data(client, MAX6620_REG_CONFIG);
+
+	if (config < 0) {
+		dev_err(&client->dev, "Error reading config, aborting.\n");
+		return err;
+	}
+
+
+
+	if (i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config)) {
+		dev_err(&client->dev, "Config write error, aborting.\n");
+		return err;
+	}
+
+	data->config =3D config;
+	for (i =3D 0; i < 4; i++) {
+		data->fancfg[i] =3D i2c_smbus_read_byte_data(client, config_reg[i]);
+		data->fancfg[i] |=3D 0x80;		// enable TACH monitoring
+		i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
+		data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
+		data-> fandyn[i] |=3D 0x1C;
+		i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
+		data->tach[i] =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
+		data->volt[i] =3D i2c_smbus_read_byte_data(client, volt_reg[i]);
+		data->target[i] =3D i2c_smbus_read_byte_data(client, target_reg[i]);
+		data->dac[i] =3D i2c_smbus_read_byte_data(client, dac_reg[i]);
+
+
+
+	}
+
+
+
+	return 0;
+}
+
+
+
+
+static struct max6620_data *max6620_update_device(struct device *dev)
+{
+	int i;
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct max6620_data *data =3D i2c_get_clientdata(client);
+
+	mutex_lock(&data->update_lock);
+
+	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+
+		for (i =3D 0; i < 4; i++) {
+			data->fancfg[i] =3D i2c_smbus_read_byte_data(client, config_reg[i]);
+			data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
+			data->tach[i] =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
+			data->volt[i] =3D i2c_smbus_read_byte_data(client, volt_reg[i]);
+			data->target[i] =3D i2c_smbus_read_byte_data(client, target_reg[i]);
+			data->dac[i] =3D i2c_smbus_read_byte_data(client, dac_reg[i]);
+		}
+
+
+		/*
+		 * Alarms are cleared on read in case the condition that
+		 * caused the alarm is removed. Keep the value latched here
+		 * for providing the register through different alarm files.
+		 */
+		u8 fault_reg;
+		fault_reg =3D i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
+		data->fault |=3D (fault_reg >> 4) & (fault_reg & 0x0F);
+
+		data->last_updated =3D jiffies;
+		data->valid =3D 1;
+	}
+
+	mutex_unlock(&data->update_lock);
+
+	return data;
+}
+
+module_i2c_driver(max6620_driver);
+
+static int __init max6620_init(void)
+{
+	return i2c_add_driver(&max6620_driver);
+}
+module_init(max6620_init);
+
+/**
+ * sht21_init() - clean up driver
+ *
+ * Called when module is removed.
+ */
+static void __exit max6620_exit(void)
+{
+	i2c_del_driver(&max6620_driver);
+}
+module_exit(max6620_exit);
+
+MODULE_AUTHOR("Lucas Grunenberg");
+MODULE_DESCRIPTION("MAX6620 sensor driver");
+MODULE_LICENSE("GPL");
--=20
2.32.0

