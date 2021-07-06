Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9131C07E96
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9476961A46
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhGFNE7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 09:04:59 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:33320 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231975AbhGFNE6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Jul 2021 09:04:58 -0400
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166CfslY015318;
        Tue, 6 Jul 2021 09:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=e26wjKifH2nkTSdDBqSBuZxeutEjH/Cl9lUEmVm/Iyc=;
 b=FdbamcfaNAJ9/CkoR/QzuR1yJeFquPFvGWs5CHynsUc9PfkuRS29kz+Fx9uL5h2n5WdC
 qRl5e8Q2JF0oqGeeYSgGNRtz6M/r4u4F+mqJX0BSmLsYlGPxBOfjNebLAaGDlA225IbJ
 caEqGDTV/TpbXP9GxTf6OksehBD2RaYVo3OdK0Ol3mzr9LqN5OUcKQdwKBZ0eAnTVigw
 9aK69rD3Pkb71yX8MMX0k197NIy/3XqOm5CGHORj1N8+pk3IXyNQ+I9lFsS86njCiAQE
 OIupAUjccKVKGB1sUKCB/wfx6kUp74vDNG9MfP7AdTWYFEjnl6wrDyQvGD4ncNnuMp/x /A== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 39m5pfvan1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jul 2021 09:02:05 -0400
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166D1r4x061229;
        Tue, 6 Jul 2021 09:02:04 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by mx0b-00154901.pphosted.com with ESMTP id 39mjwscchf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Jul 2021 09:02:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IO9yTmiYFSfM8rTopBreZ25xgEbxEhjQNEnUJmrsvjoafkVUhZXwFXEk6CI8AEXxEhi+5Ry3tN+x4whTiN6fC3j9mf2ldphkcPT/LYjlZr5l/DZNJOvVrLcNKudwoLeLO4VPyjHiXeHCfw5AfYVEStX+ZvTtHnxoqeXMnF3eS8FQ3DKhSt42kAkku6eZMhU0ZCC+VLypJ4n+28H9urLrkGi0VukH7z0yYk3SfceCv8Ogjxwfs5QbLGMTm7LOfVRwawCf644Krgbx8aP1vG4ukF2JYENju25151xJw5ktJBi0DlqrIEZqwDMVROHjboTE/VkI14oN8P5YCPkyQW3rAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e26wjKifH2nkTSdDBqSBuZxeutEjH/Cl9lUEmVm/Iyc=;
 b=WqeXipK3k7ayUn4JX5VtWL3c2ocTAJnQsF2UueZxwMG76qBuWzjEF49eWbiJGZZk9EpSVtM8bWnijhtoc/wmn6ep6Nax/DAVaU99PnCh7Lxqnk5T9LFkwLcSD0CNnQXyxFvdYZHvr59chuB/5aVIxb/T6JPefJpW8lGSXGATNCntTaIKHRMCPawrASrCz1NimyVYbuuFNnSp6hmAUF0u25yC0t/Wuchh+tov/0ryIQwMo2hXkGjYpe++l5svaZzZvPGciIB26YrM8Y4iqsgfFiXRWTayCqB4Y0w22haQI9CkjNU5a7zElqu8mydOZDKFlkSc56Z6yaGZIGWTIPDy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MWHPR19MB1469.namprd19.prod.outlook.com (2603:10b6:300:d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:02:01 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372%6]) with mapi id 15.20.4308.020; Tue, 6 Jul 2021
 13:02:01 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 2/5] hwmon: MAX6620 fix rpm calculation accuracy
