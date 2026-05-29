Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6DF3F9A11;
	Fri, 29 May 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073537; cv=fail; b=tihQ7ErsuhB62vuqLvdXfr89iPWM4STmt2TrfNtJ56f+oIdH8/+9HboDIvWfTgksPJsidOCeL78xD3RCjK0hOBc/LIYbbLLCmHzhqG91u641PxL2eMEiwG6KX5wyjqXYQk2hN5n00UhcM4GNkVL8yVgpk6swy4Y7IQWiMFPfyf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073537; c=relaxed/simple;
	bh=mSq72hjy951ndxzbSaO1O0nbtudZSZkJjGd2ECtd7ns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VffIH2/8ZqT+IN/UHq8UW2Q1caZpYaTbrg46Sns/Orqf6EFei5njSymuvFk/MhZ/BbjfZRMk+vSrapN3O5vu67gsMtI+PUD4l4TDtuTW/5wtO0onNE74Rr/KLABKY9rSdDzMxJeszVWgQDVBePjb1zsxfxQHZA7uX1DpCBKZHxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=JABEWeIQ; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="JABEWeIQ"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDWF3C3208864;
	Fri, 29 May 2026 16:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pps0720; bh=mSq72hjy951ndxzbSaO1O0nbtudZSZkJjGd2ECtd7ns=; b=JABE
	WeIQ8jYHyH76oRviRPS/wvFnTQU7jBFUxpPuIEkr20kXmJy3w/GUqB7yjFQK3Nz0
	jza2qKtJ5qJd9s274JV328BhXjU07U5SCAaB3Pbo1RltbU++TX8CcSmykXRAVEQs
	9vlQ0MtzQTOJ2ZyqVRTdDDorPqRkfXP8EKy78gZCRFlRn+yG71PMrAfm7F+mlvGJ
	aYVPl3EUVt4vTWnwKpb57Y3joRmC4537G4njLzrfdEadiSDV6qRhUd88u8kEEaaD
	qpLfQBeI2JLV9IE/PhJMVbOXO7PaRD1NDp0qcgMoXtGdnGeCL27sJ//dsJCmX3IF
	mFbQMwOcxCL8cbeXig==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4efa67ukpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 16:51:55 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 6E2B58003B3;
	Fri, 29 May 2026 16:51:53 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 May 2026 04:51:45 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 May 2026 04:51:45 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 29 May
 2026 04:51:45 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdLF2l19TwvlCMaB7tNwjfnvEsKKl+BkAzyufMp2yHyBLL8ANI9zm3Y7p4Rx08GB0wIAd7I4BTgYXHD1EdL4lSPF7lYeAKhPkb4Z7iI+Q3TJcKt0r7G2yM7vzKtRAgQ1a3PD18iLTHfib/Tixmb8oCSkDiDNbwdqLdh03lYkccXcBEz1EBIGI7+RZUby7eC5HgJxwKYfXPtMwgQa5tcz9kbHimEpFVQSUpaRMN4C+kBW1dWAyT7bxfLt2nyd6rSyKdtEmEtykutdSjwcdcgDNSN/kvGVR6V0q0TYBJztnrGaFhSNvh2SiZXYZYYYKPePZbsqOm0hnLXTv2svAt07Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSq72hjy951ndxzbSaO1O0nbtudZSZkJjGd2ECtd7ns=;
 b=pk4R3JaaW3cl2Gd9KeKyVqTEiUeafq84E87PN4/eokm00kIEXbrYVlsfNb48odfI85qTecOvMglFqliIuDeovtNPE0aU0JA4miBUjem9amw5iI1wBK1gzZfKa9aK6oF1OuOpyKu/X37BShvbQ1o1alwLoJ4+YHN7cbbbF+LcT0SMcfkUAZVx5gtA2cJ1kyAZj6Hsb8j+CNM5d37uLJUCWowJ6h8rK6IDTJWKfY57tO4yJu+7eTvEpJeCC5y7m4uGc1JA0y/3HoStWqhEyAUY4wX9obyGIlA7MtbJlvwHIJcFHJ6KiVwlrjBsXJYlLTMxGkuVCKGz8eT3uYF3SYWuBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW4PR84MB1705.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 16:51:40 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 16:51:40 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "noname.nuno@gmail.com" <noname.nuno@gmail.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Topic: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc7wDM7+FlL4i+8UaJulySqZHrIrYkvc4AgAB6/gA=
