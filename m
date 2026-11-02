Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793612709;
	b=nKkYY+GQfA8oLcrqNpSNtD/iqRIGhA+9MWYJ/6odU6EwX0rSyzqfh/wGlEea0FlUT73k
	 nlKT8n0ML//ReG0+eHOOAa5zsBP7J559DnKOiScGpqY8iLDCALVrJ9Exo1lec4dmGsfZa
	 i3RunhwwJgPe3sg78arMwylQITJBk9bd5zP1pTWhN9Ich9J4ULrWBSlqNzuBF8s/uS+7t
	 cjcWTEctAgFDrfODXJOz7G6jPHAMhKs6zn/R3YpcSO+FrAscui6SVmyuexc/k+fegyXZF
	 Nf68UJQscNLR4JTPz+gCVpRgIF8Ln/0hk3THE+wYxB1nsTI5Tp6qitjooc8H8iwmoMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612709;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=36otdw0CRet6axeW4ZxfD59KctM/YCjWvt+Tt/vuSKU=;
	b=VoEQ0Xc4BI9hnNitxz3SZetIkN5XfxEaRQCldqBV9Pc+ifIAQy/MDENGPmUPlzWd/LBW
	 mBKxGxkLMefQ0byQTU1tkmmzHf0E1f/l0OtgepZlyC/tgNJWzANAUOD3AbrvCRXyYzjxj
	 y9CtcQTJHcINkP/hmXj1a8Jzr31pSS104AydF0idjwfmtxJLm+WRdwpFQ9MBHmprDxHw+
	 ewsUmAlc6rtMBHYmhp3xtVRYJn8vJ+afmA/lg6ajAScQssDXqqt4+1hPn3yG/mDN7no9R
	 8CS0SzqG/2FlLm0HwCwaFhmZfXku8bVvYggMBijBW9khnLdVXyHEf2yPqjxfB1lP1hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XrC5R7Io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB8606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 09:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEFB8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XrC5R7Io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793612707; x=1825148707;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=36otdw0CRet6axeW4ZxfD59KctM/YCjWvt+Tt/vuSKU=;
  b=XrC5R7IoEiVU6B9bb02Jc6Vr2iOQ1qMZkuL3uamjLKwMSPk9wCvO3srN
   c0nUONsKaaGczPXvhVdYHeHVO2maBSyqCNS31JYSez7BDHAMovVLjNvIN
   LU4jHI8tekvXf7MklXILletGCuJI7IhFkb3AXWNXG/w3eGxXxtfL2gZav
   o4IFzJE1B1kPPLBQ/2MFUFtbBhRRTElNfO52SDn4ULs+RnIInzK0NEdfI
   I61DTNCkc5y+ThgyVTz1ZFs+p9uzqrNttvl3FuqD04ujlyWHj3nRTValy
   p1TAredpaYSTe8m7BhCrVbEtERUEHbr4poJhW7OxMgYw/I0pysw27wDhV
   Q==;
X-CSE-ConnectionGUID: eSFNFiuZSnuX2Q437BBBBw==
X-CSE-MsgGUID: 2a2qWVwvSxyodubK8o9LSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2329133"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2329133"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 01:45:06 -0800
X-CSE-ConnectionGUID: PsT7MENnReyDRl5O6i0z3w==
X-CSE-MsgGUID: 6tHXDnCaQtyMjQWmE5D4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6112011"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 01:45:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:45:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 01:45:05 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:45:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXNZKRDveN0qvak969UGFD/yolxP3B75JWWOBxsoqIMbZr9f4QmBfOQTWBfHZEJ68dRWLjd0v/V0HB5UT29nZvVhd0QCA43Plxazx/pQgbGErYcawDa2cY4MIIHbk/3dgja0TIMmwnHlKg7YZWDbMwn04NMaZAdy5wVUkELXJmMmXzrBYdGba0sVH9DhxYF8pdGVWCv9u+11mJgon8m8ahmoS9D3hKj5gLiD+YCpgvADXiqsPkot6Uv36MxBkCL2qFLDXWBe4LlW28zQHfyYuXtEGUxfTMKXO8o563jT6dTKGjefZ3lxIa/GuATFVSg0yxx7/6FilfYvGVDjctyM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36otdw0CRet6axeW4ZxfD59KctM/YCjWvt+Tt/vuSKU=;
 b=PUJ1zj9E/9fBE1vIgbtkh0dPy6ysXeFY8uaEZ0G9cuYuKG3p+qrua3KY0hW3eIotJKJgF50Cg30wfafcgcX274uuBgjPwZFB0V3WugHAbBoaZ1sJ4IWjTcC1E7lqFCsU4FFYvcoZY70574YgNSrE5ziKheF+skS3DM0KgrBsmX6fef3euwMvz4VNyZARNwPVgHDveBANuUS5CQ2BUsCqKDleJcDtDGFuY7mIP5k+LrVJm1IkyboECEdFRKhfDZLg4esMXyOZ0cSueHfitUdEV2ac9IfnJs+KRnEkKwiAQNwH5H7h+Q0/MwYP0A5x6Q84K+vkPgeZqFnvbWZvo+Ifew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by MW4PR11MB6666.namprd11.prod.outlook.com (2603:10b6:303:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 09:44:57 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 09:44:56 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 07/11] hwmon: (peci/dimmtemp) Fix devres leak and UAF on
 concurrent unbind
