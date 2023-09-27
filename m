Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935F9E810B1
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 09:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjI0JcG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 05:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjI0JcE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 05:32:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1C3C0
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695807123; x=1727343123;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=43VkfO1RRTyyR7uC3pamKrtzX8dbWJpUHO9bfsQ8KOI=;
  b=kMWr+iEEXIGF2nmvOmv+4z6x388CSWZOMWo8UqtHnkru0rIBPOoz7vxF
   RVriNpBopBdBDND+r9TsJCeXtk1HXf+OQe93Y3k4q5SyhTXKxivqtnym1
   gxJXjEpvWHWzT99wMYHw8fyUua8JaggOt97cswgkgY8jXnKoEqy2tmjG2
   Lxdt0STbwTjy/o6XAXEgc7XWy8SEqj6XF5OOwR3dB10hRs+bGxAyQBjPD
   yyVehif7d8tDXsES+NMvcV2P1Ly7FI3hLpu40X8IEra+exauaTTx7ZcpT
   EFvInmxAfeG3FgVVeAPt/wYX7CHQu2taqIUKFWAkVew1Funsrj8QXJktz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366841163"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="366841163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 02:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872822054"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="872822054"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 02:32:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 02:32:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 02:32:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 02:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8LGuHC53lr0QU5qgNAxyNJ5JupxA58le7hUoL8mT7Z1PhtkK7hyaO7VAcluD9yYUzHova5wQ8s+Pftx/cvQdfXDU6oRYxM/TxaEEBPw5Ch1k/MLsP9xpUFVs09ZlOKKfJ6+HBusDrlh/Kra2U134xj7TMTttpG7bhRrYSSsRNTIlpQvGlJq6aywxvGTS9frVPcFSnSJFJrt+TtIDcUZDb4yUqfVYLkWeuoljQN/TIIWK7ZLK9UioOJ78rGGz5lqClnOJ+cHOYoRLgj96cFzE+qjboUh3K5nbGIrlxG4Cp3llBPYHkcY9LO5NYG1LYTuNQ1Uh58ueNYRPiYyNpD5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43VkfO1RRTyyR7uC3pamKrtzX8dbWJpUHO9bfsQ8KOI=;
 b=Mn8HOyuIrMuM/y70OLRC8YDY5/TS784X+sXNEMZJ5FPjaQtjO/KTuNj7FKBVtP0uAdO5DOjHSklfKEXv0yXU4IE76KZUfwTeFB/D9eyzMnpQ80bDbVIue1SSgpCHvnoU63n+1bZaKygs4q5THpdGBnH1P4h2R7o27wRnEKOOBCzkSkqspykDV+EVtRuBGAaEgda7mI1mTYagRrbBycUsDzuY+y1d7pf5polCN9toLiDjyS0iJsBWI1Zv0WjcxU1ALGHvA0hsLKyD7YSlRjc+TclPYV+LbXWauwpPAQzLqJHmS2jM3XKZQhBvB/WYBOJNUHCJYgjsGcXpCwMSNc1qxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 09:31:59 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6792.026; Wed, 27 Sep 2023
 09:31:59 +0000
From:   "Gupta, Anshuman" <anshuman.gupta@intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>
CC:     "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "Tauro, Riana" <riana.tauro@intel.com>,
        "Brost, Matthew" <matthew.brost@intel.com>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v6 5/5] drm/xe/hwmon: Expose power1_max_interval
Thread-Topic: [PATCH v6 5/5] drm/xe/hwmon: Expose power1_max_interval
Thread-Index: AQHZ74fvfw78nqxkoE2Bp9ZF+FojwbArb6iAgAE7hQCAABUSgIAAEI+AgADJQwCAAG0+gIAAXOGAgAAA53A=
Date:   Wed, 27 Sep 2023 09:31:59 +0000
Message-ID: <CY5PR11MB621127E2367D066C9615B93595C2A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-6-badal.nilawar@intel.com>
 <ZRF1f2OsC1pr5hFd@ashyti-mobl2.lan>
 <e5801f36-2f9a-6d24-7af2-1e7174f2e0b4@intel.com>
 <ZRKP2UIGUWTXnZN6@ashyti-mobl2.lan>
 <ec2a4e33-0b34-fb00-5470-f2d39edc6eb1@intel.com>
 <ZRNGkgVqsnJ9Z8O2@ashyti-mobl2.lan> <878r8s1ebu.wl-ashutosh.dixit@intel.com>
 <af1b1b22-a5f8-cae8-d1d4-c4fa23a2ca05@intel.com>
