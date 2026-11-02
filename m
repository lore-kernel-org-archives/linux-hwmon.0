Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793613446;
	b=kSr/B/iydlc3435LbQqja7StO7yRNw7waLuNKbEOgtOMUQb8gi7OiYzuMTY1vSNf91vM
	 LLIBB//kk5ZCCTZNOF9do5c04y9+neRT8I4uyrGW2lr3p/Zi6EGfOZI46VcAQ65+aADEM
	 KS1rWoN9fkrjDk+rXaDd1W54F8kgQx6HCkjMHOw9y/s9dMoxhqYPngq6M54um6p6RsZ/n
	 3RM0RjM6/VyIHzTsnTnxAepRa0pDVfgj50FbxbbuIOdJ5aC52bympd+zPeMRH2pR2eQcP
	 kAIF5jFRzn5CPqFJ//fZkRIE1UiCgqxyGoxEN004IYx5J7qyNw1SdvOcPP1XOjXTAww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613446;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
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
	bh=yGCzzYiHQ3eD4VYbbXYUqifkpN0xE9grA/4krDSd2qw=;
	b=w8a7AVbwlGuzhXBxBYBlvnq/o6uMzPjwqLQzZosJIZ9BMBMZIZ4sYlO0Eoe6jpvUAfmu
	 ZphEc2Ka3prpmxUNLtDXFbqaWnA1+aYE8mwF0w26Zhl7ikJLfITaIbpfmjVN+iMZN509b
	 ZnuQh0ZVwZ23VfrUbMT0fj5cABnt/+EFMqyrGXCoQ3qRbJQI7MHivm+c3/8GuSi7KCKsr
	 8bBl+C5xBeF0j3wAQiGzBy+3NdbpF0S/RSqNCsCP5OiL8Ixd7a+fxPV+hV0b71sJwBE1x
	 aP/2ydYhmvCzJYHqIicRsTTOoxQeqnztJhRcmZgsuY27r2stXspUBEmrbNng6L/So6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OMrQqfLu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AF606A324;
	Mon,  2 Nov 2026 09:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88AF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OMrQqfLu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793613446; x=1825149446;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yGCzzYiHQ3eD4VYbbXYUqifkpN0xE9grA/4krDSd2qw=;
  b=OMrQqfLuS8ziT3uNWqGB+MfL/AgXda2XP0G/nJN9sb+TEbgocZA0rCYv
   QH66soSRE1yb2Cqzi+UjwKHxxlM60qo9JFRPyMmgsfWxl5BpfeeVrlr5h
   7825aJfPvzvKTeW0bFQh6l8PxyXqrkPuaTbguiSMktS0qwe9PuJoUlkLy
   +NBI16Lz/Xv0ZloDWJ5R9BVhBf1wagjEtYsfuLa/d/wmFKJB2OZn5RPqw
   ns0SaUWUC/4PXQuaWDKI/0uHXQwWGUv2qpEsnZp1eX1r2gppzxSdaDgbg
   61qM4VmJJq1RVsts4ordEBEiSGSJvrUwlm6YhatAhMd8LUnJ9t59didyP
   g==;
X-CSE-ConnectionGUID: 7Bj29773SNqY4ioyuMo21A==
X-CSE-MsgGUID: pC688o4AT5a4CAuxtOy2Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2179785"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2179785"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 01:57:25 -0800
X-CSE-ConnectionGUID: SgzZNX1XSi6OsipKzadxLw==
X-CSE-MsgGUID: +2L2Exx8QmGNtKRzzii++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="7843862"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 01:57:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:57:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 01:57:24 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:57:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKPYMQ+gSzJPSpq8IAuu2QfOhmpW3aCCqWc3QIa4qeETCrElpspz9w1A2RSdAHgNZ6jF7ICDMgCO9Q/QpSez/ARb7wg82Z+2gBMzDxs0SBj4vvsWWE4RDOS1ZVW/PjChhc4EGbYIGkEhMu/Rgz5uOIKmhwGBf/XZs8USPJdfgPOasr3JVc4nXgMhWKs2aBSPp9P7SlUSXP2qTEdXWrP8HyVnTeicxzXHANJIVeeJmDTpHXbu/GDK6rtjng9jjDLPgTe89FA3GrHTrvGs2YnSbaaUl32xp6VzLb6hF/gHGL9/9vYAKlzAFZRJfMuEEBgarb0a9OF4n4a7d+DfSPdjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGCzzYiHQ3eD4VYbbXYUqifkpN0xE9grA/4krDSd2qw=;
 b=DsfI32ROZ4TpzrMPdzdy93pst/sLYhVRlSrYSA6uhS7geH+hf7MVDfWVpKXGdOJtEFjJjoP0ziFUI4X3iIy1MFcM6nPjKdXL433ot4lpZtUM3hid4Ph92F4SIX8BUh/DNs3WDjh36vjy1UolGSgd39+NIpHf0BsTE0e1nArBZ3X6acXrL2aCl6DWi2sLeGIL5/UQuK62vS84OhXdncqM0a3hskN9aOP998hDTwo9YVBkp7Kz+wW0uN59yJAuUMK0YerXulzJ290BkbaqMW6Rbj1ZumBnQ+21PbYawAMh2PfyDeX8gRJZCr6vbWz9Q2x8f8KfyRkicDJ/YbmoQs6caQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 09:57:21 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 09:57:21 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v4 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v4 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdX79c4wqWfPKX9UWBTqhZe1DROLcWkgyAgAQPjYA=
