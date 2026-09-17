Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EDD3C2B92;
	Thu, 17 Sep 2026 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678087; cv=fail; b=pwD6qV6dxM6L9E7FcJxf1er/xCHGIkz6bdPuj/0S7fbTBjg16EP8ms4xN582UotNtxauaLzASqVV8FR/jboWcFDq6kziuUElKtqUTWRTausgQIj+tZ0YLDtf7sFUa6Q2JEwXG4BiY6EtESFilG7eaKosGPtAGee/VxD9S1oJWF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678087; c=relaxed/simple;
	bh=pgEEKxNrVbl25TwbQIdLewzzCzkJzgMjHV3Fd61WGgE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HeL4ur2KD4OnKquN1dLGoPQ1QkkK+fFlBoYgPDfzLRHmXZfrJionLN/zF0Y6TRBDP3lcFLcFoBe+7/mRv79rgJonBepNQFDzc3zd1da+PMrT/6hCM7wC3GFMrliEY76jUGmy6HIdhoPIa/r49sABz8QppuphQL8dm2MemZoVi7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiKLu8tr; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiKLu8tr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789678085; x=1821214085;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pgEEKxNrVbl25TwbQIdLewzzCzkJzgMjHV3Fd61WGgE=;
  b=FiKLu8trCXsIOXv46XgnJ6uNZcRhX/tEmyYid1lZa8unZ0AxcbLa+qty
   wQJvvThiUn6uveJgFzQZGNBgtzY7UdgN7g1qE4QliJVgi6ilheql6Nehy
   lUO73z6DBxjyyipOVDG33/KwzG3CyIERTgXHAKFUjZtQdU0Mcn8AYCgot
   quYeVgTG9s5ijAcTmnpHco/BCrkgcFgHvPdC0Aa4Pz2w1r0YalCg/zwyT
   z9k/AlkxNXNVLHMXYZgJDp7V3gHPiJbakO6O2mvOuWFUKVM4qO2e9GPvS
   26pLbInOordoy2cQnOMjRYx33l7IS0E4mpRvXVgigvCYx/sq1l9TOYsZq
   g==;
X-CSE-ConnectionGUID: sMHOCgekS9+lH5EwZ0idjg==
X-CSE-MsgGUID: QDoZ+Sn7TmyYYbn+s3j1yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100805717"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100805717"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:48:05 -0700
X-CSE-ConnectionGUID: 2UEUh3xOTAme/w2mgNy1xQ==
X-CSE-MsgGUID: BynSX2oJQgGVayF7HQljRg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:48:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:48:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 13:48:04 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:48:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/ZoZZIMG1Evf0SjBb7O6vsNbQmV9nuddWYo1JCfs2zpUS6lDvRvN7VeczWAr4QSoxduCyvXI0ddxlSbuTT0aF7oi4zQHEUOpAs2p51491RxkcVhmmZYoyjcEutETpqwg8gLUbvZntBdcXsryw48Z3F7hdS/PwpkB+eeUtJlj4PE27nlNK3+wzszr729LqnbwGmgfMY5OxaSxvzBb5vcRqsLV87rIKQQ0pU+gWSO96TJocYNM9+GW+bOxyPpx0cBEDGlPUBxWZ+g+Yzpp5Yp8B+6KoChFsB6R/wcbHYbe5fmafA7+f512QsEX3F9A9NX6I3jqDdzuP80/4wWCgKrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgEEKxNrVbl25TwbQIdLewzzCzkJzgMjHV3Fd61WGgE=;
 b=Bwrsroa/wKxW1Ad0v1UnF2wkEyezzofMUwAgvLQ8kmdr+cSELLIp06bmq1+Gjc6XNSkO2ttTou7FDxShGvYnc5JKKq7+SALauor5x4c71c58nuNMpGojeJlXLd3w+WvMFfSX5H0bLJ9CQTcsAOzzZ589SHzqeXW+xgE3bPp/32H2CNA3EyEUcSoyF9R9+6BtiOM6v7NPL9GiLb6/Ogsajoz2FRbKCpfE36F/Ys4pKsJIUv0L928hQTSCTCXrNtnIZQg/a21gtbaNC3wSM5i/as8LWConBVfl6Elo+O+f96VyoESofBzchZgp9pfxEUKfIE4fICTupX2dukRLgfm4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:47:59 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 20:47:59 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/6] peci: Add support for PECI CC 0x83 retry condition
