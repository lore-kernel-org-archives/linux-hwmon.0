Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6743F926D;
	Thu, 17 Sep 2026 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678214; cv=fail; b=TJMXiMJsqp3BZ7RMh1G4PpBbngUcH3dJejDeFM+benrutZmVve0ZRU/tLTelO6STZFr1PpE2zyi7WAfQ9nYLIVCfpufazzoejRHJJf7ARgzYUhRt5u4Cebdb0HsfNdDaCoUEuC9dDz3D0oe5d1GU9wAj1IpFi7lL0p8IWuNujUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678214; c=relaxed/simple;
	bh=PuxuGs9l5yM/s0raGKSvVk1OIOjc04F8iSJYnw8uf5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WCkHIk0712MduCk/3aBNg8aFCyGMmc1PJ6yfawtNCieAnN0gvUdO2ImDtLg21WO17HvDUjuSGIS97gaJ3ANsZD3w3X8yQuQIcrimnRccrWggPij7gG2tkfiXF5qDkXuLkQRa15UGLRtL5VoEZ3UsNrtEfYaQUdfbS+OTWQIYVk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHPWts7d; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHPWts7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789678211; x=1821214211;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PuxuGs9l5yM/s0raGKSvVk1OIOjc04F8iSJYnw8uf5w=;
  b=bHPWts7dBIs1UK0rwPVNutgKpazUMMwxYitirvHmGeL1cvXiFIOAA9QT
   ffGCBnUzEHc7ek4g6wqQLZi8EvMOr0NyCeMbCg4QO7kLCzka3ZigxoBuX
   ytFExH7eEKHCmt9x9PcenwduMh0Ik1+klclzDIZcKSsbANV0tktF2ToIo
   nQR+aX3iGVH9j635LlTv6X6eQHIUwrU5AYpsSqBzT4ioehkTOKk7YgKg6
   3d1EQOJFVQYEjW0oRvyY5pE/KHi7gRiBzxqIW4DxIg64rmtOTF60RngSA
   b/9XEUadjFVcwu/6JUyTOonRDQZsL4JjzZwKg/ZjzxE3P+VZZAZyMA00P
   w==;
X-CSE-ConnectionGUID: kwPB68puQQagbhDAQInZnQ==
X-CSE-MsgGUID: qsVbn/XoTBuZiF2voBgQjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100739988"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100739988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:50:10 -0700
X-CSE-ConnectionGUID: FrwMQoPuRIWUdZlQHGVYyA==
X-CSE-MsgGUID: zkrrSUbgS5CFnFcRFwk7FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297503179"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:50:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:50:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 13:50:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:50:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuCCTLF7rfRoOJ3GhFEUJk2ESV0WWIx/HOpcY0Uifg3Hisef/LPL+24Oz8t+H1OJP6+BjdFVXARws+AbM4cg+lHrGh+Xn6RGLkr3biXTuwgTWkJ9wSsIPVU6pPBc6vVMuflq77E8DmPQNaONONnb8H0vbOrnNRtT1WwhZ2iK8j0XlDMHGkDqBSsGhVirnzO6j5yhpij2p8cI3FSq0nwAQdDhsTxh7zqMYn84sr3xfp/kMpxBkSmbvaWL6N7iZ/skDhZIxWyVl9Wq6iOd059CLqzbsxmJO8LcgLE7mH2C1zQGZ/B9XBc2gYkPWxsd/M18dP2dOUSS2fa1k+RqKpT10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuxuGs9l5yM/s0raGKSvVk1OIOjc04F8iSJYnw8uf5w=;
 b=iQSEGDJmRcNCu93IlQYOrW48uF3aIZpfeqd4O+xDP9GSAx0vSO2ck7lddONGwszjeSOX/hwsbnf/bAFLYxImz0Y+/pCatouSCfzzOXvIXG/dKXEPsXknFi1fDr2zrcFu1TeleRGLiecvq33tNcOh4c3o0BvVUGMsc/T6ZlRMRZih2e5dfS/oF4TL4RoWKGjx8g4aKyan4wP5E5BqjLV/2BEinSejpSlZQor1oi22AODwQ8/K8r84ErEnVgh2nKhMq97vNSfSQx71DRfTq+yv2drVQqfDyycP4BZLPBJoCs88VeA4s8TsMHpCTTP45DSacdRe2hS3cKBXsgrSYKw+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:50:03 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 20:50:03 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v1 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdO6kij9Wa8aot0U+PLZS2kBqhurbLGoOAgADY3QCAB2GEgA==
