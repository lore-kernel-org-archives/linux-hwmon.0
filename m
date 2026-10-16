Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403843C3F45;
	Fri, 16 Oct 2026 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181309; cv=fail; b=ip3Wig8AC6Gw1hA/qN6iIO9Jejlh0OaVCq6LRM5HwevbiUDPHu//SYJH7S9PXqR7a394rJ2CQRfZ6EpX0UEDS8oQqyNLwYA5I3EFXaovVHHeMyH9F3keyux/20x+uSbm4bLpi/pyZ6Cdc9lvCv3jHw/wX1taQ0eCa/yK6VAic5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181309; c=relaxed/simple;
	bh=hLZateWp4kUcnybsiE4sT2Dt6aJiq6WZqYBBGFewNQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YA2a2t7MV8LelSjV4oJFOZD/t2lm1Bw6HbM5g5baCJpP7MIYxmpW1Fb7gQxqv4uyidk9cRbtrDoQZTMKHBvSy9dKLcpQjaTY2q6SqMp36Yt0z0KEI2p+uqYTzCC87ZQj+dlTiBIpQjfCAY3WIw9DsRfgtHKQdn/f6xLQrj9N4RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaOsnDWe; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaOsnDWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792181308; x=1823717308;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hLZateWp4kUcnybsiE4sT2Dt6aJiq6WZqYBBGFewNQA=;
  b=UaOsnDWeqFGa0gn+POR35nuhJaxVeqCvEzK5lA8upQcbU4bXByqi2MEe
   RgKwi/ae0hYu9HCDy4sd15BC2qN5s/SCDknhL2/tYdYHydIyUQLR89ADG
   t5krff0x4DA8FzozWcvOsr3Y16dncHcdK0h3fatzxBf6jy8Bi8LrvI2Xv
   PDDAic50JH6ze3rhIem4yW1d9S08gQAKolaQsktNXyh8lTsxQXOPSDZ4q
   6VCmApB4UP7E0V0X/d1BEHbOjMfImxSTT25SIkLNBZufhgSPiUvDtsr3P
   +i5U2n6ec6sBjk0M5Qzspv5t09UHJnj9r3Hci6BUt32+W6baGWrCaSJGK
   Q==;
X-CSE-ConnectionGUID: RP15hk3jSQeGzyPHGnkYDQ==
X-CSE-MsgGUID: H/99lFG4Tj+fFv0jfEikkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="982709"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="982709"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:08:27 -0700
X-CSE-ConnectionGUID: GDbV0AnPTwKDLw19APAlOw==
X-CSE-MsgGUID: O+KF8FeHQgSyymi8/yTAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2010085"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:08:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:08:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 13:08:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:08:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHHf0bVBIJtMR+lG7hC4CjE68y+za8O+u5T9xGNdiE7tJOpZ+PQQ+hm+Yn/NCFwZhpoKtRID+kLcAw9J3bo4BKsDjjb/I+jROacFEJP8iItJgKeeKkAUPFcEN37MtWmfgIYroentmNUorU8YeY/KJCwURAXwSbTQdO6TPlxcthozAfGnErTBM402RhexYKvCZ29BbBw4HqLmGn92CM/EAKxCn88lwNBJNW2nI9mwBgBKmNGSWIAH6R/vDwU0aRjHOzR9Ft3d8oM5yoLc2pDEI+i5IE8RDaXegMD/WeHYdSbx7kOeEtj1yfptf67JRlZVu10c/N3EkRu3SvfCRC5j8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLZateWp4kUcnybsiE4sT2Dt6aJiq6WZqYBBGFewNQA=;
 b=MAlJJebDKC1Ezyzoxt1ME3FhO6+M2OPgLp261x7uVcZFiyMjsJ45BRo32FGX9ttsgL7IKWCBRhmPKrSXvBRhUlp5dau5JTuM8GOm+Duihu5AbRpbPju+USLKTyg8LGZCu0946mn4ldzg0H538GgS6HUieybkUB1CcdmRLOUG2sxt/rhJheO9CSnzaKcqZEqU0TOj2OZOp/GkBZ3XlLawBFAWgbry70lWEVsfwxbIFbliankqALZsuBjwzI48yiO3Ir9LS7IOwTQOf0yMl/vN0I8VA3KLTfeT7XPiPGYRlL8if/pB781hqynLeogKoznQJfjlEkk/SHPh1BpCxjTkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5336.namprd11.prod.outlook.com (2603:10b6:208:316::5)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 20:08:22 +0000
