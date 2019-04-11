Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAEDC10F13
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 07:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5656C217D4
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 07:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="qy4FqqEI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfDKHqE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:46:04 -0400
Received: from mail-eopbgr70124.outbound.protection.outlook.com ([40.107.7.124]:8958
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726121AbfDKHqD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 03:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSQ2ChYVWCCWiLm2nymH3LF1B0SqVr6xNslLzAHnR7o=;
 b=qy4FqqEIDVlgQMhBTOv33gFs9xL/lWJoMsGmCkKbOSrHLTs5tsnFXvRw4rxrOxQkLRgaaoK95l4tQV03MlEjf6pCz9MGy1twn17N3diS+QV9TBruVG9ag1m2/FqHe1Jw8Ip0Spic/9NDHh5jD+jxcbVmfERXInamP6OVwQf9TSs=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4394.eurprd07.prod.outlook.com (20.176.167.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.12; Thu, 11 Apr 2019 07:46:00 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Thu, 11 Apr 2019
 07:46:00 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH 3/3] pmbus: export coefficients via sysfs
Thread-Topic: [PATCH 3/3] pmbus: export coefficients via sysfs
Thread-Index: AQHU7+5G22q3YnKe6k+VdX70WdzCm6Y2G5EAgAB5ugA=
Date:   Thu, 11 Apr 2019 07:45:59 +0000
Message-ID: <20190411074547.GA28466@localhost.localdomain>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <8087920a011662114ca151d4e04186c121a9a737.1554934898.git.krzysztof.adamski@nokia.com>
 <6366cab6-8db2-9d22-a43b-7df0377f75fb@roeck-us.net>
In-Reply-To: <6366cab6-8db2-9d22-a43b-7df0377f75fb@roeck-us.net>
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
x-originating-ip: [131.228.32.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29a16aef-ef56-4c41-f38e-08d6be51bd4e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4394;
x-ms-traffictypediagnostic: HE1PR07MB4394:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <HE1PR07MB4394E2C93F1E4EC7BC88751AEF2F0@HE1PR07MB4394.eurprd07.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(105586002)(8936002)(26005)(478600001)(305945005)(81166006)(71190400001)(99286004)(14454004)(81156014)(106356001)(66066001)(476003)(4326008)(102836004)(54906003)(186003)(7736002)(11346002)(33656002)(6306002)(9686003)(6512007)(2906002)(5660300002)(71200400001)(486006)(86362001)(229853002)(107886003)(6916009)(53936002)(52116002)(25786009)(14444005)(6486002)(446003)(256004)(6246003)(316002)(966005)(1076003)(6116002)(3846002)(61506002)(6506007)(6436002)(97736004)(386003)(68736007)(8676002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4394;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yNmsrdmlY/xW6qekSgrg1JA+BehjULdfwzIWcVaMTuPvOcwN6FunsyHHYMYW7OVKqmzT5y/puskQ9xL8gX6+Ho+vEgzM4EKnmMRXU+AUKngBMek6aW3UgDtTZy/u/79WuCkBhrCVLpMbCey80ww/b6vSoOny0NoZz+tyf8Pfw++s51UDvqXK6G4O7LiLOusGdpbrekgTzqy6+W58RLOnpzTxSKGXQZCm+Grp54K3fqkY0Q2HuInGhY0KFv5xuqqxAD3uqTU3EVaq31hg03vWlwDWWvDwXX04HWGOJU3KK5DFUOWfYr1kyCVS4lTtmWF3ng8exqaA+8hBm8o+kuj198O1X28yY+7TETlbcqZfZd4USKzX6+wyqZJ+z072MzRZphQvAOpfBSpt7pgjaQei3nMugcfYLZB3i5PKprht0KU=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <309F80505689034FBA1B451E1963F120@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a16aef-ef56-4c41-f38e-08d6be51bd4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 07:45:59.9992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4394
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 10, 2019 at 05:30:08PM -0700, Guenter Roeck wrote:
>On 4/10/19 3:39 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>In order to get best accuracy, in case of some devices it is required to
>>tweak coefficient values. This is especially true for devices using
>>some external shunt resistor or being operated in non-usual environment.
>>Those values may be measured during device production and stored as
>>calibration values in some place (like EEPROM or even a file).
>>
>>To support wide range of possible use cases, lets export those to
>>user space via sysfs attributes so that it can implement its own
>>policies about them. All those attributes are put into separate
>>attribute_group struct so that we can set its name to group all of them
>>in a "coefficients" subdirectory in sysfs.
>>
>
>Coefficients are hardcoded into the chip, and the hwmon ABI reports raw
>values. Any correction should be done using sensors3.conf.

I'm not sure what you mean by the fact they are hardcoded into chip. I
am targeting a case where direct values are being converted to real
world values using coefficients by pmbus_reg2data_direct() function. My
understanding is that the reason why the devices does not report values
in real world units but requires using coefficients for calculation is to
ease the calibration. For example the LM5064[1] has a chapter called
"determining telemetry coefficients empirically with linear fit" which
describes how to calculate them, based on the sense resistor used. Some
drivers, like adm1275.c, have a custom way to indirectly influence the
coefficients values by using Devicetree ("shunt-resistor-micro-ohms")
but this is not really flexible nor general approach. In case of
adm1275, only "m" coefficient is adjusted this way. Depending on "m"
value, "R" might require adjustments as well and we also need "b" to
achieve best accuracy. Then, again, using Device Tree is not suitable
for per device calibration.

My argument here is that the kernel does not return raw value in this
case - it returns (supposedly) real-world values that are calculated
internally based of coefficients according to the formula specified by
pmbus specification. In my opinion it would make sense to provide it
with proper coeffs if defaults are not suitable. Otherwise reporting
"real-values" doesn't make much sense. In other words, our
implementation would currently report real-world values if your case
happens to match default coeffs for some shunt resistor and
environment specified in datasheet of the device.

[1]: http://www.ti.com/lit/ds/symlink/lm5064.pdf

Krzysztof
