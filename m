Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAEF3FB04E;
	Thu, 17 Sep 2026 20:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678130; cv=fail; b=tyz7t5usNlMxxSpLPM110q4O/C2fiLD6xIi8maIHZDrxYHlfeJ+zcMMU40CDlErmITmeA/EjJOzfKT4XI4ccOVjzBikB3hl16uNQVJkZ/DJlPcygPSwIT2ksMUTOID++GO66mxljd7dWy+tQc8CrAPOzeIzjQ6dpkIouNWpQwaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678130; c=relaxed/simple;
	bh=/qDw5ZhExiR4LP6xYfvw1LVQ2yDvmKR3zc/nKeWvAJM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CVZjjtbZYgiRbsDWtpvXz4j6KcQsEuA6jZaalwn2yiYfmFgnh378eevSOlnPB0WKqiPVBtnWar8jdH2j17HVoN/B4xf23deWj2qss2B6xMaJfz91Of0bmJcLWbtD0JKE1JiVaTqHvYoMV1p5EWTrJRWK9JOD2GXrTsLB8cSgmLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1zXwIFY; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1zXwIFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789678128; x=1821214128;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/qDw5ZhExiR4LP6xYfvw1LVQ2yDvmKR3zc/nKeWvAJM=;
  b=X1zXwIFYNLEcrA79JJMiFl0/o3cMEVBq31R8m1N/T/FM/zSTtQyYPo3S
   3aCujzBg/0mOTMKgr3jegb3EhAfMIcDFJ0PQrhpq1iT4asZt4u68in8H6
   QvPhWSMOZ1prXpA+4ZZ93fLQ2DzIXSVp34i9L3/OX3pCkpMVt5K9BfARx
   Zg1JqKZ8z9xvU9j7iJWKlKXkRrZDU+WQLVWb+jtK3hauUu9B2egE4Wyu/
   lmvb8t9kUELWRKjsiiEielkUAdxIWRPyF3xDOlximVz2+0Nfkn2DMuseL
   Wmmv5MCLBWRFeMzgnyXo6QDR+qtOKtDmYDHKAf5Hj8LHqBR3i57tLv3Gg
   w==;
X-CSE-ConnectionGUID: +u1SeIcTSHyOKfxwJ9Whrg==
X-CSE-MsgGUID: B7QMHV77Qzardemj1vzW7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107647581"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107647581"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:48:47 -0700
X-CSE-ConnectionGUID: d/EWIFtCTKGCYwsZ5g1kiQ==
X-CSE-MsgGUID: 216ETCo+TjqFWTmHwZvsGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269722061"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:48:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:48:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 13:48:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:48:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC9r/t38uzgaG42bb/PsTEtqVYCJhSzhg0pQSGMVI0utp2jMvPAUUZea2QDfctHnlCFLsQiDCwknF86sJB505Y+eP3atCSB6L4mOj7fY6Lg0hE71ATQ0Lb8i51ne9JlNF198wqu1PoSwHTwb0CYNil9ishkw36VRK5rggk+tKKegjug1jYI35JxHInoVc0ckn1XZyq5YhL8MaQOhVbCVP/hqrttffWsldYGnKIEa8Z26ZAb6+H7Ox6ltFIEXtfFDeda+sl7t9BVWon17TU0P6/I0n/ZMV4MKFCOGUUjTI2l3HOZUGD8+AO5AHMZqXB33/m9IF6Zmf5Hsc7lEJgDwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qDw5ZhExiR4LP6xYfvw1LVQ2yDvmKR3zc/nKeWvAJM=;
 b=CnG0iWapByhgipu3IZL2ehYE6UVAxb78e2eyBQ12mBe/MYPj/ndjcuyLR9W7Kh/YXBAAJmQupOSuZ/CTF0tmNogvmiDm8sYUo6stgrx2MAXhNAmRmhFW7sSxxNcAmgtz3IhLNoXsNTuu5q46NJUNptFq42Kv4Zv7Fcl7UQ4v9Db1i9HoJFKr9rQ7HWAwOsBkuMSzZWD8xdChoWfyRLLt+lG1eUyn43inRx+zMHnoYMxciVBGlQgsHZJZd5EyFln/JCzEJIjva7OqeERSc0poZRTqJgyaC1paCeNLOm1EOr8qEthpGR4a1DD7OWP/C1EY3JtW7V6V/0j9szT3S8hQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:48:43 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 20:48:43 +0000
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
Subject: Re: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdO6kfs81BNcYZr0KAQ4qQeV0ub7bTVICA
Date: Thu, 17 Sep 2026 20:48:42 +0000
Message-ID: <cbb35e1947dba7d06896a9c66f35f8736a481215.camel@intel.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
	 <20260903133408.110847-6-changhuang.liang@starfivetech.com>
