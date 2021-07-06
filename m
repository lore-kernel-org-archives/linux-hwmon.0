Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615B1C07E9C
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4159861C33
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbhGFNFN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 09:05:13 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:50438 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231836AbhGFNFG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Jul 2021 09:05:06 -0400
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166Ch34r020721;
        Tue, 6 Jul 2021 09:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=kSignp1uvxvQzuP/XgyOpEedf6ydwWk5CMRCWfRL4Y0=;
 b=cM7rrHrNQnLUmHcfLiOfrZuCReO1giICf4vsGuJLFe/7MAt8c5WxonN09PzUo2gu4bbf
 xL5b/loMAKoUskuMf+x1IQ1eOGrtVDpJaaN6vSDIi2v9s5lFwW7Jfkai0p3ODdBzU1rw
 qSsUskRfgMRD+ArraoBgSICslUi3lP7KIMl6ksICIugiCalkn7NhCUY1FeXbMHMda8ym
 HbOjnBm8F1tnC+ZMrTEE0z43O0bBSrcu/MIXFUQ2mu9cdzJ/h1cj6e+cJKJnQgAaTLql
 VJwQgurkcWd6wG56igFtYbxVFHw/BKi1k6/MJBJSxBH9YvFLTElyla/1FqiNPaUeaZYU 6g== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 39m77fkxhg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jul 2021 09:02:13 -0400
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166CiaIj022400;
        Tue, 6 Jul 2021 09:02:11 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        by mx0b-00154901.pphosted.com with ESMTP id 39mjx0vckk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Jul 2021 09:02:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJtP1U2wCrl9ErVPw9OU021+NAVxtyofaY7eFnnUzvA7kAn/xNAQz/JgtimbD1BxX1l3EhFlV95hlrHV1a/Hat4pi4WLQvcYIv+gCXyakmz+133RS8sMdCYdIJDl/GNIET5y4rlFH2N10pIQGBP1Dj2H2q9SR6+PxxBfQha6u6igyhmRe2eMZlwaOwX304HDjrrLOrf9epeO8MzgN+tTPVod5fTG1O6LNSBv7hynHKV1h1sSNhr99dRFOL4PYDvbKRuYmdhjA/Zz5FLhUO27VSk6Zd+XmNYCClm9m7+UrDgzLOMEU26fJgh2sq6EQ8Nor+rtNfiz8ai3au3/+aw4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSignp1uvxvQzuP/XgyOpEedf6ydwWk5CMRCWfRL4Y0=;
 b=SdNdlDjuwIy1aMyz0GHhMU9TXj8rREjYojcECUkVDQPnETX4KdGSHgH6DGa1Vk2Tb3mWjbS7vMsLnlzYlpldmxWVDu7cye7ylD+b5w02sfjjLGW5CfdHd7ZGVBwyR9SEMnC2owLwwSoMi5qKzZ/FpVcpKgARKokinII337dSWO9ONc2qdjLdMnzmh42JFysRHCUMML+gpeDAGctVcgTfDtlfW51lrJfhXC0TMYA52+C4dvgh7DpaMcZSZW8uUrnXObA3U48F83/VogLmArTLd7Lb93zfrQvSE2JmMJf1MPf0TRhxaZSoRjYEu228QXwGAudSa2BidVGAlgnq2F9OBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MWHPR19MB1469.namprd19.prod.outlook.com (2603:10b6:300:d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:02:05 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372%6]) with mapi id 15.20.4308.020; Tue, 6 Jul 2021
 13:02:05 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 3/5] hwmon: Update MAX6620 driver to support newer kernel
