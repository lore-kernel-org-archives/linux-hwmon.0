Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90865331217;
	Thu, 18 Dec 2025 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766051842; cv=fail; b=gEz97HenmFd4L+iNe1FFqD01WXHLvjbvommEOkU0Byj/79aeaCXr1dM+lTGQQSQ5mMGZJfIZXqR9ms7Rth2xAw4pQ7VgroSCY/0zFPmO01oaKXTOvXLw7Q/8h6U0AqEfLMKZuzoSjuIwiRU8uODtY+x9fPhMIbw76jWi177PAUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766051842; c=relaxed/simple;
	bh=SMCMNHPHoPDHeRCwJV8UL7HaX3rwisPMf71m/qjBhe8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iY3KzJuVdtKfuXQiI5CXX7qq1WCorBm9DpjodB8XhwaBos9oYs3+BHU62eq4f+Ob0mG7ViS8ehV1DOJhc8/3pprhM71ovv7ZkpDsgyEvUar5KzU96EVRTRhGotaD6DbSoHplmN+6PZfkJS0KiAKO/kExmtNvqqfOqEv7sgxbg40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=H6GJ3A7G; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="H6GJ3A7G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwaR/qN0UM8IuCyjXTNp6P7AFkDKlG20mRu9qYBH7rMa8VP9s93gvXGqjebe8RPTl8kExYzy60fzWAywDwrFuOb4Xq0Yz1h5E6tP7eEq2AM22UK+kLqcUvXXWF+sLVZ4m5P6kzzOzaLKjnUl/NTC14aGbCoyvZw9IyoPxpYpgMNJW7TGw/G/B2ceAoKihi0FZaiSbt/2hL6iPgcq9zeTH0txGVrDwXHO7Zh75S460+rX0dJ7wkb0I910v3PQ+GUAgyCdTzQe8zTsqZdIcmKPqmeHPuD44+9SsmpaofQ9p0FukuPs32o0D9aI4u53KvzbnSFa/CgzYENN9tSyWRgr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMCMNHPHoPDHeRCwJV8UL7HaX3rwisPMf71m/qjBhe8=;
 b=GjJDwwqJXxEEfTcqN+6Iym8M1rWpFwN9bPVQma3jQIBjUQ0NOJMd8ln+tOk0zZ5mRSfYR89Aoh0TjPZiubQO9KwXKosE44+NYgRfvUltDL2mVrhDmhKGVgmjUFzo+tD2dFiwkVHInuGO+uw+ePhgRiJ/setvHv7gxOeSaloXh7f5u0e8aZ9JfBa5NDRT+vmc2V9/dv9RegHfBIEcDmk8cooldcikg8bYsAs8jZhnMcS/nnj3lDJfw9EMGNBeaLbBqQc+IAXGnllgq4AaQGJy7gbywvJk7n96JCFuU2H1QxoFRm2s6nNALRJ2AYaUJk5ZfgtnsnOHhZridxUk9d3nng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMCMNHPHoPDHeRCwJV8UL7HaX3rwisPMf71m/qjBhe8=;
 b=H6GJ3A7Gzq7KqXQAsUkC4RH2dZX8wqy76nO8Y/8BUH5IczDocmSXINzWmC47jcHprzxxOqs+FsIaofyn9rzimIChTjMBVxTmlzvPsPFJmtYOkDoc9ADNGsoVTmSS74AF13GFTRG+9wR1BWNmaCuVjHax7sZcCn9PcjtNrvzqMPHkHsuLygxiJLFoprC5pm0XYGhRmcY1lFqpvr7yA+IE9Bkp76iNuFSULKg8teVKoZVe45w/femFgDrbTlM9w/fF+l6uHyQewbKZjiBJL5G4/olSc2b0jVghqBeqm4JZx3ZSCyBDX2mf+7lwnx37AOXe6dyB5kL6GP4u9rWZinLbCA==