Thread-Topic: [PATCH v1 3/6] peci: Add support for PECI CC 0x83 retry
 condition
Thread-Index: AQHdO6kkoI12wGsC9k6v+VgYUVb5mrbTVE8A
Date: Thu, 17 Sep 2026 20:47:59 +0000
Message-ID: <47a9f001f9c0f9e2be2254289c5ba3f7d64cef05.camel@intel.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
	 <20260903133408.110847-4-changhuang.liang@starfivetech.com>
In-Reply-To: <20260903133408.110847-4-changhuang.liang@starfivetech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|DM6PR11MB4673:EE_
x-ms-office365-filtering-correlation-id: 972d85cb-0668-4de8-bbdd-08df14fcf5b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: qq5JXf1eE6E4d+hLgqo5LvAJJeJ2xMbsGZCKf204ELVqWOcCfDVJbs4dqPme7eg0/u5bFkWPwpH2DeX4WtDgKUXhBPyKHVjIfAcigpoojj6PKpz3wcuPRNEKAgK2k7o9ig3tzCOj5T1Mjtf97fJ8IZXONJ56athuFr8zcV33btqcLsmvYwLoS13Y2AUiwnNNfYhvwpELUqCLldOcsRXv9vJRNKm6XexGFjBVqxxn9wSBRKgkBn10OVsf5NrKWvdtfJWT5Y14PgKUgHFdKSh72/RbU1cRYJG/D/4ogd3G+HGlz7NDuJ2Y66rfrEUECo8HW9NJeuWKviN8pbTqbkKC1W+ekypa5PKjYHrM8BKHYMjnShCr73fhbxO6a0NLNbCqA2JBVSPcKmpFUecKJFzMcx4LIdJcmWVXQEA3jUMQXu1yLSZKyWiWRp/xhB6rgDHTSM4NeDRiMxT7VE2DL/u+JEvQNEWV1Y6dLmlJFhP5VfK3TsOufXXqPII5wtG2NTFNJGN1vTw2vnjjWBZDa9dW0iW1UuX+4wgZogWtk/WtLxOF5gKrCUiIJ80eWvBnBiVy/X7Xaz7K5itATghBFGrMhpl0JsKs9ARAWE+6VO0Eyb0pGXORv2g2j++KqglIEylOcUe0w1ZhZwZ+p9gfkPRz+tDoMIEV0RQtqjD+OKMMHL4YCK9kYsQTjlzQMaYEi3mCqcwm/1BKYk34anY3TpPrbXWS1Y89/Qepnt/dmt3tV4I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEI0SlUzdlhsU1Q5R1hIRW1vL0tpbGJsMGh6SFIrOVNESFYwa3QwL1NLL21r?=
 =?utf-8?B?TnU2dVJYR25WSmVkT3VKWWt2SFIrcmZpMDY2UmM0QkhtYW0vZC95c0ZQelVv?=
 =?utf-8?B?aThiMVZjYjdFTlo0WVpaUkZOK3JKSzIwdmlnVXdsM0VEbGthNnBYRnRRcm5L?=
 =?utf-8?B?OEltakRhYjJ5dkQwUmtmUmVGV2k2dGhka0hBTitEL05sSkNibnE1ZUpER0Z3?=
 =?utf-8?B?Ti91ZkU5YituMjNKak05YWVKb3JvVi8wZjhLS1ZuU0dieXQ1YkFManYybW1k?=
 =?utf-8?B?ZHJXdENNV3J5bzJCVnFtd1JjUXNaS1YxbW1ScW9JeFhXc0NJLzlaYmRTYmtW?=
 =?utf-8?B?QlE3VEhpQlJuQ05qeTlEUEw2cnVmYkhsYmxNdzI5bHcxWDdFQlRscXFDeWtr?=
 =?utf-8?B?bUc2Y0pYbitUcVpseWxacXkyYXpBWEtvWjVwWTBFRlE4VHBRZEZYVVdHN3VQ?=
 =?utf-8?B?VGFGbnpZQWY0VlUxQ2ZsdHRMbFdNU3J0c29RQmdmaUpkaHZjQ1l0d055aEdX?=
 =?utf-8?B?RFM1dzhGeFZtMG45eUxMQjJnOGZEd2dtWG14OTNrV0RFbHZjTy8vVjh0RjRM?=
 =?utf-8?B?RXVMcmhxVGwyOHpNdnhTaUFtS0FFcUNQRXAyNk8zM3R1K0s5Y3lTUmZCdHdm?=
 =?utf-8?B?aEtUS0VPZWxXRE9CMkZvbFpIbytqN0h1MnVqc3ZsVHJiWW1NbE9Jc2grZ3JG?=
 =?utf-8?B?VUxKYkVkVTlwaDRSajdPcEV3dGVRa0lDTlJDNkFTdng1c2pxTnd4NEd3Yjlw?=
 =?utf-8?B?dXIxUlhaSVlxOTlQZUlFSFIydWJGZzQ4enhCVW5aZ3IwRnZoc2dZRU5ZUUhS?=
 =?utf-8?B?bm1NUU1ZbGVBMXhxb1hpeERnWkNUYkZhQjcyRmtBcXNrYWU1V0FEZmFDMmEw?=
 =?utf-8?B?bktZV1g2eTE3ZUdqb3YvRC9LVk4zS0poZ2o1Vk81MW1keGMzMkw2dDVjK2NX?=
 =?utf-8?B?bURxMCtIbUdZcHl1T05wSkt6WGZzcUpCMS95Yk92TDdDZURQR3JyazFHVk5y?=
 =?utf-8?B?bHRVWVJGaTlna0Eyd1VZUUxnS3E3Sk1HZWFFeXp3NDRMTFZiaXc3dGdINXo5?=
 =?utf-8?B?U2ozUGVGRG1aaDdNTXFMNzluN2YyYTJTeCtQaXUyMWNWNTZMMysvNlF3SnhF?=
 =?utf-8?B?dHlNYXR1UTUyV01kSVQ2TzRIUitxK1pSZEtrUWNtY3lyYjBJTWpLbWtoL0tr?=
 =?utf-8?B?STdNRG9YUnJhaitBUUpGdWR6NlRUbEUxeWFzbERqcnR6WmIzeEpUWjFrYUt3?=
 =?utf-8?B?STg1ZmZlZWw0bzNaWTAvNzg5SkpKcW5ZUFZJS1E0Z1puSmZwaWhmUTNydmYw?=
 =?utf-8?B?R2ZxWXVOcVhtSmtXbGFEdFZ0M0lnMHZsWnFBM3ZLakw1ZnpCTVJOUi9jNFZV?=
 =?utf-8?B?bEhSc2RBdVBmR0FQeHM2bkZKK0JMalZ6bTc1czBaYjZZaUt2WXY2eWViMjky?=
 =?utf-8?B?cjJxb1I3L1hWRjEvQjhlb1hyclY5QzczbGd6L245dVQ3RU5NcUNnRTRmK3dM?=
 =?utf-8?B?TFdFb3U0OG50SE9LSDFOY2RPK1N6VnpJNTVjVWdTMFVCR3JSL0tQSHc4MTZx?=
 =?utf-8?B?dGtMd3h2V01HaEMwdGhyS3NQWmNTTEdLTkZhcGpNL1NOYWZudmsrR0xtclRx?=
 =?utf-8?B?ZlZDUnJnK0F5OUdHUFRxcmpjdm8zTmRoSlBBTmhZUFpuK1BDTXloaTlXK2V2?=
 =?utf-8?B?N25ZeE9PcVlEWGV1VTh2UlNZYUh0MEVkK3l3SDlFY29VOTdSQVZOTWVLUGZh?=
 =?utf-8?B?M254VGVVZEp0OEJRTTlJMHo2YmZVSmdBWlRqSFc2cXQzK3N2MHhrZ3NjVUJn?=
 =?utf-8?B?ZXcyMFBVN2VZRzN3U0ErbW5KYjF0cjB4NXZOQ3NKcnFqL2VZYWJYSlZXOGwz?=
 =?utf-8?B?bm0zNFFmUEhlL3dVYkZSelZKOENYSFdGZ3lrbXk3S2lsMGdBL0U1U2g0c3lD?=
 =?utf-8?B?RmpFYVladjJJY1lZM3cxUy9BbXpEREFwb1dCZmhrZ3NLd2k3c1JEdmN3YnBu?=
 =?utf-8?B?YUp3KzhwRHJTRkNsa3UrMVNTK1VWMk1xaVY2WkhVM1F1Z050MVdLL2lLRCtX?=
 =?utf-8?B?cUZIWHEyRkREQU5EN0VrSHowYm5NSk02ZEdUWnFoVFhXR05KaWpucEtkRWxH?=
 =?utf-8?B?WEVNUDBGVm56ZVUrN0ZRejMwNFNrL0wwT3V1S3RSNVlIM2pIc1grZUwyVnRr?=
 =?utf-8?B?YjRRVzlKeEpNWnJ3ZmV1bkVOeVVnUVBLVnBUSUdWZllUNTNqODcyRXBVZld1?=
 =?utf-8?B?TzJoSkIvb1ZVdDBKY1F3aEw5Y0xYZ09qemVBcDA5SW1GeUZhYkpTZGNsSGdW?=
 =?utf-8?B?YTA3a2VlVld5OFlDZHJ6Z3BTMk0ya2tUcERKaHVJdmNudWFqOERLcUdzbUNP?=
 =?utf-8?Q?jYevnububc/8ElNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB03A84FDF420C46B7CA45E40298796A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zVwKxi91phDWjgj7PrZST/zyTJ8zm7z0YOOD1tIguA7KViJpQUMV4NYo0NofwG8NaALp+0A2hrRp3c7kpSsRMLlDcHoWIl55YHC2qUwK3ZUfft6oCwdt2IA7x93oXV7OQFed8pDvCCh4GlHvPSZ/8Vte+yldbwgJAi+nvfTws/PhwvFNDcRb8lWC1uKI2IzMDVbPktS+dzayua6eIJtkDxsTewN0uCSWrU5BNG380Hlss6Iwta2PB/Rm7XARnlUHX8teSfl4ii/sZHQV4qEScacDg/wnt5eOs5o7IGkdzg/LGpaPXLH8IWpPykMBRC5bh2JI7lIIHdloYGIdfn9Xzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972d85cb-0668-4de8-bbdd-08df14fcf5b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 20:47:59.6302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GF91lU8KzlBmHjvnnQb0FDg1iiOaDnIGIg9VXUR10+ofxEEnRmQTEL1uh5nv75+OztkLyJcj/s+cgy+Gv7cDbXLbUwY0/xucD2OUSa6BgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTAzIGF0IDA2OjM0IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBTb21lIFBFQ0kgY2xpZW50IGRldmljZXMgbWF5IHJldHVybiBjb21wbGV0aW9uIGNvZGUg
