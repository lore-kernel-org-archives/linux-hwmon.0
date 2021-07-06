Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD0EC07E9B
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E011E61C33
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbhGFNFP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 09:05:15 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:60748 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231937AbhGFNFL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Jul 2021 09:05:11 -0400
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166Cff2T004334;
        Tue, 6 Jul 2021 09:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=zeTNtfZVBXWmvvibWx4j0rpJly41rhEF+EzwcfV7Fy0=;
 b=INqj9ePao1B+uWhTFwwq/WbQ3gK7FNgOcObXwKbhHU3/UVXjFhwZ2fT8tOIOKzIqik+F
 9LbAouwf/PFCSEHT38dJiKrzkVDMWNhRIG2ZdCuBSlnUSErpgCupuEplF4h66wM0sD0n
 CCSLCghwFQWgDF0ayCfuj/Ze5oTKz3DPg2X/J71ATE1WsfPVy4OS04s31fGH3TnR+Mz/
 IzafePLWZ06inhtXoXtxdJCff4M8bjmoR9YTSprHtDhxczxUcLr1luavqE+62savYvLS
 kyOu9V1TqV/dvmmDrJBHhlkDw+B+rUApTC9CTgziPzceJKH5oCWqqNpt/yrzfyfLtZO0 Aw== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 39m546vh5y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jul 2021 09:02:18 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166CkLZB050212;
        Tue, 6 Jul 2021 09:02:17 -0400
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2043.outbound.protection.outlook.com [104.47.51.43])
        by mx0b-00154901.pphosted.com with ESMTP id 39mjm94mt9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Jul 2021 09:02:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIN5ouGXWdmxVxE1oQzC+5CvyIJlV2AsmKvSHwauK0d06oKTdQ+gqLY3wooRTuYIMgbnx7yIFDy4Jrkhwp+QNHwhlQX3dzjVjikC3qMnXpOMvBTwjyLtyKubdydEagblUjpVcLpLwPWKTW1MGLjxB/A+EBX0l85s6MTlz/A4ssVMop6DpTXbM3BTG9ETLwoBI9ICu4h/cGa9KxvNfebEt3keKVmqqEMDP4Qow2mMHShLOJlZyUvnRaurhttnUnfBycY1d5LOxcRfSSCIeqoAYlXi/CGxGFl7YthMRISuHmC+nVmH0ZwdUSxipx8DcooF3/wXCAGQvtI5WQS0LmNQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeTNtfZVBXWmvvibWx4j0rpJly41rhEF+EzwcfV7Fy0=;
 b=mC9ZI1T/Pfw93F9steCPyiAg/C0a7hrzvDJVkRrwdPnEhBQ5WB3daxmhO+DJxKzBEtSaMSTC8M0Zem20N9fhZOiotrWEpOms23RPhNWzVNggUhn93rCb+IxfTpWdRd3SN8m6U+kHJ1k4qt6ilAvIJd+XUY95+0fCr4nPo4zwxxFXcTemNg/pnyxzomRBKbCExcMCeVhBy+I+bI8byAcv8EAn5K423BNy2/R6bmH/dp5d9xXApMOctk+Af3jU9UYCZw54wzWJ3cbWjIzgu2iBdYqJ+jccwiwz64UP/ABEEVdkf/ppyuZAYxb0kYmBg2C62Lbh0+RpIUJaa42lf7TKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MWHPR19MB1469.namprd19.prod.outlook.com (2603:10b6:300:d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:02:15 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372%6]) with mapi id 15.20.4308.020; Tue, 6 Jul 2021
 13:02:15 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 5/5] hwmon: Update MAX6620 driver as per linux code guidelines
Thread-Topic: [PATCH 5/5] hwmon: Update MAX6620 driver as per linux code
 guidelines
