Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A81C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 14:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7303560C3F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 14:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbhG1OMC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 10:12:02 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:27604 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235425AbhG1OMC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 10:12:02 -0400
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16SE21rg030466;
        Wed, 28 Jul 2021 10:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=Y2PhzpcrACtmmeT+sUlwL93KhZPpf747ZF19IgxH9pA=;
 b=yZZ2p/6KOL58LOk95aa+PFWRl11TilPTdRqxw9m1F0Y//mqfiaucZ53vlDHR32eNwgUn
 Pzl6ET6fNh4BxvrP3Ip6+Yaui9P/1KrE/iiHMEVfnCryAk7mKA8mXggB8HLi1UIOFmhA
 ZOwmWWCEYwUZJVluqI8BFnzl6ACDYzDqJPb0kCnBE9shkTY9yLtQChk5yGbKkW8Q03Kg
 W06JzlHa8iWG0wBEfL/zigrMUXFmEk/eEGCWR0vaxOBQH9QyytmZW0M8cBtsnQzWQHO5
 BiTRj7mok46W/3HlewFY0Mt+UuRxp8mvaSFFS/ozjTDoawE3NvFUGdjFN5P9BAqYguor lQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 3a235d7qu2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Jul 2021 10:11:45 -0400
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16SE9jnU002262;
        Wed, 28 Jul 2021 10:11:44 -0400
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
        by mx0a-00154901.pphosted.com with ESMTP id 3a2y90qwjn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jul 2021 10:11:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPqko/eemzkp8Fpl49h72aMZ0txuJPTJHEYKv9v+6htJFNgKY4FJW1Wk6pYeAG5FQa//Q3oXfpV41D3gu4KkqTxsP5qq/a1Hi/QAl7b0Pooyn7DjyVRhygtqmzjY/SYcWuXOHxLhXZBN7HuvWxA/hA833wop+cWMndsuCojNtDJ1zBbwNd6DTlxWarOjs4WU7hZb8ii6gJ6koAH9vPWf6dU4BcCvt+IKVKQcB+1kw4hy4tOa7YSLHQNsruSSAS8isJUnjo401gdy17S/YAjub8KlQXLzDvBBic6dbaCFYgZLD5nlBWa1lVfLW8afkE1FTikh0wwpKUe5wqf9KKvABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2PhzpcrACtmmeT+sUlwL93KhZPpf747ZF19IgxH9pA=;
 b=Kk7JObDePnqNP8l+MOM+uY2GR+Ngbw94T4Pdiimw+tmW860qLb/v0aoxIfolHDmdCZX4G1RyUcfLDPtma7rrZH0bKZ9R8gX2N76DjN/WzP+74wb9kQ0qep8XpmZRzmvWOhIXCKVik5+mjlYBJxdp8WxR66AsHGaoDQQ+foqgL2sgQN1IaMKNRHhPMoA1q/dtAJbNuTBuakqRktydfAiDUPlQytB/FIvSUr5Sz5JsK20HC9CxskAdXdYDM9hVVHfdYMa4fUDgaaeFDq1r2bPmnMu2OdJRKgiGBz0JhfUUg5k06VEt3H6N7x7k6JQ+xck+P63AvGyxkctFfTZvUv7/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MWHPR19MB1472.namprd19.prod.outlook.com (2603:10b6:300:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 14:11:42 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372%6]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 14:11:42 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Topic: [PATCH] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Index: AdeDt+t1X3U8Hvu4THqeATjI4c8YHQ==
