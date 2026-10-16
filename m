Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1004B3B9956;
	Fri, 16 Oct 2026 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181448; cv=fail; b=eR6n7SloG0cZZYeE9EeWeo5fqZQB2MzxhSFVscv3iapK33Nd258Zkd4Oi9RdnNL4Jp01Fa2P8YGTAmZC9UX4YCzPNOid5/+vnelBc1yaE57eoMfZWGC0nlDPXPUdAU4wt9LkCzTjYpYDO/RUD/Yhr5Of2QDh9UswZZvmv/kp0SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181448; c=relaxed/simple;
	bh=woFnh8xnw4eBnZ0njybyfYAq45i9VhFZGHvF6x8golY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lvwzej7CrB7MnkHN69js+voTc1MLP8QlcfGmqqk8XNIdOtbPTUZFgcOxPjdpoM0Z/xv4hPcBFb362a93Hq6/U5XJ9nq1ivfzeWMuM0B/6JW8tJdRVcJRXw6k0HGXaBkteRSWjyIK5u1EeAcwJmzDC++FFFfuQFv6CV11Wf22ff0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2NMZj87; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2NMZj87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792181447; x=1823717447;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=woFnh8xnw4eBnZ0njybyfYAq45i9VhFZGHvF6x8golY=;
  b=B2NMZj87pkjfz/K+6dUqDrntNuuelwTZTKrfiksopaO1nCoMwpaH1858
   D4GrZ52enM9Db8+ji0lUQka/zOUF/zETfKMMCAXhK+HY9ZovyVG0YphSw
   6G+CujpXbBYpnmeQwgrz4AVd7ikZ3+0GPcTakzu1VC13+EHWN3Mzs37m3
   aQ1NIoGpAk5tX1ooCLcyj+Fxqip3Qp1zL4f0eGmTB9iKuJh+Hl4+HUz7F
   4xqTOX7RGDAMK0ys1aTDTlIdV/TUqafm3bkcfxpxwGhQkJQexwyfb5mSw
   XqbaBtl81MKPCdMQ3eLHD+Zj/K6vwBoXkCDOilybr9yYGVhOoBUUCIjHU
   A==;
X-CSE-ConnectionGUID: ACdpP1gnR62j2J3zJFkOMw==
X-CSE-MsgGUID: n8+r4O7SSz+NZxqa1jY3Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1003476"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1003476"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:10:47 -0700
X-CSE-ConnectionGUID: vTTa3/xBRkSUZdPU+menPQ==
X-CSE-MsgGUID: o0HBTP1nR2ed6S8f0uti0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2364719"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:10:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:10:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 13:10:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZqIlMA28AtzHkpLm87JomFjw4FLad+tejCdiHHsR+e56dVgrnCg+mNWajiVVEWh+hB7CcVZrYvJqicwa4WZ8DTSoHQAddoozFTvMq/0P7I43Lf62iMyLnZNy1GtZ1Vo5FkTUXzB/s8+ocb7ieBcf5dbVABsHuN+ulIQonKyb7yFUIPU//My6YylDIHqr7NYPAwKDGTlJyIF2uWZSW18q6SerS0nriVDcJIxs8wVqkQR0Ggel6c8Z8E0IrJOgTVd5NUw+eCRelv4b1gtDf6ZPli6rcl5kWPqV1ouTrwVQDnboe632a8b2F0exUqDj3a2oDh7WpeUO6uFsEOw4zXeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woFnh8xnw4eBnZ0njybyfYAq45i9VhFZGHvF6x8golY=;
 b=lG4UPX4VzblBmpSO4dLcjTgv48u7Nhp5qs5zx+FsQ212aT6RdMFMs63YHvXpCTX0bcl4em8HrWNVPAlB++gNxQ4mvpDRF6GJgxtVFhceBtCh44LxvGkCNsPJAuvkeHNOoeykAOekgZGTlTI6+JNGapQcDy24z68c2D0u1v2c32iMXXq3K1m21rcaTz3VEFA6bwwtUXT4yEnCbB0iq2ZkomCKFsXPhfn2okk/GYi4UnjsA+XWOGzpee6ZA/GLpV+TnZSV7Qs/I0S5fvuVhNYB4KDRkgJDTivNETPmD7+QUbpFSBeQnNC4khU50k/5OgQv/1lsoVBZjgRIp8BIuE+VVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5336.namprd11.prod.outlook.com (2603:10b6:208:316::5)
 by DS6PR11MB082551.namprd11.prod.outlook.com (2603:10b6:8:4c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:10:44 +0000
Received: from BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97]) by BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97%4]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 20:10:44 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v3 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdVwzChgJHvOIpVkmqahhTXmY28bcApr6A
Date: Fri, 16 Oct 2026 20:10:44 +0000
Message-ID: <fd837f02c718bea1540cca2ad352880d9f89c67d.camel@intel.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
	 <20261008100623.7085-7-changhuang.liang@starfivetech.com>
