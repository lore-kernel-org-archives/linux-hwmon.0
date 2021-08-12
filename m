Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7A9C43214
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 15:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5F1960F35
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 15:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237905AbhHLPgN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Aug 2021 11:36:13 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:31296 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235631AbhHLPgL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Aug 2021 11:36:11 -0400
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17CFVlCI017945;
        Thu, 12 Aug 2021 11:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=iypuBY65aYflgJ24zN/8hST4p6JpALDFq0h4/HXgZwc=;
 b=NQrz9197ruI5/DmKNLC6NuzscG/O+s+C6E90m5ySd/CZHMRFDJa+sTHvLYbz8ROzP5b6
 4Sc7SqvDCFFxcC8NJv+bmHV8+JsGkyBw3vtT0rwGBOuR8WFmrsGNXy4ShYS9oM9Sjfmr
 cTI56EcBkHmfWT9wYqVZXwpH6tvmoojpQuKEffRuRTUZ3MSQlRQv/9zK8234uUfApRL2
 2RDXhuCNDv5hd93VVU5xUZ1+1Ie6ODKTDmfA/yjNR6VIDYi+/4pTmmnFD5Xp/PT6nI7S
 jkMVTdCvOVh0TAtdw5uHBq89ME6ObrxHiLSCXgMF//2d/pDZhzuxPw+eLIJQ23RIUcPv 4A== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 3acgbsmk2c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Aug 2021 11:35:25 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17CFUc3c095842;
        Thu, 12 Aug 2021 11:35:25 -0400
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
        by mx0b-00154901.pphosted.com with ESMTP id 3acyea6huf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Aug 2021 11:35:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO7n1fhsHH8dSiyxR8rnfky5G++altyfX3HLmKe1stNJ7Yii8sgNK9Y4J/Nzm9Zkt3+lYaleUuPBkA9x5mv/clsQk64ig+uFT71Y30fN8UCX+NuBZqyJsYmP0tr0hpqMVzpWglgpCAkdnzgMQPwy78cFpPYMhYW8lNp21TVI6cIA8uiLv0jGxEXVvKot/082NpvtsnZQjFubBL8j4Q0AaXOtel42igHGomPKvh7PwWWrGwk8aaey0Eo7/bhfS1ZssRhZDgbCnacx5g4P5lV0ELuRd5vnr6JsauVPZDTvvm2y2IuqNvSjOb2J+6lhjCS5QEfp1T/OwCdAUCG42rCzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iypuBY65aYflgJ24zN/8hST4p6JpALDFq0h4/HXgZwc=;
 b=UetV3+9dcIV/JKFh3DnJ8IXJhl4bS/x8KfQY5U4drjYRYH/G3SkpOGfa1Lj1n7/GYQ5RxBE75YV+lLtH3Gvb5bRnpxjD0zJCpIveJRfVktmibEkrjUJpQyU2+AhhDO4a2bXz5DIU6VKxNvIbMnOtqmYIS+eku7TmcQbTQo3DYQ+JyLjWDfldXGyH629JxQoPlqJ8GJ8NHBIIyVOStL+QSmpBrqc54IyHWpWOo+tXoXKLVLwj3H/dj/2Mx/R+eZ6TIf7zUKITZ+rss3gcd6r2QuDITw+nlXsyz/D/ANbodIznrll/15reEpW1ZlU8E9mikkoZIV4RWksb2Ouwm3I57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MW2PR1901MB4697.namprd19.prod.outlook.com (2603:10b6:302:b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.23; Thu, 12 Aug
 2021 15:35:23 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::bc11:39fd:5a90:870b]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::bc11:39fd:5a90:870b%7]) with mapi id 15.20.4394.020; Thu, 12 Aug 2021
 15:35:23 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v2] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Topic: [PATCH v2] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Index: AdePj0boHAnQBR75RZusXvzcIs49Gw==
