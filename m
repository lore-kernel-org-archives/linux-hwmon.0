Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8108529994B;
	Mon,  1 Jun 2026 17:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333433; cv=fail; b=HmJhT61amHzWLTliwuRW8nVr3e8jzU0QRxltEMImFwDr+CjEnnR3/BQ6u/NkvxGSv4pzMK0q2YlJu/Luc/jrQ0LMhFWZS6CWFZUBHScOrBGN437oyrgeg7LEqAgs0bjI+Vo4B4Jf8pT1Np1OUDBT7E1JpJqYgbdjavgHeUGboUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333433; c=relaxed/simple;
	bh=Rf2nIl6xCjRI28a5z5OLY6eDVrmzA40rf6XQdETvxLc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DfX8zAMjL9uZTDZnGaBg4pGRpMEc4As8HUDoyhwZzTJXicUyRl6wzNJvH1zW/CNxz4TNC/JW2isM6owH2zkh/+OvRaeCFpe+yQBq2kguy6cAOCo+PPeRfoGx2BoplUWkBxAlJNTl2rXkEFJxCTsIIBOmbLcmVlDJ63g5ZzH1eg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=kNLXcwAy; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="kNLXcwAy"
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Ew4sc1893243;
	Mon, 1 Jun 2026 17:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pps0720; bh=Rf2nIl6xCjRI28a5z5OLY6eDVrmzA40rf6XQdETvxLc=; b=kNLX
	cwAy7X0hiZYRD66YPf+2WTHX4GJ0zbZNCCVYQtKC+HHJpHhQ/sTK5/mwokYpe/pa
	C9w9j0DqPnLPxnd9lQU4ecvE6rtN0NJMLRSWo/lzhEgDuShPmB7x7lKXBPu0Hd7L
	8cOTvhiMHBx477ZV3WtcJE3A6DcXhY4N38CWerhvpLaXVZf5nE98E+LNgHT9pGJX
	fOjtvGjvsmbZIY6zs2rhOZ3plusiKuNONz4d19wnqUDdPz78BVaqsal2ibJyQ1cT
	E1OXN6dAt9uwabxE7bzd7GW+dWWwaL+sVK9MPdmxGlLtcPJJpaIq4xE5es/byR2w
	ZNbC63QrD347Eihk8A==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eh76mnuk3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 17:03:17 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 880F01317F;
	Mon,  1 Jun 2026 17:03:16 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Jun 2026 05:03:09 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Jun 2026 05:03:09 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Jun
 2026 05:03:09 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6jGsXzqKyvNKfcR7ux3hIO7CY6i36wU/Y8FfuID6nw3GU65wpRpZ+8gX9du7XsnpjHylH7cewHfgfaAnZZkP9hf73Ezt+9HJawk1Jw717y/zZ4lNjd47ZGFyLR9fkxoQCCUPxQVCIW1zpTqfpkJG47XtlMCUieB3XpeAdRjqqJQ6HvP2VC9qWcKngY8dNIKV70SU7AcJanki/hzlkJQ1fdWvu6tuC+3VJbgedHWr92uh9gKDtBs18cr0cMjmiVeiZgx9HJlguLHoRRf8WDb4ASzLkuJ3F+8hQDR+tdzUu/8wlKV//5fcWdXy2GDDnB8J39pFkqgFcvikIT8WlFXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf2nIl6xCjRI28a5z5OLY6eDVrmzA40rf6XQdETvxLc=;
 b=X151WnzKb45+B+7eqf/Ey+qR3y7q/pxXHZvdcIxcObOPqUB528bAvgVJxMqNlZMub2ZsiHWQLX2xiIDWkS/rujF1SfZrriLe2jzCAJSWJ87iWAViRuEUbtji93EJuSnTEPv05tL+1APOhVj9cK9NKQkgMEzWRjzJH+gtpYhtpcmjsAhWchgQcDueZrtfM3GB5HeIEH2lZnVqM9A/Uf0jDgJSVwl+JWvvCeZINw3USmK8fjWM0RPWpqk1cTGywFk1GWzeOi3N0EIzIxr1Et9js1M1iUk5hxoT3+pYisBZO3xJiRjd+KmCfG2v+f6t8Jn+OUhyPYRYqzEr+B6LKHz9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by PH0PR84MB2219.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:165::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.6; Mon, 1 Jun 2026
 17:03:06 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 17:03:06 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "noname.nuno@gmail.com" <noname.nuno@gmail.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Topic: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc7wDM7+FlL4i+8UaJulySqZHrIrYkvc4AgAB6/gCABDnrAIAAgEMA
