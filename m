Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B28C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 May 2022 20:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237742AbiEMUZV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 May 2022 16:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384262AbiEMUZO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 May 2022 16:25:14 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63E916609F
        for <linux-hwmon@vger.kernel.org>; Fri, 13 May 2022 13:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652473476; x=1684009476;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=y7+LK3tANZSfrfK4ZrHU6fd8mwBsLXSFBA386o0X2AE=;
  b=mJYIB5NAuq+nm+3UIu62T3HOc+5LVtIC5aVttc60ys0N1eDnNACSViK4
   W01CnEb/kBBpgfOGmDf1q6X6+SFbYBtQIHJZWNUGLJpQX2K2sAfnekrtk
   qM4IvwP8E+htVAbWMttRxZiMwok3P+VdWFxCoXZvHnu53TibjofBxS9HJ
   vR4+UMD8DZezV/WT11s+Kypma/b1DRtv2Ps79CWNWlSVQnw4hPUygcu5l
   TpFvGRA2v/hfbGxEZXxuZlJlMv49rm5ec0US1PbrZgEY9ZJvzwtw8A9/g
   66O/FkUNLd4rksYfUPSGZVFbN19inpxLj9REAn9m4QbsGuLZ7SH8IrHTA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="331005716"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="331005716"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 13:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="543409373"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 13 May 2022 13:24:28 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 13 May 2022 13:24:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 13 May 2022 13:24:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 13 May 2022 13:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWzss6qiJq35AN6ihqox+JsMgbMCWHxahae6QMkHUY9ruFMNHsJ6sELhCbhnCU75IjL4wXoDhWNRWXO/ernOp4S4hVUYOo4beIAi9t9qX/gXsJocuvw/KtJuA4iWwDPweiP04Pnp/Wh+J5UKOGdQbkIocNBecgtnOlQ/1N495EjdqtmtI+V1+/zZCYAaU7h44rMVuZ8ngtaev6dfRFDP/6CA6apo9bVpq/ye37/Rj6Zsi4xugVZ42O58y9nMSPwsitLBfkNg8YsVUQbM310XEMyXYNldFIwVev6xLq0jEBUpgTrcRZF7extmgCC/UpJuocrozBUIohuBxCyV7MzZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7+LK3tANZSfrfK4ZrHU6fd8mwBsLXSFBA386o0X2AE=;
 b=N4EbFK3A6tddOm6+5KvmNEfYHGnRPRNlFK/RYwHRowlJStU1YXqfekKdNI1urG86K8f82iZyXqrnMY63Ivmn8WsDy08VKNUqctk0hm0FBrJALC50XN1uokiGPf4gwhh1c6EG29qDaV8Tv37n3A+Usa96aSKtfjZYzv46qpxF7REnKxESN7Adylyr7CB9R/wLh72ynY4RLlTWWrAglI66YW+C0p7J3t2rJM+u7PY7yhGlYWmJMW7q+wVFJmGxia9ij70iC1RblGpPPRe5rUDWdnmXaCqHxe2xPt+xEhHvWmsLHLAgYGRB85Y+ySwQ7jQsLEIw3jIwpkqyJlBg1hCBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 20:24:26 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6d32:6a6d:5142:577]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6d32:6a6d:5142:577%8]) with mapi id 15.20.5227.023; Fri, 13 May 2022
 20:24:26 +0000
From:   "Winiarska, Iwona" <iwona.winiarska@intel.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH 4/7] hwmon: (peci/cputemp) Use HWMON_CHANNEL_INFO macro
Thread-Topic: [PATCH 4/7] hwmon: (peci/cputemp) Use HWMON_CHANNEL_INFO macro
Thread-Index: AQHYZjpY1v3V2aj7TU6Jd1VmJ+fpLK0dQmoA
Date:   Fri, 13 May 2022 20:24:25 +0000
Message-ID: <228efaf3483a8abb316f4897b1a87748e74fb6df.camel@intel.com>
References: <20220512195556.137741-1-linux@roeck-us.net>
         <20220512195556.137741-4-linux@roeck-us.net>
