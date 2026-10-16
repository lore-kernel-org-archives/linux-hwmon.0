Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A03D34B3;
	Fri, 16 Oct 2026 20:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181395; cv=fail; b=irHYKY2H1mUkNiBUrANEo/YocZpktctzA+aRP5ZVyehgXS8AMUqKqSVjGL2ohA+ZtgJXmCWMkcTIJEyV9BVRYnd6j2QGHjf+p9xuH3iHZYoGGZU+HwvP0Tbw5anz/UMQL18CgbVlShZ/QtEyfdAvY2DDlS+RLYlt/E8/Lrn/JX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181395; c=relaxed/simple;
	bh=JlNtAvD81HWjZBz3WCtFH89wgf/yEmadZ5FCRmI25dI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fgcxbw0ruQ8w+DahbuWGtQ65Pq3TbcePR5RBv4BToLoBUlYUr8XOOAxoKskWmsbUHdHCoDiijtHkhHWUeGJ8jfY8+XWUoxHB/hxuh/mwYZ9ZsYBabTn/8L9KoT7llZfvQgDQoIvJ6jdNNEaQ43LZDLiIUG22xAQrZTj96tr4Yt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIUsSJ8M; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIUsSJ8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792181395; x=1823717395;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JlNtAvD81HWjZBz3WCtFH89wgf/yEmadZ5FCRmI25dI=;
  b=eIUsSJ8M7MOBc0foa/Pre3XefuxAUSQbXjdwwsQ7WfLZK4TYXaiS2O8W
   FPdm22he6iHJVFETS+OybgtehgDn6GYppkkd2qiGPsV+uovd3GiC5zpUH
   PC9+ogWFHG5boVBhSh8czBIopux2i5N8mjiPQj3YQCfhCXb0tObeBClZU
   /HSHQzf0YjRSoIbE1sxYEDKkfIchfYcXKFn1d60e2EkazsoB36xvtOE8I
   fwZ0wrZEO9VELeBD1h+wIERUXU9TQhVecvUcIKzeP/gAmF5qZdw6yCIRm
   9sfeFRop981bi6lijNMwAsfArDuv19ewnXTmQ9N7QGGKubquWhKZ3gtj2
   g==;
X-CSE-ConnectionGUID: mco1rLmyQ/O1UlYBRgHIxg==
X-CSE-MsgGUID: 5vVMcmCmRdqZ53Elx+Kqlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="982832"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="982832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:09:54 -0700
X-CSE-ConnectionGUID: o9LdWAYKSXmdOOFtBVFhZA==
X-CSE-MsgGUID: WFiN2b+URcCsct47jVrS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1909926"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:09:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:09:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 13:09:52 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xocvbohl81jNTD/LZdmhuwVfG1M746r08OYGVB0xzjQzt5sKQ3rVJovvyRcriHsgbOjSZPZRCGAZt5FN16YAmcNeyDA6N7i7W52ZKvUWHomuIPsD2dRU4hZK00QJ6EMNgvU6VxUohBN6Uqwjs/suOlTfB7WJXJ+PyHOxwlIQuSLiB0+asti2WPIbtUI7NDnVqb0CxTBfya3/Nn1Z3lKmeX/A2zQ7GBpP2bnfJ7+zW6/Ewqd1R0gvwV1AIEL+hVlovRRvzj3XFZfbgbpQLJoTf99snN6S1n9x1HvxbfriHUQnSoHmaS2QQWwWes6i0mEflEKz00H8PvsGmD4soPwxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlNtAvD81HWjZBz3WCtFH89wgf/yEmadZ5FCRmI25dI=;
 b=drmwIraJWSVkr5QPNxcv1L7f4q56QA+SAaBEScM4SwX9P0QwrSRT5ctkNhl19Yi076qOAKGilcch/cQyJz9cTOQ78riFEfRvRPQF+uhniaM/H2OnvraT2nTLPUqoeDGgZu64DTzuXEThXYur/JdfGQ7d9KOr1DJ1WLebe9rzuyZx/X8fnxXURKkA3G8XZh0RpqMoUVEvPIs3/J6JBI1Ec+1zBCA1APvPoZXbZqI87BFHKTBq7rcaVMP70tVNSw0GZDzUCqSiSP2RTnPc/pVuMghwPZzEGWlb5Cv67XIqBUIqC93xQyro8DUAY/0IXwKJXr2WrRef2DLqYQhi2DkSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5336.namprd11.prod.outlook.com (2603:10b6:208:316::5)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 20:09:49 +0000