Received: from BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97]) by BL1PR11MB5336.namprd11.prod.outlook.com
 ([fe80::d355:5aba:fb26:da97%4]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 20:08:22 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: peci: Add StarFive JHB100 PECI
 controller
Thread-Topic: [PATCH v3 1/6] dt-bindings: peci: Add StarFive JHB100 PECI
 controller
Thread-Index: AQHdVwzABtDsgocY5ECm1BHWrqJqSrcAphQA
Date: Fri, 16 Oct 2026 20:08:22 +0000
Message-ID: <d51febc8bd6fd2bf16ccb3b1d3db2f391d50b907.camel@intel.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
	 <20261008100623.7085-2-changhuang.liang@starfivetech.com>
In-Reply-To: <20261008100623.7085-2-changhuang.liang@starfivetech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5336:EE_|DS0PR11MB7529:EE_
x-ms-office365-filtering-correlation-id: 8a36fc4c-53d9-419c-7c1d-08df2bc13af2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|18002099003|10067099003|22082099003|3023799007|11063799006|261009223027099003|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info: 7IsryrRWpQRsSBiYU4o28DHjjdfV8TRFEB4yU44Zbqb/Xu7ObnPtjAAehvrQY8+Z8SHDNPBhGu79G3zmv8zD67tEvmZwR5ap3OCr4eEAESD7PWwbQzThkmdgSxfXoN//oW14otFqZPatbmYrD9v1+PXhPSMkpx4zTLdEyPIzEV3rx6VVKZ0I6BOY5KeJ0U7HJcsVirXEmAwqnZnMo/M57OtZKuFJBK7YnIU5Dujo3p1xqjPXG9KVBtbQtXdFhd7K7mOV/43rnA+Sxe0s55KDAgNi3jd2USupB/lvdkgAoQGhtW/TfwbazzJhOjCv9uh8a8LvuEcyEQHVC6+bPx6WvUiwmrFAuSx3egAqG4PfhioIZcQLLMpmh5Qcu09qMTyxKsnkfqAkfuaBP24r0xSF6RWb2zguAbPQWii/jHhjObTaebXeo42Es4Lt6EQXOaalKQWOw5/cUjAEcOsfb1VLSut0oAYbR+pIJzEF9P77fAyMi6x0Ch1XE1D+4roFPbjQPrO3MUfnhwDizXYaD+bD32pfVATDZPp9MvBkwij9zwd4fAQOWyE+w2DMWeZ6ZlHUd+bh0TKujB3bZspKWr2gMqWz60B7RtvdLuK8owOoTsHWDjJ9epEe2QizEEUJaovyNUuIuOPxCcdlcUr8REDgrkTOKEfkBVCbQZcTcap8FaI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5336.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(18002099003)(10067099003)(22082099003)(3023799007)(11063799006)(261009223027099003)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0RnRzRCU2x2Z1Z1WVhVcDc0V084dXREODdFT3c2YUtIdGNCSnlUZkhqVy85?=
 =?utf-8?B?N1ZXcGc1K2Y2RENJN3VIWTVMMjNhT0tuLy9tSEMyT1duRzZ2eXQ4NUdWcFhX?=
 =?utf-8?B?dVZ1dVhKdTJoNTdweDRTNGgxSi9xT0paMmx3cElSRUUrNGkyS0dxajlxc1pR?=
 =?utf-8?B?ak4xcUNseitCYmZnakdOZHB3eDJLclVuSEdVOGtFS2NqZjZTcURMM0svZXlX?=
 =?utf-8?B?cTVVcUo4bVBQNEZSUzJ0N1lEQXhzczAzZlNHMjdWWUp3eUxGMmkvVjI2czdJ?=
 =?utf-8?B?emNiSlRCQ3dpcmRvbkw2dXJ0ZnpBczRQc25ZSnNiUnQwTUJDbFpWc2haVkd0?=
 =?utf-8?B?UjhmTnY4VFNwS1BITmRlQTlQRTA2Y1J0Z0EyYldtUEdta0wxNTJHY3ZtTloy?=
 =?utf-8?B?dVBld0tkdHdRY0NZbmFCQ1o0MnNMWlI1WG5TMDB2QU1Tb1VGUlpMcFNVNlE1?=
 =?utf-8?B?ZEFhRXllZWQ3S2JpTlJwVXp2M2ExcU5LVWJ2VHgxUjNnTG8xUjd1RnZBYTNM?=
 =?utf-8?B?d2FyWG5sbXJJTVpJUzhLdC9Sb3krOE1Sa0djeDgwN2c4Q0VNemRkZjNYTmky?=
 =?utf-8?B?MUR2VTJWWmlFaTF3SkpFTjZyNzdtVXIwUXpROGFlS3BoNEZNWjNremVsRzIr?=
 =?utf-8?B?bU8vZm9DRU91NlR5TnVLSldLRXBVUXA4cVQ5bHNweHNXK1pxeXRjM0R5ZUpm?=
 =?utf-8?B?T05KQ0luekhmV3Z2OE1ZeGExZys4WDI3MSsxcWprb1pkb1I2M1NwamQwZ3Mx?=
 =?utf-8?B?OG9vRXdETVBXYWY0aHBFZlNxM3J6RlAwSzhiUlZoTFV1TlRocndJbnVhVWN5?=
 =?utf-8?B?cS9Qb3ZuSUlSdVQyMnpBdXUwN0NjVC9wUytSK0FRaEJZNzRocE1EWEFxUEx3?=
 =?utf-8?B?N2ZGRlhxdkRqSXBSUzBMQnoxaFhRWEkyT3J2NmZJV2pTcU9NWXM1d1RvWm1I?=
 =?utf-8?B?MmM5b3B6VEdBRi9lUlRULzRjZkhpeHdnNWxyQjRvdVhtTmRDcy8yMTRTUHZ0?=
 =?utf-8?B?MU51NVBhWk16SGpJUmdRRi93MzcrbEdBenBnOVQ1R1R2aUxFYm5DMDd3U0Ri?=
 =?utf-8?B?ekwvcitsU0JRaDYzNlFoUUE3NXBwWmN4d0xYekI1SEFnVmZ0UHd1SXdtZjlW?=
 =?utf-8?B?cXgrd24wK3RjZWF2bG44cThjSnFESC9Mam44ajJvMFFaQ0pDQ21LWHZvNmIz?=
 =?utf-8?B?NkFOVGNGdDJOMGFsTGFHeGFtelZVdTF4amNXd1dtWjF6TXdBOHlVTUpkeVo5?=
 =?utf-8?B?VUhaQW8xRjh5VGdPTnV0ZVVlSElPTDNzZ1oxQXVtc2todFVjVmI2UHhOVE5E?=
 =?utf-8?B?ZG9pakpaNWxYaCt3eTVVdGEyeTJaUXNTdUdUN0xXZkJ1aTRBQU5XRjNvc2h3?=
 =?utf-8?B?azlEcXYyazYwQlBLZUVqSG55NlNOTERxY2lRN2R1Q1hrMmEzRlMwODgzakZq?=
 =?utf-8?B?ZklsSlR6T2JmZ203ZHJHVTNJenM0NGFhak9wQkVJc2ZWMDluOFBhdmc5RXlW?=
 =?utf-8?B?eUFvdTFtQS9nS0Q2cXdDVkppZk8vTGFJbkloZU9VTDRKMjhrNGJjZGc4ZzJq?=
 =?utf-8?B?N1JyK29HRkJTSVh0Y2QrYnZTb2RTbHJSb09ZNlZEUUN1OE84aXBBa09panFr?=
 =?utf-8?B?Zm93ZTZ4TnQ0KzF3VW1LdUNMWVozYTk5dmFaQmpRbmtVWTB5UHNuYzVZMmR6?=
 =?utf-8?B?bmllRm14VWYwTDVXTjVDcXFMcGtTbloxbFJ1dHkreUlsUXczbUQzdEk3K1FI?=
 =?utf-8?B?TUU5L1FOMG5FQ240ZVFEa3dNOWJNMTlxVVhLSmtmVVFYL2FNRkIyTlRtVTVV?=
 =?utf-8?B?OGZxWHFEMWlJdGg1NENwVlNiZWM5SlBDdXgxa0RmN2tyTjVDc0ptdGkveldQ?=
 =?utf-8?B?MFIwRnI4N3pJUkRZZEk0YmhOZnVnMVllQk5KUUJnV1k4b0tQQTlqV3BFVW5x?=
 =?utf-8?B?K2JxT1RjQ2ZoTVFtM1UvZmpORGRSeVY2RmFkUUNySVZOdTVPeWRQNzEwSXYv?=
 =?utf-8?B?VHhZM3Zqc2lVSVdSUUtyZEFxVG5YNmhPQnpCWDFIczUxMGpNakR1RE5sSFhI?=
 =?utf-8?B?b0g4YVROMVZqeDl3cG1lUEwxbHE1RVlyVitxeGZUR2xRUGNMZnRUcFE2b1ZG?=
 =?utf-8?B?N1dhTUhvSXltamdQSmU3N0VHb3c5ZFZ2d1UybDhFWnZvem4wQzR2ZGUrbkVV?=
 =?utf-8?B?emxaZjRqMUYyaDQ1MldxVmd0aFNBbkRCVmt0cGdSREd4TThBZk5IaTZxVnho?=
 =?utf-8?B?R3pUTDZQTFN0TjNlOUJSQ240V2w3RmpMeUNhc3RRWTQwMkdORVJ5SW0xTWxQ?=
 =?utf-8?B?OG1mSVRoQVRFT0RCaTFhQjhSVGJYdGlWNE9ML0dIVXg4QzNDb1EybEtHODBr?=
 =?utf-8?Q?NqVfRPtiLLBBhRFM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A21E9DEAA21B224BB9B006599B557093@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l+X5clXo9htVws+w2lMuHj9mQcO6irn1ZY/xkRS6fQFZBfS2Vtf6fOl9X9i9SxAO+rtN5CppDsFXFEEqAWlj8Ci9WaeK8Dfp3uaVSEcHwj6FVbdDHN7Qd9N7x7y12n0dDZnIFMVFi51nxskwAyA0j92r1ym8UC+j9wOopDCQHX2fu8VPM3uR/YQmq3QRQs+xHDwMveP3yBOuClF9AziaN9sQEfRPmY/JJ0gOqLjrdv0EX3/kf2VGSMr7Jpia+1zDS0S2pW8h5GH9/8LjD0Oq4o0g/xM9bDBmcQHYyAaKMm+PptJ0hFrkGQCuWsperoYjr8CqjCYAXvkVs5Hg6pQDbQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5336.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a36fc4c-53d9-419c-7c1d-08df2bc13af2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 20:08:22.5889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUsN0s05mBmUpu0DafVIwmqhMGqrgp/19kBPrpJqs+OV7/FTZYplwpqmbtvh8QRpqi152/9y8gcI2eDnVW/cy5zCDKEdFXdqXrrL8kMHB7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDAzOjA2IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBQbGF0Zm9ybSBFbnZpcm9ubWVu
dCBDb250cm9sIEludGVyZmFjZQ0KPiAoUEVDSSkgY29udHJvbGxlciBmb3VuZCBvbiBTdGFyRml2
ZSBKSEIxMDAgU29DLg0KPiANCj4gQ28tZGV2ZWxvcGVkLWJ5OiBNYXNvbiBIdW8gPG1hc29uLmh1
b0BzdGFyZml2ZXRlY2guY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXNvbiBIdW8gPG1hc29uLmh1
b0BzdGFyZml2ZXRlY2guY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxj
aGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+IFJldmlld2VkLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KDQpSZXZpZXdlZC1ieTogSXdvbmEg
V2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KDQpUaGFua3MNCi1Jd29uYQ0K
DQo+IC0tLQ0KPiDCoC4uLi9iaW5kaW5ncy9wZWNpL3N0YXJmaXZlLGpoYjEwMC1wZWNpLnlhbWzC
oMKgIHwgNTcgKysrKysrKysrKysrKysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNl
cnRpb25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wZWNpL3N0YXJmaXZlLGpoYjEwMC0NCj4gcGVjaS55YW1sDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlY2kvc3RhcmZpdmUs
amhiMTAwLXBlY2kueWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
ZWNpL3N0YXJmaXZlLGpoYjEwMC1wZWNpLnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXggMDAwMDAwMDAwMDAwLi43NjFlYjlhYTRhZGYNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVjaS9zdGFyZml2ZSxqaGIxMDAt
cGVjaS55YW1sDQo+IEBAIC0wLDAgKzEsNTcgQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiArJVlBTUwgMS4yDQo+ICstLS0N
Cj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGVjaS9zdGFyZml2ZSxqaGIx
MDAtcGVjaS55YW1sIw0KPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjDQo+ICsNCj4gK3RpdGxlOiBTdGFyRml2ZSBKSEIxMDAgUEVDSSBDb250
cm9sbGVyDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArwqAgLSBDaGFuZ2h1YW5nIExpYW5nIDxj
aGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ICvCoCAtIE1hc29uIEh1byA8bWFz
b24uaHVvQHN0YXJmaXZldGVjaC5jb20+DQo+ICsNCj4gK2FsbE9mOg0KPiArwqAgLSAkcmVmOiBw
ZWNpLWNvbnRyb2xsZXIueWFtbCMNCj4gKw0KPiArcHJvcGVydGllczoNCj4gK8KgIGNvbXBhdGli
bGU6DQo+ICvCoMKgwqAgZW51bToNCj4gK8KgwqDCoMKgwqAgLSBzdGFyZml2ZSxqaGIxMDAtcGVj
aQ0KPiArDQo+ICvCoCByZWc6DQo+ICvCoMKgwqAgbWF4SXRlbXM6IDENCj4gKw0KPiArwqAgaW50
ZXJydXB0czoNCj4gK8KgwqDCoCBtYXhJdGVtczogMQ0KPiArDQo+ICvCoCBjbG9ja3M6DQo+ICvC
oMKgwqAgbWF4SXRlbXM6IDENCj4gKw0KPiArwqAgcmVzZXRzOg0KPiArwqDCoMKgIG1heEl0ZW1z
OiAxDQo+ICsNCj4gK8KgIGNtZC10aW1lb3V0LW1zOg0KPiArwqDCoMKgIG1pbmltdW06IDENCj4g
K8KgwqDCoCBtYXhpbXVtOiAxMDAwDQo+ICvCoMKgwqAgZGVmYXVsdDogMTAwMA0KPiArDQo+ICty
ZXF1aXJlZDoNCj4gK8KgIC0gY29tcGF0aWJsZQ0KPiArwqAgLSByZWcNCj4gK8KgIC0gaW50ZXJy
dXB0cw0KPiArwqAgLSBjbG9ja3MNCj4gK8KgIC0gcmVzZXRzDQo+ICsNCj4gK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtleGFtcGxlczoNCj4gK8KgIC0gfA0KPiArwqDCoMKg
IHBlY2ktY29udHJvbGxlckAxMWM2MDAwMCB7DQo+ICvCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAi
c3RhcmZpdmUsamhiMTAwLXBlY2kiOw0KPiArwqDCoMKgwqDCoCByZWcgPSA8MHgxMWM2MDAwMCAw
eDQwMD47DQo+ICvCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8MjIyPjsNCj4gK8KgwqDCoMKgwqAg
Y2xvY2tzID0gPCZwZXIzY3JnIDM0PjsNCj4gK8KgwqDCoMKgwqAgcmVzZXRzID0gPCZwZXIzY3Jn
IDM+Ow0KPiArwqDCoMKgwqDCoCBjbWQtdGltZW91dC1tcyA9IDwxMDAwPjsNCj4gK8KgwqDCoCB9
Ow0KPiArLi4uDQo=
