Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86723C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BEF420818
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="l7sEoFeM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfDNV6o (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 17:58:44 -0400
Received: from mail-eopbgr30121.outbound.protection.outlook.com ([40.107.3.121]:5399
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725829AbfDNV6o (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 17:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK0T32835I0e1eRDaEtAEEmFmfrHGyXT3MG0PDyaTjk=;
 b=l7sEoFeMHE+ev79ixC3257gUq3j8BRr6DI2MoYYi7cpHN9EmHFLm/bA6PnCEJFfWI77qV4T/bIaLwY135qtbW9uHLvLuXXPGXFJkqqL0246SGITPA3X3BhQNoRff+JGKaLlGXjZ1X6bWcrESgiZNZWJni5rYktzU9Wvt0pjcf1c=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4297.eurprd07.prod.outlook.com (20.176.166.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.8; Sun, 14 Apr 2019 21:58:40 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sun, 14 Apr 2019
 21:58:40 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v3 2/4] hwmon: Document the samples attributes
Thread-Topic: [PATCH v3 2/4] hwmon: Document the samples attributes
Thread-Index: AQHU8w04JYY367TYPUCIDP6HWRhUMw==
Date:   Sun, 14 Apr 2019 21:58:40 +0000
Message-ID: <f7f4bebc95087fb491b6fb50dc8e9a0ffca2fd94.1555273192.git.krzysztof.adamski@nokia.com>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1555273192.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0034.eurprd09.prod.outlook.com
 (2603:10a6:7:15::23) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7a441a7-541b-4f56-577c-08d6c1245ab8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4297;
x-ms-traffictypediagnostic: HE1PR07MB4297:
x-microsoft-antispam-prvs: <HE1PR07MB42979314676CDEA1D3E2A83CEF2A0@HE1PR07MB4297.eurprd07.prod.outlook.com>
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(366004)(39860400002)(376002)(346002)(189003)(199004)(316002)(7736002)(2616005)(6506007)(386003)(102836004)(5660300002)(107886003)(446003)(11346002)(6116002)(3846002)(476003)(118296001)(76176011)(71200400001)(66066001)(71190400001)(305945005)(99286004)(2906002)(486006)(52116002)(86362001)(256004)(6512007)(4326008)(81166006)(6436002)(53936002)(105586002)(6486002)(81156014)(36756003)(26005)(97736004)(106356001)(110136005)(54906003)(186003)(8936002)(478600001)(25786009)(68736007)(8676002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4297;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6OWjvGzKMfRfJSm6Dmcy6z+iVy7YnlDW2ugIQoVd5UEUX5AwI2z7TQhZFLTN7IwWC67rAWnUe5CMft6gx/QYSnuryYILfNPOUdns/O3xr72QB9kgdZnHzC1TcjOJhOT645EU1BG6R2pMgNIXaUpQVOOHpsFMT6isIIAh6hDCOqTSHqVpzgESQDj/8Lma8ZKo7t0QtaI0vr7kSzrZHOhRzm0XHr1MkHI8MK4pFCX43KX4W5OmeJuwlX366LAw8+lc2L00bj6mtnVJztbGHp0iudmw6u8xG/ZpAgdovcZCQDpEXkdEqVog5Aw7uicHFmLLEz18ibLUZv3VjC1Kqn2B3vxJBIkXHuzgvCVwhlfv7mB4t+zo+wbm1jAz2KtrCADCAIp5w29y/TTD2p6aVgLXfMaItxyHaOOCRRnyRA4lUr8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2309C57E66CA674EAA98BEF4BD34B866@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a441a7-541b-4f56-577c-08d6c1245ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2019 21:58:40.7680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4297
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document new ABI attributes: {in,power,curr,temp}_samples and samples.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 Documentation/hwmon/sysfs-interface | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysf=
s-interface
index 2b9e1005d88b..7b91706d01c8 100644
--- a/Documentation/hwmon/sysfs-interface
+++ b/Documentation/hwmon/sysfs-interface
@@ -756,6 +756,24 @@ intrusion[0-*]_beep
 		1: enable
 		RW
=20
+********************************
+* Average sample configuration *
+********************************
+
+Devices allowing for reading {in,power,curr,temp}_average values may expor=
t
+attributes for controlling number of samples used to compute average.
+
+samples		Sets number of average samples for all types of measurements.
+		RW
+
+in_samples
+power_samples
+curr_samples
+temp_samples    Sets number of average samples for specific type of measur=
ements.
+		Note that on some devices it won't be possible to set all of them
+		to different values so changing one might also change some others.
+		RW
+
=20
 sysfs attribute writes interpretation
 -------------------------------------
--=20
2.20.1