In-Reply-To: <20261008100623.7085-7-changhuang.liang@starfivetech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5336:EE_|DS6PR11MB082551:EE_
x-ms-office365-filtering-correlation-id: 145adf67-9465-47c8-af92-08df2bc18f51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|6133799003|10067099003|22082099003|18002099003|3023799007|4143699003|261009223027099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info: fSSfMxySqdMwOXhkhsQOufjq95+/gOOMk+Fqdv+jLbrsD11qAAhMrsqqaNoxQxjCM6cxrwC8/F9p95BGQrCKSgzxdv4d+xwd2etH59e0uqg0R5/jd9k8AciIpyLMhNEPeaN25n/7lHQ4UzbpxlOMiY7C/0gIKF0C+7xhwF9pDYcK3RrfK4rGUmN8S/uR3OxBsoDN6m49zbv1/QnUB4SBXuV3DbvPvx2VYZK+RfTtfry6RIjPCjuyUuwWwOk2g+Y/Y+YEEWIrC9fOj5Q0xpgm8X9bRxY8WVLYJKgKiW4m8SbaMy8btmSkDsBJ/7ndtC/wkj2KP503yXyEVi+f4q6R9f+FDMeJKFHrxU8YKOjmDFzl1FCIAcMQcX0j9b1GawA7eLvjMHrbUCNPmkGPkMpj4Vb4lhcJhri7DQrEOizsLwSOMWxyppfv4IPGIBJdOpHTG3nME2yilIV8XXxvop0qJ4RNVpNfzs31wSpf/3A7TCsXOdfST+B0bSjuyqspSCI3uecwHFk7oZQkPkJXIfs/a3C4cGcvDYAThXQs9wArXlEXW7lP9wR+/G85XXXjPyWIuRRdynjH6hYRfIu5VjiC60YcWKoGhbcCC1b0JSlwuhWtezT1NmC2RrzKqkcg/LiD315LEwvCX9+BYDIXFQqby1nPy3ARQf8jDiOB6le+q6gLlZ9o547rtLH6y9k6t76GTudb05F0vEjLCPQB27ZMOahABy5+l5zt3WgQX75IIxI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5336.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(4143699003)(261009223027099003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Skh5NmpwOVVPeWd5THh3WEVtakJ0ZVY2Q3loSHIvT2JtaytNUnZ3bWhlVlVC?=
 =?utf-8?B?dWU3QkU2MWhQRHh2WnZ4RzVhTFlBOXkzeTRqWWVvM3J0MzBKVEh0SU1ZS3Q5?=
 =?utf-8?B?TzR0SEZhWlpFS09SSGY4MFVJUmhPalNZalhtME9kYW0rbk9QQ0l3UWVKU0c4?=
 =?utf-8?B?UXhCdXlLQUw3cXhnRFFoYkMzeUtyNzZSckpyWTBZN1ROTE5vN2daWExYTmdY?=
 =?utf-8?B?N082bUVPcEpmb2g2Tmg3VURBcW4wZkZ6aC9LMWJ5b0RhRVVyNUZHYzVTRTQv?=
 =?utf-8?B?MGtpcjUyVXBmMVBTTlhKWDI3aWFJaURaUVIyVkpGTmV5RVBpYlN4LzNiVHcr?=
 =?utf-8?B?UENVV1RoL3hMSUF2S1VpS3ZWOWEwQlY0N3U2dVhPc0lPUE1vQnJnT2RNYnNK?=
 =?utf-8?B?b2U1aERKeEhtbjIxSkFtZm5FaE1QWnJHb1RXM3M3UDM0WVlpT1BHS1kwOHh3?=
 =?utf-8?B?VXNRZ2w1c1kxcWNFQjEvd2JjVE5iSkQxSGMvaDJnS2RZM1g2R01aNzhXbFNI?=
 =?utf-8?B?UGJnM0tZTjRLNHVaSnN6WE5CS2hCYzZjT3RLNUFTaDdZY2xBbE1jTXdxVHBH?=
 =?utf-8?B?RTZNcytkbTB4NUhieGR6Q2JSRGd3cGR5SlZJdW1SbWl3cnVuWFJtdGRGL2J4?=
 =?utf-8?B?N0N4ckNMajhMaVdqVDc4WE5MaHRGanIxWWYxMmp4OVJhS0tubGk4YXFmbDMz?=
 =?utf-8?B?dUZqUCtEYTVhLzUxa2JrMUUrRkxSdlJLVXFUUGoza0h6UEh4WmJUY3gzY0ll?=
 =?utf-8?B?eXg0MUVIMXFHTno0U1FPS25HOEd0Z3pQam5Ub2V4NW5JSnlQS1FvcnlZdUYy?=
 =?utf-8?B?RnNiUEpzNExuNDY4a1JNREJVeG02U1JmWTRnQlhiZkNxTGVtTTNNVzRwa0U4?=
 =?utf-8?B?SUFGL2tDZnl4V1hhQnpIN28rWk43MHJYUm93cHN6OXJqWGNEZFFra05CTHJG?=
 =?utf-8?B?T203OVJ0VjY3Rk1jR2sydjZWcHR2SWhLazNuOENEbCtxU0ZvM0xZM1Y3YThv?=
 =?utf-8?B?dS82bEpnUFREeGJqd0dlbkpUTnpjNkFJRzVMc3hVWXZFUEovRzRNSzVKK1d3?=
 =?utf-8?B?Y1Rnd2s3R3doVVJLZUxRayswQW1yb1pVbS9QM2QrS2RKZVBpdjZ0UGdNNy9H?=
 =?utf-8?B?Q0ZIQWxtdERwc0I1WTVobHRTSUh4N3dIbnpYS3JLc1VYdVBleW5QVVBsOWlU?=
 =?utf-8?B?UElvV3VDaHM1ZDh4N2ZSVDVyZWpvMmh0b2NGM3YwcEIzMHhqTXMrYndJV2RC?=
 =?utf-8?B?VEdRNTJPdUtkOWx6dmYyUmRzRXNzMmhPNi9JL0pNOGQzN0M1Q1FlREdHNE5P?=
 =?utf-8?B?VGR1UTRFQUNnMDlrTlVOcUswL1dtZ2JsclNjTk1FS0xVVHdLb0pEOVByUkpF?=
 =?utf-8?B?Mk5TM3lmbzlZd2hpdDF2bEg5bWpBaHNBS2JMMkR3S2ZyRkdkaHRNamhPSk1q?=
 =?utf-8?B?OE9WYlBKUzJqSGUwN0dzUmRQOVFEMTF0Vm9PVmlhd2lUTE1aeHJLMXc2cHN6?=
 =?utf-8?B?ekpqNGl4VzkyWmxRdDZqVE8wNExCUGtLTnhITy95K3FZNEloeHZhWVFNbndt?=
 =?utf-8?B?VmRCVjRiekJOVHNVUFJmU3FlN0VwcFBmdHhmR3NZMUU2ZTVyd2NJRmlhMnBC?=
 =?utf-8?B?MGJVK0sxdmtwTmd4NzFYVkxpSzhZc0t1enhYYXVTUEN2WHpIN2I5WUhqZ043?=
 =?utf-8?B?d1BzZ0ozcmJXNFhHN0Z6Qkttb3Rka3ppNjVTQUhnb3VJSC82ZnBVRXp5Z0hR?=
 =?utf-8?B?SUVkcE9TSWNqejdOUjlHN1V6Q0hnRmw3REVkbzNBVzBEb2NlNlZkM2NRRmlB?=
 =?utf-8?B?bHpsdmw1MG5LVWxucHNKVDJhc3FyOS9ScDVOZVVhOXpZMUwwYXN0YnQ0M1o4?=
 =?utf-8?B?d2FrMU1PcnMwZnlxOUM3TjVFMjBadUdYSkdmZno4NlpXcTVDcTRRQWZVRHJk?=
 =?utf-8?B?M0gxMXdKSjR5OGF5Y1F3Q1NtOUJmaDRaMFNIQmt1NCtkZEdxelpEM2NBZlZa?=
 =?utf-8?B?aTZrZFRtUHVKUUJCTm5icHBnTmc1NWZreklTalZBVXh5d3hZVk4yektSUW9y?=
 =?utf-8?B?UE1NSjdhTmtYbWtveEdUYm9vQkt5SnJ1dDBiYlB1NzExUjluSjBXdjU4LzZk?=
 =?utf-8?B?WCsyN2FNc0J4TkNCYVlCSVhOWkk3YURsa1dsN1V0cXY2KzNhRWo0R0Q2c1R6?=
 =?utf-8?B?UUVCMVNDdWY5dHhWcG9RQmg4S2pEYVJnSy9GR09IYkZIQnhlbWpKVTI1UUNs?=
 =?utf-8?B?MXRhNmlUODE0eTVsdkJDLzdTVDJZZVZwSGJVb0R6MHo4Z0s1SlVtTU44R09l?=
 =?utf-8?B?MDZPaHhNNEQzT2ZKS3ZWei9ZaWNJdERUbUIxdlJGaGhQWnJkNmJUaHUwVzBu?=
 =?utf-8?Q?u96nmEnf3VbiqjHY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01D3358B22C6C144A3ABA78982CB1838@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MsLTJa1AVC0NnefimNZg7An6RqMfrnblEap7r7iUl+CMI8jPGKKaxK1XFcyKwqMOxcu0NAYFslFX4sK3gxpD61J2x8pTZXy0wFK2KoyJNEPYzTYZk7hZ833J77RQJZNmBgi6jrVII6lfIdq7GdPHcCOvlfnzJRjvKJUDNcDRF6M1Nd+gHrXDxeaZQcyRni7w+OmwIHw2Pp4HW0sRCxlVorefp0Q9ON3bt7x4QzfRXkoCnhyS9LkxmXR5BKGKzdFqZQVeZUMpuiTxdqA+A+V2aZ8q5RU73CBpvpOHEqc3uGVP057GFz4AIeu/qGau4C4gOUBFvKVPDzNa47JEjxn2GA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5336.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145adf67-9465-47c8-af92-08df2bc18f51
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 20:10:44.2497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RIAgWNF2gCUIYUwMiQeXq55qMNfcv04dht13Nor30fPXicv2gpWTo6O7wPRlmfNbGswP1Y5Zk+ILiP59T71YfH7EUpOvNtZboJ7F+V59VXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB082551
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDAzOjA2IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBBZGQgc3VwcG9ydCBmb3IgR3Jhbml0ZSBSYXBpZHMgKEdOUikgcGxhdGZvcm0gaW4gUEVD
SSBESU1NIHRlbXBlcmF0dXJlDQo+IG1vbml0b3JpbmcgZHJpdmVyLg0KPiANCj4gVGhlIEdOUiBw
bGF0Zm9ybSBoYXMgZGlmZmVyZW50IERJTU0gdG9wb2xvZ3kgZnJvbSBwcmV2aW91cyBnZW5lcmF0
aW9ucywNCj4gd2l0aCAxMiBjaGFubmVsIHJhbmtzIChDSEFOX1JBTktfTUFYX09OX0dOUikgYW5k
IDIgRElNTSBpbmRleGVzIHBlcg0KPiBjaGFubmVsLiBEZWZpbmUgdGhlc2UgbmV3IGNvbnN0YW50
cyBhbmQgdXBkYXRlIENIQU5fUkFOS19NQVggdG8gdXNlDQo+IHRoZSBHTlIgdmFsdWUgc2luY2Ug
aXQgcmVwcmVzZW50cyB0aGUgbWF4aW11bSBhY3Jvc3MgYWxsIHN1cHBvcnRlZA0KPiBwbGF0Zm9y
bXMuDQo+IA0KPiBTaW5jZSB0aGUgY3VycmVudCBwZWNpIGNvcmUgZG9lcyBub3Qgc3VwcG9ydCBk
b21haW5zLCBhY2Nlc3NpbmcgR05SJ3MNCj4gRElNTV9URU1QX01BWCBhbmQgRElNTV9URU1QX0NS
SVQgdmlhIFBFQ0kgY29tbWFuZHMgd2lsbCBiZSByZWplY3RlZA0KPiBhbmQgcmV0dXJuIGNvbXBs
ZXRpb24gY29kZSAweDkwIChpbnZhbGlkIHJlcXVlc3QpLiBUbyBoYW5kbGUgdGhpcywgdGhlDQo+
IHJlYWRfdGhyZXNob2xkcyBjYWxsYmFjayBpcyBub3QgZGVmaW5lZCBmb3IgR05SLCBhbmQgdGhl
IHZpc2liaWxpdHkNCj4gbG9naWMgaXMgdXBkYXRlZCB0byBza2lwIGV4cG9zaW5nIHRoZSBtYXgg
YW5kIGNyaXQgdGVtcGVyYXR1cmUNCj4gYXR0cmlidXRlcy4NCj4gDQo+IFRoZSBtaW5pbXVtIFBF
Q0kgcmV2aXNpb24gcmVxdWlyZWQgZm9yIEdOUiBpcyAweDQyLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0K
DQpSZXZpZXdlZC1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29t
Pg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvaHdtb24vcGVjaS9kaW1t
dGVtcC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMgYi9kcml2ZXJzL2h3bW9uL3BlY2kv
ZGltbXRlbXAuYw0KPiBpbmRleCBiZDNlODcxNWRmZWMuLjc5MWE4ZTg2NjA4MSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMNCj4gKysrIGIvZHJpdmVycy9od21v
bi9wZWNpL2RpbW10ZW1wLmMNCj4gQEAgLTM0LDggKzM0LDEwIEBADQo+IMKgI2RlZmluZSBESU1N
X0lEWF9NQVhfT05fU1BSCTINCj4gwqAjZGVmaW5lIENIQU5fUkFOS19NQVhfT05fRU1SCTgNCj4g
wqAjZGVmaW5lIERJTU1fSURYX01BWF9PTl9FTVIJMg0KPiArI2RlZmluZSBDSEFOX1JBTktfTUFY
X09OX0dOUgkxMg0KPiArI2RlZmluZSBESU1NX0lEWF9NQVhfT05fR05SCTINCj4gwqANCj4gLSNk
ZWZpbmUgQ0hBTl9SQU5LX01BWAkJQ0hBTl9SQU5LX01BWF9PTl9IU1gNCj4gKyNkZWZpbmUgQ0hB
Tl9SQU5LX01BWAkJQ0hBTl9SQU5LX01BWF9PTl9HTlINCj4gwqAjZGVmaW5lIERJTU1fSURYX01B
WAkJRElNTV9JRFhfTUFYX09OX0hTWA0KPiDCoCNkZWZpbmUgRElNTV9OVU1TX01BWAkJKENIQU5f
UkFOS19NQVggKiBESU1NX0lEWF9NQVgpDQo+IMKgDQo+IEBAIC0xOTgsMTAgKzIwMCwxOCBAQCBz
dGF0aWMgdW1vZGVfdCBkaW1tdGVtcF9pc192aXNpYmxlKGNvbnN0IHZvaWQgKmRhdGEsDQo+IGVu
dW0gaHdtb25fc2Vuc29yX3R5cGVzIHR5cA0KPiDCoHsNCj4gwqAJY29uc3Qgc3RydWN0IHBlY2lf
ZGltbXRlbXAgKnByaXYgPSBkYXRhOw0KPiDCoA0KPiAtCWlmICh0ZXN0X2JpdChjaGFubmVsLCBw
cml2LT5kaW1tX21hc2spKQ0KPiAtCQlyZXR1cm4gMDQ0NDsNCj4gKwlpZiAoIXRlc3RfYml0KGNo
YW5uZWwsIHByaXYtPmRpbW1fbWFzaykpDQo+ICsJCXJldHVybiAwOw0KPiDCoA0KPiAtCXJldHVy
biAwOw0KPiArCS8qDQo+ICsJICogU29tZSBwbGF0Zm9ybXMgZG8gbm90IHByb3ZpZGUgdGhlIERJ
TU0gdGVtcGVyYXR1cmUgdGhyZXNob2xkcyBvdmVyDQo+ICsJICogUEVDSSAtIGRvIG5vdCBleHBv
c2UgdGhlIGNvcnJlc3BvbmRpbmcgYXR0cmlidXRlcyB0aGVyZS4NCj4gKwkgKi8NCj4gKwlpZiAo
KGF0dHIgPT0gaHdtb25fdGVtcF9tYXggfHwgYXR0ciA9PSBod21vbl90ZW1wX2NyaXQpICYmDQo+
ICsJwqDCoMKgICFwcml2LT5nZW5faW5mby0+cmVhZF90aHJlc2hvbGRzKQ0KPiArCQlyZXR1cm4g
MDsNCj4gKw0KPiArCXJldHVybiAwNDQ0Ow0KPiDCoH0NCj4gwqANCj4gwqBzdGF0aWMgY29uc3Qg
c3RydWN0IGh3bW9uX29wcyBwZWNpX2RpbW10ZW1wX29wcyA9IHsNCj4gQEAgLTYyNiw2ICs2MzYs
MTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkaW1tX2luZm8gZGltbV9lbXIgPSB7DQo+IMKgCS5y
ZWFkX3RocmVzaG9sZHMgPSAmcmVhZF90aHJlc2hvbGRzX2VtciwNCj4gwqB9Ow0KPiDCoA0KPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBkaW1tX2luZm8gZGltbV9nbnIgPSB7DQo+ICsJLmNoYW5fcmFu
a19tYXgJPSBDSEFOX1JBTktfTUFYX09OX0dOUiwNCj4gKwkuZGltbV9pZHhfbWF4CT0gRElNTV9J
RFhfTUFYX09OX0dOUiwNCj4gKwkubWluX3BlY2lfcmV2aXNpb24gPSAweDQyLA0KPiArCS8qDQo+
ICsJICogUmVhZGluZyBESU1NX1RFTVBfTUFYL0RJTU1fVEVNUF9DUklUIG92ZXIgUEVDSSBpcyBh
bnN3ZXJlZCB3aXRoDQo+ICsJICogY29tcGxldGlvbiBjb2RlIDB4OTAgKGludmFsaWQgcmVxdWVz
dCkgb24gR3Jhbml0ZSBSYXBpZHMsIHNvIHRoZQ0KPiArCSAqIHRocmVzaG9sZCBhdHRyaWJ1dGVz
IGFyZSBub3QgZXhwb3NlZCBvbiB0aGlzIHBsYXRmb3JtLg0KPiArCSAqLw0KPiArfTsNCj4gKw0K
PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9pZCBwZWNpX2RpbW10ZW1w
X2lkc1tdID0gew0KPiDCoAl7DQo+IMKgCQkubmFtZSA9ICJwZWNpX2NwdS5kaW1tdGVtcC5oc3gi
LA0KPiBAQCAtNjU5LDYgKzY4MCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGF1eGlsaWFyeV9k
ZXZpY2VfaWQNCj4gcGVjaV9kaW1tdGVtcF9pZHNbXSA9IHsNCj4gwqAJCS5uYW1lID0gInBlY2lf
Y3B1LmRpbW10ZW1wLmVtciIsDQo+IMKgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3Qp
JmRpbW1fZW1yLA0KPiDCoAl9LA0KPiArCXsNCj4gKwkJLm5hbWUgPSAicGVjaV9jcHUuZGltbXRl
bXAuZ25yIiwNCj4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZkaW1tX2duciwN
Cj4gKwl9LA0KPiDCoAl7IH0NCj4gwqB9Ow0KPiDCoE1PRFVMRV9ERVZJQ0VfVEFCTEUoYXV4aWxp
YXJ5LCBwZWNpX2RpbW10ZW1wX2lkcyk7DQo=