Thread-Topic: [PATCH 3/5] hwmon: Update MAX6620 driver to support newer kernel
Thread-Index: AddyZXk4CgsgsEd+Q1CcnwYxK8Gi7g==
Date:   Tue, 6 Jul 2021 13:02:05 +0000
Message-ID: <MW2PR1901MB2028238BF8D04C0F15ACDF76A61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-07-06T13:02:01.6485527Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=db4a4ecf-fffc-4d6a-980c-0fab5c79eaec;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee3ed707-64b5-4f19-0a08-08d9407e417f
x-ms-traffictypediagnostic: MWHPR19MB1469:
x-microsoft-antispam-prvs: <MWHPR19MB1469B58A18FEB61638F91237A61B9@MWHPR19MB1469.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hBcPiJUtQkeOkSPXbu60gXsU9dq5XF6fL75SO7E35Z+BBGzBzcckWxAruckzjxzTwGkzNhJWsmRAz1Ps6i8hst5ElZ8uZ42/+VWlj5JkCFUpQIJKqdDx6Z2S7jirwyNT56UhcQMCAzdEAftA3xOo1pCGURV7G9Vh4stl5UW+y2jwX+1eBRG5koSsfpbsW64zd3MzUD1Yy0Q197IGG6TjeXDTSXg7jLrP7z0jZbU7FCU0hkyH+pNuHLwVQoWc8UXxkniA862NBJO4QkMLz/PS2KQrtsWIRE7C4h6gPEQgI5gCpR1+YR99kBFv9vywnODVvvm+q1Yu6XdnSuyBw4ac0PhTL4HxWZJ9L8v1H9X0OqtaXm0a/xnyBLKPiu1e/rn8e4K39ark5r+eo6IZyxq6cRDU5QZshwG5MOzo9VMnGTVWe1kbtcLjZ07uByuyfT2WVWl78YGvs4m1jEt1ttbfSNTzTZHhhZjFY2JufDB78CCOXQW4fogT4iNeyWbzx1ASVft8YDmsscUTrWwxewmeHil5Sxbadgruf0w1uVXEz/nL3ablBMCpkBaQcTcKOY9nlaM3XpSMWwW9N9c5MmL7WPgfCRcN1LrPJ9heRcCN2XD5vHubVLuGrn+6fnZhBLBQtCcEIx+m96v3FMLmBVFO+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(5660300002)(33656002)(8936002)(66946007)(110136005)(83380400001)(66556008)(26005)(8676002)(7696005)(786003)(66476007)(76116006)(55236004)(316002)(86362001)(6506007)(478600001)(2906002)(122000001)(64756008)(15650500001)(52536014)(4326008)(186003)(55016002)(9686003)(66446008)(71200400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c1K/TRezMOUyy5S8F2SdJPKsAA7VAi/1/0CgpPWJLd0OEUSe/tNxuNtKX/0o?=
 =?us-ascii?Q?lntT1vOCo42za3Pd77JbEXHzuqBTqko8FWUSct7R6dP6wt89/h3RHHOVfbtG?=
 =?us-ascii?Q?8kD+rxT2l9H4XHWSm7C77odzlgwtutVMRa7O8dapUv3Qg7SCuRNeImgwESAC?=
 =?us-ascii?Q?S434aFizn9Wemm/O5PB23PsQ1NxFo2oin+LMgmi/53lDnTXHo73A7w6kFUjI?=
 =?us-ascii?Q?m+jUvj+78qAeosqT0/+te8juQDWU69IQmGZgRkZloAq+m38QDd16DbTGMofq?=
 =?us-ascii?Q?5rBnkkRExxcKS+TVdnCL2nVMLaTJW2M9o2kNekmxWZ9X3Jce1L7SJPC0n3SR?=
 =?us-ascii?Q?rCnqbQx5XrvV/0lYREot4w9WZZOaihI6/Ocz+JJ0qvWqgC2HwukU4B5deCY6?=
 =?us-ascii?Q?4AdDEVulSrSscZLFrBdbG1BTeIGXgIgqTDC1L0JA2ISN5jjgWbKEgHrkqbt3?=
 =?us-ascii?Q?9RjWOMOGepBXyzqp4fcXZOyF3JJBGfdBGq9Wm1GCr/9S9HmoQHJDtLkqthK0?=
 =?us-ascii?Q?/s2ZZfs7f2rCetM8TUQ1dvQ0/Er/fjOdTV1j8cZvZyKw69XGdGiLUyZDRgc2?=
 =?us-ascii?Q?x5Le4gW6xGnQW0AT8u7UI1uN1N437AgpYfebLZ8zb1fAXnGV8uYeuiVcB7UT?=
 =?us-ascii?Q?+DENiIy/ogLK9r8uu06hberctuaRbyj04s8nb2a3c7UDfaQc0fzWjcZYvRJj?=
 =?us-ascii?Q?wnhGa+eWKgk+DzA87wTV44nG8kfSbJ+GZEAopRO04QiReqTIEBdqV0DzPPrW?=
 =?us-ascii?Q?g9HIA920zSjOaXm3IO60KjRb6UyPlrxJchJldKCDtBCKI5Hy87y/2bTO2tsX?=
 =?us-ascii?Q?gdZtkcJB6gAwCjJ+DJKCIZ3pnc1AdkcRXcZ651JcR234gIj4kgyistxEvq7O?=
 =?us-ascii?Q?JGM7VhCk0ZalniitVCmQiLkxadtRsS0G0hnLQAR0Y0OlzK3ZtHmC97yMD6dE?=
 =?us-ascii?Q?URfJOq/YG/+smUaE0jP7Yu3mciHD5tnMSkwyVgDGjNFfa9H03gDtpxDSOYaT?=
 =?us-ascii?Q?Z6LSKCDkX78+xX1hRxNA2EMQ0lvMO9yhZWM1IU+BH6RKZK39fEMpF3Y6+PQF?=
 =?us-ascii?Q?sFCAOkU8VUS5hn7SrMyHzr6yYKdi44CIEIO59GSXu+5/aDocyjHtsCwrvD79?=
 =?us-ascii?Q?CUB5xDGon/s0JI2D21h7ueydzSkitJmuEcE8BY/YaVE29uIrNcLdeBa9ePYP?=
 =?us-ascii?Q?joc3GxRC7tMx7/3Js7fo9gY9HFdn+PjaCNJWmR26m5Cs1Mc1hjj1JLJKOS23?=
 =?us-ascii?Q?XcmcXdca+Fdi6oCJA4caCvcBtQyou5Skt+P/C5kZ5tQU1Qg/0eX24CyhQvtY?=
 =?us-ascii?Q?QfgrjLs5uytOwchZfQV8FagB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3ed707-64b5-4f19-0a08-08d9407e417f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 13:02:05.7767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B81Pm08RSwP/aCr50du/m9nkyT/p1Re+Ng+i6xnAzBh9UdpqjGSzd6fWtFv5DaZJfyqoEchD5nCE6u4/N7Px6zkFiVrYsCysg5KVoLCrBmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1469
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_06:2021-07-02,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107060062
X-Proofpoint-ORIG-GUID: XMeSvbg7zsnolrFNA5q6qjRoRRQOch9H
X-Proofpoint-GUID: XMeSvbg7zsnolrFNA5q6qjRoRRQOch9H
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060062
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Shuotian Cheng <shuche@microsoft.com>

Update MAX6620 driver to support newer kernel version

---
 drivers/hwmon/max6620.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 2cd3b0beb6b4..5c8b155ca155 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -183,7 +183,7 @@ static struct i2c_driver max6620_driver =3D {
 		.name	=3D "max6620",
 	},
 	.probe		=3D max6620_probe,
-	.remove		=3D __devexit_p(max6620_remove),
+	.remove		=3D max6620_remove,
 	.id_table	=3D max6620_id,
 	.address_list	=3D normal_i2c,
 };
