Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C753D3D7D69;
	Fri, 16 Oct 2026 20:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181441; cv=fail; b=SJNfhg8BA7Hz1Cl2KGY3srRVK7LgvWv0214O75noKCHnZN0tZ/FDYPELdCZaHA2Y409ptJg3QRpbo9vbOhDfJV75yzO1VydiZCD1+F1D0rgA7w7SQpjUeTdnBA10eZPYhD9QeaXQuRxZ0s7kcQxk0OPJr1SFrP9Obd2BL2c7GyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181441; c=relaxed/simple;
	bh=kChlxuOeVNT+ujuRkl+dIIi4tQadWwE3DJ9yPnadSSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pq66BD0TkTvOF5O7EL1Qv3SzRLloGmGGEeJylpwpZd1lDUh2Y5XiZ9tzoctzbNsHl8hsA3HdZUIkizmXuwxCrewfFT6eIF02h/uQzEIv/N0Lwwn1ieegHJ0Mra8qWC56do+BXn2eqzhLz/v8GZdSriusM0/tFkj3lhmy1ZNTnX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NeMZxz+I; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NeMZxz+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792181439; x=1823717439;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kChlxuOeVNT+ujuRkl+dIIi4tQadWwE3DJ9yPnadSSU=;
  b=NeMZxz+IlfOlidhSDooX4W1FIMewLnXymx3FyIBpZrR8tUlKis7rRTp2
   AAzbKdI9f8CJoZeZAQ5lNLNoRTmJVzj1XojT7qa0yFU4tdv6MIEU3XfC6
   BWMMGR1EQEnWOQndFF72YbMAfKzDeQMkCSWYiF9qD78zAM4Kx2pVjH1j/
   Xw9MbQBxtgJSh9lDVPdoOvtHv39TS+8Dnd3cEzL054525VEGtfEKXtDor
   L+gLIVHITUgvImkQbGJuQtFN+vovGHsdmkLNaU4BZ+o/inIAwtQJ7Y8V3
   LjoJoyw919IjvfuOqPX4bO333iKleKfQVnEZ/7K66sel1KeY8fVUgByKO
   w==;
X-CSE-ConnectionGUID: 4Vl0I/ULSPS7jX3B5MxBnw==
X-CSE-MsgGUID: KTQ4zC+EQ/6qZTIXRSz9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="982945"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="982945"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:10:38 -0700
X-CSE-ConnectionGUID: p+yrQGypRAG+6AISKAvWAg==
X-CSE-MsgGUID: KvKEOE33Q/+7Yp5tQaVFuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1910119"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:10:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:10:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 13:10:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjCWSTtPW4eYe6oIW3oKZPS3tKOe9h47Lv8OPaVNIDmh873qjIuvGJF3JNiNzVjZv8bEdinKXumIWg9egAJez6VYYYcXU5SA5Rq76yytoGRHCJqF+MD3k+4NueExrkvcfbwcV5ZWglmpbEXR4HIOrRvRrNX2FxpvXxFWZaWaOczjIrpQZt4hoseG9BxgfPU71HMa6xXbdRZLSN0xvfsbNpr+yaDZrhMSF24ePc47IxOyLgTIV+puNLSXYFV6y39qhwDvNAMsytsse8y1rBVrmhhCXi1TRVPwbOXRweRUY9kdeKy32VMaXDHjrnb4XrELBnlHyqbMXZGNk/zyXYYr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kChlxuOeVNT+ujuRkl+dIIi4tQadWwE3DJ9yPnadSSU=;
 b=Oe87prQeAGbTvlpUNBpqIk4dWJESMqRrBj37bVGSQ6Kbl3D6KAT7lvSDqiifduqc1Bd9gjeREgQBULlVkAeA3c1cUSievAJuh/OKFrRDiXwlkEa6BHsosV053kNQHphBrAZgG0pk2c5sf0lJcj8YQI0J+EAMTbVNEIvnsiFCajp097VzoYoviEBO3k0PlxQ+mF55svdDTOP4kYe3WmcmXtPVNOx/rnw3ojnDczXh4I4lt4Xtn5M5i0Ssk3DIztDIRA8t4BTKNr0HynAUzhGOgRf6JmI3IJe5q003FUAzXwscXXQGF7fZIy4pcqScvRynjYDx/RuxJ5bUMbtWxv4ahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5336.namprd11.prod.outlook.com (2603:10b6:208:316::5)
 by CYXPR11MB8712.namprd11.prod.outlook.com (2603:10b6:930:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Fri, 16 Oct
 2026 20:10:29 +0000
Received: from BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97]) by BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97%4]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 20:10:28 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v3 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdVwzMJ8t8Twb8tES9/BoGZSvJY7cApquA
Date: Fri, 16 Oct 2026 20:10:28 +0000
Message-ID: <5736985e9b63629d0bd5539ac9bd6d6b87c5ae3a.camel@intel.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
	 <20261008100623.7085-6-changhuang.liang@starfivetech.com>
