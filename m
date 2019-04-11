Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775D7C10F13
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 14:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 283EE2077C
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 14:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="f+rTi/Rr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfDKOJi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 10:09:38 -0400
Received: from mail-eopbgr80122.outbound.protection.outlook.com ([40.107.8.122]:55949
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726121AbfDKOJi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 10:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPK5f4Ka7Zuq3UaQ08mlIIIEXVk9TrXGfUzd1DGkadE=;
 b=f+rTi/RrKtehFcksB0Xv75RBsE3yhJWyqwNseDS7nIWbxJTkKWtTCkl5E+9j6GqRF5ZBFEgQc4SnFDvWB9F6P0RPD9P7g58quwb3gzNhmoCnnD9kZhTHuh6ktBFzoX8zSoi/C7oltE0knjB4pN9R2+vR70Le3Yr/fW0TqsEx4Dg=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4250.eurprd07.prod.outlook.com (20.176.166.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.8; Thu, 11 Apr 2019 14:09:32 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Thu, 11 Apr 2019
 14:09:32 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH 3/3] pmbus: export coefficients via sysfs
Thread-Topic: [PATCH 3/3] pmbus: export coefficients via sysfs
Thread-Index: AQHU7+5G22q3YnKe6k+VdX70WdzCm6Y2G5EAgACbQICAAEE2gIAACGwA
Date:   Thu, 11 Apr 2019 14:09:32 +0000
Message-ID: <20190411140920.GA12692@localhost.localdomain>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <8087920a011662114ca151d4e04186c121a9a737.1554934898.git.krzysztof.adamski@nokia.com>
 <6366cab6-8db2-9d22-a43b-7df0377f75fb@roeck-us.net>
 <20190411074547.GA28466@localhost.localdomain>
 <09ebb2f5-a34b-0733-aa14-cd963519d702@roeck-us.net>
In-Reply-To: <09ebb2f5-a34b-0733-aa14-cd963519d702@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:7:16::28) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a79ae01a-81f3-4e33-2147-08d6be87518a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4250;
x-ms-traffictypediagnostic: HE1PR07MB4250:
x-microsoft-antispam-prvs: <HE1PR07MB4250F2B73C7B32423313C052EF2F0@HE1PR07MB4250.eurprd07.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(366004)(39860400002)(346002)(136003)(199004)(189003)(229853002)(81156014)(102836004)(81166006)(25786009)(14454004)(68736007)(8936002)(66066001)(256004)(61506002)(478600001)(14444005)(8676002)(33656002)(4326008)(93886005)(105586002)(386003)(6506007)(106356001)(6512007)(53936002)(446003)(107886003)(52116002)(6116002)(6486002)(97736004)(1076003)(6246003)(54906003)(11346002)(305945005)(86362001)(76176011)(3846002)(9686003)(316002)(7736002)(5660300002)(6436002)(26005)(71190400001)(71200400001)(486006)(2906002)(186003)(99286004)(6916009)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4250;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s48nIoA+T5kbr6irMhl4Y0KlDpaKVaho4b2389In6pOW1Hqk/LE+ZEGrJinEr3JdyaHm73bWtaNCgbqK9pKkikCib4Jp4LcnA6f+vBqctuxzFisiRipZC+MCQZ217JdAokMyb9MmfzLlqvJHi9vpdwj4TxZOXTT/ggtNsZrgDrdjlohtZqOtrrumTy9DX7QeUHsX4M6tLjWCvjBXPxGAf6sQGqyGS/7YceeLw1qqdSe6Bps+PVNx/8f5dkF8r8fCEYzG/xuyC65eMQHAum1EPBfkmGyMR4FQBJxMA2vOYXLgmfmp7hxqr9YGZYmc9yLLrCjnlaUW/ulXFpjn1rPHec/pi89Qxg7GI8x/S1/jKalvfPWc/Luue9+YuWNdIPSoYOLR0P82ce5SvMVO4Cmj88OdYtsjEPOu9ADWLodFwvE=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35E1CD012E17BF4EB586620232D0A21B@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79ae01a-81f3-4e33-2147-08d6be87518a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 14:09:32.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4250
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 11, 2019 at 06:39:11AM -0700, Guenter Roeck wrote:
>On 4/11/19 12:45 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>On Wed, Apr 10, 2019 at 05:30:08PM -0700, Guenter Roeck wrote:
>>>On 4/10/19 3:39 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>>>In order to get best accuracy, in case of some devices it is required t=
o
>>>>tweak coefficient values. This is especially true for devices using
>>>>some external shunt resistor or being operated in non-usual environment=
.
>>>>Those values may be measured during device production and stored as
>>>>calibration values in some place (like EEPROM or even a file).
>>>>
>>>>To support wide range of possible use cases, lets export those to
>>>>user space via sysfs attributes so that it can implement its own
>>>>policies about them. All those attributes are put into separate
>>>>attribute_group struct so that we can set its name to group all of them
>>>>in a "coefficients" subdirectory in sysfs.
>>>>
>>>
>>>Coefficients are hardcoded into the chip, and the hwmon ABI reports raw
>>>values. Any correction should be done using sensors3.conf.
>>
>>I'm not sure what you mean by the fact they are hardcoded into chip. I
>>am targeting a case where direct values are being converted to real
>>world values using coefficients by pmbus_reg2data_direct() function. My
>>understanding is that the reason why the devices does not report values
>>in real world units but requires using coefficients for calculation is to
>>ease the calibration. For example the LM5064[1] has a chapter called
>>"determining telemetry coefficients empirically with linear fit" which
>>describes how to calculate them, based on the sense resistor used. Some
>>drivers, like adm1275.c, have a custom way to indirectly influence the
>>coefficients values by using Devicetree ("shunt-resistor-micro-ohms")
>>but this is not really flexible nor general approach. In case of
>>adm1275, only "m" coefficient is adjusted this way. Depending on "m"
>>value, "R" might require adjustments as well and we also need "b" to
>>achieve best accuracy. Then, again, using Device Tree is not suitable
>>for per device calibration.
>>
>'
>Why not ? You'll have to explain that one. It is not as if coefficients
>would change on the fly. They are chip and/or board properties.

