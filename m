Return-Path: <SRS0=fVv9=YW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CADBCA9EC3
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Oct 2019 15:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E2E2214B2
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Oct 2019 15:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="LKZ6y7ke"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389788AbfJ2PFC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Oct 2019 11:05:02 -0400
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:60132 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389520AbfJ2PFC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Oct 2019 11:05:02 -0400
Received: from pps.filterd (m0118792.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9TEjUHV030277;
        Tue, 29 Oct 2019 11:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pps-02182019;
 bh=y53qmmhaDfps142Fs+TUePa5CEWip6ahcIcJVn4fSHU=;
 b=LKZ6y7keysxShlhtLtNV1K7MkHwYg4UImqSyCbTJSKiinvSOhKZ3pxkKjd5l40qzO8wB
 Z3KcAshvP8blOOCAsrADb62eokWGF53T5psNzcuqzqFSA1N/mGhr0kufQrRtjHhhBEXx
 HRRzhA69Mtnsq5ZNnO458d7CcIJ+pgvHm1fXGKNwM1Z9VX4Xise0375r/k1CO04Vxjfg
 6Hqelg71lFxF9dnQvFPhYFJHTfoXGHvXRcKylmfYJqZJI1idPFFnhzDvELmMclufElFs
 6ugPQA2iJ33RusBK74ZyAE/EDaGCsPP5OanBzsgZX4PJOTWIcioiQFVguYqGW6WEhalj bQ== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2051.outbound.protection.outlook.com [104.47.44.51])
        by mx0a-002ab301.pphosted.com with ESMTP id 2vxpxrr29v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 29 Oct 2019 11:04:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avOr/7Lw9zWn+RI6neiuLBLKvuFRi9NwTDuTfv/jsKAjI28ANXQlNRAVU3UHcOuzzWbnN6BnGQ6UdVCajp0bB3tbI1sZJ+DypWWdneSX7tieBu5/a4bCSdhN4mxuxpz6FjklMbmcU3gxmeOJ8ABu8sBPFpOJH/5bh/JOxds5+VEbMer3EX6UHuqVX4+lS7vX3KftmyUKO5V1pB6ySjUd0XvY3c0YaL0gRcL5Ab07WDMe6TO+87zZxEnPx/dvv4VRWepS12iVOUtUJDehp4NDWTeXKnivBCbP/DP0PjXz/BmffVhOA9QEluq6MwqjZ8R4XP4Lbs2RxMTD43xxb/V/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y53qmmhaDfps142Fs+TUePa5CEWip6ahcIcJVn4fSHU=;
 b=b/cqiJI1/6rz5C7/9pZYeR/hPM5ZsS5gjfHiocNWiDxWCONONvH7a6tW1mGExFGowr3bmtu39fiRJdPBQuC3adt0GjhV3f0yYcAI9iGUd6eA33SQwIOUYL2BvAZuCmSbfPgDuHKG+LYrwldvfR5//lAFACrulgMQBvWgZW1vCgtIZjOM9DeGNuB+Vkeuf1okgpPRrLaOB20zfL1+ZR09FN4EaTRCyuFJgrswklu6+31d5h6sQWeHQBkjN6cbJuO6mKCczY0/eiuEdaaxza0RMeQUqJ2IixeHllCQKM13+D3A6tM1ncR5WX54SqkqH2mlyFpfXWTqKdAkMSieBt6gBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from DM6PR01MB4844.prod.exchangelabs.com (20.177.219.29) by
 DM6PR01MB3865.prod.exchangelabs.com (20.176.72.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 15:04:31 +0000
Received: from DM6PR01MB4844.prod.exchangelabs.com
 ([fe80::a05a:a956:3538:51a8]) by DM6PR01MB4844.prod.exchangelabs.com
 ([fe80::a05a:a956:3538:51a8%6]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 15:04:31 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v6 1/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v6 1/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdWOacI34kgY6s2GTamVc6URvCa5KA==
Date:   Tue, 29 Oct 2019 15:04:31 +0000
Message-ID: <DM6PR01MB4844A7A2E7DCA9168D44F34195610@DM6PR01MB4844.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cffc63b4-de7f-4443-bff8-08d75c814d4e
x-ms-traffictypediagnostic: DM6PR01MB3865:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <DM6PR01MB38655E140FB40C1E9B9AEE9295610@DM6PR01MB3865.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(396003)(366004)(346002)(376002)(136003)(39860400002)(199004)(189003)(2501003)(66446008)(66556008)(7696005)(66476007)(66946007)(64756008)(305945005)(6506007)(76116006)(33656002)(8676002)(3846002)(486006)(7736002)(81156014)(186003)(81166006)(26005)(14454004)(2906002)(102836004)(476003)(6116002)(74316002)(52536014)(25786009)(99286004)(55016002)(6306002)(9686003)(8936002)(71200400001)(71190400001)(478600001)(4326008)(66066001)(966005)(316002)(256004)(110136005)(54906003)(5660300002)(2201001)(86362001)(6436002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR01MB3865;H:DM6PR01MB4844.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tHBsoMKEADDTPX4iYCv6erwjOQ5eTHhHcp4jdTtQZxuRslSFsPkETtUzywLYxh8KtlEnv7rlnFtFW4G/GCKb6xv1W5n4E+jabZofZ8W4qGrYPNiz38BVQ52eRaOM/hMj8Kc+g9ILRilV2NXi8xH3s85CJny0zcpg4w5cp/QAV4ozmQrBr0aGQjTwfe6iEjuvi8Az0KyW5xI1yYeFbHJFSHe7XslNNBYxx8S681M9zNIB8jB/GuiPYDxaHMZ9HiszAg4loKvZ7x4QC6/AvwsT8boXiGN/Ksrrjv//yqbmTnkcUHNKU9sbqyRLRFX3fCC/qiGR1UWmmp+KEbjpRUPPZg3i5FdBIci7RYR2ias3pi9ixWVdSAFsVeGBVUXazLou3AqxsouleGPAWXEOP+9aMeBZYqJHCSlmuQmKVaAZ9g0Cek7S5OfzGfcgtpE7VwJt+dMGhxVTULNeCkOjUZax8Ylvak2RBx5X0NL0u8xW4AA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cffc63b4-de7f-4443-bff8-08d75c814d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 15:04:31.3377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CzicbGq4eL5qtOevWPiYBdLIKKpcliCaEUuH3wiFqQxPZXh3V81mdpbmwZRvwmGp9LOFJjV73FZ7QKBKat7LNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3865
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910290141
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

dt-bindings: hwmon: Add TMP512/513

Add dt-binding for TMP512/513 sensor chips

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Docum=
entation/devicetree/bindings/hwmon/ti,tmp513.yaml
new file mode 100644
index 000000000000..e5f3c72ff548
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2018 Linaro Ltd.
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/ti,tmp513.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TMP513/512 system monitor sensor
+
+maintainers:
+  - Eric Tremblay <etremblay@distech-controls.com>
+
+description: |
+  The TMP512 (dual-channel) and TMP513 (triple-channel) are system monitor=
s that include
+  remote sensors, a local temperature sensor, and a high-side current shun=
t monitor.
+  These system monitors have the capability of measuring remote temperatur=
es,
+  on-chip temperatures, and system voltage/power/current consumption.
+
+  Datasheets:
+  http://www.ti.com/lit/gpn/tmp513
+  http://www.ti.com/lit/gpn/tmp512
+
+
+properties:
+  compatible:
+    enum:
+      - ti,tmp512
+      - ti,tmp513
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: |
+      If 0, the calibration process will be skiped and the current and pow=
er
+      measurement engine will not work. Temperature and voltage measuremen=
t
+      will continue to work.
+      The shunt value also need to respect : rshunt <=3D pga-gain * 40 * 1=
000 * 1000.
+      If not, it's not possible to compute a valid calibration value.
+    default: 1000
+
+  ti,pga-gain:
+    description: |
+      The gain value for the PGA function. This is 8, 4, 2 or 1.
+      The PGA gain affect the shunt voltage range.
+      The range will be equal to: pga-gain * 40mV
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8]
+    default: 8
+
+  ti,bus-voltage-range-volt:
+    description: |
+      This is the operating range of the bus voltage
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [16, 32]
+    default: 32
+
+  ti,nfactor:
+    description: |
+      Array of three(TMP513) or two(TMP512) n-Factor value for each remote
+      temperature channel.
+      See datasheet Table 11 for n-Factor range list and value interpretat=
ion.
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/uint8-array
+      - minItems: 2
+        maxItems: 3
+        items:
+          default: 0
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+        tmp513@5c {
+            compatible =3D "ti,tmp513";
+            reg =3D <0x5C>;
+            shunt-resistor-micro-ohms =3D <330000>;
+            ti,bus-voltage-range-volts =3D <32>;
+            ti,pga-gain =3D <8>;
+            ti,nfactor =3D [01 F3 00];
+        };
+    };
--=20
2.17.1

