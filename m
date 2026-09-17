Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E6F376A03;
	Thu, 17 Sep 2026 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678169; cv=fail; b=ATpOG6sx5DuOVMYPnsiKX/qMPJzyldSrxNdymxJKjeQkN4RTaQCx5ZoUbhK4uJT0SmEcfp/xAz9bqUnM9ewIWgsBl2e48AOErH3DFN6AtRkVe9Xwmvoiz2nxSRAV1MCtrJ7MPgdVjN6/QlC/8UAF+EO047Iz5eHRxYseoSROe2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678169; c=relaxed/simple;
	bh=48ioiyKkFmqWgsWwrFCxSrSXIYdxhPDjBMVW2jId/Ek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fIJ5jVirX5kCAatmL8XDkPHa5rgOpZjcK4sftHXueAlCzj5P366YyVP++2LhYUx45RMSGgl3+fS1rBV4DqeftRKXyWBpx4fWRxM5vBXaz0sDHCG2zb0+xdWRlEzFLjHqGJlDWKOjecu8Wky9TNR1wWevV+ODC+vUX3W2M+nOb4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeVfnq6X; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeVfnq6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789678168; x=1821214168;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=48ioiyKkFmqWgsWwrFCxSrSXIYdxhPDjBMVW2jId/Ek=;
  b=ZeVfnq6X96d/+1gR/Z9tVtTA637/InjHpn5eLbYzbmj/zrCpBNmKEd4v
   3Xg0p1mcTVp7S4MZ27JZr+I2WloTGKBIs1NDjIW+fonM51JNEOqviVPC4
   DKJYUL3if/XG4AahCukWXOJfRJY2buOt0t55xv3qcZaCjkaUHUdSyKCoF
   K7GIi/WKb0s10GSanr6PqBr96GWItOLmWWItMB2QqLKrOTNmfFeBFmHxw
   4PXGgDsfRg34LAE0ChfVBIFuUyCrmLAIC/9IoeG/1oSsDyEfZDjcEj1PF
   xb/6f98c9z9Q+6bLsujmWUQ6vOrop103KgdV6yN5D3CDIgXLR9HdZQhPP
   w==;
X-CSE-ConnectionGUID: 3bDoZbnWR/CnQs9ksvBf0g==
X-CSE-MsgGUID: f8bc7T/sSjSZLsc6RYxdxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100739903"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100739903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:49:27 -0700
X-CSE-ConnectionGUID: BMRAZq3MS1+HddHJN4dGKQ==
X-CSE-MsgGUID: kntGA1KlRzOot5OQUnYvRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297502894"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:49:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:49:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 13:49:26 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:49:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq7wrT3KLh9nkHKRYR0a+egllE5Ws6MJSrFr9ePpgpdOxRU9YzYBWPR+aHR4JrT6tDnY5DphtU8fCLXrn3Mud8h3Bpt49F7bShrzB6V0+1/TxwoLH+uuQUUtH51SXbVUSnl4/vRum/wwUkD7tu9FdZthPLdyoQQ4G6VQNefHDiihbNzUkukENRw/lbigsQYP2gtDeKJQZgKNAT/8cF51JoUfBfPVVuIBh0MOaSA9OU5+HaLE0xbm9lMbdtXGksxD6Y3IllZwg982TdKS5U24A+L1avC7ittlyLrkKK96x5xKCmTHmPTxbjh3C7hsNb2iw9HXYWb+dBj//r+A6xds1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48ioiyKkFmqWgsWwrFCxSrSXIYdxhPDjBMVW2jId/Ek=;
 b=E4CVf3Yvcv//AX+RL0QUUu6MPj9C2IXNr20B/y+NH+MPSz/DNclZXSSxgRsNLUbvTs3+h/KY2MPIP/Zd9rMcouLmjsypMEb+gQMeRf3JW4bxRaIl92TtNQw2cR9A1rWX/v9ywJhL0W1fm8/YEWVYrBD0X6wgCcf1b13h5NOkQnwXbPfgMeT7d58EpDKIHvFC2yn/qMKjRAcBL6H/uwk+taxJ4ZUEmbR97E4P6Imz1mLpBf+Mtrh3w7iw9sEycuwVXhm+S4yqQry8MpySjalaXikuBDmNU9ChHXOmnfQewL/Xt9Ze6qn0ygTMZgJMRK/9z9nx2cQBMDcLpNc9wgdvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:49:24 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 20:49:24 +0000
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
Subject: Re: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdO6kfs81BNcYZr0KAQ4qQeV0ub7bLG0uAgADPgICAB2nrAA==
Date: Thu, 17 Sep 2026 20:49:24 +0000
Message-ID: <1019d238455fbe7767f50d063566f4f43056807e.camel@intel.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
	 <20260903133408.110847-6-changhuang.liang@starfivetech.com>
	 <b47789a3-731e-44c4-a954-e9352529cdf5@roeck-us.net>
	 <ZQ4PR01MB120212E0FFA32C9501736A94F2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB120212E0FFA32C9501736A94F2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|DM6PR11MB4673:EE_
