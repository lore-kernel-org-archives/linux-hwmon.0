Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0844C07E96
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A447161A46
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhGFNFK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 09:05:10 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:49298 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231485AbhGFNFF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Jul 2021 09:05:05 -0400
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166CfiuW015137;
        Tue, 6 Jul 2021 09:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=fi8MjcEiaqMrLHHL49HATIKZOQb4m/jzE1ZyVQ2bs8E=;
 b=KisWzOtyWrCYB1CYd++bGBlZ7or6u94PeLQuGxVmk57M5Eh7IF/NJVjSOT29yGVSgPJn
 OrxT65Bzj98fwQWrWrIQy7Sdg3kp/WwF8Qd9fbWsqIivVAdZ9kcwbngi0GgLe8RPiX5h
 PZqVaJvxmx2bB3DK/zeQ58v21ch8QYkRvhJr0CpKaxsTKfZ2CXTUJLDLsJ8iZV6nv8PD
 GwxYhbAwFq09CggLJYX4LV72ZVbsJmQNUPsqjFc7WjC8ZtAWObnhG3dhJh2fUmTfIyKC
 cTpDWbdygDDBvttYmVH9I+LCJkJdPApf5XZdZqQOeqzNkZ4Hut9LvNNerHk2menApneh 5w== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 39m5pfvank-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jul 2021 09:02:12 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166Cirja048572;
        Tue, 6 Jul 2021 09:02:12 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by mx0b-00154901.pphosted.com with ESMTP id 39mj7jcutn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Jul 2021 09:02:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkOjSmH3LhMIRSK0hNO42aszSeP1KtM2CfngqZUP/kAPCkie363Yf1TgaXI/DzkkucEHZbQrESzyL9XjdjEkQ7X5Qfw6IcFSP1sksYk099KHpTM+3baOSI2KPDIlAEfLRxNl5AaEf488CIkzbDNxNUfIYfao183jauWJTxEOOp22A7EA+2jGiGtTb8oD9aXW1noL4uiKd3E/bK0t1Ea8iTPXYuPkD3+p0Tw7EcGJdoGPUT555Md1UuHo6eodmQCTUk7L+vuJtbwSfsWHkTIWnfyIwtB6uV6WeAkNKJ1YTd8lNBh5QCUYm4M4DEX2WUjN8o30b+vnPlkQiBHItlwGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi8MjcEiaqMrLHHL49HATIKZOQb4m/jzE1ZyVQ2bs8E=;
 b=jhJkd1ZduI+KvJDqDCk5/Tnydyw8zjAPGwW2G/4FOsW71+/mQbIfQKUD8hqQshHrnEoqGdvzDf/NVYC2yzRq9n83sMlYNep/eUj2YEhicNON9NoEZd+M5/y8n0Al+3/zyz28OGXfrRrPc7a6KyNSRXf/y8C7LDU+yGaWUDqF4d0Jn9Tm5iQcXq7K4tXcfI7t9A8+Lf/09Qt6tgeSxXib7RAkvC0OXDDBkaWScKO6vgbWCZrrMkXveQk16E2R+iPdLdwiQm2m9ilMgTAP0tfxCiPdUt9SUAFuLX1K4W/zZWV8201zVgCEHDmemXFA6fZVeh7s4S/8n7i+0oA/rvTOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MWHPR19MB1469.namprd19.prod.outlook.com (2603:10b6:300:d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:02:11 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372%6]) with mapi id 15.20.4308.020; Tue, 6 Jul 2021
 13:02:11 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 4/5] hwmon: Add attributes in MAX6620 driver to retrieve fan
 fault status
Thread-Topic: [PATCH 4/5] hwmon: Add attributes in MAX6620 driver to retrieve
 fan fault status