Received: from BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 by LV4PR03MB8185.namprd03.prod.outlook.com (2603:10b6:408:2da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 09:57:18 +0000
Received: from BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656]) by BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 09:57:18 +0000
From: "Mohamad Jamian, Muhammad Amirul Asyraf"
	<muhammad.amirul.asyraf.mohamad.jamian@altera.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Mohamad Jamian, Muhammad Amirul
 Asyraf" <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
CC: Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Ang, Tien Sung" <tien.sung.ang@altera.com>,
	"Romli, Khairul Anuar" <khairul.anuar.romli@altera.com>
Subject: Re: [PATCH v1 2/5] dt-bindings: firmware: svc: add hwmon property
Thread-Topic: [PATCH v1 2/5] dt-bindings: firmware: svc: add hwmon property
Thread-Index: AQHcblgh7eFkDBBDdEm0Yw9+f8XCDbUnE2uAgAAZSAA=
Date: Thu, 18 Dec 2025 09:57:18 +0000
Message-ID: <721e3771-bcd5-4b38-a183-a5e6966d0b78@altera.com>
References:
 <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
 <20251216064926.15817-3-muhammadamirulasyraf.mohamadjamian@altera.com>
 <20251218-imported-satisfied-beetle-ace590@quoll>
In-Reply-To: <20251218-imported-satisfied-beetle-ace590@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BLAPR03MB5458:EE_|LV4PR03MB8185:EE_
x-ms-office365-filtering-correlation-id: 9ae0280d-a200-427a-0a00-08de3e1bd4c2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVJ4TzRlaWpkUVcxRmIwd3ZyaWpPTmtxbzF5UWxyYU0xeGxIOUwwSnFwUWJH?=
 =?utf-8?B?aW1tekNMNGdmK3JUV3UwWlZ5bnBJVkR0dXBGODlQYm4zeGUrN21DWDFYZmha?=
 =?utf-8?B?cEY2VytNY0FIeWkrUWVUaUF5Tk41ckJtckVobmRqbUhsMjlsc0M2V2liczhr?=
 =?utf-8?B?WENzcDN5TTYwWUpjU1dwdjUxVXAwVWp1UGdxQlovd2RwdXhnbTh0ZzRBT1dR?=
 =?utf-8?B?Q0tXMHcrcDJCVlZMU3VyYmF3eG4wb2ZrUVJnSUJjeFdnK0swQjF3dFd1SXA2?=
 =?utf-8?B?bXJvenJEVys2UWdUdVRDa0hramp2ZjI2bnlKeVdua2xXQnNkb3hTckdhcm9v?=
 =?utf-8?B?SjNFbCtweXExWkNtWlR0V3lJM2Q1SmRzelBhSUFBV2tKNDR4ZmxBd3c5cXhn?=
 =?utf-8?B?dGVpMWYwa1BuZDZ3dFlOQzI3UmhWL2pBdU9xb1VmMkk5WUlOeHM3YnYxbVF0?=
 =?utf-8?B?bjROdThobUVPZHVXYllTQVNLOVRDUE9MTTFLZFlNQlVsYkNndEIxTVN5aURM?=
 =?utf-8?B?MDRFL1JXRnc5U1Zta084UXZJUmZIYm1GaXZhbVdsWFBiWHAxNmpxRkVZbmdw?=
 =?utf-8?B?VHVjREpDYWZhTDdObDlvclVZVW1kQ00rU0pMUTkvYXZjc1hXREdnVDJsYzdI?=
 =?utf-8?B?ZnVXVDVxUDMyVXcvT1NZa2RPVzBKS3lNMWtqamJHaUdjenpYWUdEU2dRUUln?=
 =?utf-8?B?SVlxODRXZFRuV1lyK3E4U0ZHcVNUYUNTZ2ZSSEc1YmNDblBxMkR2cXlVOGRr?=
 =?utf-8?B?cHFhTEdzS0FjN0lyT2xjVE5LTC9uejl2bGo5K0lQWElyRnVMbE5VWUZwQmVa?=
 =?utf-8?B?dGt0YjIwb0FSSXdIVTkxcVQ5bHB1cGhMYWNjbE9uV2wyTXNreVlmdlhGS3BD?=
 =?utf-8?B?VEtsRVdkVG81OEdTNUhGZ1RhdWcvUUZSRkxLZ0Z2MkN2aEFyVkdFZVp6VFox?=
 =?utf-8?B?SlppeWRGUWV4aTUwUVhXR3BSZmRPdXZLRHVFcU5QYkZ5MDhibnc5NllaU09i?=
 =?utf-8?B?VDR4cHFoNElEdkFLcHhsQXlOdVA5dFYyc0EzRG9EUlVkRU1FRFdpK3RRdEY2?=
 =?utf-8?B?aStpdkZsV05VOTROakdENzhWTzJHVG81TXpvT0FzYVphY2FiaHp3eHorN2E1?=
 =?utf-8?B?MlEzbHBLbHU4a1kxekhnckY0VmxvOWY0b3Vza1A3Q1dBZGkvNXA5WlJacmd4?=
 =?utf-8?B?QlZCZGVUb1IrSHk5YjVLZXVpcWhkYWhpQWZTNnNNUS9xYS8wVWRpbVpodUJW?=
 =?utf-8?B?Qjd3Ymp1eTE2ZzRXaTlJWlBTWVl3aWQvME1sWWlKbzc0a2JuOVZXUHJNaVNN?=
 =?utf-8?B?QUFmUnhhbUtCOXBDbUhuUHVKdVR2MHRlWHBMZktHcThKNGVLV2JTb1QwaXpm?=
 =?utf-8?B?Y242WDE5ek9YbVo5bFdySjZtRXpnTEJ1bW4xWk1EWXJFaWVmendzajF1d0pI?=
 =?utf-8?B?aU1KdmdsNHNmbVhMSmRoTTNmWWZxMktwaTNiY0RsdkVXUjF3N2dXUFVrVzdG?=
 =?utf-8?B?Uks4dkNaUDh6VktxcnpYRzgvbVUvMW5NYng1ZU9USTdJQ2owc0o5VmhBTUJm?=
 =?utf-8?B?QUlRT0tML3FnbkU3bTlabVRPMHBhbW00U3RGOVQwVit0Z2Z1cXMxTFhSV1RQ?=
 =?utf-8?B?Y0c4ZWlST1hISFlKTXB1Zlh3RmQreTlySU1nWjJhRElvZFBnSnkvV3NQajdq?=
 =?utf-8?B?SFRTNFptSnZPa08rLzl6VTFJS3cwRi9iU2IwZnpkV1NibU9jNi80MTZZWEFK?=
 =?utf-8?B?eTdON2M5aGs2MWhyN0g3aGdseGNIYnkvS0Q5RDlVNkZvOGhpWjM2c09UWklZ?=
 =?utf-8?B?NEF4eGREREZoQkxVRTd0WEViL0VIS2diVElteFgyQkFGVFpPbVc4QVd4Vno5?=
 =?utf-8?B?Y3M2VU9KdWlkN25iM1NKZ0NGemdOT1ZVZ0YyVm1vYVhFaExKVnhjT1F5STJZ?=
 =?utf-8?B?SlNxOXdLNFZFL0VVaDNBcWYycTZiUUN3QnMzeFUxYkc5dmo1VEZ3NUYyNE4v?=
 =?utf-8?B?RXdRQnRsakZtNkpLZ1VMZ1hhZ292OWN3aTA1RUdGS1V3bkFid2NDRXBCVlNZ?=
 =?utf-8?Q?fVHGPA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5458.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlZyN1JOK2pSQit0RU0weENDV1VmZnFjL2Q0eFRkNllGMEprUW9rWUF0MS9a?=
 =?utf-8?B?TnR1emNMWVd5UkRIdkhaYVRkTm1Rekl0RVpxaVBUd0hZRkpYdHJ3THdqZk1U?=
 =?utf-8?B?Qmlnc2UrbkkxSmMrK2JtbHB3SzRCWGZzZHgzcDk2VmFMY0VnWkxOSGZWT1p0?=
 =?utf-8?B?SXkySnFmeVJYUU5IckJkT3lCWlcvU214SkU3S3hkVGZHaFRTWkpHemJ3amhJ?=
 =?utf-8?B?N1hUT25wZGdmU01Tek9HSFpQUHh6SFl6WXY5cjg0VWZnTnF1bzhhSGNicnVT?=
 =?utf-8?B?c2wzdzZjWlFSMExNWE9sdmtNdktwL29yc2pIZWd0MnVqc1JSS0JVeCtxWWtZ?=
 =?utf-8?B?ZDhEUFhZRG9CeFcrYkFUV2RzYy9TSW5MQXpDWURVWTZTZjAvZFJjd1llcE1s?=
 =?utf-8?B?RHphR2JGTVhySkk3aktCdmlJVkhvMDVCdGNUeVFqK0pqRXBWakx4RXk2YVRh?=
 =?utf-8?B?cnNib1BnRVg3dXduZkFBUWtFMlVYNDJjNVhMVjlKeVFoaHM4bmc1RklodHBL?=
 =?utf-8?B?U2xEY2xpZTJVVUJxa2dCZW5jV1ZmQld6alRRY2t4VTlRTXBaUDBDNk14K1Zp?=
 =?utf-8?B?bXNEOFUxSjVsQ3ZvSGRMVG1LQXhoN0VUK0pvMVVCQy9vV2pNMUJvcmtXM2tt?=
 =?utf-8?B?bUNFOENQaXJqMUw3U0pkR25oMzFBajN6YUpRMTZGN0dQdDN6aDAwaXJTV2ds?=
 =?utf-8?B?eEtnNlF0OVMveUZxcVRuZC9tcGl0VExlRzhmSGdFbHlPL0pQVnA1aWxVeU1E?=
 =?utf-8?B?NzZzSDRuYUc3YjZST2F6QXVqRWRDR3lHNWxJUmVNLzhzZXRYVWRPMmp3VkJH?=
 =?utf-8?B?MkwwSnBDcU03elNES0twMTBQNTkwamhiN08rZ3F4eXlGRm9MZDJIVFNxUGor?=
 =?utf-8?B?aUZmNGtYbUdyYTdsVFFDcHdoMDBiU2FHeWZRcFExU2tYMTM2RlFPbko0RzRq?=
 =?utf-8?B?bGk2dzlzSi9wMzExVDZLVVA4SlFJaGF2c3BuSlpmTHRRSnRObDdiWW8xZ2pU?=
 =?utf-8?B?TVVXWExQSXNDc09PQWFiQUNNdkt5UTJxVTdaVXZOaHpDWmtMbkVwWFZBOVpq?=
 =?utf-8?B?OXR3c0RiTlVVOWM3dmFuTU9pUVQvYVQ3bS9KZmhyNVk3cVJYSUpqcjgyN0xy?=
 =?utf-8?B?MVNXTTJ6ak5XQ1FqczByL24vdjBPMXFYM1h6ZWdVcStsWmdLdWU2SjVCaHk2?=
 =?utf-8?B?RldnR1VtSVFnZGlSNEtkUUY1MG9iVXFBTG0rcWtWK29GOE9aODFSUVpPcFdB?=
 =?utf-8?B?Y2ExdlhHTHpIaFZMWkl3U2g0UzZlb1puRTE5V29yTlN1ZDVWL0VWeFhEZTJC?=
 =?utf-8?B?TmRpVzMrMFBpMGRTN2NPY3cvK0M1ODl1OWZ4eGlNNThSZ3U3eEE2cVYvaHRL?=
 =?utf-8?B?Z1EwdU1oN0lIbnQzMUxPOERpMGRUQWtZeXpnbU1CODZ5Ni9BaU9PbjRseCtz?=
 =?utf-8?B?cGxZa2tsMHRLcFJpSU9hMHVVK1IrMUNJU3I0aFB0OVY4cWdpcWVjVXh1RSt1?=
 =?utf-8?B?b3l6RnV5MHM5M1dYMDcrRFV1T1NBMGVvY3ZLUG94WUs3TFFvUGpxZWJsNWtO?=
 =?utf-8?B?amhGSTluWDJLd1psaVBFZEI1UStCTUx0WVFIaFV4TytnYnBNenc1Ni9WOWJX?=
 =?utf-8?B?cjlmbjZZNG1QTEJiRTVEWDBCeUY3c0N3QnRwUGQzeTNFVU1ZaFNsdXdqSDA2?=
 =?utf-8?B?Sy95bW0wb3VGYVlWNjl2ZWVjQzFXTFlwQ3IrUERDVldNMDNGQ2FHeWhTRWxF?=
 =?utf-8?B?RUl4ODVtZUxJcko3eEludXRxTmlHeTZSRmtncExWZjZzaDdYWTlXZk1ib0hP?=
 =?utf-8?B?UVBsNjk1MDk5ZldwVzNoWmpDSXdRSVFXVkM4TkpkRDVqdTMzUWNEN3NBVUwx?=
 =?utf-8?B?Zm9PSDJyRWZnc0orRGkveWoyN2Y5eWJQRjI1U1BrTENmSk5STUV2YnJ0UUZr?=
 =?utf-8?B?VGpjMUg2Q0Mvd0I5UWs5TGhJYUNZK0NHQ1VaWWJ2VDg3Qmh0N0lUUWthQSsv?=
 =?utf-8?B?cjRqNmZUazIxVWtaTDBZNTU3RC8vaklpeUp3V083UGhVOHZWalVkY3NKdEE0?=
 =?utf-8?B?WlZUYWh3WENzRmt3Mi9OWUhhdmsvczlXdVgyM3VRYTQwNGlpd2FzdEpncUg4?=
 =?utf-8?B?U1ZqZ0xMWm5pRlJVN0VobXFhYnh3KzZuZkpBR0FnMXBGWG1XUkU0TS9yNzJa?=
 =?utf-8?B?dmoxaERWL3JJL0pXb0ZCVWtPdk1mbzRjOURjUUVmU1U2WEs5ZldHNlRnN2U3?=
 =?utf-8?B?cXlWMmY3eTVXRHlreUcrWnRLbTNtYkNsNHU1R0h3NHhzZmU0Qk1kRzdPUkJV?=
 =?utf-8?B?d25rL3RSNVZDYm1LN1ZMMHkvTzJoTnhIa09JM2FGYTRaS3pjSDE0VjhKajU0?=
 =?utf-8?Q?8nktC7ob9bq1+MjtM5JZtfSypx+MtakKYyfjYyAQrOXZS?=
