Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBF333CEA2;
	Tue, 24 Feb 2026 21:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771968074; cv=fail; b=rHMly4YnpH+Mre0sP9JPeHjmBc/wnKdgEm+FVK5VJOmme2RkEZWWsEdMT9vmlVcGjrPNgnojGdk9WSaFhq+pXWPoa914j+UtOW2Wwcr9JHiK7H4i9atYOnIaiMdKrIV81GvaJv9DkCYdtyZ4erG17IEApOF3lC/ahFOzY35yHSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771968074; c=relaxed/simple;
	bh=cYd5vQx8F7q9TokUUoo/1eB+xgSJp6m5wf2ch5eImwE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D8ehf6ihGvh+1y18vE/fgDckFBQKNmsuELyjbp6tNacs1j5MDb71mkovVbNiL8CiiWYH86cNTXo9F7X2XTibeHXZGOwq/5vjYXQxdKubtLnFXI3hg3C1kxQnYO7WtAFhP0mmD8ap18oHCW+kHHDreoFOymxFmxb1V+C7ZSahLm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQHUZ/ie; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQHUZ/ie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771968073; x=1803504073;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cYd5vQx8F7q9TokUUoo/1eB+xgSJp6m5wf2ch5eImwE=;
  b=TQHUZ/ieZdOdHL3ze+ZMoBoA5YkQ55awwv1H/rh74678fnk+qozu2qDY
   0Y0dEXA6tJ7VKbgrTJO+37n0LSCF3NkNJp5KZhQlAHcC9KdgN7pBZ+ZlX
   iIOU196/rrjpZlgC26VBbGUiopwuEUwSWymASglAZTZtRxnZqvEurTuWL
   p3bPzOlsqX7UsCxubZHhNyJ25EKk4KEwrsYQeCdcx4hwOqQQXo0conWIE
   6bYT9uXMGddxs6aTVxSRf+vDldKg9FL5qgMsakUE7MgQMmFBCJL2n2PEt
   97iALZ3Gxoj1kExTKWmvt1KtBQ5hZVdIgG1W+Mn32hKVIV6VG+CC2ujRq
   g==;
X-CSE-ConnectionGUID: EMItMSrYRzi7KxRlUBzVBQ==
X-CSE-MsgGUID: v3XLFbxmT5KAu94lq40TKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83619150"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="83619150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 13:21:12 -0800
X-CSE-ConnectionGUID: K/Xc6vIQSlKOg7mkKI3iPA==
X-CSE-MsgGUID: tOSP9bYUS2iFKLVRN1stqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="246588664"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 13:21:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 13:21:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 13:21:11 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 13:21:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uG0tx3ej/aAu0tU5cvOt4Wr7rWusWUA7+jrx26Y1LfT+auwUKNPPc2tuo91hrKMar5wY649tm7UKdA/ZLeSNJfKfbzn4uerF8++FpIxo/5eL1a5FaNqGoUrf3JykmF8BXVwHm5+Ek1QavsqjOds9sF6t8lc28gfo/VjT2q1Vbd8SVEvQi8KGRvD1XRvcD9IpP280W5xpLDtcNEUdLKViEbNkOv7fhxFoOUr293GwpzWZAVhcHAznrsDiwnwwuzKzS6aPTr17En/0R9W2XPbWxa/HMeunJZp2YGmtZwjfWG7M9GnBlW12DF38WvIZPzNe2erWCGvDM6Cs74LQORbERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYd5vQx8F7q9TokUUoo/1eB+xgSJp6m5wf2ch5eImwE=;
 b=HR9FvVjykUaNJEjgykmgRBDdawOXLnpuf84MDnK4ONeDWFRCFblz/wGdvmISzBI2oRwNHAeNFubQR205zBa3AJD/fV4+1xe+hhWy/2n88qvJwNbVBTlzr9YSZvt6A99uDA4Cv5X3F/nbohi0W7kYoL02VPZjIlCkDz46A5E3mR2f+SSonghB/tEg028GpuYrz9HmfWdtHgZcYUd2i8Rm0awZdnK/kk8h45hXtXaZV0S7Hgj9Vu4GK7tDj4i0Cy0Gy7NqJ4lJVLuat1/Tz9lMYLTFKr51mHV5wogMwd9damrMmN1T03b4ZAu5wiG6eP5xe4kHhsVgT5GT/TpVH84l8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:21:08 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:21:08 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "Luck, Tony" <tony.luck@intel.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] [v2] peci: Remove dependency on x86 CPU variables