Thread-Index: AddyZbb7YM8omHGaRHm6ZzidpDaPHg==
Date:   Tue, 6 Jul 2021 13:02:11 +0000
Message-ID: <MW2PR1901MB2028EF5C6EBAF7EC8F51ED4CA61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-07-06T13:02:06.5816109Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=61eb3a4d-7545-49bf-b088-efdd4b5af9b5;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f62788e-c8b8-4811-8cc3-08d9407e44b4
x-ms-traffictypediagnostic: MWHPR19MB1469:
x-microsoft-antispam-prvs: <MWHPR19MB14697BAD9CC04DE663CE23C5A61B9@MWHPR19MB1469.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ho4YjAYref14eGcDc+ETlxg0jexSUn1nQ6puW7tJUvrxOOXdoREq5CZ0s3Cpuy99GB05QruVEt/93XFLFoqbUhc2PoGAUXosQjLCuEpCejWqV88N8frw1tDWZp+V7d9odbaqm4skt2SKaM5XXq5QsdlPyLbEW4fVLFNsdfAEhKkCMPCd9LfWCgr2Y7hlGEu0y9Ct5aMvubftDBqvprpneDDvHgysoAFFzh4MXXQu7xmMtb6F/woH3iuLR3CRWcsnJlx28ZgxfCelYdvKW8+hCFa3fi5t03yOuWDCU9yMeYHT4+qWcurl3ZPVzb1mfeMWYFMWHGO67wH1fdzmzhjZEVfyIqKu95s/MHdBETCyJRIT4D95CRwLo37ZOxV13pi2JeaMJ9mVjg5wTYiS57/GjNP3qfY85hMDr2lJWdRIPY38p5OTi4YJwiCMPcpHSA1D5clpt0kNCGG7UANTk79rAdnYjtuce/LptokweHGL9j1rr5zX9bWaElDdmfnyPqiCBAjBMBWbg8jxvJEYiADi7th97+1J7o/upoiOjEO2IP1NWxGilcFccv1arItEpB5H9wN5egn693i4gIP8Vaf4poF2Yeo1IZaK6VPt52O8TH0QfREd9JRs+ijqefdaax6o4MnxfkiesQ3T23Ya3Sy4IA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(5660300002)(33656002)(8936002)(66946007)(110136005)(83380400001)(66556008)(26005)(8676002)(7696005)(786003)(66476007)(76116006)(55236004)(316002)(86362001)(6506007)(478600001)(2906002)(122000001)(64756008)(52536014)(4326008)(186003)(55016002)(9686003)(66446008)(71200400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?68+/5pbnPb7919NLxHBRA2aynSYUtESvgVoQRm0TiUiO62UtLTFMGA9dJVhN?=
 =?us-ascii?Q?/4XgG53fq2zuN8jRsZGWE+T1YwJZn2dhOpr2SeTLsh2lv6ej4SDMf4DKZdan?=
 =?us-ascii?Q?VW4iyFfiOBxP/nhtpFoyawUwxGSkpxtUbFQIgtXN12yRjP/RuTSV/OvDEdbS?=
 =?us-ascii?Q?scjHPvae9Ri2UA/BilOX95s9dx3J5CV6mzwqFCpO7yfchhY47WZs5/Jh4jQ+?=
 =?us-ascii?Q?x2zxgj+3105JOnh2Zyn7kTFgEnQsyGBLvx5m3RVWGEbBbosdQgPCed2KH7Iz?=
 =?us-ascii?Q?A/uzOx6zXb860p0UoPYbr3LL3roPm4hbi/oDnhodV/wuKnqrvMgh4KtpBd9P?=
 =?us-ascii?Q?Y8xp+PpKr6OmDq2Nm9nY56qPXVR/PPvE6oLEXlpJkTUL/j+UQ0r7/6NmD5Qo?=
 =?us-ascii?Q?ZqXnZ0GyiH2+0hyOH4NvXe19kF91CL0mCSIRYT4t4yaiaiG81b0o75jrjiSO?=
 =?us-ascii?Q?IiNRGX9b42DDKZ+ia+RrfwsEN9oc6uyaK+6zVfzBc7RQxl6m+oiRE/kWlBCt?=
 =?us-ascii?Q?a/+pUJChKOI0xTtH/glgvJQ2ldZgs6sPgO8C0qYr82k/UfIZWIezqAYjG70Y?=
 =?us-ascii?Q?M3SfJ6g2Tl07y/GSr5W+mRLsMfHFDbg/P1WMhVR1QoukZlix/34CHVvfhnOy?=
 =?us-ascii?Q?Mn44RkDMSk50N1TsRsK4taZTN4QBp179zfl/V0oEL2X//OYVIBn/Ell5CgtL?=
 =?us-ascii?Q?BLz2GFKm5D0nKTONKT24PO4bwKYwRYxJ9maPHffZc7IYRcD3PnFy3jJ8njRf?=
 =?us-ascii?Q?tFUg6E4ZddGHWV0XiYEX+XbvxTN7FykfZLaAHE/+K8YDB+m40YZBGCJcNkjw?=
 =?us-ascii?Q?rdDDwoVjsj/sfMK9LXNY6WSzY0pWgotYPH9nFtdjmMTJUDKJqr2v78oq3vnd?=
 =?us-ascii?Q?BB0xQmXa9Gc5XBpa9Zoma8OK44PCwQkOSoIlrZdV4tSFbsdwyuTBRZa9k741?=
 =?us-ascii?Q?Ab6YrBLYHAQGQI8syf66QBhTXL/a5C2QnP8qkCS2hyFJJfdR3JEoXlDtJFWc?=
 =?us-ascii?Q?IBZzfMuTWQ2XXin/vAP9g7cu7qGwoxpxTUYhmHn61c5VYZSMFFvkZCP6ZnNI?=
 =?us-ascii?Q?vPJZ3+WJz3gZMSKw6LqqE9yyuRYqOXJl7bKRMhtQxqQgAuu6PvY91LDu57kB?=
 =?us-ascii?Q?dEU8SEISe07i7uwPRra8nsLBDzSUA3WtpqOM+pZmV5gMguuCC4kuii/JgHBY?=
 =?us-ascii?Q?64So8ejFAT5pMCSO0vdbSxBdoWMnyDFJxmT/jiqIgYiZf/ZhcOWRF4N8Icu+?=
 =?us-ascii?Q?Wyr47ogq0radDn4stujVmfDzCa8+gGJ3ufjkU/Nxuqsbxwc/PI8eMCr0p0Q5?=
 =?us-ascii?Q?n/FWc8YTcxX8qCOviUDupuxN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f62788e-c8b8-4811-8cc3-08d9407e44b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 13:02:11.0926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J6c3FeafZzsxtJDeP3kL+n1GlUqjvUQWjs9z9hML5f2SEIAKVB4AexavNb5z+qquk/PiRhS7j+AJmsA9i2Ip+Ro7ysK+Kn3+nTtJUIo8sH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1469
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_06:2021-07-02,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060062
X-Proofpoint-ORIG-GUID: yqSEhhPXhmdEcm7_C3Ub8JM20pfm1hVG
X-Proofpoint-GUID: yqSEhhPXhmdEcm7_C3Ub8JM20pfm1hVG
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060062
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>

Add fan*_alarm attributes in MAX6620 driver to retrieve fan fault status

Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
---
 drivers/hwmon/max6620.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 5c8b155ca155..6f921bbf3831 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -283,6 +283,9 @@ static ssize_t set_target(struct device *dev, struct de=
vice_attribute *devattr,
 	i2c_smbus_write_byte_data(client, target_reg[attr->index], target1);
 	i2c_smbus_write_byte_data(client, target_reg[attr->index] + 1, target2);
=20
+	/* Setting TACH count re-enables fan fault detection */
+	data->fault &=3D ~(1 << attr->index);
+
 	mutex_unlock(&data->update_lock);
=20
 	return count;
@@ -469,14 +472,11 @@ static ssize_t get_alarm(struct device *dev, struct d=
evice_attribute *devattr, c
 	struct i2c_client *client =3D to_i2c_client(dev);
 	int alarm =3D 0;
=20
+	mutex_lock(&data->update_lock);
 	if (data->fault & (1 << attr->index)) {
-		mutex_lock(&data->update_lock);
 		alarm =3D 1;
-		data->fault &=3D ~(1 << attr->index);
-		data->fault |=3D i2c_smbus_read_byte_data(client,
-							MAX6620_REG_FAULT);
-		mutex_unlock(&data->update_lock);
 	}
+	mutex_unlock(&data->update_lock);
=20
 	return sprintf(buf, "%d\n", alarm);
 }
@@ -485,6 +485,10 @@ static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan=
, NULL, 0);
 static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan, NULL, 1);
 static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, get_fan, NULL, 2);
 static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, get_fan, NULL, 3);