Date: Mon, 2 Nov 2026 09:57:20 +0000
Message-ID: <2dca8ff44c92473a5cf461df6bd838ee5d87d066.camel@intel.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
	 <20261019114502.55307-7-changhuang.liang@starfivetech.com>
	 <215a0b5a-9fda-4bce-bff5-b9e4bb5c3928@roeck-us.net>
In-Reply-To: <215a0b5a-9fda-4bce-bff5-b9e4bb5c3928@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-2.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|MW4PR11MB6786:EE_
x-ms-office365-filtering-correlation-id: 35ccbdd3-53ba-4436-8c75-08df38c7afe0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|38070700021|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021123027099003|261021121427099003|261026121527099003|261022105027099003|261022075727099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: orerCD65nA+qZ0zipcs3B+9MFex5B8PVcpxn1xZyPOC7aa7jYx0cfe0MTSRWxbWmwTn9xntHOTKmCa5W3Qv3JBb4aRW/rXK/bwLFdTXnJnfXjuDBSg5/kLQTIEvUSFNEbZvM5svb+OEum5pDzJAkt5dE2nV33odJ6nCJOxkPxabD+xIfUlmS+DMNHSGA/Ego0PgG10u565EvpM9qXRIxYBvtqkehu4k5jSsFuHa/fXUKfFTce/PnBBhX1+Lmfg7KJBWLAfdC1iVnTSyipWX1nsDs9QwIZ+yXjYHFvrHrSCLaRMBgi9FNYbrK5ggkatQWuM++kSq2Zk6nhgcHb5UTxL9kDS3nnnlFhHs97lxX4+wt+zZVUrNrz337YqSsD2/D/531OPZcFXIMVk0nLm6/s0usM30EtIKayZV20sVzRHSIbOJ+1K9NM9rueWrYWWJr6aQMpsT7FFFllhWVlaO6fDZjqcv1PfY2S5IknVSGWO4UWKVUhB2+7T1anYD6ehBwjQL0VbSN2uBG0OLzTVAfpYoJoLhFEq0YXNfvIGEUT/99NSqIIabVsDmaCwgBQgksxxRSZigozEiW28rJKzEt7Ia2RFgAu1s/Sn6irCSrLGDL/V2FfZMXPgltVjQGBEU9NL3XOE5B/QQN4gCtJOrk8MDPp1RyzUC/Iu4RKnebN7NC+DNVEWsd2Cm2MoBynTtxFuUyJuJwPMkQpFqNJ1kdgrwsmgspReDQssx9Xwp4Uao=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261022105027099003)(261022075727099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXpYNnkxZFFaVnF6Q1o3d3BMRGdkZjBLTmVwUEpnWEthOEZNeStiQlh6bytq?=
 =?utf-8?B?U3BNbFE4S3lidlI1VkVWbWYwTWFETU9uMFZKUnBJVVJaNnZqKzI0UFRWN3hB?=
 =?utf-8?B?TTB6dzdhbU1tOVJTVlUrTi9WdlhLckFWdmV1c3h6WTlPaG5vSmdRbmVTOHhC?=
 =?utf-8?B?d2MyNjFYa2o4bzBnenBEYTFSc0llKytNUFJPQ3ZNS1BXd1M0QkgyeEhUdDA5?=
 =?utf-8?B?Y0p4R3JSSmkxV3VMeVhPZjJCS3NjSlc1T0o1OUpYNzNUOG1qTlo5aXdOekNv?=
 =?utf-8?B?SW56azJWcXhyczAzd0lkYlhZQ0VXbjUwQnVoUUR3K2VGazR3NDc0U0VCQ2gy?=
 =?utf-8?B?aU5qeUZjd1p0NHk3N1JFQVdNQW9nZ2kzdVYxbGhCWm9ZaUk3cDZsYjdhSWda?=
 =?utf-8?B?NTFlRi84eXRUZ1BYaCt6K2YrL2d2OUdRZTdtRkJvWXBqQWJTQ3dZNFJ3R0tV?=
 =?utf-8?B?bkRRS1lMMVNXTzh3bWdGbVJEU25FUWxjL2lIenNiZUU3M1liczY2cW9jYllH?=
 =?utf-8?B?aFNXdEhGTm1OcnVaV2gvZWdXTCtVSGtsRExpZEhXSG9hTEpkVW96NmZ6MGY5?=
 =?utf-8?B?SjRmNWhhdEpUZThyVVlQbEVOZHFFK0VPL05rcTllRGF0Rm44clkyVUtQWE1a?=
 =?utf-8?B?OEZySDYycmpndjJDYTVxTzdMWTFUUTAxcXE5SE5Ua1M2LzdUcWQ3OFB1bGov?=
 =?utf-8?B?K1llNDJ2aGRZOVNEbk9OUmZxTFB3ZUJlcEtZWVA3dFRwUkpwNTVoWDd0WGJW?=
 =?utf-8?B?dy9DQnhLeWlXZWduVTdKY2JaRVpWSldNdzJ5V29uZUpSem1xL082MkZyNDU1?=
 =?utf-8?B?LzcwdHJ6V2FFR3c1ekhmRlJ4WXlSaDFWTzdqVkFndWVIOERrL3NBR0g2Wm5T?=
 =?utf-8?B?S3lqU01QNEJXNk1CSnA5VVV1R283amU1VTFPMWNwNTY4eEFOUU1IOWZBZklW?=
 =?utf-8?B?OTZPQW5GRUxTMndGbVJGZTNLN09RNWl1ZXhNS01UM0wxdnovS0FieVhOdE1F?=
 =?utf-8?B?MkFRbWVJdTBrM09XUXRXcWdMOXpuK2oyR0lNdk5mRWhYVnRPWktoWXZ5YWhG?=
 =?utf-8?B?cXBlR2JYUHRsbSs2THNvcTRHU2VFcVd5YkpjMGVLRVhkQXByd1ErNTQvNTVR?=
 =?utf-8?B?UVJFd3JRblNkK3p1dGpVUElaMGN1SWhYQ2NEK2VKQzl1MUFiaDR1WE9yVVlZ?=
 =?utf-8?B?VjAvSUF1cnpTV3FxNDZWbzREcTE4SEwvLysrVFFkcWdKc2toVnorUFRNL3l2?=
 =?utf-8?B?clNsb2RFVmlkYkppVE9mbzBtQzdocldCZGl2c0djeHFiTHZFN2JWejdzYkVJ?=
 =?utf-8?B?Mm5yQ3FJSWtoemNhSU1kWjJJd0hTYXBJYi9raERSKzFoT1JOb0dwTmZKNGlL?=
 =?utf-8?B?alNKNTlkdUlTbmpKdWpwQ3FaSldWTUdTcEtqa3U0bDlJUTQvV0xiWGpzQ2lC?=
 =?utf-8?B?MVloN2FaelBvcnpuSktIQ0paanRUUWJUTHIxditOR2swN1A3WGExUDhuUVcx?=
 =?utf-8?B?enYzbS9xMGVlNy9TeHU2VlhQVTJydXpEeFVyamVyQjcrcHQwRVhtZWJmU1dW?=
 =?utf-8?B?alN3UTZLQnhHWHpIcXdnTzIvV2dDYUtWK1NrekxLbWR4VXBsSXRENGhxQk1K?=
 =?utf-8?B?SWtPSVF2RGFFU3ViK0x0TVRtZTZ1MUN0ZC9vWEVVdWFPUm1ISVVjd2xRQy9D?=
 =?utf-8?B?cm9SOUtPMm1QRExKeW55OHBCa2tWWlpIZHJsM0FuTWtPekp6NS9VQVBwbVJU?=
 =?utf-8?B?Umh4aExJMVE3a0FPLzBJeDRUKzJFdHBFVHdDNzQ2Z2xOUi9xZkVrR1VWaGhz?=
 =?utf-8?B?RDFzNi95emYwSEhzMDg4RVNwWnoxb0JOYUpKMHlETUpZREYrQzNkMmdvN2dC?=
 =?utf-8?B?RXRWY3U3eGhvd1dBb2EzTm1MTllzTkFYY2s1M250YldySlhqQzM4NWNSbnR5?=
 =?utf-8?B?N3VhdkVOaFVVTzJ0MHFlQUQ5ejRuMUk0T2c1VWxKck82N0hETFRkajVGbm5C?=
 =?utf-8?B?VFlEb3ZZYkhud2JEZU0vRGdzcU1VUE43UU8vK1JWRU40QzhHYTJScGNaUjNw?=
 =?utf-8?B?SWlVTk45VndnYjBhbDhoTG8xdjh4MVNVNkd4aTBSMWRZOWI2T25kRGtjREdP?=
 =?utf-8?B?c25Wak1oQ0ZudHQ1YmRPSms3YmlvMCs1N25oZ1JWaWd6OGNnWjNpVzZmajk0?=
 =?utf-8?B?RjZhSWs0Vmg1czg2MXdhdXFLaEtjNDIwY01uQTJaRG0xMVRwcTZUb2JuUnUr?=
 =?utf-8?B?eXBaeEhqNUFweTBzSEw1LzBROEZ4ZG9qUGl4aHRnMmhkTkRLeFI4cTVNcXk3?=
 =?utf-8?B?OTBWSllOMUFZUk9MZUlMNkRKeGZDRHdWak1tZThqZFpYcXg3R0NYamFzaVZh?=
 =?utf-8?Q?pxS5qhIOorwdvZj8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5D8EE6663D6A54CA55673E7803EA253@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: BYf46UpaKA5fDhN46bVNRLB45HozLmridHCC9cwrsViXoCuLYlYa7jJQuj0UjvKY7naoPWrb/1l1AEoT75h9XKrgZb3FfVHDd0XXli23yK8TokVQ6a6150i3DoaMvOeBdOjmKCl2uW+ikGNF9OYFMTqlUskHgF1340xFarz/w03SC3YNuaizL5rjTLRafpKH6R/EVsjUfO6NrOIeiTenTSgqdhDUfzFtwtE+p9nR11A9XP4d6yPwpPR/tt0AkfF9Gd1yCGjh4AfAlJRPoI5fiW9J80ZujEccH00CKJt2rVB6WCWMGW6VOvVlXA03t6wzuXR9dhcocMKgkdYEi4sToA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ccbdd3-53ba-4436-8c75-08df38c7afe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 09:57:21.0169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgH7Oq0PjvT2PApvGiVvDSzzqhG23RzyqwWOeNmE27UaEADENXeRgAJox8XNkDhJyPIneuaLRGkx/jsogcC8emW1bxNrqwOao6rMWjI/2HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTEwLTMwIGF0IDEyOjU2IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAxOSwgMjAyNiBhdCAwNDo0NTowMkFNIC0wNzAwLCBDaGFuZ2h1YW5nIExp
YW5nIHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBHcmFuaXRlIFJhcGlkcyAoR05SKSBwbGF0
Zm9ybSBpbiBQRUNJIERJTU0gdGVtcGVyYXR1cmUNCj4gPiBtb25pdG9yaW5nIGRyaXZlci4NCj4g
PiANCj4gPiBUaGUgR05SIHBsYXRmb3JtIGhhcyBkaWZmZXJlbnQgRElNTSB0b3BvbG9neSBmcm9t
IHByZXZpb3VzIGdlbmVyYXRpb25zLA0KPiA+IHdpdGggMTIgY2hhbm5lbCByYW5rcyAoQ0hBTl9S
QU5LX01BWF9PTl9HTlIpIGFuZCAyIERJTU0gaW5kZXhlcyBwZXINCj4gPiBjaGFubmVsLiBEZWZp
bmUgdGhlc2UgbmV3IGNvbnN0YW50cyBhbmQgdXBkYXRlIENIQU5fUkFOS19NQVggdG8gdXNlDQo+
ID4gdGhlIEdOUiB2YWx1ZSBzaW5jZSBpdCByZXByZXNlbnRzIHRoZSBtYXhpbXVtIGFjcm9zcyBh
bGwgc3VwcG9ydGVkDQo+ID4gcGxhdGZvcm1zLg0KPiA+IA0KPiA+IFNpbmNlIHRoZSBjdXJyZW50
IHBlY2kgY29yZSBkb2VzIG5vdCBzdXBwb3J0IGRvbWFpbnMsIGFjY2Vzc2luZyBHTlIncw0KPiA+
IERJTU1fVEVNUF9NQVggYW5kIERJTU1fVEVNUF9DUklUIHZpYSBQRUNJIGNvbW1hbmRzIHdpbGwg
YmUgcmVqZWN0ZWQNCj4gPiBhbmQgcmV0dXJuIGNvbXBsZXRpb24gY29kZSAweDkwIChpbnZhbGlk
IHJlcXVlc3QpLiBUbyBoYW5kbGUgdGhpcywgdGhlDQo+ID4gcmVhZF90aHJlc2hvbGRzIGNhbGxi
YWNrIGlzIG5vdCBkZWZpbmVkIGZvciBHTlIsIGFuZCB0aGUgdmlzaWJpbGl0eQ0KPiA+IGxvZ2lj
IGlzIHVwZGF0ZWQgdG8gc2tpcCBleHBvc2luZyB0aGUgbWF4IGFuZCBjcml0IHRlbXBlcmF0dXJl
DQo+ID4gYXR0cmlidXRlcy4NCj4gPiANCj4gPiBUaGUgbWluaW11bSBQRUNJIHJldmlzaW9uIHJl
cXVpcmVkIGZvciBHTlIgaXMgMHg0Mi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1
YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCj4gDQo+
IEFja2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQoNCkhpIEd1ZW50
ZXIhDQoNCkNvdWxkIHlvdSBwbGVhc2UgdGFrZSB0aGUgaHdtb24gY2hhbmdlcyB0aHJvdWdoIHlv
dXIgdHJlZT8NCg0KVGhhbmtzDQotSXdvbmENCg0KPiANCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMv
aHdtb24vcGVjaS9kaW1tdGVtcC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMg
Yi9kcml2ZXJzL2h3bW9uL3BlY2kvZGltbXRlbXAuYw0KPiA+IGluZGV4IGJkM2U4NzE1ZGZlYy4u
NzkxYThlODY2MDgxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaHdtb24vcGVjaS9kaW1tdGVt
cC5jDQo+ID4gKysrIGIvZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMNCj4gPiBAQCAtMzQs
OCArMzQsMTAgQEANCj4gPiDCoCNkZWZpbmUgRElNTV9JRFhfTUFYX09OX1NQUgkyDQo+ID4gwqAj
ZGVmaW5lIENIQU5fUkFOS19NQVhfT05fRU1SCTgNCj4gPiDCoCNkZWZpbmUgRElNTV9JRFhfTUFY
X09OX0VNUgkyDQo+ID4gKyNkZWZpbmUgQ0hBTl9SQU5LX01BWF9PTl9HTlIJMTINCj4gPiArI2Rl
ZmluZSBESU1NX0lEWF9NQVhfT05fR05SCTINCj4gPiDCoA0KPiA+IC0jZGVmaW5lIENIQU5fUkFO
S19NQVgJCUNIQU5fUkFOS19NQVhfT05fSFNYDQo+ID4gKyNkZWZpbmUgQ0hBTl9SQU5LX01BWAkJ
Q0hBTl9SQU5LX01BWF9PTl9HTlINCj4gPiDCoCNkZWZpbmUgRElNTV9JRFhfTUFYCQlESU1NX0lE
WF9NQVhfT05fSFNYDQo+ID4gwqAjZGVmaW5lIERJTU1fTlVNU19NQVgJCShDSEFOX1JBTktfTUFY
ICogRElNTV9JRFhfTUFYKQ0KPiA+IMKgDQo+ID4gQEAgLTE5OCwxMCArMjAwLDE4IEBAIHN0YXRp
YyB1bW9kZV90IGRpbW10ZW1wX2lzX3Zpc2libGUoY29uc3Qgdm9pZCAqZGF0YSwNCj4gPiBlbnVt
IGh3bW9uX3NlbnNvcl90eXBlcyB0eXANCj4gPiDCoHsNCj4gPiDCoAljb25zdCBzdHJ1Y3QgcGVj
aV9kaW1tdGVtcCAqcHJpdiA9IGRhdGE7DQo+ID4gwqANCj4gPiAtCWlmICh0ZXN0X2JpdChjaGFu
bmVsLCBwcml2LT5kaW1tX21hc2spKQ0KPiA+IC0JCXJldHVybiAwNDQ0Ow0KPiA+ICsJaWYgKCF0
ZXN0X2JpdChjaGFubmVsLCBwcml2LT5kaW1tX21hc2spKQ0KPiA+ICsJCXJldHVybiAwOw0KPiA+
IMKgDQo+ID4gLQlyZXR1cm4gMDsNCj4gPiArCS8qDQo+ID4gKwkgKiBTb21lIHBsYXRmb3JtcyBk
byBub3QgcHJvdmlkZSB0aGUgRElNTSB0ZW1wZXJhdHVyZSB0aHJlc2hvbGRzDQo+ID4gb3Zlcg0K
PiA+ICsJICogUEVDSSAtIGRvIG5vdCBleHBvc2UgdGhlIGNvcnJlc3BvbmRpbmcgYXR0cmlidXRl
cyB0aGVyZS4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKChhdHRyID09IGh3bW9uX3RlbXBfbWF4IHx8
IGF0dHIgPT0gaHdtb25fdGVtcF9jcml0KSAmJg0KPiA+ICsJwqDCoMKgICFwcml2LT5nZW5faW5m
by0+cmVhZF90aHJlc2hvbGRzKQ0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsNCj4gPiArCXJldHVy
biAwNDQ0Ow0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGh3bW9u
X29wcyBwZWNpX2RpbW10ZW1wX29wcyA9IHsNCj4gPiBAQCAtNjI2LDYgKzYzNiwxNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRpbW1faW5mbyBkaW1tX2VtciA9IHsNCj4gPiDCoAkucmVhZF90aHJl
c2hvbGRzID0gJnJlYWRfdGhyZXNob2xkc19lbXIsDQo+ID4gwqB9Ow0KPiA+IMKgDQo+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZGltbV9pbmZvIGRpbW1fZ25yID0gew0KPiA+ICsJLmNoYW5fcmFu
a19tYXgJPSBDSEFOX1JBTktfTUFYX09OX0dOUiwNCj4gPiArCS5kaW1tX2lkeF9tYXgJPSBESU1N
X0lEWF9NQVhfT05fR05SLA0KPiA+ICsJLm1pbl9wZWNpX3JldmlzaW9uID0gMHg0MiwNCj4gPiAr
CS8qDQo+ID4gKwkgKiBSZWFkaW5nIERJTU1fVEVNUF9NQVgvRElNTV9URU1QX0NSSVQgb3ZlciBQ
RUNJIGlzIGFuc3dlcmVkIHdpdGgNCj4gPiArCSAqIGNvbXBsZXRpb24gY29kZSAweDkwIChpbnZh
bGlkIHJlcXVlc3QpIG9uIEdyYW5pdGUgUmFwaWRzLCBzbyB0aGUNCj4gPiArCSAqIHRocmVzaG9s
ZCBhdHRyaWJ1dGVzIGFyZSBub3QgZXhwb3NlZCBvbiB0aGlzIHBsYXRmb3JtLg0KPiA+ICsJICov
DQo+ID4gK307DQo+ID4gKw0KPiA+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBhdXhpbGlhcnlfZGV2
aWNlX2lkIHBlY2lfZGltbXRlbXBfaWRzW10gPSB7DQo+ID4gwqAJew0KPiA+IMKgCQkubmFtZSA9
ICJwZWNpX2NwdS5kaW1tdGVtcC5oc3giLA0KPiA+IEBAIC02NTksNiArNjgwLDEwIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9pZA0KPiA+IHBlY2lfZGltbXRlbXBfaWRz
W10gPSB7DQo+ID4gwqAJCS5uYW1lID0gInBlY2lfY3B1LmRpbW10ZW1wLmVtciIsDQo+ID4gwqAJ
CS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmZGltbV9lbXIsDQo+ID4gwqAJfSwNCj4g
PiArCXsNCj4gPiArCQkubmFtZSA9ICJwZWNpX2NwdS5kaW1tdGVtcC5nbnIiLA0KPiA+ICsJCS5k
cml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmZGltbV9nbnIsDQo+ID4gKwl9LA0KPiA+IMKg
CXsgfQ0KPiA+IMKgfTsNCj4gPiDCoE1PRFVMRV9ERVZJQ0VfVEFCTEUoYXV4aWxpYXJ5LCBwZWNp
X2RpbW10ZW1wX2lkcyk7DQo=
