Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794495480;
	b=5r0UMvFTNCwZ1dMOo4I96tfzPIX6Yk8ak6a8wGFEr5vITAmD9eItjmukfDJ1qXRgz67M
	 4fb/x3gO1uUDOqJCDd9mecxrvrPShwunTS5yY8WIWey2NpWw9SORdPseMu1ic/LMATRUN
	 NgfCo3U/dtRSqfPYySOWl+Afw9+u7RHAD8a8GY/1rv0SMk1N2UngPTgmvB0YbsibAO2dh
	 +cd/xFQUCVmJwX00iFa6aaWghefMntESFa442xkTjmtytQnTit+Klhwq8bOiInqIwjq8B
	 tA8qcy7dH71PLS9acV2NMJzPiqASxRMK0RY7eVyOjxs/lA00DPHBZAloK1NFgqvC5PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495480;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=6gAdCeZ1+Z4c5eMtr7irYKZgyigVGL866rNRdjrPjS0=;
	b=g58enJzXI69ZfLAlRiHMG+2hDPHvKu3k55B0R+m7O32v7lFn94s+1wnRFei3rKATDnmW
	 Bq/A2OaBBzd1NZel2YWHUbKKZyziPspsQfC0fmV67hvmfaKXHeASA6dvnG/oob7Iq1U6d
	 xnU/II3LMgS2eI2A+K7ww6nWC0/AKOQx1IXHBN2LwSCNU5Fb8yfl6OftCi0Xs5h3nQsqm
	 7OsamTqAd4Ym96tHRlPWquv7YCkRgRDZTADRz47diYADejovBdVafO1Y5ohVQMHaSgamh
	 /7fD/o/+waYj5cWqK6vz2mfbpWfTRVL6Hlhv6s7833b26MbhAxeKhD7sxoHmH2b/0Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4FfmJ4F;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VCspTYql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2135606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 14:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2135606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4FfmJ4F;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VCspTYql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794495480; x=1826031480;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=6gAdCeZ1+Z4c5eMtr7irYKZgyigVGL866rNRdjrPjS0=;
  b=V4FfmJ4FgHGQVxa1KHSTnwjKm/YA544w8RTz/h5W2Oy9DHVWqhDUBeBW
   0e1qMZkWZU+Fsue0oEsiTPzNSq26BRqNxDOoXCTtHmH4s6thUyoTw/D+I
   xVwwLT65JlTLIRm0yvpYfIqFtD23iXrfEv2dR4gdXkQ6B/OJGcv+R26ps
   XCxD9Jyoa4xSWzl9Ct/uz+RGUcRVa3YbilVgpSWexxNCqhAW1nVBb5E85
   HozNCBmn16h1f8vdABQuFh/FEHz+oqNpVnnWs8fa3oyeNaDnIVsE0Yvly
   g4GIKo19sqcSRZ1u2qGA27ly1haxertX4y3xzPeNuz8w00N0k9nYJauqk
   Q==;
