Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10823033EB;
	Fri, 25 Sep 2026 20:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366720; cv=fail; b=HwA8HxhXS1HZMtw/+NLCdeCFMafWylbWq9E0OJIfFg9vpW3FWm8Uz/LEOL9zqGKFkBQN231sZi6qqPilOsqvLhV75CvCG03PllnRUUmnuyp1fwM+ndg3xQkLF07Mf1FnNJ78lXU9cM1TvY0XzAH3pEFISJCORdvLxG7fBuPS0PQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366720; c=relaxed/simple;
	bh=VbJFZStvV+ROU6sq1kgxs7QcpHEL9LY2XEkdy5o/v5E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iUrb72lRm4MAtYOqhd5XaKkF8zMIB4iGJj4mAefo8wZGTa1Jjz4raiwxSDHA9qYyr4Kk7zvPHUM6ift+Dvnw52VpE4BExUCBEtLWAA/5IpE6CjyuUoWoph/yEEwTcr+sJj0hqJpiUGZdMrwko7LfkbOGrzdRIsOl6ivGoPqPb8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBL6STh2; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBL6STh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790366718; x=1821902718;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VbJFZStvV+ROU6sq1kgxs7QcpHEL9LY2XEkdy5o/v5E=;
  b=MBL6STh2ooPSmEVPzEljDREfKY8U9EnKnb7OIOA0s3XBicwofAfc2k/N
   WEdovgtxvxCmSN6uPvg5L05t1xJ0/fNGClCBXJpwVcRsos7mkSgkectWV
   B2vz/3uOKQh+hThIVuf9KLSkVeBj7rj3/6mR8o3znembYme3rbHxXUK0A
   7p/cHz0gjd2D/O5X+DvFUasyjkXYmGJE7fNlrvU+8oDiJ1+uSXHdzzvd0
   hWYvkMcEIIyj5JhUoksoOOHAj3iJyE+98Yw5TFF+uZJZn+nyMr0xgm1EZ
   bUgCPVUVxvJbm3PLpzaMw2tnuc0TJS9gvlxCHW7HfVq95nW9ZzPq4SpGX
   Q==;
X-CSE-ConnectionGUID: jxoAWNZ5Sm2z/4vIWiCvAw==
X-CSE-MsgGUID: M1EEm3hZR1+ZE83/l93+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377161"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90377161"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 13:05:14 -0700
X-CSE-ConnectionGUID: VYK0odJIS0ivQ96BRj7I9A==
X-CSE-MsgGUID: /vplvb7GQuidOEWahA59FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274507542"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 13:05:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 13:05:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 13:05:12 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 13:05:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hm3uNvlUsarJitlZEYI/DVIwDLHgdOHPvc0H54MrHKHD5cAM2sAMeRw4XcjStluTLDAhMCEaQe/RhswSpdA4da2L+GjxNW2T5NchFJOqQ6TWosBgVZBFZqG2POinjJIIUODaIg7wyDwxrbCULRcjwdsH09XBGfh0AXAgq11YROZpCpVHwp28BevAtJNUbExk5tNpIdzkih/wM5t8DA8aM+a5cSTrWlrVvC+DhFRI2LnMlw9QDU28/mtFwlfLP9B3y3rO8XgaGEXh1R85UvrKW0zaN5kPevyZ01OE12uIMioR4Qak3Ndcec6UkDGtEF59pzJd0+TcytVj6iOQytghQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbJFZStvV+ROU6sq1kgxs7QcpHEL9LY2XEkdy5o/v5E=;
 b=lWbxBk10A5emiFs8TEZ166fpL2sfQHA0dJUcB/ZAILf27jYdPMPdNz3jlzGQD0XMLLmi1Ccas5zjNGGDvonJRC4MHc6lvVps9hb65CNTG1u3oTQDwaPk6WwiJuF+8VAp5mzfzj0t170SgJ/uy4nM3VwP1XjydPwCNy9lMyfZf6bZnp01k/dWircZThwOALzLwt8fm/Yp14tW9Pmrl2u+Aa4n7U5ZYiDxzSVtI70yS2Ds2ufbZFZ7LqhO2IBca2iPPW+4+hAnYc2yJgZSznFw33Xm1FO8e1OS1zc6tvdJBojWTNNSoIwFMgL378DoXP1A9nTUAUUTVuG9V6+UBgKI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 20:05:09 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 20:05:09 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "Zhang, Jian"
	<zhangjian.3032@bytedance.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: peci: dimmtemp: Retry unstable DIMM mask detection