Date: Fri, 29 May 2026 16:51:40 +0000
Message-ID: <20260529165132.678448-1-sanman.pradhan@hpe.com>
References: <20260529001903.625737-1-sanman.pradhan@hpe.com>
 <20260529001903.625737-3-sanman.pradhan@hpe.com> <ahlcnlJJnLfmCZNH@nsa>
In-Reply-To: <ahlcnlJJnLfmCZNH@nsa>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW4PR84MB1705:EE_
x-ms-office365-filtering-correlation-id: 8b96c6d2-35f7-4695-e95d-08debda28e6d
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|18002099003|22082099003|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info: B4qeQZ1PhPiIm2HepO1RV4qZP/+vgUJbFKkaQwIaZnvXI9jTnKZMOnzyk3dg/3fiaO7kn3r0MKBnGc9FWy6o61M2oaKG9KPZVqrV/cX/8D/HzWInoLlDD6uFHSthnvYLA+GCnyfDg0/Xe1uGZvqimGCqsEsaRcWhKp7oJoM+5OZJl/ENpx8+U3HUDODZh+JTJqVLpdrHZnWmnoT0tuZoBt9PYc/0pDkdddm1p7iF4+WGOw1ao96LllhuiEBF1AXQ6sNBnmAu1XAZN4PLJDP7Gcz3rhuKa082ObsuIqNQnWpn+jrj1YepsRAL14Nz/2dZp2r2cwsY6E2FJQtfIF/fo4LMTUxpUJEcAQj40nYVLubGkqh4lA2Lv4PWTiNnCpMXdB/nM0TvsbbWw7irePASQ7bohv6ppP3cECFQG4Tw76d57CnY3uIyY53P06yIcy2JnvbzXU4LkMMBkn5JqeZ3UA2MrSOotIPuLJYTtKqprtF8p+AzNq5pzKylKemHgXEk75k1elofSPz08YEO303r44+665RVBtJ+bMcWi3wsTR6JTlXFPCbc5VSvEDV8nfJ0MbFkjGlCraADP5IULm4DshwnqUNabwFCVT8ZSqOdaSzta8eIPktvpXc7BPMVBY1VSdP0lcE6EkBnfvrBAQrA4ACZRHkyCfpzHERgeA6TRpHYhOMWd8hvoTz6p8WBRWiSh32GuK294mEVOxZoF+fLjYH5P4ndwpxs9oeNc/Xo9R0oekhUgR1CZuYi3zy/T4Yr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(38070700021)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1EyN1RQT2p4dU5HWVRERmlhZk9ucWI2T3FOeGxJVmRrUXVvdjRqcU9VTlRl?=
 =?utf-8?B?NktnV29vcFZLeTBRN0Z0dUNyNHBveDkxaXd1bThwWStUSDJUZGl2UGpKMURa?=
 =?utf-8?B?NUYrT1BtMGQ1RUl1bzlmbnRuZEVVemZ1WUpyWmxzUTdpYm5GQ0lYZFpLd3ps?=
 =?utf-8?B?a2hvUGVtbDdtaW9Yb2IvQ0JPTk8zZjVFT2YvUVc2QTdQOHR2Sk1wZC9xclRy?=
 =?utf-8?B?MHhHdmhENmhzOEgwWUxsRE84SlorQjduekFLT1p6TE1LMVVyZmVmajQzUEFZ?=
 =?utf-8?B?Vkozc1BqZklBaHY3TmQ1dTNiS3BmeGZCOERRbUtqRkozbGpmbkhQeXlHanBU?=
 =?utf-8?B?ck5ZT1RSRTVIb0RUaEhvSzR1bU1rbTYrOGx4VHhFT1NON2lHUGN6T2dmamQ0?=
 =?utf-8?B?QzFHdTV0Qk40bWhISE9oMm90NVo3TW9yeVdNYXdDaFlkV0dvdHVqQTd6WXVo?=
 =?utf-8?B?b0hLdm5oSXFnam9zdlYxUDBrWWFHRjdEMDlRZ1BJV0p3dHVwQUdwdHcvZHRk?=
 =?utf-8?B?aWFjajF0KzhmUWxBZFNuVE9CcTUwdEhGVG1FWE5PQ1RCV1JzaW5BQnZ4UG9a?=
 =?utf-8?B?ZTV1Qk92aW1WSHYzRU1jYnZvenE2TXJLNGt6dHB5UkFQa1dDMUJLRllLUWgx?=
 =?utf-8?B?dUdUeG1xcmk1dTd6OHhOU1ZiTkF2eW5JeDhkS0ZoR0pvdHhXaVAwZFd3N3h5?=
 =?utf-8?B?NzB2TFYxNy9DR1JZRjBHajUwSUZnTm9IaEYxNXBtNTc0YldWbWU5TFVSTzdP?=
 =?utf-8?B?RlAzakUyRFB3VXhTZjJqSFdBOTZ3L2hBdzRSQlczWHo0TnFxT1VBRHhIMWRD?=
 =?utf-8?B?a3BuU2NKRmxyUmZRdGtQTlpyOGJvWDNJazIrdEJhVmw4d2M0VGlQM0xWK3ZW?=
 =?utf-8?B?dzM2L3AyL0dCaVJScmRtNVNvVkQvTEdMUDZXSWYvTXhOSXgrMU5Vcmk0QUw2?=
 =?utf-8?B?V3MzYWFld2M4a3BPT2ZWL3ZwQS9OdDgrRm1DUCtDS21jQzVMNGpRazBJK1RE?=
 =?utf-8?B?eEh3QUU0RUkrQ2VhYnp0OW9iZTMrajFudlVkZkNPSWN6SnVRTDIyM0JocXEz?=
 =?utf-8?B?aWZlS3VBNEJGeGZqRTd1MnJReUNSL3Q1T3czYXVqeGh5bU9lbFgvYjVDQ2FY?=
 =?utf-8?B?Nng0cUZPZXN5Tk9rWUVERGVYUTVZOEc4RG5tT0Nzc2daZGxHc0F0RXE2YUtE?=
 =?utf-8?B?SjdFZktKYjlIL2xqWC9Tc1JNdE4xckFCZ1k4RW90UDJ3ei8wazdwamtsZ2Zj?=
 =?utf-8?B?cnBHVkpkalBNY1cvcnE1WG5sT21VKzNZOEh2TDR1QktVcm1JT2ZKTE92Nyts?=
 =?utf-8?B?Q09UYUxvdmdQSGYrYnZhenNaaFAyRVRNSWhNMFlSWWRjclhDd25FUkVDYnJC?=
 =?utf-8?B?SlFseUwxTkUwRS9tajRldjM0TVVmbzAzUHhsamY2Um8zbERsYzdzd0dKNXJF?=
 =?utf-8?B?b1pXN2FHR3VSQnErUXR6Smxxclh5SzZ2K1daUXJybFRYdElDUlBwQ09QaWVx?=
 =?utf-8?B?aUtTVVNoWXhjUFlIUHFQMWRsL2RlUGhKQ1FmY3BQOEJEdC9HMzJXdFkwWDFz?=
 =?utf-8?B?MktnaC9nOEdYNDZ2NjFrT0c5ZFlGWEwxYUJYckwyOERDc0lYdXlIVzNNd1l3?=
 =?utf-8?B?ZlFBRnBrWlNXMzh3OXU5ZTIzbmRyNDdEQ2p5Q0l1TUtvVWdiVnI0U2Z1cm5Z?=
 =?utf-8?B?bHRQU3YzcW5FV3JTUGxyRldwY3o3NlMzaGU1Ty9ORmI2WlhjYkRMMm0rT3RB?=
 =?utf-8?B?ZTZHOW5WdlUwVjU0NWk3Y1oxZDg2R2EzYWR6dzVCSENFVjFSVGxjengxbGxn?=
 =?utf-8?B?VWNSQ09vU0NBeHl0ZjFlWmJHcy8zQ1BZYTh1NnlBeUJjK3BzZFJ3WjN6d29M?=
 =?utf-8?B?LzlZSXlPakcrb0NNVS84cmptZDVlSlVhNlZLd0Mvd2w5YXU5V0lNOHVSeWxU?=
 =?utf-8?B?VzR3YUJpNjR0UXNMWU5pQkxHbFRxNmJzVEhnMGJ3NVhQRzN1c0xpVlJQY2Ni?=
 =?utf-8?B?aDdCZ2Vna1paRGtHM3ZDWXR6KzZ5TmN2SGJoL3VFcjN0bXlCeUhzbzh6cjU3?=
 =?utf-8?B?czdVb1BJK0pXU0M1aU8rSThKUDRkNVhCUUswWUtEbm5MVVVRUWRpckdWbGVn?=
 =?utf-8?B?SDVPYVVVNmM5M2FaM0RaSll1ZlRSbHNOdit4VzNaaU91ZDlhNlg0UjZhU0J2?=
 =?utf-8?B?bjNZUTJtUWtRNW5sSW5iWE5Nc0dJUUl4WEpmdExjSWhiaE1tbVVzVVdrRDBQ?=
 =?utf-8?B?UDArNkkyOWlQS04veEh2ZjY2RW50Q3k0aS9DNDQ0YVFzV2hacW8wT0Qrc2N1?=
 =?utf-8?Q?a2ww7HydBefIibFA8R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A52F21D1946BF647827A8AC5FA09199E@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LzYU7aY2gqTFPYlyhRqLgTslnqJoV4ent1sUm7PZWKR/7k0ElCpe6yiCcLe5OoG5RaZ59BxOsaOu+ASqLRB82jxMPLxR/pWVNnZYaVUOKeqPso7wJX9vhRqSm4C6JvLwsaSJd6mg/Kk1Cr1WapX+y3Z2eojOfSiQgBZZ80XqtPbXwM/uK6RRXal6Juy4BdJZjj5htxb9B/FZqYzBlNwDwZphkqgJyfCzBZUnFjPlZb0nJ+Y0cDJrFbA3adF9PwWjSKZLu7CrI+o+b0PdnTs0vu9QTFSH/fHYRjUxIj6Ei3w3PmB48/poB3L1T/WrsRGmqemuSDDmgznkj2cJCC5QkA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b96c6d2-35f7-4695-e95d-08debda28e6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 16:51:40.5051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L35AFPsuOqQMosVT79NXLJa9u1nFGrGysxXdWqIb9w4HTCBLnApfrqO0fTQKMyzelOvHwtu/xRl38hMVzkG+BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB1705
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: Xqac09rY2IYxaxVER1aFthI3m_SybDq8
X-Proofpoint-GUID: Xqac09rY2IYxaxVER1aFthI3m_SybDq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE2OSBTYWx0ZWRfXxtLCV29dNrGB
 1sM9OzsYsktUM48viyQ/xOsiNFGQsYMP4TV27nmUFrWjZPpG3iRpYKaqCDAWSrlBDT3JT5uxFOV
 xXZ/3eNaQwc68fMZO94xhhbmDRs0EyyImafcE4J9i/fGLJbkVMRCPOEQ8xH07oKtEbASvrw5bQl
 omrgYUmQKkNbnUNyW07bKZbo4vG+kPvTaqFcqFrYEA5CFpvqn63lzocXKTGunTPF3ZlkEfuZPl2
 Nnw3hX3hppwWPNxar5FCF0Ktfq0BGpymHN8+BJ98/BCbRMazxN8ccvN0KdUM9tz8SUNXmGhP1pa
 qJzDpGqC+zYO3+B2KstQTm7zorqTQ+RKfpyNzaD+PgVBfbpRaSThU6Hzy9axCAB8WKUsz4bx73l
 67wAGR72rsagk55djX1AY91cX21Y5cHW6sfIcV/47YSL3B4O2UJHVG+lLer1OP7jyGP+aMeMBRT
 e1v/B0jGDNXect0ZLqA==
