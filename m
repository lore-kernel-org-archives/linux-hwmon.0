Return-Path: <SRS0=/pPu=YP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E440ACA9EA0
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Oct 2019 13:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B05FB2053B
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Oct 2019 13:33:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="otvauAHi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732081AbfJVNdv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Oct 2019 09:33:51 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:14346 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731981AbfJVNdv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Oct 2019 09:33:51 -0400
Received: from pps.filterd (m0118797.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9MDU3we001254;
        Tue, 22 Oct 2019 09:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pps-02182019;
 bh=Zis+dOdwmIzkOwrD7D2flskkoAeimjawwDpo82OxdYs=;
 b=otvauAHiSs6a9VY/sV33Pjx4pZGwIaBgg9uziKmZakOyVxLt/DY04TRo1dshCXhCz0lz
 dd+eAZ3zT1oi4q0I98gi+Lo0RFHPp8u7SOSDf2jJzMmyjHEw1R30uaTLfLfGDCRa5iXj
 RbaoBg887qRse1i3B28/RNJxFcu3mzovUUrkPK7UGQpGcoL+MuWmE8GhHoWZw7I3vrpz
 MSkGR5fM6QcbaEiJSRQyXV4zAEavR4epHx0+9XO4G2QEkX03QGI9kHZ+KrfrBXyRbalI
 JkDqkX6wd6xkv776qLhV98MKIETtuXuN1MR0vAWNkeSHJLDKKQlSz86YF3WQgLdjOKCz LA== 
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2051.outbound.protection.outlook.com [104.47.40.51])
        by mx0b-002ab301.pphosted.com with ESMTP id 2vsk6qgrbu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 22 Oct 2019 09:33:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZigbG/XqVub7TsBDNY/WeZgutTNkguRj2yeuc+2voRNtWztG2meF8CHGCyHNbvcWL/K5Plvgbcb9myF2u/a/+Gvgf4ZpPVeWdg0lZIxVXuyiZyuLS1X+ffK45P2Xkq4OV3eQm/gQTf8kwAM8oSD5XdEKhbTSntQoG74y+kEsVV6Ou6krTLSLJNumHkjcNrAbZIwgdf7hQWNbr7coL03BaK3kGHGlJ8TkMj4Nz37m700It1+ZLM9INy9QbpFNdfv5g6asG2BkFaGxz672rX0KsykNdMMx6izl9R32/pvUSvWoEagP32e1nLZ/b60/NoN0wqZDxOohobpiLoU0r+urA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zis+dOdwmIzkOwrD7D2flskkoAeimjawwDpo82OxdYs=;
 b=fyaLYtRgkDHvNcNF5guryrEtFWU/4/24QVaR9xbF7PDYGkdSq50tYtDtL3/PH5v55OK8vqkSL2lwZud9/RJBblOM9DAoSoRyfThbZm11RkUtKvv+y2f8todn7C/z1ENCGEmm6l23RR4fjLFJxnejh9BbVIHQZIAImBmNnTwwydspM5qa46sUhbri9z7l/XAixT5PavilcFmkD5riFhWO9/VrD8Wxk7gs8nOTRX5GBjIaxvZNrwNNPHmAj5UfBfYCTn3jwWpdgpku0SusfSVOvMKiXlKaxKmPakzswQmkaB9215oLev4XlXfF8SoPPpfoLV4SZWqaQON5SvwGTqadDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4484.prod.exchangelabs.com (20.177.241.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 13:33:19 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::5c78:d9d4:3906:a553]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::5c78:d9d4:3906:a553%2]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 13:33:19 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v5 1/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v5 1/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdWI3EDF4iJUWFJXSuqEx1GSE2sskA==