Thread-Topic: [PATCH] hwmon: peci: dimmtemp: Retry unstable DIMM mask
 detection
Thread-Index: AQHdRxx2BNj76A1G/k2KhdYhH+QKdLbUj/qAgAI6BICACPobgA==
Date: Fri, 25 Sep 2026 20:05:09 +0000
Message-ID: <add3b06f14a664b0b9575d1162d8944728bf31b0.camel@intel.com>
References: <20260918031831.1937973-1-zhangjian.3032@bytedance.com>
		 <26000aa9-86b0-4fd8-8bda-67f38372cdb7@roeck-us.net>
	 <90D71779-52F1-4456-BD8C-5E5D40A2FF99@bytedance.com>
In-Reply-To: <90D71779-52F1-4456-BD8C-5E5D40A2FF99@bytedance.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|SA3PR11MB8001:EE_
x-ms-office365-filtering-correlation-id: 2498bfa0-a17c-4d49-7725-08df1b404ce8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|22082099003|18002099003|38070700021|4143699003|11063799006|5023799004|10067099003|56012099006;
x-microsoft-antispam-message-info: QRzbIu0wKyaxg5Z4CnySAOOU6LO8BNHRlxSuyJUQFadZ6D0155lnd52Yy1LDzjHywKnRVMDpq0SDmEob0OuLAS1Y7bkkDQIhlTqJW2btLSExWVZeARTzWPwYHc5BunDiDYqKqZSDM5kwuAlSe6XxK1s5l4WMbHok2yBGIRy2vdjov5660pyE7+7eXaqcgkoN1Omy4ZiOHWRuERQg1yWOPJEy/MJbPUylY1Dv+0mFQ2ZWomTCTpKYr+Zg5LppdijINP4i3HuEn0jiTnKv0E38T3AAf6b+9mKkneHpwlzB1aJhdjDpXcjRFJZaYVuSBcnINL63msZR257QKlh7dWGScQyDW9mBYj/1NPcyVA+Hgg1kmo8xvpDo/mDYz1oI9EDSMn2b6PbeRq2JQqUbTaG6aE2jyfU1OcF3H+sacA8xBr6WRmPOe+gnO941L/wu75XHbibVbA5GUHaYtxRHXIc0o85t4i3fR7OQSYZ0S16JfTuc65JVvxW4hzl2rklNG65CjIS5BARBU3u8CFHeNGUXcvWttlyQNwy3nvNblLNtmBnWP61tqEJa+m4kLJOMjlTFLXojSj+xe8c40QB3n+QkL4UB6f0rFESjAkn37AxFWH4WxsQw06Aui/tG8rjSJeSkB27B0eWVv9L7xxyw+6902kYtXyRGhAXcUvq+gGzEubYFLeTbCdzAH/QAmqo0EZaV7gWOcDUBO62vSLI1HSgm7AXINao7pElYSXSnFVMgYrY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(5023799004)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmFiM01tS2dOemdWMkVSdHhMMzdXeEZsaGlqOXNRRGsrR0NVVzd5SkRtSlNi?=
 =?utf-8?B?UkhXeGdEaHRXdjZYVVdpbkRpZVNKK1ZiUmx4RlE5SWdzWlZNZGZZMzFDaHJR?=
 =?utf-8?B?L3JKdlZTTWhNNHZIMnlzcmp1cmJOckhia0pKSy9scEpHNkhUTExGeGhJVTNz?=
 =?utf-8?B?elAvb2lXK1A3bDNYb3M5RDR5VDhYaEFhcmkzNEIyQ1ZyRy84NWRBakFoZyt0?=
 =?utf-8?B?RXI3dGV6d21tVXMvaXZHVTBFRVhuQ3lqN05aOVZiZ2g4NWJyc2hUdWVmYUZU?=
 =?utf-8?B?SVFoSC9NTUIvaXBMRFdRTkVQaXBRSzBRaFpzL1IzS0U5TGpCbkk5ODhtVGpS?=
 =?utf-8?B?aGk0NGMwYTF2WEZ4bVJNbm42RkJmdmZSZEhUdlpBai9jcjd5M3lyOThUbXhH?=
 =?utf-8?B?QzlOVVh1dVF4Sk5IQjNZbGdqa1RoMkgzU0ZRZ0tNWlg0NkJqY3V5Mm5GMERL?=
 =?utf-8?B?cWQrWXF4RytzOEZzUUFuOVE4WmozS1oxd3dPbUsyc1hCa0xsdjlwTjNoQlhO?=
 =?utf-8?B?eGNPSXFyYkxJWXhobE84TnEzWk9tTWJjekJXenI4bXRLQ0V2L2dxbUJxTmgr?=
 =?utf-8?B?OGhYUncwMDNzWEx3b09iMThTeDhhVFR0Ti95a2VsNE45bm44YmxscWJYYUV5?=
 =?utf-8?B?SXlUTHZ3N0ZFYW9SV1BTQzk2b1hKbk53WjZmczQ4SlRsV0prM0gyaUdQaEdH?=
 =?utf-8?B?Z1VtYzdMTm1HSXUyY09rSk1PclZhc041cUtBQm10SHpiUWVndGJ0SnZ3MUt2?=
 =?utf-8?B?MUFQR0Exbit3OXNzYUhJRTc2TXdoRUM1cWY1VDhQR2szQVNsaWdrRUw0YVpy?=
 =?utf-8?B?eFlIZWJpQjRxcVR5SG5wWjB3VEpWT0p3K0lnbTAxOGRCb0s3VGE0b0JrRDNG?=
 =?utf-8?B?MUFzaHZDYUVNTllkZVBwR0NxSlpNL1hBQjZFaDgzSnY2UWxSRkdOMnVIa2hv?=
 =?utf-8?B?cm9oY3FlZE1jdUoydW5GVzZBaHpheU1uWXg2NGtaMjBvUzg3bGNhcml0WmxM?=
 =?utf-8?B?UG9nbGlmME5JWHBKcWJBMlBnNEFCTVY5cDV1VlVvZjE3TFdsS25oeHdHT1ow?=
 =?utf-8?B?WG9uMkNtWmpVZ2E5UU56RTN4VWJoZVd5aDNLOVdPZXBlY3NtbkU3aTF0ZXR0?=
 =?utf-8?B?S2ZTN2xUUjVsaTV3bWMvb2tBQy9XSVpQdEk4UmNWUExFRHF4b0Rna2dZeWRw?=
 =?utf-8?B?TlVBTmNJMG5JNm1jc3lRSzUreW1UanFTZVVBaC9abzNGOTg5QVR4bDkwZkJu?=
 =?utf-8?B?YzhadUdqcVlycGFwQVI5Wk1BbjNnYWlCVHBsMktZZjBSZm8ya3VHNC9qS0Vj?=
 =?utf-8?B?RHlscTAvTW9SMlBRU2wrZGRucHRMUVFMcjByTVZjRWE5THhMV01lUXpnOFFJ?=
 =?utf-8?B?L0F6WFJXL1hTcWswcmk4alV3d21QVkdMNndnT2lxcHZ3N1lIMktoaWdIWnly?=
 =?utf-8?B?anBUSzMrM2FldDQ3WkxGWFdMVEtvS1BHcmlwTXh4Z0ovb1BKN1JocWF6cHV5?=
 =?utf-8?B?eXRoa1pYWEFORFVuL1F4RitKOVlLNTdBanBJZ3B5djBDaXFJYjIzd3Q5L0Vr?=
 =?utf-8?B?T1lSL1prc3dldnI2eGk0aW5zTlJMa0VLNk9KTWxiRVFBaU1nK0VqNXR6S0RQ?=
 =?utf-8?B?dDNNQWoyRVp1ZFZleDR2enE1Z2hsUElYb1NSR2R4TFZTbnlxTmRUcWhaTkE4?=
 =?utf-8?B?NFZXeUdFbFY0S1RaZmF0SHpxTE9SalA3dy9JZmhmekJHbUtJdm9jQ1dZVzBZ?=
 =?utf-8?B?ZUVFMlN6eG5rNGZLenRQQWpTOXVTN0doMktNcVlGak5vNXJmZG43YU1WVzI5?=
 =?utf-8?B?TmhPTEhsb0tnQnVQcnlHL014Z3o0T1MyYkxSRjNtRDlwcHRqdTlkcmwxZ3Z0?=
 =?utf-8?B?ak5KbWRZSm52OS9ISE9PS3lzb21sU0NoSUs5VDh3Z1doS29hQUgyRklJaGRY?=
 =?utf-8?B?Ujk1cDAwYng5dHRCZFViallXVnNvbDVlME5wMFJrTk1YT1BNcUJTOVlPME5O?=
 =?utf-8?B?MlUwRStCMVRqcmZEUFg4YVJlelZEbGJFNGlnclNVcktHT000bU5sbXV4d1RQ?=
 =?utf-8?B?VnJKVjVqSWpuRXdjQjRwdWFSRitNVEZUZVNSSXozS2FsMldGUUlQV1VVL0Jw?=
 =?utf-8?B?cHFqWTBpZUttS0s0TERUZDBNSTJia3J1aG40cmtDNWtLZUgwSjBtSWFyNlRO?=
 =?utf-8?B?c0Fsd0xpUkNoamFEVXJvYlVUMDFnTGsxb3JETk5NbmhMbUJOZ3RDVjNpK01C?=
 =?utf-8?B?RkUvckE2d3JTc0owYlhJZ1o5TmpiSklLZS9BZzNsdmJaSXFhM29yQkllVlNG?=
 =?utf-8?B?UlJHMHpOTU1wNjVTc1BBanNhOWdWUHdQMzdDalBJaFVidjd1d2ZuMVRSSGo5?=
 =?utf-8?Q?UhtsLd0cnOxpAebg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C88E8E8F36B4E4088ED9649B5AD50F0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3SxF9T67nbYqiA4iPfzlvlnqGaTxRh6JvRZYD0CptO225NQHYZ4w4GlfIHozZEahC02E87oreh27wPvORxO9ta9x9z1dU0tUBwrfYKAj4Qj6zFKNjXKYARAR3IkIRq6njzSfgLnEaO4xVG1Kot05r1OqNP9caoWABtZEHZcWtivmC9GxJn3iRlDuGL2CAb0fdVCazaN8pwPcZ8TJnG0E2/nWX+itNZm3ti5iLVsYiNN01NkEw1ggCvMzTayDmNdas1BcD13REe7FawkhGg8EbfnLgCQGT/dIVEGCtlUyRzjy8RbLnsffmFY1bjO1ixkgOUoOzqp+K7MZFZdlvmCTXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2498bfa0-a17c-4d49-7725-08df1b404ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 20:05:09.1813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axw8i+ZOFYJeW61GOVWt8ct7Fd8gOEPhC2OqQCkj7lCAC0xdprRK/IOi4RumFwED/NXLlNz8u2WYUO5//6zPCn9zloprjlnBPKjpNPt5e6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