In-Reply-To: <20261008100623.7085-6-changhuang.liang@starfivetech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5336:EE_|CYXPR11MB8712:EE_
x-ms-office365-filtering-correlation-id: d716a666-8514-4a39-d3c3-08df2bc18626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|7416014|18002099003|22082099003|10067099003|38070700021|11063799006|261009223027099003|4143699003|56012099006;
x-microsoft-antispam-message-info: 9H5XhO7PkuXXKYxuY0p3IFccxo/bUvd+gxR/UAQCLazvGQbmJle6SBzjQU+h1R695j3y85tWowwE6jsp2iHZBL8SP79KDj+Uag1sG8KESdKJ7ETm0ATlHTUN3Bt8p70T77b0QHop9b63DwNsVbYsmF5OAjMqqSPQxVCgsfxWQtoQH2pdSz4cv8+t7k5LeoaT+F9UA7LXfIVQNuEM3c6GqcTETh9fZ/s8HFOkJlAVaN9PwIL3ViziNopOEGVbMUpD6h6mHlhru0EXCF5DjDc+Ot1J1nfONxhx/MFDgac5dOahCI35w7qpKxyBofQTFchIppQtOostT+qk9N9D+JyWgyrrQbZNzgWmrDZIymWzIm8kNfCcngojpfJRiBLA32SZSrLFZtLOheeUOhsgleIpya/YkwD0Qbin2VONyIIJDI61eKF8WfOHzsP9COIkU9j1FqvPt2HKMB2Lx2AEXO9eUqJsJLSm5lZsXrHK9DxO3GFKymXVzIprm9LnzJOt/NFBxnuChxSgLpnU8OAOmnClI/wz3Cmq1PrGcXsFOQdhkBfEgQbA7JU8ZPPgZKuhepxpcwjopmIlhxhs7rTr3p13NtUOXxeCNQGokP3L8whnZHIYx69j5YSzjsA7pcqB80n+3IvsXResFg0MTLiglNhprhrjv5/2ETHWzhvj3nJ//TVaV+2NU3Lh338aXkHpG3sdgI2QOjN+1Coa6eptzQuhGVlebkTuMVMAZBDaeHoj/lc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5336.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(7416014)(18002099003)(22082099003)(10067099003)(38070700021)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEZ1bVdldU0xRnpkQ1hlZEhjcmhNR21tNE1DdTBxeVFTdHNoRHY4OFl0bVVL?=
 =?utf-8?B?OGJBMEJtMWI3MVFDcjZZMlhKOU14V0lxcDR1LyttVDl0eTJ4cDNJU3NBTnF6?=
 =?utf-8?B?Y2lqTFJKUit2T1pSRXRjbW82eTNTRXNQNmxQZFZSYjVKMHJqaXJIbjlUbHBu?=
 =?utf-8?B?bVFUSlhTOHVVY1FHV29RdzhTd0ZtZk1GTXUzZm93NHpOUEpHOUNLanpmcStG?=
 =?utf-8?B?K21RVmQ0YURzUmY2T2J4eUZnUnUwSGVjVHlybnlDUHROV0p4ZkNFWXZUdHFG?=
 =?utf-8?B?L2c4ZXRRN242OVR6aWc1YjJiZHNnTkQ1ZG9DRU5xdDJzbGs4VG5SVWZlVk9R?=
 =?utf-8?B?UEtsWExJUzRKSFhsN0JDNXRrN0QwdnB2ek9GL1dReFNobzVKd1p5N1owK2lK?=
 =?utf-8?B?a1J0QTAzNmdWOVUrV3VlLy8yZ2xyMGg1d2RRTmFpTFpSM0RqSXgxL0VUemJk?=
 =?utf-8?B?aFErZmJnZVd6bFphMXJSa2txZ1BNcDVrNHBPQ3BPL0pCREVhYmpSUkVaYTZl?=
 =?utf-8?B?SlNNY1dONXhmL013aXF2YWh3NHpTVzhBUi84eXIydXZlMlR3MWtRMklNRjhs?=
 =?utf-8?B?M1RPdG9CRWZYNnR2UDc1M2NhWURldGd1R2NlRisyTXdyLzJzd1pTNnJ4OVRL?=
 =?utf-8?B?RVpxRjNoVlNoYmVCVTVrYW9Ycm9FcWhhd1RFSFJLQkNwRlNuTXEvWVltSk1v?=
 =?utf-8?B?YzhXdDU4UlkzbXlkQXBZVkpvNXJnNUZDMXoweWxuR08xcUVMUTRZM2JrZjJi?=
 =?utf-8?B?S1lFcGJZdWdSS215NXl3VXlvbUZOTnNab255TDJiZHhEcVlMZ3dWME1TL0RO?=
 =?utf-8?B?Z01yVTVMSHJhczcyZCtZVU1WeG8vUE55WjRZSGE5RnFGTWhZMkFySk1SMUt2?=
 =?utf-8?B?eWp1Ti90ZTcxTE9xQkJDVEpKeldGMDNCSEFxWnhGNWw2TklUVE5OMmkzWnk0?=
 =?utf-8?B?M3ZsUkZKWURMbHJjQlNtSnFtTnViVDZEYTRlQnp5TW5aWWY5cTJWeXpWc2pW?=
 =?utf-8?B?R05kRi83Y3Z5RnNGbSsveDZlVCsxZWFJSnZVdkhHSGNSL2NJRVZmWXkzZ3J4?=
 =?utf-8?B?ejVxTjVJbkloTWRhSmQ0RW9RSTBLTnU1QmorV2VYYktXaEpvYTlESUlkRlZE?=
 =?utf-8?B?a0tPOUFqK21Yc3h2Tk5LVXNuODN1c2xEZnlZYis2WHRMb29iOVQ0aUdWTGxM?=
 =?utf-8?B?QWhXSHhURjJqQ05xQkplcUZLdXNmSnRlcWVkWmpjVE1FaW1UQlVUNEJLbG5p?=
 =?utf-8?B?MWgrZDZSWUlrdzA5MnBlL05NcXM4MWF1NEhXR3BrWmVmY25yRW1jNHo0LzBQ?=
 =?utf-8?B?cE14ZHhQdU83a01YczJLTEltL1RRbWpJcWFIYTloczM2ZTFxbDVUcGYrV0VD?=
 =?utf-8?B?WUduZE9JSlRhZG55VHdBL3VMVXBFTFMrM1JxRXZFUmdORnVhcitOdmxzSU5p?=
 =?utf-8?B?WkplbTZMOXljdUZOT0VWQXZLaTZ0ekVSRTRSNE5qdmtDaGwwSk8wVWFtN3Ev?=
 =?utf-8?B?L2Vab1VFMnJ0UE16KzFMRXhBbWVmMTk4ZXFLYzJ6ZG85bDRESCt5bEVtNFY0?=
 =?utf-8?B?WUU1ajRzQllMV3hKRFEvVTBoeFUxOXhXbGhPWVVtc0VnZmViSytGRGxmUXZH?=
 =?utf-8?B?STRvc0w2ZjJtWmFFd1VGS1hGMGtWWm9XZ2tidjlaeXh0dFVjZTZKSVlMS3Ry?=
 =?utf-8?B?aW04Z1FWZG9jQXlxbUZDbmVCUHZuTzNsUEJseXJIb2JoRXovci9NdWFlZDNz?=
 =?utf-8?B?RFZ1REZPa1FvWlEzQk1YdEd2d3B0eVBtalk0aC9WQi9WQlZCRWJpell5UTR2?=
 =?utf-8?B?SURIRG50M3hnOFB4amdCdERlNmdHN2lXRVhwcjA3UUoyV2hUSUlBd3NCVzhW?=
 =?utf-8?B?Z0lPZXpYb20venhzUk5aYkpURCt1RUJ1bGVjdEg4ckNZOHEzTkMvbWgzS0RP?=
 =?utf-8?B?NjBveWUzdUxNYi8xMEZFTXM5cklCUjJUYUJSdXNORmMydHRubjdNR2YxalVj?=
 =?utf-8?B?b05lQTd5Mk80dEFSVU1BTUduOXdMSnBkdHBIWE9IOEZQc1ZWUkxSSmxmRnN4?=
 =?utf-8?B?NHg3Qk14VzJKVTJERktHNVNDM1JUNU1Id05Za0JaTVFhQXpRNllOcGJ6RERH?=
 =?utf-8?B?c3pvcjgwa0s0b1FjSWVKODlxbElzdGk4b0VjbVFSUmZ5NGVPczVtYk45Nlhy?=
 =?utf-8?B?NUs1UkF3ZEVZUmsrZ2tHM2pkOUtlK2tGY29sb3AycDI2UXRoMkExdFRxUlVX?=
 =?utf-8?B?Ri9acFRqQmoySHQ2RjdpOWVvZ0svZU9JNjFsTE5qdW1rYmpZZHp0OTdQV2FT?=
 =?utf-8?B?UXN6VElXV3hJbGprMTloalkzdWtjeXl3OVFQZFZaZW5WMlJBbUFSR2YzMzRk?=
 =?utf-8?Q?WDWhdKu1nCvVpLuk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A3EE6E29FD54F47A7A3B20BB6BA61BF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jcQeiS/+7JdZSYj3vQi/Q78aEes5Mw7qUvqgeb4RzMCAzV1EBKVlUoibwYKI4adQgeRb3HKsQZ/HDLaM15Lostry9e61hQLUK+0QyhZSkg30BVS0HU4zUDeduxCyEdHlpFuqc9DxeX6m4fKaWa7kk4aj7qTGgEOL1Ru2ua4lbdykBUZvJfSTxGRKuNtAivU7p0HAEdDpgjB2xEjcRiC+demaE9NzAqousG1bOq5M9ZsX6Izn6mUm/LQ0dlRlHz/Px/apMl965vpVLLVwZ4B611JuHiM82iEoU1D57xSQ/oWROaScvbLMUOuGRg2YpyD+60UH9ajNlao1RDnKeeZwpQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5336.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d716a666-8514-4a39-d3c3-08df2bc18626
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 20:10:28.8763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqM9pb+7jDe+WtR5eCfjYIg5RR0DMyKKTjYo3iXtx7UGdJeF5QkDtBbNE5Rv41gfwTHgiGeLQHbVHfRBzfxNfjq2DThTW1/Ot0i1IxMQAk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8712
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDAzOjA2IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBBZGQgR3Jhbml0ZSBSYXBpZHMgKEdOUikgQ1BVIHN1cHBvcnQgdG8gdGhlIFBFQ0kgY3B1
dGVtcCBkcml2ZXIuDQo+IA0KPiBGb3IgR3Jhbml0ZSBSYXBpZHMsIHRoZSByZXNvbHZlZCBjb3Jl
cyBtYXNrIG11c3QgYmUgY29sbGVjdGVkIGZyb20gZWFjaA0KPiBjb21wdXRlIGNvcmUuIFRoaXMg
aW1wbGVtZW50YXRpb24gaXMgcmVsYXRpdmVseSBjb21wbGV4LiBTaW5jZSB3ZSBkbyBub3QNCj4g
dXNlIHRoZSByZXNvbHZlZCBjb3JlcyBpbmZvcm1hdGlvbiBmb3IgdGhlc2UgQ1BVcywgd2UgY2Fu
IGV4cGxpY2l0bHkNCj4gc3RhdGUgaW4gdGhlIGRyaXZlciB0aGF0IHRoZSBjb3JlIG1hc2sgaXMg
bm90IHN1cHBvcnRlZCBmb3IgdGhpcyBtb2RlbC4NCj4gDQo+IERlZmluZSBuZXcgY3B1X2luZm8g
c3RydWN0dXJlIGZvciBHTlIgd2l0aCBtaW5pbXVtIFBFQ0kgcmV2aXNpb24gMHg0MiBhbmQNCj4g
dGhlIHRoZXJtYWwgbWFyZ2luIGNvbnZlcnNpb24gZnVuY3Rpb24gZHRzX3Rlbl9kb3Rfc2l4X3Rv
X21pbGxpZGVncmVlKCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxj
aGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQoNClJldmlld2VkLWJ5OiBJd29uYSBX
aW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQoNClRoYW5rcw0KLUl3b25hDQoN
Cj4gLS0tDQo+IMKgZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYyB8IDIxICsrKysrKysrKysr
KysrKysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYyBiL2RyaXZlcnMvaHdtb24v
cGVjaS9jcHV0ZW1wLmMNCj4gaW5kZXggNDU3MDg5YzU2MWI0Li42OWM0YTA3Yjk5ZjcgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvaHdtb24vcGVjaS9jcHV0ZW1wLmMNCj4gKysrIGIvZHJpdmVycy9o
d21vbi9wZWNpL2NwdXRlbXAuYw0KPiBAQCAtMzM5LDYgKzMzOSwxOCBAQCBzdGF0aWMgaW50IGlu
aXRfY29yZV9tYXNrKHN0cnVjdCBwZWNpX2NwdXRlbXAgKnByaXYpDQo+IMKgCXUzMiBkYXRhOw0K
PiDCoAlpbnQgcmV0Ow0KPiDCoA0KPiArCS8qDQo+ICsJICogRm9yIEdyYW5pdGUgUmFwaWRzLCB0
aGUgcmVzb2x2ZWQgY29yZXMgbWFzayBpcyByZWxhdGl2ZWx5IGNvbXBsZXgNCj4gdG8gaW1wbGVt
ZW50Lg0KPiArCSAqIFNpbmNlIHdlIGRvIG5vdCB1c2UgdGhlIHJlc29sdmVkIGNvcmVzIGluZm9y
bWF0aW9uIGZvciB0aGlzIENQVSwNCj4gdGhlIGRyaXZlcg0KPiArCSAqIGV4cGxpY2l0bHkgZG9l
cyBub3Qgc3VwcG9ydCB0aGUgY29yZSBtYXNrIGZvciB0aGlzIG1vZGVsLg0KPiArCSAqLw0KPiAr
CWlmICghcmVnKSB7DQo+ICsJCWRldl9kYmcocHJpdi0+ZGV2LA0KPiArCQkJInJlc29sdmVkIGNv
cmVzIHNjYW4gaXMgbm90IHN1cHBvcnRlZCBvbiB2ZW5kb3ItDQo+IGZhbWlseS1tb2RlbCAweCV4
XG4iLA0KPiArCQkJcGVjaV9kZXYtPmluZm8ueDg2X3ZmbSk7DQo+ICsJCXJldHVybiAtRU9QTk9U
U1VQUDsNCj4gKwl9DQo+ICsNCj4gwqAJLyogR2V0IHRoZSBSRVNPTFZFRF9DT1JFUyByZWdpc3Rl
ciB2YWx1ZSAqLw0KPiDCoAlzd2l0Y2ggKHBlY2lfZGV2LT5pbmZvLng4Nl92Zm0pIHsNCj4gwqAJ
Y2FzZSBJTlRFTF9JQ0VMQUtFX1g6DQo+IEBAIC01NDMsNiArNTU1LDExIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY3B1X2luZm8gY3B1X2VtciA9IHsNCj4gwqAJLnRoZXJtYWxfbWFyZ2luX3RvX21p
bGxpZGVncmVlID0gJmR0c190ZW5fZG90X3NpeF90b19taWxsaWRlZ3JlZSwNCj4gwqB9Ow0KPiDC
oA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjcHVfaW5mbyBjcHVfZ25yID0gew0KPiArCS5taW5f
cGVjaV9yZXZpc2lvbiA9IDB4NDIsDQo+ICsJLnRoZXJtYWxfbWFyZ2luX3RvX21pbGxpZGVncmVl
ID0gJmR0c190ZW5fZG90X3NpeF90b19taWxsaWRlZ3JlZSwNCj4gK307DQo+ICsNCj4gwqBzdGF0
aWMgY29uc3Qgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2VfaWQgcGVjaV9jcHV0ZW1wX2lkc1tdID0g
ew0KPiDCoAl7DQo+IMKgCQkubmFtZSA9ICJwZWNpX2NwdS5jcHV0ZW1wLmhzeCIsDQo+IEBAIC01
NzYsNiArNTkzLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9pZA0K
PiBwZWNpX2NwdXRlbXBfaWRzW10gPSB7DQo+IMKgCQkubmFtZSA9ICJwZWNpX2NwdS5jcHV0ZW1w
LmVtciIsDQo+IMKgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmNwdV9lbXIsDQo+
IMKgCX0sDQo+ICsJew0KPiArCQkubmFtZSA9ICJwZWNpX2NwdS5jcHV0ZW1wLmduciIsDQo+ICsJ
CS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY3B1X2duciwNCj4gKwl9LA0KPiDCoAl7
IH0NCj4gwqB9Ow0KPiDCoE1PRFVMRV9ERVZJQ0VfVEFCTEUoYXV4aWxpYXJ5LCBwZWNpX2NwdXRl
bXBfaWRzKTsNCg==
