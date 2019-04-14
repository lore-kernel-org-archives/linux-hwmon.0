Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C663C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 19:00:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 456DA206B7
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 19:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="hMaolkGH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbfDNTAy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 15:00:54 -0400
Received: from mail-eopbgr130118.outbound.protection.outlook.com ([40.107.13.118]:61165
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725797AbfDNTAx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 15:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD80rtxFGc5BXKiFMsOn8kf+pTYFCGbTigw9owDTocY=;
 b=hMaolkGHUndsfEUMJEkGfouysmnvGU1JzDIV1E4xZ6yMxknmaEx3FeSrUHhG3W8DZ+6DHrJqAPKm8FX4Dx0G6haOJLGV+K/NdTDMxssf20IEJXqqgwd28KvKPmF7q/aJGZtGYxk0FDnf9pH9LSnrM6+dtk2E+IUkxhO5KAdoggM=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3066.eurprd07.prod.outlook.com (10.170.244.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sun, 14 Apr 2019 19:00:49 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sun, 14 Apr 2019
 19:00:49 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v2 2/3] lm25066: support SAMPLES_FOR_AVG register
Thread-Topic: [PATCH v2 2/3] lm25066: support SAMPLES_FOR_AVG register
Thread-Index: AQHU8hJwA9Q7bQwwQ0ua0/AzEb1ghqY7uw6AgABJgwA=
Date:   Sun, 14 Apr 2019 19:00:49 +0000
Message-ID: <20190414190042.GA15303@localhost.localdomain>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
 <8b52d91c3b182d54d9cc523d2542bbca413927d1.1555171278.git.krzysztof.adamski@nokia.com>
 <57f99b8f-f4e8-eda0-432c-21ecb0346a52@roeck-us.net>
In-Reply-To: <57f99b8f-f4e8-eda0-432c-21ecb0346a52@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0028.eurprd09.prod.outlook.com
 (2603:10a6:7:15::17) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb82107f-2b9d-4383-656a-08d6c10b821e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3066;
x-ms-traffictypediagnostic: HE1PR07MB3066:
x-microsoft-antispam-prvs: <HE1PR07MB306602336680AB48AD526637EF2A0@HE1PR07MB3066.eurprd07.prod.outlook.com>
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(396003)(136003)(366004)(346002)(199004)(189003)(1076003)(99286004)(61506002)(478600001)(5660300002)(14454004)(14444005)(256004)(25786009)(486006)(7736002)(476003)(6512007)(186003)(305945005)(71200400001)(102836004)(53936002)(9686003)(71190400001)(66066001)(2906002)(33656002)(26005)(54906003)(316002)(11346002)(446003)(107886003)(8936002)(106356001)(86362001)(76176011)(52116002)(386003)(6506007)(6246003)(6486002)(6436002)(81156014)(81166006)(6916009)(105586002)(97736004)(229853002)(68736007)(8676002)(3846002)(6116002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3066;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GEuHHaqF8IW6Uz78pYFmCdtdt8QGTjBauSq4xFvoNDgN9YjHaPdBUCHKWexV/l6jHHEIBWLA+yewWrOmR/C/s/V88Ih1laeNJmdkZIC1scLXp+VClIVp4rYBi7Vk/EHw9ncG7j6M2wSp+hXnXpJ7VukWMuXdiZgxdI/m4RfrbLDla6GVsdck0nzfdOGDkq/HlKb2giyglF/e4rX9uISwomnB24grqJrhBs4tTtc9oGOP1Gtt3JtOoGumiEarMmooWH6W2+B/Fyp4TCysarnzA5ynyy/zYI9iF8whSdzd3RLIyz3Vhc7SlexEwaUCdYtLXyiNQDScXPm1xm/NDN+fsQP5FCsZ+9KusF0dKst0Uz20QCdvKw85vq2s+PUwyC5ll9lj9Mk4ihfxkIyP6Lj52o7hH0vuX1kTSiOFBmaQHjs=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DA6019A4BFF7B842B9318050C0255BB7@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb82107f-2b9d-4383-656a-08d6c10b821e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2019 19:00:49.5498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3066
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 14, 2019 at 07:37:35AM -0700, Guenter Roeck wrote:
>On 4/13/19 9:03 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>Manufacturer specific SAMPLES_FOR_AVG register allows setting the number
>>of samples used in computing the average values (PMBUS_VIRT_READ_*_AVG).
>>The number we write is an exponent of base 2 of the number of samples so
>>for example writing 3 will result in 8 samples average.
>>
>>Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>>---
>>  drivers/hwmon/pmbus/lm25066.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.=
c
>>index 53db78753a0d..b560d33db459 100644
>>--- a/drivers/hwmon/pmbus/lm25066.c
>>+++ b/drivers/hwmon/pmbus/lm25066.c
>>@@ -26,6 +26,7 @@
>>  #include <linux/err.h>
>>  #include <linux/slab.h>
>>  #include <linux/i2c.h>
>>+#include <linux/log2.h>
>>  #include "pmbus.h"
>>  enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
>>@@ -39,12 +40,15 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066=
i };
>>  #define LM25066_CLEAR_PIN_PEAK		0xd6
>>  #define LM25066_DEVICE_SETUP		0xd9
>>  #define LM25066_READ_AVG_VIN		0xdc
>>+#define LM25066_SAMPLES_FOR_AVG		0xdb
>>  #define LM25066_READ_AVG_VOUT		0xdd
>>  #define LM25066_READ_AVG_IIN		0xde
>>  #define LM25066_READ_AVG_PIN		0xdf
>>  #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
>>+#define LM25066_SAMPLES_FOR_AVG_MAX	4096
>>+
>>  /* LM25056 only */
>>  #define LM25056_VAUX_OV_WARN_LIMIT	0xe3
>>@@ -284,6 +288,10 @@ static int lm25066_read_word_data(struct i2c_client =
*client, int page, int reg)
>>  	case PMBUS_VIRT_RESET_PIN_HISTORY:
>>  		ret =3D 0;
>>  		break;
>>+	case PMBUS_VIRT_SAMPLES:
>>+		ret =3D pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
>
>		if (ret < 0)
>			return ret;
>

Good point. However the convention for this switch is to break instead
of returning early. I would stick with that if you don't mind.

>>+		ret =3D 1 << ret;
>>+		break;
>>  	default:
>>  		ret =3D -ENODATA;
>>  		break;
>>@@ -398,6 +406,11 @@ static int lm25066_write_word_data(struct i2c_client=
 *client, int page, int reg,
>>  	case PMBUS_VIRT_RESET_PIN_HISTORY:
>>  		ret =3D pmbus_write_byte(client, 0, LM25066_CLEAR_PIN_PEAK);
>>  		break;
>>+	case PMBUS_VIRT_SAMPLES:
>>+		word =3D clamp_val(word, 0, LM25066_SAMPLES_FOR_AVG_MAX);
>
>0 is not valid, and ilog2(0) returns -1 (or is undefined).

True, I'll clamp with minimum 1 to fix that. I don't think it's worth
returning an error for 0. Do you?

>
>>+		ret =3D pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
>>+					    ilog2(word));
>>+		break;
>>  	default:
>>  		ret =3D -ENODATA;
>>  		break;
>>@@ -438,7 +451,7 @@ static int lm25066_probe(struct i2c_client *client,
>>  	info->func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VMON
>>  	  | PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT
>>-	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>>+	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_SAMPLES;
>>  	if (data->id =3D=3D lm25056) {
>>  		info->func[0] |=3D PMBUS_HAVE_STATUS_VMON;
>>
>

Krzysztof
