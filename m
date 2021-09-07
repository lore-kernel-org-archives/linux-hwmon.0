Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F98C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9FBD60EE6
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344558AbhIGM3p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:29:45 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:4552 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344594AbhIGM3o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 08:29:44 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 187CNVq2010863;
        Tue, 7 Sep 2021 08:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=dZ8Osqn8WShUbmzMUeme6Hkne0YzV6AYNEBTPItAFz0=;
 b=lE16FMmolWNYO4iJRWzblCDEGaIeOxqykXUGFP9Yva49jOLZehCl4p2/qvXBpa1kOvBX
 lZIoPaP50O7pxOHt6oscUufVU1AkG3ZvjyClG1WJYz/G2Q513CTHTnL8TEBjvPb6HhhH
 rh2UQkmivRA5ZoEa2jy7Nng0uOUueSQz8azXMbJq6i+pVO3dh2ft6/JTcTplgHmZE2uc
 oD1kRarp/2fIEGOcchZGd3yuOq54JOLIjtHYL2ViI7YpQc/ZRGmcmlpZiIJHs5G3HXEp
 nG6Mr6mi0xyLq83KXkroPE/rLSwivawnkKvKtmEekn++CJY6IUl5Pa5D1fyMzsaJ85Qz ow== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 3awfm5mqbr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Sep 2021 08:28:21 -0400
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 187CG3tq048574;
        Tue, 7 Sep 2021 08:28:20 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        by mx0a-00154901.pphosted.com with ESMTP id 3avpcmb9cg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Sep 2021 08:28:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B51+ob7TFEbeQXsJ9hUUprVTluyVvDAGgrKJamP8Emm/gj0t+hJO1X4HnSDw6NkkFl4dbnQLSWBfpOmIEDp7rjJeD4h9vhNFpDlLAZ/ZbA7nzTTTr2l/m6EwITR3/GqBSVHgwP4TOtGNOoLlr8yIHi5lX7zlP6ZhAPT46+6ViKFW/3RV7v8fxyFcJAJrg56D58H+sy8za90ci+ec5C5zGQK+mntJY9QEDyHWTovJYvbDqz4MLaebG5k0hWMBMHZuUjIZzgdOL0wG+bZWM2rZNKDDs9P1j7uP3xje6i4+Vp0ml6WQTzi0c/BnigarfKBevUHjKOmrMSebbQZfhDKtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dZ8Osqn8WShUbmzMUeme6Hkne0YzV6AYNEBTPItAFz0=;
 b=F37yWdp1Y3x+8ckZccQMYMkbSJ8M/97RJK5FIdfuwNP6XtPvXwYNnS3d7DUkrSTbB3cOIRf5wGcbaZrEBi7dQCGGvNR5dWdTL7qyYT0aDMuXdpG/xOTJRFp67oIUsqS94RYbBTovXaNwN+IIl5tFUDfmYYO1m834+wkN3mnoNee0hUTnJkFZvjg89cRt5kDB0ARPZn/EXiAyQj7SBE9vCoq/mDxY+TPEkMdTM6RNnZlQLhyCrxXnn2qGsFiEE9BqWsp4j/tNrg3+gERmOcLhs/2lO9koxlDxCw6LAUoos/yCBy8EisRPcpimEVLyKTtNOvGMkhAN8Ujrexk7nWfn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM5PR1901MB2023.namprd19.prod.outlook.com (2603:10b6:4:a6::27)
 by DM5PR19MB1481.namprd19.prod.outlook.com (2603:10b6:3:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 12:28:19 +0000
Received: from DM5PR1901MB2023.namprd19.prod.outlook.com
 ([fe80::7048:75db:a4b5:4272]) by DM5PR1901MB2023.namprd19.prod.outlook.com
 ([fe80::7048:75db:a4b5:4272%5]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 12:28:19 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v4] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Topic: [PATCH v4] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Index: Adej4qMG9+8kbOEJQ+WLnEyKvWz//g==
Date:   Tue, 7 Sep 2021 12:28:19 +0000
Message-ID: <DM5PR1901MB2023D0270020469F854E879DA6D39@DM5PR1901MB2023.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-09-07T12:28:15.7161147Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=4ea33b15-718e-4fa1-8564-9fabaa82fea5;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4dcade01-2f7e-446b-6e2b-08d971faf97a
x-ms-traffictypediagnostic: DM5PR19MB1481:
x-microsoft-antispam-prvs: <DM5PR19MB14813710700290A6B6A4DFE3A6D39@DM5PR19MB1481.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mezCAdmREh6ObrUYgIHXjamFym7GNjS88Y/s0XkKIDJ7LYjHAHUhTk677R45vMN2u+KORkVb1E4sdxs0RypF8dxY6XNDMQr7uVzTnnBldIsor7ePuj1OC3J8ByDmWL8vgSfNowjKNeWUQSRkFoQ5KmeBkPPEi9uToHOTE5YIepOPhpmRFJSuOu2mf4fH1dTEEIh29NjY6pfiMTb85d5v+gyJs3qaf/sXHZ5FLQ5T2cLzgEp19EjZeS3KMu9Ev9MbSdmZo5ous26gc4mEWVQmWFbTr7K9rU7AKNIggk9ygiZmhTVobhr6B6QrwrR4ayQp2u0TkSx28MJBmaY9qguAyJfgHy0CDvwl5JJfO8sjS6kMi1OnSiB817uCpQ87ktWJrD8q1t4jCRTaIZ+QaVfVqxsJr4/Hv1hwEKBV/XLjwFdsHaA9++09H321WcMF/j8yUdYK7gq72MDEAu2KvLUvkuW53NyoiGzxKaQWJPObUR2IdzFKYiUMuoVG38IdDzH+EKpvZIPm4ovneYpBILZoa63PPr8YgUruHGn7103BWuYBfGbMzuhws/8A3FZzMZNNizqV8iUxZVg8W8phsvLbOYvbXGk/PkQ0d1GPkxYIPJS4jlEp7oc3Ju0gixKP1qtfXZjjKpLeP10W0PJdqKabsAXYrraPi/X77ES0JC7b7+0VSJaFpUWilDp2hykuSsZPAr3yRh0kP3goLeB8lhHYuiZPtg2FI8E8h0IPW+qcNXXCVSolU24sAAKeKFWG8LjgzJc/UoA8MrNqukNznfE93q6/e/5c+CMwvNc+KPgHGWc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1901MB2023.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(9686003)(66556008)(66476007)(6506007)(110136005)(38070700005)(8676002)(66446008)(26005)(76116006)(508600001)(66946007)(316002)(5660300002)(7696005)(966005)(52536014)(30864003)(38100700002)(55016002)(8936002)(122000001)(83380400001)(86362001)(33656002)(71200400001)(2906002)(4326008)(186003)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GoTqilL6Q9vssSzLCd1rM63oSE8Dzn2lWUwQ1qnV1xFUVq36cQukFwVvkwaE?=
 =?us-ascii?Q?VIQqTK65JPtTM4MRlB2owlxCktIp0qbzE6dxdGWBWOOWInOZmtrxa6DFbUZY?=
 =?us-ascii?Q?bJedCwFhNz4j/43+NITvItrb2/lcRZ02qGvrhIvbMZyRK2aZOgMcR4/yWLEH?=
 =?us-ascii?Q?dOrSdLd3xaKGY7AuX1Vk4KXj6A0YgAtAozcE5TJvDxKl7OImunC9OFFhMN8I?=
 =?us-ascii?Q?d4Kz0Ihl3UhkFP6xTEJ2oLNguiOGK/fKzikU5wAKGVWoafF2CinvtuDbxTM6?=
 =?us-ascii?Q?HNi4imj9rqlkrtXCNWEr3ogfBmRLDc6zYTWx9wNUoIH2026Cz0EDFHyAhWQr?=
 =?us-ascii?Q?SMJUJ6QJDgzULxy7cOcCT3MU4C8kF6u8yd7KevEBXurAwIGEqb0Wb2Q+yyJI?=
 =?us-ascii?Q?OI1yYzy03w3hPCXgSlGiauwuwxNVJ8Ps1lOf5bZL78xkDUsn+d4s1RT5x/LG?=
 =?us-ascii?Q?aKnMio7rE5i2lHtjaBreyxWjqlwze231gEhRr4wTW4Zt3ZEGke9Kz+Wlgo6t?=
 =?us-ascii?Q?UzofOdKnVrm0/gPd/VKaVg1uZSgkQg+tU617T7rgQfa2ZaUnjEFwAb//xEVS?=
 =?us-ascii?Q?sLzRnwOtu7MLfY/tBNIbUMY8E1RqyTX5yqVWIOyPSCWH89qQYABsX3yyc7Rh?=
 =?us-ascii?Q?yBHozyDtZYZ/KBD66Bm0LeKj6qmv8IFFdqHlgDocySj/saOk7OFBvpqK8POF?=
 =?us-ascii?Q?5n43JNoWK/MMuKnStu2cEGv3hplEQBT38DF/jnuyoIbr1JsBO/KwL+G/mRjH?=
 =?us-ascii?Q?Wsmf07PtrL2SIfIKyfcTWct7Pc4GbmygqrI66CpHJN1yDS7T/OPMRdgXPsQo?=
 =?us-ascii?Q?U4norlIXQfWpWisuq2IP0iE7Tq32FBVR0CwOlqAL7H7udVaNrqYx/KExGzPi?=
 =?us-ascii?Q?g2tv8rp+7yc4TpP3/BmB+PhLgIihJccxrI+7gGgzKmTMLZSk+3r2JMQJv+xy?=
 =?us-ascii?Q?ctzfpl3avsPamsESQ+lzqbXABff/AXxRGjrhMMRupYUErHExrPcU5pB8gQ3r?=
 =?us-ascii?Q?FvX+R/MhbqZFpvrBszO4nmAezNbwzdVFn48z90QtZImf3ZC9wvfhPddLzVpz?=
 =?us-ascii?Q?hg527ViUSMYQawRXl3hn/i6RtvgECa5PrbFY1V8b9segfl2GzTyqxThBBpYo?=
 =?us-ascii?Q?WM/MgWo68QbBcBb+yTCm6JC7/0RrJhmCi4qdQi6l8oU0W64LBw7w8epXUrWc?=
 =?us-ascii?Q?/FMEqpJYvYl/t0p/k6WkA+sPskD0n9n7dmAQnvcHzINxqrB6q9nO5urHXYYs?=
 =?us-ascii?Q?4UExU5we/Wkn+1hg45lc2ClbcyBEiomNXw4sGlFT1HOsJKOClqaQtqEP/uSi?=
 =?us-ascii?Q?BWqLK1i78YhEMY3R0HsVPgST?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1901MB2023.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcade01-2f7e-446b-6e2b-08d971faf97a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 12:28:19.0399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KBtpLst1iyxrgKSS9qfqCTFoWP/G7Yw3WiolkfZ0D+wbAUJj+P6iO1s/mcfFHLdX5uZtwTr3C8WO6hAq6To4mK99hC1ojNTHXsepwMV1ejs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1481
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-09-07_04:2021-09-07,2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109070081
X-Proofpoint-GUID: HsIBQhsH2f4FelzDrQWzL8P24uqwJadD
X-Proofpoint-ORIG-GUID: HsIBQhsH2f4FelzDrQWzL8P24uqwJadD
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070081
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

Changelog:
- Add max6620 in Documentation/hwmon/index.rst.
- Update copyright statement in max6620.c
- Move update_lock to enclose complete fan*_alarm read.
- Remove unnecessary initialization of ret in max6620_read and
   max6620_write.

 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/max6620.rst |  46 +++
 drivers/hwmon/Kconfig           |  10 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/max6620.c         | 510 ++++++++++++++++++++++++++++++++
 5 files changed, 568 insertions(+)
 create mode 100644 Documentation/hwmon/max6620.rst
 create mode 100644 drivers/hwmon/max6620.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index bc01601ea81a..2bd8761326c2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -129,6 +129,7 @@ Hardware Monitoring Kernel Drivers
    max31785
    max31790
    max34440
+   max6620
    max6639
    max6642
    max6650
diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max6620.=
rst
new file mode 100644
index 000000000000..84c1c44d3de4
--- /dev/null
+++ b/Documentation/hwmon/max6620.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver max6620
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Supported chips:
+
+    Maxim MAX6620
+
+    Prefix: 'max6620'
+
+    Addresses scanned: none
+
+    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
+
+Authors:
+    - L\. Grunenberg <contact@lgrunenberg.de>
+    - Cumulus Networks <support@cumulusnetworks.com>
+    - Shuotian Cheng <shuche@microsoft.com>
+    - Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
+
+Description
+-----------
+
+This driver implements support for Maxim MAX6620 fan controller.
+
+The driver configures the fan controller in RPM mode. To give the readings=
 more
+range or accuracy, the desired value can be set by a programmable register
+(1, 2, 4, 8, 16 or 32). Set higher values for larger speeds.
+
+The driver provides the following sensor access in sysfs:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+fan[1-4]_alarm   ro      Fan alarm.
+fan[1-4]_div     rw      Sets the nominal RPM range of the fan. Valid valu=
es
+                         are 1, 2, 4, 8, 16 and 32.
+fan[1-4]_input   ro      Fan speed in RPM.
+fan[1-4]_target  rw      Desired fan speed in RPM.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+Usage notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst=
 for
+details.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e3675377bc5d..74811fbaa266 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1022,6 +1022,16 @@ config SENSORS_MAX31730
 	  This driver can also be built as a module. If so, the module
 	  will be called max31730.
=20
+config SENSORS_MAX6620
+	tristate "Maxim MAX6620 fan controller"
+	depends on I2C
+	help
+	  If you say yes here you get support for the MAX6620
+	  fan controller.
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
index 000000000000..1f645282ce8e
--- /dev/null
+++ b/drivers/hwmon/max6620.c
@@ -0,0 +1,510 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Maxim MAX6620
+ *
+ * Originally from L. Grunenberg.
+ * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
+ *
+ * Copyright (c) 2021 Dell Inc. or its subsidiaries. All Rights Reserved.
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
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/slab.h>
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
+#define MAX6620_CFG_RUN		BIT(7)
+#define MAX6620_CFG_POR		BIT(6)
+#define MAX6620_CFG_TIMEOUT	BIT(5)
+#define MAX6620_CFG_FULLFAN	BIT(4)
+#define MAX6620_CFG_OSC		BIT(3)
+#define MAX6620_CFG_WD_MASK	(BIT(2) | BIT(1))
+#define MAX6620_CFG_WD_2	BIT(1)
+#define MAX6620_CFG_WD_6	BIT(2)
+#define MAX6620_CFG_WD10	(BIT(2) | BIT(1))
+#define MAX6620_CFG_WD		BIT(0)
+
+/*
+ * Failure status register bits
+ */
+
+#define MAX6620_FAIL_TACH0	BIT(4)
+#define MAX6620_FAIL_TACH1	BIT(5)
+#define MAX6620_FAIL_TACH2	BIT(6)
+#define MAX6620_FAIL_TACH3	BIT(7)
+#define MAX6620_FAIL_MASK0	BIT(0)
+#define MAX6620_FAIL_MASK1	BIT(1)
+#define MAX6620_FAIL_MASK2	BIT(2)
+#define MAX6620_FAIL_MASK3	BIT(3)
+
+#define MAX6620_CLOCK_FREQ	8192 /* Clock frequency in Hz */
+#define MAX6620_PULSE_PER_REV	2 /* Tachometer pulses per revolution */
+
+/* Minimum and maximum values of the FAN-RPM */
+#define FAN_RPM_MIN	240
+#define FAN_RPM_MAX	30000
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
+	bool valid; /* false until following fields are valid */
+	unsigned long last_updated; /* in jiffies */
+
+	/* register values */
+	u8 fancfg[4];
+	u8 fandyn[4];
+	u8 fault;
+	u16 tach[4];
+	u16 target[4];
+};
+
+static u8 max6620_fan_div_from_reg(u8 val)
+{
+	return BIT((val & 0xE0) >> 5);
+}
+
+static u16 max6620_fan_rpm_to_tach(u8 div, int rpm)
+{
+	return (60 * div * MAX6620_CLOCK_FREQ) / (rpm * MAX6620_PULSE_PER_REV);
+}
+
+static int max6620_fan_tach_to_rpm(u8 div, u16 tach)
+{
+	return (60 * div * MAX6620_CLOCK_FREQ) / (tach * MAX6620_PULSE_PER_REV);
+}
+
+static int max6620_update_device(struct device *dev)
+{
+	struct max6620_data *data =3D dev_get_drvdata(dev);
+	struct i2c_client *client =3D data->client;
+	int i;
+	int ret =3D 0;
+
+	mutex_lock(&data->update_lock);
+
+	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+		for (i =3D 0; i < 4; i++) {
+			ret =3D i2c_smbus_read_byte_data(client, config_reg[i]);
+			if (ret < 0)
+				goto error;
+			data->fancfg[i] =3D ret;
+
+			ret =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
+			if (ret < 0)
+				goto error;
+			data->fandyn[i] =3D ret;
+
+			ret =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
+			if (ret < 0)
+				goto error;
+			data->tach[i] =3D (ret << 3) & 0x7f8;
+			ret =3D i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
+			if (ret < 0)
+				goto error;
+			data->tach[i] |=3D (ret >> 5) & 0x7;
+
+			ret =3D i2c_smbus_read_byte_data(client, target_reg[i]);
+			if (ret < 0)
+				goto error;
+			data->target[i] =3D (ret << 3) & 0x7f8;
+			ret =3D i2c_smbus_read_byte_data(client, target_reg[i] + 1);
+			if (ret < 0)
+				goto error;
+			data->target[i] |=3D (ret >> 5) & 0x7;
+		}
+
+		/*
+		 * Alarms are cleared on read in case the condition that
+		 * caused the alarm is removed. Keep the value latched here
+		 * for providing the register through different alarm files.
+		 */
+		ret =3D i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
+		if (ret < 0)
+			goto error;
+		data->fault |=3D (ret >> 4) & (ret & 0x0F);
+
+		data->last_updated =3D jiffies;
+		data->valid =3D true;
+	}
+
+error:
+	mutex_unlock(&data->update_lock);
+	return ret;
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
+	struct max6620_data *data;
+	struct i2c_client *client;
+	int ret;
+	u8 div;
+	u8 val1;
+	u8 val2;
+
+	ret =3D max6620_update_device(dev);
+	if (ret < 0)
+		return ret;
+	data =3D dev_get_drvdata(dev);
+	client =3D data->client;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_alarm:
+			mutex_lock(&data->update_lock);
+			*val =3D !!(data->fault & BIT(channel));
+
+			/* Setting TACH count to re-enable fan fault detection */
+			if (*val =3D=3D 1) {
+				val1 =3D (data->target[channel] >> 3) & 0xff;
+				val2 =3D (data->target[channel] << 5) & 0xe0;
+				ret =3D i2c_smbus_write_byte_data(client,
+								target_reg[channel], val1);
+				if (ret < 0)
+					return ret;
+				ret =3D i2c_smbus_write_byte_data(client,
+								target_reg[channel] + 1, val2);
+				if (ret < 0)
+					return ret;
+
+				data->fault &=3D ~BIT(channel);
+			}
+			mutex_unlock(&data->update_lock);
+
+			break;
+		case hwmon_fan_div:
+			*val =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+			break;
+		case hwmon_fan_input:
+			if (data->tach[channel] =3D=3D 0) {
+				*val =3D 0;
+			} else {
+				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+				*val =3D max6620_fan_tach_to_rpm(div, data->tach[channel]);
+			}
+			break;
+		case hwmon_fan_target:
+			if (data->target[channel] =3D=3D 0) {
+				*val =3D 0;
+			} else {
+				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+				*val =3D max6620_fan_tach_to_rpm(div, data->target[channel]);
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
+	struct max6620_data *data;
+	struct i2c_client *client;
+	int ret;
+	u8 div;
+	u16 tach;
+	u8 val1;
+	u8 val2;
+
+	ret =3D max6620_update_device(dev);
+	if (ret < 0)
+		return ret;
+	data =3D dev_get_drvdata(dev);
+	client =3D data->client;
+	mutex_lock(&data->update_lock);
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_div:
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
+				ret =3D -EINVAL;
+				goto error;
+			}
+			data->fandyn[channel] &=3D 0x1F;
+			data->fandyn[channel] |=3D div << 5;
+			ret =3D i2c_smbus_write_byte_data(client, dyn_reg[channel],
+							data->fandyn[channel]);
+			break;
+		case hwmon_fan_target:
+			val =3D clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
+			div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+			tach =3D max6620_fan_rpm_to_tach(div, val);
+			val1 =3D (tach >> 3) & 0xff;
+			val2 =3D (tach << 5) & 0xe0;
+			ret =3D i2c_smbus_write_byte_data(client, target_reg[channel], val1);
+			if (ret < 0)
+				break;
+			ret =3D i2c_smbus_write_byte_data(client, target_reg[channel] + 1, val2=
);
+			if (ret < 0)
+				break;
+
+			/* Setting TACH count re-enables fan fault detection */
+			data->fault &=3D ~BIT(channel);
+
+			break;
+		default:
+			ret =3D -EOPNOTSUPP;
+			break;
+		}
+		break;
+
+	default:
+		ret =3D -EOPNOTSUPP;
+		break;
+	}
+
+error:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static const struct hwmon_channel_info *max6620_info[] =3D {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
+			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
+			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
+			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM),
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
+static int max6620_init_client(struct max6620_data *data)
+{
+	struct i2c_client *client =3D data->client;
+	int config;
+	int err;
+	int i;
+	int reg;
+
+	config =3D i2c_smbus_read_byte_data(client, MAX6620_REG_CONFIG);
+	if (config < 0) {
+		dev_err(&client->dev, "Error reading config, aborting.\n");
+		return config;
+	}
+
+	/*
+	 * Set bit 4, disable other fans from going full speed on a fail
+	 * failure.
+	 */
+	err =3D i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | 0x=
10);
+	if (err < 0) {
+		dev_err(&client->dev, "Config write error, aborting.\n");
+		return err;
+	}
+
+	for (i =3D 0; i < 4; i++) {
+		reg =3D i2c_smbus_read_byte_data(client, config_reg[i]);
+		if (reg < 0)
+			return reg;
+		data->fancfg[i] =3D reg;
+
+		/* Enable RPM mode */
+		data->fancfg[i] |=3D 0xa8;
+		err =3D i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]=
);
+		if (err < 0)
+			return err;
+
+		/* 2 counts (001) and Rate change 100 (0.125 secs) */
+		data->fandyn[i] =3D 0x30;
+		err =3D i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
+		if (err < 0)
+			return err;
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
+	data->client =3D client;
+	mutex_init(&data->update_lock);
+
+	err =3D max6620_init_client(data);
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