x-ms-office365-filtering-correlation-id: 25aa8442-52b4-4c40-06e8-08df14fd2861
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: /TJtxyTJ17etyFE3ZLL/xIdWLhKMyA/i9niLCVfeKN1ZD0/dqS5oUePxICweTOdGV9r3HIvwa9STIVoMvVSRT5K7zCgBQBVvLt9Sw5e8wgNxvPj8HmwNUoVCHN/EbauJPJ8OA8fCxuUqyAosuCJs+KwjUA0hCKRWU2g1c/EhW/R0c0LawdPxHRbufdzo/KwgvSf3qSmzkutWewWg6HMQb/Fssb7es0pwBozlyZS+CB8QbIgX2ymLdT8zLskfovB5YqbLH4eIoQIZrDPthgqwN6GIFn2Byt5SXqZj/zO2ZWbGAYw6U0hxxri0vhKYCXKKmUDgjYiHYk6rWPen7Y5G8sRbsD1WOuUYkMc4cMzC2XNjFpQ75IOI33yZd2SDQG3BjzX2gbo5r0TRQICy7wA4Oa5P42hEpQQ/5Ra6wlEytIFx7Zio0sDm59RrcYQuGioebV5XFSkoo/GOqa+E7KAZhwk+HBqqHbyikCogTGLZTC4E88bsAIWemF9bC8W14tbvDVThi9a0hamIATYtGuVwccMQ72rOEPicJHpKsxEAwySeMq2RY3fXGWjD2ev7VW2RohMO71EDIwhxFOgFE788NL7HtYSp8x7RRJy60ZIjpEAKq3hLT+D1Uq287gqU9+mmOIEJjymXKdkr0f3Gdx/e7cWiaGstogBo8jTndCLOOi7w879adzYhZwZfqCfT7x8LtTSH6NIMb4kaKShkfhYsprGhl3peIBqK0Mx9hfratD8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXNUd2FmNVZQSE0vSjRIMlg5a2tndm8wcG1icFpVWENHTUV5aGtWYS9TSENU?=
 =?utf-8?B?VXowSHliK0w0bjRPNXQ2czRtRFdFRDJFK3pVdUhucE9LSy9mWGh4Q2p2Um9T?=
 =?utf-8?B?K0RvZ2hZM1g0Z3ZOS0VLMG1jWjN1T2RQeS9vc2J1Njg2UkV2R2VSd25JUUJR?=
 =?utf-8?B?TzA4Y3NMd1JFWTdkY3V3VW92bStvTFZsbU5ibkhBdzgxdmMxK3J1c2hXNE9R?=
 =?utf-8?B?clByQWY4Z1k1aGhKQ3luRDJBSzhzekQ1eHRmNjBxRkZKc2k0bTlaTERkamZx?=
 =?utf-8?B?YWNqTno2SmovUWZCN0JBaWtVUDRkYjhUTkdEa21CNUlEd0NWQW5CNHNacXM0?=
 =?utf-8?B?VWNOMVNYa2dCZVRJTU12dzg2aWZLTUM3SWRLK2cxbjRsZkgvQTkraE1TL1lp?=
 =?utf-8?B?a29pU0JrR0dsZjZWekx0U1l0MG12dXVFSXY5dCtOcE8zMnRuWkNodFMvWnhq?=
 =?utf-8?B?NG5wRlprQkp5UUhnOWx4cFp3M3Y4Sk43dGc1Yi8wdFR5MkFSNTRzaGgwcnJO?=
 =?utf-8?B?SUxIcm5vWWpWQ1BhMkxxU2hXS0RWcFhlR0VERmpXYkRjaTEvWmlUUW12Tkg5?=
 =?utf-8?B?cnVZSjBPbDhUR0t2Z1kvaU9PWXJyL2FqSzAwL2hjN3JCTlhKTGQwVml4UExy?=
 =?utf-8?B?WEQybGx1V2RPRnliOUNWcVpISTMzVStyQitLeVNkWDdEZ0dwQlhBYm8wYzI2?=
 =?utf-8?B?U3hrVEZsZU9pMzRBdjNjeTkyU0psQW9meTFQMzRBc3JycnBxZWR6dTNmaXRB?=
 =?utf-8?B?KzFjMXlqekIyeUNMRUZsMitmYUlzcWhZc21Rd0JqT3B3SFV1c1NhVmFqMC9S?=
 =?utf-8?B?MTRaQnQ3VjJ5WDhjbGwxUEFqakJPRmRxWjZrb0lZdWZJZXZQdmdlRUw5WHgw?=
 =?utf-8?B?Nit3eE9zamVUTzBPOWRTamJLTlY5MUFwcGNGTWo5Q1lMVzBvcFNNczJyWkRV?=
 =?utf-8?B?eWJSY1B1Zm5rN1BwVlpvQ2thUUk2Sm5WbXhLdEprVWxVWUNFU2xTeUtpNU0z?=
 =?utf-8?B?WEtNdjRHalhMUCswdjR3bVVvWFBRVzJua3pTY2lmeFJBM2NpR1h0cFd3dWJt?=
 =?utf-8?B?SGVCUDhMT3FpYjZSMFJLb0doTFE1UXIrL0VDTWhVZkF4WmhYUTB6VnpuK1Bl?=
 =?utf-8?B?NDEwSkVST0JqUUNCeHhSbjRPQ2pXRlo1WWdnRDhDZ1c0RUtDWUcxcFVKU24y?=
 =?utf-8?B?ZVpCWWhvb3pyMGhhNWxkL3BXQk1oQ0ZZQnd2akQ2N2JrUHkvUXpQS3FjaDJk?=
 =?utf-8?B?S0g4em5BOWd4UExWS1JseXpvYXZGN3N0QytTaDh5MGFqbDllZ01mMStZTmpO?=
 =?utf-8?B?VFNoK3pNNlRqanAvOUtJbldJM0ZSWk4rVEw3QlNzYmI0aU9HR3k1TkM0Q0VV?=
 =?utf-8?B?aTlZM3I3RS9KUlArT2xkWDU0bTVDMnlGbjExSjRNWXJmc093SGFxcGJxY2JD?=
 =?utf-8?B?UlNEK2Y5b2J6WHc4UkhKWkpDdHU0TERwUm5BRURCMUxPZjlPa2wrOTkzbXZl?=
 =?utf-8?B?MWtRM3l3VkdQZ0ZTeU5XbGFUWm01L3p4WG9QaStOdVNraVBoT1NuR2N5T2lp?=
 =?utf-8?B?bFNhbnZUa213Nml1Sy9JQUp5OGdPbi96RDZueGxzek9BbG9UeGlQdHU0S2J0?=
 =?utf-8?B?YWY4V1JKbFAxVk1tK1gvamdySG82SC8zcGNuN0h0NVRvNHN2Wm5BUHNuVXY5?=
 =?utf-8?B?ZE9BOWtCd284bC9LNXZXcFIwN3c4RStCdTE1b1dOT3NmcWRIcEJ3MTkxTkoy?=
 =?utf-8?B?dllCbVJ4a09qa08wTzhuZThydmxUR0t1TnRuclJ1MGRWamRWblhzeDA4UWFS?=
 =?utf-8?B?N3A4SWkxVlRQWWFXY2R3OCs2NHJMSi95VkdDUitETEY4em5RQm9LTlk5RTYv?=
 =?utf-8?B?ZTJaYjlSZUV1MzFrN294YlJQaWpYaXVMUU91RXIrVlFxcDFOdnFnYnFZQWh1?=
 =?utf-8?B?OWhmWFp2ZWdpS0NHOFAvWnJpUEI0RllqM2FOdFRXTkxsblJRMEU1aHlNejhV?=
 =?utf-8?B?V1ZncjhJWXQ5QzdnaU9xZzVOMjNyVklsd1loUkg0UklLam5YK3o2N1JGc1gr?=
 =?utf-8?B?OTZsNXBWdkc5RmhFOHY3bHlVaTJlSlBrUTFVWmNITzltcGI0NFRBeTdobVhh?=
 =?utf-8?B?elovaXR3d2tXM25IeExtZzFrNVZVZ1l1ZDhoN3haem1jTFpMZFNocFpDRG84?=
 =?utf-8?B?ZjdsWVdBRVlzUjlXUDhEdXI5NzY3R2gySW02Z0xHRHhwQXVocVR0L1VnQnUz?=
 =?utf-8?B?aEFIV2lMTDliRlNjMzVaLzdFK1Fnb2VINkNzNUNqczUvWjRZemdpTXA4c3Bn?=
 =?utf-8?B?bDA3NXZBY1JGRm5wZk1QWUVIMGxjWFd3amRwUkpCV3RaM0pyRUlabHBlTVdh?=
 =?utf-8?Q?sy9Q6HCODvn38bJY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57315903E6DA6841A64025F836A1011E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aigwmTKbisEoEN5AiE8+Per4elGz9iE0IgwXJy7LlckN/9rvjmlLnZlLkxcryuTgOivFOVXSXuGb1H0yJoQk4YJl1bYMQWU3GNp8vguODN1C49HyEy7eP/ZcAf2YSv5gOIuOZZundtJ8dDBEMsL0D78myzvpxR5Q7twTxmS8XjaOACgUCyf9lqwo1CHQaAdgt6ylqSBNl+We2svN5G3fhHVr3XGpELeDR8bdqkfpqihyBkG2rr8PwKxgjW3AI9Aey3xbaVDxlGbtFB2jXw/+OKxLGmkXclZ1gODB50nAWyoAG03iFGq59AVK22GAPQfPgiXOsGHCpimDOOslzQ0SUQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25aa8442-52b4-4c40-06e8-08df14fd2861
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 20:49:24.6502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zP+pYtqdEC42c5x1GksqKHDhzyWtNDqIR1b0cASY7hiHHnWioEr/80HAjdbD/SeHQ6Aco/AtX+l6DELo8DUL2Jxqhko6Qj4vkMCFy5zgWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-OriginatorOrg: intel.com