x-ms-exchange-antispam-messagedata-1: EcIDlVdOphIpvQQRaOtNLq6NIeafV0M50ic=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AC2E579FF80CE4BB43A3C6C13D1EA4F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5458.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae0280d-a200-427a-0a00-08de3e1bd4c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 09:57:18.7173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PTHn6MCHAeQjLciZGLjopEJfNr4Gxw3cgMnD+Ne30vSTDJdoNydRxc1kN5cBiapI4KLyLb5ZNWyEZuSKN7duamx8ez9OkZzYepwgXiXUUa9mPfe/Smfc8F/QRf1Ri5Hy5hmSJOzdaiYzLxmc5dgEug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8185

T24gMTgvMTIvMjAyNSA0OjI2IHBtLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiBN
b24sIERlYyAxNSwgMjAyNSBhdCAxMDo0OToyM1BNIC0wODAwLCBtdWhhbW1hZGFtaXJ1bGFzeXJh
Zi5tb2hhbWFkamFtaWFuQGFsdGVyYS5jb20gd3JvdGU6DQo+PiBGcm9tOiBNdWhhbW1hZCBBbWly
dWwgQXN5cmFmIE1vaGFtYWQgSmFtaWFuIDxtdWhhbW1hZC5hbWlydWwuYXN5cmFmLm1vaGFtYWQu
amFtaWFuQGFsdGVyYS5jb20+DQo+Pg0KPj4gQWx0ZXJhIFNvQ0ZQR0Egc3VwcG9ydCBoYXJkd2Fy
ZSBtb25pdG9yIGZlYXR1cmUgdGhyb3VnaCBtYWlsYm94LiBIZW5jZSwNCj4+IGh3bW9uIHByb3Bl
cnR5IGhhcyB0byBiZSBhZGRlZCB0byB0aGUgRFQgdG8gZW5hYmxlIHRoZSBmZWF0dXJlIGJlc2lk
ZSB0aGUNCj4+IGh3bW9uIGJpbmRpbmdzIGFuZCBkcml2ZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogS2hhaXJ1bCBBbnVhciBSb21saSA8a2hhaXJ1bC5hbnVhci5yb21saUBhbHRlcmEuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogTXVoYW1tYWQgQW1pcnVsIEFzeXJhZiBNb2hhbWFkIEphbWlhbiA8
bXVoYW1tYWQuYW1pcnVsLmFzeXJhZi5tb2hhbWFkLmphbWlhbkBhbHRlcmEuY29tPg0KPj4gLS0t
DQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ludGVsLHN0cmF0aXgxMC1z
dmMueWFtbCAgICAgfCA0ICsrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZmlybXdhcmUvaW50ZWwsc3RyYXRpeDEwLXN2Yy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ludGVsLHN0cmF0aXgxMC1zdmMueWFtbA0KPj4gaW5kZXgg
YjQyY2ZhNzhiMjhiLi40NzY3OTA0YzdiNzYgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvaW50ZWwsc3RyYXRpeDEwLXN2Yy55YW1sDQo+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvaW50ZWws
c3RyYXRpeDEwLXN2Yy55YW1sDQo+PiBAQCAtNjIsNiArNjIsMTAgQEAgcHJvcGVydGllczoNCj4+
ICAgICAgICRyZWY6IC9zY2hlbWFzL2ZwZ2EvaW50ZWwsc3RyYXRpeDEwLXNvYy1mcGdhLW1nci55
YW1sDQo+PiAgICAgICBkZXNjcmlwdGlvbjogT3B0aW9uYWwgY2hpbGQgbm9kZSBmb3IgZnBnYSBt
YW5hZ2VyIHRvIHBlcmZvcm0gZmFicmljIGNvbmZpZ3VyYXRpb24uDQo+PiAgIA0KPj4gKyAgaHdt
b246DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL2h3bW9uL2FsdHIsc29jZnBnYS1od21vbi55YW1s
DQo+IA0KPiBUaGlzIGNhbm5vdCBiZSBhcHBsaWVkIGFsb25lIGFuZCB5b3UgZGlkIG5vdCBkZXNj
cmliZSBtZXJnaW5nDQo+IGRlcGVuZGVuY2llcyBhbnl3aGVyZS4NCj4gDQo+IFNxdWFzaCB0aGUg
cGF0Y2hlcyBvciBiZSBleHBsaWNpdCBob3cgdGhpcyBtdXN0IGJlIG1lcmdlZC4NCj4gDQo+IE90
aGVyIHBhdGNoZXMgZnJvbSBBbHRlcmEgaGF2ZSBleGFjdGx5IHRoZSBzYW1lIHByb2JsZW0sIHNv
IHlvdSBrZWVwDQo+IHJlcGVhdGluZyB0aGUgc2FtZS4NCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEtyenlzenRvZg0KPiANCldpbGwgc3F1YXNoIHRoaXMgd2l0aCBQQVRDSCAxLzUgZm9yIGFk
ZGluZyBkdC1iaW5kaW5nLg0K