X-CSE-ConnectionGUID: MolsJ0PPQx2k5RTnBJC+2g==
X-CSE-MsgGUID: p90L5hQgROu2Zr0nwBQNFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3162685"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3162685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:57:51 -0800
X-CSE-ConnectionGUID: PctqS03lT5CcxD9eHriBtQ==
X-CSE-MsgGUID: yrKecu6eTDyp8FKg0keq9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8854729"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:57:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 06:57:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 06:57:50 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 06:57:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZHb8CWD6wZeQyMG0hgi4xbHTa7LrA2R90U1sGR/eKG6ldoZPfpVs1aws2QOhnijcJ6I57DomiriCA5WE6nY5WoR3aObgSfpDQGXFGlM9CB2vbd8dCiSuHmCMFYsQK+ABiuj+DGvVDvMnNReEl3EX0e8V76DmyYf2lXQc1xwC8T+CIVUDVuZO+l05EdXvFZhNrIrN6ap464suJyjPMfeQSruC2gbgvDVsbf3LRgGhOkZrTCTWU9u/jNR27KXJCrmQTt8TkKLq3LtCcSXhCthWPadQWDxrUmkVxRiXxPCktIOnKJuB3BiaWglHmk9QoAUwZvORYost7zYWN4mLcqOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gAdCeZ1+Z4c5eMtr7irYKZgyigVGL866rNRdjrPjS0=;
 b=ZownzjCH6dSOTKacrxrHFCcVIzEEBrCZtMVS55W7eoZpLAhM0WPGzVPYGBEj+pwMuyGpRtdUmL/QdME+Elf1dahX0TT+cRlNVd8UIwKi4EmF8jDT0L7zJJ8sGsqn6v3JxkD8NLNN5xkJ5d45ZX+Zu5NrjmWsTCR4EAavAs8QagEneIculxnDhTfmmzFNOwuAaBqWuEO6qsm/7eT6qhEQuY14UlECQKJQZE/CKLboH+fWsbuuCLIbqzPHEnjuH+PMqjGcNA2aZm4jnSHeMkxNk2DeOKLOs95rl0ftKSCMORzN2SQHA5OmBtal34/zpsF7qjx62jYSY5Kize2Xr8dIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gAdCeZ1+Z4c5eMtr7irYKZgyigVGL866rNRdjrPjS0=;
 b=VCspTYqlFNuy11zmjv/QAldiWlUQ8Wga4HBDcyBygmz89urWrftsVQ9tL6KOUoOR+ZGdrppNOWjn/b0yDTnVeUB/fTIiH3kXb6I17R1rtevSxGkn2humoXKEimhiIBUZB79vfu+n/0rUEH8ok/L7dQU+JLGw80iItb+FaYg0+2s=
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 14:57:37 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 14:57:36 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 071/102] hwmon: (peci) Use 64-bit jiffies for sensor
 update timestamps
Thread-Topic: [PATCH 071/102] hwmon: (peci) Use 64-bit jiffies for sensor
 update timestamps
Thread-Index: AQHdazPZ3bW8RiV4pEms6OalF0qOd7cqleWA
Date: Thu, 12 Nov 2026 14:57:36 +0000
Message-ID: <0eab63e2e1f816d0b7372a8a8e294ac78f8c8bb1.camel@intel.com>
References: <20261102225235.334487-1-linux@roeck-us.net>
	 <20261102225235.334487-72-linux@roeck-us.net>
