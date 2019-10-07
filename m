Return-Path: <SRS0=YDtn=YA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B73C47404
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 20:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CE3F2133F
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 20:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="J3cRid/l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbfJGUrH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Oct 2019 16:47:07 -0400
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:17388 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728273AbfJGUrG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Oct 2019 16:47:06 -0400
Received: from pps.filterd (m0118788.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97Ke9i9017931
        for <linux-hwmon@vger.kernel.org>; Mon, 7 Oct 2019 16:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps-02182019;
 bh=2R99FT8WIZNNxjUayukKKMldoiyxgdImIStmSvnXb0Q=;
 b=J3cRid/lf7GM+H7L4DKp5k+3rtjWllhEPRhDfu5j70iuefk77dYlYMFsawd1A8VkyS81
 T/qUH/EQ4IODr0x/5ZjjflT0EyfzaHoodvnLG4YOQMB6z/AJOLe9ioU+CcgwU9FDGzdG
 mTwtwOZOGFfieew1AxmZEx+xFan99ZRk+Le4T2bxpoXAP31jVyBe/moSe/ngrNNoHi93
 EGEY7n3FHiIjnVsE9wFRUEY/gvFXFEfHHbuTbUW6cV1+9KJ5OPol0SpZVo3xbvpVsVQ4
 7DlywDj5oRsPTaqxeRpg17/LiAySVd+0o09IbivrfgeAMexMAMfxwX5d3sPLaxbmdhg0 hA== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2055.outbound.protection.outlook.com [104.47.44.55])
        by mx0a-002ab301.pphosted.com with ESMTP id 2vf85thksd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Oct 2019 16:47:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2IKTfiBx82gHDMPdlFjZBuL30wIywbE7K669tdqGF47VFwC1+oIqjJo5pVuJ7LDsi8zDECMPRE5vkRajq5LndpIGrDO2rdyN+xV7X36Qtx6OUmnKSZLkYdI0U1rtyzkBspmOKLB/8UUChDdTqNX7n0Hqb6ayuFW5r1Unq4GCvR0+BDYFw6txbOEo1BIrM0h5FSGSZrnj0IPUW+m4qCikFu0g56xfbCzUTNnZcwW3WMc2bXAW8VJFb2Ku/tBqhvj0XTPl3ZNxlYE3zzojBzy/X23dvCmG9MscRQHA2ofPC2JtxCt/mGS0VQdwENy7XaAu7mKFaskObJ1XoDJ9oWHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2R99FT8WIZNNxjUayukKKMldoiyxgdImIStmSvnXb0Q=;
 b=YSPFeCvMWXVk+hf/Yl+mUFDILDvAldpM9GFKImeOmBjOmVrxqOui6UHYxuT8Hugcp4in+iBaZNJejyoq6WNhGhLB1rGCPT+HbS8qsJkeWnNXYssuV++TbQrlsjsD0CQik//gzRSsnExM3wIu/6korQmfbqcb/aXSm3cnJmsUkPO2w9ocHuiGhcfKRnTe9zCd76leEVk29p/2t6jtik8fffwnafzr41UlWEUPJxHdxEIYCm1z/2q8u2TMPARyfbaS5txS02vWufrAdNFc6JtVlrGRI7qULqmPgoZPeW2GyK4QJQrel2iRKhG9nIlqOKfk5c8NWQBrwyJBO+lOTQkrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4386.prod.exchangelabs.com (20.177.242.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 20:47:03 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 20:47:03 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v4 2/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v4 2/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV9UFE2BpytaFPSSHikqfXeoHpWgQ==
Date:   Mon, 7 Oct 2019 20:47:03 +0000
Message-ID: <BL0PR01MB4835F4346C7895E1DD579079959B0@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6159e669-e1d0-4fc7-c07e-08d74b67824b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4386:
x-microsoft-antispam-prvs: <BL0PR01MB43866550B28D4AECFA41C545959B0@BL0PR01MB4386.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(189003)(199004)(76116006)(66476007)(66446008)(64756008)(66946007)(26005)(476003)(52536014)(8936002)(66556008)(256004)(66066001)(71190400001)(25786009)(71200400001)(5660300002)(8676002)(81156014)(81166006)(186003)(486006)(316002)(86362001)(9686003)(2906002)(5640700003)(55016002)(478600001)(2501003)(14454004)(33656002)(7696005)(74316002)(6506007)(102836004)(99286004)(3846002)(2351001)(6116002)(305945005)(7736002)(6436002)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4386;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0xRqQ/HKAbdMznu6g8WPiAVCsQNgChDX0zjzocOCe/RiEizekh4aUwJVQZcv3eg6UJDh8hvSJS2qF9oxyrEzebBPn9C1AqfMqil9vjQPOiDy5i0rrYLBlh6aAz+6tF3NNifmfAPg/R4E1CIkpIL7lncfJA29aCM+ZHHg5i7T52SoNsxW3vc0prajLDA6LlIpI2F2pge1blrkPeCHGObOckkF99UyWtfNZcMQHmc0uMDqWBIwiU+jAvKTj3rZo/gXDela5VvUtAXJrjSUPQkyEgrgiGwm8FM3s9adL6/W6VzzyJSz4U0/u+JuIV2fFzUEvkpss7+vQHaTQyBDYIqCYjE8Iq18C7BgaZ0CieOFzAEZzoXevUcEzTqBrxolpfOKGOblaGZma3fahVNBM6UuDkrM3y+xoKiJ6gPCFHfC1mg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6159e669-e1d0-4fc7-c07e-08d74b67824b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 20:47:03.4842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpt6CsLD1C5sFRjFMNQisDehUQNUBfKQy8y4X3WzwtSdSIlSbHUpUEGn5la7tfe3jIl9NkIllxjEb0/dEtfpzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4386
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910070182
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

dt-bindings: Add TMP512/513 documentation

Add documentation for TMP512/513 sensor chips

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 .../devicetree/bindings/hwmon/tmp513.txt      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt

diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt b/Documenta=
tion/devicetree/bindings/hwmon/tmp513.txt
new file mode 100644
index 000000000000..dbfade74f6b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tmp513.txt
@@ -0,0 +1,32 @@
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
+		to compute a valid calibration value. Default to 1000 uOhm.
+- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1. Def=
ault to 8.
+		The PGA gain affect the shunt voltage range.
+		The range will be equal to: pga-gain * 40mV.
+- bus-voltage-range: 32V or 16V, default to 32V.
+- nfactor: u8 array of three(TMP513) or two(TMP512) n-Factor value for eac=
h remote
+		temperature channel. Default to 0.
+		See datasheet Table 11 for n-Factor range list and value interpretation.
+
+Example:
+	tmp513@5c {
+		  compatible =3D "ti,tmp513";
+		  reg =3D <0x5C>;
+		  shunt-resistor-uohm =3D <330000>;
+		  bus-voltage-range =3D <32>;
+		  pga-gain =3D <8>;
+		  nfactor =3D [01 F3 00];
+	};
--=20
2.17.1