Received: from BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97]) by BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97%4]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 20:09:49 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3 4/6] peci: cpu: Add Intel Granite Rapids support
Thread-Topic: [PATCH v3 4/6] peci: cpu: Add Intel Granite Rapids support
Thread-Index: AQHdVwzCBLhXMB9/6kKNFTeGM2U5ZbcApn0A
Date: Fri, 16 Oct 2026 20:09:49 +0000
Message-ID: <b90b7be3a63f85347e0e230f0f4e1df6725f82c0.camel@intel.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
	 <20261008100623.7085-5-changhuang.liang@starfivetech.com>
In-Reply-To: <20261008100623.7085-5-changhuang.liang@starfivetech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5336:EE_|DS0PR11MB7529:EE_
x-ms-office365-filtering-correlation-id: 5ede96bf-0af8-421a-545f-08df2bc16e9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|18002099003|10067099003|22082099003|11063799006|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info: RPK303br6Yp7tTBFBhlgA1KZx5WI5RQwU23vy6DwaxZrISNOkwkV29dghcsE6fCGwVv+qJ/EGBEzla/aWX/FziF6MVnpeIqPsDQJqz262W8q240+dxj0xWwP2OjEkyUUK14FFTLwvQD9gxNEOaT3vln2rFfNaMDmhVAI7pObGwu7cOg5a8GNuKI571WgSnup9roaEsSV4IVQovda0TpHqJNEmChBzAq6G53CiwnH1SMSF3hAbziOa/lu8dsri6TAv/MlZkTAk53Mr2bOm0DXz9Vav4S+kqs8hTrHOB6DXeBClZYAupetq7W38j5+JWQ+lFh8YqZdJmZrLz9jXpnWE5Pvth9M7EwYNOxYbevDoaDwueEDE9xmw1YpyO8zs2w5hkrsQc/EJkSYfcqU7Vlf39z3VKaSGWyURq3jIeniI7jFdJ+zKiNUeoYMituNRPnc7TXs1u8Xk6sNvcD7FGabagP/bTnRzmvW5dYpFeNi2rjQDFIchoCi5gg4wGuzesW6he4FCKJJ26xBDv4TXTPCHEQ9Xb/XWvfHk5yIRG4O3HLeEAQOn6q+WQ640iUvKsES5DJXKEuX+44QWTXZ7oSLWrbQtTNb7p0zmmHyKwsCjw0AF8Y7FrZ/qPipVoaEyz9LxLx/3bmZR4SEEfRTWJZqjCQr0uftobxF3z8i5IeYltXP73DHLe9nT9uB22bl1fJXiOXaEPjVaZo1J6yjeIXd6aqSAogyGAF7Z8t2LaVD8W4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5336.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3doak50N1p6L2kzQ2NENVBrTlR4N0d0NWpFR0Q5VWFlR3ZiQ3JaZUVzZlJn?=
 =?utf-8?B?b3E4YUZhb2U2SDljZTFuWnc2WEc1NjhzM2JwaVExamxoWThkQm5nUEtWRjJO?=
 =?utf-8?B?L0NFUEtMMWhRUzNvYXlaaGtldWQyeFA1MUFxTEthcjQxVVhYd0pvSWxraDVS?=
 =?utf-8?B?ZTFheTBzdDBaMWNWbzVmSnI4Y0dWZ0ptTnZ1VFZXWm1IdTNCaUxWYm42cjBn?=
 =?utf-8?B?emJ0NFNLODdJTzhZWStXTUdXS1FxSGdQOUNKVm5aVHdhbGpWTmFsVW1qYlcv?=
 =?utf-8?B?WW9ITStuMmZsMWhoU2daZ1BwdDM4Q3Yvbm1jUDZORjNiUnZKNzk4VU05N0hS?=
 =?utf-8?B?WERQZUVQa044dHJLc0pPdStoN3g3Z2FQbXZ5RUhaTXhYQjFQSVZ3ZEx6TkUy?=
 =?utf-8?B?MWV6d0kwR1h2K2ttK0xGNmZDdzF6SkFwOGlmdGQyVDA0REcwQzFzaTRzZ0FY?=
 =?utf-8?B?UWdSQ0NBRXlTRm52RE9VQ2EvTzZHS3FkMVdtemxIUXpBNzF4enZHb0pKakFD?=
 =?utf-8?B?S2RPdktueVgrR1ZxWG1SWC94Y2IwTTdhMHZCMU1BL05qd1kyYm1xY2x6ZW9G?=
 =?utf-8?B?cDJWdVI2MmZzWlRTVUJ4RjV5ZXpiOERnQ2FvbFljT3hCUmgrajdiS3ptNTlU?=
 =?utf-8?B?dzZGOHFtbkNHcUZqTFNwcnFjb2VoSlBLRGJEV01kdmtVdkRZeUlOaE5XcEdT?=
 =?utf-8?B?OUFoQ0VKZnk4RDhpOXNTL2krbU5rSUZqYUIxYUczbUhwZUhiNVRETHZlK3Mw?=
 =?utf-8?B?M1lWRVJXalVNZTZRT0NJSzVCRkdJVWJsSlJQYk1EUy9SUEpFdW95YUtVQlV5?=
 =?utf-8?B?RnoxKzBTazBhUE9hbUo1M3JWVldrR2xwL3FhbC9Jbjd2STdidW50cTVzRnZy?=
 =?utf-8?B?ZDhGYlBYY0FoM0h4cnA1OXJ1aysyS0REVEhxWGFIZ1NLTWFOQVpIVWRXQ2FJ?=
 =?utf-8?B?N1J5SE4ySGJiZjQvenltTXpUYW12dEcyS24vemxmcEtDbElQenV6TS9YSXpH?=
 =?utf-8?B?anZnc203RmpzTUlKOVlQeUdPR051ZnlRZVZ3WElDcEkyMG1FSjJCMFNIYTlC?=
 =?utf-8?B?aDVDRXIxamFmVkE0VnV1ck50c2hFUDBHVmpVbXM1M1BRQml3b2dXaEpwaDV1?=
 =?utf-8?B?WlNHbFpSQTlXRm0xd0daQVMweGZheDM5eHczaitjWmtYZEpLeERVUXZFMjgz?=
 =?utf-8?B?ekgrZllEVDVaM0s0VElKeFRoVVcrdnlLVWNrQ1B4N2hzMVhWTE92dzVzQXhL?=
 =?utf-8?B?ZFpTZU9xYWRXbGFrd2RGZGNkQWhJNlMrU3lJZHJEMVlKbVlmTXFRc3VVYXY2?=
 =?utf-8?B?SW9xOERuWVNGWEUxQnJHeGVSVjVhRytDTTlrZzlVbi9xNnNpVEorZW96R1hv?=
 =?utf-8?B?S1lZQVU5a1JER09DbncxNUNSNmxFaEx3YXdiNmRmZEs2bzFMcUx2bTB1aGQw?=
 =?utf-8?B?ZDBzSThJdElFUThXSXBQVnhLeWxuNVhYemgzN2srcitaZGlYWSt6YVZzdGtt?=
 =?utf-8?B?RHRpelhqQisxaEpvc2xUd3ppWmlIa1lkbjd2WGdjQjYwa0xPUGRVOGtNMlIr?=
 =?utf-8?B?YUR0aU90TXN2QzNUOC83YlFCL1RNREV6cFZmakJ4R0E3ZVA4ZmJvNXU0V2Fj?=
 =?utf-8?B?cllralZWbnVnV2pRRkVZN3JvNlc4UmRvbFBoK2R6TmNYSFNrS2lYbHorenor?=
 =?utf-8?B?a0w5NUNrR2JpZDRucDFYQjBhS0t6LzZpalA2NWlXMzJLMkovNXhDb1BlN3dj?=
 =?utf-8?B?dFJpdGlvb01OS0twS2ZFdGJXVXA5SnovVkxKcFNnc1Y2RnZFaUlkM1VNalE3?=
 =?utf-8?B?N1RPYmI4aTJZYThDazc0TXlNSHhLT1FlWFQ3SEdTdWhHRDJuaDZPamcwU3ox?=
 =?utf-8?B?YjBrSHpZeDF0MEFRUG1GUHhGU2RReVBwQms1Vjg1azUyTDYvNkFBSEZhRUVu?=
 =?utf-8?B?K3o0bDhqUHNFUTVEK1JzRkNWUWhrWWVjVWxmYnpDYXZnTEtsL3FaTzVRb0Vj?=
 =?utf-8?B?UUxFVnRKenpkVW9zaGdHMWQxVXNCMkxScUdvTHI0MWtFU2wwb0xpdVNxbWgz?=
 =?utf-8?B?c0hwRmQxdXczMHhqaDBsQjdRaTZ5bFkxSFJUZm5vRVNGd0xSU1BjTFU0SlA5?=
 =?utf-8?B?QVVjRDMrWk4raldoKzhyKzJLeWdLSlpwbjRPdGtzQUFVckR2OXlkSlRxNGUz?=
 =?utf-8?B?ZmJkd2NWVTdLUDNKVlptZkVuWnpScmt6YXFhSzBVTFlGa0FOMWhuZEVaOGE1?=
 =?utf-8?B?WTY5RERadk1BWG9xWENWcDRySkxBT3FyTGpTU2gwQ2JzcnQyR0Z0b1lkd21D?=
 =?utf-8?B?NHAzMDNMcXFBc3dHMExrYlNKZlVPSm5KRVNaT0JCM2pyTUJjbEpUQld2bmpv?=
 =?utf-8?Q?m1kj4n3gKMKU1qPo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <559F7CAA103D5744AB018E0867D34BC7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zoq6Wo/RF3D+9xW6p54WgVL7OKHZVPRK+uLG/TS5CaBCt+6jUcRqo5qYSXakfWbRcglEziX40U7IwXep7ZaBWRccccxoL2MdzA1K3B4Q+TJVz3w5JfakseRy8f3EdKzoXggiOnS56Xg9Whxhrb1Ar50ymzGVuF328hV0v5wH2zOhE0sn35unhvQoaxNOlXoMPud2mcxVDhWLQoStj82bh78l3j2JF3qsBthYvbnlRuOm8OumIcvWePloE7XJM7I8YadQJNwowi5F75HKSpn6f67ccZFx5d2cGI+aoEG37W3Pa2q1zus22XvPfBgo4VN/rCuz/DrUiG9lQ6CilOlE+Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5336.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ede96bf-0af8-421a-545f-08df2bc16e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 20:09:49.4133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpukoNxYSRRfzNBoD5BDa4Y8YNctukP0YkbJ7SNDBJO0d/AZnKyebxZgk4heKagK9N35CpdAflaj1xUVPISP60w28Uq/JV4aX5SfdJcFdvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDAzOjA2IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBBZGQgc3VwcG9ydCBmb3IgZGV0ZWN0aW9uIG9mIEludGVsIEdyYW5pdGUgUmFwaWRzIHBy
