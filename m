Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1B1C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Sep 2021 13:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42EEF61ABF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Sep 2021 13:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243085AbhIMNn4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Sep 2021 09:43:56 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:33068 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242931AbhIMNlx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Sep 2021 09:41:53 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18DBTTmb018343;
        Mon, 13 Sep 2021 09:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=VRFnBKEk44Iy8l8G3RPOgihaoP9I/K4yuHF/O2ryNbM=;
 b=W/8OEoG6povdd26Ws2C2i19HiuGnjb7+UNhhZu/YCQW3l5ZMc7QP7cNWoBrJXOpbecd2
 xn5xAU8akjBfI1+EMWS4Ay7b6MXiFY4eAwxZP/A8yTNP1pgiHYBLjbb+UgynrYlN0an7
 PDseodviqxOfvVyjj1rZGFxr65O46tziENMnDPOewpOivO8bYwR1shMMFvhvDdK5vojI
 p5hGXUIcgUQDWmNut3zjOweiIneqGohYr355I+WZcHAehCRupo77xeFQZ2VRpdsiscnY
 WmJT+C828oXASwltumGYYeI5Sr2ZG6zqOLayt58U7PYiUtIoFMmVXeVYRDDKaG0G1yYP IQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 3b1xg9a5wh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Sep 2021 09:40:18 -0400
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 18DDZ5ar090956;
        Mon, 13 Sep 2021 09:40:17 -0400
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
        by mx0a-00154901.pphosted.com with ESMTP id 3b1a1k95av-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Sep 2021 09:40:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byFmPCvOtk3kfwsvELpNCyjY/pPaTBsiAKY0k0vk9ZyfgjuZcT9Ry2m+7OJR4oVcBg6RTugh2FuNRnfFSDxJQPOLM6OC4v9oJapYSKgn0EnzeW1jGBndCgoHfET6JyRDU2VUHpsPtoM8GNa8Cn9pwsqfY/s17EDxLs4OAf88drbfKEn4Roq4i/9xayxgnMCaDOBz9FUTRkmEIjV6GsD5Bv4vOxuOVu7ELqMWJtH6Ryo+xfPg1XKRIAATjv6k48WI/QchgvZdoiBt52AXE8sD+E4lighAuccvbeG6HcRZoDXWPZEaN+c+FINuVPFgQP9vIvGquNg2X7NZOkNnamJ69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VRFnBKEk44Iy8l8G3RPOgihaoP9I/K4yuHF/O2ryNbM=;
 b=cTCr7xmNkBZnfr0yVdvGGoerqZ+v0rfE6Co54dFULSOmUI/+1AAx+pLN8ye6BiuGMpwdZ3BXEQSg+SrsOo0hzo77/ok9xWWysxHe8PyfSl7rVVSzLqqftvD9did4yXqEcWQQBvGetoLCqaenny1GoXQI4e0QgrwsLT+sFcBEnuewWzU/CQZ6TNh2Vxy3Yonl16pR8F7rBlvNfoBMyOoMkPbzS0dXsnygG83obAqoBYmoNptZZRGuU5yuKkMOM/lFjM++Zm5JEVViLCnbmFfz20sBhXkKattLHlYme3GpUDShYJxPNIKtayd15PH6dCzUDedLQfyX9v+d7Ag9H8qlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by CO1PR19MB4904.namprd19.prod.outlook.com (2603:10b6:303:f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 13:40:15 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::5180:d141:3163:3832]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::5180:d141:3163:3832%2]) with mapi id 15.20.4500.015; Mon, 13 Sep 2021
 13:40:15 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v5] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Topic: [PATCH v5] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Index: Adeoo1sUc/WUc+Y1TwicdutE9nc/4Q==