Date: Thu, 17 Sep 2026 20:50:03 +0000
Message-ID: <f203548e535f3e60843fb12a8115efbe0030fc70.camel@intel.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
	 <20260903133408.110847-7-changhuang.liang@starfivetech.com>
	 <c89f582d-57fe-40d5-835b-5e5ce38daccb@roeck-us.net>
	 <ZQ4PR01MB1202109A402BBFDAD908C08EF2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB1202109A402BBFDAD908C08EF2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|DM6PR11MB4673:EE_
x-ms-office365-filtering-correlation-id: dc1f54ed-54d7-4cf9-2d73-08df14fd3fa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|3023799007|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: sz21pC5+9g1x5BxOHCjgnjaFYqRv+va7AsoashZLwvkWdgEh1t3a5rgIijV0JVYw2ySMpbiusIUgKECIakKrmjBHPSNs4+kY6rNVEmBWpPg9hmA+zmXmqRYmFCb/IFtk2jLDrJAg0MCSzs5/IYzkogaToatszw92GPFnr/MyrGPxbwZM4W/2ceOWkd+bqLDjsZQpVwjwY+7G34nWwplXhTFfIEkK/fjF/ZeDiya9NMAcrfmY36LcpR1jR7bkhPq3U5bksJ4LQO8WoNRjOzw2tH97Af787Gncyq4nKgfMlYN8FWeyp2oYbs9XTPyhjOWXSyGKyK7W0fi6mZwNb0I09X/6eITWFatTff43/LXMFuKx/HZ0/wjUMMMzyWtf7+yyiBALMczTgXHYOwLX5h9TEf9BS7x9h7iP+FMsl1ielL8Ijm12CvM/fJaYp8E49vS6SKoWqg18viqnBYw/XzNBelwwaQ5AoTxSXHsreA0bEcOcaKhbZK2Mc6YeqUZE0a5HEmux9gSNsJ7wooeGVjrhjIlQuOo+toaNIy3dGlNEQQgY/LGcqYb6dVzGhBDn5ChfcT2Lc9qL/DyxWy/qyBkYgpx+zx8AmatP9yP44UWfp3s6CWS400OOn+KMAUX0a/C1ELXf7gR8YsYeK2owIIGV/7//2VPsaw1ervxbmYH+44i7GTSgbX7T71h03b2njkH4aw0TFQVq8fa450mkWDSYWP9hn5o+I9wrrH9tRqU19OU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVhHbFhRWFRBMS82MWxMWEp6eE02TTBUZ1B0WWxET1RRb2wvWWZjSStBUUx5?=
 =?utf-8?B?UGlyb0hMYVlVMktleXJDQXVTV2l6WWpnMWZ5aXlXcDhYL1R2NTNRRktFMW05?=
 =?utf-8?B?Y3ZsQXB5WjF1YXFYSVZkK2ZGSzdGNHpvWWIvV2p1Q0hrdlRUNG9DWHFoUG9s?=
 =?utf-8?B?SGRwTnpnRnVLanVLVWNCNHk4aU8wTWV3NXZvVEVrSnpTRFM0Y3BEREExL3N5?=
 =?utf-8?B?bzRGWFZNdEtkNlMrTGhBWmlYRkpuVXVuNk1jaDlpSE9iTTlvSEQwRkZway9L?=
 =?utf-8?B?T1IwRk45VlAvZDQ2UGNiM00weHVpTW5jM3R2b0pmRnlCVG05Zitodlhyb21p?=
 =?utf-8?B?cEJyZmZZdWtiMnRVZHo3bmlXNklNMGR3K09WWE5pQ2dwQUY4WldWVDNzcFdk?=
 =?utf-8?B?dytsZmJla2JLampKd3Z2dCtpWHJOMitldHBBR0E5SXJRNmZIUWZUaUsyaHpM?=
 =?utf-8?B?bmt2ZkIyZVcrL2l3NklKejVnNVB1YldpNmtQZXFKNE55cUZTNUlMYkZLZnNi?=
 =?utf-8?B?cWdaN0ZEQTJYcFJxWk80MVZ5Y0U5eVhnZGd4M3BoRXRCVWlxNndjMlRHWUZO?=
 =?utf-8?B?eEJQOUlMSzY2YzlTK2haSzBNaGNZNlpjZnNjNHh4ZkxRQW4vbTlkRDJNdVFK?=
 =?utf-8?B?V09zZXA5MkFhem41eUdJOVdRcVJpQVFuaUoyQi9GQUE2NE9rZ2JHTmFEMWVz?=
 =?utf-8?B?ek9VOWNhaWdxbEhHVHZ5NUlXb0V5Tk0rczNnaHBjMGVNaGtTTlovNXpJN01I?=
 =?utf-8?B?QWFCRkxmRVcyYlZsV2NNb1JKb0x6cVRVRldvMEZKMGlrY1UxWWlKTU9INlh0?=
 =?utf-8?B?ZUVGSnl0WUVKbW5VVlpZa29KVjVyMVJjdTJPYnlRNHJFR0trRmtMTTRqd29p?=
 =?utf-8?B?SzNYekpGUHVrNVVKTUpYVjZjUVpSUXRYM1U2SmVZRlFoS0VPVE90MGc2eWtX?=
 =?utf-8?B?Y0hGYU9tNVdhQnRGZ3ptUU5xblVycjlYWnltQ0kvSG8rb01uVnd1R2xUNjdw?=
 =?utf-8?B?djZYYTVjMWVaTnZ1YjRCcGV5YStwR25IZGpXSHN2MFVCbnVDeW1UT00zUXFy?=
 =?utf-8?B?Z3duWlE1d0xSZCtqM25qZ3kwKy9QN2pTVHZsUHlEdm1ZVGEzd2lLTTdVSjV3?=
 =?utf-8?B?QWRNYXhHWTUrREN6MXNkNzg2MXd4U2FubDZCamhPYmRXcjA1V3Z6T2F2R1RH?=
 =?utf-8?B?RDJQbHM0aXdDbHVTb2QzTlluTEJkRXUzVlR1VTRUUkxreVR4UmxjU1NYWnBN?=
 =?utf-8?B?elJzc25IR0hHV1JZK0NoQUlqNUd1dHlQamNBaElNbGNVV3J6cmlCd3cyTlpp?=
 =?utf-8?B?S250ejh1dGE2aU9rYjB2c2M4OTNKQ2xOdmFOUS9VREdiaHlmamM1R0lhNU9v?=
 =?utf-8?B?VjhpbWw3Znl1MGVFSk9UTVpUNitWN2FnS0JyRlVEcXZlTG9WbWZlWkZOZmUr?=
 =?utf-8?B?ZjU4YzBDNE9xYVpTU1A1bHJPQ2dodXN0TlgzRVlBdUNmTVI2WjR4Zk02a0JQ?=
 =?utf-8?B?Y2o2MUJocFVzR2E0VVJtQjN4OFNQdFBvWWsydXBwdENKVDRzdEk5cVp6WFda?=
 =?utf-8?B?QVRCYkxWcVRzVEIwbGFGQ1VTeFNBRTM4dEliNUJWdzFUaXRaVlkyZDd1TU8z?=
 =?utf-8?B?anNEendPUENGK25kbzVHMHk2eGJEREdLWGJ1M01jSnk5NG9GK0ZRK1JJT0k4?=
 =?utf-8?B?Z1VnMnJNZUMrcmptZXNva24vL0h3RnJQcCtSYWVTb2pHNEo5OE9uSWtIQWRs?=
 =?utf-8?B?eGcrYzc4SWQ2V09DOG53R0JSK3JzdGdHU0FKMTl1eUsxbFJKZXkxQS9mSHVB?=
 =?utf-8?B?YkdwcWlGNllIRlpqTDF2dktFWnRIdXBZbXRQekNUTlZTSGFRMzNzY3A4T0M1?=
 =?utf-8?B?emJSWDFMeGM5RG9kdkVzcktJU0I3RFJzM0RvUUpSelVrc0RIME1CczY5MUUy?=
 =?utf-8?B?cnVQcHZTTTFzdW5oWE1lNE9TUVh6SzNxdGxHTWxRWVM4dXViOUNBTGFxYUQ1?=
 =?utf-8?B?cXZSaG42cXYzSmRyZy9KZmQrS1FHOTlCTmF4TlBnRHBtcWtuMDdtaEZLcS91?=
 =?utf-8?B?T2hnVjlRbzRKcWhBdG9jQlhiZ3ZUSFJXR0Nnc3JSNFVCQVdQYUpJdyt0Vk5Q?=
 =?utf-8?B?YzcvRDk2cTkxUFdXYTFGOW5ENkR0eEMvRE5pNHdRbWRNQnVlMXlqdmRCR1NU?=
 =?utf-8?B?djQvTG9LMHNpQnZ4M01CZHIxZGh6anAyT0drQTRxLytwSDJ6aWlseVdHZmVS?=
 =?utf-8?B?b1dIQm1wZDJIN1RZMDVYVk4ySDlpbHNhTEpLUVhJY1JUQk1pUWpUVWc2RDZ2?=
 =?utf-8?B?Y2xQbWhXQWxET242aG5iMkNoYWthQzNmWTZ4bDZpNEhFSk0ya2J6ZFd1VWpw?=
 =?utf-8?Q?KCaGZ8uVmo0cVvK4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A0A58B83507B247BCF6CE29198DF491@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uJTu0N9voLOludd9UA9L6Wi7s/Fwq7GhrtYP/RW6dhEeZEoCKJR//qTwTeYVOzYB2K3zwND6XetEP/nudVVnGBTj79qWlesax2xrly+Z1XmczfJ+XV0yLBQu1BI8EZ2ss3jUPTXnQV0pSAQ/W4/2fBP0DMMX+TR0qlQDY2iNUtcGPKCvGytWhkhAjBS+TrsxzSuG8UCTNg3Gvnr6RjCWDqR/MMVh7JoYISR6Se2qkLy5t3joWELl+YWXgeZ/KNrfH1OEG0H53LrRvaHeE3necxxUZD7jUG3/n4QdHfcg00TNTDEMwrrfdjxdpC76CqkucuB53F56VQDKgMiLnVgy2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1f54ed-54d7-4cf9-2d73-08df14fd3fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 20:50:03.7039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTWQCcxoXt+PMcMmnGgIv/vrfTAsSOZvCn4bK3CLji+omxsxED1iTRln57++vVTR2JYVT5vSYLwIJPoQQwRagQGrbghi4xLh7zogtLCGkEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-OriginatorOrg: intel.com

