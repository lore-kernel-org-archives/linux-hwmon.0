Return-Path: <SRS0=cyzt=T5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4991BC28CC0
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 May 2019 14:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11F4723A5B
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 May 2019 14:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="gzoouRKO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfE2Od4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 29 May 2019 10:33:56 -0400
Received: from mail-eopbgr140092.outbound.protection.outlook.com ([40.107.14.92]:47472
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726106AbfE2Od4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 May 2019 10:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nuwE/ew0MkFYv9usXqYerYDYvdgzI2goDRqc2WDH80=;
 b=gzoouRKOahDS+slTvIxOd1oHoRW7MN7SBBdWQxz7nJI2euYZ4JmZnr5T5NhwZfuu40eCMP0+FexXxIiIsPWK0ZGTgW52BDU1Jw6FP50R317YRlwIHb50Uabgr4+gCDsEYcqrT7bOXeVEsQ0Sb8nl5FSIhfcGt2qYtCXTGdExVZI=
Received: from DB6PR07MB3336.eurprd07.prod.outlook.com (10.170.223.150) by
 DB6PR07MB3109.eurprd07.prod.outlook.com (10.170.222.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.4; Wed, 29 May 2019 14:33:52 +0000
Received: from DB6PR07MB3336.eurprd07.prod.outlook.com
 ([fe80::8c1c:dbc5:e07b:2cf9]) by DB6PR07MB3336.eurprd07.prod.outlook.com
 ([fe80::8c1c:dbc5:e07b:2cf9%6]) with mapi id 15.20.1943.016; Wed, 29 May 2019
 14:33:52 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v2 1/2] pmbus: (core) mutex_lock write in pmbus_set_samples
Thread-Topic: [PATCH v2 1/2] pmbus: (core) mutex_lock write in
 pmbus_set_samples
Thread-Index: AQHVFiuJyDsKMA+7Ekunc/f1xOXSew==
Date:   Wed, 29 May 2019 14:33:52 +0000
Message-ID: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0087.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::31) To DB6PR07MB3336.eurprd07.prod.outlook.com
 (2603:10a6:6:1f::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73a134ad-d447-4cbb-3969-08d6e442abed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB6PR07MB3109;
x-ms-traffictypediagnostic: DB6PR07MB3109:
x-microsoft-antispam-prvs: <DB6PR07MB31094C17A3AE55D192BF51BFEF1F0@DB6PR07MB3109.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(366004)(136003)(346002)(39860400002)(189003)(199004)(7736002)(256004)(66066001)(14444005)(73956011)(386003)(6506007)(486006)(316002)(4744005)(53936002)(25786009)(102836004)(107886003)(86362001)(99286004)(8676002)(26005)(81166006)(66476007)(68736007)(66556008)(64756008)(66446008)(81156014)(66946007)(4326008)(52116002)(8936002)(186003)(305945005)(110136005)(54906003)(5660300002)(6486002)(2906002)(2616005)(6116002)(476003)(6436002)(6512007)(71190400001)(71200400001)(3846002)(36756003)(508600001)(14454004)(118296001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB6PR07MB3109;H:DB6PR07MB3336.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3+cvGmSlOXy8CwasHMrUhdnXQ3NXJj/XmBdsWbycR2+r/lqgoynqAW/p/y2RTyM/pYT0kNPBc4IWQn0gUSwb3i5hFwIYX2zSQf5vntXiUfn80RgVlSSFIzfzELZpcrdNvr2CMJPug86PQBWN/Bg33zYCPtPCOZPe6n+7NkqO6aY+KO/Zdy6i4oxw/8r3BrA8Ka8aKla9l/ZP3PMJ0/LlawCoDpkyOGU4yot/L3fI1pHI7nkoOFxmgOaa3n/2wG3vwXOQYVZWnyoBvKinHa/x76z175SjDthA25zYgIzjkuKABemoSRA1MAPcKDiO52Dljigdhft5YxO3XQtOURDAeZ7+Kn/nIHOTqBjEgJo3d8/WlyAp6eVMb+5PLtzlkYrlxXpEO/YwqrTfryoRXt9ruFaOvon07odOJS3cw1fvrxU=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5B7E8B59682C6B4AAC92C4F6A0C38A3A@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a134ad-d447-4cbb-3969-08d6e442abed
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 14:33:52.7156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krzysztof.adamski@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR07MB3109
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

update_lock is a mutex intended to protect write operations. It was not
taken, however, when _pmbus_write_word_data is called from
pmbus_set_samples() function which may cause problems especially when
some PMBUS_VIRT_* operation is implemented as a read-modify-write cycle.

This patch makes sure the lock is held during the operation.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index ef7ee90ee785..62cd213cc260 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1946,7 +1946,9 @@ static ssize_t pmbus_set_samples(struct device *dev,
 	if (kstrtol(buf, 0, &val) < 0)
 		return -EINVAL;
=20
+	mutex_lock(&data->update_lock);
 	ret =3D _pmbus_write_word_data(client, reg->page, reg->attr->reg, val);
+	mutex_unlock(&data->update_lock);
=20
 	return ret ? : count;
 }
--=20
2.20.1

