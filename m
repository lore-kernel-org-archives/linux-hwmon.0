Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A116C4338F
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Aug 2021 11:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 016F961262
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Aug 2021 11:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236283AbhHXMA2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Aug 2021 08:00:28 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:47610 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235982AbhHXMA1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Aug 2021 08:00:27 -0400
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17OBpxx1023985;
        Tue, 24 Aug 2021 07:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=Od48kZxJpEBWmk8kZxkXTubwlJGjD7/DlhPE2L/FNxc=;
 b=dP7fhYd2HZlxT0PPm7+4Ai6o++QyFXiR8t0NdoTSTTpFDMopk/6WYNfwogn1rpwb1aUb
 WXSklPIEp0Xj4RpdVpet+ibOQcJrjtoWKTJERipRYMV79rY2M+GI81UxxT2jKIMEDETe
 Wb+qJ5Rfv7G0v/3EAjLTTjQ8WyiYXKPwyHL+7b9BxGTFA435ks2CWaoNKqC6oqQpwxlK
 eI+z6T76KKVJLZUSxDWEqhP0RGuqfiSy/TqJM75Cc3YwTOTBDekzmVOCMBR1Iyw05WOs
 aAwjvQL+89xAYlfnnIhdkr10dFEjfefP4DVQjL7VsZ6k4af+wX9fcHso2u+A17COW36f /g== 
Received: from mx0a-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 3amdrd3v58-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Aug 2021 07:59:29 -0400
Received: from pps.filterd (m0089484.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17OBsnal117109;
        Tue, 24 Aug 2021 07:59:28 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
        by mx0b-00154901.pphosted.com with ESMTP id 3amkce1q82-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 07:59:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvCFivbjuyDLOBW2yy+7nJe6TjjGKPnJySR+MhawirDKyfUJ0OeUKZS8kJ5A2osVrxYVa3L3z/oHx24EIKN3wEJ+hK3VPG01wSjyoeMS4xzdkXGJ016B7SegKcAo3NFYVLBOYOFDjbAjoI1sDv1iuZ0he5xRU9PgrVpVI6keMn+kYQAYwdZ0t/DK/3KFibxHZi0bnP/CI7L/+00EOClREnQyqDDpuiwKGVpMx2CkaKtdvgfw96UI8cQkh5GjweAmQOOz4e6ThFv+Blg0ypxYzn/ZOWBzPPEUgLVJljUeL2elBKbE86DGI6CsTHFv5ZsvP0IpgHPE4lpX2PdEjEJr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od48kZxJpEBWmk8kZxkXTubwlJGjD7/DlhPE2L/FNxc=;
 b=nNGe2+BcWjSZNdicOn7w/pz16uDaZsFzPtfN4nNX2KHCb/YhLr7IFINI0255yQmj51g+5dsU+U2q33Dc0YYombo1PQVu+qOPL+BXTZcAjNkdELAotALUJT4ltiU+kdu111BpwClC9WYtlZRiieQQzlsuHP/DKuVSGeQ3lpHkDKx7h/LN8OJAp3DHjnTTWrVkYz2uj231/PJ4YqWWFtmD5FRImz3YCsqvVhTm54SVM3W2MlpG8cglhO+HgLuBalnwfCpusRnsPNU4TXV2xrQGxW8Ong+AjuHak42PLXhHPfO1vVLu1ZWxR7XL80Sfj6fP3wLL3IODV/6gQQuku+XoGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MW2PR1901MB2204.namprd19.prod.outlook.com (2603:10b6:302:f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 11:59:26 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::bc11:39fd:5a90:870b]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::bc11:39fd:5a90:870b%7]) with mapi id 15.20.4415.024; Tue, 24 Aug 2021
 11:59:26 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v3] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Topic: [PATCH v3] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Index: AdeY3kJIh4XizBMVQGetadGVqiEmMQ==