Date:   Wed, 28 Jul 2021 14:11:41 +0000
Message-ID: <MW2PR1901MB20282D7F75F763C7FF997CAAA6EA9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-07-28T14:11:40.2648411Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=267a37e4-1bb6-4870-8b81-da60bd6e3115;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e9cd2e7-61d3-49ea-4436-08d951d19fcd
x-ms-traffictypediagnostic: MWHPR19MB1472:
x-microsoft-antispam-prvs: <MWHPR19MB14723595A889569BA815DFF0A6EA9@MWHPR19MB1472.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iSynIgCzGoSVGXSMnFTNN91Acms93brb8Jc7nk5pQyurqPnaazEl6ln31QDP1Anmx+suiRkENt6+uDqan5vxdy9JoeZgH0OKZWmcEAhAxg4hpZeH05rM908lFrsKLq+CI+iwL1EOrOm8cuh67LHVwtkCj+gw+wBRfo0cTjEbcFALwb7dfriU2F+jKkY4ewG5ob9kMgLU4Mxr75ML+r6t1rdCeoWHrwqmqmj37Epgm7i8f6XecH8j480V9eFPixDbAsv1mqsT+96Mbvb+/Kms06U1+G3PEt459EIeWornInRsvaewG6BEgnBzM313O8OfX/QR/6gyVkf7uZ7qu4oZYG0h4QcM4NEXEd5110rN3apfogMMQGu2fm+jgc7H0t1YlXuaYZfQg1eHGWuzTg6iK7KBXlQuTWP88Dt6U0Kkh/ky836cQZxOOp/n24vNKhtKGTNPbaEaLabZDdBBmI5aI8OBgqy7d/kdmEZMCeIxhisaynor1GthG5fYNbYWwKysc9GlM3xpfstxJvSLZzeAqxk2rybidvWDh/UyMWjmxngRO3uwxl2MEvXNWrP6KpFzSEXxQAj59pt0GDux0AxEoUQmfHbFn1kwuuxoPe6GgCF19Htq8VJi8jEzRoi46R3/9R9SBGRgkkebtBZ8kDet8Ggm/otc+FSm5iSzjm3O9NifLw8o8lQzgbVA0qNwvx/xfQVZ8FodwL+WvpnVM1OL86tsdliOFb3nHVRA54p97sz2ohhuCbQCGpBrlSTL/6uEpF2/b4ZchYMY/XbBVmL3eFh7cm8mfI+E28cMoOoaYNg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(2906002)(38100700002)(122000001)(7696005)(5660300002)(66476007)(6506007)(64756008)(52536014)(66556008)(66446008)(30864003)(8936002)(8676002)(316002)(786003)(9686003)(38070700005)(26005)(186003)(66946007)(76116006)(508600001)(4326008)(33656002)(86362001)(71200400001)(83380400001)(110136005)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9LydKl3WAV1LxJJq9Plh3O9qCDVR5BexmwkXuRIA0UucOVaAFhZ8ks34rkFg?=
 =?us-ascii?Q?4P2CdTHTwsuy85T+cTi5q4YC9cIRRRhxsyKnmw/0yKhcCBDF2m0lb/x4Fhdd?=
 =?us-ascii?Q?zbKjJire146wdZJzH79WInFbUmvFQKtTSTKOMF8+CR1LM6hX+HEQAyDjosQ7?=
 =?us-ascii?Q?lvI/l3nA30kMjowUdsfLQjDosL1bZq3/5LKb7BA0y4HzSrFVLlVi4iw8b0fL?=
 =?us-ascii?Q?alsv5TyFqKA5xaY9iJG+h1Z3i0kS33UycKT7gWv3BS6ijW1GssmlxAdgZyzC?=
 =?us-ascii?Q?T5xIbgheA03FqJLGc9MEhPiR7QmYsle09+ObEohtSQdDXkP03/HSG1kPlfCY?=
 =?us-ascii?Q?CEd4tbgCC+uKu9AGE5ud37polPZ/4lYZT1SfJ5GJQsUhCk5DyFD3LsLxmvDQ?=
 =?us-ascii?Q?wusdYC/2FKC8L+nSszPsFsXB1j4hAu1G8BbVgfITEofGR12Uvbvvj31JaMK8?=
 =?us-ascii?Q?49CZAOZMHI8xwAh5Clxr40AdaVxhxx6NYFRXQq96APU3ra/EMfJbOendKfXH?=
 =?us-ascii?Q?8MqCkWLOFFSkEyNiLU6G/LsWexXJAT4SeCvA2WzYG3mYgTLotWywPAWozNAA?=
 =?us-ascii?Q?RLkd0CCO/gAViayM20P6wRAh8FOzcPyn7YsibfYURmYoniD9kYT+J15qud+S?=
 =?us-ascii?Q?TAD/2E/EbmrKUU5Lrfha0VYQGbETBMcqaYhlMvqFqS8x4OSk7qqFRvg6BRiH?=
 =?us-ascii?Q?BAFc8sxu+B4OXcjUWfu9HUfNQCsDp+MeiCnuYj+d6IF6R7XF9BPHxzCyBc7+?=
 =?us-ascii?Q?utuiHywmfWxc9RTKT4FDDH+sD07/0082/H8NGeKLlLkfOILoWeZS5NkInDPM?=
 =?us-ascii?Q?DjO2t8tJdGclu19HnhAT7iwaSDRZ0erk1RQSYiyzJhYrF9u7DhMW4sITJQEq?=
 =?us-ascii?Q?GjUEgqUUBrE9BDsSU9KuOWJhLqRr1aR8BQM6lGzFpOgqjoB2MqF+aCsDhti2?=
 =?us-ascii?Q?+fsrxVEDP3+YA9Uzjkj8mRbHp51uTg7JdmAFnj6o7Tvs9Ay1beUwSa4zsIHl?=
 =?us-ascii?Q?CROpC8gI1cQOoaKQ0ASONKprRZRYzeiC52nhOO6qiWayk/ybqaqRI/33xNxt?=
 =?us-ascii?Q?qCyIxlHoK93+V33cC8AzAInx7YtzwWqxT1oSSLvYOBk34+iC5q2Zk4TevvqS?=
 =?us-ascii?Q?EOY/TpK0FPxnrh7/rCzqome2tykmjEEz6s83Z0FYVbEJzQtn1GBZ91vuZuF5?=
 =?us-ascii?Q?iUIcPJdm0XqSqBPm4l36BFfda9TMRyxKYwIyYTlSt2/wVQVKMIsdBp4uNQU3?=
 =?us-ascii?Q?m7SYM+4XHjEEA0+V8jCzU+KiRgk4gB8dtIfkpbXKFoi9scSS7LPZi+PLTKXR?=
 =?us-ascii?Q?dCLZdjRlw/KBsxjWQOOJXBUA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9cd2e7-61d3-49ea-4436-08d951d19fcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 14:11:41.9960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9CqBRZqmcnVYyThCxstIg1oXc0rWI+3lUOrAko/wZVaRPcOZ7SoGhgkkJO9kBRVG0e2mRInEIp/AUmPenPk8H+zY8vJC7rBn2JjG/rblB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1472
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-28_08:2021-07-27,2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280080
X-Proofpoint-GUID: ojO9Up-8rEu3nJKFJjrKcvQ4BUIYNmB0
X-Proofpoint-ORIG-GUID: ojO9Up-8rEu3nJKFJjrKcvQ4BUIYNmB0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280079
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>