Date:   Mon, 13 Sep 2021 13:40:15 +0000
Message-ID: <MW2PR1901MB20282698AC2BEE00A52D7B7EA6D99@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_34759c52-a6db-4813-b00f-5ea20e29646d_Enabled=true;
 MSIP_Label_34759c52-a6db-4813-b00f-5ea20e29646d_SetDate=2021-09-13T13:39:06Z;
 MSIP_Label_34759c52-a6db-4813-b00f-5ea20e29646d_Method=Privileged;
 MSIP_Label_34759c52-a6db-4813-b00f-5ea20e29646d_Name=Public;
 MSIP_Label_34759c52-a6db-4813-b00f-5ea20e29646d_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_34759c52-a6db-4813-b00f-5ea20e29646d_ActionId=93a5b9ff-0f2c-4d02-83c8-150c3e30a99c;
 MSIP_Label_34759c52-a6db-4813-b00f-5ea20e29646d_ContentBits=0
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6ca42c9-0013-417c-b605-08d976bc049a
x-ms-traffictypediagnostic: CO1PR19MB4904:
x-microsoft-antispam-prvs: <CO1PR19MB49046CA7D3F159343CB833BFA6D99@CO1PR19MB4904.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UUOU5pehe/rBlJ9ZdLRr+gRz6SsmVTe/cyl0Tm81BB5izf536weey4qv5k5RGYCKtU9RC+eAicT6Hf0bcAKQw6XKt8aMmqCqj6pkC8lCfpi92CTbabHRZoLWPRo4HjEHde6gonfvpzVZBstosqGUvvbsfi9yZi3DVTVGt3SjJGYl1U1AkPHaRITlyt7TQdqlyAuwWfLxca6if2NX4SU1mx+S8fwLuDoc0u4FtT7ybEsOeD5qWZZ8eVxME8VCoq5CZgr7QU/AKDHTW1mhukcH4GOvQ6yhiIydtOQOKIHMT22zyRUxXk7LAuCbLsfFqDL7oeEDPIN/udGoG6cBKlRP1AggRioxEsDH//Q6Jvsd3d8Q7AbnruXqeiWHgyAImBU2ajcCKLrALXnG7laOjPS+vSR0bXpZMtyrO0yueCpYPusC+XXxYPe4TSHG4MgXiL8xspe7GKgm1mqnqP1QG8/Q4TLgPy0HDhvm98i6wi/5gP/cbnOt7tqkk1FbKAtP86l8CpS/Aw+eQ513tSJUQoRizFOfAq3HQQfJEa2KLBnz6PmKzrKGh2nW41TneNtteIi5offa+Ge5ur+y4iO5mKiUgEMDngsYWMX9HdqIWHKD9jML+SWo+mlS+F8zE3HHWiM5XepvaJ37hi37YAZFGoHx7F6RntD+dJvpJaE2jMHb4Mcg9F9VS4xuvrRIRqapEkME+ZPZsG0ICcpfUAXIqwKdtnLGyxrYY5to8Y+EYkI/XtRqlkGcxM81Pb8bySSvUe4O+0u4mwt7X7ncbd/bPy4qzNxcAOaiW1XU+weDWzy6BQI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(66946007)(55016002)(8936002)(86362001)(9686003)(76116006)(478600001)(966005)(110136005)(2906002)(186003)(71200400001)(8676002)(66476007)(83380400001)(33656002)(5660300002)(316002)(55236004)(66556008)(6506007)(7696005)(38100700002)(122000001)(38070700005)(52536014)(26005)(66446008)(30864003)(4326008)(64756008)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FpbgTB6IhcJEoDmlLZvbZM1F68peXWMe50Ujf3b/PnMEPa4aUSxh2s8l7xts?=
 =?us-ascii?Q?v6xXsVee5+VN6UJgcoUHcXZJ7YX54MNEHzOWWuzcjwpabz55sZmfXJtdsh9M?=
 =?us-ascii?Q?81ZBuxy2+5/Oe3e1CAoPpuk3/rSzDesCELtfYgk1ZpnEj1WJRxwkcNIHtknR?=
 =?us-ascii?Q?/FkZ242GM22d2Q7LKbx0tA4lHHXdNzm23Qh1uIKbUpoKQMBV+wdxu1BDW7/b?=
 =?us-ascii?Q?zCuj8z8WtsAdmN9y3/6QE++CB/bBFe2OZM+Z3koWuEwZNG080iaxdKzTyyp8?=
 =?us-ascii?Q?3coFelaUoc3koMR15Be9fDWrmB6xZXylYLCB/4gfIDaWX6Coclb5f7QjO3Jc?=
 =?us-ascii?Q?MVaUBbMuOJIGRQJWy+08GvqlZjMCBHw83RMf15sFU/CT2YXOPW8vBH025p9b?=
 =?us-ascii?Q?6tYme5+HPpcnSTCHwNpLME421no8r9peSRu4hEsg1W/+yIUA5rsZKtms9NDA?=
 =?us-ascii?Q?jVO5F3TmxQNpV3KJoY6Yq5EagMV/SGq/Cd/88v5uDVpnZwFtarW5eOFmXsei?=
 =?us-ascii?Q?dhhcdfM2KvYZgvFMJkRBoni6adQnb1NijgAg/tUGbnSFj+rZ8lDXpgE1lhkJ?=
 =?us-ascii?Q?8qNlhypOY/k8c+wDQ2xxsOp+8y/MoFbQEqp6vX5ufipXE9PbkzjA9vxQWv8Y?=
 =?us-ascii?Q?2Gpj6iBfY2H2W6q3XTfEdOhQ2x5cU3jLUaupMNPJw34f2zDXkAdH0cOQ3Nz5?=
 =?us-ascii?Q?ZoG4EdO76oHlD08FEC7yJ6q9wAeU+gdOi46sa7ogIfHRbzLpznPKQn9yZaw1?=
 =?us-ascii?Q?2D9xsVtWx8TphU7VBMjDx9CZlbPT5C8vAwGrWvKJucLcZDgB6JTbFG1yFaw9?=
 =?us-ascii?Q?L3HwskANwsKZsP21ZslWSyLxVSmGt6P52qIkMA0NTjpO1DYCn88PXD4pqobj?=
 =?us-ascii?Q?Gd/GR7xIivwueQj+y4AZKuYYva1FWC8gURWhhbjg3qMIWv4t6yydeD5uw8qB?=
 =?us-ascii?Q?gdkvtVJVvKTjvHuROAEVFtiwuRXtQ/8w6sjPBuhvpN2ZK4YkyzOmu3bzvCbJ?=
 =?us-ascii?Q?Qah7cCsl7F4BPmgRNlIGTDDG+/hr3SfVBTh0t2JL6vmMnL+La+rTWbhOs6g3?=
 =?us-ascii?Q?noBK/46P0GNaqQ66UPmjn4jHrymienlhrKuA3xlePBzZqHAMGduu7KWjlgC5?=
 =?us-ascii?Q?y/wbV6MeqLv4UZcwLo2GdGjBdcGVFZpi6z5PGy6APocZppI+H9re2XggjaFN?=
 =?us-ascii?Q?cosZbgAJrjFkqW9BpbiLVjia2ID9mjsp3DlNnG+PwEJkEFFPcT354BDrpt6d?=
 =?us-ascii?Q?gJ3o6lh1/FF4o1Fi02IG3T0ej2slldywkIvV56P0lJT9E5lylAyuzrT60Nta?=
 =?us-ascii?Q?19kBFiZY3GnVchY1tL6/1GeY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ca42c9-0013-417c-b605-08d976bc049a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 13:40:15.1533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lA2FNiRlNxpy0R8YVH81XaUjpRQ20ppjt2HtenTikBQN1auyXm2m+MVIlMAtY1iW4ceO8DUV+hSso27FP5w8iCrXl67m+/8ouV08KURCNt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4904
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-09-13_04:2021-09-09,2021-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109130090
X-Proofpoint-GUID: pKGVm161c9loXkUrXro7kdoApahx7_x4
X-Proofpoint-ORIG-GUID: pKGVm161c9loXkUrXro7kdoApahx7_x4
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109130091
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
- Release update_lock while handling errors in fan*_alarm.

 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/max6620.rst |  46 +++
 drivers/hwmon/Kconfig           |  10 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/max6620.c         | 514 ++++++++++++++++++++++++++++++++
 5 files changed, 572 insertions(+)
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
index 000000000000..704aff97916b
--- /dev/null
+++ b/drivers/hwmon/max6620.c
@@ -0,0 +1,514 @@
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
+				if (ret < 0) {
+					mutex_unlock(&data->update_lock);
+					return ret;
+				}
+				ret =3D i2c_smbus_write_byte_data(client,
+								target_reg[channel] + 1, val2);
+				if (ret < 0) {
+					mutex_unlock(&data->update_lock);
+					return ret;
+				}
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