In-Reply-To: <20220512195556.137741-4-linux@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abcd08d0-05a6-4284-0855-08da351e9321
x-ms-traffictypediagnostic: PH0PR11MB5832:EE_
x-microsoft-antispam-prvs: <PH0PR11MB5832D5F1A643DB82729F65FCECCA9@PH0PR11MB5832.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gd4D7YBax8jNtbwjYTp5Eg1cBlYGBOp11r6IDRiwGm5u4gP26XHZuR+BLwrSD47ylYg2uyf3cYE/78EdwvqHeHbzGj28F5QSa7wb/dLAjk4qat/qcpvCm3Xn8S/cuRu68THoa50Xq5oU0+n4jubumyaCbNgJaj6NZvmBK38DyRJtyju0sCR1O6h5Rbz7S5G78SZmtDq0wdjzgGUzzlx3CWit+AGri3L9cohUD8JZ8XufSnOscryBQWaKf8s/MW1SD84QqIuIVfe8FTteOnZu2MuSsMXOiBAmLgCNd5JqJ/CAuqb34k2s6O3vkz+uZs7SX0uXOkJPdnP1Qq9hKXRJaKTqajmFJvNx8qq7NcLpRkOGPy2Ea4AN4tpz+LdQ2JQQDv8FXxitDtWlR8Qyc/iCmNk6Yntl96wVab5kETuz9yCVnHF7RVV1rGGU6s4smO8AAxUQLwlQCTIKdOM3wkYzqOSKuJeeFXcm6yW94Xpo3mhLmO1NtU8Q2JKzNhJ4hhq4IWWdrc6meEeN2sAhmtj0SkJRLEEKOkwKFL1dEUmzbEaGWpQfqHYJZ/XDnjZ7AAfd+A0m4z5lUTsvh5auJhtmj8bHTsDMfkvOoW/rixY2WWu4a/V3JZw45nRuv9ur+BXh4aLQbRHdnPES9UaD5NANUG43XEQxD7qGQige1l3/kd29MVUXBAn88w1QW01sKHcFc3tX41NEIX3gbyuUyoBEUA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(71200400001)(86362001)(2906002)(508600001)(5660300002)(83380400001)(38070700005)(66946007)(8936002)(6506007)(6512007)(82960400001)(122000001)(2616005)(26005)(186003)(66476007)(76116006)(36756003)(66556008)(110136005)(66446008)(316002)(91956017)(64756008)(8676002)(4326008)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnlLcHVTVGwvRTBxY2NQK2hLQXFrVWsxckgxejhWWHU1OW9GMGRjYmwwRmdX?=
 =?utf-8?B?ZCtzQ0l0Q1RKVXMwcEhnTUJPMm9aWXF3TmNOM0c0dUZwZEtmd0dWMDNOMFZn?=
 =?utf-8?B?ZHdFZjhZb1Z0dUlpaHNOeUE3bnBiTlp3Z2pmTnN2d0VGV05PWVJJbzdGYVZx?=
 =?utf-8?B?S2k0c0I2RisrRjlsSjFpWFdsZ25yZUwxZ29hWkkrMUtTOVgwU3dOSklwYkRw?=
 =?utf-8?B?TkpWWC83SmM1aFRvSzNPSlN0USs0Rkk4Mlltc2VDbnd2UjdNTW8xT0NrTjBq?=
 =?utf-8?B?bXpSVDkrR1ZvNUZFNWxFTlZSUXRad21WUGtiVjI2Y2huQVEwRHAvMTdONHRk?=
 =?utf-8?B?MnBKRXhXTWtlYXo1SktXbjZOZXpNZ2NKM0JpdHNWbWtndkZvQzkzb3JQOWFh?=
 =?utf-8?B?elVOTmUvSzZsdlYzWkZoMEQ1ZDlJeGZuL29GZWxwdnRkWHk5My8rcVlmMzFX?=
 =?utf-8?B?cHhwWmFNMm5BVE1UL0JCR1pCK1gwNHJJQUxiR0lKRUZaVXYrMElwNGV0eDJD?=
 =?utf-8?B?NlNhZjhjU05oanpGTmN0UmhuWEhRcHdVRUZIQTlBdXVsN2EveHpZVXVnS2o5?=
 =?utf-8?B?TEpHMm9UOThPc1M4cmRNdHE5RVNDWlBBc0JkOUNxczZPelQyaGFJTlNyeERm?=
 =?utf-8?B?cU9HQWdjOU43bkhCOXFGY25CTVl2S3FSZVdZMWgycTQzRlVpbVN4a1cvSEgv?=
 =?utf-8?B?UnFNZElCM2RmL0FLRWt5UXU4cTcyWS96RmZQODl2SkF0TGFFL2V2MVJWalRx?=
 =?utf-8?B?eHJ2WTRCd2RTcFdLK0EwKzUrZGdSc0gyTUtCdmRDVFVYUndDQ1hBTDNvTjM1?=
 =?utf-8?B?VEN2SXlCNGpTN0ZheEp3MEd4N0JpT293OEs1Wkh5Kzg1RDV0TXJRYmxjQTI2?=
 =?utf-8?B?SHpxcjRJM1VUWGptZlhjaHNoOWxOaW9WbGtRV2x5K0p5YnVKNkhmbGRyU2xQ?=
 =?utf-8?B?VWs3SGlRbk42NHh0djlXMVlNbTVGamNBbmtzaFhVMFgvdjExTytrOHhReUpj?=
 =?utf-8?B?TnczdjN5andMTzhubytBWTVqaFpPY0c5SFZ5QTNwZ09vaXFWQm9LcVRoZUpz?=
 =?utf-8?B?R3N3bnc2M1hYWXZ2YnBiN09ZY0ZvSGpMbndMaGNsZG1wZEZxUEtMYUt5cGpq?=
 =?utf-8?B?T2FOUVNSb0czY2FlYndqQ29LajNkdEpDQk9iRHc3M3JEVGxjUlBkRlBRdFNB?=
 =?utf-8?B?VE1vb2V2UWtmUnQ5SHplNjdUOXZPaXFuSjNJQ2k1Y0RXcG5qbGhuM0l3RS84?=
 =?utf-8?B?M3Y0RDdHTWhyTmhBOUx4M0RRZ1VSK3N5c2pKUmxjN21JVW1pTk85K3llQXlm?=
 =?utf-8?B?VW9XeHRmb0VSb1lWTzAxZTVRbmZOeXh6bnJrNXlBYkhHM3dncDk1dDU3Vzhw?=
 =?utf-8?B?Ym5zWHNjZGk5QXBHNkdKNStlS1E3U1FCd2M3UnpOdkRINHg4UXlNWU5GUFQv?=
 =?utf-8?B?K2RYTEo2M0txVWN0Z2RuVGMvSks3cVg3NHd4WEIyd3R2UjRVZWU5Nmhrd0lr?=
 =?utf-8?B?Nk54aEp0clRNckNlL0U2b2x1T21tSXErUm1saEFKOExKVUJ6QUFNZFNIb0c1?=
 =?utf-8?B?ZHdDM2ZUUk1Lem1zbk5xV043L0ZWUE9ORlhaVWhaOXF1ZlRsbWQwSGttVmts?=
 =?utf-8?B?azFXZG5mVHFQR1dZeGQwMVNJZ0xWazU0dVVEU1JUN3R4Z3dCQjdSaFV4RzdO?=
 =?utf-8?B?aTJNUGJvM3B2R0FSQWNLYnVKbG12WVYzQ0tWZVhFU3o1L28yd1NQVCtTdWRS?=
 =?utf-8?B?NkVidnpHVFhoSkZlVmpyUHcvaEo3YkduSFI5SU1CclA5dm9jWDFlaUxvY3lo?=
 =?utf-8?B?VHFMdXROL1FkOWhiNmtRY09Yb01sMkhweCt0RmhUOFlrYWEyS3JRelBMV2w3?=
 =?utf-8?B?bWpDQzYxRTV3OG9OVFd5TmEwKzRCUFdPMVdraGRySHY5dXNGR2JkZnpnYm9x?=
 =?utf-8?B?aWRNZmVuL3VCWXVjOUtkdkpnUzU3ZmVsSHJZMldweGl3LzNpaUY3S0R4WlM0?=
 =?utf-8?B?UnNzSWRFSmFBN2JCL1JvekNUZytBQmZWK3VET2tUZUwwS1R5N3VjbVZzUlhX?=
 =?utf-8?B?a2NkT1RXdFlZZGVKcGxudmx0T0F3QnpBWmJMamhUcjFsSDA3WDJEOXFwVW8w?=
 =?utf-8?B?YitBRzZOcTNEZFRvemFIZlgvYStodyt5Y2V0K0FrV3JFWnl6SVdoN3NtZUw4?=
 =?utf-8?B?NXBud1dQN2VDZGM5bllINVhUWTRGZHRUWk1wd0RPbyt0WEQyY1gyUUNXL3pa?=
 =?utf-8?B?aGhWR2VyZTA3ZmgrbUpXTmNYQ0FuTGNRQnVncHRuTTNzYm5ZSUs0amZsc2hn?=
 =?utf-8?B?eWV5bW05NlFKd0tLMll4cDFBbDNuWVNSc2Q0K2tLN3owZ0N0N2F2VldOQU1Z?=
 =?utf-8?Q?/8uY8kJC9u+YuSf04jAqK/P3qqbRXJvBsuYlG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82EE9B059D1D424F8EB64C8431C41FBA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcd08d0-05a6-4284-0855-08da351e9321
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 20:24:25.9428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xovalPZxVqgIo8gTXgaRAlYm99CQ0vWAYyv3Pud7q0G+gRaHTFiWialE6p8oLyZULdh0b2ountnsh6GNMdbCMi+xUtnFMi6kRBfbkPlzBHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gVGh1LCAyMDIyLTA1LTEyIGF0IDEyOjU1IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBUaGUgSFdNT05fQ0hBTk5FTF9JTkZPIG1hY3JvIHNpbXBsaWZpZXMgdGhlIGNvZGUsIHJlZHVj
ZXMgdGhlIGxpa2VsaWhvb2QNCj4gb2YgZXJyb3JzLCBhbmQgbWFrZXMgdGhlIGNvZGUgZWFzaWVy
IHRvIHJlYWQuDQo+IA0KPiBUaGUgY29udmVyc2lvbiB3YXMgZG9uZSBhdXRvbWF0aWNhbGx5IHdp
dGggY29jY2luZWxsZS4gVGhlIHNlbWFudGljIHBhdGNoDQo+IHVzZWQgdG8gbWFrZSB0aGlzIGNo
YW5nZSBpcyBhcyBmb2xsb3dzLg0KPiANCj4gQHNADQo+IGlkZW50aWZpZXIgaSxqLHR5Ow0KPiBA
QA0KPiANCj4gLXN0cnVjdCBod21vbl9jaGFubmVsX2luZm8gaiA9IHsNCj4gLcKgwqDCoMKgwqDC
oCAudHlwZSA9IHR5LA0KPiAtwqDCoMKgwqDCoMKgIC5jb25maWcgPSBpLA0KPiAtfTsNCj4gDQo+
IEByQA0KPiBpbml0aWFsaXplciBsaXN0IGVsZW1lbnRzOw0KPiBpZGVudGlmaWVyIHMuaTsNCj4g
QEANCj4gDQo+IC11MzIgaVtdID0gew0KPiAtwqAgZWxlbWVudHMsDQo+IC3CoCAwDQo+IC19Ow0K
PiANCj4gQHNjcmlwdDpvY2FtbCB0QA0KPiB0eSA8PCBzLnR5Ow0KPiBlbGVtZW50cyA8PCByLmVs
ZW1lbnRzOw0KPiBzaG9ydGVyOw0KPiBlbGVtczsNCj4gQEANCj4gDQo+IHNob3J0ZXIgOj0NCj4g
wqDCoCBtYWtlX2lkZW50IChMaXN0LmhkKExpc3QucmV2IChTdHIuc3BsaXQgKFN0ci5yZWdleHAg
Il8iKSB0eSkpKTsNCj4gZWxlbXMgOj0NCj4gwqDCoCBtYWtlX2lkZW50DQo+IMKgwqDCoCAoU3Ry
aW5nLmNvbmNhdCAiLCINCj4gwqDCoMKgwqAgKExpc3QubWFwIChmdW4geCAtPiBQcmludGYuc3By
aW50ZiAiXG5cdFx0XHTCoMKgICVzIiB4KQ0KPiDCoMKgwqDCoMKgwqAgKFN0ci5zcGxpdCAoU3Ry
LnJlZ2V4cCAiICwgIikgZWxlbWVudHMpKSkNCj4gDQo+IEBADQo+IGlkZW50aWZpZXIgcy5qLHQu
c2hvcnRlcjsNCj4gaWRlbnRpZmllciB0LmVsZW1zOw0KPiBAQA0KPiANCj4gLSAmag0KPiArIEhX
TU9OX0NIQU5ORUxfSU5GTyhzaG9ydGVyLGVsZW1zKQ0KPiANCj4gVGhpcyBwYXRjaCBkb2VzIG5v
dCBpbnRyb2R1Y2UgZnVuY3Rpb25hbCBjaGFuZ2VzLiBNYW55IHRoYW5rcyB0bw0KPiBKdWxpYSBM
YXdhbGwgZm9yIHByb3ZpZGluZyB0aGUgY29jY2luZWxsZSBzY3JpcHQuDQo+IA0KPiBDYzogSXdv
bmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQoNClJldmlld2VkLWJ5OiBJd29u
YSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQoNClRoYW5rcw0KLUl3b25h
DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYyB8IDM4ICsrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4gDQoNCg==