In-Reply-To: <af1b1b22-a5f8-cae8-d1d4-c4fa23a2ca05@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA0PR11MB7789:EE_
x-ms-office365-filtering-correlation-id: 188fdf2f-d902-4b9b-e4ad-08dbbf3c9945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aGR5fO65TJPFXkPiFi/BLo6UsMBXhBsNENUJAoZvjzC/nPP/TAnOOFhKkHb88z/xBNfiDcGl0Qu1wL9H012IoOPf5BecKmm0PXAKDRHaXThoFG3rFT+xtQG3spYd4I97DQx1k/LrR1QY4pU3ASOkrCRpFOTLIo56ZmnsoPRTSwAKjEFXneWADZ6jhSSjDTjg6c7RHEVrnmAvUeLq8C15XkyyYn/6zwBH6sW8l0B8Js36W6zRkM15kBvOKa3D2JHWtrbQ0s6eDjHeRfUgTquwk9kyolj+qxI1u63X421DfacxL4efPIv50jHw9IJ4nV1ulsp3rmgjXSfAG2LIZUTFcmm4S8wP3Fq9hJPN8W6/dxYW/rdjIu5YB5OVjk9kzM41HohN8d5Zrh/+Vak/bSK9+OzrL5zhJh1boVuWWIgKdAj+vhwdHVNwV6ebJ/cyY6/pXzqB3zp6sRgBj/QIIhV4OI+hEJ5natkLDEXyZctTRnVw9NAl9dpthN5kG5hHCZ+KnZdRd/s6o/FBPIsB8iV8psTk0AEd4NRGUiIzZiGa0PD+C9S3ghsitfk1p1vRUD1MsMGaKQpwAzmsZqsMbSUB3LEJxZ6QaYat4LC085hGCJI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6211.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(2906002)(33656002)(86362001)(55016003)(6506007)(5660300002)(53546011)(26005)(52536014)(966005)(76116006)(110136005)(66446008)(9686003)(66556008)(66476007)(64756008)(316002)(54906003)(41300700001)(478600001)(7696005)(4326008)(8936002)(8676002)(71200400001)(82960400001)(66946007)(122000001)(38070700005)(38100700002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mmw0QTF5YXRmVTNKcmlOSVl4NHQzUkd5NEtMazVtelZUMHFYNzN4UmdyRG01?=
 =?utf-8?B?NE1CajRrbEZhTmRnd2huUXlyaytoVkhWNHdMVUNuVk5QWER3U1A4bXJJNUJV?=
 =?utf-8?B?Vis0R0Q3Wit4bzIyUXNnOE4zcFcyRllxM3ZLRFNZdEFyWEliUjVLWHNHVFJh?=
 =?utf-8?B?K1ZuNDd0dDhFMEFvRmRWNDZ6VWJCb3VIdGxZTUdadkx0ZWhjTE1JQkFQak8y?=
 =?utf-8?B?eVRLZzN1UndhWHJUSHN3REtMWGVTZzBFY1gybXd5M0F4K2V1ODNtb2Z5TkRJ?=
 =?utf-8?B?Slo4M2t6ekNSK1M5L1Y3dVpWRW1JSUM2ekcrczJwMUMvRnhLK1BsY1B1VzRl?=
 =?utf-8?B?ajQ4QllSSDJWbjNYQUFtdy8rdi8wK2JLRjdDYXkwU0JoUHMybCtZY0JUWGFj?=
 =?utf-8?B?Qko2d2k5SU1NR2NoYlpyazdBMFhrdjNCNWV4UVF1MUhKWURpWk16dWEzTmow?=
 =?utf-8?B?R1B0TzBjUUpKTnFYeVJzc0t3Tm1QVnQ0dDFSNEZVOWFxU1dvOVhHVldaV2N3?=
 =?utf-8?B?c0g3cXNtUDFBbStSeG5YZEM4ZURybVpkczVXZTg4ZnpxRHpIZmpocFdoUCsv?=
 =?utf-8?B?Qmw4bHcyOVVMaE95S085aTFiUm5neVpMZHFaMmNlOVJWTkZzem4rUkduY2xG?=
 =?utf-8?B?Tk5oeUwrRUxGZW5NY2NWSEwweUNjS0M5MU1ORVpwYTlWNldtaWJ5dTBRbjRJ?=
 =?utf-8?B?emNuRFZuZGlaMFl4MlNha1JaenFNcjdyWGl6cFptTnNXdC9vTW5jdHQwWjJ2?=
 =?utf-8?B?OVZTYmE5cTJuSnpyVFI1VUMyc0VQNEpXSGFSTjNEQ3JSbG1iSmp5V2drTDRw?=
 =?utf-8?B?TjlmWDVvdXU1YU91REZvVjBoMWhUaW42blh2engzSUtjRW9yUTFYZzkzZTF6?=
 =?utf-8?B?b3NzQk9abERjL1VBazBjU1M0VkQzejNzTGJRMUZwcWxLRk0zSGRraTZlMWFw?=
 =?utf-8?B?TG9oZFZOTjlRMmZLZ2dYUkhPcXkwNWhYdTdORklXN1I4ald0WHkyS0VYaUFu?=
 =?utf-8?B?TGV0RjMyVGQ4ZnhVKzhjNFhWdDBHWHl1U2t6Qld1OWVKLytmNEdzMjQ4d2tR?=
 =?utf-8?B?YUZ6VTZ2YXQ3U0xReWRkQkhBbHFMYzdPTENWeEo1VTVuMnhUQnRCK2ZmVlk4?=
 =?utf-8?B?ZHg0NnZHdmhSM00xOWlXaUZldE1wWFB2aDMyMnYrQXZjTGtCVmpvaXZ0NkJH?=
 =?utf-8?B?OUdNc2E1YVFMKzdkSnBtM3VrZFB4WGM4WHZDREhMbmg5UnM3RTF1NC9TdC90?=
 =?utf-8?B?cmhDWjY5VzBqWk9rN1VOVm1sa1U5Y1JxK1RCL2JHLzBpNXRJM0h3NEo1ajBC?=
 =?utf-8?B?YTl3dFJrRkIrTk1hZVh5NVBONTNFellTZDZyWlVZWkk2TzIyLzVtZmg1REhN?=
 =?utf-8?B?U2dXWkRmTEhidnBEbnVtcHE2V2xzVnBiM2tkZEl1d2ZnMlNidkFtWlZHSExK?=
 =?utf-8?B?ZjRlSlN4RktLaUxpZk9WTjR1WjRRbWVkc2ZFc0pyTkdZSkNyRWppTmhiQ3hj?=
 =?utf-8?B?RnFWdmJhOFdOeUcvbENjbzl0M2Fwd1ZmZjBaNEFyQWxEMVBtTUw3cDlLUjA5?=
 =?utf-8?B?MHc5d0FJaGJTd1dRKzB3ejI3aWtTdDJyNG12QXlSdFhkdWRBVVVyM1JmWHdn?=
 =?utf-8?B?QjdnbldOeDRBQUZoM2lNeVFlWkVoaE9lT0xHUFpIZ01aeHczcVpJakxxNWhl?=
 =?utf-8?B?ZXFzMC84d1ROSmdEUitwNkc5c1pycktNcnJaNkR0bVVVSzVQNXhQWENvUmJK?=
 =?utf-8?B?amJoVnFzR3d2OGhkS1R6TlJoK2JLQzZ0bEJtd0xXelVaYUN2blRCNmw1QVVQ?=
 =?utf-8?B?SkRlTGF0K1U1MFhJd0VBK3BZS204bFQ3dEdFMkdUTWFWMlMzQUwzTmlkMG01?=
 =?utf-8?B?bTVOcDFHTU1LbFZ4YjlpVk9BUy83VnJFcnhhNnlLL2Q0ZUx0anVFMG1Ta0FN?=
 =?utf-8?B?RzMyenpnZUU2dXJ5MUVmWFpDRWRNUDFqM2FuYk1tQkVSdWo2ZWdPeGVtTlNn?=
 =?utf-8?B?Sy9mWlRGUTJQWjVYU2Y2VUhCTWV5SHpVM2dvMWJQY3pCZ1E2cHg1K0tUbW9w?=
 =?utf-8?B?M0x2K2ppcnpRY0hZd0xRWWRPUTAwRkljUkN2KzJ1SDBsQzFZZ2dYRndTdUtR?=
 =?utf-8?Q?RIgDT+hJ5TLSuQf4UN4snnClf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188fdf2f-d902-4b9b-e4ad-08dbbf3c9945
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 09:31:59.3278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZ0o7XkODZoc/3yWkXweaPS9aQ/dynyZT3KvrqqFGoDyuBxKagDhyH6DSwa0knHj6fRdzAREzKhN30na+++EPy+GJnAjgHesXan7j91ZOQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlsYXdhciwgQmFkYWwg
PGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAy
NywgMjAyMyAyOjM1IFBNDQo+IFRvOiBEaXhpdCwgQXNodXRvc2ggPGFzaHV0b3NoLmRpeGl0QGlu
dGVsLmNvbT47IEFuZGkgU2h5dGkNCj4gPGFuZGkuc2h5dGlAbGludXguaW50ZWwuY29tPg0KPiBD
YzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1od21vbkB2Z2VyLmtlcm5l
bC5vcmc7IEd1cHRhLA0KPiBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPjsgbGlu
dXhAcm9lY2stdXMubmV0OyBUYXVybywgUmlhbmENCj4gPHJpYW5hLnRhdXJvQGludGVsLmNvbT47
IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IFZpdmksDQo+IFJvZHJp
Z28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgNS81
XSBkcm0veGUvaHdtb246IEV4cG9zZSBwb3dlcjFfbWF4X2ludGVydmFsDQo+IA0KPiBIaSBBc2h1
dG9zaCwNCj4gDQo+IE9uIDI3LTA5LTIwMjMgMDk6MDIsIERpeGl0LCBBc2h1dG9zaCB3cm90ZToN
Cj4gPiBPbiBUdWUsIDI2IFNlcCAyMDIzIDE0OjAxOjA2IC0wNzAwLCBBbmRpIFNoeXRpIHdyb3Rl
Og0KPiA+Pg0KPiA+DQo+ID4gSGkgQmFkYWwvQW5kaSwNCj4gPg0KPiA+Pg0KPiA+Pj4+Pj4+ICsJ
LyogdmFsIGluIGh3IHVuaXRzICovDQo+ID4+Pj4+Pj4gKwl2YWwgPSBESVZfUk9VTkRfQ0xPU0VT
VF9VTEwoKHU2NCl2YWwgPDwgaHdtb24tDQo+ID5zY2xfc2hpZnRfdGltZSwgU0ZfVElNRSk7DQo+
ID4+Pj4+Pj4gKwkvKiBDb252ZXJ0IHRvIDEueCAqIHBvd2VyKDIseSkgKi8NCj4gPj4+Pj4+PiAr
CWlmICghdmFsKSB7DQo+ID4+Pj4+Pj4gKwkJLyogQXZvaWQgaWxvZzIoMCkgKi8NCj4gPj4+Pj4+
PiArCQl5ID0gMDsNCj4gPj4+Pj4+PiArCQl4ID0gMDsNCj4gPj4+Pj4+PiArCX0gZWxzZSB7DQo+
ID4+Pj4+Pj4gKwkJeSA9IGlsb2cyKHZhbCk7DQo+ID4+Pj4+Pj4gKwkJLyogeCA9ICh2YWwgLSAo
MSA8PCB5KSkgPj4gKHkgLSAyKTsgKi8NCj4gPj4+Pj4+DQo+ID4+Pj4+PiB0aGlzIGlzIHNvbWUg
c3B1cmlvdXMgZGV2ZWxvcG1lbnQgY29tbWVudCwgY2FuIHlvdSBwbGVhc2UgcmVtb3ZlDQo+ID4+
Pj4+PiBpdD8NCj4gPj4+Pj4NCj4gPj4+Pj4gVGhpcyBpcyBrZXB0IGludGVudGlvbmFsbHkgdG8g
aGVscCB0byB1bmRlcnN0YW5kIHRoZSBjYWxjdWxhdGlvbnMuDQo+ID4+Pj4NCj4gPj4+PiB0aGVu
IHRoaXMgaXMgY29uZnVzaW5nLi4uIENhbiB5b3UgcGxlYXNlIGV4cGFuZCB0aGUgY29uY2VwdD8N
Cj4gPj4+PiBBcyBpdCBpcyBpdCdzIG5vdCB1bmRlcnN0YW5kYWJsZSBhbmQgSSB3b3VsZCBleHBl
Y3Qgc29tZW9uZSBzZW5kaW5nDQo+ID4+Pj4gYSBwYXRjaCB3aXRoIHRpdGxlOg0KPiA+Pj4+DQo+
ID4+Pj4gICAgW1BBVENIXSBkcm0veGUvaHdtb246IFJlbW92ZSBzcHVyaW91cyBjb21tZW50DQo+
ID4+Pj4NCj4gPj4+PiBCZWNhdXNlIGl0IGp1c3QgbG9va3MgZm9yZ290dGVuIGZyb20gcHJldmlv
dXMgZGV2ZWxvcG1lbnQuDQo+ID4+PiBJIHdpbGwgYWRkIHRoaXMgY29tbWVudCBpbnNpZGUgdGhl
IGNvbW1lbnQgYXQgdGhlIHRvcCBvZiBpZi4gU28gaXQNCj4gPj4+IHdpbGwgbG9vayBsaWtlLg0K
PiA+Pj4gLyoNCj4gPj4+ICAgKiBDb252ZXJ0IHRvIDEueCAqIHBvd2VyKDIseSkNCj4gPj4+ICAg
KiB5ID0gaWxvZyh2YWwpOw0KPiA+Pj4gICAqIHggPSAodmFsIC0gKDEgPDwgeSkpID4+ICh5LTIp
Ow0KPiA+Pj4gICAqLw0KPiA+Pg0KPiA+PiBBbGwgcmlnaHQuDQo+ID4NCj4gPiBUaGF0IGNvbW1l
bnQgaXMgZXhwbGFpbmluZyB0aGF0IG9uZSBsaW5lIG9mIGNvZGUuIEkgdGhpbmsgd2Ugc2hvdWxk
DQo+ID4ganVzdCBsZWF2ZSBpdCB3aGVyZSBpdCBpcywgaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRv
IG1vdmUgaXQgYWJvdmUgdGhlDQo+ID4gaWYuIEhvdyBlbHNlIGNhbiB3ZSB3cml0ZSBpdCBzbyB0
aGF0IHRoZSBjb21tZW50IGRvZXNuJ3QgbG9vayBsaWtlIGEgbGVmdG92ZXI/DQo+ID4NCj4gPiBJ
ZiB0aGUgY29kZSBpcyBjbGVhciB3ZSBjYW4gcmVtb3ZlIHRoZSBjb21tZW50LCBidXQgSSB0aGlu
ayB0aGUgY29kZQ0KPiA+IGlzIGhhcmQgdG8gdW5kZXJzdGFuZC4gU28gdHJ5IHRvIHVuZGVyc3Rh
bmQgdGhlIGNvZGUgYW5kIHRoZW4geW91IHdpbGwNCj4gPiBuZWVkIHRoZSBjb21tZW50Lg0KPiBB
Z3JlZWQsIEkgd2lsbCBrZWVwIHRoaXMgY29tbWVudCBhcyBpdCBpcy4NCj4gPg0KPiA+Pg0KPiA+
Pj4+Pj4+ICsJCXggPSAodmFsIC0gKDF1bCA8PCB5KSkgPDwgeF93ID4+IHk7DQo+ID4+Pj4+Pj4g
Kwl9DQo+ID4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+ICsJcnh5ID0gUkVHX0ZJRUxEX1BSRVAoUEtHX1BX
Ul9MSU1fMV9USU1FX1gsIHgpIHwNCj4gPj4+Pj4+PiArUkVHX0ZJRUxEX1BSRVAoUEtHX1BXUl9M
SU1fMV9USU1FX1ksIHkpOw0KPiA+Pj4+Pj4+ICsNCj4gPj4+Pj4+PiArCXhlX2RldmljZV9tZW1f
YWNjZXNzX2dldChndF90b194ZShod21vbi0+Z3QpKTsNCj4gPj4+Pj4+PiArDQo+ID4+Pj4+Pj4g
KwltdXRleF9sb2NrKCZod21vbi0+aHdtb25fbG9jayk7DQo+ID4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+
ICsJeGVfaHdtb25fcHJvY2Vzc19yZWcoaHdtb24sIFJFR19QS0dfUkFQTF9MSU1JVCwNCj4gUkVH
X1JNVywgKHUzMiAqKSZyLA0KPiA+Pj4+Pj4+ICsJCQkgICAgIFBLR19QV1JfTElNXzFfVElNRSwg
cnh5KTsNCj4gPj4+Pj4+PiArDQo+ID4+Pj4+Pj4gKwltdXRleF91bmxvY2soJmh3bW9uLT5od21v
bl9sb2NrKTsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiB3aHkgYXJlIHdlIGxvY2tpbmcgaGVyZT8NCj4g
Pj4+Pj4NCj4gPj4+Pj4gU2luY2UgaXQgaXMgcm13IG9wZXJhdGlvbiB3ZSBhcmUgdXNpbmcgbG9j
ayBoZXJlLg0KPiA+Pj4+DQo+ID4+Pj4gT0suLi4gc28gd2hhdCB5b3UgYXJlIHRyeWluZyB0byBw
cm90ZWN0IGhlcmUgaXMgdGhlDQo+ID4+Pj4NCj4gPj4+PiAgICAgcmVhZCAtPiB1cGRhdGUgLT4g
d3JpdGUNCj4gPj4+Pg0KPiA+Pj4+IGFuZCBpdCBtYWtlcyBzZW5zZS4gVGhlIHByb2JsZW0gaXMg
dGhhdCBpZiB0aGlzIGlzIGEgZ2VuZXJpYyBydWxlLA0KPiA+Pj4+IHdoaWNoIG1lYW5zIHRoYXQg
ZXZlcnlvbmUgd2hvIHdpbGwgZG8gYSBybXcgb3BlcmF0aW9uIGhhcyB0byB0YWtlDQo+ID4+Pj4g
dGhlIGxvY2ssIHdoeSBub3QgdGFrZSB0aGUgbG9jayBkaXJlY3RseSBpbiB4ZV9od21vbl9wcm9j
ZXNzX3JlZygpPw0KPiA+Pj4+DQo+ID4+Pj4gQnV0IGFsc28gdGhpcyBjYW4gYmUgYSBiaXQgY29u
ZnVzaW5nLCBiZWNhdXNlIGEgZnVuY3Rpb24gaXMgZWl0aGVyDQo+ID4+Pj4gbG9ja2VkIG9yIHVu
bG9ja2VkIGFuZCBwdXJpc3RzIG1pZ2h0IGNvbXBsYWluLg0KPiA+Pj4+DQo+ID4+Pj4gQSBzdWdn
ZXN0aW9uIHdvdWxkIGJlIHRvIGRvIHNvbWV0aGluZyBsaWtlOg0KPiA+Pj4+DQo+ID4+Pj4gICAg
ICBzdGF0aWMgaW50IHhlX2h3bW9uX3Byb2Nlc3NfcmVnKC4uLiwgZW51bSB4ZV9od21vbl9yZWdf
b3BlcmF0aW9uDQo+IG9wZXJhdGlvbikNCj4gPj4+PiAgICAgIHsNCj4gPj4+PiAJCS4uLg0KPiA+
Pj4+ICAgICAgfQ0KPiA+Pj4+DQo+ID4+Pj4gICAgICBzdGF0aWMgaW50IHhlX2h3bW9uX3JlZ19y
ZWFkKC4uLik7DQo+ID4+Pj4gICAgICB7DQo+ID4+Pj4gCQlyZXR1cm4geGVfaHdtb25fcHJvY2Vz
c19yZWcoLi4uLCBSRUdfUkVBRCk7DQo+ID4+Pj4gICAgICB9DQo+ID4+Pj4NCj4gPj4+PiAgICAg
IHN0YXRpYyBpbnQgeGVfaHdtb25fcmVnX3dyaXRlKC4uLik7DQo+ID4+Pj4gICAgICB7DQo+ID4+
Pj4gCQlyZXR1cm4geGVfaHdtb25fcHJvY2Vzc19yZWcoLi4uLCBSRUdfV1JJVEUpOw0KPiA+Pj4+
ICAgICAgfQ0KPiA+Pj4+DQo+ID4+Pj4gICAgICBzdGF0aWMgaW50IHhlX2h3bW9uX3JlZ19ybXco
Li4uKTsNCj4gPj4+PiAgICAgIHsNCj4gPj4+PiAJaW50IHJldDsNCj4gPj4+Pg0KPiA+Pj4+IAkv
Kg0KPiA+Pj4+IAkgKiBPcHRpb25hbDogeW91IGNhbiBjaGVjayB0aGF0IHRoZSBsb2NrIGlzIG5v
dCB0YWtlbg0KPiA+Pj4+IAkgKiB0byBzaG91dCBsb3VkIGlmIHBvdGVudGlhbCBkZWFkbG9ja3Mg
YXJpc2UuDQo+ID4+Pj4gCSAqLw0KPiA+Pj4+DQo+ID4+Pj4gCS8qDQo+ID4+Pj4gCSAqIFdlIHdh
bnQgdG8gcHJvdGVjdCB0aGUgcmVnaXN0ZXIgdXBkYXRlIHdpdGggdGhlDQo+ID4+Pj4gCSAqIGxv
Y2sgYmxhaCBibGFoIGJsYWguLi4gZXhwbGFuYXRvcnkgY29tbWVudC4NCj4gPj4+PiAJICovDQo+
ID4+Pj4gCW11dGV4X2xvY2soJmh3bW9uLT5od21vbl9sb2NrKTsNCj4gPj4+PiAJcmV0ID0geGVf
aHdtb25fcHJvY2Vzc19yZWcoLi4uLCBSRUdfUk1XKTsNCj4gPj4+PiAJbXV0ZXhfdW5sb2NrKCZo
d21vbi0+aHdtb25fbG9jayk7DQo+ID4+Pj4NCj4gPj4+PiAJcmV0dXJuIHJldDsNCj4gPj4+PiAg
ICAgIH0NCj4gPj4+Pg0KPiA+Pj4+IFdoYXQgZG8geW91IHRoaW5rPyBJdCBsb29rcyBtdWNoIGNs
ZWFyZXIgdG8gbWUuDQo+ID4+Pg0KPiA+Pj4gUkVHX1BLR19SQVBMX0xJTUlUIHJlZ2lzdGVyIGlz
IGJlaW5nIHdyaXR0ZW4gaW4NCj4gPj4+IHhlX2h3bW9uX3Bvd2VyX21heF93cml0ZSBhbHNvLCB0
aGF0J3Mgd2h5IGxvY2sgaXMgdGFrZW4uIEJ1dCBzb21lDQo+ID4+PiBob3cgd2hpbGUgY2xlYW5p
bmcgdXAgSSBmb3Jnb3QgdG8gdGFrZSBpdCBpbg0KPiA+Pj4geGVfaHdtb25fcG93ZXJfbWF4X3dy
aXRlKCksIHRoYW5rcyBmb3IgY2F0Y2hpbmcgaXQgdXAuIEkgd2lsbCB1cGRhdGUNCj4geGVfaHdt
b25fcG93ZXJfbWF4X3dyaXRlKCkgYW5kIHJlc2VuZCBzZXJpZXMuDQo+ID4+DQo+ID4+IHllcy4u
LiBPSy4uLiB0aGVuLCBwbGVhc2UgYWRkIHRoZSBsb2NrIGFsc28gaW4gdGhlIHdyaXRlIGNhc2Uu
DQo+ID4+DQo+ID4+IEJ1dCBzdGlsbC4uLiB0aGlua2luZyBvZiBod21vbiBydW5uaW5nIGluIG1v
cmUgdGhyZWFkcyBkb24ndCB5b3UNCj4gPj4gdGhpbmsgd2UgbWlnaHQgbmVlZCBhIG1vcmUgZ2Vu
ZXJpYyBsb2NraW5nPyBUaGlzIG1pZ2h0IG1lYW4gdG8gbG9jaw0KPiA+PiBhbGwgYXJvdW5kIHhl
X2h3bW9uX3Byb2Nlc3NfcmVnKCkuLi4gbWF5YmUgaXQncyBhbiBvdmVya2lsbC4NCj4gPj4NCj4g
Pj4gRm9yIHRoZSB0aW1lIGJlaW5nIEknbSBPSyB3aXRoIHlvdXIgY3VycmVudCBzb2x1dGlvbi4N
Cj4gPj4NCj4gPj4gSWYgeW91IGRvbid0IGxpa2UgbXkgc3VnZ2VzdGlvbiBhYm92ZSwgZmVlbCBm
cmVlIHRvIGlnbm9yZSBpdC4NCj4gPg0KPiA+IFllYWggYWdyZWUsIG1pZ2h0IGFzIHdlbGwgdGFr
ZSB0aGUgbG9jayBhcm91bmQgdGhlIHN3aXRjaCBzdGF0ZW1lbnQgaW4NCj4gPiB4ZV9od21vbl9w
cm9jZXNzX3JlZygpLg0KPiBXaWxsIHRoZXJlIGJlIGEgcG9zc2liaWxpdHkgd2hlcmUgdHdvIGRp
ZmZlcmVudCB0aHJlYWRzIHdpbGwgYWNjZXNzIHBvd2VyDQo+IGF0dHJpYnV0ZXMgcG93ZXIxX21h
eCBhbmQgcG93ZXIxX21heF9pbnRlcnZhbCBzaW11bHRhbmVvdXNseSBhbmQNCj4gZnJlcXVlbnRs
eS4gSSBhbSBub3QgYWJsZSB0byB0aGluayBzdWNoIHNjZW5hcmlvLiBJZiBub3QgdGhlbiB3ZSBj
YW4gcmVtb3ZlDQo+IGxvY2sgZnJvbSBoZXJlLg0KVGhlcmUgYXJlIHJlYWQgYW5kIHdyaXRlIGNh
c2VzLCBhcyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBzZXFfcmVhZF9pdGVyIGFsd2F5cyB0YWtlcyBz
ZXFfZmlsZS0+bG9jaw0KU28gcmVhZCBjYXNlcyBsaWtlIGh3bV9lbmVyZ3kgd29uJ3QgbmVlZCBh
bnkgbG9jayBpbiBteSBvcGluaW9uLCB3ZSBhcmUgcHJvdGVjdGVkIGJ5IGFib3ZlIHN5c2ZzIGxh
eWVyLg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9mcy9z
ZXFfZmlsZS5jI0wxNzENCkJ1dCBzZXFfd3JpdGUgb24gYW5vdGhlciBoYW5kIGRvZXMgbm90IHVz
ZSBhbnkgbG9jaywgc28gSSBhbHNvIGZlZXMgZm9yIGFueSBBVFRSIGRvZXMgYW55IHJlYWQvd3Jp
dGUgb3BlcmF0aW9uDQpvbiBSRUdfUEtHX1JBUExfTElNSVQgcmVnaXN0ZXIgbmVlZCBhIGxvY2sg
aGVyZS4NClRoYW5rcywNCkFuc2h1bWFuIEd1cHRhLg0KDQo+IA0KPiBSZWdhcmRzLg0KPiBCYWRh
bA0KPiA+DQo+ID4+DQo+ID4+IEFuZGkNCj4gPg0KPiA+IFRoYW5rcy4NCj4gPiAtLQ0KPiA+IEFz
aHV0b3NoDQo=
