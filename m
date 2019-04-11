Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AF9C10F13
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 14:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE8FA2184E
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 14:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="Pn4aRw04"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfDKOMh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 10:12:37 -0400
Received: from mail-eopbgr20108.outbound.protection.outlook.com ([40.107.2.108]:55764
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbfDKOMh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 10:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW2M49B7cvrnyEYrbY0aBGQaCiE04SAbhc0ZKZ94AY0=;
 b=Pn4aRw04zA3EH8yg4HesvNe3zMYQkGBa8sPLhlx7qgs9OAQM2rTsHZbjNvgTqEiOvxZqR0dp5XB/68Zb50W0ugPXntXEs4sr60+m3IVycl6Bl7SnwXEPcXQ/s61b0TdSBSIH+XJNlmM+FcjxUs05Z8FaNUe87Sccf9b17n7ydgQ=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3323.eurprd07.prod.outlook.com (10.170.247.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.7; Thu, 11 Apr 2019 14:12:31 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Thu, 11 Apr 2019
 14:12:31 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Nicolin Chen <nicoleotsuka@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
Thread-Topic: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
Thread-Index: AQHU7+43DvuzCLvA3EepOLFPKcXfhqY2IpuAgAA6cICAAGA1gIAAMgGAgAASDIA=
Date:   Thu, 11 Apr 2019 14:12:31 +0000
Message-ID: <20190411141222.GB12692@localhost.localdomain>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <e231af1feac9cbe8b72923a13587035220b76ad8.1554934898.git.krzysztof.adamski@nokia.com>
 <13669c15-3373-da20-6d68-50842d91be18@roeck-us.net>
 <20190411042429.GA19533@Asurada-Nvidia.nvidia.com>
 <20190411080849.GC28466@localhost.localdomain>
 <8bba4e42-b799-d0b0-0c58-61efce68a396@roeck-us.net>
In-Reply-To: <8bba4e42-b799-d0b0-0c58-61efce68a396@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0214.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::14) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92d96166-7310-4d17-d3c5-08d6be87bc96
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3323;
x-ms-traffictypediagnostic: HE1PR07MB3323:
x-microsoft-antispam-prvs: <HE1PR07MB3323A89F317DC2FCC70CA055EF2F0@HE1PR07MB3323.eurprd07.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(396003)(376002)(136003)(346002)(39860400002)(366004)(189003)(199004)(6916009)(3846002)(81156014)(6116002)(8676002)(1076003)(8936002)(9686003)(81166006)(6512007)(4326008)(71190400001)(54906003)(6486002)(61506002)(6436002)(476003)(229853002)(71200400001)(68736007)(2906002)(11346002)(446003)(486006)(316002)(5660300002)(66066001)(26005)(33656002)(93886005)(76176011)(86362001)(386003)(6506007)(107886003)(52116002)(305945005)(14454004)(105586002)(106356001)(25786009)(186003)(97736004)(99286004)(7736002)(256004)(102836004)(478600001)(6246003)(53936002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3323;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qsblEppLm2RmKNdwUQ3kJ8ekqAKRgDMyc1e1Eft8N/On0hTL1baHVGaAouqrbyzsFZyLZwChNWD7/5czgr0Z+OkkxGxPyZp8fhhy/02qyLTQaxFLbRcv14xta7Oijq12xF0e25nBy+vPEA0B214y84qdG0qW+hw/mK57NYLCAwyvFj41doaO1i46He120GVMUYAzovCYe/x59byLuJY1/u1NQYf2ahFSnBMXyO1eqPM/Nzz7b1f2BHlIYXN1FzyuwgqbfHhcpZw9SzzrrvOd0LdRjuadbsYuosLBdEKgVy7MTdyLlsbb/QFTZ8PDmF3xvyg2U2mgKyReTM7E7P0D/VfW/3OuVJxGmWusOwZ5svadO6PmPaOOHLUlBG2mwOgNwbAJnEFsuyABDJJMWm/y4VnKzo1G3vRcxnl3VpabpoY=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B578AB0F9197E14FA971F4FA61697F45@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d96166-7310-4d17-d3c5-08d6be87bc96
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 14:12:31.6409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3323
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 11, 2019 at 06:07:47AM -0700, Guenter Roeck wrote:
>On 4/11/19 1:09 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>On Wed, Apr 10, 2019 at 09:24:29PM -0700, Nicolin Chen wrote:
>>>On Wed, Apr 10, 2019 at 05:55:19PM -0700, Guenter Roeck wrote:
>>>
>>>>>+static ssize_t samples_for_avg_show(struct device *dev,
>>>>>+				    struct device_attribute *attr, char *buf)
>>>>>+{
>>>>>+	struct i2c_client *client =3D to_i2c_client(dev->parent);
>>>>>+	int ret;
>>>>>+
>>>>>+	ret =3D pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
>>>>>+	if (ret < 0)
>>>>>+		return ret;
>>>>>+
>>>>>+	return sprintf(buf, "%d\n", 1 << ret);
>>>>>+}
>>>>>+
>>>>>+static ssize_t samples_for_avg_store(struct device *dev,
>>>>>+				     struct device_attribute *attr,
>>>>>+				     const char *buf, size_t count)
>>>>>+{
>>>>>+	struct i2c_client *client =3D to_i2c_client(dev->parent);
>>>>>+	int ret, val;
>>>>>+
>>>>>+	ret =3D kstrtoint(buf, 0, &val);
>>>>>+	if (ret < 0)
>>>>>+		return ret;
>>>>>+
>>>>>+	ret =3D pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
>>>>>+				    ilog2(val));
>>>>>+	if (ret < 0)
>>>>>+		return ret;
>>>>>+
>>>>>+	return count;
>>>>>+}
>>>>>+
>>>>>+static DEVICE_ATTR_RW(samples_for_avg);
>>>>>+
>>>>>+static struct attribute *lm25056_attrs[] =3D {
>>>>>+	&dev_attr_samples_for_avg.attr,
>>>>>+	NULL,
>>>>>+};
>>>>>+ATTRIBUTE_GROUPS(lm25056); // should we set a name of this group to p=
ut all
>>>>>+			   // those attributes in subdirectory? Like "custom" ?
>>>>>+
>>>>We don't add subdirectories for other chips, and we won't start it here=
.
>>>>
>>>>I don't mind the attribute itself, but I do mind its name. We'll have
>>>>to find something more generic, such as 'num_samples' or just 'samples'=
.
>>>>I am open to suggestions. We'll also have to decide if the attribute(s)
>>>>should be limited to one per chip, or if there can be multiple attribut=
es.
>>>>For example, MAX34462 has separate values for iout_samples and adc_aver=
age.
>>>>Do we want samples, {curr,in,power,...}_samples, or both ? Or even
>>>>currX_samples ?
>>>
>>>For my use case -- TI's INA chips, there is only one "samples"
>>>configuration being used for all currX_inputs and inX_inputs.
>>>So having a "samples" node would certainly fit better than an
>>>in0_samples. So I vote for having both.
>>
>>The name is family specific. The data sheet calls this register exactly
>>like that so I used this name. But I agree that we could standardise on
>
>Well, yes, but the whole point of an ABI is to make it chip independent.
>
>>some common name, even if the actual implementation will be
>>device-specific.
>>
>>The LM5064 has one value for all readings, ADM1293 would have one
>>setting for PIN and separate one for VIN/VAUX/IOUT.
>>
>>So maybe it makes sense to allow for some device specific naming (with
>>prefixes) where it makes sense but default to "samples" in simple case
>>of shared value? In this case, if there is specific value like
>>"curr_samples", user knows exactly which readings are influenced but
>>when using "samples" it needs to have device specific knowledge to
>>understand this.
>>
>Let's go for "samples" and {in,curr,power,temp,...}_samples. "samples"
>should be used if the attribute applies to all sensors.
>
>>I'm just not sure what would be the best way to express situation for
>>adm1293 for example - the PIN case is simple but what to do with
>>"shared" settings - expose both curr_samples/in_samples and writing to
>>one would change the other as well? Or just default to "samples" for
>>this case and have separate "power_samples" just for PIN?
>>
>Both "samples" and "power_samples" at the same time would be confusing.
>Common implementation in situations like this is to have both curr_samples
>and in_samples, and changing one would also change the other (or only one
>would be writable, but that is just an implementation detail).
>
>So what we need is virtual registers (PMBUS_VIRT_SAMPLES, PMBUS_VIRT_IN_SA=
MPLES,
>and so on), plus the necessary code in pmbus_core.c and the implementation
>in the chip driver. We'll also need to document new ABI attributes (sample=
s,
>in_samples, temp_samples, ...).
>
>Any takers ?
>
>Nicolin, I think with that you can move forward with the TI INA chip
>implementation. I agree that 'samples' would be most appropriate for
>this chip.

I will try implementing this the way you suggested and resubmit this
soon.

Krzysztof