X-OriginatorOrg: intel.com

T24gU3VuLCAyMDI2LTA5LTIwIGF0IDEwOjU5ICswODAwLCBKaWFuIFpoYW5nIHdyb3RlOg0KPiA+
IDIwMjblubQ55pyIMTnml6UgMDA6NTnvvIxHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5u
ZXQ+IOWGmemBk++8mg0KPiA+IA0KPiA+IE9uIEZyaSwgU2VwIDE4LCAyMDI2IGF0IDExOjE4OjMx
QU0gKzA4MDAsIEppYW4gWmhhbmcgd3JvdGU6DQo+ID4gPiBBZGQgYSBzdGFibGUgRElNTSBtYXNr
IGNoZWNrIGFyb3VuZCBQRUNJIERJTU0gZGlzY292ZXJ5Lg0KPiA+ID4gDQo+ID4gPiBEdXJpbmcg
aG9zdCBESU1NIGluaXRpYWxpemF0aW9uLCBQRUNJIGNhbiBhbnN3ZXIgdGhlIERJTU0gdGVtcGVy
YXR1cmUNCj4gPiA+IGNvbmZpZ3VyYXRpb24gcmVhZHMgYmVmb3JlIGV2ZXJ5IERJTU0gaGFzIHJl
YWNoZWQgYSBzdGFibGUgcmVhZHkgc3RhdGUuDQo+ID4gPiBUaGVyZSBpcyBubyBzZXBhcmF0ZSBh
bGwtRElNTS1yZWFkeSBzaWduYWwgZm9yIHRoaXMgZHJpdmVyIHRvIHdhaXQgb24sDQo+ID4gPiBz
byBhIHNpbmdsZSBlYXJseSByZWFkIGNhbiBjYXB0dXJlIG9ubHkgcGFydCBvZiB0aGUgcG9wdWxh
dGVkIERJTU0gbWFzay4NCj4gPiA+IFJldHJ5aW5nIHRoZSBtYXNrIGNoZWNrIGF2b2lkcyBsb2Nr
aW5nIHRoYXQgdHJhbnNpZW50IHN0YXRlIGludG8gdGhlDQo+ID4gPiBod21vbiBkZXZpY2UgbGF5
b3V0Lg0KPiA+ID4gDQo+ID4gPiBUaGUgZmlyc3Qgc3VjY2Vzc2Z1bCBzY2FuIGlzIHNhdmVkLCBh
bmQgdGhlIGRyaXZlciBpbW1lZGlhdGVseSBzY2Fucw0KPiA+ID4gYWdhaW4gYmVmb3JlIHJlZ2lz
dGVyaW5nIGh3bW9uIGNoYW5uZWxzLiBJZiB0aGUgdHdvIG1hc2tzIGRpZmZlciwgdGhlDQo+ID4g
PiBkcml2ZXIgcmV0dXJucyAtRUFHQUlOIHNvIHRoZSBleGlzdGluZyBkZWxheWVkIGRldGVjdGlv
biB3b3JrIGNhbiByZXRyeQ0KPiA+ID4gaW5zdGVhZCBvZiBleHBvc2luZyBhIHBhcnRpYWwgY2hh
bm5lbCBzZXQuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEppYW4gWmhhbmcgPHpoYW5n
amlhbi4zMDMyQGJ5dGVkYW5jZS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IA0KPiA+ID4gVGhpcyB3
YXMgdGVzdGVkIG9uIGFuIGFmZmVjdGVkIHBsYXRmb3JtIHdoZXJlIHByb2JpbmcgZHVyaW5nDQo+
ID4gPiBob3N0IERJTU0gaW5pdGlhbGl6YXRpb24gY291bGQgZXhwb3NlIGFuIGluY29tcGxldGUg
RElNTSBtYXNrLiBXaXRoIHRoZQ0KPiA+ID4gZXh0cmEgcmVhZCwgdGhlIGRyaXZlciBvYnNlcnZl
ZCB0aGUgY29tcGxldGVkIERJTU0gbWFzayBhbmQgZXhwb3J0ZWQgdGhlDQo+ID4gPiBleHBlY3Rl
ZCBod21vbiBjaGFubmVscy4NCj4gPiA+IA0KPiA+ID4gVGhpcyBpcyBpbnRlbnRpb25hbGx5IGEg
Y29uc2VydmF0aXZlIHJldHJ5IG9mIHRoZSBleGlzdGluZyBkZXRlY3Rpb24NCj4gPiA+IHBhdGgu
IEl0IGRvZXMgbm90IGFkZCBhIHNsZWVwIG9yIGZvcmNlIGFub3RoZXIgZGVsYXllZC13b3JrIGlu
dGVydmFsDQo+ID4gPiBiZXR3ZWVuIHRoZSB0d28gcmVhZHMsIHNvIGl0IGF2b2lkcyBhZGRpbmcg
YW4gdW5jb25kaXRpb25hbCBwcm9iZSBkZWxheS4NCj4gPiA+IEhvd2V2ZXIsIHRoaXMgYWxzbyBt
ZWFucyBpdCBpcyBub3QgYSBmdWxsIHByb29mIHRoYXQgdGhlIGhvc3QgRElNTQ0KPiA+ID4gaW5p
dGlhbGl6YXRpb24gaGFzIGNvbXBsZXRlZC4NCj4gPiA+IA0KPiA+ID4gSSBhbSBub3QgYXdhcmUg
b2YgYW4gSW50ZWwtcHJvdmlkZWQgYWxsLURJTU0tcmVhZHkgaW5kaWNhdGlvbiBmb3IgdGhpcw0K
PiA+ID4gcGF0aC4gRmVlZGJhY2sgd291bGQgYmUgYXBwcmVjaWF0ZWQgaWYgdGhlcmUgaXMgYSBi
ZXR0ZXIgd2F5IHRvIGRlY2lkZQ0KPiA+ID4gdGhhdCB0aGUgUEVDSSBESU1NIG1hc2sgaXMgc3Rh
YmxlIGJlZm9yZSByZWdpc3RlcmluZyB0aGUgaHdtb24gZGV2aWNlLg0KPiA+ID4gDQo+ID4gPiBk
cml2ZXJzL2h3bW9uL3BlY2kvZGltbXRlbXAuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKy0NCj4gPiA+IDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BlY2kvZGltbXRl
bXAuYyBiL2RyaXZlcnMvaHdtb24vcGVjaS9kaW1tdGVtcC5jDQo+ID4gPiBpbmRleCBiZDNlODcx
NWRmZWMuLjk4M2UxZTQxNWVjMiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvaHdtb24vcGVj
aS9kaW1tdGVtcC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2h3bW9uL3BlY2kvZGltbXRlbXAuYw0K
PiA+ID4gQEAgLTI4NSw2ICsyODUsMzIgQEAgc3RhdGljIGludCBjaGVja19wb3B1bGF0ZWRfZGlt
bXMoc3RydWN0IHBlY2lfZGltbXRlbXANCj4gPiA+ICpwcml2KQ0KPiA+ID4gcmV0dXJuIDA7DQo+
ID4gPiB9DQo+ID4gPiANCj4gPiA+ICtzdGF0aWMgaW50IGNoZWNrX3BvcHVsYXRlZF9kaW1tc19z
dGFibGUoc3RydWN0IHBlY2lfZGltbXRlbXAgKnByaXYpDQo+ID4gPiArew0KPiA+ID4gKyBERUNM
QVJFX0JJVE1BUChkaW1tX21hc2ssIERJTU1fTlVNU19NQVgpOw0KPiA+ID4gKyBpbnQgcmV0Ow0K
PiA+ID4gKw0KPiA+ID4gKyByZXQgPSBjaGVja19wb3B1bGF0ZWRfZGltbXMocHJpdik7DQo+ID4g
PiArIGlmIChyZXQpDQo+ID4gPiArIHJldHVybiByZXQ7DQo+ID4gPiArDQo+ID4gPiArIGJpdG1h
cF9jb3B5KGRpbW1fbWFzaywgcHJpdi0+ZGltbV9tYXNrLCBESU1NX05VTVNfTUFYKTsNCj4gPiA+
ICsNCj4gPiA+ICsgcmV0ID0gY2hlY2tfcG9wdWxhdGVkX2RpbW1zKHByaXYpOw0KPiA+ID4gKyBp
ZiAocmV0KQ0KPiA+ID4gKyByZXR1cm4gcmV0Ow0KPiA+ID4gKw0KPiA+ID4gKyBpZiAoIWJpdG1h
cF9lcXVhbChkaW1tX21hc2ssIHByaXYtPmRpbW1fbWFzaywgRElNTV9OVU1TX01BWCkpIHsNCj4g
PiA+ICsgZGV2X2RiZyhwcml2LT5kZXYsDQo+ID4gPiArICJEZWZlcnJlZCB1bnN0YWJsZSBESU1N
IG1hc2s6ICUqcGJsIC0+ICUqcGJsXG4iLA0KPiA+ID4gKyBESU1NX05VTVNfTUFYLCBkaW1tX21h
c2ssIERJTU1fTlVNU19NQVgsDQo+ID4gPiArIHByaXYtPmRpbW1fbWFzayk7DQo+ID4gPiArIHJl
dHVybiAtRUFHQUlOOw0KPiA+ID4gKyB9DQo+ID4gPiArDQo+ID4gPiArIHJldHVybiAwOw0KPiA+
ID4gK30NCj4gPiANCj4gPiBJIGFncmVlIHdpdGggdGhlIGlkZWEsIGJ1dCBjaGVja19wb3B1bGF0
ZWRfZGltbXMoKSBhbHJlYWR5IGhhcyByZXRyeQ0KPiA+IHN1cHBvcnQuIEkgZG9uJ3Qgc2VlIHdo
eSBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGFkZCByZXRyeSBkZXRlY3Rpb24NCj4gPiAoYmVjYXVz
ZSBhZGRpdGlvbmFsIERJTU1zIHdlcmUgZGV0ZWN0ZWQpIG9uIHRvcCBvZiByZXRyeSBkZXRlY3Rp
b24NCj4gPiAoYmVjYXVzZSBubyBESU1NcyB3ZXJlIGRldGVjdGVkKS4NCj4gDQo+IFJpZ2h0LCB0
aGUgZXhpc3RpbmcgcmV0cnkgaW4gY2hlY2tfcG9wdWxhdGVkX2RpbW1zKCkgZG9lcyBub3QgY292
ZXIgdGhpcw0KPiBjYXNlLg0KPiANCj4gSXQgb25seSByZXRyaWVzIHdoZW4gbm8gdXNhYmxlIERJ
TU0gbWFzayBpcyBhdmFpbGFibGUsIGZvciBleGFtcGxlIHdoZW4NCj4gYWxsIGNoYW5uZWwvcmFu
ayByZWFkcyByZXR1cm4gLUVJTlZBTCBvciB3aGVuIHRoZSByZXN1bHRpbmcgbWFzayBpcw0KPiBl
bXB0eS4NCj4gDQo+IFRoZSBmYWlsdXJlIEkgb2JzZXJ2ZWQgaXMgYSBwYXJ0aWFsLXN1Y2Nlc3Mg
Y2FzZTogdGhlIFBFQ0kgcmVhZHMgc3VjY2VlZA0KPiBhbmQgcHJvZHVjZSBhIG5vbi1lbXB0eSBt
YXNrLCBzbyBjaGVja19wb3B1bGF0ZWRfZGltbXMoKSByZXR1cm5zIDAsIGJ1dA0KPiB0aGUgbWFz
ayBtYXkgc3RpbGwgbWlzcyBESU1NcyB3aGlsZSBob3N0IERJTU0gaW5pdGlhbGl6YXRpb24gaXMg
c3RpbGwgaW4NCj4gcHJvZ3Jlc3MuIE9uY2UgaHdtb24gaXMgcmVnaXN0ZXJlZCB3aXRoIHRoYXQg
cGFydGlhbCBtYXNrLCB0aGUgbWlzc2luZw0KPiBjaGFubmVscyBhcmUgbm90IGFkZGVkIGxhdGVy
Lg0KPiANCg0KUGxlYXNlIHJlZmFjdG9yIHRoZSBleGlzdGluZyBjaGVja19wb3B1bGF0ZWRfZGlt
bXMoKSB0byBjb3ZlciBib3RoIGNhc2VzLA0KcmV1c2luZyB0aGUgY291bnRlciB0aGF0J3MgcHJl
c2VudCB0aGVyZSBpbnN0ZWFkIG9mIHdyYXBwaW5nIGl0IHdpdGggYW5vdGhlcg0KcmV0cnkgbGF5
ZXIuIFlvdSBtaWdodCBuZWVkIHRvIGV4dHJhY3Qgc29tZSBvZiB0aGUgbG9naWMgaW5zaWRlIHRo
ZSBmdW5jdGlvbiB0bw0KYSBoZWxwZXIgdG8gbWFrZSBpdCByZWFkYWJsZS4NCg0KVGhhbmtzDQot
SXdvbmENCg0KPiANCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gR3VlbnRlcg0KPiA+IA0KPiA+ID4g
Kw0KPiA+ID4gc3RhdGljIGludCBjcmVhdGVfZGltbV90ZW1wX2xhYmVsKHN0cnVjdCBwZWNpX2Rp
bW10ZW1wICpwcml2LCBpbnQgY2hhbikNCj4gPiA+IHsNCj4gPiA+IGludCByYW5rID0gY2hhbiAv
IHByaXYtPmdlbl9pbmZvLT5kaW1tX2lkeF9tYXg7DQo+ID4gPiBAQCAtMzIyLDcgKzM0OCw3IEBA
IHN0YXRpYyBpbnQgY3JlYXRlX2RpbW1fdGVtcF9pbmZvKHN0cnVjdCBwZWNpX2RpbW10ZW1wDQo+
ID4gPiAqcHJpdikNCj4gPiA+ICogQWxsIG90aGVyIHN0YXRlcyBtZWFuIHRoYXQgdGhlIHBsYXRm
b3JtIG5ldmVyIHJlYWNoZWQgdGhlIHN0YXRlIHRoYXQNCj4gPiA+ICogYWxsb3dzIHRvIGNoZWNr
IERJTU0gc3RhdGUgLSBjYXVzaW5nIHVzIHRvIHJldHJ5IGxhdGVyIG9uLg0KPiA+ID4gKi8NCj4g
PiA+IC0gcmV0ID0gY2hlY2tfcG9wdWxhdGVkX2RpbW1zKHByaXYpOw0KPiA+ID4gKyByZXQgPSBj
aGVja19wb3B1bGF0ZWRfZGltbXNfc3RhYmxlKHByaXYpOw0KPiA+ID4gaWYgKHJldCA9PSAtRU5P
REVWKSB7DQo+ID4gPiBkZXZfZGJnKHByaXYtPmRldiwgIk5vIERJTU1zIGZvdW5kXG4iKTsNCj4g
PiA+IHJldHVybiAwOw0K