In-Reply-To: <20260903133408.110847-6-changhuang.liang@starfivetech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|DM6PR11MB4673:EE_
x-ms-office365-filtering-correlation-id: 9a830239-4da2-4829-39b7-08df14fd0f87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: vf7//iFaYqb0TouEW4btoWmIP3l1AIwTNhm9Fuacdjb6Bd/7XBUEl+6qvbSSwlwTjZuVtUAkfXlDzx/qbIK73nOtS+0kqL9s0Q1UWxztPvHwYWqtmDVlBPYCxBI2O7FpNeEUa2nXPpzxdxUh2zI/jV9D2guZda2BB1gMpCjD1gfntVTfy3I0b1ovrf9DK4b92G0jLzdu2Vn8Ds12F0YWNA0BPG59AA/beNhI23cwgsmIaQYZJUYpmYr8wpGwz2o/b9hwiLKfWhHAQJrB9NP3eNfGwIrzMWbUi21tlEo84xbYu0Vvl+YVzIv3eMNKs8Dr+igdk2M1tFQCxricZlBc+eiqPhJ8JDJ1SCqRv9Mg9Yn1U5ODMk0kPDZwfB2X0GfMPxLHgAlTp2+ANFDug3NbzEMBhR/bZXHKkjlpoVypGO/VhG6PEV6p0DKMxaoUUYiOHUGkwhrPdRQB/IajXxBkR9F92PEe3tPbpLei0bQaUD8HRbWrPM6Uo9zVpB+mypogeGxCI73f4E+X4G+3c2MAdS7OULk+3K7B/25C2M4NLn6INiNcBas1ITWArUH9wuStwEsvLTfrIbuCf6PEFXhU2P0enVD0YkXPqYfAVxg+gsDMifmXlb6MvPhw/eekWSsnmAfGipFPaayWYLMK7D6wqAawoSG/wjVXrpApW1qOMUz8jMZJq2AAd7f9WOWHCrXVIpwusQbthvFGjAAjTt++qb/FFVA3FBsdycgHhaf6Mr0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2lmS21JMktiMWpyRVZFMngwM0d6cTV0TEZCQ2lvYm9ITXd0SjZObEExUzFu?=
 =?utf-8?B?UTZZY2FSTnZtUFRYVEVVSHhGb1VxM29jN1RQdmZQenJ6QWFyVlVhMDBpL3ZO?=
 =?utf-8?B?dG1NQS9waDkxd3E0Wi90WDVEUHFKVFdyVWJqUXZrL3ZrWnZ5U2R2WFFaVUNH?=
 =?utf-8?B?Y2tpczNoTmQ3dnE2dFppK2tRUElRN1FENmFSM2ZnQ0tVK1pLRUN2ajU2NTB0?=
 =?utf-8?B?R2dCci9ob2RpUlcrUzk0OVFIc2lMd0M0YjU0bEFLMmV3UG90ZzcxNWxGWmMw?=
 =?utf-8?B?Nlp5SXZ5UGJnekhTaVNxMDc4SWlxM3FkcVhzT2R4UEN6ZzBSL1grU3VTMnlJ?=
 =?utf-8?B?R0lyNElGVFN5ejdPQ2ttRTQ2MzBDVG5ZMnVvSDU5RElCK3hSejkrZjBGYUZl?=
 =?utf-8?B?NGVya05SQ0hYWWd3aklHZXJWZC9BNDFBOXhYNjVGMmYvL1UxUTk4RWNGSzQr?=
 =?utf-8?B?aUZXSHBrNE52K21ENlRWM2hTQjUrdUdrZnhXK2tzN1hpMHRnYnk5dnB2bFNG?=
 =?utf-8?B?cTJBYkQwZE13c21FeWhLeTN1S0R5MWZ2L3FWSG5uTEVwQTQrSVF5Ylg1NC9V?=
 =?utf-8?B?QnptQTNRem9GNjZFTW1LdGxnei96dHh0NUlxRURRL1hCRFZIWGFmRm1NVzFB?=
 =?utf-8?B?TlBxR1hJakY0UVRnWCs0TkR0R1lxQVNkaFVpSEk3QTYrRHlRUUVCTThOWktT?=
 =?utf-8?B?cnVKSnNydlNFMUV3dlVuck1qdXB5YWtzaDZoMDViK0EvZjRpbEVGVkJKL1Rq?=
 =?utf-8?B?T0FSdGozOFBDWkorK1pweHMyM2phc24vS2VBRzFGU0hkSDdoTmY0eC9yVGlp?=
 =?utf-8?B?dFNrcENNODkxNHliSzBnbjdTQ1ZGWGZ1SmpNNDNIR0dXcFdJeXdsSURPVkVJ?=
 =?utf-8?B?UXMzTUFISDVEV2pFZUVCTFBvZjRPdVFFeUU5NVpiVlFNV095VlZ4NXprSzVx?=
 =?utf-8?B?NE5aQXI0c2JUc3BNZ2xWMCt4SG14bzF5M05CNzNFUHJJOXd1NDZmbGQ3ckxI?=
 =?utf-8?B?ZzFWeThhcW83NmRVQUJHV01xYTk5bWVjYTFjN0hLZ3ZvUTk4Zko0bnhGSnNl?=
 =?utf-8?B?V0lvVm1kTTdnZXVYSithajdnaTVNOVZ1eUpLYmNVb3VRWDRqNDhITHErR3pX?=
 =?utf-8?B?T3cwSW5pTjhvR2t5QlZoK3pYY3h1dXZPVUd1L2VVZmUrcVIrUHlHaVVWM05t?=
 =?utf-8?B?VFpqSFlpZVZnYXoydUkvczNIc3g1S0V0VzhmdnorYlIrcThoRVhNSlQ0VHR2?=
 =?utf-8?B?Y1RkTW1kMHJ3R3M0dnVOQmQrQnJhektVekNtUmYyTlZ4cm82bUs3UkRaYjl6?=
 =?utf-8?B?d3Ezcldxa3J1dlZYVTBaT09RRVRKNlZQNXYvN2E1L1EvQ0JuL2kySHMwcW8x?=
 =?utf-8?B?bEZLdjRHZTlycXFGZ0IvS202WWYwclpUcnlqY09Sd2lYVlViYW9DMVBCUUh1?=
 =?utf-8?B?dGtrKzhQVC9pS1JmWmFEWW81UmhIZlozN3Rtd0Y0R1d5TG9kV25JcWZ1VVBE?=
 =?utf-8?B?b0Q0cVlaZ2VFRHFnZ0Q2SmlmcnhiSG5hZ0p1YTZ4S2JXeG5MNzFScHk2SU1l?=
 =?utf-8?B?ekYrOUVhQzlqQjRGMGIvR0VVZnFTaWIwUFJNaDR0QjlXL1JIa2o5YUpZVUVl?=
 =?utf-8?B?THRrd3laWjhabjhtMFlmSzZzb3AvcHdGZys2NjFsbXBpdEFGbUdVQTdiaWtT?=
 =?utf-8?B?STJ5SFZTYkdiRThNeFJYRm1vMSt0bXloc09pQWVreEJKWURXc0JIZjV2VEZJ?=
 =?utf-8?B?MERIVHZ4ajFWc3hJdHRYVFprVVhrY3daTXdTMGduTE40ZWdSSHhhUjdQV3Vn?=
 =?utf-8?B?bUxrbWxmUFFYMWxFTjc3Zm5EWnl4V2dNQVk0OXhzN3p5OXE4YTV3T3l2L0c5?=
 =?utf-8?B?QWV2WHphcFU3NkgyVFo2T0VKNnRLOTlmd1dyREFCb2lUZURMU25BQlBMczFV?=
 =?utf-8?B?M3ZGS280UThOV3NNZHFEUjBpdmlZVFFBZWNHNERPNERCWmxPSkpQNmV4Nm5P?=
 =?utf-8?B?aGJhTFhPS3E3N2ZkNzdCSVRuVjZDa05SNGhzOUNJQXNJbFJ2Y2ErVFhiWkpI?=
 =?utf-8?B?VmVvSW9sVyt0blVuVnQwVmR0KzJYbEZtUHFubjY1UWlmOXRBVEk1WXZ0OUxW?=
 =?utf-8?B?MUNhbmJOb3dBb0lIRGFHd3BLemJvYXVMaDc2STdyTnphb3doc2hlKzdYc2I3?=
 =?utf-8?B?RkQrbUZCMzZSR3lMNm05YmtTTTRoSDVmU2VtbVNLOFpxRWdVaDVqY05pc2Rz?=
 =?utf-8?B?Y3Q1RHg3dSs1b2FQMCtkNmpjMUFWbkdiSzlLdkJKaEpqQ1IxVmt2SkczTnlN?=
 =?utf-8?B?dGlHbTh6RVVlZ3o3VlRod2xSbk4xakxqV1ZUL1pjTmc3cytoS3ZxMXJtOGZH?=
 =?utf-8?Q?uVq4y/cIjugjKMro=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1C81276F2B38543B9F7D312C6DD731A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hR+pEWfUKxTd0XLlTWB43Dm0jOaNU9n/IlH6fhaBNIA5kOGzVclMuzwGy0WpWkyA1Ki0WhnUiBLaaOz8YRe+hc+iCXkjYQ+TWwuQ+EIQrZvO5GkaqEpK7XLtQPZ7Xw9RTrgVodgnwY33IhXotMXlxGI6+Vugt7bWqdnUwTDqY8Ihi8RU5O06MAKm3hL26TA/FcsB98exBtSm1VmgYpYH6zMVKeoaI5ugUCWZgjQSDl9dwSlAmYSiGSsgpiGnJtb9p/oliwX6rF/PBEdRRZDUbZy27FpAjRrF9VpTXQvpFlxFV2lRlFvUePTRFu6sYN0f5oN/RqSJCWBuFS7i+5d1Lw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a830239-4da2-4829-39b7-08df14fd0f87
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 20:48:42.9214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FAc5dlcTZaGseTzul3t/4UVJHKD7/0di72wW9KM6UjYQ2G3zWzs9PDPcsinRFyOnS2/YVQ/BKcoEvHshNz8HmSj3McVYBByZ3Xxaegbj+ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTAzIGF0IDA2OjM0IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBBZGQgR3Jhbml0ZSBSYXBpZHMgKEdOUikgQ1BVIHN1cHBvcnQgdG8gdGhlIFBFQ0kgY3B1
dGVtcCBkcml2ZXIuIFRoZSBHTlINCj4gcGxhdGZvcm0gZG9lcyBub3Qgc3VwcG9ydCB0aGUgY29y
ZSBtYXNrIHNjYW4gdmlhIFBDSSBsb2NhbCByZWFkLCBzbw0KPiBoYW5kbGUgdGhpcyBjYXNlIGV4
cGxpY2l0bHkgYnkgcmV0dXJuaW5nIC1FUEVSTSBhbmQgc2tpcHBpbmcgdGhlIGNvcmUNCj4gbWFz
ayBpbml0aWFsaXphdGlvbi4NCj4gDQo+IERlZmluZSBuZXcgY3B1X2luZm8gc3RydWN0dXJlIGZv
ciBHTlIgd2l0aCBtaW5pbXVtIFBFQ0kgcmV2aXNpb24gMHg0MCBhbmQNCg0KUEVDSSByZXZpc2lv
biBmb3IgR05SIGlzIDQuMi4NCg0KVGhhbmtzDQotSXdvbmENCg0KPiB0aGUgdGhlcm1hbCBtYXJn
aW4gY29udmVyc2lvbiBmdW5jdGlvbiBkdHNfdGVuX2RvdF9zaXhfdG9fbWlsbGlkZWdyZWUoKS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdA
c3RhcmZpdmV0ZWNoLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAu
YyB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BlY2kvY3B1dGVtcC5j
IGIvZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYw0KPiBpbmRleCA0NTcwODljNTYxYjQuLjQz
ZTUyYTZkYjc5YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYw0K
PiArKysgYi9kcml2ZXJzL2h3bW9uL3BlY2kvY3B1dGVtcC5jDQo+IEBAIC0zMzksNiArMzM5LDE3
IEBAIHN0YXRpYyBpbnQgaW5pdF9jb3JlX21hc2soc3RydWN0IHBlY2lfY3B1dGVtcCAqcHJpdikN
Cj4gwqAJdTMyIGRhdGE7DQo+IMKgCWludCByZXQ7DQo+IMKgDQo+ICsJLyoNCj4gKwkgKiBTb21l
IHBsYXRmb3JtcyAoZS5nLiBHcmFuaXRlIFJhcGlkcykgZG8gbm90IGV4cG9zZSB0aGUNCj4gUkVT
T0xWRURfQ09SRVMNCj4gKwkgKiByZWdpc3RlciBvdmVyIFBFQ0kgLSBwZXItY29yZSB0ZW1wZXJh
dHVyZXMgYXJlIHNpbXBseSBub3QNCj4gYXZhaWxhYmxlLg0KPiArCSAqLw0KPiArCWlmICghcmVn
KSB7DQo+ICsJCWRldl9kYmcocHJpdi0+ZGV2LA0KPiArCQkJInJlc29sdmVkIGNvcmVzIHNjYW4g
aXMgbm90IHN1cHBvcnRlZCBvbiB2ZW5kb3ItDQo+IGZhbWlseS1tb2RlbCAweCV4XG4iLA0KPiAr
CQkJcGVjaV9kZXYtPmluZm8ueDg2X3ZmbSk7DQo+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4g
Kwl9DQo+ICsNCj4gwqAJLyogR2V0IHRoZSBSRVNPTFZFRF9DT1JFUyByZWdpc3RlciB2YWx1ZSAq
Lw0KPiDCoAlzd2l0Y2ggKHBlY2lfZGV2LT5pbmZvLng4Nl92Zm0pIHsNCj4gwqAJY2FzZSBJTlRF
TF9JQ0VMQUtFX1g6DQo+IEBAIC01NDMsNiArNTU0LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
Y3B1X2luZm8gY3B1X2VtciA9IHsNCj4gwqAJLnRoZXJtYWxfbWFyZ2luX3RvX21pbGxpZGVncmVl
ID0gJmR0c190ZW5fZG90X3NpeF90b19taWxsaWRlZ3JlZSwNCj4gwqB9Ow0KPiDCoA0KPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBjcHVfaW5mbyBjcHVfZ25yID0gew0KPiArCS5taW5fcGVjaV9yZXZp
c2lvbiA9IDB4NDAsDQo+ICsJLnRoZXJtYWxfbWFyZ2luX3RvX21pbGxpZGVncmVlID0gJmR0c190
ZW5fZG90X3NpeF90b19taWxsaWRlZ3JlZSwNCj4gK307DQo+ICsNCj4gwqBzdGF0aWMgY29uc3Qg
c3RydWN0IGF1eGlsaWFyeV9kZXZpY2VfaWQgcGVjaV9jcHV0ZW1wX2lkc1tdID0gew0KPiDCoAl7
DQo+IMKgCQkubmFtZSA9ICJwZWNpX2NwdS5jcHV0ZW1wLmhzeCIsDQo+IEBAIC01NzYsNiArNTky
LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9pZA0KPiBwZWNpX2Nw
dXRlbXBfaWRzW10gPSB7DQo+IMKgCQkubmFtZSA9ICJwZWNpX2NwdS5jcHV0ZW1wLmVtciIsDQo+
IMKgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmNwdV9lbXIsDQo+IMKgCX0sDQo+
ICsJew0KPiArCQkubmFtZSA9ICJwZWNpX2NwdS5jcHV0ZW1wLmduciIsDQo+ICsJCS5kcml2ZXJf
ZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY3B1X2duciwNCj4gKwl9LA0KPiDCoAl7IH0NCj4gwqB9
Ow0KPiDCoE1PRFVMRV9ERVZJQ0VfVEFCTEUoYXV4aWxpYXJ5LCBwZWNpX2NwdXRlbXBfaWRzKTsN
Cg==