But the coefficients will depend on the exact value of the shunt
resistor. To get bet accuracy, the coefficients are calculated for each
board unit. While all units of the same type share the devicetree
(otherwise this devicetree would have to be generated by some firmware
software first).

>
>>My argument here is that the kernel does not return raw value in this
>>case - it returns (supposedly) real-world values that are calculated
>>internally based of coefficients according to the formula specified by
>>pmbus specification. In my opinion it would make sense to provide it
>>with proper coeffs if defaults are not suitable. Otherwise reporting
>>"real-values" doesn't make much sense. In other words, our
>>implementation would currently report real-world values if your case
>>happens to match default coeffs for some shunt resistor and
>>environment specified in datasheet of the device.
>>
>
>This is why I dislike making exceptions. It always creates a bad precedenc=
e.
>hwmon devices are supposed to report raw values, to be converted to real
>values using the configuration file.
>
>
>We can discuss scaling and possible ABI enhancements, but it will have
>to be generic. b/m/r is not generic. You also don't make the case why
>those values would have to be runtime-adjustable.
>

b/m/r are coefficients mentioned by PMBUS specification and the change
is PMBUS specific. My understanding is that all PMBUS devices report
values in real-world units (either in linear or direct mode) and this is
implemented this way in the code already.
In fact, if the device would report raw values, we wouldn't need this
patch as we would simply apply those coefficients in userspace. But if
drivers report real values which require correct coefficients to work, I
would expect to be able to tweak them.

>
>Note that there are several issues with the patch itself: There is no
>validation, the names are questionable ("p" ?), the scope is questionable
>(if an adjustment is needed, it would likely have to be per sensor, not
>per group), and the attributes are created unconditionally even if the
>chip does not report values in direct mode, just to name a few.

I can fix all that, of course, but we have to discuss the the mentioned
issues first. I agree with all those arguments except the scope one. As
we currently only support specifying coefficients per class and this is
exacly how I export them. Unless I misunderstood your comment, of
course.

>However, that is all irrelevant: At this point I'll resist further chip
>specific changes in that area. If we move from reporting raw values
>towards reporting adjusted values, the solution will have to be generic
>and must not be chip specific.

But this is not chip specific change, it is more like bus (PMBUS)
specific. All pmbus devices reporting in direct mode have those
coefficients, all of them use the same formula to calculate real values
out of raw values as this is specified in the PMBUS specification.

I agree this might not be useful for devices reporting in linear/vid
mode so I could exclude them when exporting coefficients.

Krzysztof