Date:   Thu, 12 Aug 2021 15:35:22 +0000
Message-ID: <MW2PR1901MB2028C53C1EDFFFAB818F46D0A6F99@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-08-12T15:35:20.2666696Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=58b3dd6d-ec08-42f9-9b2f-267d42f1a85e;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b225f36d-04de-4cd6-1360-08d95da6ccc6
x-ms-traffictypediagnostic: MW2PR1901MB4697:
x-microsoft-antispam-prvs: <MW2PR1901MB46976DD8E819D6D7D5965A6BA6F99@MW2PR1901MB4697.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EwZm9bm8wZO/gaYeAjVXcnnGT3BB9ljcjUJJOk9lmsMpuJteSbvFOv7LlHl6+mJtWXDkMHSb3n5EHQCIkhXN7A73VRQsqPnS5OyTAH9qtjIBwtT5nQ1nzWqvLo253zlQz0Yz4slW4wBq/NCygSiC7bIh9ze92X3GsQsB/kUAACtuKp4ySIX3G0usB+ZsXE5JET/87J9bhuw6lZxR/PtI4wvtDswUF8U3pJvIDbR1B7L9nkongrQWLr43F6I9rHUJr4KXtfVsYSVXSipjmq/DLeruDRIgqgrkDyUEXFame8/Rx+PqMyCwK+EwppGM8lNmWyezaEmOF++h3LAuThM6ltcLgGLF0XHEYIYsQQsl05dJ8vg0fXPwH1kAz+WBoJX81IrNW3Ly1XqQf7GABXNBpf1OYp8z+LvfJxYKzM5jVMYQhQz1PWWS6UZeFFd02Csj0gr4rTGTX+W67ZQJKvrFt6BEkX1oIcgUFpS6I5iEKA+4gSKVPSclLKKLsufm4T9FDgiRVbgIoh8KuQjweS8TJHGL2FrclUowhv5Jfc/KyMjtGb9ZLaeGBc1NS5k2aNxYklmZdBAv6nyNv+5+XRV2D3jEwDO5q96DsOoEj/IiLK1Faq4GIFNCvEM+5Sk3yqC+kawr2bk5oeUs7dhBkhDKdJDs2vopV2RNMB9VYArTLNG3VUmi7RiEZfakc6a9jGBSbwmN6wjdkgYLVD1yLt6uyy2MtoEQS2NgRHarhCQeN2m8xOLMu90mZCmOSJ//SEP+atXwxZv/OPUW+TMxpzakQHF87156TkKacfekP7tlbrY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(7696005)(6506007)(478600001)(66946007)(76116006)(66556008)(66446008)(33656002)(186003)(55016002)(64756008)(71200400001)(26005)(966005)(2906002)(66476007)(8676002)(4326008)(38100700002)(30864003)(9686003)(38070700005)(83380400001)(8936002)(5660300002)(86362001)(122000001)(52536014)(316002)(786003)(110136005)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9Gvt1G5dJW+9crFZnSzCTOH1pbqCGucop2VrLjUtHPSLhHU2978mpJF4C/tt?=
 =?us-ascii?Q?B42Qh+l9lb2W09s1JFgJzooBmiTvL4/57rbWtkY1CRv8uaDhR0c553EFT9Zt?=
 =?us-ascii?Q?Jy+KcIv0gITte0BYQz0w80ux8Hy8AgjsdUoVU/H+FDqzMhtyucQERR1VQN1e?=
 =?us-ascii?Q?SNHZoutBnNkncNYE7nW3q6A44d249tJP44ghViK4+laN/mcAgQpIiglIf9kO?=
 =?us-ascii?Q?rNsNmiyLsbSS1TrW1L6gjTKsqoohdbXa3X/FCfAe3mdx/gRPujKVfdeIfe72?=
 =?us-ascii?Q?4PuzHY8Jrw1AaQiR7khG0FN/rO9N6+ugcH0Hrq/zTJny2v8IbOB2eQRQlGFa?=
 =?us-ascii?Q?YJYx6UkHRkh8bfwh2MjwluRrzXfgK8A2sYFS0QYyO09XOBcSfhy5/jaSkVi7?=
 =?us-ascii?Q?y92YszGoK8bHAWMr2mnZ4ys9GkpTACzSoLEWvATfQcNTE4TvUFgNJP4lNGMO?=
 =?us-ascii?Q?srGr2pEyIN5f+fhQGT+WiWujrNGfx4qkRNi4iniBf0VB75hyOtQzBYVkteXr?=
 =?us-ascii?Q?JTuNsWhFs5LmpsXDcwZRfihyI7dJ8bYyfNOcq/hA44aR4aPuvP5aH4ZhL1F4?=
 =?us-ascii?Q?ho64ycaLivPT9MzroxTJ3aVm/+WlkGaeUxFXE8ezeqpq6ygZN0SXua+9Z+zh?=
 =?us-ascii?Q?vTTrYlPadKf3WJUEpfWubOuNKxVroEK9OsqA/e2o5Vlv87EHhSXNmnUmb9vR?=
 =?us-ascii?Q?bGGC43jXUvS2YO8lULXNK7xzyhMJYazP50ZfsiU0tw2IBerde4N98SfQKGE2?=
 =?us-ascii?Q?9RCANHz8gpn/qwAE/mJRmdKplXmpbjH7y44IJ66MghMbdIm211eng95v2mWI?=
 =?us-ascii?Q?U1CbkDQVQRIQvAIf35qhIfDco0JQmH2XHXLAdim2pDlwkBSwY6A+BaqcibnV?=
 =?us-ascii?Q?FLFlNNcfbP8fITtd4GbNcrmYOsaxw8fcpRmcS76ie3cXyrpf7a3pAnmmKkXk?=
 =?us-ascii?Q?ecMPIy1Blr5lgFceWKxxeLmOAIgO0le5fxBkf0sp7SlsPRDLSqmmi4Lq51Rq?=
 =?us-ascii?Q?K3xP4Y20tUKEG52FMEsxejYqasWQ07zc6+0gYvvQ2bHP5uoggHca7RwY8W2j?=
 =?us-ascii?Q?bbZ/0Zv5ny5euFvCMNCKWn9Oc70qeFHSCFni8n49s9PTkGqh5UvVjwmI/SIa?=
 =?us-ascii?Q?l5q63H0ksohNKyaSqyMAy2YdlvfYHRGlaivfJ1oCuGAdE8kGbXahEgRQZGg4?=
 =?us-ascii?Q?8PNmJ3dHXTesTV4HS6KNMN9MdE3bC+Z17lxBT7L7DdjoYB9DjDOt9EN2GftB?=
 =?us-ascii?Q?fx3sb9fnzlTPnlUo5QiRvYwyDfL3Wvof8EskMsNjR9ordymKpafDhHdPakqF?=
 =?us-ascii?Q?gKg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b225f36d-04de-4cd6-1360-08d95da6ccc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 15:35:23.0063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzzCa333DYEGv5yXwEiu36y26KHf41YFyw6izHiRLVIko1uEl3WHRitvnCNhOTrzLUQngWHsxnf+dDRao8ZiSYKTyDDNN9L6vsqwAROKqQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1901MB4697
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-12_05:2021-08-12,2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120100
X-Proofpoint-ORIG-GUID: LgVykhtNTf9yeHOHKZkg4jI9sArPDr4H
X-Proofpoint-GUID: LgVykhtNTf9yeHOHKZkg4jI9sArPDr4H
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120100
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
- Add documentation for max6620 driver.
- In Kconfig, change 'MAX6620 sensor chip' to 'MAX6620 fan controller'.
- Rearrange #include alphabetically.
- Remove include of 'hwmon-sysfs.h'.
- Change type of max6620_data->valid from 'char' to 'bool'.
- Remove unused element max6620_data->config.
- Check return value of all i2c_smbus_read/write_byte function calls.
- Refactor functions to check and return the error codes without overriding=
.
- Change return type of 'max6620_update_device' from 'max6620_data' to 'int=
'.
- Change type of argument to 'max6620_init_client' from 'i2c_client' to
  'max6620_data'.
