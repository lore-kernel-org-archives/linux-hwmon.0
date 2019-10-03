Return-Path: <SRS0=ibG4=X4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AD7C10F14
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 18:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CD8420865
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 18:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="uRdyPfT6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730908AbfJCSep (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Oct 2019 14:34:45 -0400
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:58122 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729993AbfJCSeo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 3 Oct 2019 14:34:44 -0400
Received: from pps.filterd (m0118790.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x93IFXN2024618
        for <linux-hwmon@vger.kernel.org>; Thu, 3 Oct 2019 14:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps-02182019;
 bh=VB4ygAGMJZASKcWcZhQkIf3Q/hB7wAnCJZgMZ4WHfgA=;
 b=uRdyPfT6LdMvE/fNIxb4R/YyBl5XimdS1WCoIt2ZnbLfCxnx2ywxzy6pwtPmj6J0UKie
 79buyKqUG/CR4mjrB2zzQIE1PKRrmHLdPOeMD/zYWEdE3QawWqCC9q/0MS8/FgrlPesl
 1n3tWXtf9sZnhpoDZI0tHkeqLPGnI/UIkHg7TZ9XVuRuwlirdpOa0HFfnFyX2r1lVRIr
 Y4fjCf1/hFt8b/x06HWp5TcPPfTb856m7s6EamLvy9OrxDMbAHL0QdllHZNuIgCNgY2b
 2nKY0FF+Oyu+mfhVltUH71S0/UNY2VCULK2d5Y3wJtcHewHVaDIaWeW4s5tMvPBziwqa pQ== 
Received: from nam04-co1-obe.outbound.protection.outlook.com (mail-co1nam04lp2058.outbound.protection.outlook.com [104.47.45.58])
        by mx0a-002ab301.pphosted.com with ESMTP id 2vd1ec184e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Oct 2019 14:34:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBE+QxAc2d2B/NU7/D4K6O34DdxrijNXorwwUMl5DnwCAzhEouXEuze+yINBUrHoTp+yrlwgfCS9/heQOI0GTBicuCOPbfzqyZBfpKt3HgoeX6v1sL3nsBSUohBhQ3l98rbtzViOybkhMPt+IZ8R9qAmoZ/BUJ/ecYzxmCzCQTfmT/i5pJmtgUkNE7VfJxUurbPIDnTIgNDk4a5LLhwFCDpZiXoJpJekLoyTs4OPxEPNUZY8Hpqa9fMQym14z0t+LU2z8+PNtIggO/raRLHXGXruPJXoJxheaOe4/8R0VHDUZGs0/0KzrOf2+vLOEi3rvhuXmdvJl8EoaeClOol7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB4ygAGMJZASKcWcZhQkIf3Q/hB7wAnCJZgMZ4WHfgA=;
 b=fLRTENePfja5EddJIJWZGZWDF/TopRC7aXQlSc+kVLnUFvYR4Rz/B0MiQlqfYz7XDL2FF9ljgLPx+wLFMZFa0wopJhmwQZI6/Xkurw4S6hNkcJAfVDLTQbp2GMddr5QiYvwepg4nrqYF0sCmNyrDkbhO/Sqdn8Q0Za4SV3/3SYdQeoHTOrzESWGNyGzp00kpEY5O/oRGwS+nhD7sxaTeRUrexikx+nsLU7DjjN00fXw+/6wp+ogKVI7Q3oPuS0TM9AOXPm1mllWkx2pUcWn3FHVl++59paCoS8cs7W2WV1rxDjN2z/TK4TrMSXMDGqcHrZnm1WDnMZLrjhp/aQ7AQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4641.prod.exchangelabs.com (20.177.205.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 18:34:42 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 18:34:42 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v3 2/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v3 2/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV6GTfV/XlZKfLUSRuOD9a+7xbN/g==
Date:   Thu, 3 Oct 2019 18:34:41 +0000
Message-ID: <BL0PR01MB4835450548ED3DF4C893BDA2959F0@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a80a0753-b024-4ae7-7495-08d748305b17
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4641:
x-microsoft-antispam-prvs: <BL0PR01MB4641A69B6D0AC92DDCED654E959F0@BL0PR01MB4641.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(74316002)(2501003)(6916009)(7696005)(6116002)(3846002)(99286004)(55016002)(9686003)(86362001)(476003)(6506007)(7736002)(305945005)(26005)(316002)(486006)(102836004)(25786009)(66066001)(478600001)(81156014)(8676002)(14454004)(71190400001)(186003)(81166006)(256004)(5640700003)(5660300002)(71200400001)(33656002)(2906002)(6436002)(66556008)(66476007)(76116006)(66946007)(66446008)(64756008)(52536014)(2351001)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4641;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dl4FENx0shzq70o2fMqy+pppSHLJgJLNEAUj+dPTmN8fE6aZ/iqcTOC2DV8GY4E88f4a0vAcMMhl0qmlu+lupYcxGcF3XkiY1dvEHN9lhV0KfQi/LacN1Y8908BlH+PLsO447C9tnV8he16Kw6vKzSp9r901OTs2swal6j+Qv1St2ysaiBPvJVashdnenYe+ipEDrNMcoESLKxvb7CcQuvMGPYxtTC7v7zBdUI/r8WBPT+oIbW7yaCS6XMig/VCkzeK/omlLvIHzHggC5e4di2+MAh8mdF61Ie+Fe8pxfOGuGJG2ipvDleEXv4wD+3j6Spq4WdId8QJ+Fb3dNTiTWQfKamEi366KVpBi4O0xlojx793uXL6Ksgf16MyokKxvGP4eAzto4+GRtXmJwtexW00ZG/FESG92L6181TelMJ8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80a0753-b024-4ae7-7495-08d748305b17
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 18:34:41.8789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WObY8sAfUku379ljJjXgO6NLqs9e1W1E44AXAP3r/cpIxa4cxQRQ7zyHr2ynhTV/lF85q6Kl6erYa/FlLM3/7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4641
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910030152
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

hwmon: Add DT bindings for TMP513 driver

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 .../devicetree/bindings/hwmon/tmp513.txt      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt

diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt b/Documenta=
tion/devicetree/bindings/hwmon/tmp513.txt
new file mode 100644
index 000000000000..341c764e9173
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tmp513.txt
@@ -0,0 +1,33 @@
+TMP513 system monitor sensor
+-------------------------
+
+Require node properties:
+- compatible: one of
+		"ti,tmp512"
+		"ti,tmp513"
+- reg : the I2C address of the device. This is 0x5c, 0x5d, 0x5e, or 0x5f.
+
+Optional properties:
+- shunt-resistor-uohm : The shunt resistor value in uOhm. If 0, the calibr=
ation process
+		will be skiped and the current and power measurement engine will not wor=
k.
+		Temperature and voltage measurement will continue to work. The shunt val=
ue also
+		need to respect : rshunt <=3D pga-gain * 40 * 1000 * 1000. If not, it's =
not possible
+		to compute a valid calibration value.
+- bus-voltage-range: 32V or 16V, default to 32V.
+- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1. Def=
ault to 8.
+- temp_2_nfactor: nFactor for remote channel 1. Value according to Table 1=
1 in datasheet.
+- temp_3_nfactor: nFactor for remote channel 2. Value according to Table 1=
1 in datasheet.
+- temp_4_nfactor: nFactor for remote channel 3. Value according to Table 1=
1 in datasheet,
+		TMP513 only.
+
+Example:
+	tmp513@5c {
+		  compatible =3D "ti,tmp513";
+		  reg =3D <0x5C>;
+		  shunt-resistor-uohm =3D <330000>;
+		  bus-voltage-range =3D <32>;
+		  pga-gain =3D <8>;
+		  temp_2_nfactor =3D <0x01>;
+		  temp_3_nfactor =3D <0x02>;
+		  temp_4_nfactor =3D <0x03>;
+	};
--=20
2.17.1