Date: Mon, 1 Jun 2026 17:03:06 +0000
Message-ID: <20260601170256.912611-1-sanman.pradhan@hpe.com>
References: <20260529001903.625737-1-sanman.pradhan@hpe.com>
 <20260529001903.625737-3-sanman.pradhan@hpe.com> <ahlcnlJJnLfmCZNH@nsa>
 <20260529165132.678448-1-sanman.pradhan@hpe.com> <ah1OwT0s21LTSsZI@nsa>
In-Reply-To: <ah1OwT0s21LTSsZI@nsa>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|PH0PR84MB2219:EE_
x-ms-office365-filtering-correlation-id: 63b17580-45ac-4cc6-58d5-08debfffa659
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: tAf5r01luNj0rgKXKL4wSRSlReyPfzKh/J9xv5kSCkOPzvcPUY/YJEAy2uGDVf4arpwjbDHFNisLIDiWkcYjXRNs/njYumzmH9pgduSFJ0QCQ0lSb9ChWe9blkXzPXT0O5N0zDgUuRrDPmAVcib/s+gByqs/sPl97VkwmDwGCTaCfFn3ZczkTfKWAeTFBSaaB4ZQhwSCic4EBs5iBLTqxM9SqzzvJ6DMsSAJo47wxZibokSSEvLuJcEzJRtzvO/DIXVLd3ndbZ0UNwDKNkSSb2vYDt3T5BQVGnNmb5TTlbcx/pAzFRvkvDjKI5el1mglCwieiyiw5Vxblbl9hwyXIk0hdVnFK10I1hSit1KjFVllC/tsV1xLyGBrEf0toiCfg545lWQUcmAsi2Uvf2fL+96sAhhHeAIZglhXxpK7OYRxJnE9MSNTg3OkIvKlYOewTEGnCq2uPh4RSCxCHoBpv0fYROo1nK0eP9QRn3SDW2qJUIh+EjkL4RkzyOFpsGu83YQdrZruILpTMIGb6icTvknlEisrMt+gyZXvav7UW+lYE1cJms12lT+38i8UUmL6Fgw2pfrQ8jNn0ufz4BoksnRV21TuRwsht6Yz4rlCMURGRYy7emOBly7YfPHAN+o3OgNtGuOQFRdrKPNgtacrUBK3QDPwzeKMFmMrnVj3C7cAsdGwUKeZcd7kN/2pFOd75c2gtrE00LH5KdQU5DZjxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0JSb010ZENKY1ZvdTUrcUhMdEtKTjkvbzVVeVlXTHg3ZUliSlF5Z1E5cmdo?=
 =?utf-8?B?bTdNNXRJVmlaNzhkaERlSDRON1dTUFVMVGkzbWZNbUppdVVSMldEQ2I2MzNC?=
 =?utf-8?B?NUNPanB5b2QyMGh2R051T1c3RVd3NjcwY1FMaWh4YmozVnlWaER6ek9IZG84?=
 =?utf-8?B?L3V2d0hucTZFd3NIbHlxWFlUK0syZ1NubVVlZU5xaTk0OWdMY2NIMFlOODl6?=
 =?utf-8?B?SHpaQ1pLRXU5bWNGaVVMZG1naTIrTnl1L1AxMnNac29BSUtmNVVZeTVGR1A3?=
 =?utf-8?B?TllocDl0SWtFVDNrU3NuY05qMzlvRWVOcndGaXZLVWIxTXBNN2FJNk9zVmNo?=
 =?utf-8?B?azRKbjdJNlNhcUhVRTBEVlZHOExwaFlPMHFFV21aV0RqQmorclE4Yk8yUHdx?=
 =?utf-8?B?cm5pTjVsa0pmTVpUaGwwQldjZHNVRENtMHRkM1VmOWVhT0U3UDUydVdJZ3J1?=
 =?utf-8?B?Z3ZLeVowZjZhSG1qdFo3M2lyMjJra2VxTTZmN1UrRGxveHpENVp1dXhZMEhu?=
 =?utf-8?B?UjZjMGZSYVhhWVUvUUFJamV5T0p2cXZtN09mdWM1Si80NHhMOXNEa0tOeWhG?=
 =?utf-8?B?WWRYcTliL2xlNi8xUm02cy9HZzJ2cEJnZngwNmE4bGpDeUd6Zlp3VVFDRG1m?=
 =?utf-8?B?Wnp0dHlxa2N2RHRxNWRiOWVqeEZUeG1CczlwaS9RMG1wQ3NNTnVRUFBJc21Y?=
 =?utf-8?B?MndqTmd0OUp0VTQxZm9tM1pHY3gzVkhBRjczV2p0bVloSmpJUzQ1OEJoL0NP?=
 =?utf-8?B?UjA1aEtuVysyeXRIbDV1ajBrci8yODZ5a0p5SkI2WHo0ZW9uTkJpdE9aYVhp?=
 =?utf-8?B?SmVvREw2WU01b1pyRGJOa3BMSDJ2LzZPWHh3eE8rTXVUSVAwSHJhdE1FU3pZ?=
 =?utf-8?B?ZGJYbUgveU5FUzNaSWlQckEwaDdkbWYyR0tKZXhYVDh2dGVNdHA0UXNHUFB1?=
 =?utf-8?B?c1lHdGpiNXlacTdWaU84ODVqaTVJWFEwU2FKY1RhRityWVgwMFR4QkFZemJG?=
 =?utf-8?B?d0wyN2ZabXIzYWcxRTMyWVV1VXZmNVdKQTE1K1lFNjVQVDl3OHBIcm9weHo2?=
 =?utf-8?B?UDZZYzYvYmxTOElXRlNJaGdPWlg0dlhQdG9veDFPeDljdmlqRlRoa0RFMjVm?=
 =?utf-8?B?cGo2ZjJRb1lmSzRHQk1kV01TN2pVdHh2M3pqOEtoVDhweitMU0R5bE04WDRC?=
 =?utf-8?B?eTM5VFl2YXd5akYxTHJpQzhkUTB1aUx2YU1PZ3RuaFNxYXYzaW9ybGp6QWRn?=
 =?utf-8?B?YXhDS0M4MWFsMTcxQ0N0ZmlXdGUzZDkzVk55aDRUYW9tT3I2b0x5MEwvbXZh?=
 =?utf-8?B?T0Y5OHpSZTcwTjFDZy9LTm1aUWhRVGc0VlhMQVlMYlhpWjl4VkpCc201RS9B?=
 =?utf-8?B?REFNNzdpSFV2QkpERGpDVldpVW5kVFBMdWZiTTl5bXVBQVBNdGNaWHFaRHdj?=
 =?utf-8?B?TkdMRWs1bUZCQzA0aHhVd1c3UjRYem5vMzR3elU2MEFpcmRrZVdXZ1dzaTZ2?=
 =?utf-8?B?UFJ1M3FZY0JEODluR29tOEVRaFNsdXF2N3ZuaDErVU1ZS2YzdFJoYmt3djhs?=
 =?utf-8?B?V2dsaDBMZFI2YzFTbWZ4OGpsa1JTZ3lVRDZsdnJiM0RPYlRUclJSZm9FLzVB?=
 =?utf-8?B?L2dIRHZic1YxQWtSbzhNSGlPckx5b1ZVblVUY2hydVVML1A5R2xqUUtxWFNm?=
 =?utf-8?B?bWorL2w4WWVEOWtDeFZOaDZVTVlrV3lGbWNQbWcxR3pnUm5DdEh2VjYxMnFO?=
 =?utf-8?B?cFNRN3FYSmw4cEpGdDNyRGhMMUhZWXdWcE9ZeHJEYkdGa0liVjdaeUJ5aS9t?=
 =?utf-8?B?d1l3RGVhbXRwbkswSnkyR3VZazlZTkgzNGQzTnNyN25RZStOdW9NRjlNR1Fp?=
 =?utf-8?B?L0N0cGJtTGhPSWRhSHp1a2dBdzlDUG0yMzlIc2ZTeHpHZU5NL2FwbEJCdFI2?=
 =?utf-8?B?Z213c0g0VEdyeTlQbnEwMFJrdUw3NlZLdDM2VDZmbWM4SWVZTm8xdFpUVDJz?=
 =?utf-8?B?VGExcnZGSHJxL0JFU25iSFA3WUk0Y2lyc0lINkNLTWtCeU4vZ0lQcFNVY1Bl?=
 =?utf-8?B?SlVDdndPbUVqV2JlM1lmdXlkRkpnUzBDOHpuK284VElKbGV3M3ZlOE1FcDd3?=
 =?utf-8?B?aVNaQlpyZ29zL0hXdEtHSmorTVBVc1hrNjJaU3N4WTZUMWZBSlJ2KzNRQk1l?=
 =?utf-8?B?QTI0RE9TWTBxTnFJTWdzcEJNS3M4UFFUWEplK0daeEJybjdjNmRPUXh5alNT?=
 =?utf-8?B?RzJBSDNYU2JmU0ltSzVGdmdTN24vRmNweFlOZTF5MmRHQ2JJMTY0SUJCVVND?=
 =?utf-8?B?R2p0dWNzZWM1K1pjUVk3NGhvYTRORTk1bXlIRk5GQVJONWNBaFMwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4EE16CF794FB541AB8B93C763C24166@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cII09XJuYNMunx2afeV4Y72nM96U1nNI3gokOr7ML/wh+Y26uk0gIss2uXTsNACY2SeFPN+PXRNSeMLcLpkSYuO1k1c7pBVeLFdTvCa/KsO/ng3oyDguaPru1jY67JE6axyKk8D+8e7c3/mSEihDjddWzfqisaQwn4Un9z3YvbSuiptYRjDXbLa2bkdxwdotszKe0kv7Zbe+J2P3ZKMdzpTRmbULnOa/zZbuk78MnCJFRPEWTAh5wHU0xf5OWtZmBZEEZeIFumWuAxeG1xlLlW+bkV96Z3RggrkigqZymElpcE7s/C5XHi2rcwE3wulTEVJw2HMX9fc6yRnSVCQgCA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b17580-45ac-4cc6-58d5-08debfffa659
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 17:03:06.1184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dG5HOT6qchXJlub/TPUkl4yD7C7Zegq74M4VYOITH87+RSc4m8Iid3fEHNx6mhWApj8mclQ3J4wfRl6/dCPLLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB2219
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=FbgHAp+6 c=1 sm=1 tr=0 ts=6a1dbb55 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ay80y3fxfMS_JZZz1qJy:22
 a=P-IC7800AAAA:8 a=OUXY8nFuAAAA:8 a=-Xf4xuiEcWLmfucz6qgA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OSBTYWx0ZWRfX9ZcOTipfkLl6
 Gfo8Kkgz67afUnr6dA3lNGX9rJFJSYFqv524r5DMuQohrMiFEZ8Y75BF0G5ZkGZXBdSsYFPXo1U
 gHcV0gjHzwsLeROjXLVmx2Mf49LTpdEOZuWeSo/tHVcRszqnbqvonn6fGdxZNyNcyNhyI/tLbqa
 6tfK/ZfvQvE6kW8es48f7GfU0gzYm6rXAytya2rYhMgYbyotYXIrq/wB1BZaqB3H1wPEdhcpZ5h
 KHPCx4e4oWgHxLRgeHOmqGT/NEfC+Zbz8dDmhiLUCd3nKKgA77pBAWXO9L+xtbkEoW/zdq78J4G
 KJBTXcpT0Oo60yHi3icLNufqlBNkMroRN/xRaNn/MnoJ2/0573jgWBQFuWa79tVCN1y4A7g7CBQ
 bUc/ub2ePXlhE2TcJ756/zlm9h9jHzmWTRcnt2FD/+/oEjFQ7NoZuRASmslRLw/MiquzsfMiDRC
 acIdbrQnR1/OYKlOJVw==
