Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B40A2264B0;
	Mon, 23 Feb 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771844981; cv=fail; b=QkOvdR98bYG2EtWPce6e7kFI8zccpy5rnLLvW4qHZgPDvy3+BomyuHUIgl0H3Ed9cSJHR8m/4T3OSFT5ethyc0KC1i1PRY9RA1COLAMom/vFZD7zevvykf9mMt4VD9+C1iBo6d1haUm7F5Zp19jVr/7L47bZ6qKdPal29lt8JUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771844981; c=relaxed/simple;
	bh=oOSjAMsutf7VLgJWdsGEh2ZhmLJjDMbShVFOcBN1hhw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WOTkLCBcWtTZ/ZQR2U18tVrM+YagyI7P3AcYhAHIulFiw6Wu3koh4sBTx/Fy8W4N0XE8hd+68+i45lkl/YF4Jy1bM3QE4OKlFCpxIDd7/gb3nDme7ecYcXuK9rDyzZfZPCPkZZkh3I3H75Y5NBuBpfx3ZPQ3CZ93sc48Uv+2XLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=fO8I1Rf+; arc=fail smtp.client-ip=40.107.209.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fO8I1Rf+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obpO1tvmghEwoijK0nMGnzZ+2KwNNZvREeULk9aeYwGsYJ6Rv0VaelfRensvoBcTmmq2Q9Jj+UArryIshA5f9a85bjb2dwjVg4b2DB28/LJAWlvqL98AhKbRUuOASwXlWfTaHYc0sUMepQLBjJza86u5sn+34RchY5SyS2HuUTDVr1WZjCNti3+B2Cfz3At45J4SIe0wbmCyn7FxUwUUcSAAKLeY09zrVIDVD+QXZj7TFimCDXtQZpxdAfkfcwlIYhrFLN3CDl9uTK6q8wc3R0YydPKSdzz7LNEn5cfmBntagLo1dnuSOMWcXJrpslwZikyS713qLcw8kgrG8wiOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOSjAMsutf7VLgJWdsGEh2ZhmLJjDMbShVFOcBN1hhw=;
 b=YBqsBke+gVVUThlS6tsCkjhbafyd0R2TYeZHcVvkJn4PFjsdKEyN85LDIMY83uGnI3j2PbI9KpoYqwvFkLSA1YCBxK5mxY6toGRtDr/kfqAG4plIcvEdz6szRDAM4Gv911D1WLws2o54K01n3132EgXx7IIXkhCYvIgk+zYX/VRxxzFsloeu2vQYBLri9GTjmX87WqkL+hA7GeWAuJFkx/Yy7ED29VZsKL3n9ttaGtP8lRV+RQnfakvhwZM5gTJH0DJSXinHx6/j2c7e9xjnnjsl1w4csD3V6e2T/tex6XRmUfSv6iAc4jsHTVCKNOQyaCjYk66xl41aYj1digNsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOSjAMsutf7VLgJWdsGEh2ZhmLJjDMbShVFOcBN1hhw=;
 b=fO8I1Rf+hAaX9ISOqDuOGMlFG52HXWBahloSxGRTduH6XH4izFs4l8BZcBgpr5e7kGAo2OR1gdF5XFgKfKSfHoXvj7NPAFwdn92QXbmSjxXtkq/PmPRHcJ4vXmUjTsQpfyA0m+lJBm+VXpVi+/54nJNJVzttRP44wIsO9YGNt/8pLYCisyqgqnIYRUwA0RX04hjLr6TMr6WhNcICqVA0VkHTQfNyXe4I66LeJ9hpZoSoJtCyv7G5majt3qr8ujgc619ylOwlkJLT+uW58GErA+LaqYPR5r3D5OBeu1pjC/sFdIkGJnpJGitrnrpYGmeLSd2iyovfvFp1rVPksPI0ig==
