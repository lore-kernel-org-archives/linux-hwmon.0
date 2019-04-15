Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3283C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 08:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F1B220651
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 08:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="AxMwlaIS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbfDOIew (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 04:34:52 -0400
Received: from mail-eopbgr50126.outbound.protection.outlook.com ([40.107.5.126]:17495
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726428AbfDOIew (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 04:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdkCB8TKTxAtNdHx0gejbfvmLZEIzviUVKsLEl6z5iA=;
 b=AxMwlaISBXGIkRf2GBQCTaAwfLHclxNvoX4/4fymJg0DJezzudM2Sx5ihVT48O47wAIJkFr4gafE1hP+pYQh9jkfrPPo2qjZQa1CVtp6b8HHeR4FdOy1RrwV/fDdnmoQWV3A2R+3JBAvMCPnmxj/zN3DWug95uKzK2wwSIMZLlM=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3497.eurprd07.prod.outlook.com (10.170.247.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.8; Mon, 15 Apr 2019 08:34:48 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Mon, 15 Apr 2019
 08:34:48 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Thread-Topic: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Thread-Index: AQHU8w1ZydbOroauu0aS8/AaxTnXF6Y8YLgAgAAh0ICAAGOAgA==
Date:   Mon, 15 Apr 2019 08:34:48 +0000
Message-ID: <20190415080527.GA6320@localhost.localdomain>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
 <4887ef85022d7ceb26905997c19a874d7d89087f.1555273192.git.krzysztof.adamski@nokia.com>
 <20190414223728.GB18461@localhost.localdomain>
 <8b641f3c-c9d6-f70c-0f1d-f4287773574a@roeck-us.net>
In-Reply-To: <8b641f3c-c9d6-f70c-0f1d-f4287773574a@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0202CA0003.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::13) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bd0cbd3-999e-4639-c250-08d6c17d387d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3497;
x-ms-traffictypediagnostic: HE1PR07MB3497:
x-microsoft-antispam-prvs: <HE1PR07MB34976DE4A908F43C73E72BA3EF2B0@HE1PR07MB3497.eurprd07.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(86362001)(33656002)(6916009)(53936002)(54906003)(107886003)(61506002)(68736007)(66066001)(6246003)(316002)(14444005)(5024004)(6486002)(256004)(52116002)(2906002)(486006)(5660300002)(14454004)(6436002)(76176011)(25786009)(102836004)(186003)(26005)(6506007)(386003)(93886005)(305945005)(7736002)(1076003)(97736004)(71200400001)(71190400001)(229853002)(476003)(105586002)(446003)(11346002)(9686003)(4326008)(106356001)(8936002)(478600001)(6116002)(3846002)(6512007)(8676002)(81156014)(81166006)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3497;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Gggz4IE7l/vGXTtSvFqkYCxvsqtky0ShMgS0pGeU18Z48ST/zBa7n+lZ0qmgIp7iqROXP0HjOz7KEJrO1xA3E7W45mi4povgK8tpTNQRwZIHq4O2bmigTfTKG1A5JRuOtMhIdWVjm7z3eHd2FjcBXfVhHafsXZdXxMxfG2H6pjKn7gh9lMHGugIc9FFz+k21gQUcJ0hP/qcPwsvIB8dLIlOoq/WikdGrQdppl4L24J9ueGe2C6DXD+mc8m5z/F5aptuZwddEUVNHbr/vQrdSnrFYfGE6QhBBBHzrMl16go3sMwaVhC1qar0E+U0K4MgavVz/Zdk+QLKFwcoV1h3OSS0VF63rrLiM6auJDWp7C1xHLqj7vftv0mPi8bbZ4t8fG12ymMFbooTYIPe/Z19/dsMnd0kEmG24f0Ngi7t/T6A=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E5A37DE5D0F1CA41A68355AB5D3C6B4F@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd0cbd3-999e-4639-c250-08d6c17d387d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 08:34:48.5484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3497
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 14, 2019 at 07:38:33PM -0700, Guenter Roeck wrote:
>On 4/14/19 3:37 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>On Sun, Apr 14, 2019 at 11:59:38PM +0200, Krzysztof Adamski wrote:
>>>PMBUS devices report values in real-world units. Those using direct
>>>format require conversion using standarised coefficients and formula.
>>>This operation is already done by pmbus_core and the default values for
>>>coefficients are configured by chip drivers.
>>>
>>>However those default values are not allways suitable as they depend on
>>>the value of sense register and environment used. For that reason, in
>>>order to get values that make sense or just to get best accuracy, in it
>>>may be required to tweak coefficient values. The proper values may be
>>>measured during device production (to get best accuracy, they might be
>>>callibrated for each individual unit) and stored as calibration values
>>>in some place (like EEPROM or even a file).
>>>
>>>To support wide range of possible use cases, lets export those to user
>>>space via sysfs attributes so that it can implement its own policies
>>>about them. All those attributes are put into separate attribute_group
>>>struct so that we can set its name to group all of them in a
>>>"coefficients" subdirectory in sysfs.
>>>
>>>Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>>>---
>>>drivers/hwmon/pmbus/pmbus_core.c | 104 ++++++++++++++++++++++++++++++-
>>>1 file changed, 102 insertions(+), 2 deletions(-)
>>>
>>
>>[...]
>>
>>>+	pmbus_dev_attr_init(&ext_attr->attr, name, (S_IWUSR | S_IRUGO),
>>
>>I screwed up and did not fix this also, sorry for that. I'm not sending
>>an updated version (yet) as I didn't get your approval for the concept
>>itself (though I still hope you will reconsider taking into account my
>>latest arguments).
>>
>
>I won't, sorry. As mentioned before, this is a generic problem that needs
>to be solved for all hwmon drivers, not just for pmbus devices, and also
>not just for pmbus devices using direct mode.
>
>Even worse, this doesn't even work for pmbus devices in general.
>PMBus supports commands such as VOUT_SCALE_LOOP and various other
>calibration commands such as VOUT_CAL_OFFSET, IOUT_CAL_GAIN and
>IOUT_CAL_OFFSET. Your approach doesn't even try to support those
>commands; you only look at r/m/b which may suit your needs but are
>hardly generic

I agree I don't see this problem as general as you. The mentioned
registers can easily be supported if needed by just attaching attributes
to them. That would allow doing things that cannot be done currently
(configuring precision of the regulation of the devices) while I see
coefficients problems as something totally different - more like a fix
to the already supported functionality (reporting current measurements).

> and even misleading since chip programming isn't adjusted even when
> that is possible.

I don't understand what you mean by that, could you explain?

>
>Addressing this problem in a generic way will require substantially
>more thought than just adding a couple of pmbus direct mode specific
>attributes.

I'm willing to put more effort into that but I would need to better
understand what is your view of the scope of problem here.

Krzysztof
