Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F09C10F13
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 08:09:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74D4B2083E
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 08:09:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="ctMc6jDZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfDKIJP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 04:09:15 -0400
Received: from mail-eopbgr80134.outbound.protection.outlook.com ([40.107.8.134]:50062
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725793AbfDKIJO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 04:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8shUGHEnhFKmGV13y4e/LIy5aVEMRoxZHFLhYdWTtEo=;
 b=ctMc6jDZQgPAy02C3m2uZq7xwzslN9/fdnTPKJzl5ocoANUcwyPBNeV+nFLpQb3daMINRyfkVI6+ux+D4P3gPz012xj2V523RElPr9J5GoP7LfFUeBjvxZaShrMc5ASmZ0WMzyNvFbwGOi8pFXn0wmDFf8qTqDrebyqfZyoYjTc=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3467.eurprd07.prod.outlook.com (10.170.247.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.9; Thu, 11 Apr 2019 08:09:10 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Thu, 11 Apr 2019
 08:09:10 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
Thread-Topic: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
Thread-Index: AQHU7+43DvuzCLvA3EepOLFPKcXfhqY2IpuAgAA6cICAAD6vAA==
Date:   Thu, 11 Apr 2019 08:09:09 +0000
Message-ID: <20190411080849.GC28466@localhost.localdomain>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <e231af1feac9cbe8b72923a13587035220b76ad8.1554934898.git.krzysztof.adamski@nokia.com>
 <13669c15-3373-da20-6d68-50842d91be18@roeck-us.net>
 <20190411042429.GA19533@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190411042429.GA19533@Asurada-Nvidia.nvidia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::33)
 To HE1PR07MB3337.eurprd07.prod.outlook.com (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bd593e9-833c-4e79-513f-08d6be54f9c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:HE1PR07MB3467;
x-ms-traffictypediagnostic: HE1PR07MB3467:
x-microsoft-antispam-prvs: <HE1PR07MB3467E344ED0E8B4D276C7EEEEF2F0@HE1PR07MB3467.eurprd07.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(39860400002)(136003)(376002)(366004)(199004)(189003)(66066001)(106356001)(478600001)(6486002)(5660300002)(305945005)(229853002)(1411001)(81156014)(81166006)(71190400001)(256004)(93886005)(71200400001)(61506002)(33656002)(7736002)(3846002)(6116002)(97736004)(54906003)(316002)(4326008)(386003)(6506007)(76176011)(186003)(26005)(102836004)(99286004)(25786009)(1076003)(52116002)(6436002)(8936002)(68736007)(53936002)(8676002)(6916009)(9686003)(6512007)(107886003)(476003)(105586002)(6246003)(86362001)(11346002)(14454004)(446003)(2906002)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3467;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eFYWbuKfRBjJ6NChiMpJMWrzE+2VLddGOHCBTIuDE1Ts2yW2kMq2DBQZjU4q7npzESrL33HlXDNuDUb6KYKPpmg4QDzXmEhxbKDwsfPQYYQEKnBqpEDueZH6HpuebIYPDLctoLbXTsJNfNfT1UhuRYSeLQMTNgqSJxJS2E1Kv5pkBhHoOFVPMH7ExChtypruugmGR1qTaBVCy1mSIkCeh+69La1N4HHa01ey610dYtYid5AovU4m0qGgzI+qq8eigYZcj4hdNLUDl088jmXxxrE4eQSysXb+rTW/VlaEZvsDBWPo2OFHXxvkZDjYVhSlcSCAWi5Y43pBq0ebgFP+yRnjZZ/2i+i2vO6U944zcoBHPDU0wN8JJfEyjPS4YY9wSvx5wef0XFawHcDyX8r7kFiI/m6+RHEk2n6NuPgwdbc=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B5E97830E1371A408A737B9B125C4183@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd593e9-833c-4e79-513f-08d6be54f9c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 08:09:09.8994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3467
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 10, 2019 at 09:24:29PM -0700, Nicolin Chen wrote:
>On Wed, Apr 10, 2019 at 05:55:19PM -0700, Guenter Roeck wrote:
>
>> > +static ssize_t samples_for_avg_show(struct device *dev,
>> > +				    struct device_attribute *attr, char *buf)
>> > +{
>> > +	struct i2c_client *client =3D to_i2c_client(dev->parent);
>> > +	int ret;
>> > +
>> > +	ret =3D pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
>> > +	if (ret < 0)
>> > +		return ret;
>> > +
>> > +	return sprintf(buf, "%d\n", 1 << ret);
>> > +}
>> > +
>> > +static ssize_t samples_for_avg_store(struct device *dev,
>> > +				     struct device_attribute *attr,
>> > +				     const char *buf, size_t count)
>> > +{
>> > +	struct i2c_client *client =3D to_i2c_client(dev->parent);
>> > +	int ret, val;
>> > +
>> > +	ret =3D kstrtoint(buf, 0, &val);
>> > +	if (ret < 0)
>> > +		return ret;
>> > +
>> > +	ret =3D pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
>> > +				    ilog2(val));
>> > +	if (ret < 0)
>> > +		return ret;
>> > +
>> > +	return count;
>> > +}
>> > +
>> > +static DEVICE_ATTR_RW(samples_for_avg);
>> > +
>> > +static struct attribute *lm25056_attrs[] =3D {
>> > +	&dev_attr_samples_for_avg.attr,
>> > +	NULL,
>> > +};
>> > +ATTRIBUTE_GROUPS(lm25056); // should we set a name of this group to p=
ut all
>> > +			   // those attributes in subdirectory? Like "custom" ?
>> > +
>> We don't add subdirectories for other chips, and we won't start it here.
>>
>> I don't mind the attribute itself, but I do mind its name. We'll have
>> to find something more generic, such as 'num_samples' or just 'samples'.
>> I am open to suggestions. We'll also have to decide if the attribute(s)
>> should be limited to one per chip, or if there can be multiple attribute=
s.
>> For example, MAX34462 has separate values for iout_samples and adc_avera=
ge.
>> Do we want samples, {curr,in,power,...}_samples, or both ? Or even
>> currX_samples ?
>
>For my use case -- TI's INA chips, there is only one "samples"
>configuration being used for all currX_inputs and inX_inputs.
>So having a "samples" node would certainly fit better than an
>in0_samples. So I vote for having both.

The name is family specific. The data sheet calls this register exactly
like that so I used this name. But I agree that we could standardise on
some common name, even if the actual implementation will be
device-specific.

The LM5064 has one value for all readings, ADM1293 would have one
setting for PIN and separate one for VIN/VAUX/IOUT.

So maybe it makes sense to allow for some device specific naming (with
prefixes) where it makes sense but default to "samples" in simple case
of shared value? In this case, if there is specific value like
"curr_samples", user knows exactly which readings are influenced but
when using "samples" it needs to have device specific knowledge to
understand this.

I'm just not sure what would be the best way to express situation for
adm1293 for example - the PIN case is simple but what to do with
"shared" settings - expose both curr_samples/in_samples and writing to
one would change the other as well? Or just default to "samples" for
this case and have separate "power_samples" just for PIN?

Krzysztof