- Change 'fan*_alarm' attribute to restart fan fault detection on read, in =
case
  of an alarm.
- Use BIT macro wherever applicable.
- Use HWMON_CHANNEL_INFO macro while defining 'hwmon_channel_info'.
- Use #define for clock and number of pulses.
- Remove unused insmod parameter clock.
</Formletter>

 Documentation/hwmon/max6620.rst |  46 +++
 drivers/hwmon/Kconfig           |  10 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/max6620.c         | 510 ++++++++++++++++++++++++++++++++
 4 files changed, 567 insertions(+)
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
index 000000000000..1b709f0fcb7f
--- /dev/null
+++ b/drivers/hwmon/max6620.c
@@ -0,0 +1,510 @@
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
+	return 1 << ((val & 0xE0) >> 5);
+}
+
+static int max6620_update_device(struct device *dev)
+{
+	struct max6620_data *data =3D dev_get_drvdata(dev);
+	struct i2c_client *client =3D data->client;
+	int i, reg, regval1, regval2;
+	int ret =3D 0;
+
+	mutex_lock(&data->update_lock);
+
+	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+		for (i =3D 0; i < 4; i++) {
+			reg =3D i2c_smbus_read_byte_data(client, config_reg[i]);
+			if (reg < 0) {
+				ret =3D reg;
+				goto error;
+			}
+			data->fancfg[i] =3D reg;
+
+			reg =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
+			if (reg < 0) {
+				ret =3D reg;
+				goto error;
+			}
+			data->fandyn[i] =3D reg;
+
+			regval1 =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
+			if (regval1 < 0) {
+				ret =3D regval1;
+				goto error;
+			}
+			regval2 =3D i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
+			if (regval2 < 0) {
+				ret =3D regval2;
+				goto error;
+			}
+			data->tach[i] =3D ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
+
+			regval1 =3D i2c_smbus_read_byte_data(client, target_reg[i]);
+			if (regval1 < 0) {
+				ret =3D regval1;
+				goto error;
+			}
+			regval2 =3D i2c_smbus_read_byte_data(client, target_reg[i] + 1);
+			if (regval2 < 0) {
+				ret =3D regval2;
+				goto error;
+			}
+			data->target[i] =3D ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
+		}
+
+		/*
+		 * Alarms are cleared on read in case the condition that
+		 * caused the alarm is removed. Keep the value latched here
+		 * for providing the register through different alarm files.
+		 */
+		reg =3D i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
+		if (reg < 0) {
+			ret =3D reg;
+			goto error;
+		}
+		data->fault |=3D (reg >> 4) & (reg & 0x0F);
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
+				data->fault &=3D ~(BIT(channel));
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
+				*val =3D (60 * div * MAX6620_CLOCK_FREQ) / (data->tach[channel]
+									  * MAX6620_PULSE_PER_REV);
+			}
+			break;
+		case hwmon_fan_target:
+			if (data->target[channel] =3D=3D 0) {
+				*val =3D 0;
+			} else {
+				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
+				*val =3D (60 * div * MAX6620_CLOCK_FREQ) / (data->target[channel]
+									  * MAX6620_PULSE_PER_REV);
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
+			tach =3D (60 * div * MAX6620_CLOCK_FREQ) / (val * MAX6620_PULSE_PER_REV=
);
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
+			data->fault &=3D ~(BIT(channel));
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