X-Proofpoint-GUID: lwRhkozlz6YPTOThxbwd1FuzVPmZvT0G
X-Proofpoint-ORIG-GUID: lwRhkozlz6YPTOThxbwd1FuzVPmZvT0G
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010169

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpPbiBNb24sIEp1biAw
MSwgMjAyNiBhdCAxMDoyMzo1MiArMDEwMCwgTnVubyBTw6Egd3JvdGU6Cj4gT24gRnJpLCBNYXkg
MjksIDIwMjYgYXQgMDQ6NTE6NDBQTSArMDAwMCwgUHJhZGhhbiwgU2FubWFuIHdyb3RlOgo+ID4g
RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+Cj4gPgo+ID4gT24gRnJp
LCBNYXkgMjksIDIwMjYgYXQgMTA6MzE6MjAgKzAxMDAsIE51bm8gU8OhIHdyb3RlOgo+ID4gPiA+
ICtzdGF0aWMgc3RydWN0IHBtYnVzX2RyaXZlcl9pbmZvIG1heDIwODYwYV9pbmZvID0gewo+ID4g
PiA+ICsJLnBhZ2VzID0gMSwKPiA+ID4gPiArCS5mb3JtYXRbUFNDX1ZPTFRBR0VfSU5dID0gbGlu
ZWFyLAo+ID4gPiA+ICsJLmZvcm1hdFtQU0NfVk9MVEFHRV9PVVRdID0gbGluZWFyLAo+ID4gPiA+
ICsJLmZvcm1hdFtQU0NfQ1VSUkVOVF9PVVRdID0gbGluZWFyLAo+ID4gPiA+ICsJLmZvcm1hdFtQ
U0NfVEVNUEVSQVRVUkVdID0gbGluZWFyLAo+ID4gPiA+ICsJLmZ1bmNbMF0gPSBQTUJVU19IQVZF
X1ZJTiB8IFBNQlVTX0hBVkVfVk9VVCB8Cj4gPiA+ID4gKwkJUE1CVVNfSEFWRV9TVEFUVVNfVk9V
VCB8Cj4gPiA+ID4gKwkJUE1CVVNfSEFWRV9JT1VUIHwgUE1CVVNfSEFWRV9TVEFUVVNfSU9VVCB8
Cj4gPiA+ID4gKwkJUE1CVVNfSEFWRV9URU1QIHwgUE1CVVNfSEFWRV9URU1QMiB8Cj4gPiA+ID4g
KwkJUE1CVVNfSEFWRV9TVEFUVVNfVEVNUCB8IFBNQlVTX0hBVkVfU1RBVFVTX0lOUFVULAo+ID4g
PiA+ICt9Owo+ID4gPgo+ID4gPiBBbnkgcmVhc29uIG5vdCB0byBhZGQgcmVndWxhdG9yIHN1cHBv
cnQ/IEdpdmVuIHRoYXQgdGhlIGRldmljZSBzZWVtcyB0bwo+ID4gPiBiZSBhIHJlZ3VsYXRvci4u
Lgo+ID4KPiA+IElmIHlvdSdkIHByZWZlciByZWd1bGF0b3Igc3VwcG9ydCBpbmNsdWRlZCBmcm9t
IHRoZSBzdGFydCwKPiA+IGhhcHB5IHRvIGFkZCBpdCBpbiBhIHY0Lgo+Cj4gWW91IHNob3VsZCBi
ZSBhYmxlIHRvIGVhc2lseSBzdXBwb3J0IHJlZ3VsYXRvcnMgdGhyb3VnaCBwbWJ1cy4gSSBtZWFu
dAo+IHNvbWV0aGluZyBsaWtlOgo+Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djcuMC4xMC9zb3VyY2UvZHJpdmVycy9od21vbi9wbWJ1cy9tcDI5NzUuYyNMOTg2Cj4KPiAtIE51
bm8gU8OhCgpUaGFua3MsIHRoYXQgbWFrZXMgc2Vuc2UuIFdpbGwgYWRkIGluIHY0LgoKVGhhbmsg
eW91LgoKUmVnYXJkcywKU2FubWFuIFByYWRoYW4K
