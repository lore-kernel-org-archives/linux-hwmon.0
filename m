Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08B1C76194
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 17:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70A3021903
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 17:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="Su01ev+k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbfGVRjh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 13:39:37 -0400
Received: from mail-eopbgr730064.outbound.protection.outlook.com ([40.107.73.64]:44927
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729483AbfGVRjg (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 13:39:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8y5FHs8SMT4gC4bvPkwcC4ETp8bL6U56fulNcTe5c6IH0RfRaChrt4MzlvP6AYhnm0YgBdntrvPs8BMyiVPr9U8OizoHP0Qioo1te8ndnenqxRTAYoCoBiBqqlJ9kPVFbGoN1iaBxHRhf5SXA6JHTv6Tqm4ZEsjZFk1c/lEo55lWoQbCcYnpU/zKvKY4WlBcJVG2hSisPzCRbJJylGm5BMzQiMAyPlTXDaz+GixT6MkenTaAU5wnaJoxfnLFzSBZ6fcdjaZt20ZfihNOnd8KERIKebjhA6RLvmfFbqoYsbrOHtvdgWZ0pks7BktaWEEMgzglre8bsDU4Ge9lFUp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSG61tJRNaWVOW2DM7BIAyRFAGAeIqLDOpe5uWJ8+U8=;
 b=cAPwFpoZwM+GoyYtat0JhahUEurp5K7TJbQCPLZ7KyCqPNxGtpiDPhUueBw+DjXR1lAGI10Rhj0DR7a5L7qPdsss9wo22Tu1oOMkuDjzuAJGfZDvqokWWxLYFBZR2zq4cg1ccCfcjTIJ9H79jdpLr05gdqKhCLttk/zS76nAdaI+VUDoAxnNU1wQ1t26m/VY+pFYdLQO5MBH++vGsPP8e0PZKLrWPpIqlF+T+YkmVNDcuIbpLznk2RgpLXGPJcMwdHwkCo8sAgkybmif5N7Kr3T0MlT3IfvvSWu97M80D42uXrkHL8KvfASqmNAj1PYt1LBiIylrQPYTYlfnfpBa7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSG61tJRNaWVOW2DM7BIAyRFAGAeIqLDOpe5uWJ8+U8=;
 b=Su01ev+kbwk9weKVw5JXesf1vY2/MlN2N9QXF5TntW1c5SxXNOSZicbF1ZVwoxSTFZh8yAJOywRroKugCGr5ZneSkVXHWGHHKhxXRMcHX9sWxu0yjLCrXS/eGfF3JdfxccbhXsE5Ph0HY0XL+WFfsGCZsTczItHK8pp7Fglzy8g=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3931.namprd12.prod.outlook.com (10.255.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 17:39:32 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 17:39:32 +0000
From:   "Woods, Brian" <Brian.Woods@amd.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "Woods, Brian" <Brian.Woods@amd.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marcel Bocu <marcel.p.bocu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Vicki Pfau <vi@endrift.com>
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
Thread-Topic: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
Thread-Index: AQHVPZaeMBHdPQBtAk6JmgC81fj+3abQxC4AgADLIQCAAGDOgIAAIqAAgAAKiwCABD8YAIAAA7GAgAAfLQCAAGDigIAADYaA
Date:   Mon, 22 Jul 2019 17:39:31 +0000
Message-ID: <20190722173928.GA16597@amd.com>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
 <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
 <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
 <20190719160840.GA26100@roeck-us.net>
 <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
 <20190722091245.GA23240@nazgul.tnic> <20190722160420.GA16162@amd.com>
 <20190722165105.GA9336@roeck-us.net>
In-Reply-To: <20190722165105.GA9336@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:3:23::16) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7f242c5-a4c9-4242-111e-08d70ecb8db6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DM6PR12MB3931;
x-ms-traffictypediagnostic: DM6PR12MB3931:
x-microsoft-antispam-prvs: <DM6PR12MB39311434668996A4649E69EDE5C40@DM6PR12MB3931.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(199004)(189003)(256004)(11346002)(229853002)(14454004)(7416002)(446003)(316002)(2616005)(3846002)(8676002)(26005)(476003)(5660300002)(25786009)(6116002)(6916009)(6486002)(86362001)(6436002)(54906003)(486006)(305945005)(33656002)(99286004)(6512007)(7736002)(71190400001)(53936002)(71200400001)(4326008)(66946007)(66476007)(66556008)(64756008)(66446008)(81166006)(68736007)(36756003)(6246003)(81156014)(66066001)(76176011)(52116002)(2906002)(478600001)(186003)(1076003)(8936002)(386003)(6506007)(4744005)(102836004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR12MB3931;H:DM6PR12MB3515.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: swZlAiOrmK1YtlWnTb2VC8HpATDKmpSVIY5FVU3Q5gRBl1vo/D+kYW3vCMvHlhE2LAIdjDfStFdCD/r9YsFb3nm2npyy8ygChNLQIxKJoUx/v8bN13UgY7A+CAxlqDlLmjUYtqGPz08/ms3Lv/bFHxcvqDHhEGgJeQIpQtJ+x0Efoku8f47ERRGR8GZqvtYoP+/+dB/nhfRI5gu5aKvsk/shG48opkiYJqAMgk4dc/PZyFeOISyRAPzj0A75NntASv2CTziPOfPI1w9sZflh46AIWV1jgYmyEzmw1U05Q8sqMcZ3QusLGmqG+XXW5fivKMoo4yL7plLepJf3ftWEVALakgmUo+3xbZT+57UKXNsc2XDdBGbeVVGvw/YDmku85OJYb755j8l6vTg4xambycO+7giZ0FstTmNhWgp3fR4=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <819BC6A8951957409A0446F455BC56B4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f242c5-a4c9-4242-111e-08d70ecb8db6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 17:39:31.8311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3931
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 22, 2019 at 09:51:05AM -0700, Guenter Roeck wrote:
>=20
> With 3900X, and the series applied, I get:
>=20
> k10temp-pci-00c3
> Adapter: PCI adapter
> Tdie:         +45.1=B0C  (high =3D +70.0=B0C)
> Tctl:         +45.1=B0C =20
>=20
> which looks about right.
>=20
> Interesting, though. I thought there are two CPU dies on this chip.
> I guess the temperature sensor is on the IO block ? If so, are there
> additional sensors on the CPU dies ?
>=20
> Guenter
>=20

That's good to know.  Thanks for testing it.

What happens is the IOD takes the max temperature of the chiplets in the
package and presents that as the temperature of the package.  It works
the same way as it does in Rome (server parts).  For better or worse,
you just get the max temperature of the chiplets rather than the
temperatures of the individual chiplets.

--=20
Brian Woods