+static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, get_alarm, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, get_alarm, NULL, 1);
+static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, get_alarm, NULL, 2);
+static SENSOR_DEVICE_ATTR(fan4_alarm, S_IRUGO, get_alarm, NULL, 3);
 static SENSOR_DEVICE_ATTR(fan1_target, S_IWUSR | S_IRUGO, get_target, set_=
target, 0);
 static SENSOR_DEVICE_ATTR(fan1_div, S_IWUSR | S_IRUGO, get_div, set_div, 0=
);
 // static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO, get_enable, s=
et_enable, 0);
@@ -507,6 +511,10 @@ static struct attribute *max6620_attrs[] =3D {
 	&sensor_dev_attr_fan2_input.dev_attr.attr,
 	&sensor_dev_attr_fan3_input.dev_attr.attr,
 	&sensor_dev_attr_fan4_input.dev_attr.attr,
+	&sensor_dev_attr_fan1_alarm.dev_attr.attr,
+	&sensor_dev_attr_fan2_alarm.dev_attr.attr,
+	&sensor_dev_attr_fan3_alarm.dev_attr.attr,
+	&sensor_dev_attr_fan4_alarm.dev_attr.attr,
 	&sensor_dev_attr_fan1_target.dev_attr.attr,
 	&sensor_dev_attr_fan1_div.dev_attr.attr,
 //	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
--=20
2.32.0

