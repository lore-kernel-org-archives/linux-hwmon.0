Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A962DC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 May 2022 20:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbiEMUZ0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 May 2022 16:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384314AbiEMUZQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 May 2022 16:25:16 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED6815C1BF
        for <linux-hwmon@vger.kernel.org>; Fri, 13 May 2022 13:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652473484; x=1684009484;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=B8FpSAqzGi9v2B5FuD6fUjkENqo7dSgEJqOwsDSyUck=;
  b=M0O9X+4YQZrcsLq9yb2H1kPzN+wMOuW6pb/SJQB7uwQMu+ZSrK6LgsEC
   2u6YjfN4f4xPRdogyM008Uu2w1baacDFnZhVqIVObXH9NTNebmViBMIjW
   9Y+X8HhbW/qidWXmXEedI278l7ocUx0Iav8rDc8J23ZhaVc0zOYvNZKRX
   qMG/RPFKsAcm99kwyvjLg0NRVjIU2MaymXaVUa/utVV9Thx2wXTw0+dif
   BThlz/z2oPBcxfwqLGuux38d29jA2xy4HzjroWjM+MTGSSd+h840CyXh8
   jlvBXw2cl+2uJZUIfx+rkJXCbkIzEop1I/6XOgJQ01WuExwUdLpRsAU9j
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="257952239"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="257952239"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 13:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="543409462"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 13 May 2022 13:24:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 13 May 2022 13:24:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 13 May 2022 13:24:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 13 May 2022 13:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNN4U3YBJ13MakEb56PWkczqsPljxT14rjs7sQAUN3N8OArfbHSE3GWoB0uS8lrbESgamP+u44rTqiCJwDIBYeAfhC8dP606F5KD1rFSf9DIGYxAgV7IKjpVu6tsvsCAH3/hkmGAVzv1GrFYz+6TXDNVWMihJxBECkbTo9kOuV4L7qa9tzzy2bd5IsQJCHw6sW2WiBRwGZ992/Lk8fXexPzbpUYQTIFwo134ot9IwF19bV/pvW0PQJ9TCTQM4nOpWx9XjqxGxc4dmI/gy1iZw00qgXfLSaRj0zDiBCcrx0Sgk/EFSuE56XIuT4xIiSeISxUgANKm/yg7+ZgmpURreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8FpSAqzGi9v2B5FuD6fUjkENqo7dSgEJqOwsDSyUck=;
 b=MXp42Lhdg3sSD6T/pffSL5EJWNggnR9rMeH9AIZ3+TQ3/vkw2vaq0MOnunH18JfoahtirtLGRiVXO9YBVFvsjc5rOBYbXI0SZdi6nURNfhXpbHO0PHm1Vx1J8r8kZS66H9iBgyXxk+Q8y3eaHbrwCehoSklNdloSJvT1Bh/2f89Xgd3rgYJId6dKssY84pkgP1CZ6kURmA75ePVZUmlSzZEg9Ox0KD67e8lm+4nVQejmcfzVgk7RVZvXfkq1finu2Jl8JGTUEKVGMmsCRTcPKYHXv52IPw26ac0+5IjWJjNbbYHtFWXEGJvB4qgrvfuQ9BewkNi3kbgJyM5dV//n4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 20:24:42 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6d32:6a6d:5142:577]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6d32:6a6d:5142:577%8]) with mapi id 15.20.5227.023; Fri, 13 May 2022
 20:24:41 +0000
From:   "Winiarska, Iwona" <iwona.winiarska@intel.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH 5/7] hwmon: (peci/dimmtemp) Use HWMON_CHANNEL_INFO macro
Thread-Topic: [PATCH 5/7] hwmon: (peci/dimmtemp) Use HWMON_CHANNEL_INFO macro
Thread-Index: AQHYZjpnqGfwq7hCZUm3Kc6iWi86uq0dQn6A
Date:   Fri, 13 May 2022 20:24:41 +0000
Message-ID: <68f5bc97ec21bb0f55a641551541289d9b63d006.camel@intel.com>
References: <20220512195556.137741-1-linux@roeck-us.net>
         <20220512195556.137741-5-linux@roeck-us.net>