Add hardware monitoring driver for Maxim MAX6620 Fan controller

Originally-from: L. Grunenberg <contact@lgrunenberg.de>
Originally-from: Cumulus Networks <support@cumulusnetworks.com>
Originally-from: Shuotian Cheng <shuche@microsoft.com>
Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
---
 drivers/hwmon/Kconfig   |  10 +
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/max6620.c | 464 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 475 insertions(+)
 create mode 100644 drivers/hwmon/max6620.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e3675377bc5d..7bb2fbd72db4 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1022,6 +1022,16 @@ config SENSORS_MAX31730
 	  This driver can also be built as a module. If so, the module
 	  will be called max31730.
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
 config SENSORS_MAX6621
 	tristate "Maxim MAX6621 sensor chip"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d712c61c1f5e..9e50ff903931 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+=3D max1668.o
 obj-$(CONFIG_SENSORS_MAX197)	+=3D max197.o
 obj-$(CONFIG_SENSORS_MAX31722)	+=3D max31722.o
 obj-$(CONFIG_SENSORS_MAX31730)	+=3D max31730.o
+obj-$(CONFIG_SENSORS_MAX6620)	+=3D max6620.o
 obj-$(CONFIG_SENSORS_MAX6621)	+=3D max6621.o
 obj-$(CONFIG_SENSORS_MAX6639)	+=3D max6639.o
 obj-$(CONFIG_SENSORS_MAX6642)	+=3D max6642.o
diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
new file mode 100644
index 000000000000..05f6fdc80343
--- /dev/null
+++ b/drivers/hwmon/max6620.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
+#define MAX6620_CFG_RUN		0x80
+#define MAX6620_CFG_POR		0x40
+#define MAX6620_CFG_TIMEOUT	0x20
+#define MAX6620_CFG_FULLFAN	0x10
+#define MAX6620_CFG_OSC		0x08
+#define MAX6620_CFG_WD_MASK	0x06
+#define MAX6620_CFG_WD_2	0x02
+#define MAX6620_CFG_WD_6	0x04
+#define MAX6620_CFG_WD10	0x06
+#define MAX6620_CFG_WD		0x01
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
+/*
+ * Insmod parameters
+ */
+
+
+/* clock: The clock frequency of the chip the driver should assume */
+static int clock =3D 8192;
+static u32 np =3D 2;
+
+module_param(clock, int, 0444);
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
+static const u8 target_reg[] =3D {
+	MAX6620_REG_TAR0,
+	MAX6620_REG_TAR1,
+	MAX6620_REG_TAR2,
+	MAX6620_REG_TAR3,
+};
+
+/*
+ * Client data (each client gets its own)
+ */
+
+struct max6620_data {
+	struct i2c_client *client;
+	struct mutex update_lock;
+	char valid; /* zero until following fields are valid */
+	unsigned long last_updated; /* in jiffies */
+
+	/* register values */
+	u8 config;
+	u8 fancfg[4];
+	u8 fandyn[4];
+	u8 fault;
+	u16 tach[4];
+	u16 target[4];
+};
+
+static u8 max6620_fan_div_from_reg(u8 val)
+{
+	return 1 << ((val & 0xE0) >> 5);
+}
+
+static struct max6620_data *max6620_update_device(struct device *dev)
+{
+	struct max6620_data *data =3D dev_get_drvdata(dev);
+	struct i2c_client *client =3D data->client;
+	int i;
+	u8 fault_reg, regval1, regval2;
+
+	mutex_lock(&data->update_lock);
+
+	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+
+		for (i =3D 0; i < 4; i++) {
+			data->fancfg[i] =3D i2c_smbus_read_byte_data(client, config_reg[i]);
+			data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
+			regval1 =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
+			regval2 =3D i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
+			data->tach[i] =3D ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
+			regval1 =3D i2c_smbus_read_byte_data(client, target_reg[i]);
+			regval2 =3D i2c_smbus_read_byte_data(client, target_reg[i] + 1);
+			data->target[i] =3D ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
+		}
+
+
+		/*
+		 * Alarms are cleared on read in case the condition that
+		 * caused the alarm is removed. Keep the value latched here
+		 * for providing the register through different alarm files.
+		 */
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
+static umode_t
+max6620_is_visible(const void *data, enum hwmon_sensor_types type, u32 att=
r,
+		   int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_alarm:
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_div:
+		case hwmon_fan_target:
+			return 0644;
+		default:
+			break;
+		}
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int
+max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	     int channel, long *val)
+{
+	struct max6620_data *data =3D max6620_update_device(dev);
+	int alarm =3D 0;
+	u8 div;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_alarm:
+			mutex_lock(&data->update_lock);
+			if (data->fault & (1 << channel))
+				alarm =3D 1;
+
+			mutex_unlock(&data->update_lock);
+			*val =3D alarm;
+
+			break;
+		case hwmon_fan_div:
+			*val =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+			break;
+		case hwmon_fan_input:
+			if (data->tach[channel] =3D=3D 0)
+				*val =3D 0;
+			else {
+				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+				*val =3D (60 * div * clock)/(data->tach[channel] * np);
+			}
+			break;
+		case hwmon_fan_target:
+			if (data->target[channel] =3D=3D 0)
+				*val =3D 0;
+			else {
+				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+				*val =3D (60 * div * clock)/(data->target[channel] * np);
+			}
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int
+max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	      int channel, long val)
+{
+	struct max6620_data *data =3D dev_get_drvdata(dev);
+	struct i2c_client *client =3D data->client;
+	u8 div;
+	u16 tach;
+	u8 val1;
+	u8 val2;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_div:
+			mutex_lock(&data->update_lock);
+			switch (val) {
+			case 1:
+				div =3D 0;
+				break;
+			case 2:
+				div =3D 1;
+				break;
+			case 4:
+				div =3D 2;
+				break;
+			case 8:
+				div =3D 3;
+				break;
+			case 16:
+				div =3D 4;
+				break;
+			case 32:
+				div =3D 5;
+				break;
+			default:
+				mutex_unlock(&data->update_lock);
+				return -EINVAL;
+			}
+			data->fandyn[channel] &=3D 0x1F;
+			data->fandyn[channel] |=3D div << 5;
+			i2c_smbus_write_byte_data(client, dyn_reg[channel],
+						  data->fandyn[channel]);
+			mutex_unlock(&data->update_lock);
+
+			break;
+		case hwmon_fan_target:
+			val =3D clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
+			mutex_lock(&data->update_lock);
+
+			div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+			tach =3D (60 * div * clock)/(val * np);
+			val1 =3D (tach >> 3) & 0xff;
+			val2 =3D (tach << 5) & 0xe0;
+			i2c_smbus_write_byte_data(client, target_reg[channel], val1);
+			i2c_smbus_write_byte_data(client, target_reg[channel] + 1, val2);
+
+			/* Setting TACH count re-enables fan fault detection */
+			data->fault &=3D ~(1 << channel);
+
+			mutex_unlock(&data->update_lock);
+
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static const u32 max6620_fan_config[] =3D {
+	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
+	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
+	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
+	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
+	0
+};
+
+static const struct hwmon_channel_info max6620_fan =3D {
+	.type =3D hwmon_fan,
+	.config =3D max6620_fan_config,
+};
+
+static const struct hwmon_channel_info *max6620_info[] =3D {
+	&max6620_fan,
+	NULL
+};
+
+static const struct hwmon_ops max6620_hwmon_ops =3D {
+	.read =3D max6620_read,
+	.write =3D max6620_write,
+	.is_visible =3D max6620_is_visible,
+};
+
+static const struct hwmon_chip_info max6620_chip_info =3D {
+	.ops =3D &max6620_hwmon_ops,
+	.info =3D max6620_info,
+};
+
+static int max6620_init_client(struct i2c_client *client)
+{
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
+	/*
+	 * Set bit 4, disable other fans from going full speed on a fail
+	 * failure.
+	 */
+	if (i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | 0x10))=
 {
+		dev_err(&client->dev, "Config write error, aborting.\n");
+		return err;
+	}
+
+	data->config =3D config;
+	for (i =3D 0; i < 4; i++) {
+		data->fancfg[i] =3D i2c_smbus_read_byte_data(client, config_reg[i]);
+		/* Enable RPM mode */
+		data->fancfg[i] |=3D 0xa8;
+		i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
+		data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
+		/* 2 counts (001) and Rate change 100 (0.125 secs) */
+		data->fandyn[i] =3D 0x30;
+		i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
+	}
+	return 0;
+}
+
+static int max6620_probe(struct i2c_client *client)
+{
+	struct device *dev =3D &client->dev;
+	struct max6620_data *data;
+	struct device *hwmon_dev;
+	int err;
+
+	data =3D devm_kzalloc(dev, sizeof(struct max6620_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, data);
+	data->client =3D client;
+	mutex_init(&data->update_lock);
+
+	/*
+	 * Initialize the max6620 chip
+	 */
+	err =3D max6620_init_client(client);
+	if (err)
+		return err;
+
+	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &max6620_chip_info,
+							 NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
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
+	.probe_new	=3D max6620_probe,
+	.id_table	=3D max6620_id,
+};
+
+module_i2c_driver(max6620_driver);
+
+MODULE_AUTHOR("Lucas Grunenberg");
+MODULE_DESCRIPTION("MAX6620 sensor driver");
+MODULE_LICENSE("GPL");

base-commit: ff1176468d368232b684f75e82563369208bc371
--=20
2.32.0