Date:   Tue, 22 Oct 2019 13:33:19 +0000
Message-ID: <BL0PR01MB483512FB70F44FE36766981F95680@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dfd15f30-1507-4a65-e31c-08d756f4672d
x-ms-traffictypediagnostic: BL0PR01MB4484:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <BL0PR01MB44844B30E733CB9166FBD5BB95680@BL0PR01MB4484.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(189003)(199004)(476003)(14454004)(966005)(2201001)(86362001)(33656002)(478600001)(81156014)(8936002)(81166006)(8676002)(66476007)(66556008)(66446008)(66946007)(76116006)(2501003)(66066001)(486006)(64756008)(186003)(25786009)(5660300002)(52536014)(256004)(26005)(102836004)(6506007)(71190400001)(305945005)(7736002)(6116002)(4326008)(3846002)(74316002)(6436002)(9686003)(6306002)(55016002)(2906002)(99286004)(54906003)(71200400001)(316002)(110136005)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4484;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EVLmB3ab5UyqgM3Pios6V1gqDEBXRcr2h9pWcW0cXDm8pjbfFs4kmTnMIrEIoLV0eSY0qiegva9BZ/XoW3tLy/HL27oJz13mg+ck8zaJmoYluOXWXjakNlGKaO99cGmhdXRLppm5DItULbuqtuhMpPRbMHM3zXQ/867ZXXG0riUGNp38M1SDNRZ5XSvp41zAi0zQBKv2oTFhnoDBnMSItVnDLuX4uii1/h1Kv9S0y/L1TYYk9dFcBMsxm7F1Y32z98iK/7ZgmBUeYTOIfi4VzeUmn/iIG7AYo+VhInanQJjWYN27n/A2/H42QdjNpxj/lFah8ptNmtIAPbWwnR5liHnKJur2CkxzLG9ppn6uGwC2NHESpaPdg/tsiNvcmMfdOREorNRuJCfdaHhn5uobc3Ae7cRUtFelkVj/aeBoWWcM0ihleeOUGMkDPry+4xXJDPzEBd394EOTmDZL9Sm3ZJuN1xOUwWXfOQhLDJdtlZ8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd15f30-1507-4a65-e31c-08d756f4672d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 13:33:19.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCIPSpAbXBfBqtK978ZJmDB6E9VtDajhwUkNZTVcx0EX6IqCOdO83bTmC7l/RDZnfBDkt25G3MBDW6Y/wnDM4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4484
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910220125
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

dt-bindings: hwmon: Add TMP512/513

Add dt-binding for TMP512/513 sensor chips

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Docum=
entation/devicetree/bindings/hwmon/ti,tmp513.yaml
new file mode 100644
index 000000000000..33d880b2a887
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2018 Linaro Ltd.
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/tmp513.yaml#
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
+    - enum:
+      - ti,tmp512
+      - ti,tmp513
+
+  reg:
+    maxItems: 1
+
+  ti,shunt-resistor-micro-ohms:
+    description: |
+      The shunt resistor value in uOhm. If 0, the calibration process
+      will be skiped and the current and power measurement engine will not=
 work.
+      Temperature and voltage measurement will continue to work. The shunt=
 value also
+      need to respect : rshunt <=3D pga-gain * 40 * 1000 * 1000. If not, i=
t's not possible
+      to compute a valid calibration value.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1000
+
+  ti,pga-gain:
+    description: |
+      The gain value for the PGA function. This is 8, 4, 2 or 1.
+      The PGA gain affect the shunt voltage range.
+      The range will be equal to: pga-gain * 40mV
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 2, 4, 8]
+    default: 8
+
+  ti,bus-voltage-range-volt:
+    description: |
+      This is the operating range of the bus voltage
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [16, 32]
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
+    &i2c0 {
+        tmp513@5c {
+            compatible =3D "ti,tmp513";
+            reg =3D <0x5C>;
+            ti,shunt-resistor-micro-ohms =3D <330000>;
+            ti,bus-voltage-range-volts =3D <32>;
+            ti,pga-gain =3D <8>;
+            ti,nfactor =3D [01 F3 00];
+        };
+    }
--=20
2.17.1