T24gU3VuLCAyMDI2LTA5LTEzIGF0IDAzOjM2ICswMDAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBIaSwgR3VlbnRlcg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KPiANCj4gPiBP
biA5LzMvMjYgMDY6MzQsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gPiBBZGQgR3Jhbml0
ZSBSYXBpZHMgKEdOUikgQ1BVIHN1cHBvcnQgdG8gdGhlIFBFQ0kgY3B1dGVtcCBkcml2ZXIuIFRo
ZQ0KPiA+ID4gR05SIHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgdGhlIGNvcmUgbWFzayBzY2Fu
IHZpYSBQQ0kgbG9jYWwgcmVhZCwNCj4gPiA+IHNvIGhhbmRsZSB0aGlzIGNhc2UgZXhwbGljaXRs
eSBieSByZXR1cm5pbmcgLUVQRVJNIGFuZCBza2lwcGluZyB0aGUNCj4gPiA+IGNvcmUgbWFzayBp
bml0aWFsaXphdGlvbi4NCj4gPiA+IA0KPiA+IA0KPiA+IEFmdGVyIHJlYWRpbmcgdGhlIG5leHQg
cGF0Y2ggb2YgdGhlIHNlcmllczogQXJlIHlvdSBzdXJlIHRoYXQgdGhpcyBpcyB0aGUNCj4gPiBj
YXNlLCBvcg0KPiA+IGlzIGl0IHBvc3NpYmxlIHRoYXQgR3Jhbml0ZSBSYXBpZHMganVzdCB1c2Vz
IGEgZGlmZmVyZW50IGFjY2VzcyBtZWNoYW5pc20gdG8NCj4gPiBwcm92aWRlIHRoZSBpbmZvcm1h
dGlvbiA/DQo+ID4gDQo+IA0KPiBUaGlzIGlzIHRoZSBpbmZvcm1hdGlvbiBJIG9idGFpbmVkIGJ5
IHJlZmVycmluZyB0byB0aGUgY29tbWl0IGJlbG93LiANCj4gT2YgY291cnNlLCBpdCB3b3VsZCBi
ZSBiZXN0IGlmIEl3b25hIGNvdWxkIGFsc28gaGVscCB2ZXJpZnkgaXQuDQo+IA0KPiBodHRwczov
L2dpdGh1Yi5jb20vb2NwLWhtLW9wZW5ibWMtb3BmLWFtaS9saW51eC9jb21taXQvOTRiNGIwYzgz
ZDMzYmVjNzBkY2M5MmY2ODdjNGEzMmUxYTFlMjUzYw0KDQpJdCdzIG5vdCB0aGF0IGl0J3Mgbm90
IHN1cHBvcnRlZCAtIGl0J3MganVzdCBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkLg0KR05SIGludHJv
ZHVjZXMgYSBjb25jZXB0IG9mIGRvbWFpbnMsIGFuZCB0byBmaWd1cmUgb3V0IHRoZSBjb3JlIG1h
c2ssIHdlIG5lZWQgdG8NCnF1ZXJ5IGFsbCB0aGUgZG9tYWlucy4NCldpdGggdGhhdCAtIHRoZXJl
IGFyZSBzb21lIG9wZW5zIG9uIGhvdyB0aGUgZG9tYWluIHN1cHBvcnQgc2hvdWxkIGJlDQppbXBs
ZW1lbnRlZC4gRm9yIGV4YW1wbGUsIHdlIG1pZ2h0IHdhbnQgdG8gY29uc2lkZXIgcmVwcmVzZW50
aW5nIGRvbWFpbnMgYXMNCnNlcGFyYXRlIFBFQ0kgZGV2aWNlcywgd2hpY2ggd291bGQgaGF2ZSBh
biBpbXBhY3Qgb24gdGhlIGRldmljZS9kcml2ZXIgbW9kZWwuDQoNClRoYW5rcw0KLUl3b25hDQoN
Cj4gDQo+ID4gVGhhbmtzLA0KPiA+IEd1ZW50ZXINCj4gPiANCj4gPiA+IERlZmluZSBuZXcgY3B1
X2luZm8gc3RydWN0dXJlIGZvciBHTlIgd2l0aCBtaW5pbXVtIFBFQ0kgcmV2aXNpb24gMHg0MA0K
PiA+ID4gYW5kIHRoZSB0aGVybWFsIG1hcmdpbiBjb252ZXJzaW9uIGZ1bmN0aW9uDQo+ID4gZHRz
X3Rlbl9kb3Rfc2l4X3RvX21pbGxpZGVncmVlKCkuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4N
Cj4gPiA+IC0tLQ0KPiA+ID4gwqAgZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYyB8IDIwICsr
KysrKysrKysrKysrKysrKysrDQo+ID4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wZWNpL2NwdXRl
bXAuYw0KPiA+ID4gYi9kcml2ZXJzL2h3bW9uL3BlY2kvY3B1dGVtcC5jIGluZGV4IDQ1NzA4OWM1
NjFiNC4uNDNlNTJhNmRiNzliDQo+ID4gMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2h3bW9u
L3BlY2kvY3B1dGVtcC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2h3bW9uL3BlY2kvY3B1dGVtcC5j
DQo+ID4gPiBAQCAtMzM5LDYgKzMzOSwxNyBAQCBzdGF0aWMgaW50IGluaXRfY29yZV9tYXNrKHN0
cnVjdCBwZWNpX2NwdXRlbXANCj4gPiAqcHJpdikNCj4gPiA+IMKgwqAJdTMyIGRhdGE7DQo+ID4g
PiDCoMKgCWludCByZXQ7DQo+ID4gPiANCj4gPiA+ICsJLyoNCj4gPiA+ICsJICogU29tZSBwbGF0
Zm9ybXMgKGUuZy4gR3Jhbml0ZSBSYXBpZHMpIGRvIG5vdCBleHBvc2UgdGhlDQo+ID4gUkVTT0xW
RURfQ09SRVMNCj4gPiA+ICsJICogcmVnaXN0ZXIgb3ZlciBQRUNJIC0gcGVyLWNvcmUgdGVtcGVy
YXR1cmVzIGFyZSBzaW1wbHkgbm90DQo+ID4gPiBhdmFpbGFibGUuDQo+ID4gPiArCSAqLw0KPiA+
ID4gKwlpZiAoIXJlZykgew0KPiA+ID4gKwkJZGV2X2RiZyhwcml2LT5kZXYsDQo+ID4gPiArCQkJ
InJlc29sdmVkIGNvcmVzIHNjYW4gaXMgbm90IHN1cHBvcnRlZCBvbiB2ZW5kb3ItDQo+ID4gPiBm
YW1pbHktbW9kZWwNCj4gPiAweCV4XG4iLA0KPiA+ID4gKwkJCXBlY2lfZGV2LT5pbmZvLng4Nl92
Zm0pOw0KPiA+ID4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+ID4gKwl9DQo+ID4gPiArDQo+
ID4gPiDCoMKgCS8qIEdldCB0aGUgUkVTT0xWRURfQ09SRVMgcmVnaXN0ZXIgdmFsdWUgKi8NCj4g
PiA+IMKgwqAJc3dpdGNoIChwZWNpX2Rldi0+aW5mby54ODZfdmZtKSB7DQo+ID4gPiDCoMKgCWNh
c2UgSU5URUxfSUNFTEFLRV9YOg0KPiA+ID4gQEAgLTU0Myw2ICs1NTQsMTEgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBjcHVfaW5mbyBjcHVfZW1yID0gew0KPiA+ID4gwqDCoAkudGhlcm1hbF9tYXJn
aW5fdG9fbWlsbGlkZWdyZWUgPQ0KPiA+ICZkdHNfdGVuX2RvdF9zaXhfdG9fbWlsbGlkZWdyZWUs
DQo+ID4gPiDCoCB9Ow0KPiA+ID4gDQo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjcHVfaW5m
byBjcHVfZ25yID0gew0KPiA+ID4gKwkubWluX3BlY2lfcmV2aXNpb24gPSAweDQwLA0KPiA+ID4g
KwkudGhlcm1hbF9tYXJnaW5fdG9fbWlsbGlkZWdyZWUgPSAmZHRzX3Rlbl9kb3Rfc2l4X3RvX21p
bGxpZGVncmVlLA0KPiA+ID4gfTsNCj4gPiA+ICsNCj4gPiA+IMKgIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYXV4aWxpYXJ5X2RldmljZV9pZCBwZWNpX2NwdXRlbXBfaWRzW10gPSB7DQo+ID4gPiDCoMKg
CXsNCj4gPiA+IMKgwqAJCS5uYW1lID0gInBlY2lfY3B1LmNwdXRlbXAuaHN4IiwNCj4gPiA+IEBA
IC01NzYsNiArNTkyLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9p
ZA0KPiA+IHBlY2lfY3B1dGVtcF9pZHNbXSA9IHsNCj4gPiA+IMKgwqAJCS5uYW1lID0gInBlY2lf
Y3B1LmNwdXRlbXAuZW1yIiwNCj4gPiA+IMKgwqAJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxv
bmdfdCkmY3B1X2VtciwNCj4gPiA+IMKgwqAJfSwNCj4gPiA+ICsJew0KPiA+ID4gKwkJLm5hbWUg
PSAicGVjaV9jcHUuY3B1dGVtcC5nbnIiLA0KPiA+ID4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5l
bF91bG9uZ190KSZjcHVfZ25yLA0KPiA+ID4gKwl9LA0KPiA+ID4gwqDCoAl7IH0NCj4gPiA+IMKg
IH07DQo+ID4gPiDCoCBNT0RVTEVfREVWSUNFX1RBQkxFKGF1eGlsaWFyeSwgcGVjaV9jcHV0ZW1w
X2lkcyk7DQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IENoYW5naHVhbmcNCg==