MHg4MyAoQ01EX1RJTUVPVVQpDQo+IHVuZGVyIGNlcnRhaW4gY29uZGl0aW9ucywgd2hpY2ggaXMg
bm90IGN1cnJlbnRseSBoYW5kbGVkIGJ5IHRoZSBkcml2ZXIuDQoNClRoaXMgY29tcGxldGlvbiBj
b2RlIG1lYW5zIHRoYXQgYSBjb21tYW5kIHJlc3BvbnNlIGlzIGluIHByb2dyZXNzLg0KSXQgd2Fz
bid0IGRlZmluZWQgb24gb2xkZXIgcGxhdGZvcm1zLg0KDQo+IA0KPiBBZGQgUEVDSV9DQ19DTURf
VElNRU9VVCBkZWZpbml0aW9uIGFuZCBtYXAgaXQgdG8gLUVBR0FJTiBzbyB0aGF0IHRoZQ0KDQpU
aGUgZGVmaW5pdGlvbiBuYW1lIHNob3VsZCBiZSBtb3JlIHJlbGF0ZWQgdG8gdGhlIGV4YWN0IEND
IG1lYW5pbmcsIGUuZy4NClBFQ0lfQ0NfUkVTUF9JTl9QUk9HUkVTUz8NCg0KVGhhbmtzDQotSXdv
bmENCg0KPiByZXF1ZXN0IHdpbGwgYmUgcmV0cmllZCBhcHByb3ByaWF0ZWx5LCBzaW1pbGFyIHRv
IG90aGVyIHJldHJ5YWJsZQ0KPiBjb21wbGV0aW9uIGNvZGVzICgweDgwLCAweDgxLCAweDgyKS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdA
c3RhcmZpdmV0ZWNoLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9wZWNpL3JlcXVlc3QuYyB8IDIg
KysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wZWNpL3JlcXVlc3QuYyBiL2RyaXZlcnMvcGVjaS9yZXF1ZXN0LmMNCj4gaW5k
ZXggZGIyY2MzMGE0MmE0Li4yYmY4YjZhMjU1ZDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGVj
aS9yZXF1ZXN0LmMNCj4gKysrIGIvZHJpdmVycy9wZWNpL3JlcXVlc3QuYw0KPiBAQCAtNzEsNiAr
NzEsNyBAQA0KPiDCoCNkZWZpbmUgUEVDSV9DQ19ORUVEX1JFVFJZCQkJMHg4MA0KPiDCoCNkZWZp
bmUgUEVDSV9DQ19PVVRfT0ZfUkVTT1VSQ0UJCQkweDgxDQo+IMKgI2RlZmluZSBQRUNJX0NDX1VO
QVZBSUxfUkVTT1VSQ0UJCTB4ODINCj4gKyNkZWZpbmUgUEVDSV9DQ19DTURfVElNRU9VVAkJCTB4
ODMNCj4gwqAjZGVmaW5lIFBFQ0lfQ0NfSU5WQUxJRF9SRVEJCQkweDkwDQo+IMKgI2RlZmluZSBQ
RUNJX0NDX01DQV9FUlJPUgkJCTB4OTENCj4gwqAjZGVmaW5lIFBFQ0lfQ0NfQ0FUQVNUUk9QSElD
X01DQV9FUlJPUgkJMHg5Mw0KPiBAQCAtMTEyLDYgKzExMyw3IEBAIGludCBwZWNpX3JlcXVlc3Rf
c3RhdHVzKHN0cnVjdCBwZWNpX3JlcXVlc3QgKnJlcSkNCj4gwqAJY2FzZSBQRUNJX0NDX05FRURf
UkVUUlk6DQo+IMKgCWNhc2UgUEVDSV9DQ19PVVRfT0ZfUkVTT1VSQ0U6DQo+IMKgCWNhc2UgUEVD
SV9DQ19VTkFWQUlMX1JFU09VUkNFOg0KPiArCWNhc2UgUEVDSV9DQ19DTURfVElNRU9VVDoNCj4g
wqAJCXJldHVybiAtRUFHQUlOOw0KPiDCoAljYXNlIFBFQ0lfQ0NfSU5WQUxJRF9SRVE6DQo+IMKg
CQlyZXR1cm4gLUVJTlZBTDsNCg==