Thread-Index: AddyZd3a6453zk82RlugnnpI8D6OoQ==
Date:   Tue, 6 Jul 2021 13:02:15 +0000
Message-ID: <MW2PR1901MB2028A2CB95CB66BEE85CF23CA61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-07-06T13:02:11.0958735Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=f1f1bad7-ee53-4b46-a230-6de4529768af;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89632ea0-d512-4e2d-5d5c-08d9407e473c
x-ms-traffictypediagnostic: MWHPR19MB1469:
x-microsoft-antispam-prvs: <MWHPR19MB14697A13F1DA0657BCF2C482A61B9@MWHPR19MB1469.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vGUILeack0PD2XjHLQlPMS9toio1gbzrJAiNhzIZYv9kv6xaz/etzUvsOd/SSJSb/2Waa80gID2+wPwdbZ3UbiXYTfZdMh0Du5hQhAFzGnzHywSJL5xQsP06KgKh2xkM+qowCS6gNn9PJJ14MgKBe9M4jdedgR5jlejfUVZtQJWGmz3mwfaxfD81e9Yq6c5CN3J2KcaA2mGHKq1npW6fhaX4SNZ2PzgkEbSiQtMuv3zK6EMjOOPdXHQ9nc838VUaYJfylpGJdOQqbDOzqe6VMT5WoeDzrbF+nnH/Z6yfHapQQbmvH02mx9F57f7mOx/2ekEtYHykniz5SjB95IL5jsMhdxF+SsDiK7RAm3gYwO6WGFp46hzqVh7ZsP1SqyZN8DRjDSfvfeYAoKv+rKmSyqNDHFCN3IJ0XMo0sgoGdHl8+69eeljr6iE42gM3aPc87/xILfhV186hU/pTsmu8A/F8lIIYKDDz5hT8Ogm0NjTzqqBYhz2p1yA5ETANwXMKhyNNo4tCrOkPqL59kVk0oCEybBDYEWpUHi/kvlwGhmgkbjNoiR9vls8Em+7nngqi4kj4c59aqNTd88kWebCvZLuy/MzE7x88XzeeP1GZYh9Lek8w+1W4XNmm/3MZ6wavlG9UJI117Tnw6HimDn2/15pZKo54NQZYVpTZaO4c8ruFBWc2mB8ayvfFdwZeUtLDUVtE57/4M2UOyJaC0aRJh7h8ffcZm+z9KJBpjTGygqIqYZ368ohNP7NsB/L1/YnvUeJyOkGAtQ65fJJz7iIX+ZggFSO3TJOeJDQZ7P3b+B8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(5660300002)(33656002)(8936002)(66946007)(110136005)(83380400001)(66556008)(26005)(8676002)(7696005)(786003)(66476007)(30864003)(76116006)(55236004)(316002)(86362001)(6506007)(478600001)(2906002)(122000001)(64756008)(966005)(15650500001)(52536014)(4326008)(186003)(55016002)(9686003)(66446008)(71200400001)(38100700002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+fE1om2BWY4Wqc4YFMszT2IPvuWVfpU3ssQh9dJmtnJ/dnsyCZTrzVv+1Lz/?=
 =?us-ascii?Q?YCa3w9cVZruoFgW6KM64hiUe/zjT4bRm6SGl/LgW75ERyPP3T2xsVBHaYnXY?=
 =?us-ascii?Q?TjP1oMaCuK+MP8T/A2jJ0CxS0JOaYP6o8iZ5HN+Ax5PGmtf2xLzXJf0NhEX5?=
 =?us-ascii?Q?DQqRz6rRq7+sywhrRFDzAnljIZSOg0PncAFrG6ld0O1b8aRr7F3ZZ/9/Yjfx?=
 =?us-ascii?Q?O7ZFrJuKXdQOYpn18SgJd9PvD1c3HxiCakZnarrSixSlhvGQTh7mf64c4Jgw?=
 =?us-ascii?Q?nPR/nL8fUnoZulrBC8oks3DhMqg3QYiCrUPb0wZS45lKI1SRR52EBOAiOFQo?=
 =?us-ascii?Q?o7oRW6wbKe3J1LMZeS9kr0BoiOG+Gzn7ESu/czMrAC979rq6m38dLZUrCtr+?=
 =?us-ascii?Q?2QUL2vpqE6cbLug83ZsGwh2/WJJJpXFuSvbfBqkuKS/xblaft+z9mtJiuPuX?=
 =?us-ascii?Q?erZRv5kFkHJpsswds3kqAY1Q3OQYxOLaTJR/X/4JBP/pW7jtu/kOSic8aOmT?=
 =?us-ascii?Q?6Nytb+JkSKp74p2UOVLrn0f4p3wd3x9zcJUUNa2S21vNJz3/H0xn2EG/bjse?=
 =?us-ascii?Q?by3XGHuvm7XVV4HRNdzp2FTe5frzhp48ocpzpBDNWnH9INOYYUUVeGD/9Kcr?=
 =?us-ascii?Q?GRUQY+gDkPTIxse45gOTes8co4O7oZ3niuEPHqRxPwfrkolklHaJWH4xIPhO?=
 =?us-ascii?Q?HgNsFfbbIptrFoV9xsEf2WMpuPUNudw3Dafr8YLMOfHlv0ZjOcOYjq8+JzrW?=
 =?us-ascii?Q?AGHEdr+fCYpHEgzixyYzS2SyRpUJ3+Ji1ae0DXqJ3+G/m33W8Fxw0yulQ9+O?=
 =?us-ascii?Q?KpPchXFeRSB61VAg/knU7BQcGnWKEfZZPjOcq1TwWKd0iAjAU0dQlOcbOHRo?=
 =?us-ascii?Q?CqMZeCu6Zsvt6iaYZMTvFIUa8gahhbhil16VuFj6/8Qb17iqEd+BdOPccojI?=
 =?us-ascii?Q?XkC6zHSw4/NgAerKYODjHbKE7+WvfLGZMD3eTaUyGHJNU+8mkLJdVk25vac1?=
 =?us-ascii?Q?oJyK9Ww1/7B3QxMGYP49jsJGtLvGBC0nElZX7A0OUywB4sLJAFVwuE2UarZS?=
 =?us-ascii?Q?O8T+puz3g9nP/nDk5DmyOSux2YrZP4TldBturR0T8mSTWsX9v3Aob9NiKE0G?=
 =?us-ascii?Q?9HAbdouWgXVbycBW+EN4ELaQm/6wvMoqSYKDBasyO5HBHhsuOCG1tez/qhHg?=
 =?us-ascii?Q?5HBk2jEEVgK34i1ZxMXLVRfg1KZgdZCLa4X0+SZJ4salnTFkRZn11kVaPIAi?=
 =?us-ascii?Q?q+mj9xoMSSWibghC9/OJF6Xcsh3AjDe0x22VAHx0sLfkBwPPmRLWep7TqjO+?=
 =?us-ascii?Q?URYa1c4++F6kmbkP9KUGgeZ7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89632ea0-d512-4e2d-5d5c-08d9407e473c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 13:02:15.3392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OD1zO4ThcjWmgyJ7ttko13RW/stm+1g+/N100dn0ue/H/wkK3v7z6x0vADU+/sPjTiZSu8zZE2GJ7aEJ1uW+AtSNHcqZ8HNStVu2nLd7eoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1469
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_06:2021-07-02,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060062
X-Proofpoint-GUID: 61dVMpiHRy9-3AnUdqCjo48K9b7CHmiQ
X-Proofpoint-ORIG-GUID: 61dVMpiHRy9-3AnUdqCjo48K9b7CHmiQ
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060062
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>

Update MAX6620 driver to comply with linux code guidelines

Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
---
 drivers/hwmon/max6620.c | 187 +++++++++++++---------------------------
 1 file changed, 59 insertions(+), 128 deletions(-)

diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 6f921bbf3831..a1b747081939 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * max6620.c - Linux Kernel module for hardware monitoring.
  *
@@ -15,19 +16,6 @@
  *
  *        http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
=20
 #include <linux/module.h>
@@ -46,10 +34,9 @@
=20
 /* clock: The clock frequency of the chip the driver should assume */
 static int clock =3D 8192;
-static u32 sr =3D 2;
 static u32 np =3D 2;
=20
-module_param(clock, int, S_IRUGO);
+module_param(clock, int, 0444);
=20
 static const unsigned short normal_i2c[] =3D {0x0a, 0x1a, 0x2a, I2C_CLIENT=
_END};
=20
@@ -211,8 +198,8 @@ struct max6620_data {
 	u8 fault;
 };
=20
-static ssize_t get_fan(struct device *dev, struct device_attribute *devatt=
r, char *buf) {
-
+static ssize_t get_fan(struct device *dev, struct device_attribute *devatt=
r, char *buf)
+{
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D max6620_update_device(dev);
 	struct i2c_client *client =3D to_i2c_client(dev);
@@ -226,17 +213,16 @@ static ssize_t get_fan(struct device *dev, struct dev=
ice_attribute *devattr, cha
 	tach2 =3D i2c_smbus_read_byte_data(client, tach_reg[attr->index] + 1);
 	tach2 =3D (tach2 >> 5) & 0x7;
 	tach =3D tach1 | tach2;
-	if (tach =3D=3D 0) {
+	if (tach =3D=3D 0)
 		rpm =3D 0;
-	} else {
+	else
 		rpm =3D (60 * DIV_FROM_REG(data->fandyn[attr->index]) * clock)/(tach * n=
p);
-	}
=20
 	return sprintf(buf, "%d\n", rpm);
 }
=20
-static ssize_t get_target(struct device *dev, struct device_attribute *dev=
attr, char *buf) {
-
+static ssize_t get_target(struct device *dev, struct device_attribute *dev=
attr, char *buf)
+{
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D max6620_update_device(dev);
 	struct i2c_client *client =3D to_i2c_client(dev);
@@ -250,16 +236,17 @@ static ssize_t get_target(struct device *dev, struct =
device_attribute *devattr,
 	target2 =3D i2c_smbus_read_byte_data(client, target_reg[attr->index] + 1)=
;
 	target2 =3D (target2 >> 5) & 0x7;
 	target =3D target1 | target2;
-	if (target =3D=3D 0) {
+	if (target =3D=3D 0)
 		rpm =3D 0;
-	} else {
+	else
 		rpm =3D (60 * DIV_FROM_REG(data->fandyn[attr->index]) * clock)/(target *=
 np);
-	}
+
 	return sprintf(buf, "%d\n", rpm);
 }
=20
-static ssize_t set_target(struct device *dev, struct device_attribute *dev=
attr, const char *buf, size_t count) {
-
+static ssize_t
+set_target(struct device *dev, struct device_attribute *devattr, const cha=
r *buf, size_t count)
+{
 	struct i2c_client *client =3D to_i2c_client(dev);
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D i2c_get_clientdata(client);
@@ -300,8 +287,8 @@ static ssize_t set_target(struct device *dev, struct de=
vice_attribute *devattr,
  * back exactly the value you have set.
  */
=20
-static ssize_t get_pwm(struct device *dev, struct device_attribute *devatt=
r, char *buf) {
-
+static ssize_t get_pwm(struct device *dev, struct device_attribute *devatt=
r, char *buf)
+{
 	int pwm;
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D max6620_update_device(dev);
@@ -318,8 +305,9 @@ static ssize_t get_pwm(struct device *dev, struct devic=
e_attribute *devattr, cha
 	return sprintf(buf, "%d\n", pwm);
 }
=20
-static ssize_t set_pwm(struct device *dev, struct device_attribute *devatt=
r, const char *buf, size_t count) {
-
+static ssize_t
+set_pwm(struct device *dev, struct device_attribute *devattr, const char *=
buf, size_t count)
+{
 	struct i2c_client *client =3D to_i2c_client(dev);
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D i2c_get_clientdata(client);
@@ -334,7 +322,7 @@ static ssize_t set_pwm(struct device *dev, struct devic=
e_attribute *devattr, con
=20
 	mutex_lock(&data->update_lock);
=20
-		data->dac[attr->index] =3D pwm;
+	data->dac[attr->index] =3D pwm;
=20
=20
 	i2c_smbus_write_byte_data(client, dac_reg[attr->index], data->dac[attr->i=
ndex]);
@@ -345,53 +333,6 @@ static ssize_t set_pwm(struct device *dev, struct devi=
ce_attribute *devattr, con
 	return count;
 }
=20
-/*
- * Get/Set controller mode:
- * Possible values:
- * 0 =3D Fan always on
- * 1 =3D Open loop, Voltage is set according to speed, not regulated.
- * 2 =3D Closed loop, RPM for all fans regulated by fan1 tachometer
- */
-
-static ssize_t get_enable(struct device *dev, struct device_attribute *dev=
attr, char *buf) {
-
-	struct max6620_data *data =3D max6620_update_device(dev);
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	int mode =3D (data->fancfg[attr->index] & 0x80 ) >> 7;
-	int sysfs_modes[2] =3D {1, 2};
-
-	return sprintf(buf, "%d\n", sysfs_modes[mode]);
-}
-
-static ssize_t set_enable(struct device *dev, struct device_attribute *dev=
attr, const char *buf, size_t count) {
-
-	struct i2c_client *client =3D to_i2c_client(dev);
-	struct max6620_data *data =3D i2c_get_clientdata(client);
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	int max6620_modes[3] =3D {0, 1, 0};
-	unsigned long mode;
-	int err;
-
-	err =3D kstrtoul(buf, 10, &mode);
-	if (err)
-		return err;
-
-	if (mode > 2)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-
-	data->fancfg[attr->index] =3D i2c_smbus_read_byte_data(client, config_reg=
[attr->index]);
-	data->fancfg[attr->index] =3D (data->fancfg[attr->index] & ~0x80)
-		       | (max6620_modes[mode] << 7);
-
-	i2c_smbus_write_byte_data(client, config_reg[attr->index], data->fancfg[a=
ttr->index]);
-
-	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
 /*
  * Read/write functions for fan1_div sysfs file. The MAX6620 has no such
  * divider. We handle this by converting between divider and counttime:
@@ -405,16 +346,17 @@ static ssize_t set_enable(struct device *dev, struct =
device_attribute *devattr,
  * defined for that. See the data sheet for details.
  */
=20
-static ssize_t get_div(struct device *dev, struct device_attribute *devatt=
r, char *buf) {
-
+static ssize_t get_div(struct device *dev, struct device_attribute *devatt=
r, char *buf)
+{
 	struct max6620_data *data =3D max6620_update_device(dev);
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
=20
 	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fandyn[attr->index]));
 }
=20
-static ssize_t set_div(struct device *dev, struct device_attribute *devatt=
r, const char *buf, size_t count) {
-
+static ssize_t
+set_div(struct device *dev, struct device_attribute *devattr, const char *=
buf, size_t count)
+{
 	struct i2c_client *client =3D to_i2c_client(dev);
 	struct max6620_data *data =3D i2c_get_clientdata(client);
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
@@ -465,46 +407,41 @@ static ssize_t set_div(struct device *dev, struct dev=
ice_attribute *devattr, con
  * 1 =3D alarm
  */
=20
-static ssize_t get_alarm(struct device *dev, struct device_attribute *deva=
ttr, char *buf) {
-
+static ssize_t get_alarm(struct device *dev, struct device_attribute *deva=
ttr, char *buf)
+{
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D max6620_update_device(dev);
-	struct i2c_client *client =3D to_i2c_client(dev);
 	int alarm =3D 0;
=20
 	mutex_lock(&data->update_lock);
-	if (data->fault & (1 << attr->index)) {
+	if (data->fault & (1 << attr->index))
 		alarm =3D 1;
-	}
+
 	mutex_unlock(&data->update_lock);
=20
 	return sprintf(buf, "%d\n", alarm);
 }
=20
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, get_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, get_fan, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, get_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, get_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, get_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_alarm, S_IRUGO, get_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan1_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 0);
-static SENSOR_DEVICE_ATTR(fan1_div, S_IWUSR | S_IRUGO, get_div, set_div, 0=
);
-// static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(fan2_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 1);
-static SENSOR_DEVICE_ATTR(fan2_div, S_IWUSR | S_IRUGO, get_div, set_div, 1=
);
-// static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 1);
-static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(fan3_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 2);
-static SENSOR_DEVICE_ATTR(fan3_div, S_IWUSR | S_IRUGO, get_div, set_div, 2=
);
-// static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 2);
-static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 2);
-static SENSOR_DEVICE_ATTR(fan4_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 3);
-static SENSOR_DEVICE_ATTR(fan4_div, S_IWUSR | S_IRUGO, get_div, set_div, 3=
);
-// static SENSOR_DEVICE_ATTR(pwm4_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 3);
-static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 3);
+static SENSOR_DEVICE_ATTR(fan1_input, 0444, get_fan, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan2_input, 0444, get_fan, NULL, 1);
+static SENSOR_DEVICE_ATTR(fan3_input, 0444, get_fan, NULL, 2);
+static SENSOR_DEVICE_ATTR(fan4_input, 0444, get_fan, NULL, 3);
+static SENSOR_DEVICE_ATTR(fan1_alarm, 0444, get_alarm, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan2_alarm, 0444, get_alarm, NULL, 1);
+static SENSOR_DEVICE_ATTR(fan3_alarm, 0444, get_alarm, NULL, 2);
+static SENSOR_DEVICE_ATTR(fan4_alarm, 0444, get_alarm, NULL, 3);
+static SENSOR_DEVICE_ATTR(fan1_target, 0644, get_target, set_target, 0);
+static SENSOR_DEVICE_ATTR(fan1_div, 0644, get_div, set_div, 0);
+static SENSOR_DEVICE_ATTR(pwm1, 0644, get_pwm, set_pwm, 0);
+static SENSOR_DEVICE_ATTR(fan2_target, 0644, get_target, set_target, 1);
+static SENSOR_DEVICE_ATTR(fan2_div, 0644, get_div, set_div, 1);
+static SENSOR_DEVICE_ATTR(pwm2, 0644, get_pwm, set_pwm, 1);
+static SENSOR_DEVICE_ATTR(fan3_target, 0644, get_target, set_target, 2);
+static SENSOR_DEVICE_ATTR(fan3_div, 0644, get_div, set_div, 2);
+static SENSOR_DEVICE_ATTR(pwm3, 0644, get_pwm, set_pwm, 2);
+static SENSOR_DEVICE_ATTR(fan4_target, 0644, get_target, set_target, 3);
+static SENSOR_DEVICE_ATTR(fan4_div, 0644, get_div, set_div, 3);
+static SENSOR_DEVICE_ATTR(pwm4, 0644, get_pwm, set_pwm, 3);
=20
 static struct attribute *max6620_attrs[] =3D {
 	&sensor_dev_attr_fan1_input.dev_attr.attr,
@@ -517,19 +454,15 @@ static struct attribute *max6620_attrs[] =3D {
 	&sensor_dev_attr_fan4_alarm.dev_attr.attr,
 	&sensor_dev_attr_fan1_target.dev_attr.attr,
 	&sensor_dev_attr_fan1_div.dev_attr.attr,
-//	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
 	&sensor_dev_attr_pwm1.dev_attr.attr,
 	&sensor_dev_attr_fan2_target.dev_attr.attr,
 	&sensor_dev_attr_fan2_div.dev_attr.attr,
-//	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
 	&sensor_dev_attr_pwm2.dev_attr.attr,
 	&sensor_dev_attr_fan3_target.dev_attr.attr,
 	&sensor_dev_attr_fan3_div.dev_attr.attr,
-//	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
 	&sensor_dev_attr_pwm3.dev_attr.attr,
 	&sensor_dev_attr_fan4_target.dev_attr.attr,
 	&sensor_dev_attr_fan4_div.dev_attr.attr,
-//	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
 	&sensor_dev_attr_pwm4.dev_attr.attr,
 	NULL
 };
@@ -543,16 +476,14 @@ static struct attribute_group max6620_attr_grp =3D {
  * Real code
  */
=20
-static int max6620_probe(struct i2c_client *client, const struct i2c_devic=
e_id *id) {
-
+static int max6620_probe(struct i2c_client *client, const struct i2c_devic=
e_id *id)
+{
 	struct max6620_data *data;
 	int err;
=20
 	data =3D devm_kzalloc(&client->dev, sizeof(struct max6620_data), GFP_KERN=
EL);
-	if (!data) {
-		dev_err(&client->dev, "out of memory.\n");
+	if (!data)
 		return -ENOMEM;
-	}
=20
 	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
@@ -571,7 +502,7 @@ static int max6620_probe(struct i2c_client *client, con=
st struct i2c_device_id *
 	err =3D sysfs_create_group(&client->dev.kobj, &max6620_attr_grp);
 	if (err)
 		return err;
-dev_info(&client->dev, "Sysfs entries created\n");
+	dev_info(&client->dev, "Sysfs entries created\n");
=20
 	data->hwmon_dev =3D hwmon_device_register(&client->dev);
 	if (!IS_ERR(data->hwmon_dev))
@@ -584,8 +515,8 @@ dev_info(&client->dev, "Sysfs entries created\n");
 	return err;
 }
=20
-static int max6620_remove(struct i2c_client *client) {
-
+static int max6620_remove(struct i2c_client *client)
+{
 	struct max6620_data *data =3D i2c_get_clientdata(client);
=20
 	hwmon_device_unregister(data->hwmon_dev);
@@ -594,8 +525,8 @@ static int max6620_remove(struct i2c_client *client) {
 	return 0;
 }
=20
-static int max6620_init_client(struct i2c_client *client) {
-
+static int max6620_init_client(struct i2c_client *client)
+{
 	struct max6620_data *data =3D i2c_get_clientdata(client);
 	int config;
 	int err =3D -EIO;
@@ -624,7 +555,7 @@ static int max6620_init_client(struct i2c_client *clien=
t) {
 		i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
 		data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
 		/* 2 counts (001) and Rate change 100 (0.125 secs) */
-		data-> fandyn[i] =3D 0x30;
+		data->fandyn[i] =3D 0x30;
 		i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
 		data->tach[i] =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
 		data->volt[i] =3D i2c_smbus_read_byte_data(client, volt_reg[i]);
@@ -637,6 +568,7 @@ static int max6620_init_client(struct i2c_client *clien=
t) {
 static struct max6620_data *max6620_update_device(struct device *dev)
 {
 	int i;
+	u8 fault_reg;
 	struct i2c_client *client =3D to_i2c_client(dev);
 	struct max6620_data *data =3D i2c_get_clientdata(client);
=20
@@ -659,7 +591,6 @@ static struct max6620_data *max6620_update_device(struc=
t device *dev)
 		 * caused the alarm is removed. Keep the value latched here
 		 * for providing the register through different alarm files.
 		 */
-		u8 fault_reg;
 		fault_reg =3D i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
 		data->fault |=3D (fault_reg >> 4) & (fault_reg & 0x0F);
=20
--=20
2.32.0