X-Authority-Analysis: v=2.4 cv=EdT4hvmC c=1 sm=1 tr=0 ts=6a19c42b cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=Pa54clcD5aRVlPrfNpsA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290169

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpPbiBGcmksIE1heSAy
OSwgMjAyNiBhdCAxMDozMToyMCArMDEwMCwgTnVubyBTw6Egd3JvdGU6Cj4gPiArc3RhdGljIHN0
cnVjdCBwbWJ1c19kcml2ZXJfaW5mbyBtYXgyMDg2MGFfaW5mbyA9IHsKPiA+ICsJLnBhZ2VzID0g
MSwKPiA+ICsJLmZvcm1hdFtQU0NfVk9MVEFHRV9JTl0gPSBsaW5lYXIsCj4gPiArCS5mb3JtYXRb
UFNDX1ZPTFRBR0VfT1VUXSA9IGxpbmVhciwKPiA+ICsJLmZvcm1hdFtQU0NfQ1VSUkVOVF9PVVRd
ID0gbGluZWFyLAo+ID4gKwkuZm9ybWF0W1BTQ19URU1QRVJBVFVSRV0gPSBsaW5lYXIsCj4gPiAr
CS5mdW5jWzBdID0gUE1CVVNfSEFWRV9WSU4gfCBQTUJVU19IQVZFX1ZPVVQgfAo+ID4gKwkJUE1C
VVNfSEFWRV9TVEFUVVNfVk9VVCB8Cj4gPiArCQlQTUJVU19IQVZFX0lPVVQgfCBQTUJVU19IQVZF
X1NUQVRVU19JT1VUIHwKPiA+ICsJCVBNQlVTX0hBVkVfVEVNUCB8IFBNQlVTX0hBVkVfVEVNUDIg
fAo+ID4gKwkJUE1CVVNfSEFWRV9TVEFUVVNfVEVNUCB8IFBNQlVTX0hBVkVfU1RBVFVTX0lOUFVU
LAo+ID4gK307Cj4KPiBBbnkgcmVhc29uIG5vdCB0byBhZGQgcmVndWxhdG9yIHN1cHBvcnQ/IEdp
dmVuIHRoYXQgdGhlIGRldmljZSBzZWVtcyB0bwo+IGJlIGEgcmVndWxhdG9yLi4uCgpUaGFua3Mg
Zm9yIHRoZSByZXZpZXcsIE51bm8uCgpUaGUgZHJpdmVyIHdhcyBzdWJtaXR0ZWQgYXMgbW9uaXRv
cmluZy1vbmx5IHRvIHN0YXJ0IHdpdGgsIGFuZCBJIHdhcwpwbGFubmluZyB0byBhZGQgcmVndWxh
dG9yIHN1cHBvcnQgYXMgYSBmb2xsb3ctdXAgcGF0Y2guIAoKSSB0aGluayB0aGUgRFQgYmluZGlu
ZyBhbHJlYWR5IGluY2x1ZGVzIHRoZSByZWd1bGF0b3IueWFtbCAkcmVmCnNvLCBpbiB0aGF0IGNh
c2UgYWRkaW5nIHJlZ3VsYXRvciBzdXBwb3J0IGxhdGVyIHdvbid0IHJlcXVpcmUKYSBiaW5kaW5n
IGNoYW5nZS4KCklmIHlvdSdkIHByZWZlciByZWd1bGF0b3Igc3VwcG9ydCBpbmNsdWRlZCBmcm9t
IHRoZSBzdGFydCwKaGFwcHkgdG8gYWRkIGl0IGluIGEgdjQuCgpUaGFuayB5b3UuCgpSZWdhcmRz
LApTYW5tYW4gUHJhZGhhbgo=