Received: from SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 11:09:36 +0000
Received: from SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0]) by SN7PR11MB7511.namprd11.prod.outlook.com
 ([fe80::b0d5:a33a:26fd:3fa0%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 11:09:35 +0000
From: <Victor.Duicu@microchip.com>
To: <krzk@kernel.org>
CC: <corbet@lwn.net>, <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <robh@kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-doc@vger.kernel.org>, <conor+dt@kernel.org>,
	<Marius.Cristea@microchip.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Topic: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
Thread-Index: AQHcoBa9pxaxrTCHNUam0PksYnBYNrWHUwkAgARfnYCAAYuegIAC61YA
Date: Mon, 23 Feb 2026 11:09:35 +0000
Message-ID: <e32684ab5fd4e86ad61d2ca0e4f219fa29bd26fc.camel@microchip.com>
References: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
	 <20260217-add-mcp9982-hwmon-v10-1-5e0aaae6f289@microchip.com>
	 <20260217-sincere-spotted-lionfish-d7abca@quoll>
	 <9a39d9f1d97eea245dd194a2db481297b92c6fbf.camel@microchip.com>
	 <4a84d57c-ede6-4038-9883-42aeafce2687@kernel.org>
In-Reply-To: <4a84d57c-ede6-4038-9883-42aeafce2687@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7511:EE_|MW3PR11MB4764:EE_
x-ms-office365-filtering-correlation-id: 9128af55-d973-4520-c93d-08de72cc0772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHBaZEtwa05uR1VlSDZXNWh6dDZwTncramZSTHhQZGdOd21hRU96Tk5EanAz?=
 =?utf-8?B?bjEwYmR2aHUyaHJBMnFZOU9ycmtlb0lVNHR2Z0krQlJUVU5uZmxRbzV3RXJT?=
 =?utf-8?B?bTJCK3YvWDJkYnN5bElJZmpYL2tkdFhobmxjRVRPbUFVeEhqV1ZlY3VrZVo2?=
 =?utf-8?B?K1N1dk0zOGU0SEYrMU0yVlVSZnBWMUZ6WTJjeTNUTmo2dUpVRGJUK2tDSTlu?=
 =?utf-8?B?cDBqQVFXTWlOUWIwWXhKSmRNQzMvN21oZlFnQy9kdWpyc2ZCRnhRWUhWY096?=
 =?utf-8?B?VG8wMGdPQ0dERWxYdStxaFFhZ2ZCMnpoWGJDb3RCNlZmQ2FzcXhmM3NEbnFP?=
 =?utf-8?B?Wm95QXpQVW9CM0VNa1M5Vy84M25MbHVQZUw1TFpzanE2bHpnZHVFUlp4Qy9J?=
 =?utf-8?B?NW1EZ3A5NU8rZHJwOUhIVnRxYjY2MTBTWkdPNks1UE9NWW1zbDJ3cWZzdzcy?=
 =?utf-8?B?M21Rb3R2c3NMTHdYL2VMNjk1WDRaWFBJbGFwQWhHL3dBUUtVdlJIWisvRXlY?=
 =?utf-8?B?NUlPV0p3eC9mR3F4TVNCOTdKeEVNdVRKZkZUcHlBYTVzMFZTKzVUWUZkZUdP?=
 =?utf-8?B?RTAycEJLU3VGdDYvVStZQmRvaEpTcVpBdmJGRlIzRzhwbFNYRytscTQvQ3g1?=
 =?utf-8?B?b2JIbS82R0swTFpNR09QdG9jRDdYY3BCVElWd0NaL0xJYkRncko1cEQrRndn?=
 =?utf-8?B?aUNNZDJZbk9Lb29abXdGSkI2bkhnS0wwbnJVdWVoMzBLUGZ2VGZmU3JCTjd0?=
 =?utf-8?B?T2NENmp4RTZ4eWdqVUx6UVFiZXQ2MVVUUURoTlNNNkFJc3FNOVpDcW5EeGVP?=
 =?utf-8?B?TFkxRDFmb3RJUTE5bVhOVXM5UXlpNGNaUmc5aTkwb1Nzb1RjUDAweDJZbzhJ?=
 =?utf-8?B?aGliTldkUVJOSWpzdGMzWnRIWGF5RGhBYzRVQVBRb3h2djJ2SEVLVk9TcFRr?=
 =?utf-8?B?bHdQaW05bnJ2Y3dwQTQvQ1RzQS9PdThtZnBvdVlwamVNY3laU1U1VGVzVG42?=
 =?utf-8?B?YktvazFRS0xkWVlXMGJsM20yR29TRk1vQUo5ZUg0dFU0M0l4V2Q2THJUeXJI?=
 =?utf-8?B?Ry94cWR4TjAxN09EemYxVDdsQmhvMHhEMENFSXpTQzMyeklzMFc4eUhJcmlJ?=
 =?utf-8?B?ekZwVFhCYmppZG5ZR3pmOVN4RWtKaWg4amtxK2VKTzVCTVZ4U3JxRVJUWkt3?=
 =?utf-8?B?dUJickxsSVhIY0dUMmNaaVJmckFNYTVWWGlqOFh4VEhXNTZacEREbEZ0WU8w?=
 =?utf-8?B?cmpCZGljQS9JeUVQRURwcGpuMS94MzZ6SGF5VlBibElGRERVN1YvVjFjZi91?=
 =?utf-8?B?UlprTk9oL3ZKeGhBMkUvQU45S2RNZEsvc3lVdDdpenM5ZFljSlVDSEx6dEZ0?=
 =?utf-8?B?NDlib3ZpT1lmMklLemZDUlV3RWkrRmlOUUQwODdiV3h3cXlZZWVMRXRUQVRa?=
 =?utf-8?B?SkMremZrM1ZjOXdrTUY2bzVxbG5TWWdEUFFFZ1VWRWZqU0pJaDU4LzdyV01u?=
 =?utf-8?B?S2hFR3VuVzVWemtQeU1XT0dLMktQVW9oSVg0YVZQaXZmTnJ5MFZKb3RtWGVW?=
 =?utf-8?B?YkIvdE5KOVRFejFYU3NnNXJWNExSblpVV09zbnZiQ1h5d0hpNlVVQU8xMklB?=
 =?utf-8?B?Q1RhRkRZMUdWdTg0b3FldFFOUDQrelhwRnpIZzlBYzhGR0xVcnVIdjRiOVlq?=
 =?utf-8?B?eUZnWVExVlhEOXFteHpXeGtsUHpjMGpKUGhBR2kvazhYSnJuL25qeUw5YzBn?=
 =?utf-8?B?dmIrWFpLeHJtQWNMcnVOTGRlMld2bmNFTWtFT3pTOGJreFpoZkluOGxoblB5?=
 =?utf-8?B?SVVWQVV0dC9yclJNN3BJcE5WamJ6aGlHNDcwa1B3aTBvaldBeG00citaWUtH?=
 =?utf-8?B?RW8rTXFZcXFFZWJ0bCt0MFlRZHRTb2NaYWxaaHNZdFBSNlhDc0FZd0hmb1dv?=
 =?utf-8?B?WVNnbVl6SHNaYWxyczVmMmhKZ0E5TUdaVjNIVkMxWFpOUC8xSGxoZTNFSzZN?=
 =?utf-8?B?UkFweWdES0owbmh5ZEc1SzE3NWhVUURySnlSMjlMS1VhZVZ3eWdNV1FZUzgx?=
 =?utf-8?B?L2VVWWNYb3B4TnZONXlTQkZtcUVmRGswRURkZGh1NktOMEFsMWczTm45WXda?=
 =?utf-8?B?NlJBM2Y4WXJvVGdvd1NIczE4bE1UcFJNN0RkeEhFNmlxYXNKd0lRTUhuUW1y?=
 =?utf-8?Q?MFwbsTyaENKn9UHQVoqG2Oc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7511.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bEE0eWt1TWx6ZlplTHgrTE1rb2kvK0Z5RFA3cUxKdnZHemppUDVVdElzcnIz?=
 =?utf-8?B?L3NrSUxRckljbjJlcXdVMWFYbk1mZFY5Skx0MjBpTWFWWEJ5MGdBN0xJbks4?=
 =?utf-8?B?NUFwYWFvY3pIZ2xhWHFxNE90OER0U1VnOTNNZVlxNmNLSUtRR1REUjFZUFJq?=
 =?utf-8?B?V3ZTRElyZXdFcnVIWklWSkp3WU9XM3NPZURpZDhFMGtGMXoyeGtOUEpXaytU?=
 =?utf-8?B?bXNveGNVdnFDTlo4V2FkdnpLVVVMd1V1UXMwc3d1bWEwR0pGL21ydUt4VS9G?=
 =?utf-8?B?WTIwYXk0L1Y1aDdiS1EwK20yYmZvWlpWQjFaVFFhdHBUUHhuT1BXQTVpdjJl?=
 =?utf-8?B?ME5IdkN3cWVTTDRqWVFTMWlWSTZFVy9udjlsL2o5eUp1aVYvT3VOODh5UE0x?=
 =?utf-8?B?MHZ1VlZBYU01QjJNUjRDVitWTW1vSVBmREw4bmJ1L0czWktmQUhUNUhRZ1pF?=
 =?utf-8?B?a1NGaVU2N3pPTTNOZTRKYVBuR25lVDRnQ0pRcjVyai93eWxlTGNwMUhzVGR3?=
 =?utf-8?B?ZzM2Y2dodXUwbmRPU0VJeUduVjBTSm8wNDFTWFJ5QXREUHJyb2M4ZlM4OTQv?=
 =?utf-8?B?UzcxZDB2TzUvcFJDOUM1OXNId1ptaThxY2VyQURvakx3SHlMaXRSSE5hWHlx?=
 =?utf-8?B?eFN0OU9ROW1DSEtzMG1rMWIrMElJYzZObjUvOHpFZ2FpV1BMaVlMQVVvNGxO?=
 =?utf-8?B?SjNlWUZJWlFaM053bkJWRFpabXVuc2FMa0FObnVrZ2ErbXhEYm1hS3J0Z3NS?=
 =?utf-8?B?Z0FDVlFmZ0JkWE5KeW9aZCtsS0E5UFRydDZzQW5mYlE0dkxDWm4rVHFtQjVs?=
 =?utf-8?B?TGprb2VrZGpuUk5oc0VIVWhjdm44MDJyekRxci9RbCtOVjk1RXV4YzR1T1dr?=
 =?utf-8?B?ZFpXL3pHKzNkdDVvdFcxcnoycHJOSDR4T0pySkNFVU00bTNUWk4zeFFTVlU0?=
 =?utf-8?B?d3F5MzRtMm8zZTlSRG1IbWJJMFlHR3c5aFBLUVFLMDRkenV2RWZTeWY0T2Vq?=
 =?utf-8?B?c1gxVnlOaWxKYkFQN0xicWxROFlGSGNINGFNUVd6eThQL3NKWE1tVStmeHhx?=
 =?utf-8?B?cUpJME1UQ2pUclZ5UGZHQ3hrLytaaGhHWm9WT0duVm9CNnJONEM4V2RPdG45?=
 =?utf-8?B?OUNUVXBJVGMzVFYrRXo2VEtCdDVmZTNuM2sxZWhRRTYwWERSQXhZRm0rZkN1?=
 =?utf-8?B?L0cydEgvNGcwRUl2Ym1SVnNvVFRCOVBmQStYTXkzcHVjdmh4S09tVGtyZkFi?=
 =?utf-8?B?VTFiUktVU1FBa3RnUHhzd0puN1puSnV6RFptcHU5cXYxWHFRMVA0U1RQcDJs?=
 =?utf-8?B?TFp5cVZVam1KN3ZDOVJNVkY3TFBMQUVHRWZsY2ExS1g3Kzc3VUV5WXQyNTVZ?=
 =?utf-8?B?OVhmdXNSL2t2L25ZQjRxLzdkY1M5eFp6K2hZZDRvUHpPbW0vM1kyb0Y4L09u?=
 =?utf-8?B?UjFVOEltU3pZV0N5cjdJcUp3c3BweFE3TUFMRkNnL3ZTQ0lOR0FSVmVia25v?=
 =?utf-8?B?bGZCK1U5aTZTV1NrdDM4amJPUDRUUVVDM3A3S01mUldDYzBQcVBSRFk4MW45?=
 =?utf-8?B?ZEJCRlJNcnppR2xweTA3b01rbXVQbU1BdzZuUXozTXpWcUs0NnVJSlhhcmlp?=
 =?utf-8?B?Q0Z0Z0pneGhOVy9yZlhEd1NtVWFsZloyY1lYNTlnQnByYkRET3ZOYUdPaEZ6?=
 =?utf-8?B?eWFadENHallwbUNDNEFyK2xwdjVoSEhFTGR3Wng0NXl6azR1UkhBdmxoaG5T?=
 =?utf-8?B?WjNLUWdheG81QXRMTUovMlBSbFA1UDc4OFhEZ0NSeFBvMzZDVkI5TGhYYU9m?=
 =?utf-8?B?Sm9rZEdySzc2bXY3TTJyTTBoUWxTOGc2dUJuSkp1SnF3WVFTa0xXTlMrVWMw?=
 =?utf-8?B?ZWJTbG83a2g2bnJPZi9qc3EyQkhIOUlIZ3BhZGowVDBQaGMyZDVaWHQ3WEs2?=
 =?utf-8?B?eksyYitBRWZYTC8wNVFQTW5DbGFaK1EyTEtERDBuNGQveDl1TEplMXdTNDJU?=
 =?utf-8?B?emVzdzBRWWc3cEdwMVpaWFJSS2V4OHhPL2s0S09iVC9weHRONU1DRUtyZ2J2?=
 =?utf-8?B?emVEcm1UdDR2YXNXb005Q3YxVVJjdVcxVUdHRlZuL0hpZEUxQk4vbVlkSW9u?=
 =?utf-8?B?ZzhSTTI1N0NkMklPRHo4UlE2RHI5dlNJY0dML0FNSDVTL0FxbW5EbWZVaDN6?=
 =?utf-8?B?Y1crQmZCb2RpYkNINXpwVlJteGJrQWlBdEZ0disraFZRUUdEVnB0VjJyZWFV?=
 =?utf-8?B?MmViUGJpa0p3T3dKeWVyMmQxclQwNTBJODNFc0E1UXdVYWV2YjZFK1lLc2xj?=
 =?utf-8?B?N0hiRGRVb0l1bXo3N1Q3TncwcExBOUVIaWZDbnBUUVJkQXAyUEFrNlIyRGtp?=
 =?utf-8?Q?d4gZDO/vZH50nSbk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C27B009483072F48834F7FC3FEFA50F0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7511.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9128af55-d973-4520-c93d-08de72cc0772
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 11:09:35.6604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K8mKBqZV7r4gTv/V2Eb6Zw7GmvKGYiBgJ4zMoRJM0iJrWVMwgOJ2inRkg3t19jkHwonCHAfPyBKIThXT4mbW0sVq2OQNen70eDB6rmGyUjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764

DQo+ID4gDQouLi4NCg0KPiA+ID4gPiArcHJvcGVydGllczoNCj4gPiA+ID4gK8KgIGNvbXBhdGli
bGU6DQo+ID4gPiA+ICvCoMKgwqAgZW51bToNCj4gPiA+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2No
aXAsbWNwOTkzMw0KPiA+ID4gPiArwqDCoMKgwqDCoCAtIG1pY3JvY2hpcCxtY3A5OTMzZA0KPiA+
ID4gPiArwqDCoMKgwqDCoCAtIG1pY3JvY2hpcCxtY3A5OTgyDQo+ID4gPiA+ICvCoMKgwqDCoMKg
IC0gbWljcm9jaGlwLG1jcDk5ODJkDQo+ID4gPiA+ICvCoMKgwqDCoMKgIC0gbWljcm9jaGlwLG1j
cDk5ODMNCj4gPiA+ID4gK8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4M2QNCj4gPiA+ID4g
K8KgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbWNwOTk4NA0KPiA+ID4gPiArwqDCoMKgwqDCoCAtIG1p
Y3JvY2hpcCxtY3A5OTg0ZA0KPiA+ID4gPiArwqDCoMKgwqDCoCAtIG1pY3JvY2hpcCxtY3A5OTg1
DQo+ID4gPiA+ICvCoMKgwqDCoMKgIC0gbWljcm9jaGlwLG1jcDk5ODVkDQo+ID4gPiA+ICsNCj4g
PiA+ID4gK8KgIHJlZzoNCj4gPiA+ID4gK8KgwqDCoCBtYXhJdGVtczogMQ0KPiA+ID4gPiArDQo+
ID4gPiA+ICvCoCBpbnRlcnJ1cHRzOg0KPiA+ID4gDQo+ID4gPiBZb3VyIGludGVycnVwdC1uYW1l
cyBzYXkgMSBpdGVtIGlzIGNvcnJlY3QsIHNvIHRoZXNlIGFyZSBkZS0NCj4gPiA+IHN5bmNlZC4N
Cj4gPiA+IFRoZXkNCj4gPiA+IHNob3VsZCBiZSBhbHdheXMgY29uc3RyYWluZWQgdGhlIHNhbWUg
d2F5Lg0KPiA+ID4gDQo+ID4gDQo+ID4gV2Ugd2FudCB0byBhbGxvdyB0aGUgdXNlciB0byB1c2Ug
bm9uZSwgb25lIG9yIGJvdGggaW50ZXJydXB0cy4NCj4gDQo+IFdobyBpcyB0aGUgInVzZXIiIGhl
cmU/IElPVywgY2FuIHRoZSAqaGFyZHdhcmUqIHdvcmsgY29ycmVjdGx5DQo+IHdpdGhvdXQNCj4g
dGhlIGludGVycnVwdCBsaW5lIGNvbm5lY3RlZCBhbnl3aGVyZT8NCj4gDQoNClllcywgdGhlIGhh
cmR3YXJlIGNhbiB3b3JrIHdoaWxlIHRoZSBpbnRlcnJ1cHQgbGluZXMgYXJlIG5vdCBjb25uZWN0
ZWQuDQpBdCB0aGUgbW9tZW50IHRoZSBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBpbnRlcnJ1cHRz
Lg0KDQouLi4NCg0KQmVzdCByZWdhcmRzLA0KVmljdG9yDQo=
