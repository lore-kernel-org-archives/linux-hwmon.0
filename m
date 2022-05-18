Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038AFC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 May 2022 20:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242863AbiERUyz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 May 2022 16:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242829AbiERUyy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 May 2022 16:54:54 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE3E2532F5
        for <linux-hwmon@vger.kernel.org>; Wed, 18 May 2022 13:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652907292; x=1684443292;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=D8dib4q71J4iCYAJ1IOjKnHlFWwgTqkhHj+iTooa0X0=;
  b=IDgqZ0iT3Gm/SDBSa+F4YOLu4LSp23T2e42ro582+ve35Sg560FZNRdC
   3goYbrcVcqg4+xVCDJlq6gNs40tTkcYmVP43MRYPzeto/LS3m+Lux7qcl
   i/iN8Bc0ltyb5H9gPoZPgeEelYMwsoe7tgqv2TkMSwDsfJvoLbxZoxExl
   XIdbzk60uawlt9HIEbpqK0+ogVfAeVp8y9Wu0bUspNJr6dYnz7B6PFsD6
   u9Tk7U9pQpDqr2t2uzxq0NhyuT3K8GbvyNr/Crmfxqv22y1JxflmLRS9r
   f8jZyI4Hjfn08KZL96Og7yq5UNCenEeTk3oBg8Z4Q5WdgduuaRvl17DQt
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="332504802"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; 
   d="scan'208";a="332504802"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 13:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; 
   d="scan'208";a="673652405"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga002.fm.intel.com with ESMTP; 18 May 2022 13:54:51 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 18 May 2022 13:54:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 18 May 2022 13:54:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 18 May 2022 13:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRcd0+3RFSg3GPfDj96WCtkrbto6y/VcECNQzDuI+dcOH0AoDwMG1gmWwKZMiOFSbp/Y+ksXz/y/ex9efoHdYb1BUEQK/IFj9/uf1VarQlRcqxQGcrDFZuIM2YQSWJDyJdaDnAwfwM4trbXoEl1U+RAmQIv8bXNYYonYyeeLVkpcTFiQz4pWWoijLO7TAw3o8j7iGCn/OhxdeNleypMEwnx+iVP6OJxoyo286vtIDInAlQRcvmKKWtBKHCKtcriwbKZB/0UyFZ7A/kWBXqswMVcJgSterWMX9yxw88c0GokB8k3XqLjIg5dFLqwcw5pIPlO6laHMI6ekeW7tGxle9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8dib4q71J4iCYAJ1IOjKnHlFWwgTqkhHj+iTooa0X0=;
 b=XC2qxXh5ISEeraJAuFwwzg68iohFMHwgvCFkiCmdwhOjgX9tH7LOZfsK1U5l8cJ3NzO6vsCe7WzIyroYjPfTaFseCARKAlNsmVbQg5+oNHc0k0dCom8aNi2a/J9m3FEoEl4VX3j0AeTpBRjXCiH7I1UhzbLQ2qWk4v8Ph0dfVA1N2PqOdZ1LsF5+dAnQ5z/cYCKadl7s1jDksyFJ5ouNqDmXB7CRifu+Fvp1NFwYh6Nqg7pJVfmTMLTVNWdAgsLM97bYCkjpJa0+9qxz3oLZwYx3caffCMIWvKo8KwhklT5ofttHWRgFt5QTvGU/yAq2ZhB+W7J+mh7X5AVQwhcVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 20:54:49 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::ecb3:4e15:2d91:bf37]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::ecb3:4e15:2d91:bf37%5]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 20:54:49 +0000