b2Nlc3NvciBiYXNlZCBvbg0KPiBDUFUgbW9kZWwuDQo+IA0KPiBHcmFuaXRlIFJhcGlkcyBwcm9j
ZXNzb3JzIHdpdGggdGhlIG1vZGVsIHNldCB0byBJTlRFTF9HUkFOSVRFUkFQSURTX1guDQo+IFRo
ZSBkYXRhIGZpZWxkIGZvciB0aGlzIGVudHJ5IGlzICJnbnIiLg0KPiANCj4gVGVzdGVkIG9uIEpI
QjEwMCBCTUMgd2l0aCBJbnRlbCBHcmFuaXRlIFJhcGlkcyBwcm9jZXNzb3JzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRl
Y2guY29tPg0KDQpSZXZpZXdlZC1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FA
aW50ZWwuY29tPg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvcGVjaS9j
cHUuYyB8IDQgKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvY3B1LmMgYi9kcml2ZXJzL3BlY2kvY3B1LmMNCj4g
aW5kZXggYzlmYzA2YzlmZjUzLi5hYmYwMDQ2Mzc5NDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
cGVjaS9jcHUuYw0KPiArKysgYi9kcml2ZXJzL3BlY2kvY3B1LmMNCj4gQEAgLTMyNSw2ICszMjUs
MTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwZWNpX2RldmljZV9pZCBwZWNpX2NwdV9kZXZpY2Vf
aWRzW10NCj4gPSB7DQo+IMKgCQkueDg2X3ZmbcKgID0gSU5URUxfRU1FUkFMRFJBUElEU19YLA0K
PiDCoAkJLmRhdGHCoCA9ICJlbXIiLA0KPiDCoAl9LA0KPiArCXsgLyogR3Jhbml0ZSBSYXBpZHMg
Ki8NCj4gKwkJLng4Nl92Zm0gPSBJTlRFTF9HUkFOSVRFUkFQSURTX1gsDQo+ICsJCS5kYXRhCT0g
ImduciIsDQo+ICsJfSwNCj4gwqAJeyB9DQo+IMKgfTsNCj4gwqBNT0RVTEVfREVWSUNFX1RBQkxF
KHBlY2ksIHBlY2lfY3B1X2RldmljZV9pZHMpOw0K
