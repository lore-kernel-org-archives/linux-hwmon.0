Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9563CF68F;
	Fri, 16 Oct 2026 20:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181377; cv=fail; b=MuwKNiRzmmJuYxz117qh0djstve126qrLKc231URqyu1eVrm5ih60401bmRAJxN517tOzvuHMf36QxyQer8OiR75DSceRBxSykjluqejA2dZRY2ymZeAr0n+Jz494RK958dimy/NLQDbOPEISbRfC8MQKUAatcC4xXhJLk55ckE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181377; c=relaxed/simple;
	bh=PtQLYv7txgd0qtWnDEskWxLXjW4EVg+T6nK1lE8U+Q0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MRbiEVW5hSne3nwU6lsjVeowcYyt6IdvqvFMrfIHbu7kepGOm7Yd7MjwXWOjvCleJ12ZKJ/zVBZZLmeKIIMeZsK5cEKjNSZ5PNRgDBK50pLjJEqF3gPF1TlV6Xymu1g6KNMxLPVyh7/Q2I2aSNcHxvNO6wQh/J1svkFkVGHzN70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoVOpDAl; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoVOpDAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792181376; x=1823717376;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PtQLYv7txgd0qtWnDEskWxLXjW4EVg+T6nK1lE8U+Q0=;
  b=NoVOpDAleWNnAwer2Chq2gM6U1A758vUpeAsB75jRUyiEABDQkStvdTt
   ZrPRgg4VDp6IBJ2hefPfWgHU5nMvscT522orbHO/2H8OtVsuTQU6ztf61
   kAPnFu2PHrfrymh2nw5rpEtmdq+OE1cMcjYfI+DyZ6b/NdISNLP7UgrqK
   +ZfBY7R7p+fi6pAyp46wuftKSPjADsMoUtCSBQ8NrdXpS7JbHWMSKz6Kd
   n25vZdrpEXN8gicVCCvnkOv2kOEwlrrk9Ew4mYj1mewOMNANgdKaJV9cl
   eE27PtaJF7Jlk2PMcZJlKO7cVBmRTa3bTPfYjQmgpx1t8Fg2m1gICC/lX
   Q==;
X-CSE-ConnectionGUID: m5o1h+OJRSW1DmoNgYCTHw==
X-CSE-MsgGUID: cgksN4bgTLCqihMhSCuXAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="982769"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="982769"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:09:35 -0700
X-CSE-ConnectionGUID: DRIVL6VCT22Hg0yb+/gdfg==
X-CSE-MsgGUID: M4GqvveVTnaTJ04RP5XdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3801377"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:09:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:09:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 13:09:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpq6+nSb/9HKVz3QPU1x/8KinUNAUEvhKkyfXWxhwm+/A6wSYifsUpgOUYBLUSfPtf4unSaPGL/UU7lAnLMcKAQ8AyiEuri16jLacb+/j0xQoRepjqn6HWH4dqTPxfggq/pRV0SgEzpbjJkGuiYfS5ph7n8VG+oCH9AIWmC8/VRX6dp2+0A2C+Y3jF3Y4DkUI4tjooFNduwM1vPKxg5zw954sxgLPHpW1AtmyrhDHZ5xYnxXLB9986mNpHH8+aZLtDrxRbCjIwPMIeLtOWpXVwrRm1tMrcz9TxAg8+eYKYakgks3hMuYrHD419/bsdLK7G2KbVbmpfmuOAOTQ5Jjrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtQLYv7txgd0qtWnDEskWxLXjW4EVg+T6nK1lE8U+Q0=;
 b=yg4+jCLmeutVzT6UkHQSPZoVYBqn2jJXUq8NFApvaUJ6AcjdF0U4u6USlLkcXxL8TtzX/0kz7Fq0p/RK5FabnvPdTdcajoviCJP568BX0Zb0Ljy8V/lmO1UMY99l8PISv0UoTaXmf5Fr0qYZsgu4DFJaDdHPzkEkdpbqlfgqwUo/SIeFG5x07WV4oyb2NCE1xxYKDzBtHyg3hBTKUAtxyjo+OrSt9wKuDjtYp+uRu1SZFtDQZiD+OjqQRsJq32WqfMRb4GublKOLR1GQrz6iy9qbYREswio3GijhKNOt2mhJOAhjYpymsyexJ/emsLeFTK4bRk6QtkZyy50bl6rjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5336.namprd11.prod.outlook.com (2603:10b6:208:316::5)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 20:09:28 +0000