Thread-Topic: [PATCH 07/11] hwmon: (peci/dimmtemp) Fix devres leak and UAF on
 concurrent unbind
Thread-Index: AQHdaJ/4Mid8bIRVgk671JuwKws7uLcajGGA
Date: Mon, 2 Nov 2026 09:44:56 +0000
Message-ID: <9d0ca3aef199d3e0b54a6044e889e60acf671f47.camel@intel.com>
References: <20261030185256.976255-1-linux@roeck-us.net>
	 <20261030185256.976255-8-linux@roeck-us.net>
In-Reply-To: <20261030185256.976255-8-linux@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-2.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|MW4PR11MB6666:EE_
x-ms-office365-filtering-correlation-id: ff4b18ff-da81-4ecf-6ff5-08df38c5f43b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261009223327099003|261009223027099003|261009220027099003|261009221227099003|261009221727099003|261028144727099003|261021121427099003|261021123027099003;
x-microsoft-antispam-message-info: L2WoORzT1hsQ2JnUq4ZCqDXi63+Zr0Kuq6HY9yP3FfuMGH47IoAilU6dVXeiJvxFsBWmRfkFNmIjzAfeJpdwfBfOFPshRbF/n2edQq9U2rjfKIbb4b4lUtHn01o2K/ds3r06MnOWJlWkznfiXTNEu4eIrObG5/WhMB1jS1WAahKyudOAF+xT1efhIqIBm7+8+kcgLcNRRV0wYRaFHcWyDNZtdNVC6C6KqC1xeIfpmaEsR7ft1icyaarLCyGPsCbuQ+WoxEXR6AnR4fPb5Y1e5QOLmPTBR9JZkP8kcGDzwSwmp5al0ataUYU/S07eYxBV+suaBpz/mSYMyTqpHB2H4qt6LclhLXJtCHSv/QVlBWB+kkMpw3/eC4Dmy3oE+bJIe4DuU6IG8MXOUxum11Z7Z9WgHeFpWOnUjTmJ5ECqUAaHnkVZePwqWmxrsw1k1QwFHwTrOYmd4dPULkwHWjsWbr/gvuaBVnvnkoWSA10ZJ6byDP8uHI8aWfNbPTTxn0dBBPG1DMD3kLjF+TLZL9veH1G1VeBuQZ2/ISRlAl4KiQdoiPi2Ji7tTrWgJ7pVO27YRGiFonzlNeg7GBXU0Ad2a7xHuW+ahVehgZPunMZfNJvsW9m11hg6JN5YtxzxwLOxEjGeFKNrzIqD1iDIFaK4t3I4FeohCuiDCcPOMVy8qIr6k3XkJG5MSK7Iekr4UAogPG6T162pQ77JO3Rd/xj1k2EWbMwEo7w8kDJgP/Ox5wA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221227099003)(261009221727099003)(261028144727099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnpDVnh3Vyt5NXN2K1hNcFJMVmdDN0dzL0lDMC9wZ3F1clB2STh3OW1nMmll?=
 =?utf-8?B?UHNpOGE2L0oxWnJocGV2aUxSekVReGhtY3ZKSnozaG9QTjFvRmVPY3Z1Mkd6?=
 =?utf-8?B?aUMrekp1NmlockdvZnpBQzh0RHQ2MHlNWWo2aXE4TzlzeEJGaWN6cEs3WWNS?=
 =?utf-8?B?NCtodzZWK3ArMVMwS3NISWFwSllIUGFXQkwwbHRBMk9XS1d4NU1aVmZDM013?=
 =?utf-8?B?YTl0bWt3V0pvdkE4MHZEd05wN05zK0ZUTkdTbVFDL24xLzhRUVJjS0ZRT1Ir?=
 =?utf-8?B?Q2V0MFlIZTExZEJFd2xmMTFvQVdkY2pXcTBGN0FqamdZUkl1SzlaRGk5eWF1?=
 =?utf-8?B?Y1dvajJOa1JveTFOZG10TUNlZ2kyUUZTNmdaR2I2TU9iMFBETTJWU0J6V0dt?=
 =?utf-8?B?QzZsbXJ4aVgrYkhDNTVBMW0yTUo1YjZnRDhPSE44UnJ2QmtEcUMzaEZPRzBz?=
 =?utf-8?B?bXdidEpuL3MzcVAwTHVhWHlqY2NtNUphU1VaaWdHYXNPVE9tRmlGZ2xiS0h6?=
 =?utf-8?B?SEgwV2gvcGFjWVBobnk1K1p1Qng3OStqSFlldERXTjdha3JBMVdTN3VGMW5I?=
 =?utf-8?B?cEZEeEoyaCtUcmRpNm5EOHF3SFdBR1VDZ0xxeC9qYmw2MnVpMTZSejRQSHJG?=
 =?utf-8?B?VUNma0xYc0EvRjFESnhlcXIzOEpQMmRWWVJrUlBnbUtUV3JJblNYajZrZDRU?=
 =?utf-8?B?SG13VG9ENlhrZVRTVXpsMGpzb1kydUtvZkdoY2huck80UVIvNTBnZ0NWZDkr?=
 =?utf-8?B?Ung1TlhJWEluZEZ1VzRkM2dheXhqR2dVZHZMVm5TT3ZESjQxNTVTUW50WHpE?=
 =?utf-8?B?Ry9FaFFzWWJJNklseDZjU0x5ZkhmZHdOMVRsV2ZkYzI1S1BvaVE2Y0V3TWE0?=
 =?utf-8?B?K2R3NUVSa1UvYUd3d2swZWhjYW80ZGVDYm82YjVFZW1GLy9JQTl0aXN5dGdW?=
 =?utf-8?B?emM2UUtNcFEyU0ExdWd5c0VmQno4aFRiaGVocTg4Uy9EVVNmNWljbUwzM0tM?=
 =?utf-8?B?bUtpVjNtSlJpZDl6UWFVUjN2QUx2VHZHbUYrbldScXJPQ0RweVA0Ri91RzJ2?=
 =?utf-8?B?SmxGajhlMDJPRTdCYzMrNVhpdVFuNGJFMzQ3K25uMkFrSVNCZjFPSjNLQVlR?=
 =?utf-8?B?L0VTaVJ4eTI5RnYzcDhUZUZlcHFIZ00xQUJyLzRVU0RWVUVsMk83aG9xWmRZ?=
 =?utf-8?B?QUJocS9JeEljQkVidWZJVUdBV0s0V1Z5N0Y5WXVFRkVqTXdGOElkWEc2YVRK?=
 =?utf-8?B?VFY3VDhYcGg4YXpWQktnVjE0TXVBY3FvUXRVa21FSG1zT0d2Wk9PTkowWUlT?=
 =?utf-8?B?eDBrSnIwQ1paLzRZbGw2Mk1uNkYwdHoxMlptYjlXa2xWV3JaTWUvSlFoYjVn?=
 =?utf-8?B?cXRvNlBqY1R3LzlMdW1UNTRzRG9Yd0JJQy9Na2t1OUlHdm94aS9NUklDck94?=
 =?utf-8?B?L2ZFK2RrRUtldmlhZXp3SmJTNWxwSVd0Wksrc0l1WmJxSHZSL2JsanpaM1Bk?=
 =?utf-8?B?bCtXOC9PcEdkdHpnL0FJamJvMXhUaXV5ci9rTlFNekN3SHhuNlQ0dDJ2YXUx?=
 =?utf-8?B?TmltMDk3dTBNN0lQRVpGZ2xHRjlXaXF6WTk0djQyUVhFWW5EVkpIOW8xUGVy?=
 =?utf-8?B?cGpYSWdQa1l6cUlHR0g4UnB3UEVlSUhwVjk1VkpSckpHR3RHUHRjTUY5NnNk?=
 =?utf-8?B?MmJ3VjNaQ0VkNHBnZG5HenRGOUN2U295MEdURVlENUtQOXc4OGJXUjNSUyt5?=
 =?utf-8?B?VDYzVVpvL1Q1Mm82N3BQWHhmVEFXbCtkeFllUS9SL2pWTURiNFV6L3UyQ1Ra?=
 =?utf-8?B?WjNDTlorK25zMlBMSEViMjhpeFk2UUZXMVhFdXhBRnlrNGFTV2phRldRbUdF?=
 =?utf-8?B?NWp3eE1WN0hrQ1gzcTNoRnFqOUo1ckhUTFY1d3F0RmFQaDhNUlpnNnRmd2JK?=
 =?utf-8?B?alU3cithaFVmbGc1OTNheE1YVVRuM2d0ZHM3dkdTUlUrSU4xZU8zdW1QMXhR?=
 =?utf-8?B?WE8wMzh0d0VYcUVIWjZqN2djMzRoN09Xa1lKa0tWcFdYdHdCOThVVnBiNXkv?=
 =?utf-8?B?dVNKd0gzNDdOR1NCUHJrL0wrQzlDTHBsOUFkRG5UOHVQOER4aXZiTjg4ZGQ4?=
 =?utf-8?B?ejRPUTFHRlJjVmpkb3lqaEczeU5FWnJGTzBHRkdTTjJ5RlhDWnhUWVVOcHFY?=
 =?utf-8?B?M2dFaGxySXQ3Z2M3aWt2MG9BNWk1d0c3eXFkaC93WXNGa1orR3FsTkdzL1lI?=
 =?utf-8?B?MTdjY1hLbk9CeFFLeFdQQk9STytRODQ0MFprYkdHcURyTnhQVkpnM2FyNHN5?=
 =?utf-8?B?bC95NC9ZUlZoREFLZWFob3plZGVCWW1GeHdLU0ZkcjJncGNDOHcyNXNNQmh3?=
 =?utf-8?Q?SlwvVXOZre8EfPOs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CB3BE040B02FB4498D67B8C2B7520C2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VOhZmdcIVHE6rhGc3hIs1CbtiolsWZ66s1vHW3/nOWZkdoUBcHw/0FcfarKOgNVAKyy08aMX2axf/Jkv0C/+uuJj7yC7ADZDyILSxvHuG+yxWKOIVf6XWxytlL2GIDj5R7njEf/PnX8AA5M0x+g4kHtYyxZifB+y/DGXDjcJCDQuL3Ert00nbOwZRA6w4mlMYxbwvCTHqB1iPZcmb2n9N3j6paVXiua+KusV6Keii8LWokruFpxP2kyDNHNaIU217IyqqCSNhF9rqeaBPqaLQABFTb+3UIpyTvy+6e6kO9BtETWeHh+Fn3UWjZWMxQD/4b9C8YxZwiZFr0H9J108Qw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4b18ff-da81-4ecf-6ff5-08df38c5f43b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 09:44:56.6616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ORPwZRBB6sjF6qQ4U4HCzWjwjhZKidu9PloYQcDrdDT1/UILbpWHoyTJ3daLTFz2oZazFaaRqNihwNRU0QrGam/tS4AKKRHAkyB/Wg3zCU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6666
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTEwLTMwIGF0IDExOjUyIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBXaGVuIGEgcGVjaV9kaW1tdGVtcCBkZXZpY2UgaXMgdW5ib3VuZCBjb25jdXJyZW50bHkgd2l0
aCBpdHMgZGVsYXllZA0KPiBpbml0aWFsaXphdGlvbiB3b3JrIChkZXRlY3Rfd29yayksIG5ld2x5
IGFsbG9jYXRlZCBkZXZtIHJlc291cmNlcyBhbmQNCj4gdGhlIGh3bW9uIGRldmljZSBhcmUgbGVh
a2VkLCBsZWFkaW5nIHRvIGEgdXNlLWFmdGVyLWZyZWUgd2hlbiByZWFkaW5nDQo+IHRoZSBsaW5n
ZXJpbmcgaHdtb24gc3lzZnMgYXR0cmlidXRlcy4NCj4gDQo+IEluIHBlY2lfZGltbXRlbXBfcHJv
YmUoKSwgZGV0ZWN0X3dvcmsgaXMgcmVnaXN0ZXJlZCBmb3IgY2FuY2VsbGF0aW9uIHZpYQ0KPiBk
ZXZtX2RlbGF5ZWRfd29ya19hdXRvY2FuY2VsKCkuIER1cmluZyBkcml2ZXIgZGV0YWNoLCBkZXZy
ZXNfcmVsZWFzZV9hbGwoKQ0KPiBmaXJzdCBtb3ZlcyBhbGwgZXhpc3RpbmcgZW50cmllcyBmcm9t
IGRldi0+ZGV2cmVzX2hlYWQgb250byBhIGxvY2FsIHRvZG8NCj4gbGlzdCBiZWZvcmUgaW52b2tp
bmcgdGhlaXIgcmVsZWFzZSBjYWxsYmFja3MgaW4gcmV2ZXJzZSBvcmRlci4gSWYNCj4gY3JlYXRl
X2RpbW1fdGVtcF9pbmZvX2RlbGF5ZWQoKSBpcyBhbHJlYWR5IHJ1bm5pbmcgd2hlbg0KPiBkZXZt
X2RlbGF5ZWRfd29ya19kcm9wKCkgY2FsbHMgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCksDQo+
IGNyZWF0ZV9kaW1tX3RlbXBfaW5mbygpIGNhbiBhbGxvY2F0ZSBkaW1tdGVtcF9sYWJlbCBzdHJp
bmdzIHZpYQ0KPiBkZXZtX2t6YWxsb2MoKS9kZXZtX2thc3ByaW50ZigpIGFuZCByZWdpc3RlciB0
aGUgaHdtb24gZGV2aWNlIHZpYQ0KPiBkZXZtX2h3bW9uX2RldmljZV9yZWdpc3Rlcl93aXRoX2lu
Zm8oKSwgYXBwZW5kaW5nIG5ldyBkZXZyZXMgZW50cmllcyB0bw0KPiB0aGUgbm93LWVtcHR5IGRl
di0+ZGV2cmVzX2hlYWQuIE9uY2UgdGhlIHdvcmsgZmluaXNoZXMsDQo+IGRldnJlc19yZWxlYXNl
X2FsbCgpIGZyZWVzIHByaXYgYW5kIHByaXYtPm5hbWUgZnJvbSB0aGUgbG9jYWwgdG9kbyBsaXN0
DQo+IHdpdGhvdXQgcmUtZXZhbHVhdGluZyBkZXYtPmRldnJlc19oZWFkLCBsZWF2aW5nIHRoZSBs
YXRlIGRldnJlcw0KPiBhbGxvY2F0aW9ucyBhbmQgcmVnaXN0ZXJlZCBod21vbiBkZXZpY2UgYmVo
aW5kIHdpdGggYSBkYW5nbGluZyBwcml2DQo+IHBvaW50ZXIuDQo+IA0KPiBDYW5jZWwgZGV0ZWN0
X3dvcmsgc3luY2hyb25vdXNseSBpbiBhIGRyaXZlciAucmVtb3ZlKCkgY2FsbGJhY2sgaW5zdGVh
ZA0KPiBvZiByZWx5aW5nIG9uIGRldm1fZGVsYXllZF93b3JrX2F1dG9jYW5jZWwoKSBzbyB0aGF0
IHRoZSB3b3JrIGlzIGZ1bGx5DQo+IGRyYWluZWQgYmVmb3JlIGRldnJlc19yZWxlYXNlX2FsbCgp
IGRldGFjaGVzIGRldi0+ZGV2cmVzX2hlYWQsIGFsbG93aW5nDQo+IGFueSBkZXZtIHJlc291cmNl
cyByZWdpc3RlcmVkIGJ5IHRoZSBkZWxheWVkIHdvcmsgdG8gYmUgcmVsZWFzZWQgaW4NCj4gcHJv
cGVyIHJldmVyc2Ugb3JkZXIuIEFsc28gb25seSBzY2hlZHVsZSBkZXRlY3Rfd29yayB3aGVuDQo+
IGNoZWNrX3BvcHVsYXRlZF9kaW1tcygpIHJldHVybnMgLUVBR0FJTiBzbyB0aGF0IHByb2JlIGZh
aWx1cmUgcGF0aHMgZG8NCj4gbm90IGxlYXZlIGRlbGF5ZWQgd29yayBwZW5kaW5nLg0KPiANCj4g
Rml4ZXM6IDczYmMxYjg4NWRhZSAoImh3bW9uOiBwZWNpOiBBZGQgZGltbXRlbXAgZHJpdmVyIikN
Cj4gQ2M6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KDQpSZXZpZXdl
ZC1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KDQpUaGFu
a3MNCi1Jd29uYQ0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvaHdtb24vcGVjaS9kaW1tdGVtcC5jIHwg
MjEgKysrKysrKysrKysrKystLS0tLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9w
ZWNpL2RpbW10ZW1wLmMgYi9kcml2ZXJzL2h3bW9uL3BlY2kvZGltbXRlbXAuYw0KPiBpbmRleCBi
ZDNlODcxNWRmZWMuLjYxN2E0Y2MwZjY1YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9od21vbi9w
ZWNpL2RpbW10ZW1wLmMNCj4gKysrIGIvZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMNCj4g
QEAgLTQsNyArNCw2IEBADQo+IMKgI2luY2x1ZGUgPGxpbnV4L2F1eGlsaWFyeV9idXMuaD4NCj4g
wqAjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvYml0b3Bz
Lmg+DQo+IC0jaW5jbHVkZSA8bGludXgvZGV2bS1oZWxwZXJzLmg+DQo+IMKgI2luY2x1ZGUgPGxp
bnV4L2h3bW9uLmg+DQo+IMKgI2luY2x1ZGUgPGxpbnV4L2ppZmZpZXMuaD4NCj4gwqAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+DQo+IEBAIC0zMjYsMTEgKzMyNSwxMyBAQCBzdGF0aWMgaW50IGNy
ZWF0ZV9kaW1tX3RlbXBfaW5mbyhzdHJ1Y3QgcGVjaV9kaW1tdGVtcA0KPiAqcHJpdikNCj4gwqAJ
aWYgKHJldCA9PSAtRU5PREVWKSB7DQo+IMKgCQlkZXZfZGJnKHByaXYtPmRldiwgIk5vIERJTU1z
IGZvdW5kXG4iKTsNCj4gwqAJCXJldHVybiAwOw0KPiAtCX0gZWxzZSBpZiAocmV0KSB7DQo+ICsJ
fQ0KPiArCWlmIChyZXQgPT0gLUVBR0FJTikgew0KPiDCoAkJc2NoZWR1bGVfZGVsYXllZF93b3Jr
KCZwcml2LT5kZXRlY3Rfd29yaywNCj4gRElNTV9NQVNLX0NIRUNLX0RFTEFZX0pJRkZJRVMpOw0K
PiDCoAkJZGV2X2RiZyhwcml2LT5kZXYsICJEZWZlcnJlZCBwb3B1bGF0aW5nIERJTU0gdGVtcCBp
bmZvXG4iKTsNCj4gLQkJcmV0dXJuIHJldDsNCj4gwqAJfQ0KPiArCWlmIChyZXQpDQo+ICsJCXJl
dHVybiByZXQ7DQo+IMKgDQo+IMKgCWNoYW5uZWxzID0gcHJpdi0+Z2VuX2luZm8tPmNoYW5fcmFu
a19tYXggKiBwcml2LT5nZW5faW5mby0NCj4gPmRpbW1faWR4X21heDsNCj4gwqANCj4gQEAgLTM5
OCwxMCArMzk5LDggQEAgc3RhdGljIGludCBwZWNpX2RpbW10ZW1wX3Byb2JlKHN0cnVjdCBhdXhp
bGlhcnlfZGV2aWNlDQo+ICphZGV2LCBjb25zdCBzdHJ1Y3QgYXV4aWwNCj4gwqAJCQkgIlVuZXhw
ZWN0ZWQgUEVDSSByZXZpc2lvbiAlI3gsIHNvbWUgZmVhdHVyZXMgbWF5IGJlDQo+IHVuYXZhaWxh
YmxlXG4iLA0KPiDCoAkJCSBwZWNpX2Rldi0+aW5mby5wZWNpX3JldmlzaW9uKTsNCj4gwqANCj4g
LQlyZXQgPSBkZXZtX2RlbGF5ZWRfd29ya19hdXRvY2FuY2VsKHByaXYtPmRldiwgJnByaXYtPmRl
dGVjdF93b3JrLA0KPiAtCQkJCQnCoMKgIGNyZWF0ZV9kaW1tX3RlbXBfaW5mb19kZWxheWVkKTsN
Cj4gLQlpZiAocmV0KQ0KPiAtCQlyZXR1cm4gcmV0Ow0KPiArCWF1eGlsaWFyeV9zZXRfZHJ2ZGF0
YShhZGV2LCBwcml2KTsNCj4gKwlJTklUX0RFTEFZRURfV09SSygmcHJpdi0+ZGV0ZWN0X3dvcmss
IGNyZWF0ZV9kaW1tX3RlbXBfaW5mb19kZWxheWVkKTsNCj4gwqANCj4gwqAJcmV0ID0gY3JlYXRl
X2RpbW1fdGVtcF9pbmZvKHByaXYpOw0KPiDCoAlpZiAocmV0ICYmIHJldCAhPSAtRUFHQUlOKSB7
DQo+IEBAIC00MTIsNiArNDExLDEzIEBAIHN0YXRpYyBpbnQgcGVjaV9kaW1tdGVtcF9wcm9iZShz
dHJ1Y3QgYXV4aWxpYXJ5X2RldmljZQ0KPiAqYWRldiwgY29uc3Qgc3RydWN0IGF1eGlsDQo+IMKg
CXJldHVybiAwOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2b2lkIHBlY2lfZGltbXRlbXBfcmVt
b3ZlKHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphZGV2KQ0KPiArew0KPiArCXN0cnVjdCBwZWNp
X2RpbW10ZW1wICpwcml2ID0gYXV4aWxpYXJ5X2dldF9kcnZkYXRhKGFkZXYpOw0KPiArDQo+ICsJ
Y2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZwcml2LT5kZXRlY3Rfd29yayk7DQo+ICt9DQo+ICsN
Cj4gwqBzdGF0aWMgaW50DQo+IMKgcmVhZF90aHJlc2hvbGRzX2hzeChzdHJ1Y3QgcGVjaV9kaW1t
dGVtcCAqcHJpdiwgaW50IGRpbW1fb3JkZXIsIGludA0KPiBjaGFuX3JhbmssIHUzMiAqZGF0YSkN
Cj4gwqB7DQo+IEBAIC02NjUsNiArNjcxLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShhdXhpbGlh
cnksIHBlY2lfZGltbXRlbXBfaWRzKTsNCj4gwqANCj4gwqBzdGF0aWMgc3RydWN0IGF1eGlsaWFy
eV9kcml2ZXIgcGVjaV9kaW1tdGVtcF9kcml2ZXIgPSB7DQo+IMKgCS5wcm9iZQkJPSBwZWNpX2Rp
bW10ZW1wX3Byb2JlLA0KPiArCS5yZW1vdmUJCT0gcGVjaV9kaW1tdGVtcF9yZW1vdmUsDQo+IMKg
CS5pZF90YWJsZQk9IHBlY2lfZGltbXRlbXBfaWRzLA0KPiDCoH07DQo+IMKgDQo=