T24gU3VuLCAyMDI2LTA5LTEzIGF0IDA0OjA3ICswMDAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBIaSwgR3VlbnRlcg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KPiANCj4gPiBP
biA5LzMvMjYgMDY6MzQsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gPiBBZGQgc3VwcG9y
dCBmb3IgR3Jhbml0ZSBSYXBpZHMgKEdOUikgcGxhdGZvcm0gaW4gUEVDSSBESU1NIHRlbXBlcmF0
dXJlDQo+ID4gPiBtb25pdG9yaW5nIGRyaXZlci4NCj4gPiA+IA0KPiA+ID4gVGhlIEdOUiBwbGF0
Zm9ybSBoYXMgZGlmZmVyZW50IERJTU0gdG9wb2xvZ3kgZnJvbSBwcmV2aW91cw0KPiA+ID4gZ2Vu
ZXJhdGlvbnMsIHdpdGggMTIgY2hhbm5lbCByYW5rcyAoQ0hBTl9SQU5LX01BWF9PTl9HTlIpIGFu
ZCAyDQo+ID4gRElNTQ0KPiA+ID4gaW5kZXhlcyBwZXIgY2hhbm5lbC4gRGVmaW5lIHRoZXNlIG5l
dyBjb25zdGFudHMgYW5kIHVwZGF0ZQ0KPiA+ID4gQ0hBTl9SQU5LX01BWCB0byB1c2UgdGhlIEdO
UiB2YWx1ZSBzaW5jZSBpdCByZXByZXNlbnRzIHRoZSBtYXhpbXVtDQo+ID4gPiBhY3Jvc3MgYWxs
IHN1cHBvcnRlZCBwbGF0Zm9ybXMuDQo+ID4gPiANCj4gPiA+IEkgYW0gbm90IHN1cmUgd2hldGhl
ciBpdCBkaWZmZXJzIGZyb20gcHJldmlvdXMgbW9kZWxzLCBidXQgb24gR05SLA0KPiA+ID4gcmVx
dWVzdHMgdG8gcmVhZCBESU1NIHRlbXBlcmF0dXJlIHRocmVzaG9sZHMgKERJTU1fVEVNUF9NQVgv
DQo+ID4gPiBESU1NX1RFTVBfQ1JJVCkgdmlhIFBFQ0kgYXJlIHJlamVjdGVkIHdpdGggY29tcGxl
dGlvbiBjb2RlIDB4OTANCj4gPiA+IChpbnZhbGlkIHJlcXVlc3QpLiBUbyBoYW5kbGUgdGhpcywg
dGhlIHJlYWRfdGhyZXNob2xkcyBjYWxsYmFjayBpcyBub3QNCj4gPiA+IGRlZmluZWQgZm9yIEdO
UiwgYW5kIHRoZSB2aXNpYmlsaXR5IGxvZ2ljIGlzIHVwZGF0ZWQgdG8gc2tpcCBleHBvc2luZw0K
PiA+ID4gdGhlIG1heCBhbmQgY3JpdCB0ZW1wZXJhdHVyZSBhdHRyaWJ1dGVzIHdoZW4gdGhyZXNo
b2xkcyBhcmUgbm90DQo+ID4gPiBzdXBwb3J0ZWQuDQo+ID4gPiANCj4gPiANCj4gPiBBcmUgeW91
IHN1cmUgdGhpcyBkb2Vzbid0IGp1c3QgcmVxdWlyZSBkaWZmZXJlbnQgcGFyYW1ldGVyIGNvbnZl
cnNpb24gd2hlbg0KPiA+IGNhbGxpbmcgcGVjaV9wY2lfbG9jYWxfcmVhZCgpID8gVGhlIHRyYW5z
bGF0aW9uIGZyb20gZGltbV9vcmRlciBhbmQNCj4gPiBjaGFuX3JhbmsgdG8gdGhlIHJlZ2lzdGVy
IG51bWJlciBzZWVtcyB0byBiZSBkaWZmZXJlbnQgZm9yIGVhY2gNCj4gPiBhcmNoaXRlY3R1cmUu
DQo+ID4gDQo+IA0KPiBZZXMsIGRpZmZlcmVudCBtb2RlbHMgaGF2ZSBkaWZmZXJlbnQgY29uZmln
dXJhdGlvbiBwYXJhbWV0ZXJzLiBUaGUgZm9sbG93aW5nDQo+IGNvbW1pdCBoYXMgYSByZWZlcmVu
Y2UgZm9yIHRoaXMgcGFydC4NCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vY3AtaG0tb3BlbmJt
Yy1vcGYtYW1pL2xpbnV4L2NvbW1pdC9mODUxYTc5MTQzNTU2ZjBjMTM4NjE3ZDY4ZTkyNDA3MTQz
NGQ4YmI3DQo+IA0KPiBIb3dldmVyLCBhZnRlciBteSBhY3R1YWwgdGVzdGluZywgSSBmb3VuZCB0
aGF0IHRoaXMgbG9naWMgd291bGQgYWx3YXlzIGdldCBhbg0KPiBpbnZhbGlkIHJlcXVlc3QsIGNh
dXNpbmcgaXQgdG8gZmFsbCANCj4gdGhyb3VnaCB0byB0aGUgc3RhdGVtZW50IGJlbG93Og0KPiAv
KiBVc2UgZGVmYXVsdCBvciBwcmV2aW91cyB2YWx1ZSAqLywgDQo+IA0KPiBhbmQgaW4gdGhlIGVu
ZCwgaXQgYWN0dWFsbHkgbmV2ZXIgb2J0YWluZWQgdmFsaWQgZGF0YSBmcm9tIHRoZSBwZWNpIGNs
aWVudC4NCj4gDQo+IFNvIGluIG15IGN1cnJlbnQgdGVzdCBlbnZpcm9ubWVudCwgSSdsbCB0ZW1w
b3JhcmlseSByZWdhcmQgdGhpcyBwYXJ0IGFzIGRlYWQNCj4gY29kZSBhbmQgbm90IGluY2x1ZGUg
aXQgaW4gdGhpcyBzZXJpZXMuIA0KPiBJdCB3b3VsZCBiZSBncmVhdCBpZiBJd29uYSBjb3VsZCBo
ZWxwIGNvbmZpcm0gdGhpcy4gVGhpcyBhbHNvIG5lZWRzIHRvIGJlDQo+IGltcHJvdmVkIGxhdGVy
IGJ5IHNvbWVvbmUgd2hvIA0KPiB1bmRlcnN0YW5kcyB0aGlzIENQVSBtb2RlbCBiZXR0ZXIuDQoN
ClNpbWlsYXIgdG8gdGhlIGNwdXRlbXAsIGl0IGRvZXNuJ3Qgd29yayBiZWNhdXNlIHdlIGRvbid0
IHN1cHBvcnQgZG9tYWlucy4NCkZvciBHTlIsIHRoZSBJTUNzIGxpdmUgaW4gYSBkaWZmZXJlbnQg
ZG9tYWluLCBhdHRlbXB0aW5nIHRvIHF1ZXJ5IHRoaXMgcmVnaXN0ZXINCnVzaW5nIGRvbWFpbiAw
ICh3aGljaCBpcyB0aGUgY2FzZSBmb3IgYWxsIFBFQ0kgcmVxdWVzdHMgcmlnaHQgbm93IC0gYXMg
d2UncmUgbm90DQpmaWxsaW5nIHRoaXMgZmllbGQpIHdpbGwgbGlrZWx5IGNhdXNlIHRoZSBiZWhh
dmlvciB5b3UncmUgb2JzZXJ2aW5nLg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiA+ID4gVGhl
IG1pbmltdW0gUEVDSSByZXZpc2lvbiByZXF1aXJlZCBmb3IgR05SIGlzIDB4NDAuDQo+ID4gPiAN
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdA
c3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqAgZHJpdmVycy9od21vbi9wZWNp
L2RpbW10ZW1wLmMgfCAzNg0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
DQo+ID4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcGVjaS9kaW1tdGVt
cC5jDQo+ID4gPiBiL2RyaXZlcnMvaHdtb24vcGVjaS9kaW1tdGVtcC5jIGluZGV4IGJkM2U4NzE1
ZGZlYy4uOWU5OGVmZmViOTI4DQo+ID4gPiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvaHdt
b24vcGVjaS9kaW1tdGVtcC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2h3bW9uL3BlY2kvZGltbXRl
bXAuYw0KPiA+ID4gQEAgLTM0LDggKzM0LDEwIEBADQo+ID4gPiDCoCAjZGVmaW5lIERJTU1fSURY
X01BWF9PTl9TUFIJMg0KPiA+ID4gwqAgI2RlZmluZSBDSEFOX1JBTktfTUFYX09OX0VNUgk4DQo+
ID4gPiDCoCAjZGVmaW5lIERJTU1fSURYX01BWF9PTl9FTVIJMg0KPiA+ID4gKyNkZWZpbmUgQ0hB
Tl9SQU5LX01BWF9PTl9HTlIJMTINCj4gPiA+ICsjZGVmaW5lIERJTU1fSURYX01BWF9PTl9HTlIJ
Mg0KPiA+ID4gDQo+ID4gPiAtI2RlZmluZSBDSEFOX1JBTktfTUFYCQlDSEFOX1JBTktfTUFYX09O
X0hTWA0KPiA+ID4gKyNkZWZpbmUgQ0hBTl9SQU5LX01BWAkJQ0hBTl9SQU5LX01BWF9PTl9HTlIN
Cj4gPiA+IMKgICNkZWZpbmUgRElNTV9JRFhfTUFYCQlESU1NX0lEWF9NQVhfT05fSFNYDQo+ID4g
PiDCoCAjZGVmaW5lIERJTU1fTlVNU19NQVgJCShDSEFOX1JBTktfTUFYICoNCj4gPiBESU1NX0lE
WF9NQVgpDQo+ID4gPiANCj4gPiA+IEBAIC0xMjUsNiArMTI3LDkgQEAgc3RhdGljIGludCB1cGRh
dGVfdGhyZXNob2xkcyhzdHJ1Y3QgcGVjaV9kaW1tdGVtcA0KPiA+ICpwcml2LCBpbnQgZGltbV9u
bykNCj4gPiA+IMKgwqAJaWYNCj4gPiAoIXBlY2lfc2Vuc29yX25lZWRfdXBkYXRlKCZwcml2LT5k
aW1tW2RpbW1fbm9dLnRocmVzaG9sZHMuc3RhdGUpKQ0KPiA+ID4gwqDCoAkJcmV0dXJuIDA7DQo+
ID4gPiANCj4gPiA+ICsJaWYgKCFwcml2LT5nZW5faW5mby0+cmVhZF90aHJlc2hvbGRzKQ0KPiA+
ID4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+ID4gKw0KPiA+IA0KPiA+IFRoaXMgY2hlY2sg
aXMgdW5uZWNlc3Nhcnk6IFRoZSBhdHRyaWJ1dGVzIGFyZSBtYXJrZWQgYXMgbm90IHZpc2libGUg
aWYNCj4gPiByZWFkX3RocmVzaG9sZHMgaXMgTlVMTCwgYW5kIHRoaXMgY29kZSB3aWxsIG5ldmVy
IGJlIGNhbGxlZC4NCj4gDQo+IFdpbGwgZHJvcCBpdC4NCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4g
Q2hhbmdodWFuZw0K