Date:   Tue, 24 Aug 2021 11:59:26 +0000
Message-ID: <MW2PR1901MB20282C7BCF058732B6357661A6C59@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-08-24T11:59:19.2800125Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=8dba9e75-86ca-47c0-ab83-a39e837aa1f2;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 450d2f8f-c4d1-415d-ddf1-08d966f69f09
x-ms-traffictypediagnostic: MW2PR1901MB2204:
x-microsoft-antispam-prvs: <MW2PR1901MB22045CF7935864C2B41BD062A6C59@MW2PR1901MB2204.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /t38TEZuVPWFTZrEq6StF5oG795pPwBpCxrck3Atio72dnf9Dh3Wl/UnHiigK5E8l98zzNiC0XgOFCBRSNUyp107PQKriHwhuoGoqZzAr+kEY8pPjTmGsXccoBf3QIO4ayIaOnW7YV9b6UVZGr0aItQ1RKzKMngDRXoLa+bIR+/7KaI4Xx0L6uZ5h+SkpZoqnCMr7XNEfGveb6VAqQpUSwCzLbUExY22sn/Y46h+KPd9Du/KVTYLqQDv3mZaqPIvgBUSCcqU6O5WBbM7oU1iBGJfu4gPluwYrcmccCS5r3gHJRq9eIhoMG7yADRtoK3yS8GUFWHzJlMRBACEufKYd9cy/JUeM9CWLCZayZMgyYp5ZW9gGkP1wiR5ccFTsMU+dcKEglpJhBJ/B9VMzW71ADkdDcAHthz9JXaKBWjuo/i1Ma29gC5XG7de0SUMyb5uJ9zSnmS+06dyBnsLVEP91lKlrJr+uQYb3HJ6M0QsPy7NYnkZVmmozH3e4GPJiZ9Pv+jn7W4XBV07JG87/G/mlMikc3SSWipkaRmkdAUr+bMhnGCnjeR7BI4EBZOgXk3i+8RH7YgDeDNcw1j55tZKcimMmSTkMNfixCh++JM4OJ0ixArlAbS74qYxi6nNB1wFAvpTivVrrcWpoMXwK9q6cQ4WcirkESgcw8imYbDy4ugsTYATYI32q/30EmRM+jRoIxHEjYjwMKB3DVpW6rmYNaeSxSymLNArPsyur+KxfsJF3K8lfi/3yloikvL+4i8XGN2EjFl4QA0Ku/7KO3km+E+DdxYLMFb7dKdOBy74GRk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(86362001)(76116006)(66946007)(38070700005)(2906002)(966005)(8936002)(52536014)(33656002)(7696005)(26005)(5660300002)(66476007)(8676002)(9686003)(122000001)(55236004)(71200400001)(66556008)(64756008)(66446008)(316002)(786003)(478600001)(110136005)(55016002)(4326008)(186003)(6506007)(38100700002)(30864003)(83380400001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aSk9pCJtUtP6YzYnko8EM3iOyZOx4RG70u+iM82EbydIaJvcXKxrvaxFqgVM?=
 =?us-ascii?Q?vkgWYB2i67xiFuDfqd9LTg2MO1z4Jro5H4ja72T8CVOMTJ4qAJymjiVaJ41z?=
 =?us-ascii?Q?DgNE1bkvCDIcjDcGAGTt+WPb+VKkXCmQCUeO9tQGQJnueyCgRNVfuBtsA8M+?=
 =?us-ascii?Q?AF5SOu/Q2/WQNLGbfdrWkKp0K3iemasvKRu1iK+A7kgulR7riJr0aVvR1L9H?=
 =?us-ascii?Q?VRstqIFII4CO5IQCR1csHDXIB+lnWgwu2boZJWCp/cOgFx1yCCtkN1/gI10U?=
 =?us-ascii?Q?h/AsdlTkItSnVqR9oAJtaWjjedjW0MVce1mUyLDTY7i199wUa+41J8jcvnGw?=
 =?us-ascii?Q?em8xhFK3GjyafDs9EviXIwYp3zZk+Ym0SLbhM+susu3c49wHYALTDVaS5326?=
 =?us-ascii?Q?k/C46zXE6GXu5jm/kysj2g/5oQJyNOUQw77nWUyHVtGcHE0FrSat9sm072zc?=
 =?us-ascii?Q?ZVSpblNBWaXjebUbVDqeXZcMvh0n5gFiTEKr+bNv7CL1mxpcru0ln43dHBVw?=
 =?us-ascii?Q?E9oSl2N+C2QTyMi/iISpk8CuKjcG0jdowR2GskzYXPmgxk6IsFixOI0aCDRu?=
 =?us-ascii?Q?9Rlgxv5xY+b7pGwPNVtjk7KkuMoa3RIqEc09ujneCupl4T0WNJKJLUtknbh1?=
 =?us-ascii?Q?190ODgNyP8BiSc+9FL5j8tAiehAgw39PgroTw8sAOGg5DQcf2Ua0zq57MORZ?=
 =?us-ascii?Q?zchMXF46MDtygvqC2OJf9GxasIwvFpDVskdA632GCrBQOtW48R8827SPmqgU?=
 =?us-ascii?Q?5spnzOIvKN8ca/XuN31/6RPCkw//yDdUL/S3qCWk2X8hZ/0Kkyv7LOp6E4DN?=
 =?us-ascii?Q?XGzbgDx742ufKgPjI34IAG6VIjjjqoVxvJ2KGr/ISxfKwAjEPlTw4F0PCzLp?=
 =?us-ascii?Q?5W5L4j/83fdRl0BTNASIN7dlgu/WmD7/+s8VgBUH7eXmg871LJ+DhyaGocyr?=
 =?us-ascii?Q?sK2x6YMCbU+kju+VGnqqq0/xCCiAmI/qsU6CXJ6noxxj0TlHEqZ6BwlNFHZM?=
 =?us-ascii?Q?GsLfjPOyFo/3zXIth1ni1WQvtPA2GEC+BCwnbzo3Ysuuf+yRl0CXSnjIz+hf?=
 =?us-ascii?Q?Zp+bcn+UbjVImf9HuVue+DZ2XARPO53+2hneEg1AJ2pnIhIXsrcodpIFCyoA?=
 =?us-ascii?Q?vrP9Es3UVBKj+1K3ENIA4jE9CP4Yz77bZ5XC2iNgrjIszC9+n5fUWA/el7Mp?=
 =?us-ascii?Q?VDGZbkDP5eMKe9mDmfF7J2iimvTvLtJyt4FMDkJBYw/KRZ/Rya+68N6GgV2z?=
 =?us-ascii?Q?/rABXN9QIjsikNZM7rExrFC9M8PugjVJ98rydH58yJQEW/rAmUbCXtUKav9H?=
 =?us-ascii?Q?uIntkpCNZqbRkePYrVuHGSrY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450d2f8f-c4d1-415d-ddf1-08d966f69f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 11:59:26.4558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KerIZjCo0e3JBw9y9tW1GWxWvJy6WZy3ym7AfDcGwEf9YEvynrGiuIjEl2Iwvf9xQ1cVueXFqZD7YwVrCHD8/axaVGnSp+sxGYqycNG55c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1901MB2204
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-24_02:2021-08-24,2021-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108240080
X-Proofpoint-GUID: zfXt5we0N8YjwXeJ5qh3sl2vgoVdIWH_
X-Proofpoint-ORIG-GUID: zfXt5we0N8YjwXeJ5qh3sl2vgoVdIWH_
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240080
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

<Formletter>=20
Changelog:
- Include '<linux/bits.h>'.
- Use BIT() macro in 'max6620_fan_div_from_reg'.
- Define functions 'max6620_fan_rpm_to_tach' , 'max6620_fan_tach_to_rpm'
   for RPM to tach conversion and vice versa.
- Drop 'reg' variable and use only variable 'ret' for validation and use of=
 value
   returned by i2c_smbus_read_byte_data in 'max6620_update_device'.
- Remove unnecessary enclosing parentheses.
</Formletter>

 Documentation/hwmon/max6620.rst |  46 +++
 drivers/hwmon/Kconfig           |  10 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/max6620.c         | 507 ++++++++++++++++++++++++++++++++
 4 files changed, 564 insertions(+)
 create mode 100644 Documentation/hwmon/max6620.rst
 create mode 100644 drivers/hwmon/max6620.c

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
index 000000000000..af2301ac9513
--- /dev/null
+++ b/drivers/hwmon/max6620.c
@@ -0,0 +1,507 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Maxim MAX6620
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
+	int ret =3D 0;
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
+				mutex_lock(&data->update_lock);
+				data->fault &=3D ~BIT(channel);
+				mutex_unlock(&data->update_lock);
+			}
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
+	int ret =3D 0;
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