Received: from BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97]) by BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97%4]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 20:09:28 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3 3/6] peci: Add support for PECI CC 0x83 retry condition
Thread-Topic: [PATCH v3 3/6] peci: Add support for PECI CC 0x83 retry
 condition
Thread-Index: AQHdVwzA0WRu/mbKkE2KIAgKMfCcA7cApmSA
Date: Fri, 16 Oct 2026 20:09:28 +0000
Message-ID: <42f38dc38a17ac35f97f68cea58c2540e4727578.camel@intel.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
	 <20261008100623.7085-4-changhuang.liang@starfivetech.com>
In-Reply-To: <20261008100623.7085-4-changhuang.liang@starfivetech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5336:EE_|DS0PR11MB7529:EE_
x-ms-office365-filtering-correlation-id: 58989c91-c442-4b1f-cff5-08df2bc1624b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|18002099003|10067099003|22082099003|11063799006|261009223027099003|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info: AY/lEQu5sOwtPZaNOM5quSkAnRg5bwrp9PY8ymYcnTNtgyorM1epWOxFLN7LT75iS9joZl07iIq4CCcAqhOkXU27PS+RfS6TppNsw/iXe/Y/GAyeB5U3oUYAjG9UeVHgYtVj4Wyn+Duz4BBt/brb2TJRL2SBlDg97vE8+OVhjOo0RIs8/pbD6aTFGWQi2x7+royVURXq0IqdcQ4kj1foR0bUFdyydknk/c9gOdKkxJXRjHzUOqT6doevxF584hd9tmfK6k0CaRc3rUPqCyLlzLHeKfMY9rFR57sSXJlV3s3ngRqbW9W3nuGeSELULLh8n26L2mT0BUsmr+P5xnmpjZzSBSXu4rwafOgHewQ/IA1ROJQulTeioeYf23WHEt85Ar9tdj9fpGEzFrAKxJ3EKLCjg+w8H10sH3v/1t4XHX1Q+0oLwxALmMfpswYoRx97u2U/RxH6xxwJc5J7h0aVWppWMQm+jp4mqw8SNEVPMJqRsNRvz2hh1jQuWUTlL7M860jjhH6VSWzRbtvpZn42dflrdSdeOihJCuWsbAEcFysKCUb0v/pGtLJLduhLVmoFAFuit90XswtrPFhFBuw4o9sYfnItB0PLC+0CjtB34RJEScmW/cbcAtjHW+a+SQamtt5ZAPiW2JAhO7M/q3Za8ihSSAtzuCQ+XiSoeHd7WQsR+A1F8EsSPx6egQkecLeByu5lBpHNm/RcAu067YRGGKlm5rfh5se3OcSVig20AKI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5336.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(18002099003)(10067099003)(22082099003)(11063799006)(261009223027099003)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEdDc2FHeHppOWkxYUJRYWh6YzgyeFZqYkxJOE91YVJPL3F0Mm9ZVHcxNE5P?=
 =?utf-8?B?K1J3aVp6Ly9iNjN6bkJPajF2YWZyODQwejFnZ3pBNjd6aERiNStOVFZ2SUdx?=
 =?utf-8?B?VUlWL2NScXR0UTIyM0tuQWtmNHdGclQwQmppcFVrSDJidXNvMWJBaFNsKy9B?=
 =?utf-8?B?S1lXdzBUbjRUZHVxVGo4Y0UvdkErRXcvVVQvUisrVmNhRjBrSFk0OEwvZHdv?=
 =?utf-8?B?LzRTckhLYkVkQ3NoUTdUem1BcldOUCtQWWFTMGM4SC9qNmJ2Wjg5MW5tdzQ3?=
 =?utf-8?B?Ynd0bmkxdnpsaFBZd1pMd2JhMDc0YVcrSHdxaWlWMW00cHMwS1JXVmlLYmx1?=
 =?utf-8?B?aFUwUTR3VDJKRzd2VU9ESU9QcmFIYUI5UmNXWHRSdUQ0Z2tHaTkrVFZmRFla?=
 =?utf-8?B?Nk1rRXdLdmg4ZjFBMlhDU2UrQm9aNlZxMThRM0tMcWo1SWhzM0RDak4wTXBE?=
 =?utf-8?B?emExZ0VmRnR2MXB6TllCM0tjaHZlVGRXSU9qTUY5akZIRGhBeFpRRWNybDFs?=
 =?utf-8?B?WVFTb1diZEtZalhXVTV4cFlhWVNvUll1WmpjU1U2ZlBYZ2JkMWtsY2dIT0ZZ?=
 =?utf-8?B?eVVtQ1QxYk91Um1HMFRtMWlCWmxVdnVuY1BFRnVJT2haZGJBTnhPclpFUHpW?=
 =?utf-8?B?NkJjbFcxY0RMbnFLblRKWTBFK0V3VjFSYnZWZGd4SEVWYlRHNVdYUTBjbElh?=
 =?utf-8?B?aUZob0c2WjVpRjVDREMxamdDVzFmblhhdzd5Um1hT2NqZU4yZWJqZTJKbnN4?=
 =?utf-8?B?R0tiRmYzM1ZmT0RtTmVQZkV1a1hMdlUrK2VtWDNWVzBGM3UxQTFVSnI3eldy?=
 =?utf-8?B?VFo3cmRUU1RFWENLTVhPbnRhZmpmY2JEMGJDOGxSeEtwLzBuYWNIUWFSRVFh?=
 =?utf-8?B?RGtzNWlUUUdoaXBEREtvUW4rWWxLVWczSS9ES0FRTzJCYmVMMzF4Unpvb3VI?=
 =?utf-8?B?TThaZ1BxYmJWUEFRMi8rbU45bHdHOUlubUVHT1NRL0NkYUVRTVNjZU1lbmNY?=
 =?utf-8?B?QmdVLy9LbUFhemtKdFBHbzNXYWxXSnFaakdNTFJ1eU9FbnY5TjZwQ0dpWHdu?=
 =?utf-8?B?czVHQ2dsTHRSbEFTTmdXaVpuM1A5VTYreUJXdDRSa1ZBYld3dDdnNXNoRUNV?=
 =?utf-8?B?bGlUOUw4dkZ3dDArejloS1FYeHFwcWRTRktRMkJxdm10N243L3hnUlpMZGpR?=
 =?utf-8?B?RlJMM2lMSm1PVjlCVnNHaXcrd2NpVVgzL0NXelNFM0VRcnR6K1FXMEN6NjFj?=
 =?utf-8?B?KzZyYy9vN3YrZmJLNk4xNVh5b0pLZWNSdDRxbGpIZ0kydkxMaUtZQVNkMGp0?=
 =?utf-8?B?TWJxYnc3WTAza3U4V2RxKzgzd2VFZVJ6Tldvb0FzMWFhT2pmcE5KZitxeEdV?=
 =?utf-8?B?di9oR0hsQ2xGbzBKcVJ2MVV1Y2xGbGF1emx3M0t4SGxoTWZFUGZXNlI5Lzht?=
 =?utf-8?B?c1RMU0t1NkxaMUhoQXBBRkNENmo4bVNIVW5DOThESGZ1MDAveDFodjhXcVYv?=
 =?utf-8?B?akN3UkZYZnVZZWZjMmhuYWJFZmRvcUVVVW56NmkzZ1g1M3UweVBOclUwNTNk?=
 =?utf-8?B?NjZHR0xibkRKdEw5WXRVYzZhWkFmellXZUU4d21TYlhMZTdkMmN4ay91TERT?=
 =?utf-8?B?WGF5U2FNd2xrN1krWE1xL3dQWFp5VHUwaDlWcWNpOTlNeFlsdDAyalpjSUZD?=
 =?utf-8?B?c1RiSmg0cW5JKzcvVmtDZVdZYzlwbnRNc1NOTWx4L2JTNytaRU9Ecnc4cHBG?=
 =?utf-8?B?blpsMDBsQmM3U1dUVG54ZzZ6TEVRZGtEU3pWM2R0VlV0V2xyd1FPa2ZXczBp?=
 =?utf-8?B?QW8wM09QbFptRWZaWVdkTFFwaWJwWFErc2ZYd2RqRE9iNCtuU1RaWVAvcDBM?=
 =?utf-8?B?d2l5SnhBUmwwMFRyY3h0dVQ1bW5hemlqbVNxYnVNNW5teUh3MHAyWHNSTVFN?=
 =?utf-8?B?bmJva2FnQzNCU2tjejBYOFQzRHBsenU5MEVZVFQzNUpNZGNadjlPMWk4dFln?=
 =?utf-8?B?Q2s3d01QTk0zL1lvZUxlTloySFRkSHBLUE1ReXlGb21pT2lnU2ZGOWg4Z2or?=
 =?utf-8?B?b3BvQ3RFdUtpazZnbFdtUEFuNUZ4RFY0MXU3K1U0eHZ4d3UzZFJPK2IzNEhZ?=
 =?utf-8?B?dHM2Z3NYUE1ua1N5d0ZLOTR2cUFqNUxvR3VBM2hvb1RQS2lXMmt0a3E4NTFn?=
 =?utf-8?B?eFVBa1d2VVhRR1dSbnZEV3Y5d2I1ZDVjaUg0amJESlh6bHhTV1IyZXNHZ1ZO?=
 =?utf-8?B?SU15YmJib3NUZ3NQL2Q3ejlCS1c2UytTY201bzc4VVpRaXdZRGxITmhzTnI4?=
 =?utf-8?B?WkFBWFIyWURZdjNrQVFPeUpaa0hKOEYzcXNSdXgvNWh2TzZ6K2FSWlIxVjlQ?=
 =?utf-8?Q?hAGa15/U97lLhyes=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F22B3AE4A6E12D42A18EA7B5433DE6AD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qlPh1G8Jg5fg3UBBsUV/o4M7OM+nSmOuwHHBJSgZJe6PcAmdTqGfcQOROuHZjc/sfLi/ATVpoPJxabq+ZMsd76tPWLHyJdZgaGjAeWd+HZgSkbv/UJAZGriCDcnH4y6uZLfScUVH9G4ZOINWoowAiagY0Uuvrl2shyg3kWV5X+xnnAu3mDPVhUw/UTVhXXiyT1NDPz4Xs3xOHdmV28SjYcESuXFFA/EiOSU7oO1FlZE30Qqi5iJUBld76048r++vpChydnRPS/kDx2vDBKu2517fZPGtW12xzbEfXZ8jGg1EBrQxwSNeWUo7liV5Ud5m/D5ybDtXS0d6262oJQWSEA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5336.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58989c91-c442-4b1f-cff5-08df2bc1624b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 20:09:28.7240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpZtSu23cR63rV6D6lYKTkYtAMTx7D6A7HKk3DgLWI2t7xdlYEFuyyq2mpIT1U80kHYPppft+yQ2h7eAWOL12fZPgrnIOHf1rH08GiYRguk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDAzOjA2IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBTb21lIFBFQ0kgY2xpZW50IGRldmljZXMgbWF5IHJldHVybiBjb21wbGV0aW9uIGNvZGUg