In-Reply-To: <20261102225235.334487-72-linux@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-3.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|SJ2PR11MB7502:EE_
x-ms-office365-filtering-correlation-id: db343b83-a4ac-4409-c859-08df40cd4a4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|38070700021|261021123027099003|11063799006|56012099006|261026121527099003|261021121427099003|261022113327099003|261009223027099003|4143699003|261102123227099003;
x-microsoft-antispam-message-info: mv9LstIBito1xkuswskiSOYIuqks17UGblm+G7g1uJa8thWHUwCl/t/nXEiTj9eXesUoIto25tv0SECJaLpAAOwFDhddIEtS+tTwGeCqPCN1Sxb25dZb5E6DR2HofgadC4WYaTuJ5n2BO9jynGliAX+ZLHG/6puizCbhZtVvKZRq5EhE3iqh/e8rtV1HcKbtJTjztVjQ8I+8uV3jGSW7ZwDG4sdBtabrdN5G0+t+9tOri+N29dN58UxOJ8b+OV/L1e5jcZ3Xre0n/x0W1fb8oMiKBjRlJqDk01erOD2KSoHT/2nciBLnIbtxI8CyP70NuPhV6nLgtkmEJHGXctGL3smnjDWBoVnzfzdAqVaxJScZq8pkdyEPgRApSgej1PLf3pjMiQcWvklsICw7OVDZV2vEBUBOiv9m7YlaVxNyHauhnSfzUKxYJ3LFQTdxwpr5JA7a+P9pBVwHm5i2OWNd1ffWOkeaHds6pQelfxtDu/Qq8GNlMNc5HP36r7GieS0hu4rJMmefn23KcEfkL/FSTvxIKjXlae/81MBORnWIgbRtaaRhdERpAVkbqObLRqxOGGghKRhT8VkLVCOJnA6UZKTL+JWiW8jnysPyNqSFPjUlCXxr1m9y+oS0HtZ0jiCJPok7XYrO5ZZJcq8UcMz+mHugAiQA5dCshUIgev1NmF4ku0FKyihrhPvAAERQAtP3A9Mo31xOSgLz3vmcYrlxdG0ZLQ9NKa3jGuHkABk2khk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(38070700021)(261021123027099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022113327099003)(261009223027099003)(4143699003)(261102123227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1lxR09iUk5FWVQxU3o5NHk0bHVsb1NIZ2NwZTFodWpsSE90RmJkRzYwSmRK?=
 =?utf-8?B?VVR2ckgwSHloUDduNVI3OGJpZHVJeTc4V1ZZSDU4OTNXVWQrMjFQNXhuemhL?=
 =?utf-8?B?bVRnaXR0a08vS3JMYzUrUEN4ekJSckoyRHhkUU45OEVUdW5iVit4TGtHZUZ4?=
 =?utf-8?B?SWo2T2YzZk9OeklJS2R1VzFaeTljcW5Rdm9FYlhJMS9IOXU2Y0kva09sMzdL?=
 =?utf-8?B?NWdsQUtLR1JUSCtXUnN6eFVJam81b3YxZVF5emlvZmtkR0hTSEpmMHZUZ2Zm?=
 =?utf-8?B?L1AwTkRjRXJJWXg5NThXTHE3UGxmVC85aDFhaXdIRGx5ai9iS2I1MEVqdXRH?=
 =?utf-8?B?U0owQ3NsVFE4S3hCWXNRU1JPMDgrQk9tdnNtS2tFMTY0ZkNmbjBqL3p6ZmFN?=
 =?utf-8?B?bnlIampsN2JTNEcxbDVBZk8rN2dXUERxVHA4M3prQzRjd1BNUlQ5SThJVTlt?=
 =?utf-8?B?eG90d2xkUjdaY1pONGIwRVBuL3M1R21maG1neHdjc2pTbEJTRE1lRWtSczZ0?=
 =?utf-8?B?MVUrMXYwdHZoNy96TG1XeXRJNVc1dHJaVG5yejFWcU9yQk5zZkV3Zk42Tmsw?=
 =?utf-8?B?NDhSNlYzWUFMR09TY2dDOWZGZmQzaHlWa2l3YkJ4aFVwY2Mwa3ZkQ1NNV0VR?=
 =?utf-8?B?dVlNRjhqS015LzY0bHJsR1RSMkNxT2lsYU5VMjVFWm9UM0FhRzdOS1YwWFMy?=
 =?utf-8?B?SUMxaWU3VkpOZmRhSGVFVkxIaWZqRDFYZC9PS0Z6MmpzSlZXaGlJNTc2aUVy?=
 =?utf-8?B?QU5EVXk1ZmgzUVpYbFpKb296ZjNCK2RKc3JhWW96eHdFdGpPVXdiUXlLd1kx?=
 =?utf-8?B?OXNXNzBleStZK1hGMG95QmlaSFh5UnZlRGs4Y1NFK0QyNzk2Nzk3U0FDaGcy?=
 =?utf-8?B?WURwcWtPdDBhc0FsU0UzRy82MHViMVc1RThLeHJ5UG5PRlRiN1RSOWZ1Z3ZY?=
 =?utf-8?B?VmIxcG8vTXJrUENUV2xzSjFUTGhHSHI1RURSMXhRZk1taUFBdDZxaUZCRnVD?=
 =?utf-8?B?T0pNLzNUUFVHVmp0RVFEZ09MQjU2UWtlYTY1OTVRS1hUSmx0Z3BEVUh1Kyts?=
 =?utf-8?B?bGNSZWhKLzNVNklXLytoNGF5NkZFMGhNdUVWdzcxem13Ty9UVmFWTXhKenRH?=
 =?utf-8?B?clhLcHVlVGdDb1FYTDlCRHdqVDZaSllLVlYyVWpMb0FTQ1RGbWw4eU5tWENO?=
 =?utf-8?B?WXVmeEVxaWk3UUliZFdqTHNUMWY4SGFXZ2VzTzBHK3ZLaW9aNFpPUDNjL2du?=
 =?utf-8?B?L3VrNnlvamlOdXdPK0JYZ1A5TlYrZmVCaTc0Y2o5ejVUQmRSZVRUZTZ4S3kz?=
 =?utf-8?B?V1BVaHh2b2kxOW5KY3NJRENXU1liaFJGU1hHKzJxRXdLbWU3d1IyRVdSRUEy?=
 =?utf-8?B?Y3VuZ1grQVZLVFZNTlhzZjYyOHpWSDJ6VFF0dkthc3dkZ3l5TWU2UkVOTnk4?=
 =?utf-8?B?Nmc1NE16ZVJmbFI2bWlOeUEzNTBtalZOdDVrWFZxdXozdHA2bGMzNExJUGxF?=
 =?utf-8?B?cFpYVHhRZ1ltN0ZiNFBOektvZkg1aVg3ZkU1RWlXTW5aVnVldUZWcklLcTdB?=
 =?utf-8?B?cWh4MHQwQm85ek1QOWdpU0lUdjNXZ2xieXo2ci9kRStscHE1OUVYU0d5UGpJ?=
 =?utf-8?B?YjJWYTNEM0pFaUJWTWJNOXdHRWdJMFBlZFBoY29ESGprSVQ3MlJiVUcyaFlP?=
 =?utf-8?B?bTBWS2lxV1ZqNHZhMC9kWWdlb1h6YWM4MUIxcGhwRXZ2NytFZnFrMkk0Wnlu?=
 =?utf-8?B?Vmh4SXlJbUNlRFU3a1BlMy82T0lYdXRqY3FQS1dxSmtXekErK2RwN3R3aVZh?=
 =?utf-8?B?VStyZlVSUWFQT012bjRxdHlZRmM0bVNVdmF0SXNRaWVRcWJicG42NmpTNHRj?=
 =?utf-8?B?T05pVFNONEcyWEd2T2RvUm9aeHJ2dGcrOXpmaXRtOWI2K00zZ21LcnpScnQ2?=
 =?utf-8?B?R2FhU2dnVGZyVnBXaS82RlBSY3Y3MXF2K3lGWFIzN2pMSWl3UFRZUmVYQWVn?=
 =?utf-8?B?VzMySGZoenFDUzlBK0lsMzlrZU5CSkJmN2VGanZxUTJTTXRBMm1seGhLRUZp?=
 =?utf-8?B?MWp5dTZydjZVdEhSUkhGc0hDeUZkSVZaY0g3b2tMdC8xQ2ZDTGhicVVDZEZQ?=
 =?utf-8?B?N2VBSFhRb1ZVa3IyR2ZKbFRud3EvUnBRd3c2eWdMOFAvNWVXdG9pN0Rjb3BZ?=
 =?utf-8?B?RitPOTEwajdUcTVuYUw5V1RUa0tjK1JuaStybm9QQVVsMXNlcmt2OG9KZUJs?=
 =?utf-8?B?QlExdFZ5dkxNM0UwSWg1azZXY05mOERRd1Z4c2p6MlNXRUw1Z2FpanF1SXNC?=
 =?utf-8?B?dzhwQkZwR2dtZjFMNTRLeFd2SytnaXdrWlpyUlRrZUxBdmpHNVJrdjh5dHZY?=
 =?utf-8?Q?3OxHR05nNiA25SiI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25291AFC5EBD3E42A308C018790EC92D@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: gjd2ETzkUcEuPguT4ZSlLeibTePKP4VaqMUa+wJMc/gvCZBioxzjW+4gVkbWWli4MGjMzKfoD1+H994yW8S8eTKRDACANPMqXBx0SHH66ZfyF31WtO8PePDsA8LDKN4+usLVgUi1RsmiD2KjXmgn6mpzY6o37PVgPKwpVPoIejFPGxdvltXtOj6gLUtQCPVWePoE1OEgwkcFD1LatL9APwdQGr6V/y5CnGt99nGYZDgoEWV4aYMN3w0wt7n3vjCMkoabdLQvTvqxZtaGXPvZsHisKJdOe9jWOX2KCsgZZzLl740PmwFVsJvC4KGWOqln6Gyb0SCz8GqUXhSDkapKqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db343b83-a4ac-4409-c859-08df40cd4a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 14:57:36.8658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3VclaHqfWk9c2q8l3Tnv9UNXnhcsLlpUMrDysdy9n3j/TBjc98pAw+2dT0AClUSfU88BgoSsVvlT+clGOAgtKNG4iseYP5di1X5iPwdfRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7502
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI2LTExLTAyIGF0IDE0OjUyIC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBUaGUgUEVDSSBod21vbiBkcml2ZXJzIChjcHV0ZW1wIGFuZCBkaW1tdGVtcCkgdXNlIDMyLWJp
dCBqaWZmaWVzIGFuZA0KPiB0aW1lX2FmdGVyKCkgaW4gc3RydWN0IHBlY2lfc2Vuc29yX3N0YXRl
IHRvIGRldGVybWluZSB3aGVuIGNhY2hlZCBzZW5zb3INCj4gcmVhZGluZ3Mgc2hvdWxkIGJlIHJl
ZnJlc2hlZC4gT24gMzItYml0IGFyY2hpdGVjdHVyZXMsIGlmIGEgc2Vuc29yIGlzDQo+IG5vdCBw
b2xsZWQgZm9yIGFib3V0IDI0LjggZGF5cyBhdCBIWj0xMDAwLCB0aW1lX2FmdGVyKCkgd3JhcHMg
YXJvdW5kIGFuZA0KPiBjYWNoZWQgdmFsdWVzIHN0b3AgdXBkYXRpbmcuDQo+IA0KPiBTd2l0Y2gg
bGFzdF91cGRhdGVkIGluIHN0cnVjdCBwZWNpX3NlbnNvcl9zdGF0ZSB0byB1NjQgYW5kIHVzZQ0K
PiBnZXRfamlmZmllc182NCgpIHdpdGggdGltZV9hZnRlcjY0KCkgdG8gYXZvaWQgd3JhcC1hcm91
bmQgaXNzdWVzIG9uDQo+IDMyLWJpdCBzeXN0ZW1zLg0KPiANCj4gRml4ZXM6IGJmMzYwOGYzMzhl
OSAoImh3bW9uOiBwZWNpOiBBZGQgY3B1dGVtcCBkcml2ZXIiKQ0KPiBDYzogSXdvbmEgV2luaWFy
c2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBHdWVudGVy
IFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQoNClJldmlld2VkLWJ5OiBJd29uYSBXaW5pYXJz
a2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQoNClRoYW5rcw0KLUl3b25hDQoNCj4gLS0t
DQo+IMKgZHJpdmVycy9od21vbi9wZWNpL2NvbW1vbi5oIHwgMTIgKysrKysrKy0tLS0tDQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BlY2kvY29tbW9uLmggYi9kcml2ZXJzL2h3bW9uL3Bl
Y2kvY29tbW9uLmgNCj4gaW5kZXggNWVhZTk2ODFlMzg1Li41NDk1OTA3YWI0NmQgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvaHdtb24vcGVjaS9jb21tb24uaA0KPiArKysgYi9kcml2ZXJzL2h3bW9u
L3BlY2kvY29tbW9uLmgNCj4gQEAgLTEsMTEgKzEsMTIgQEANCj4gwqAvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovDQo+IMKgLyogQ29weXJpZ2h0IChjKSAyMDIxIElu
dGVsIENvcnBvcmF0aW9uICovDQo+IMKgDQo+IC0jaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4g
LQ0KPiDCoCNpZm5kZWYgX19QRUNJX0hXTU9OX0NPTU1PTl9IDQo+IMKgI2RlZmluZSBfX1BFQ0lf
SFdNT05fQ09NTU9OX0gNCj4gwqANCj4gKyNpbmNsdWRlIDxsaW51eC9qaWZmaWVzLmg+DQo+ICsj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gKw0KPiDCoCNkZWZpbmUgUEVDSV9IV01PTl9VUERB
VEVfSU5URVJWQUwJSFoNCj4gwqANCj4gwqAvKioNCj4gQEAgLTE1LDcgKzE2LDcgQEANCj4gwqAg
Ki8NCj4gwqBzdHJ1Y3QgcGVjaV9zZW5zb3Jfc3RhdGUgew0KPiDCoAlib29sIHZhbGlkOw0KPiAt
CXVuc2lnbmVkIGxvbmcgbGFzdF91cGRhdGVkOw0KPiArCXU2NCBsYXN0X3VwZGF0ZWQ7DQo+IMKg
fTsNCj4gwqANCj4gwqAvKioNCj4gQEAgLTM5LDcgKzQwLDggQEAgc3RydWN0IHBlY2lfc2Vuc29y
X2RhdGEgew0KPiDCoHN0YXRpYyBpbmxpbmUgYm9vbCBwZWNpX3NlbnNvcl9uZWVkX3VwZGF0ZShz
dHJ1Y3QgcGVjaV9zZW5zb3Jfc3RhdGUgKnN0YXRlKQ0KPiDCoHsNCj4gwqAJcmV0dXJuICFzdGF0
ZS0+dmFsaWQgfHwNCj4gLQnCoMKgwqDCoMKgwqAgdGltZV9hZnRlcihqaWZmaWVzLCBzdGF0ZS0+
bGFzdF91cGRhdGVkICsNCj4gUEVDSV9IV01PTl9VUERBVEVfSU5URVJWQUwpOw0KPiArCcKgwqDC
oMKgwqDCoCB0aW1lX2FmdGVyNjQoZ2V0X2ppZmZpZXNfNjQoKSwNCj4gKwkJCcKgwqDCoCBzdGF0
ZS0+bGFzdF91cGRhdGVkICsNCj4gUEVDSV9IV01PTl9VUERBVEVfSU5URVJWQUwpOw0KPiDCoH0N
Cj4gwqANCj4gwqAvKioNCj4gQEAgLTQ5LDcgKzUxLDcgQEAgc3RhdGljIGlubGluZSBib29sIHBl
Y2lfc2Vuc29yX25lZWRfdXBkYXRlKHN0cnVjdA0KPiBwZWNpX3NlbnNvcl9zdGF0ZSAqc3RhdGUp
DQo+IMKgc3RhdGljIGlubGluZSB2b2lkIHBlY2lfc2Vuc29yX21hcmtfdXBkYXRlZChzdHJ1Y3Qg
cGVjaV9zZW5zb3Jfc3RhdGUgKnN0YXRlKQ0KPiDCoHsNCj4gwqAJc3RhdGUtPnZhbGlkID0gdHJ1
ZTsNCj4gLQlzdGF0ZS0+bGFzdF91cGRhdGVkID0gamlmZmllczsNCj4gKwlzdGF0ZS0+bGFzdF91
cGRhdGVkID0gZ2V0X2ppZmZpZXNfNjQoKTsNCj4gwqB9DQo+IMKgDQo+IMKgI2VuZGlmIC8qIF9f
UEVDSV9IV01PTl9DT01NT05fSCAqLw0K
