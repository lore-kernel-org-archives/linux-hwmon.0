Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2896724CEEA;
	Tue, 28 Jul 2026 05:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785215183; cv=fail; b=RZ6vFp6V79pcWvW9RzFIZw1fFlLRpcwFihXkaFKQUuim6mlDhw2lDdb2ryTMHYYCwfJyyJNXDCGmBz4e+5yLRFe+OaIWqtr5GS3HScrZ4QtkqnUJz/gMAnMhoL/HWGUhQbysyOBRzPxekoHh+u0RGdHZoXR5BBeQTGYyYjeYNpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785215183; c=relaxed/simple;
	bh=PlMo4hE+oTGziqH6b7Yzl9od6DyAH4E2IyXuuKMxu0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JVa+hxLLXYCcmzuyTFGawEdyA768nMuOFcF1V+9Sl67s6ViNJKAoVTBXChxBhu0xqssJs5Y/32Za7G+VS+VGbx3DyM8FSOJlla8lYBO0WxBcIaJ29kIf+5kJ/92Q+etVQ7VzLcHulTfMx03d9NdVw6PMK8Z+PL1ciILe+hzYsds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Y0raHupd; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Y0raHupd"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3aIjp188400;
	Tue, 28 Jul 2026 01:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=PlMo4
	hE+oTGziqH6b7Yzl9od6DyAH4E2IyXuuKMxu0s=; b=Y0raHupd4+j5cQZFxVBHw
	bt9kzb1/3Gau0YQImMt6iZeO1f/vm8NnK9zMT4As5WhtA2lQK9Bv8ehOkivp7loB
	l/OrWMhPjNjlGXzH8ZoSIVbkYcCA1T3caTnjY6NToDege7vnONP2okfaqjWfeqQ8
	aOhC1mBJc6OGEMA2k2O81f28Ip9/pQ1MIXnJ8tUXXaI3lmBOI9IAIicoYMaZmzf4
	dDWAalznuUoXzXQD1ErVqMIBfZAWlNU2Z2pOAoPD80Sio7mU6PzTC7iy4rO7pPrN
	1YDOGhgN7B0GGnaHA4jmSgmPq/gToB1qNfEvuzgyfoaM76koj/2eT+gTV/HWUJ1U
	w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fmpwa9u4n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 01:05:57 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR25db24ku9qFI11VWi5nMVHZ8PeiiByzLk8qEPl4fTbJjNzFfjA687RiyTK+4MZsuxBcE64ECDLpnlrAea7Oz/AkfBFXLuzTJxD3/ywCqy8ga5aO3RDTBISctHtZCDhEo1e1P4VF6U+h0OVtlNcPKkT4VogReDbQRC74js/4ayksR1hzq+SMMbkfLJK2zdeo7Ry+dCE+vpfASppUqpKX0dPdUvda/h11bZXDsHtoANgoXPu/poFADM7QFW+V8e8/NGH17UoI3Xa2LMNty8CAwwvHNaLocPxOFqJcPYs2h9+GrU4PQYfEy05BnwB1FLyURbLAO89yY274vSC8Bmf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlMo4hE+oTGziqH6b7Yzl9od6DyAH4E2IyXuuKMxu0s=;
 b=c5UVfDioRTCj5ujXBbXsNRFQScxyqqGtIqmEb3ngBmlbqsXwTAsqwYCRkMDpgype9AMsKaQx9PjNYi5esVcMH+WM088bPSncej/5GT7rY7tNyYf6hn4AvXfbNVRhq8iIeyxZ/p8VkFzTx85ocJL9qovDOn/q+YWefzEZGV9b3lC6Z7SFffpbks3ORGTPRAgz1OlhkvhetdgzU9pGnjUvTpVEN80nymVp+qs+RJZSHjBwFqYicUR6dY8rBWhqWLTNWDwt2ObuC053oeOLXwP1JRJ3He1rB6JwpYlhDsvN0ZPo7tGUbWbHNuwJoBk8OpJp6ARTvptD4j0ACHloVcMalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SA0PR03MB5419.namprd03.prod.outlook.com (2603:10b6:806:be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:05:54 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:05:54 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Thread-Topic: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Thread-Index: AQHdHkHk/3XB76thsE6nF0Lg9EJuILaCV3qAgAAFY1A=
Date: Tue, 28 Jul 2026 05:05:54 +0000
Message-ID:
 <PH0PR03MB6351D7369AB790714DF416BDF1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
 <336bd264-52ec-473a-b74f-5661f06286ed@roeck-us.net>
In-Reply-To: <336bd264-52ec-473a-b74f-5661f06286ed@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SA0PR03MB5419:EE_
x-ms-office365-filtering-correlation-id: 33488e98-3084-4356-1103-08deec65e701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|22082099003|10067099003|18002099003|56012099006|4143699003|11063799006|38070700021|3023799007;
x-microsoft-antispam-message-info:
 wHYxFO7du/RIoMIrVbQ7VB9T3dbJe0X4pseeb9kM49AmykxkROUKPKdzUo4Yl8HWmdsSAM9VFN9dydIbCnCKmHEwbmfMVKZLgV3UzcBE+wqi97zkRnzyxd6BtqazhnhiEPjgPIABEPaYjB5FFdBpZHTNuhjCDW6sXv+d8+lpnQDeNNtOkpPycxervVHmgFnll+lnOllzp81doBFK52Ddv6TS6R7E0PT0lAH8zMeo0RzELxSxGw+cYmCY1MijIf/sAz/fg60GAhWwSJ3Eu/tzsM5HYe9gm9Ctd8MDUrQ8sc9IzAdRle6JG6ABvAV61AD6PeUe1LbEbrip43lRnZvM3C/yDJ7lS/ZgNwkGk10Gkkk23XvJtRF9VtY9g7pnBQdLlFUq7SmaUX9vtNCMS50grdld0maXO7GyQJe7KuUvI/K9IJPe5haYc49WmT2XH9dt4ZETIRJqgIp5n/pnAfPlnOp/okxxeBWl+3DfhDN40hnU488y3ZOUpjlF1VjAARByxw771bUE3I9S7Dhz1oi6Cat5X0jutyTcqARy7hSWI8WD9zUn9AeYzkYKtF2AMoapk0pziVdUpR/yQlwtduW+ILdiIbMSwA1IFAKFIhVkeg98jKIOMM4eFihKspYqquWpzfW/639iIdLE1raUCn2jbK5xJ8qAf6ymvb7q13/icxuorFpf6g9QxFheCZL0V1eqoodSvlwpEDjpFzlIAmbBMK/AZg3u0W1hLdkpexFDYms=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(22082099003)(10067099003)(18002099003)(56012099006)(4143699003)(11063799006)(38070700021)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZW4zQzlUbmJaaWtxUytVOWFsekFCQWdOcjVOVXVnR0xHLzAvUnI2eGt2QnBt?=
 =?utf-8?B?blZtYjk3d2R2M090L0VTZlExT0R5Z1pUUlRlNEF6SEk1cjhiVk9TUENTcWFW?=
 =?utf-8?B?N2N5MytzTk1NQnd6Q2N1ZFA2Vy80WEFuMVEyOHRIdXdQUEJnSVVqUkVCQWhO?=
 =?utf-8?B?K3p5SDRGOFBsS0R4VGxGbGc3Ky92RGpaT0R4ZHgxRm0wVW5sSjNUV2ZmMjVz?=
 =?utf-8?B?dTVURjRFNWZlclVmR1NtWXEyVkkreGRUdGlTQ3l4ay85OWhOMnc3bURtMWxl?=
 =?utf-8?B?V1J4UDJvOUFJZy9iSUg0OHk0RWVoQ09EMTFOZ3BKbGtPanR3Uy9oUEcyZVRQ?=
 =?utf-8?B?Mnc1T0ZLdndOTHQ1Rm1icGNTZmdENzUzTDJsc28zZUYyKzhFU2o3Mnk4Ulkr?=
 =?utf-8?B?RW9mbUNEZ0pXdUhzOGJKa2Z0NGxWaHdKTFc5WVVSOXpQSnZNNHJVNjdlTXcw?=
 =?utf-8?B?Mjlia2diUTVVMThNQlJ4b0FWbFhMVzE5cDJlQmdTaDhnbDZMMmNINTVJcDlo?=
 =?utf-8?B?WDB5Nm1ybkFyY1VkallHUHdERGZtWFpFbHNjZVRITVZNaEVhaHczOWpjbkFM?=
 =?utf-8?B?ZWVJeEJYRWF2MXB6WWFFZ1lMY1B6MjNqUTZSd2N3QWRDc1VRTU9kUVJ0emlO?=
 =?utf-8?B?S2VGUnJyWEtZYi9HSjNvSnZXYkhuTXlNMEd6SFBiTG4rdnZ4NGJ6T3pTTG96?=
 =?utf-8?B?RGphdWdPVm1KTm9JOGk2VTAzemNVZjVsYkluRnJjaEtRbkxCNTFDMk9kUnU1?=
 =?utf-8?B?NWFsWmRPY1dOSXAxRnFYcWpyUWk1S3hEL29NNmtlOTZDem1NazFsb00xbDJx?=
 =?utf-8?B?dXFxOU13dkNkRUZwQUhXWC9abjZoeGhkTzZVVERVSzhEazJCVldBdlM5ZGd2?=
 =?utf-8?B?c0RvdDJRUjRLSVB5b05LcHM4bGlsUjd2cFo3VllBRDFTcnNDNFlzVXN6U29T?=
 =?utf-8?B?Z2hicGdKZWd6SnM5em1qcmlGeVlIT1pFSU1EMmhIckJaVVZkaFpiUHZ1KzUr?=
 =?utf-8?B?TWFmOFdzZzdFUFk2K0c2YlVrb0VVaFdoMkQxTkxQMEt2NXdyQUhaaUlOdzZj?=
 =?utf-8?B?OU9qcUV4YkVNQ2hDZHU5cHZHR3QrTlVJQTlWY3BNSXhQSGxwaGIxTENUWFdy?=
 =?utf-8?B?UExDbmJuSHRWV0YyWHBTQ05UR2hjT2ZlT0plUU9IL204clJDbG5BOHJNTlVY?=
 =?utf-8?B?QmhnWHNDeDRmRkNiYnpGc3o0Z05yZGUxQWxqbGxRMEVGYkdEKzkzWU5sK3U3?=
 =?utf-8?B?ZXJzaDBISTRiYTVmYm9zTUZ4YlcvUVk1WDUzdEdOOURrQjlSbUVkNC93ZkNJ?=
 =?utf-8?B?WDNPTklUeTF6WDVFMk5pc2JwL21RZkNScEl2RDZ4bWNYWWZEZFFzWFg4T0Nu?=
 =?utf-8?B?dis0aEpBb0wyUlQ2Q0VoMFhjZHR6Nk5qbDVJUDdBM0RkM3lEeWlnTlNXY3k0?=
 =?utf-8?B?SHM3bStEUDdPSHI5R2RjUTc2b25CbDgzUFZza3JFb2h1eTZxOXFYbGFZRXcy?=
 =?utf-8?B?VjNlRlVaQ3cvRUpDbTQzT1pyb2FteE9KcVlwSk1sV1Rjd0d4Qi9BOUNHVlJP?=
 =?utf-8?B?TVJoVk5MbXFQamk3VHdoQXh6VTFQS3liUnUvQWtONm82SzlOcW5qeU1kSkRu?=
 =?utf-8?B?Mzhyc0JnbjZrbmQ3cXhTU0NoM3NUazFBejdmTkU4NXc4WTdibVRqaEdJVSty?=
 =?utf-8?B?czErVVg2d254YnhFOGdsS1RkUWZ0Tm1pQ2htdjlhaUNpeitOdnljUVYvUThG?=
 =?utf-8?B?djBFbWR5RzhteWlGeGNzY0Izb1pwdllVNktjMFNZS2ZLZXJXL0t4R25oUGEv?=
 =?utf-8?B?V1plMDB5WCtYR2hpRnk5VnVXM1hJbkY4MWdBcGdqUGsydjRONE8yVnE3Tksw?=
 =?utf-8?B?UnlubWNITWtHSmFPcU1xbzJ4V2dwY0E2eXJNU3RkVzI4Rk93ZmJzcEhiTHpS?=
 =?utf-8?B?Zndid2RXSDBTZnNOWm5NOTIrNUZzSTZvN3RIVmRRSnlHMFJZVlROY09JbzdN?=
 =?utf-8?B?V2J1V1dXa1ZUdEI5MnM5TGF6YU1yS2xXUFkrR2JlWnBZSENtUllhQmdTc1Yz?=
 =?utf-8?B?YjZpU3BiTUlhWmtJTUpsK2ZLbnNNKytJUEhhbk5Dc01kSGR2VXN4QmJDcEI2?=
 =?utf-8?B?N2p5Zkhhb0g3NW1TVTVtYmt0UWRxaWtPaitTdzhPSG5BazlockQrY2xLRU1S?=
 =?utf-8?B?UVcvaDdPcmRHQzhBNzRpVDNtUk5peGNiaGV1QUFKWkw2Qk5xbEpnRktFcEYr?=
 =?utf-8?B?WE9HYlZGUDZjeFgxOWNzSzJDM2IycWlPZFRqSXB2dFNEcWxWOG84LzVEMGdW?=
 =?utf-8?B?aGpuOHRnRFplQUJZUUk4UnNmd2l2U3NVdjZmdklRRDVpSFNlY0xnR0hySHdu?=
 =?utf-8?Q?gggXYsf1FgF1cT0k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cYs3YqOlJE69OrMIzlpqFTCOokPSRvaXBQJ1PpB7DiT01k8Md+25dsyG14wPDVRY/KGjIBl/7N9aUrWT3VmaUmJhTOdkrnFPEQAFezoL6/Ki7KjfQhSeY5fkhQfX3x3p2hzd2IpLf3dekjpY68XnIPpVHCaotgzmXAjCHEdnygOgnkvyLED2cn5s73Nyd1uIdKb+GKVs2dSjGzZcrs/k+wXMPHalsE2MrtLNMIAnSN4+xAVlRUyhivmZl14wts6oGjXpUIJALgTNAajp3MQUg2Fyp1/qWuUlpOEe2qtaTUdMk1Q0yLeImJmqdYDBl3XMjGnufJfAa1e/rL3VB7IFhw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33488e98-3084-4356-1103-08deec65e701
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 05:05:54.4273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9BzDlZKKeixNKfaftqbaB6HR/aJ3HnkCAb0/PPQoS5zFTBqoZe+FljXScO0PofN5vlkbRC3mJfIlrjuC8V/dXfNbcENHz84zSuGbn4mnLMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5419
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA0MyBTYWx0ZWRfX/SggtTtm0Xd8
 p8WTru8h0BWXpJr9F01xLl4Vs8ZmdiyWjvavR/P8utmlzHagEKB2NGMSQvSFpCKc1Su7B6uqUFY
 HL//o0sYeF3zdPEhFzTOXGWDdokFfQysl+zUD2YcikFKapQK80VuJ3tOJXkb68l1XhFDPVKMGPN
 SSLO/+LGdqJa9zqTchowSsKmooAAOD4+V8GDkg7YKuEOdFCVgu7ABwQM1WeUKl6q48GU4ha84eg
 pPk7dm6qw/P56uLRIcb/5QQP9Moe1QPCsBDpwcwHe+jEoqZmOdxDtNeCxGkMP3Yl91hAXZN0GDu
 ZW3mkj3h9KuQj8WAov19GZbzEoJFuBs58RBWcRYvV1VQIuhpJxDYOFs4Sdhuy0lb5mCuqXMxV9C
 Tx6k3Qh8AIfMCO7gZ9n9kQVp6urJj7I0+7IM4V+hygHl8DK1KFI3kzUtBsfWIVKTXRK5dEqBLzl
 pKEpjtl2pMp1otOuy+g==
X-Proofpoint-GUID: HfWrULkUwE_JSdXMQosQAeeixanXOcAr
X-Proofpoint-ORIG-GUID: HfWrULkUwE_JSdXMQosQAeeixanXOcAr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA0MyBTYWx0ZWRfX6HddwJOLc0ww
 XitO9Hk9osencYieTPlFkCyVY3fFcc1K838Og6mnD2VbQ0ZgPpmSSO/ZnlT2HNvZgDjB9MjmgVa
 r8kQ8l+GoKH+/E5CSyy1zc0AJ53WSOnzpJsLmZdvm+ydhwz2lq7K
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a6838b5 cx=c_pps
 a=uJxR2RjB/d5PFa0hjvWx4w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ugNRTJOwpmtT476g4l8T:22 a=gAnH3GRIAAAA:8 a=ycNOQS6de_uYbTVMDDgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280043

PiANCj4gW0V4dGVybmFsXQ0KPiANCj4gT24gNy8yNy8yNiAyMDozMiwgQWxleGlzIEN6ZXphciBU
b3JyZW5vIHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBNQVgyMDgzMEMgYW5kIE1BWDIwODQw
IHN0ZXAtZG93biBEQy1EQyBzd2l0Y2hpbmcNCj4gPiByZWd1bGF0b3Igd2l0aCBQTUJ1cyBpbnRl
cmZhY2UuIE1BWDIwODMwQyBpcyBhIGRpZmZlcmVudCBwYWNrYWdpbmcgZm9yDQo+ID4gTUFYMjA4
MzAsIGFuZCBNQVgyMDg0MEMgc3VwcG9ydHMgNDBBIHJlZ3VsYXRpb24gY29tcGFyZWQgdG8NCj4g
PiBNQVgyMDgzMCB0aGF0IGlzIG9ubHkgMzBBLg0KPiA+DQo+IA0KPiBBcmUgdGhvc2UgY2hpcHMg
c3RpbGwgbm90IHB1Ymxpc2hlZCA/IEkgZmluZCBNQVgyMDg0MFQsIGJ1dCBubyAiQyIgdmFyaWFu
dHMuDQo+IEFuZCBNQVgyMDg0MFQgcHJlc3VtYWJseSBoYXMgYW4gSTJDIGRldmljZSBJRCBvZiAi
TUFYMjA4NDAiLCBub3QNCj4gIk1BWDIwODQwQyIuDQo+IA0KPiBJIGFsc28gbm90aWNlZCB0aGF0
IE1BWDIwODEwIGFuZCBNQVgyMDgxNSBzZWVtIHRvIGJlIHJlZ2lzdGVyIGNvbXBhdGlibGUuDQo+
IA0KDQpJIGJlbGlldmUgc28geWVzLCB0aGV5IGFyZW4ndCB5ZXQuDQoNCkFjdHVhbGx5IE1BWDIw
ODEwLzgxNSBhbmQgYSBmZXcgbW9yZSBhcmUgbmV4dCBpbiBsaW5lIGFmdGVyIHRoaXMuIEEgZGlm
ZmVyZW50DQpwZXJzb24gaXMgaGFuZGxpbmcgaXQsIGJ1dCB0aGV5J3JlIHdhaXRpbmcgb24gaG93
IHRoaXMgcGF0Y2hlcyBnby4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBDemV6YXIgVG9y
cmVubyA8YWxleGlzY3plemFyLnRvcnJlbm9AYW5hbG9nLmNvbT4NCj4gPiAtLS0NCj4gPiAgIERv
Y3VtZW50YXRpb24vaHdtb24vbWF4MjA4MzAucnN0IHwgMjcgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tDQo+ID4gICBkcml2ZXJzL2h3bW9uL3BtYnVzL21heDIwODMwLmMgICB8IDI3ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRp
b25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2h3bW9uL21heDIwODMwLnJzdA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9od21vbi9tYXgyMDgz
MC5yc3QNCj4gPiBpbmRleA0KPiA+DQo+IDkzNmU0MDlkY2M1YzA4OThkZGUyN2Q3ODIzMDhkNGE3
ZTEzNTdlNzMuLmI4NTBmM2I2ZTQwZDFmMWQwY2VjOTQ0YmUNCj4gNDBhDQo+ID4gZjAyMjY1YWNl
ZDU5IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vaHdtb24vbWF4MjA4MzAucnN0DQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9od21vbi9tYXgyMDgzMC5yc3QNCj4gPiBAQCAtMTMsNiAr
MTMsMjIgQEAgU3VwcG9ydGVkIGNoaXBzOg0KPiA+DQo+ID4gICAgICAgRGF0YXNoZWV0Og0KPiA+
IGh0dHBzOi8vd3d3LmFuYWxvZy5jb20vbWVkaWEvZW4vdGVjaG5pY2FsLWRvY3VtZW50YXRpb24v
ZGF0YS1zaGVldHMvbWENCj4gPiB4MjA4MzAucGRmDQo+ID4NCj4gPiArICAqIEFuYWxvZyBEZXZp
Y2VzIE1BWDIwODMwQw0KPiA+ICsNCj4gPiArICAgIFByZWZpeDogJ21heDIwODMwYycNCj4gPiAr
DQo+ID4gKyAgICBBZGRyZXNzZXMgc2Nhbm5lZDogLQ0KPiA+ICsNCj4gPiArICAgIERhdGFzaGVl
dDoNCj4gPiArDQo+ID4gKyAgKiBBbmFsb2cgRGV2aWNlcyBNQVgyMDg0MEMNCj4gPiArDQo+ID4g
KyAgICBQcmVmaXg6ICdtYXgyMDg0MGMnDQo+ID4gKw0KPiA+ICsgICAgQWRkcmVzc2VzIHNjYW5u
ZWQ6IC0NCj4gPiArDQo+ID4gKyAgICBEYXRhc2hlZXQ6DQo+ID4gKw0KPiA+ICAgQXV0aG9yOg0K
PiA+DQo+ID4gICAgIC0gQWxleGlzIEN6ZXphciBUb3JyZW5vIDxhbGV4aXNjemV6YXIudG9ycmVu
b0BhbmFsb2cuY29tPiBAQA0KPiA+IC0yMSwxMiArMzcsMTMgQEAgQXV0aG9yOg0KPiA+ICAgRGVz
Y3JpcHRpb24NCj4gPiAgIC0tLS0tLS0tLS0tDQo+ID4NCj4gPiAtVGhpcyBkcml2ZXIgc3VwcG9y
dHMgaGFyZHdhcmUgbW9uaXRvcmluZyBmb3IgQW5hbG9nIERldmljZXMgTUFYMjA4MzANCj4gPiAt
U3RlcC1Eb3duIFN3aXRjaGluZyBSZWd1bGF0b3Igd2l0aCBQTUJ1cyBJbnRlcmZhY2UuDQo+ID4g
K1RoaXMgZHJpdmVyIHN1cHBvcnRzIGhhcmR3YXJlIG1vbml0b3JpbmcgZm9yIEFuYWxvZyBEZXZp
Y2VzIE1BWDIwODMwLA0KPiA+ICtNQVgyMDgzMEMgYW5kIE1BWDIwODQwQy4gVGhlc2UgYXJlIFN0
ZXAtRG93biBTd2l0Y2hpbmcgUmVndWxhdG9yDQo+IHdpdGggUE1CdXMgSW50ZXJmYWNlLg0KPiA+
DQo+ID4gLVRoZSBNQVgyMDgzMCBpcyBhIDIuN1YgdG8gMTZWLCAzMEEgZnVsbHkgaW50ZWdyYXRl
ZCBzdGVwLWRvd24gREMtREMNCj4gPiBzd2l0Y2hpbmcgLXJlZ3VsYXRvci4gVGhyb3VnaCB0aGUg
UE1CdXMgaW50ZXJmYWNlLCB0aGUgZGV2aWNlIGNhbg0KPiA+IG1vbml0b3IgaW5wdXQvb3V0cHV0
IC12b2x0YWdlcywgb3V0cHV0IGN1cnJlbnQgYW5kIHRlbXBlcmF0dXJlLg0KPiA+ICtNQVgyMDgz
MCwgYW5kIE1BWDIwODMwQyBhcmUgMi43ViB0byAxNlYsIDMwQSBmdWxseSBpbnRlZ3JhdGVkDQo+
ID4gK3N0ZXAtZG93biBEQy1EQyBzd2l0Y2hpbmcgcmVndWxhdG9ycy4gTUFYMjA4NDBDIGlzIHNp
bWlsYXIgYnV0IGNhbg0KPiA+ICtyZWFjaCA0MEEuIFRocm91Z2ggdGhlIFBNQnVzIGludGVyZmFj
ZSwgdGhlc2UgZGV2aWNlcyBjYW4gbW9uaXRvcg0KPiA+ICtpbnB1dC9vdXRwdXQgdm9sdGFnZXMs
IG91dHB1dCBjdXJyZW50IGFuZCB0ZW1wZXJhdHVyZS4NCj4gPg0KPiA+ICAgVGhlIGRyaXZlciBp
cyBhIGNsaWVudCBkcml2ZXIgdG8gdGhlIGNvcmUgUE1CdXMgZHJpdmVyLiBQbGVhc2Ugc2VlDQo+
ID4gICBEb2N1bWVudGF0aW9uL2h3bW9uL3BtYnVzLnJzdCBmb3IgZGV0YWlscyBvbiBQTUJ1cyBj
bGllbnQgZHJpdmVycy4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9tYXgy
MDgzMC5jDQo+ID4gYi9kcml2ZXJzL2h3bW9uL3BtYnVzL21heDIwODMwLmMgaW5kZXgNCj4gPg0K
PiA3YzFlOTRjNDNhYzRlNWQxYjRmNjlkYzc3YjAyZTQyNGE2NzRlOTA4Li4wMjk3MzNhMzc3MTIz
YWU2YTg2MTg0MWQNCj4gYjRhNA0KPiA+IDBkZDU0MGYxMTQ5ZSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2h3bW9uL3BtYnVzL21heDIwODMwLmMNCj4gPiArKysgYi9kcml2ZXJzL2h3bW9uL3Bt
YnVzL21heDIwODMwLmMNCj4gPiBAQCAtOTksMTMgKzk5LDEyIEBAIHN0YXRpYyBpbnQgbWF4MjA4
MzBfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiAgIAkgKiB3aGljaCBkbyBu
b3Qgc3VwcG9ydCBTTUJ1cyBibG9jayByZWFkcy4NCj4gPiAgIAkgKi8NCj4gPiAgIAlpZiAoaTJj
X2NoZWNrX2Z1bmN0aW9uYWxpdHkoY2xpZW50LT5hZGFwdGVyLA0KPiBJMkNfRlVOQ19TTUJVU19S
RUFEX0JMT0NLX0RBVEEpKSB7DQo+ID4gLQkJLyogUmVhZHMgOSBEYXRhIGJ5dGVzIGZyb20gTUFY
MjA4MzAgKi8NCj4gPiAgIAkJcmV0ID0gaTJjX3NtYnVzX3JlYWRfYmxvY2tfZGF0YShjbGllbnQs
DQo+IFBNQlVTX0lDX0RFVklDRV9JRCwgYnVmKTsNCj4gPiAgIAkJaWYgKHJldCA8IDApDQo+ID4g
ICAJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmY2xpZW50LT5kZXYsIHJldCwNCj4gPiAgIAkJCQkJ
ICAgICAiRmFpbGVkIHRvIHJlYWQgSUNfREVWSUNFX0lEXG4iKTsNCj4gPiAgIAl9IGVsc2Ugew0K
PiA+IC0JCS8qIFJlYWRzIDEgbGVuZ3RoIGJ5dGUgKyA5IERhdGEgYnl0ZXMgZnJvbSBNQVgyMDgz
MCAqLw0KPiA+ICsJCS8qIFJlYWRzIDEgbGVuZ3RoIGJ5dGUgKyBkYXRhIGJ5dGVzICovDQo+ID4g
ICAJCXJldCA9IGkyY19zbWJ1c19yZWFkX2kyY19ibG9ja19kYXRhKGNsaWVudCwNCj4gUE1CVVNf
SUNfREVWSUNFX0lELA0KPiA+DQo+IE1BWDIwODMwX0lDX0RFVklDRV9JRF9MRU5HVEggKyAxLA0K
PiA+ICAgCQkJCQkJICAgIGJ1Zik7DQo+ID4gQEAgLTEyMSwyNiArMTIwLDI4IEBAIHN0YXRpYyBp
bnQgbWF4MjA4MzBfcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4gKmNsaWVudCkNCj4gPiAgIAkJ
cmV0ID0gcmV0IC0gMTsNCj4gPiAgIAl9DQo+ID4NCj4gPiAtCS8qDQo+ID4gLQkgKiBNQVgyMDgz
MCBJQ19ERVZJQ0VfSUQgc2VuZHMgc3RyaW5nIGRhdGEgIk1BWDIwODMwXDAiLg0KPiA+IC0JICog
UmV0dXJuIHZhbHVlIHNob3VsZCBhdCBsZWFzdCBiZSA5IGJ5dGVzIG9mIGRhdGEuDQo+ID4gLQkg
Ki8NCj4gPiArCS8qIFZlcmlmeSB3ZSByZWFkIHRoZSBleHBlY3RlZCBudW1iZXIgb2YgYnl0ZXMg
Ki8NCj4gPiAgIAlpZiAocmV0IDwgTUFYMjA4MzBfSUNfREVWSUNFX0lEX0xFTkdUSCkNCj4gPiAg
IAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJmNsaWVudC0+ZGV2LCAtRU5PREVWLA0KPiA+IC0JCQkJ
ICAgICAiSUNfREVWSUNFX0lEIHRvbyBzaG9ydDogZXhwZWN0ZWQgYXQgbGVhc3QNCj4gOSBieXRl
cywgZ290ICVkXG4iLA0KPiA+IC0JCQkJICAgICByZXQpOw0KPiA+ICsJCQkJICAgICAiSUNfREVW
SUNFX0lEIHRvbyBzaG9ydDogZXhwZWN0ZWQgJWQNCj4gYnl0ZXMsIGdvdCAlZFxuIiwNCj4gPiAr
CQkJCSAgICAgTUFYMjA4MzBfSUNfREVWSUNFX0lEX0xFTkdUSCwgcmV0KTsNCj4gPiArDQo+ID4g
KwkvKiBOdWxsLXRlcm1pbmF0ZSB0aGUgc3RyaW5nICovDQo+ID4gKwlidWZbcmV0XSA9ICdcMCc7
DQo+ID4NCj4gPiAtCS8qIDkgYnl0ZXMgb2YgZGF0YSwgYnVmWzBdLWJ1Zls3XSA9ICJNQVgyMDgz
MCIsIGJ1Zls4XSA9ICdcMCcgKi8NCj4gPiAtCWJ1ZltNQVgyMDgzMF9JQ19ERVZJQ0VfSURfTEVO
R1RIIC0gMV0gPSAnXDAnOw0KPiA+IC0JaWYgKHN0cm5jbXAoYnVmLCAiTUFYMjA4MzAiLCBNQVgy
MDgzMF9JQ19ERVZJQ0VfSURfTEVOR1RIIC0gMSkpDQo+ID4gKwkvKiBWZXJpZnkgdGhlIGRldmlj
ZSBJRCBtYXRjaGVzIHdoYXQgd2UgZXhwZWN0ICovDQo+ID4gKwlpZiAoKHN0cmNtcChidWYsICJN
QVgyMDgzMCIpICYmIHN0cmNtcChidWYsICJNQVgyMDgzMEMiKSAmJg0KPiA+ICsJICAgIHN0cmNt
cChidWYsICJNQVgyMDg0MEMiKSkpDQo+ID4gICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZjbGll
bnQtPmRldiwgLUVOT0RFViwNCj4gPiAtCQkJCSAgICAgIlVuc3VwcG9ydGVkIGRldmljZTogJyVz
J1xuIiwgYnVmKTsNCj4gPiArCQkJCSAgICAgIlVuc3VwcG9ydGVkIGRldmljZTogJyUqcEUnXG4i
LCByZXQsIGJ1Zik7DQo+ID4NCj4gPiAgIAlyZXR1cm4gcG1idXNfZG9fcHJvYmUoY2xpZW50LCAm
ZGF0YS0+aW5mbyk7DQo+ID4gICB9DQo+ID4NCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJj
X2RldmljZV9pZCBtYXgyMDgzMF9pZFtdID0gew0KPiA+IC0JeyJtYXgyMDgzMCJ9LA0KPiA+ICsJ
eyAibWF4MjA4MzAiIH0sDQo+ID4gKwl7ICJtYXgyMDgzMGMiIH0sDQo+ID4gKwl7ICJtYXgyMDg0
MGMiIH0sDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoYXQgaXMgbmVlZGVkIG9yIHdhcnJhbnRlZCwg
Z2l2ZW4gdGhhdCB0aGVyZSBpcyBubyBtYXRjaGluZw0KPiBkZXZpY2V0cmVlIG5vZGUuDQo+IA0K
DQpJIHNlZSwgd2lsbCByZW1vdmUuDQo=