Thread-Topic: [PATCH 2/5] hwmon: MAX6620 fix rpm calculation accuracy
Thread-Index: AddyZU3llOyuWnf7QSCmcuWOsH1qHA==
Date:   Tue, 6 Jul 2021 13:02:01 +0000
Message-ID: <MW2PR1901MB202870C516EB0B9B9BE0053CA61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-07-06T13:01:56.3528455Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=005e6a98-4634-4f04-b1e0-15555c5d5411;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eee795a2-a69c-4a83-77a4-08d9407e3ee4
x-ms-traffictypediagnostic: MWHPR19MB1469:
x-microsoft-antispam-prvs: <MWHPR19MB14697D2A04FBB68DD79A38BDA61B9@MWHPR19MB1469.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vWeHubd9Yen2gd7fATM81YWUs9p+ZdhT0OprPCMn+FKdLr6onQjuxSG4z4mx7Psuip2PDIOfw4dEt0GTS87mLE7QdIuKAprJ9q41yYp6Etta9PIXF0DFV3Tx+u5A2mY+q1CYHan/EQXNgn+oexwayc4ec3xviIwfU3ItiVuJgbgP0YllpNdzhBqXKwL19JkTC6aUj/5h4G3WdroOl8sTkGtQEm/lL+20v6ebtGP7tjsFdmyHvsNzXKtb7g4t/DyS0UWF0A6Sgs3CiwN6Vs4R88zzgJFhLMKrgcAoc5iHI5bjn8nZfpdmehNzaZApDfJ32qKdfqOAvUOveRB5NTpBESHb6wufFIi8fserenfqiqy8UL2okL9YvAyFG9zu2nfPi0hYKxnR/zYriTAjqo8rsyUM/jW0mqRT73nbYn2ZCGuwKZJOG3tL+EBF2ek54APsS+/T5R6f66naTl1lEKxPP2e80SqfN4P7BC7qRy79JhBJiXbImR2ox0ZcYDL24t4v0M2ZrUb2VNbPa9kQGFY3HnaszpSJ0iQs0OX6/fMR3lW8KUzr57pwFln4nEqlZnOTBXMP7y2MYAvljZ3PxiWw4b9RRfXtLgUCWYUqP79ogmOhvH8IhTUBfJuH77Cf7rSn9/Z+xi3TK+IJtToyk+2tiQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(5660300002)(33656002)(8936002)(66946007)(110136005)(83380400001)(66556008)(26005)(8676002)(7696005)(786003)(66476007)(76116006)(55236004)(316002)(86362001)(6506007)(478600001)(2906002)(122000001)(64756008)(52536014)(4326008)(186003)(55016002)(9686003)(66446008)(71200400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8xAgWP7wmZItu9YkQk6EyZPdBvvJRL+2EaavALmhkyNOg9BFYvShiFxywnf5?=
 =?us-ascii?Q?++c0ru0uqJ6VrVtTREugVKz79HABOPty/7ohA20wkVvAVbidnzbqG+P2Nlw3?=
 =?us-ascii?Q?O6TT934KP/Qmub4AZkDckbEzjEAW8coUcbi1AVBLkmxi61FQWx/rZ5BW4DZa?=
 =?us-ascii?Q?bhoDaG/+vDfFge68/T7muW0gkqREYuxSIGBh0hWz6VmbCuY5VM8Ai7Lpn1+k?=
 =?us-ascii?Q?hRgwCyS4xYOEJcswovoJIBVH9XiJENdnqN8qHnN2dtseBif+lSxJSsCIE7sd?=
 =?us-ascii?Q?3Hcy/ilG+zGonnmMI+bWHHclPvFID/Vow7rsRpWWk6yIvVRSi2vS1edsNV01?=
 =?us-ascii?Q?MSJeEsWNyio/pWBXa675d57ZGZVQS85CjbdVq7+BT2cVorfGlQQBDIHDnMOY?=
 =?us-ascii?Q?NdflUJsU+jl/mkjCzHWDhMRkk6aBV4IOmNo9Ernl7DK7lhf+zP5fASqfwolq?=
 =?us-ascii?Q?/S41FthlRBt1GsP5aBYFtARwJSVAhxl+soVA37VF3sLZlkmI4nuiMtEuRWrh?=
 =?us-ascii?Q?3rm4KCtKUvS7nAVFVxGm2OtES+rQCNFBn7MSIzVhoBQFy2svnusmj7C1Ytww?=
 =?us-ascii?Q?R52qwlanVDhS13HOgwMB2w2j5U8fB5rAG59bL1rRB15JoK2kvBu1LU/if8qA?=
 =?us-ascii?Q?+ygt7kG1PWrUZsEkCJAKAyaGfVxzWtt7WcoNHl2Kwvf6zzErndMFQecsN4F+?=
 =?us-ascii?Q?15IT0TnMTWP6gAKk/NKie+XnhRCqxxFzjuWSfY8gVQRbgASxJY2+qzoZwHKK?=
 =?us-ascii?Q?/uZrfdce9I0yzJujldUxW0XxNy/7VGTCVge1N/ibd+4hcouB0EUtJOnVkHXc?=
 =?us-ascii?Q?gmlXIzxY9y47qgcpQuhs/sbNFjGjuRVbVbSFC876PCk+nYOq8X+CW0HHKdBj?=
 =?us-ascii?Q?+8LzPRP4xr3HnppEUpdJaeexoS8UitAOh9EPmju/81QG/91l0ve7Gdr6X8l/?=
 =?us-ascii?Q?7Gt7+S/G8FSHM8aX7TYKNIZ1PU5bMrZR+xcxVnestVEtV1qvQD33BYtyZ/QR?=
 =?us-ascii?Q?Sicvy11eGtVZSDCH3QRtSQZCUE9XdbxkgwoafFV6I2zUeE7qNmHTLycPh2cd?=
 =?us-ascii?Q?iatj74/TqTY99J4gO77ATDtLhRDBiV+69g4QkcHiQgolxnVd2ytjJBBxqplY?=
 =?us-ascii?Q?xMF3LTPENyVBB6fKsKJtXsAiaGfZe9TS5+8XI2uClk/RgluEOcsFfKjfEQnH?=
 =?us-ascii?Q?gFufqXk0Wn7yQ+4V/S3r2Q9wEP6yLtGYVzPjWyspsKfkzPi0vpn/GivplXCX?=
 =?us-ascii?Q?mzTBNKxc7AxtbipNuCDMh7Vc/745zPzHaGY6zwaxgWmJIdu2feH/9s3Nf+po?=
 =?us-ascii?Q?KO6RHZ5zsQbhmvBHjVza5BC5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee795a2-a69c-4a83-77a4-08d9407e3ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 13:02:01.3483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4vpLHBTC27wsMljh3XywL2hhtK1EJDlpzcfLtS0SDBAXjcxu3MDw+uc3MWggNJXExnoHe1Pbq6RcEmBIYd11f7oFnmL/cq7of7B4YwuqCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1469
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_06:2021-07-02,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060062
X-Proofpoint-ORIG-GUID: JNLwgTvbVo12wfInUj0W2q_tdM8DYu4W
X-Proofpoint-GUID: JNLwgTvbVo12wfInUj0W2q_tdM8DYu4W
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060062
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Cumulus Networks <support@cumulusnetworks.com>

The driver only fills the most significant 8 bits of the fan tach
count (11 bit value). Fixing the driver to use all of 11 bits for
more accuracy.
---
 drivers/hwmon/max6620.c | 105 ++++++++++++++++++----------------------
 1 file changed, 46 insertions(+), 59 deletions(-)

diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 3c337c7b0f4d..2cd3b0beb6b4 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -46,6 +46,8 @@
=20
 /* clock: The clock frequency of the chip the driver should assume */
 static int clock =3D 8192;
+static u32 sr =3D 2;
+static u32 np =3D 2;
=20
 module_param(clock, int, S_IRUGO);
=20
@@ -213,22 +215,22 @@ static ssize_t get_fan(struct device *dev, struct dev=
ice_attribute *devattr, cha
=20
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D max6620_update_device(dev);
-	int rpm;
-
-	/*
-	 * Calculation details:
-	 *
-	 * Each tachometer counts over an interval given by the "count"
-	 * register (0.25, 0.5, 1 or 2 seconds). This module assumes
-	 * that the fans produce two pulses per revolution (this seems
-	 * to be the most common).
-	 */
-	if(data->tach[attr->index] =3D=3D 0 || data->tach[attr->index] =3D=3D 255=
) {
+	struct i2c_client *client =3D to_i2c_client(dev);
+	u32 rpm =3D 0;
+	u32 tach =3D 0;
+	u32 tach1 =3D 0;
+	u32 tach2 =3D 0;
+
+	tach1 =3D i2c_smbus_read_byte_data(client, tach_reg[attr->index]);
+	tach1 =3D (tach1 << 3) & 0x7f8;
+	tach2 =3D i2c_smbus_read_byte_data(client, tach_reg[attr->index] + 1);
+	tach2 =3D (tach2 >> 5) & 0x7;
+	tach =3D tach1 | tach2;
+	if (tach =3D=3D 0) {
 		rpm =3D 0;
 	} else {
-		rpm =3D ((clock / (data->tach[attr->index] << 3)) * 30 * DIV_FROM_REG(da=
ta->fandyn[attr->index]));
+		rpm =3D (60 * DIV_FROM_REG(data->fandyn[attr->index]) * clock)/(tach * n=
p);
 	}
-
 	return sprintf(buf, "%d\n", rpm);
 }
=20
@@ -236,22 +238,21 @@ static ssize_t get_target(struct device *dev, struct =
device_attribute *devattr,
=20
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D max6620_update_device(dev);
-	int kscale, ktach, rpm;
-
-	/*
-	 * Use the datasheet equation:
-	 *
-	 *    FanSpeed =3D KSCALE x fCLK / [256 x (KTACH + 1)]
-	 *
-	 * then multiply by 60 to give rpm.
-	 */
-
-	kscale =3D DIV_FROM_REG(data->fandyn[attr->index]);
-	ktach =3D data->target[attr->index];
-	if(ktach =3D=3D 0) {
+	struct i2c_client *client =3D to_i2c_client(dev);
+	u32 rpm;
+	u32 target;
+	u32 target1;
+	u32 target2;
+
+	target1 =3D i2c_smbus_read_byte_data(client, target_reg[attr->index]);
+	target1 =3D (target1 << 3) & 0x7f8;
+	target2 =3D i2c_smbus_read_byte_data(client, target_reg[attr->index] + 1)=
;
+	target2 =3D (target2 >> 5) & 0x7;
+	target =3D target1 | target2;
+	if (target =3D=3D 0) {
 		rpm =3D 0;
 	} else {
-		rpm =3D ((60 * kscale * clock) / (ktach << 3));
+		rpm =3D (60 * DIV_FROM_REG(data->fandyn[attr->index]) * clock)/(target *=
 np);
 	}
 	return sprintf(buf, "%d\n", rpm);
 }
@@ -261,9 +262,11 @@ static ssize_t set_target(struct device *dev, struct d=
evice_attribute *devattr,
 	struct i2c_client *client =3D to_i2c_client(dev);
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D i2c_get_clientdata(client);
-	int kscale, ktach;
-	unsigned long rpm;
+	u32 rpm;
 	int err;
+	u32 target;
+	u32 target1;
+	u32 target2;
=20
 	err =3D kstrtoul(buf, 10, &rpm);
 	if (err)
@@ -271,25 +274,13 @@ static ssize_t set_target(struct device *dev, struct =
device_attribute *devattr,
=20
 	rpm =3D SENSORS_LIMIT(rpm, FAN_RPM_MIN, FAN_RPM_MAX);
=20
-	/*
-	 * Divide the required speed by 60 to get from rpm to rps, then
-	 * use the datasheet equation:
-	 *
-	 *     KTACH =3D [(fCLK x KSCALE) / (256 x FanSpeed)] - 1
-	 */
-
 	mutex_lock(&data->update_lock);
=20
-	kscale =3D DIV_FROM_REG(data->fandyn[attr->index]);
-	ktach =3D ((60 * kscale * clock) / rpm);
-	if (ktach < 0)
-		ktach =3D 0;
-	if (ktach > 255)
-		ktach =3D 255;
-	data->target[attr->index] =3D ktach;
-
-	i2c_smbus_write_byte_data(client, target_reg[attr->index], data->target[a=
ttr->index]);
-	i2c_smbus_write_byte_data(client, target_reg[attr->index]+0x01, 0x00);
+	target =3D (60 * DIV_FROM_REG(data->fandyn[attr->index]) * clock)/(rpm * =
np);
+	target1 =3D (target >> 3) & 0xff;
+	target2 =3D (target << 5) & 0xe0;
+	i2c_smbus_write_byte_data(client, target_reg[attr->index], target1);
+	i2c_smbus_write_byte_data(client, target_reg[attr->index] + 1, target2);
=20
 	mutex_unlock(&data->update_lock);
=20
@@ -609,8 +600,11 @@ static int max6620_init_client(struct i2c_client *clie=
nt) {
 	}
=20
=20
-
-	if (i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config)) {
+	/*
+	 * Set bit 4, disable other fans from going full speed on a fail
+	 * failure.
+	 */
+	if (i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | 0x10))=
 {
 		dev_err(&client->dev, "Config write error, aborting.\n");
 		return err;
 	}
@@ -618,28 +612,21 @@ static int max6620_init_client(struct i2c_client *cli=
ent) {
 	data->config =3D config;
 	for (i =3D 0; i < 4; i++) {
 		data->fancfg[i] =3D i2c_smbus_read_byte_data(client, config_reg[i]);
-		data->fancfg[i] |=3D 0x80;		// enable TACH monitoring
+		data->fancfg[i] |=3D 0xa8;		// enable TACH monitoring
 		i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
 		data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
-		data-> fandyn[i] |=3D 0x1C;
+                /* 2 counts (001) and Rate change 100 (0.125 secs) */
+		data-> fandyn[i] =3D 0x30;
 		i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
 		data->tach[i] =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
 		data->volt[i] =3D i2c_smbus_read_byte_data(client, volt_reg[i]);
 		data->target[i] =3D i2c_smbus_read_byte_data(client, target_reg[i]);
 		data->dac[i] =3D i2c_smbus_read_byte_data(client, dac_reg[i]);
=20
-
-
 	}
-
-
-
 	return 0;
 }
=20
-
-
-
 static struct max6620_data *max6620_update_device(struct device *dev)
 {
 	int i;
@@ -678,7 +665,7 @@ static struct max6620_data *max6620_update_device(struc=
t device *dev)
 	return data;
 }
=20
-module_i2c_driver(max6620_driver);
+// module_i2c_driver(max6620_driver);
=20
 static int __init max6620_init(void)
 {
--=20
2.32.0

