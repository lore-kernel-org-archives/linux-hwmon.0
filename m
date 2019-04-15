Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87726C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:26:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B16720848
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="rK05AzF4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbfDOU01 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:26:27 -0400
Received: from mail-eopbgr50092.outbound.protection.outlook.com ([40.107.5.92]:32133
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727379AbfDOU00 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 16:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZhKefVHugeYxGMUYCp6f/YpYiw5bPbelcrFDFJ3JLc=;
 b=rK05AzF4up7N1ilnKaYBBTSxIt6+64un0WLKwsX5DCiZ+QqVGm9ZaKB/6nOulLbWkJAcnMadGc1LB9P30qLqW/qDizNgGPjMFOWLXSIziJlDbUWt8glAJfmZy+8sSLOO+4CmKCg1BN6xvywKC3UYBOtEQFphy5apHXKtXRPZqAY=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4347.eurprd07.prod.outlook.com (20.176.167.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Mon, 15 Apr 2019 20:26:21 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Mon, 15 Apr 2019
 20:26:21 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Thread-Topic: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Thread-Index: AQHU8w1ZydbOroauu0aS8/AaxTnXF6Y8YLgAgAAh0ICAAIUOgIAAZCIAgABBFQA=
Date:   Mon, 15 Apr 2019 20:26:21 +0000
Message-ID: <20190415202606.GA990@localhost.localdomain>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
 <4887ef85022d7ceb26905997c19a874d7d89087f.1555273192.git.krzysztof.adamski@nokia.com>
 <20190414223728.GB18461@localhost.localdomain>
 <8b641f3c-c9d6-f70c-0f1d-f4287773574a@roeck-us.net>
 <20190415080527.GA6320@localhost.localdomain>
 <20190415163310.GA7933@roeck-us.net>
In-Reply-To: <20190415163310.GA7933@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0301CA0014.eurprd03.prod.outlook.com
 (2603:10a6:3:76::24) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21746b1d-3098-4368-eda0-08d6c1e09f13
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4347;
x-ms-traffictypediagnostic: HE1PR07MB4347:
x-microsoft-antispam-prvs: <HE1PR07MB43477BF4033403A5D871ABB9EF2B0@HE1PR07MB4347.eurprd07.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(9686003)(99286004)(53936002)(6512007)(229853002)(316002)(6916009)(97736004)(386003)(86362001)(25786009)(102836004)(26005)(8936002)(93886005)(186003)(4326008)(6246003)(76176011)(107886003)(52116002)(61506002)(6506007)(54906003)(106356001)(66066001)(1076003)(105586002)(478600001)(6486002)(6436002)(68736007)(14454004)(14444005)(256004)(305945005)(6116002)(3846002)(7736002)(33656002)(71190400001)(2906002)(71200400001)(476003)(486006)(11346002)(446003)(5660300002)(8676002)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4347;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FGOMkUjSZcl/K2WRoB/45ZpR/q6wX2Fii+uDek2KdJHwlvItLpKd1G+EFgjS4vyQiqJvlp/8gTxBk2S/+Ifr1m00hATuu7UryZ+vArEkXrn+Fqy1GOZfiLncLMeGsXhp9nxfuZzgc64cc1Qg0txFS6wopV418l5rRFHvdsjv2AKA+5aLlooJqm10qKkykV+oIRJwso1Ujo70NCxTVa9ZsSXA0qfop2wKxnuZIMS207EbQ0SjtXAcoCmth9ESZ24mQZZn4gNhvn5e/s1PsiaHNCOtu9ztD5rS1EF10wMbAXtcEYIeBZCmPBjIN0hpmhMa6/af0mOj12XNn0JIUor/GE+Tcwgi6d2/gPS6GCncI42dqhhqNZ5nNjzFaMe+4V8eaRz+HiYQurxCEmVN2ipwNJk7Dj8bPcnCbHsbDcAdhoQ=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B3C9208D4C7FDC41AB9F0B4E0DE194E5@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21746b1d-3098-4368-eda0-08d6c1e09f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 20:26:21.6530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4347
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 15, 2019 at 09:33:10AM -0700, Guenter Roeck wrote:
>We are talking an ABI here. ABIs are supposed to be hardware independent.
>Directly mapping registers to attributes is not exactly hardware independe=
nt.

That is true, I get that, even though I don't want to map registers. I
want to map coefficients which are hardware independent but only as far
as we take into account only PMBUS. And I guess this is the root of the
difference in our opinions - I still only think about PMBUS devices
while you think about all HWMON devices (I think).

>> > and even misleading since chip programming isn't adjusted even when
>> > that is possible.
>>
>> I don't understand what you mean by that, could you explain?
>>
>"when that is possible" -> on chips supporting calibration commands,
>one should not manipulate b/m/R but write any adjustments into the chip
>using those commands.
>
>> >
>> >Addressing this problem in a generic way will require substantially
>> >more thought than just adding a couple of pmbus direct mode specific
>> >attributes.
>>
>> I'm willing to put more effort into that but I would need to better
>> understand what is your view of the scope of problem here.
>>
>There are a number of elements.
>
>First, a case has to be made why the current mechanism of using
>sensors3.conf for adjustments is insufficient. This may be well
>understood by some, but the case needs to be made (ie some chips do
>have HW registers to perform the adjustment, and in some cases there
>is accuracy loss by performing adjustments in user space).

My argument why you the solution of sensor3.conf can't be directly used
is that the readings for PMBUS devices uses real values, that are
already processed by some coefficient values. If you want to apply
corrected coefficients, you would first need to know what default coeffs
were used to "revese" the calculation. And the specification for devices
I am working with (ADM1275 and LM25066 families) describe how to get
such corrected coeffs so it is sensible to assume they might be
available.

>Second, we'll need to determine which standardized attributes are
>needed. As far as I can see this would probably be 'scale' (or maybe
>'gain') and 'offset'. The question is how to express especially 'scale'.
>It would either require both a multiplier and a divider, or it would
>have to be expressed in fixed point arithmetic. I would prefer the
>latter, but I am open to suggestions.
>
>Third, we will have to determine how to apply this all to pmbus
>chips. It must not only apply to direct mode chips, but to all
>PMBus chips. Even for direct mode chips the case needs to be made
>if the attributes should apply per sensor class or per sensor (I
>would think per sensor). Just looking at VOUT, chapter 9.2 of the
>PMBus specification (Rev 1.1, part II) gives an example of what
>to look out for: Just for VOUT, there are VOUT_TRIM, VOUT_CAL_OFFSET,
>VOUT_DROOP (does this require yet another attribute ?), and
>VOUT_SCALE_LOOP.
>
>I should add that the above, for VOUT, are the primary means for
>PMBus devices to adjust voltage readings. This also applies to IOUT,
>which has similar standard PMBus registers available for calibration
>(IOUT_CAL_GAIN and IOUT_CAL_OFFSET). On top of that, some chips support
>vendor specific commands to calibrate other sensors. For example,
>MAX15301 supports a EXT_TEMP_CAL command to calibrate temperature sensor
>readings.
>
>Also note that direct mode PMBUs chips _should_ support a COEFFICIENTS
>command to retrieve actual coefficients from the chip (though I don't
>recall ever encountering a chip that actually supports it).
>
>Overall, adjusting readings through manipulation of b/m/R is at best
>a workaround.
>
>As such, the chip we are talking about here does pretty much
>everything wrong. I do understand the need for a more dynamic
>calibration support on the driver level, but the solution must
>not focus on such a chip and needs to be more generic.

I need some more time to think about what you wrote here a little more
to get the feeling about the most general solution. One thing that came
into my mind, however, is that part of my problem would be solved if
userspace could at least retrieve coeffs used to calcualte the values.
Lets say the chip would support COEFFICIENTS command - how would we
implement support for that?

In the internal implementation, since all PMBUS devices should support
COEFFICIENTS command, we could just add attribute for the
PMBUS_COEFFICIENTS. Devices supporting this command, could just, well,
pass this to device. Other could "intercept it" and just return values
stored in the pmbus_driver_info structure.

The only problem is - this command is _very_ generic - it lets you ask
for separate coefficients for reading and writing and it can return
different one for each of the supported PMBUS commands. This makes it
impractical to probe for all supported combinations on probe. Some
filtering would have to be provided by the client drivers instead. But
still a long list of possible attributes would be created.

The end result - ABI would look similara as in my patch and would,
again, be pmbus specific and not really expandable to other hwmon
devices. But I don't see any other way we could support such a command.
But maybe this question - "how, from ABI standpoint, could we implement
support for PMBUS_COEFFICIENTS command?" is easier to answer than the
more general problem you described?

Krzysztof