MHg4MywgdGhpcw0KPiBjb21wbGV0aW9uIGNvZGUgbWVhbnMgdGhhdCBhIGNvbW1hbmQgcmVzcG9u
c2UgaXMgaW4gcHJvZ3Jlc3MsIHdoaWNoDQo+IGlzIG5vdCBjdXJyZW50bHkgaGFuZGxlZCBieSB0
aGUgZHJpdmVyLg0KPiANCj4gQWRkIFBFQ0lfQ0NfUkVTUF9JTl9QUk9HUkVTUyBkZWZpbml0aW9u
IGFuZCBtYXAgaXQgdG8gLUVBR0FJTiBzbyB0aGF0DQo+IHRoZSByZXF1ZXN0IHdpbGwgYmUgcmV0
cmllZCBhcHByb3ByaWF0ZWx5LCBzaW1pbGFyIHRvIG90aGVyIHJldHJ5YWJsZQ0KPiBjb21wbGV0
aW9uIGNvZGVzICgweDgwLCAweDgxLCAweDgyKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYW5n
aHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCg0KVGhh
bmtzDQotSXdvbmENCg0KPiAtLS0NCj4gwqBkcml2ZXJzL3BlY2kvcmVxdWVzdC5jIHwgMiArKw0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3BlY2kvcmVxdWVzdC5jIGIvZHJpdmVycy9wZWNpL3JlcXVlc3QuYw0KPiBpbmRleCBk
YjJjYzMwYTQyYTQuLmJmODBiZDIwNWU2MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9wZWNpL3Jl
cXVlc3QuYw0KPiArKysgYi9kcml2ZXJzL3BlY2kvcmVxdWVzdC5jDQo+IEBAIC03MSw2ICs3MSw3
IEBADQo+IMKgI2RlZmluZSBQRUNJX0NDX05FRURfUkVUUlkJCQkweDgwDQo+IMKgI2RlZmluZSBQ
RUNJX0NDX09VVF9PRl9SRVNPVVJDRQkJCTB4ODENCj4gwqAjZGVmaW5lIFBFQ0lfQ0NfVU5BVkFJ
TF9SRVNPVVJDRQkJMHg4Mg0KPiArI2RlZmluZSBQRUNJX0NDX1JFU1BfSU5fUFJPR1JFU1MJCTB4
ODMNCj4gwqAjZGVmaW5lIFBFQ0lfQ0NfSU5WQUxJRF9SRVEJCQkweDkwDQo+IMKgI2RlZmluZSBQ
RUNJX0NDX01DQV9FUlJPUgkJCTB4OTENCj4gwqAjZGVmaW5lIFBFQ0lfQ0NfQ0FUQVNUUk9QSElD
X01DQV9FUlJPUgkJMHg5Mw0KPiBAQCAtMTEyLDYgKzExMyw3IEBAIGludCBwZWNpX3JlcXVlc3Rf
c3RhdHVzKHN0cnVjdCBwZWNpX3JlcXVlc3QgKnJlcSkNCj4gwqAJY2FzZSBQRUNJX0NDX05FRURf
UkVUUlk6DQo+IMKgCWNhc2UgUEVDSV9DQ19PVVRfT0ZfUkVTT1VSQ0U6DQo+IMKgCWNhc2UgUEVD
SV9DQ19VTkFWQUlMX1JFU09VUkNFOg0KPiArCWNhc2UgUEVDSV9DQ19SRVNQX0lOX1BST0dSRVNT
Og0KPiDCoAkJcmV0dXJuIC1FQUdBSU47DQo+IMKgCWNhc2UgUEVDSV9DQ19JTlZBTElEX1JFUToN
Cj4gwqAJCXJldHVybiAtRUlOVkFMOw0K