@@ -231,6 +231,7 @@ static ssize_t get_fan(struct device *dev, struct devic=
e_attribute *devattr, cha
 	} else {
 		rpm =3D (60 * DIV_FROM_REG(data->fandyn[attr->index]) * clock)/(tach * n=
p);
 	}
+
 	return sprintf(buf, "%d\n", rpm);
 }
=20
@@ -262,17 +263,17 @@ static ssize_t set_target(struct device *dev, struct =
device_attribute *devattr,
 	struct i2c_client *client =3D to_i2c_client(dev);
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct max6620_data *data =3D i2c_get_clientdata(client);
-	u32 rpm;
+	unsigned long rpm;
 	int err;
-	u32 target;
-	u32 target1;
-	u32 target2;
+	unsigned long target;
+	unsigned long target1;
+	unsigned long target2;
=20
 	err =3D kstrtoul(buf, 10, &rpm);
 	if (err)
 		return err;
=20
-	rpm =3D SENSORS_LIMIT(rpm, FAN_RPM_MIN, FAN_RPM_MAX);
+	rpm =3D clamp_val(rpm, FAN_RPM_MIN, FAN_RPM_MAX);
=20
 	mutex_lock(&data->update_lock);
=20
@@ -326,7 +327,7 @@ static ssize_t set_pwm(struct device *dev, struct devic=
e_attribute *devattr, con
 	if (err)
 		return err;
=20
-	pwm =3D SENSORS_LIMIT(pwm, 0, 255);
+	pwm =3D clamp_val(pwm, 0, 255);
=20
 	mutex_lock(&data->update_lock);
=20
@@ -534,7 +535,7 @@ static struct attribute_group max6620_attr_grp =3D {
  * Real code
  */
=20
-static int __devinit max6620_probe(struct i2c_client *client, const struct=
 i2c_device_id *id) {
+static int max6620_probe(struct i2c_client *client, const struct i2c_devic=
e_id *id) {
=20
 	struct max6620_data *data;
 	int err;
@@ -575,7 +576,7 @@ dev_info(&client->dev, "Sysfs entries created\n");
 	return err;
 }
=20
-static int __devexit max6620_remove(struct i2c_client *client) {
+static int max6620_remove(struct i2c_client *client) {
=20
 	struct max6620_data *data =3D i2c_get_clientdata(client);
=20
@@ -599,7 +600,6 @@ static int max6620_init_client(struct i2c_client *clien=
t) {
 		return err;
 	}
=20
-
 	/*
 	 * Set bit 4, disable other fans from going full speed on a fail
 	 * failure.
@@ -615,14 +615,13 @@ static int max6620_init_client(struct i2c_client *cli=
ent) {
 		data->fancfg[i] |=3D 0xa8;		// enable TACH monitoring
 		i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
 		data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
-                /* 2 counts (001) and Rate change 100 (0.125 secs) */
+		/* 2 counts (001) and Rate change 100 (0.125 secs) */
 		data-> fandyn[i] =3D 0x30;
 		i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
 		data->tach[i] =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
 		data->volt[i] =3D i2c_smbus_read_byte_data(client, volt_reg[i]);
 		data->target[i] =3D i2c_smbus_read_byte_data(client, target_reg[i]);
 		data->dac[i] =3D i2c_smbus_read_byte_data(client, dac_reg[i]);
-
 	}
 	return 0;
 }
@@ -665,8 +664,6 @@ static struct max6620_data *max6620_update_device(struc=
t device *dev)
 	return data;
 }
=20
-// module_i2c_driver(max6620_driver);
-
 static int __init max6620_init(void)
 {
 	return i2c_add_driver(&max6620_driver);
--=20
2.32.0