Thread-Topic: [PATCH] [v2] peci: Remove dependency on x86 CPU variables
Thread-Index: AQHcopGRLs1LpIJe6EqclgX4DdQ5ibWSYdUA
Date: Tue, 24 Feb 2026 21:21:08 +0000
Message-ID: <f3620dfead291503fd3b487b362f69ee3e4ea961.camel@intel.com>
References: <20260220175121.C16ADAAA@davehans-spike.ostc.intel.com>
In-Reply-To: <20260220175121.C16ADAAA@davehans-spike.ostc.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|SN7PR11MB6728:EE_
x-ms-office365-filtering-correlation-id: b516e473-d79a-4221-96d1-08de73eaa081
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MGJxQ0FZT3hTZmVUYjBJZlFKUkpObTBBaUo2L1lQdUE3Q3B2M0VIcFlZMmlK?=
 =?utf-8?B?MXRibHlOa2FBMnZGd2F1R1BHU3F0eGs0TkI5L2Myd0ZHVFpzcHpTaHF2cTZM?=
 =?utf-8?B?bzNia0FpRUhZbkhPSnMzOUNlWFRDUW9PaWoyM3puRURTcmdtNC9HM2YxS2Nv?=
 =?utf-8?B?ckFHaUtvTS9yRHpmcDhSdk9pMllyL0JHVklabnROVGJoVUlWOW8vVzZFSGlC?=
 =?utf-8?B?YXR0bzRLandJVlNyenNQaTc0Qk51YkVpOHUzTTdkbTQyc1U5MHU5ajVXd2t3?=
 =?utf-8?B?S2pFMlg3cjU4c2tsc3ZrY1dmWEt0S2dmRUZ3ZlpyRW9RdXZORTlGV1dGUWx1?=
 =?utf-8?B?Q0txTmdSK3ZlVmp0Tm9aVzJZUzFzZjBzSFB5V0VITW9tRUtSNUE3bm1NMXNt?=
 =?utf-8?B?ZHpJQkVWYkFLdW9GZnFUMGZwdjBaaUdoNURPZ3BUUjNSNXFnNUtnb05zY3hK?=
 =?utf-8?B?YU43MGk3YmJjcHU0VHY5WVZRcGNIRE8xcXEzVWY2WnhYZWxxVlo2TjdRTVBs?=
 =?utf-8?B?dEttSEkvSmNJMVNXS1VyUXN6d2RCNlZMZlRPOTdjVm1uUzk1MXNsMGJXNGhM?=
 =?utf-8?B?K3RqSmRXVGloSGg2QmdHZlV2dE5NT3U0SHNtRGhDVDd3Syt1K2FQeUZLb1Rp?=
 =?utf-8?B?SVI2QmtMcXIvbzJhVUtsYzh1Y1d6R2FXOHE0b1c0UEFrWU5FaklYZ20rbVR6?=
 =?utf-8?B?bnN4NmIzRloxczgxcmFYdlVSYjl6NkUwYWN4UjVaRWw0V2YwWmhDMXZGSU9m?=
 =?utf-8?B?RldwcnhHUXB2TzhnbkMwMUJlQmVCMnhmWEV6UW8rR0pmaThzN3dtcG9JNEN6?=
 =?utf-8?B?aWRCRUZuYWprdkdTckpmNlRvRTV3WUVDVmNkbmFNYm9GMStGTGswb0R5WXlr?=
 =?utf-8?B?Q2dJWXBTWFR1UElMeHROOVh2cUtIWjRycVJkYVBQUmRVUXFNeVNJSHprMC9B?=
 =?utf-8?B?R2RIc0tjc0NQT1ZyYS9kb1l0YmNnRE9vS21tTUI4ZGEraFhGRzRiTUs2eDhN?=
 =?utf-8?B?YWRjVitwWW1JUldGUHlrZjFUK2hKZzBwb1hNOGRuM0xoL1F0YTQraFJYaHBM?=
 =?utf-8?B?UlhmNk5iRWVRakd5ZjNmdlVCMkRTWHAxbkhXS1Fvancza0V6TTIrV1ZHVjRa?=
 =?utf-8?B?bDdvTDk1aTYrcXJWYmJlZDFoSHNkVGJWV2xNMEhKeU9YcDhQOTdrcFpWSVRh?=
 =?utf-8?B?bWc1dGZCMVBmc04rbm5xdytoYjRqb2tCVXZEOHV1K0ltRDdQd1FZd0VXVDVI?=
 =?utf-8?B?ZitxQnh6Qm9jUVh1czZlczdGODFqRnZPSkY4Znl0RmZaR21WL05HMmczS3Vp?=
 =?utf-8?B?RjJqeHRBcGdndFZyN3B3M092YzVmKy9JcXVxQ0F1RUdzR0pJTVo3V0p5UDBy?=
 =?utf-8?B?T3RrNnh4QkFMVjcySHY4dTFab2ttOHpXWFZCdEpncnplVHZUTng2Yjdmdkx0?=
 =?utf-8?B?TzVVbGZuWnNwNXlmN2M2UWNXM09oS2lSQXo5aTFUL3FLUjhBNFVhRXdvTEtV?=
 =?utf-8?B?Z0FFK1h5WVpyaFBaR1NHQ1BndFVMSHNlczIzV28raEJZWkx1d3h5TWpsUGNZ?=
 =?utf-8?B?S0dWRm1RWnlHNzJRMXVuWHZMR0ZNS1A3YXdZd2QxcTNySVhGd2gwLzFQakNj?=
 =?utf-8?B?UW1YOFE2MlBCb0ZKQTZkRkJyV0xDQ2hXbUtZSWp0L0ZIeWhrWk5tNmltOVd2?=
 =?utf-8?B?NHRycnpFQ2ZTQllPZmlXdXEveTVsdDlLSGVSaXprRloyZVVDVXk4dWFRYXlJ?=
 =?utf-8?B?MGt0azlMRkVYWFhYWU02SVBzQ0phYmhiNkV6U25abks0eUlpazROTGI5Y1RD?=
 =?utf-8?B?VGFFRStKdGtaSDV2Zy9Ha0w0TytvQ1RnVktpSnVDa0R2RjJKOGtYOHNOR1N1?=
 =?utf-8?B?UkhJUXhZMGtZL3hOVEtCcWJ3NDBHVitTb2RvbndoL2MyZXp6UTlPYUs5SDdk?=
 =?utf-8?B?UEZmOUZYMTR4djZUKzR3UUpSRUlUUmh4aDE0aFNjUjN5dFFyL0VyZ3BoNHFo?=
 =?utf-8?B?Y3V6YVBjaDZHc29WdUNZMnpmTEJnbUlEOTFNTjJFekJqYlZVbVBNVE04b1pj?=
 =?utf-8?B?SmJmZzZvRmNUcmVrRlFqNnNWcnBxSzQ1SnRWNjEweS9QejVWMHRlb0xQUnJ2?=
 =?utf-8?B?VUdGV2RibXF2Q1IyTGpTWCtCc1o3dDRxcVMvM2h4MmdlaGR0M3ZtS0tkNHRa?=
 =?utf-8?Q?2zDfq0oTP/LiQTvLiwbXtDQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXNnSll3aWV2b1dIOHJvT1BBSy93c0h1ODJ2ZzN3YlJveElpSlQzam1nYXpn?=
 =?utf-8?B?ZzI1ZzFxbXRBcFlQV0RGOFR2WXBFeWFrbEFVeXh6S0hUNXVKencwSVp3S25H?=
 =?utf-8?B?T1E4UkZCTHd4c1lrQjZjVDEzOXVKUm1qUnBTWWxtTTdaek1PYVpMMWlveU13?=
 =?utf-8?B?MUs3WVFwZHJTQVhaWldSemt1N0s0SzgyNjZ2SitEWHVWRzZ0YkRKRU5mVys0?=
 =?utf-8?B?V1JRZWEwSEYrQkphQSsyY0VIbFZwa2JrMVFwNWlBWnZuZllYOFdNTkVJUUh5?=
 =?utf-8?B?cWNQblRQODVlSHgreGwwT0pmNUxPMEptcjNVem5nZHZUbmNERzlHNUtlRkM1?=
 =?utf-8?B?ejVaQ0ZDWHdtUUNhTHNMZ2UxdTlCZXBOU2Mzd2x6WXFKbDIvUEI5c0xQWjJV?=
 =?utf-8?B?OXUrbFZLdEVPZFBOazZaNzllSEtFR2VoY2ZDVUIzdzFhL0YwZmpFNklNbG14?=
 =?utf-8?B?VTQ1c3hPYUFEdzQ3bDdTcjBoeFB5Y1MreEJRQ0F2dkMvaWRzcjVzYllER3hj?=
 =?utf-8?B?bDArdEFQZTVuZUxJNHUwUjdIcDVjUkFJMTFFbTk5ektkeEdMbFE1RUtPTHBT?=
 =?utf-8?B?N0twU1ZmaXFkeExJYm9Sb2ZjQTRvd3ZidXBvUjlIRWd2MmpCNzVndTdLT3pK?=
 =?utf-8?B?VkNJQURXdnZyWjk0aDRyWWtzaHkyZFJNNVhaTkx0UDBjVnFiWmtWRXdnLzRx?=
 =?utf-8?B?Q0VqMmlDbDBKSXU3MlJVeldUTkFvTldkMnp0c2xETWZjazNHVnVDMExxRVU2?=
 =?utf-8?B?OG9NUmw4RkZsUGNReXhpUjBoTGduZG9CVUpLZGJUNTdtRk0zTmN4UVl5Vk5H?=
 =?utf-8?B?dVhPdmZ4WVdFeDhxdFN1ZDFNM1gwSWJTYndPR2tQaVoyNDN0aFk3VmVqTEJk?=
 =?utf-8?B?QSt2bGxrMVlLWTFIVlV4dTNsVmF1dmQyZkRDQ3dpOVNZVUtKZTNHM29iUjMz?=
 =?utf-8?B?Mm5ubjV0amRIN2kwY0J2OEUwa0ZEbUtSeVYvMnRVSVNMN0pBTTNOblA3Y2xZ?=
 =?utf-8?B?ZktnQkVBbS9kMkFzTDVFTnZiVkU2NXZBMWZ2aFJlcG5mZXg3K3BYeUZiS2dx?=
 =?utf-8?B?KzhVNWhSR29kZEpOMUdQaXpraHVsclNHRk9VcDlIWFkycklpSDFqbTZVamk1?=
 =?utf-8?B?clByZlVsM0R2ZTZXNERJU1VZTkZyN2V0RThZOXFCdVZ6Mk1nUjErWGladTV0?=
 =?utf-8?B?dUQ2M2hxK0JWR0F5VTBtMkZkc0Q5aWc5T0JWU3pubG1YS09UT2FWZVREMzc5?=
 =?utf-8?B?dURzd1pUejVVQjlKRlVIdDlXWFVjbC9XTGJpeGpsbUl2ekkzTXZNbDVNV01w?=
 =?utf-8?B?UkwzcUxMNzU1WVNpS2pOeVhCeW1Hc2ZLZFNXWHY0U1M0aFZGalJDWWg1YjFQ?=
 =?utf-8?B?RzlPWjhlVnFBL0JpVGJXSW1XUmhnOVBmcWk5LzRaZ1M0aW5OcDAyMnJoemNk?=
 =?utf-8?B?QjExSUV6NjFHd0J2dFZxVnVKVDFlTVUvODhxck5oSU1rcm9RbllyeEx0OW1W?=
 =?utf-8?B?bzREL2NsL2RwUGN0VjlVRUJ2OW9Fb0J5UUJMZWJNWG9KcER2MEZJakxqN1Np?=
 =?utf-8?B?cmt4RWNIRHpaOTJYaUdyMm9vSm1DVVM2T0JtTTg5cVlpbHFEcDZTRWRPTVlm?=
 =?utf-8?B?WXN4L0VFTzlOVHR4eEY4LzVpWGZMRXFRV2tkUlpPajgzS2dhaWY0dGQrU09C?=
 =?utf-8?B?QTUxa3BOazcvUWgwSDF0SVNXOVNVbEVSZ0pzbVdGVlA5LzV5WVgwWlJJcGNm?=
 =?utf-8?B?Mi9ESlZxajhKMmd6ZEpEV2pIaDZZNEp1bHR3cGRDWGh2QlVRcjh1ZytzdG42?=
 =?utf-8?B?TnI2TEU5d3JjK09VTjJkU21OQmVoRytzWU1pWFRQUm9LMzkrWmhXL1RQNnR0?=
 =?utf-8?B?V1YvS2pwUncvaTR3a29rQ3U5UEtOOGo3UHBCME9jSHA4UGwxUDVzeDkwaXUx?=
 =?utf-8?B?THRmVG1xbkdHWVRSVDFHZGtxdXNjV081bytvVENvT3NUdUc5K2tuaWNoYW02?=
 =?utf-8?B?UlpLKzQwSFA5VDZmUG01bGpSZW1NZU9Kc2hpRkZnelptczZzWldCRFB6L0VL?=
 =?utf-8?B?K1lTV0xaQlVSeTNVTVl4QWgvMlRTRER5UDVFbDJMQUZTb1F2Sld1VXIwb2tV?=
 =?utf-8?B?VlNKc1JmZ0Y3cGk0OG9SVVk1ZHBjdXFkWmJHbXBYUjRORzQwQ2lKb2xDbHg4?=
 =?utf-8?B?cCtVZWtzbFM0Y056ZGVITUk5UnlUSXAwemlYWUN3WEwwVk9lYkJ0WE5QakxH?=
 =?utf-8?B?bHFwaGJvd2RrL3FUZnNsb0N4bUs0RUcrS1JEN3JkdXpZTE8xTDFaZDdqOWdh?=
 =?utf-8?B?QjQxWDFvTGZwa2RlMHNHemxRN0dZeFZ3NEVqelUvcFVUWGFaRzhBRTArWnY4?=
 =?utf-8?Q?eKTciU/jkuyzOb7I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5DB86F356641944A2860C032BE7AAE9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b516e473-d79a-4221-96d1-08de73eaa081
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 21:21:08.5025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lt1KPK7YPRHp2pv5F3QRzx/pm4aZv/9y5i4VNAlfOidiDjwMk1N9QIt12uieqB3fMClUZM+VKsv/OMnYGO/038FLVvurxMIxveQB1QnTajo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6728
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTAyLTIwIGF0IDA5OjUxIC0wODAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
DQo+IEZyb206IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+DQo+IA0K
PiB0bDtkcjogVGhlIG5vbi14ODYgUEVDSSBkcml2ZXIgI2luY2x1ZGVzIGFuIGFyY2gveDg2IGhl
YWRlci7CoCBUaGlzIGlzDQo+IG9zdGVuc2libHkgdG8gYXZvaWQgZHVwbGljYXRpbmcgQ1BVIG1v
ZGVsIG51bWJlciBjb25zdGFudHMsIGJ1dCB0aGUNCj4gcmVzdWx0IGlzIGNvbXBsZXhpdHkgYW5k
IGR1cGxpY2F0ZWQgKmNvZGUqIHdoaWNoIGlzIGEgZmFyIHdvcnNlIGZhdGUNCj4gdGhhbiBkdXBs
aWNhdGVkIGNvbnN0YW50cy4NCj4gDQo+IFJlbW92ZSB0aGUgUEVDSSBkZXBlbmRlbmN5IG9uIGFy
Y2gveDg2IGJ5IGFkZGluZyBhIGxpc3Qgb2Ygc3VwcG9ydGVkDQo+ICJ0YXJnZXQiIENQVSBtb2Rl
bHMgaW4gdGhlIGRyaXZlci4NCj4gDQo+IFRoaXMgaXMgb25seSBjb21waWxlIHRlc3RlZC4NCj4g
DQo+IExvbmcgdmVyc2lvbjoNCj4gDQo+ID09IEJhY2tncm91bmQgPT0NCj4gDQo+IFRoZSAiUEVD
SSIgZHJpdmVyIHJ1bnMgb24gbm9uLXg4NiBoYXJkd2FyZSBpbnNpZGUgYW4geDg2IHN5c3RlbS7C
oCBJdA0KPiB0YWxrcyB0byB0aGUgeDg2IENQVS4gVGhlIFBFQ0kgaGFyZHdhcmUgaGFzIGRpZmZl
cmVudCBmZWF0dXJlcyBiYXNlZCBvbg0KPiBwbGF0Zm9ybSBnZW5lcmF0aW9ucyBhbmQgdXNlcyB0
aGUgQ1BVIG1vZGVsIHRvIGNvbnRyb2wgZmVhdHVyZQ0KPiBkZXRlY3Rpb25zLg0KPiANCj4gQmFz
aWNhbGx5LCBpbnN0ZWFkIG9mIGEgUENJIG9yIFVTQiBkZXZpY2UgSUQgdGhhdCBhIFVTQiBvciBQ
Q0kgZHJpdmVyDQo+IHdvdWxkIHVzZSwgdGhlIFBFQ0kgZHJpdmVyIHVzZXMgdGhlIENQVSBtb2Rl
bCAoYW5kIGZhbWlseSkuDQo+IA0KPiBUaGUgYXJjaC94ODYgY29kZSB1bnN1cnByaXNpbmdseSBo
YXMgYSBsaXN0IG9mIENQVSBtb2RlbCBudW1iZXJzIGFuZCB0aGUNCj4gUEVDSSBjb2RlIGN1cnJl
bnRseSByZXVzZXMgdGhhdCBsaXN0LiBCdXQgdGhlIGFyY2gveDg2IGxpc3QgaXMNCj4gbWFpbnRh
aW5lZCBpbiB0aGUgIkRpc3BsYXkiIGZvcm1hdCB3aGljaCBpcyBkaWZmZXJlbnQgdGhhbiB0aGUg
YmluYXJ5DQo+IGZvcm1hdCB0aGF0IENQVUlEIChhbmQgUEVDSSBoYXJkd2FyZSkgdXNlcy4NCj4g
DQo+ID09IFByb2JsZW0gPT0NCj4gDQo+IFRoZSBlbmQgcmVzdWx0IGlzIHRoYXQgdGhlIFBFQ0kg
Y29kZSAjaW5jbHVkZXMgdGhlIGFyY2gveDg2IGNvbnN0YW50cw0KPiBoZWFkZXIgYW5kIHRoZW4g
ZHVwbGljYXRlcyBzb21lIGNvZGUgdGhhdCB0cmFuc2Zvcm1zIHRoZSBDUFVJRCB0byB0aGUNCj4g
IkRpc3BsYXkiIGZvcm1hdC4gVGhpcyBpcyBmcmFnaWxlIGJlY2F1c2UgaXQncyBlYXN5IGZvciB1
cyB4ODYgZm9sa3MgdG8NCj4gYnJlYWsgdGhlIFBFQ0kgZHJpdmVyIHdoZW4gYXNzdW1pbmcgdGhh
dCBhcmNoL3g4NiBpcyB4ODYtb25seS4NCj4gDQo+ID09IFNvbHV0aW9uID09DQo+IA0KPiBSZW1v
dmUgdGhlIGFyY2gveDg2IGRlcGVuZGVuY3kuIEluc3RlYWQgb2YgZHVwbGljYXRpbmcgdGhlDQo+
IENQVUlEPT5EaXNwbGF5IGZ1bmN0aW9uYWxpdHksIGp1c3QgZHVwbGljYXRlIHRoZSBjb25zdGFu
dHMuDQo+IA0KPiBBbHNvIHJlbmFtZSB0aGUgZm9ybWVybHkgIng4Nl92Zm0iIHZhcmlhYmxlcy4g
VGhleSBhcmUgbm90IGluIHRoZSBWRk0NCj4gZm9ybWF0IGFueSBsb25nZXIuIFRoZXkgYXJlIHB1
cmVseSBkZXZpY2UgSURzLsKgIE5hbWUgdGhlbSBhcHByb3ByaWF0ZWx5Lg0KPiANCj4gVGhlIHJl
c3VsdCBpcyBhIG5ldCBjb2RlIHJlbW92YWwuIFRoZSBvbmx5IGRvd25zaWRlIGlzIHRoYXQgdGhl
IFBFQ0kNCj4gZm9sa3MgbmVlZCB0byBhZGQgYSAjZGVmaW5lIHdoZW5ldmVyIHRoZXJlIGlzIGEg
bmV3IENQVSBtb2RlbC4gQnV0LCB0aGV5DQo+IG5lZWQgdG8gZ28gYWRkIG5ldyBDUFUgbW9kZWwg
dG8gdGhlIGRyaXZlciBleHBsaWNpdGx5ICphbnl3YXkqLg0KPiANCj4gPT0gTm90ZXMgPT0NCj4g
DQo+IE9uZSBsaXR0bGUgd3JpbmtsZSBpbiB0aGlzIGlzIHRoYXQgdGhlIENQVSBpZGVudGlmaWVy
IHRoYXQgY29tZXMgYmFjaw0KPiBmcm9tIHRoZSBQRUNJIGhhcmR3YXJlIGNvbnRhaW5zIHRoZSBD
UFUgc3RlcHBpbmcganVzdCBsaWtlDQo+IENQVUlELjAxSDpFQVguIEJ1dCB0aGUgc3RlcHBpbmcg
aXMgaWdub3JlZCBieSB0aGUgUEVDSSBkcml2ZXIuDQo+IA0KPiBTbywgdGhlIFBFQ0lfSU5URUxf
KiBpZGVudGlmaWVycyBhcmUganVzdCBkZWZpbmVkIHdpdGggdGhlIHN0ZXBwaW5nDQo+IHNoaWZ0
ZWQgb2ZmIHRoZSBiZWdpbm5pbmcuIFRoZXkgY291bGQgaGF2ZSBiZWVuIGRlZmluZWQgd2l0aCBh
IDAgdGhlcmUNCj4gYW5kIHRoZW4gaGF2ZSB0aGUgc3RlcHBpbmcgbWFza2VkIHNvbWV3aGVyZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRl
bC5jb20+DQo+IFJldmlld2VkLWJ5OiBTb2hpbCBNZWh0YSA8c29oaWwubWVodGFAaW50ZWwuY29t
Pg0KPiBDYzogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiBD
YzogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiBDYzogbGludXgtaHdtb25A
dmdlci5rZXJuZWwub3JnDQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gQ2M6IFRv
bnkgTHVjayA8dG9ueS5sdWNrQGludGVsLmNvbT4NCj4gQ2M6IHg4NkBrZXJuZWwub3JnDQo+IENj
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9yZz4NCj4gQ2M6IEluZ28gTW9sbmFyIDxt
aW5nb0ByZWRoYXQuY29tPg0KPiBDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+DQo+
IENjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPg0KPiANCg0KRm9yIHYzLCBmZWVs
IGZyZWUgdG8gYWRkDQoNClJldmlld2VkLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlh
cnNrYUBpbnRlbC5jb20+DQoNClRoYW5rcw0KLUl3b25hDQoNCg==