In-Reply-To: <20220512195556.137741-5-linux@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96cfc177-3a37-4fc7-512c-08da351e9ca2
x-ms-traffictypediagnostic: PH0PR11MB5832:EE_
x-microsoft-antispam-prvs: <PH0PR11MB583255F25B3C95CA976B4AE9ECCA9@PH0PR11MB5832.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ftS48bbO0CJ/B5woOeN6YtuMUS7pV2KrfLNJDXSX8g5qMBxYxVTgnn07qUfn0wkckArtE9O3RFBG3Yp320UsXZX9FS85z5tGLB2NLcAPGPOvs3m1Yw/VOQHzpNGs4vkwWPsOh1437eyBAWEyKoDYfLrdhaLWSZFqk2h7RagnAFy3xgXGGUYNGhyXb4WJ/tloZb+B4KqlyWbkUyIZtnJFd7qouLFN+IxAmzHqnEVriaffCZjhvATcZN05MsTQkftzjyO/B3mTc6wvC3g7rnUW8wNRLi9qtlH174QfZzkB39eh3GBTDdVh8QykTVWNtJsLS+8BOqvye/LdcM3vO7tbC2FTNq6G0/2UL/BuTarZvmpkhe7Oqb0s2zdEVx/xwTNqp1y9+T/7TKoiV7TGY4WlsHQqkajyR/yTC9eRu4qIm6w8I3OQO0We1/uHsWPLhwxJSewT0RrFCYXEeysY6vss+WJAQ64CNWDq0zoW97EYqd/nJfg7KuzzXj3+WCTSh2CebUvSGhCDQxWs25JhJZKiuU8ECVpC7p37XR3DVj069jzew65MQ0zP2haI+FRq8Xdnrm5XckuHHztt3ARotjkgLWMY8QUZv9c75w6759/d10mbVSx2L8yz6XLjWgW1yduB5iqGV3WN0ILgB8RDAKDkQltiuuH8S8q6rXMm5yco1nitdO/VqT/LMYMI8oULXWtMN6wQXAMS8Ak9cTefYRfkqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(71200400001)(86362001)(2906002)(508600001)(5660300002)(83380400001)(38070700005)(66946007)(8936002)(6506007)(6512007)(82960400001)(122000001)(2616005)(26005)(186003)(66476007)(76116006)(36756003)(66556008)(110136005)(66446008)(316002)(91956017)(64756008)(8676002)(4326008)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2hWWVAyUDQzZkpRWDllOG56bUFjYlNHN1BkdEZ6SEEydHhiL0hGQXhXU0Q4?=
 =?utf-8?B?NnpMWjUwbVpjV3lzT25MSnNCYmFuNHZDOVRuUUxBZWFhQktNOXRLclJLVXFF?=
 =?utf-8?B?WDVkNTRpMFFKTS9CWDYxYlo5eXl2Z2t4OHRncDdWV0JNVmdFZml3aE13dnB6?=
 =?utf-8?B?U0ZlMmZsR2ZhK0tnaTBwRkd6N2hXdFhOTW45NjNRTUZydWUzVGZtOE5lSFZP?=
 =?utf-8?B?WndxSUpTMU4ydGlVU3g4NWZSem1qU0VBYnNMU1ZRZlF4TTNJUEFtWUp4NG5Q?=
 =?utf-8?B?QjRBUW1OV25TZnI3T0lJTy96NkxJbjVxdVVSRzhyUTJLUWFPek5IT3U4WnRL?=
 =?utf-8?B?YWxUTTZMNzg4Q1ptcWhkV1JCZzFSZXp2S2g2SzFZSElZOU9Ianh2QnVUVWtW?=
 =?utf-8?B?bVJNWU14amZJeU82MVI1R2oyRis4ZzhHR1ZTbjBuU3FHY3VrR2ZiQ0pnMFkz?=
 =?utf-8?B?VXRSdGZJOU5rZGw5c3pQMENocnMvYXMvVWFxRXZncXBOV2dab0JCL2d5UjlK?=
 =?utf-8?B?eGNrbGlwMHZGcTFXdlBkWFd5Wm5uTW0xUXFGV3RhVkdGdVB2UmxPallya3Fr?=
 =?utf-8?B?RG51d0xVZGFpbGJuaVZZUXhuK25jVG5oU3FjTlRqenFxRkJoYTdqWGdnZ2Fp?=
 =?utf-8?B?dmVtNnVvYWJiUkx5clRudzc1Q1MvVFZobElQYVBYZ0p3TjdldlQxR21pTGJV?=
 =?utf-8?B?ajlwWWtNQVp3OHdaRW03UFFVUFZpUlN6S0tNSVI3SnpCazJ3dXlwQXc3TUhu?=
 =?utf-8?B?VXc4ektjZ2JsMW9xQzlaU0RUTVNoS0dvTm9RRE9nU0wyRmJyQkd2ZU5pYkdL?=
 =?utf-8?B?bHZoRFJTSTRuRW9sc3FsaXBNVEsxUTNQM0s1ZTZzUTRMS0VVMWJScXc5UFpS?=
 =?utf-8?B?emVsU3FQbFg4YkhqMllVdDE3RkM1WGw4UmNVV0tJL3pVRFl5U0RqeFRPamVy?=
 =?utf-8?B?a09waExoNHZidTZDeHd1cHRCLzRGV1grQ2Zva1h4NDBZS05xRk9RalJ6eUk1?=
 =?utf-8?B?cGlnZUplUXh5L2tqbFo0QkYzWW85eXlIbk51aUNJaExaSzM1cDI4T3dybzVB?=
 =?utf-8?B?VVVtZElPS0o2cFBOOHRMY0ErUWxjSE4rUXV0WndDa2VlNXdWV290KzF5N3Nz?=
 =?utf-8?B?YWNWK1dRMHg5bW5jaG42dko4WGhDYWxBZTZ1VUtEeFJUa21QazN3MjRRMnBk?=
 =?utf-8?B?TnhSU1VLV2prLytZbzIvV0xWUk9La09SN2JiUzR1N1RtTWZEN0pPeDVjWElL?=
 =?utf-8?B?U2lXMTZwbG10RFJIeG1jY0lLMnlKNWtwVUg1b2I2RWhuN0RIUDk4STZOaFZW?=
 =?utf-8?B?QWw5MXJUdXhwQ0hCZE9jVzZVMUJEQUVETkhrV1VXKzhxd3V0TFlXbmNZTUww?=
 =?utf-8?B?ZldXMDcyd0xLMUU0ZXFLZHJxZWlvRlpQMmJNZ3RDTEVEaFZzZDFtUnlZb0pO?=
 =?utf-8?B?TEMzUUlkT1ZJTk4xckZWTG95bHlmcW5zMENscEo5ZmEvd2xKdXNGNTZWcFVs?=
 =?utf-8?B?ZGUxUEQvN1lpS3RPLzZNbEtWVmxnSWdvblFKNHVwWTY1eURlMFJPc0o3aFVx?=
 =?utf-8?B?cTE3d3Jhb3dPZVNSdWxEQkJGc1J3dFNnL083VVpZTjVLb2YvMDg2dVNPZldx?=
 =?utf-8?B?TEVVZG5Haks2cFRxQThWYjcva2VmUDI5em5McmhxcFhmeEhSV1V5eGhUL2hn?=
 =?utf-8?B?c1M0OWt1dWRmRldubDFuZWpPS3Y3RnhUdUhnVjBzdzlLWWtPQTRXZ0ZqUnNK?=
 =?utf-8?B?bXdjNlcrRkhWQXBKMlJVeGQwc2NIMDVSNlB6V1FkU2Q1RW80Y2UxRWtXNXBk?=
 =?utf-8?B?WGZhWlNVQUtDUnBRcEcrcjVzL3VCRGdhV0lwckdHelRXQ3MrQkJmY1U2T1Nx?=
 =?utf-8?B?ZXBTb0FyWmZEa0I0bnNKV1BhcWdqUzhHK1Y1UUgvRlhUbmlwckdwQ0tZVkds?=
 =?utf-8?B?cVF1WkhRN1B4aHZaN1U3WU55TGpDaUNzRHNnZk9kcThzTmNsWlJqQ0RDMEEw?=
 =?utf-8?B?UDBnUHVKVnlyUXJyU0JCVkhSaDhKaWtBdVR3UWpDcHFQZDhoRTZrNC9EWWR3?=
 =?utf-8?B?dWxvM05MaThmL0VNVTFVbko3MGpvVHpTZ0NaOVZNOEV0UGF3dlh6UUhwSjJt?=
 =?utf-8?B?RlZ2a0lzdDdjK3k2U0Q5WS9ndDd3R2V1Qnl6cThlMVJIcTFVSE9OQWhoVUxW?=
 =?utf-8?B?cGV6czhyMldiRW54MXp1Q0xoUTRzcVVaWEgrTUdlQytXaUhLUWl4ZkIxMFI3?=
 =?utf-8?B?ODE0eTZ2UFpxWU5TSHl2Vy9wSUpCbVBHb1REUGdIUFNFM25BSFNjdVlBM1Zu?=
 =?utf-8?B?eEcvR2RIaC9NT1NEZ2RBTWZEaGoxd2xieHFIaG1uRUJJZ3JORm9qQXVxWW94?=
 =?utf-8?Q?YQC8IUgpUMQroMY9APiachiZNoLQebLIaimrr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88FEA8A82F660B47BEF3C5E50188D3E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cfc177-3a37-4fc7-512c-08da351e9ca2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 20:24:41.9208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: baGdy7M1hdLCSpvrEXrQzJeouXjrDP/bi4YEy8id8mm4qPBcPvVBx38UZKVJlQgZ8/l0skNPuovcpMXwBV2MZS91yXPiRA1hs3RK6nbvegQ=
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
DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMgfCAxNCArKystLS0t
LS0tLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQ0KPiANCg==