From:   "Winiarska, Iwona" <iwona.winiarska@intel.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (dimmtemp) Fix bitmap handling
Thread-Topic: [PATCH] hwmon: (dimmtemp) Fix bitmap handling
Thread-Index: AQHYaisyNNNl6nab3kyiZiQC0QVQtq0lHq8A
Date:   Wed, 18 May 2022 20:54:49 +0000
Message-ID: <c8948556409d38103886d96beba471aa7fc9be6a.camel@intel.com>
References: <20220517201740.1020831-1-linux@roeck-us.net>
In-Reply-To: <20220517201740.1020831-1-linux@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d6da78b-bc43-4e5c-a980-08da3910a620
x-ms-traffictypediagnostic: CO1PR11MB4770:EE_
x-microsoft-antispam-prvs: <CO1PR11MB4770DBD9634124EAF2FE964AECD19@CO1PR11MB4770.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wmmcnD58grr+MFAJcR+acNcAy112BPp8Kn0KjVauuzW+kD1R34gRsAyUUh7xR1MgvL5xfYTHIRmal34Ibxmobk0ucNHHDR9W+CfCDH5xQO8Pk0vAqN2V35RhqOLJHhmc1+hLPwrsRN59BBMNgt5/mNK3InIpe5FFjOKkt+GkqMSv/uzY8fn7TmYRiaBNkBLRdCmH6BQSXYlFyds+AYlktHghmOxQlcCYkHYimwvlB9CFV9VmJRnfrfHsqVVg4Fm4VWhsAVhJNAcWHAKgrolfZkSgwckubRjLHM4MksGc8/s3Dq3LqHwZuX16+kcvmMxjFIkSEYFClyqf8oH29aWH/PnHnaXiAznrmYRMXaGIW78QM13av9oG3l/8HsI1ExRsg+D3t1B+IRvyf6F4BfcZ2MhuYvY941MX6fi8MOIWo+E0Ae2kHNGywXM+6GpoBxjTKn+ZFdCq3UsYfmgblHUkXaQhjNJmQmKGrL/WVtLEQow1GqfITi4ChHAqyGyFfcXkk3PxlV/WZNUbXUbsm0veDhl145bDVCXQjClt7+lAlBRyLVC4gHmv8fQ6/r57JRAWHl7+vc/9pylK8YDX1YDS8hIl6lxLl2IsJYN5nK3DyqSc2FbmA7g/krxxyB8G/AEJtdoTj0LVP9z4AXdqLdFMAgoa5Za1DJjf4yT/QexQH0NPmmAaKbXPi6XZwR5Eq+SkHWQXF5Nsn4BN3sPnE8E6Kg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(2616005)(508600001)(6486002)(36756003)(82960400001)(38070700005)(6506007)(2906002)(26005)(83380400001)(6512007)(316002)(76116006)(66476007)(110136005)(86362001)(66556008)(5660300002)(66946007)(66446008)(8936002)(91956017)(122000001)(4326008)(38100700002)(186003)(8676002)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlQzditjNlI2QlE0OWpEenNYTXhidjd4S1NKQ3NUbFBYUTBRbVp6RTlDVjEy?=
 =?utf-8?B?TUdzdzVweTNFaXI4YVZKMUpwOGRsQ0xJS3R2eCtqNklrN1NDK3dycjdzNjFC?=
 =?utf-8?B?TTF6aEFPc0J6ZEpRTStVN2dQWkFKQVJqTE1oMG40K1BtanM0cnNNdjl6M0NP?=
 =?utf-8?B?MFJBUU5kZWpJL3hTdVpHeDk1Z0w3dUxQRG00Vm9EUXJjclp2SEZoNUZVVTV0?=
 =?utf-8?B?NkxZTnpZaVU5am80UlFLTXl1ZkZjOXRkYXJvZzllbUlvRUVtdzJzbmU2US81?=
 =?utf-8?B?cDE0Nks3N1pOcFlXcXFERGJBaThMVjRUSjRlMFhnTUJUTVNjNHI3NmFTZkh5?=
 =?utf-8?B?YWRZRU1ERGJ1bHR1WW5WcHlPN01mZTQ2alIzM1ppcW1tOVh6NUh3Um9SZ3No?=
 =?utf-8?B?SW0zbmhOT2pUZ0xhcUJTaExjODlEQ3JVVlVzM3pxUnZKT0Z6ZTFKOTJ5Vk1V?=
 =?utf-8?B?SnBCYXE0Mi8rSExWK1M2Y1I4NDAyZ0ZyMnovR2liQlBZMTRsdXBHdC9ZS20w?=
 =?utf-8?B?REdSbFYySXF0dHlsNjdtMXlGVk9OQ1o1SlIvMXZQSnRVWXpMSXl6bHEwK0ln?=
 =?utf-8?B?dFgzd0N2S0VPUXVLTDkyNy9VV1VKNmlrYm8vT2NQbno5YTd2d3pubmdsRUFy?=
 =?utf-8?B?a2x2MG9wbU4zUVBTRGtzRTFFWFB2dFNEUnV5b2F1SWhtSDY0bzJjYkZFNWll?=
 =?utf-8?B?QTlndk5PYWZGanZwTUZIY2MxTnpwaEpzcDdwVGE0NE11czVZclQxMXpCS0xZ?=
 =?utf-8?B?TzZubVZzd3JTWG9vQWJ1S0hEK2h1c0JEOW8vWHMvR3c3UXdoa1d6OEd1dlRi?=
 =?utf-8?B?MThBSFEvbE01TTI3bE1kYVZPOWRuMmh4QjZHSUlLM2FWRmdWVkNGc0V1SEZE?=
 =?utf-8?B?VFIvM2hDNmZ4RDFKcjdrMWVwT09YZEFZRnMzb0hDRThHUzcxeXVpdjAyS1JO?=
 =?utf-8?B?VDNxQzhzQWRuSmsyQjBlMFZ1am91TnNIYzB5NG5xd1NRWW4vSFkzNnBJVXFX?=
 =?utf-8?B?bGZiUi83Q016bWowTlFEVWJabm5oaDV4eHh4OG5RQXpWNlFBNFQxN3dheW1T?=
 =?utf-8?B?SURiRElTd0VpSys5ajlTMkduUXpzYTlNSkZvN2Q3NVFLL21QSSt0VWdVZmxE?=
 =?utf-8?B?Wm1PNnoyRUJ4YWtUaDFUSEFFaFF1T3lwbzBNZ3pPb1lDeXpDNTlqL1V4T0Q2?=
 =?utf-8?B?L2dBQzVaL1pQMXJMcVg3RVY0eEZqOXQ2NWlhWTlCaFA4Z01zTWEwSlM2bnFD?=
 =?utf-8?B?ZjZJRjVJWlBUWkdBa0dzMEt1N2tPUTEwenh5TEhKZms2WUV3cVhwdm1lUmZF?=
 =?utf-8?B?ckRoa3VKYitsMW9pVUNsSHYxR1JudzR4VkQ0ZEI1Z0RxbjIxaDY3cmp0allN?=
 =?utf-8?B?SkhBdXBZdUpNbC9xbUs5Rm0yanRsVzBNYWZjcmU1dlpuUlVZc01UcStWZDZW?=
 =?utf-8?B?T3FCNUxsV3I3LzhYWnZ6WXNtaEx3UTJqYWVLRFg1UW5zVGFRU3cwOXJHNC92?=
 =?utf-8?B?NjViaUcvRzFFbmRGekQ2NC9CZXA1QXN4bTlFMForVWw0cVRFd2tyVG9UYkxZ?=
 =?utf-8?B?Wmc0YmFQRlVLcnl0VmpjSUJwTUd1ZVBERE1ZM3JzNnVib3BkN3ZiRXJQR2Y1?=
 =?utf-8?B?ZEF5U2RIL3NtbTdQVzRlbmg5NG0xWVRVS3FwOVRJYjlqUmFVMXgxaHJDSm41?=
 =?utf-8?B?R3JvU3Bncno1UmcxY1oxR090SVl4UU00Z21pc3VoWCtwREJwZno3NkFkYVBl?=
 =?utf-8?B?U1hqcWJNbE5EeXJEcmhjeEI2dXREMVZwSWF0bHYyTmV1SUlRakxaSUVzR2Z3?=
 =?utf-8?B?SHZ0NGw1RHluaGx3M25JTFJCZnFPbSt5Sk9WQ0pYdGFzdzMzMXZoUXBqK3RL?=
 =?utf-8?B?Y2dac3FNUnQrUmM2c2NJWlhqVXc3b3k3TzdqNTgwaE9Qd3BmSGxmd2wzTkF5?=
 =?utf-8?B?SGhQOXZMRnVqMlJUclhWTm94MjJiUGVwTUZWQW5uRlZTZXRRWGZhbVlIZ0RX?=
 =?utf-8?B?VW43OHBmMWpuMTNzTVovM3Q2OC9FSStrLzhqWVUxc0dsZnNtaEFBRGdSSnVJ?=
 =?utf-8?B?U0p1MUdXTzRlQ3UveFpCa2dQY2Jsei94dU54UklUZ3gwQVRnaElEV0RUV3Rx?=
 =?utf-8?B?S2hUd2hVbHFzVWhvUUNFSS85VWRvRXF6MXJ4V2J6ckxDV0UxSDR3Q2pTSHBT?=
 =?utf-8?B?VjJBS2hTOFlJK1A0RUludnhTa3c2ZnFBYzB0MGkwck1FbERrZ0lxQnNNVWFT?=
 =?utf-8?B?NlFMS2VYd1JsSW1Tak1ZVnBKTEk4Mzg4K3FZSjliTVhUS0JrMXBXZm5SM0Rj?=
 =?utf-8?B?RDByT3RYMUIwY2ppblBKK2Nob3BRaEFoMFpYQytDc2NYOUpQN3J0SVNDZ0Zw?=
 =?utf-8?Q?uUZAf9czEoeC/7EF3QdRjxxHUQB4/bnsX22kE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23E2A444018CDC4E8894C65276B0A913@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6da78b-bc43-4e5c-a980-08da3910a620
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 20:54:49.5140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K6vRl1gTFi0FPTxXiSV1UJ0Nt0W9eOyHFhvBgSe5eXaHZJezxdzdvTXgxtGp9hUS8/VzUnYLJ3/bynSwDpAkIYGywK6O3SGyG77LW68UAFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gVHVlLCAyMDIyLTA1LTE3IGF0IDEzOjE3IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBCdWlsZGluZyBhcm06YWxsbW9kY29uZmlnIG1heSBmYWlsIHdpdGggdGhlIGZvbGxvd2luZyBl
cnJvci4NCj4gDQo+IEluIGZ1bmN0aW9uICdmb3J0aWZ5X21lbWNweV9jaGsnLA0KPiDCoMKgwqAg
aW5saW5lZCBmcm9tICdiaXRtYXBfY29weScgYXQgaW5jbHVkZS9saW51eC9iaXRtYXAuaDoyNjE6
MiwNCj4gwqDCoMKgIGlubGluZWQgZnJvbSAnYml0bWFwX2NvcHlfY2xlYXJfdGFpbCcgYXQgaW5j
bHVkZS9saW51eC9iaXRtYXAuaDoyNzA6MiwNCj4gwqDCoMKgIGlubGluZWQgZnJvbSAnYml0bWFw
X2Zyb21fdTY0JyBhdCBpbmNsdWRlL2xpbnV4L2JpdG1hcC5oOjYyMjoyLA0KPiDCoMKgwqAgaW5s
aW5lZCBmcm9tICdjaGVja19wb3B1bGF0ZWRfZGltbXMnIGF0DQo+IMKgwqDCoMKgwqDCoMKgwqBk
cml2ZXJzL2h3bW9uL3BlY2kvZGltbXRlbXAuYzoyODQ6MjoNCj4gaW5jbHVkZS9saW51eC9mb3J0
aWZ5LXN0cmluZy5oOjM0NDoyNTogZXJyb3I6DQo+IMKgwqDCoMKgwqDCoMKgwqBjYWxsIHRvICdf
X3dyaXRlX292ZXJmbG93X2ZpZWxkJyBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSB3YXJuaW5nOg0K
PiDCoMKgwqDCoMKgwqDCoMKgZGV0ZWN0ZWQgd3JpdGUgYmV5b25kIHNpemUgb2YgZmllbGQgKDFz
dCBwYXJhbWV0ZXIpDQo+IA0KPiBUaGUgcHJvYmxlbWF0aWMgY29kZSBpcw0KPiDCoMKgwqDCoMKg
wqDCoMKgYml0bWFwX2Zyb21fdTY0KHByaXYtPmRpbW1fbWFzaywgZGltbV9tYXNrKTsNCj4gDQo+
IGRpbW1fbWFzayBpcyBkZWNsYXJlZCBhcyB1NjQsIGJ1dCB0aGUgYml0bWFwIGluIHByaXYtPmRp
bW1fbWFzayBpcyBvbmx5DQo+IDI0IGJpdCB3aWRlLiBPbiAzMi1iaXQgc3lzdGVtcywgdGhpcyBy
ZXN1bHRzIGluIHdyaXRlcyBvdmVyIHRoZSBlbmQgb2YNCj4gdGhlIGJpdG1hcC4NCj4gDQo+IEZp
eCB0aGUgcHJvYmxlbSBieSB1c2luZyB1MzIgaW5zdGVhZCBvZiB1NjQgZm9yIGRpbW1fbWFzay4g
VGhpcyBpcw0KPiBjdXJyZW50bHkgc3VmZmljaWVudCwgYW5kIGEgY29tcGlsZSB0aW1lIGNoZWNr
IHRvIGVuc3VyZSB0aGF0IHRoZSBudW1iZXINCj4gb2YgZGltbXMgZG9lcyBub3QgZXhjZWVkIHRo
ZSBiaXQgbWFwIHNpemUgaXMgYWxyZWFkeSBpbiBwbGFjZS4NCj4gDQo+IEZpeGVzOiA3M2JjMWI4
ODVkYWUgKCJod21vbjogcGVjaTogQWRkIGRpbW10ZW1wIGRyaXZlciIpDQo+IENjOiBJd29uYSBX
aW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEd1
ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4NCg0KUmV2aWV3ZWQtYnk6IEl3b25hIFdp
bmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCg0KVGhhbmtzDQotSXdvbmENCg0K
PiAtLS0NCj4gwqBkcml2ZXJzL2h3bW9uL3BlY2kvZGltbXRlbXAuYyB8IDYgKysrLS0tDQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo=
