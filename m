Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7801D3563FB;
	Fri, 17 Apr 2026 03:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396777; cv=fail; b=GT5wx75jGXVvoWFFVMg4EqvOUCqyLJLhdB1/WQ34DRtJojK9mrGNPKrZwgA7jRorq78gcdAMnN3gTGjio64akuznXN/G0pGgn1EtjTF9ElbfkfNJSOD4FD8rgqubrlSIAMzdPZ2y/4nqVeLO+PA7yh8X/XV5sVNRyvjWkq4OViE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396777; c=relaxed/simple;
	bh=mPmol3iU9kYHxaj/o0JbxCq6aufAxRORHLLuPFX0wXA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uEYmLMzS0msggnIShvoJ/WcRPr6Xg/LHBrNSmU08D9cfxBpHRgk00SZRmOAVimZqe1RKpRK6Qe5zgfW8MBXejJ6bMNgtNswaKqxEe4pFq9v9PEU56Y02MxKwdv4WLtqV5/q6TZ6ttsZaDhQZviZGFa+R2un7iW1jx1UN+AZ3nvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=AmILXkkb; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="AmILXkkb"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H1F9BH203575;
	Thu, 16 Apr 2026 23:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=mPmol
	3iU9kYHxaj/o0JbxCq6aufAxRORHLLuPFX0wXA=; b=AmILXkkbAFxerDrjtlGj0
	OfTziDY8fwO/TSFNPcRrakcAWs7vKQbGV5oXtrJWzXHNKk3wbXjEd4E/gGgLHjgz
	FInepauK/zaDEIn3DSLbs+/LRceqgwywLxUnVAYzWSMdH7syWlWkKB44lZQXZgdj
	uvp7IEZ6VMU5PLSOo8deMt6bLTOPtzinRrGPWiMSmQ1xBYLi8sR0TC+k2+4Rt2ra
	PQ6oYTLlZ4jiHanNl0yrnNnQWZcHIPzrPTzCyf8gQzyf2wbbSHEpLHn6pQwgjb+E
	Vo1gn5eTNy9TIWLMKGgC8VKfQ/W8i/ymrOE9HqnMeGa/QPtpw70CDc5+La4IRCTd
	A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4djv9ac1wf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 23:32:39 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUSHN1460xzscQt4VVZ4k+aQqiYCe6xsdINNwNMy6InPL3vD5hRjV+iTAjYFoK1lMzgV+rZnIu3Z5PuPPCeFgZbkcXQfAV9yTXUsgT67vyvzQyteqoRP5lCLij3SZsUXDFQXt9eWbwQZNZcgeWNFsIAt6INmxbqWw50vDlpZppO2PyX9Y41Tbsmgsn5CoQCCTiqWn1hQz70PVapthAyk+uCUmsImOVe0qbAn+vW9+kvGSXusoEETqi1Ese9qgF5BZjfKTueDK4ayVkRTa1T+V3FCdl+OE4Q5oQbGimDPMljs5fWCUN3+JD1h7dYsSKunTvqK5pnNIqSEcV5LJ/13Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPmol3iU9kYHxaj/o0JbxCq6aufAxRORHLLuPFX0wXA=;
 b=ANbnEGBs/rOAftuUYLujDqG1yYJs7xRBHvQ3gwK2qtEGnHOdVz5nBKhUtWcDifnpMJnU68iFqnVIrMCwMD49gOgufB7jIT7fJ/wOH3fWs4t7OoBjI9A86IcgaByCc0xiQvqno6ASeolFkkOSguobI1J7Db5nxgEJ7iXCYnOMq12/At9HS3B9TqKnR5TTw8S3mmG2eWM3Mstz1WDlVV4K32uLsiB1KO9gK0Rz39YopUKcdFKKAdRlE6aqqxm0B2JL63/ELq+uJanyTDmlwJNNBPoFJvWY4/TQ6Qu8Pa+eLrnFe7eS5Wz/DmZqX1f0OpEFcPWWyEUyLo1femLcO2kDgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SA3PR03MB8183.namprd03.prod.outlook.com (2603:10b6:806:464::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:32:37 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%6]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 03:32:37 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
Thread-Index:
 AQHczXcJ0nOdZqqKtk+vtpI0M6ZlMLXh1uKAgAAkYYCAADpzgIAAM80AgAAuaQCAAAKpUA==
Date: Fri, 17 Apr 2026 03:32:37 +0000
Message-ID:
 <PH0PR03MB6351D050E350502FCF60DD5CF1202@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
 <20260416-dev_max20830-v2-1-2c7d676dc0bd@analog.com>
 <20260416-diaphragm-corrode-494560404ed4@spud>
 <84a5154f-1139-425e-94ae-31d7e662cd0e@roeck-us.net>
 <20260416-scoring-secluding-c7a7235b181a@spud>
 <PH0PR03MB635166088B7C473CF59F17D1F1202@PH0PR03MB6351.namprd03.prod.outlook.com>
 <a142d5ce-e4a3-4f50-8009-f796609fb13c@roeck-us.net>
In-Reply-To: <a142d5ce-e4a3-4f50-8009-f796609fb13c@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SA3PR03MB8183:EE_
x-ms-office365-filtering-correlation-id: d902d32d-e955-43bb-a71a-08de9c31f8b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 oL1VsvSu5dH8IGGpClc7MlqWkIkYJtkGTfVkRMZU3EVwD+XtzoeLMuOBTHLrz2unroJs8GJT/G/oTtfs8ijglrE3wliFmr19+H8k5CdLJhY08GLT8MSqaayIBAYcrl81lAt9ltkatpeRCEaMR6xeqJZNaI+3Wq9az33N5+lB/033yxsP0YV+HbmaAIZ2M+ZgIze6DCdHfFsygdRYV91AamMDkjOEZHEXXdZUtLFGfQ5FjYXObVkU2jRAjhrN3eb27/PVv+H2aI+zizqTcWD/qMNuXPjLoKJkYuN5GxE2M3bArqqMZIAbTf17OujzEugmd3D7y/bkWBKgOmomiHbp2wnJqn9AnhOj3iDryyAwneJsrn2Uh7YbJ5RrnXH+mqZmeCmOH5UVVvW91Y+mId0h5JDhknjfnSOCp+uqZKLbzrkvkGM3makwGOJ+sXEvXEVxu5CoDxZD6roZZ9EEpmDzKy4Ndi9394R7YIUvSVDZ62GOaXTZKaCbct6CajfGo9W1+EkDGeychn4s2vgfIl3cONEzGQrorUIk8D5j7I0X9kE2frMP6FJuFHEs8mgbQEDiYFbLh+D6hVlnWEcSGIIus+m0wNtTYFX7FX36zwXv4ssBrsPqxDoSFGW98tiT2IftwsBj0QJ43rC6x1JHxY+mTxBSUTLje/NhuQ8/ohSvvuMBc5noXgicPDc67lz3NKlsrFmPZQ6MXapuVkiiMwAgdtu7QHo9U4FngugFamQXgkLtfbRQYELsh6SgrS2mv3BaOr/usGyA/AbjE4ExtzlQoJ/ncpWsbpp25RQpSG81Eks=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3c2Z0RyakVIN04yUGlWUEZHZWp0R3dRNlVxTWVXTkRtQWtRNU91TWdxbGlC?=
 =?utf-8?B?djNQbktnZU5NTDJwdWV0VXNZSktaSWg2bXdnWC91ZnMyZDE3bjJ5eUpFRXUv?=
 =?utf-8?B?TDA0U2RDNmpZODMxWVEwaWpOL2dGQzg5TVQvU1dZWG91OUZ3VVpFbHRPeW5j?=
 =?utf-8?B?NS9zd1plS2ZEWmRuUVM4NG5UR0x3d3I1MnFCbHdaU3JXUFhZN1EzUC95YW9x?=
 =?utf-8?B?OE5aTEJ2Z01oVy9QaytjSFRHTG44eVZONCt0YlVWTkV1SUIrNHNjZEhwbU4x?=
 =?utf-8?B?b3VtU1VpQmcwU0NrL1ZYeGNHWWJBRDljNk4rV3F6ZkwrWS9Vc3NncWNnTVZG?=
 =?utf-8?B?SSs5Q2lMVXM0aTEraitlSVRiUUM2OWRMMk9XYmdLN3Qwejd0ekhyZUtYRlJu?=
 =?utf-8?B?WitXa1U5OEN6OVU0cXVNOGQyb1dHUnRwQVcwaHlIVlBsTm8vaXZ1U1g3NmFB?=
 =?utf-8?B?cmZrMENjR2psN3hBRTdDbWtYWkIxSUx5b0Racm92RWhwWkpOWjBUNEwzVUtu?=
 =?utf-8?B?QllQU2JOanBLaUx0cW8ybmJBdmdHeDJ3ZTc3bFczblFlTXB4WEFKSXJlYjh1?=
 =?utf-8?B?S1MvS2pWMDByVjhvdUFVaXFwTGxic1JqSWlBSDJpcW9WbmdNTitIU1pxaHcv?=
 =?utf-8?B?c2lhdFo5U2NMQmZlRTVZTTlrMHBRZGZlVVZVWCtJcjEzNFYrYjQ4eDhmWUY2?=
 =?utf-8?B?SGxRUHQ4bm1mT2JDOWFaMmcyenRSU0I0S20xd0w1TWN6dUdiUE16Um00ZnJ3?=
 =?utf-8?B?OVp3c29rdXAwUmVhbitPeHhZMEVXd3BpYVdBV1IwY2NQVi9XYVQ2TDYyblp2?=
 =?utf-8?B?Vmh3SUZ2N3lLeWJBYzBPMWtYSWt4Qy9rNXJLSzl2NTVoRzRaYmVUOUNyLzdN?=
 =?utf-8?B?ajRITVUxTVp2bmFLZTM3bitBYysvZ1RmWHYycks3ZVo3T0dzL3MwMWhjWTZk?=
 =?utf-8?B?akUyQTJ4RXZYempVU2ZRYzE2VTZPTHNzcVNXK2I5a1lZRjNRdlk3V3lEVUxV?=
 =?utf-8?B?UW04RWVhemJYWkZUV2h5SG0vaUhNSm5kc1JDaW04TmFaQkxNbmNXcEc0bWN1?=
 =?utf-8?B?QVMyeExNMnZZVytLdHFOTndJS2hBSVk0V2NIcFVoR0paa0RybVluVFcxb1dq?=
 =?utf-8?B?eHFLMHBzeDBXdS9MR01qaXJGOHpLMjdzQTNJenl1TFlTWW1xT2JvTXZycHh2?=
 =?utf-8?B?Um9nS1R5cHFNekFhamdKNWtXWWZHcE94Zyt3elQ2bGplSzlVcG9EODRNYjdD?=
 =?utf-8?B?K2dXVC9ZbUVFZmJhOTBGRGV3a1VxTCttZndlMldHcGI2by9pRzY4dHQ5ZkFQ?=
 =?utf-8?B?MlYwSkRaalBNNis5SWJ5Zm9iUWVnYlVTTWl3d1g3cnlYcXBkZElzWSszSk9h?=
 =?utf-8?B?UG5GRDQwTkhLWVRGY3RleTRXY09TVENFRVk0QXY3cVQvZlJuQjducEdiY0NU?=
 =?utf-8?B?aWdJTjEwZnhnWU4zOXNqb3BPVlVmT3FEZ1dJQkNBaldLRGFFOFMrc242K3Jk?=
 =?utf-8?B?eGhmbkxLcHVzblNiRUxlaW1raThtZ3VnYWRDeEdJazJ4R1Zrbk9YRW9xOE0z?=
 =?utf-8?B?R3NVSEtWS0FuZktIYXJzOUI1cXowZktDazMzWWVMVyszWlFnNHo3OXl0UWNs?=
 =?utf-8?B?bHRpRFl1UW1IZEZzamoyZlRCNmE3dUJlTzI2allLZGVRREJPN3kyQmNsdWoz?=
 =?utf-8?B?ckg2NHIwOHJZNEFzd3VJd0ZSK3VSdk9WVE1ZOGpVYWVvOU05THg0S2RXOWZZ?=
 =?utf-8?B?ZVdzS2JxQVNkaE5nYjA5Nm9XeExFd3BYYzAzR2xNeEVLT0V3UCtxcXl2L3M4?=
 =?utf-8?B?SW5GZjVHVC9lVHd6d2NuMjFjVVBSdCtvVi9hSmhLeWQrc2J3VnUrbXNPZ0Za?=
 =?utf-8?B?UGRwV0g0Y2xSMWovYVJLQU9vdW1GYTk2MndaLytkZzB5RmdYVE1lbjk2K2xS?=
 =?utf-8?B?OStHQjFLMEJ5OG0xSVdxKzJUNGZLdHRQaWErQTNNbnpCZHQxMVlSNUtRaWp6?=
 =?utf-8?B?cGdLY21lSE5JQTdEb3BZL2VDeWJEWmJzTjZzUVVYSmQvWG83dGN2TnBqZWZx?=
 =?utf-8?B?MlNHZzc4VjBocFlXSG1QU1FIZjluemltMDlGc1VyMkJacVhZU0MwOFRDTWFo?=
 =?utf-8?B?bG1QT3NHaTBFbit2S1lrcW00SnhCWTh3dGNNZzU0U1M3UG5sTHBVTnkxaFFs?=
 =?utf-8?B?RzRDeE55dDFQM2wzMk5acURTakFHNER6RkFxN1BYNnJRTU5wNXpMWGRkdXZV?=
 =?utf-8?B?dTNBVnFEVEhRaTlvNTVQRmVja0pMTDlMSSs5S1dBbDR2ak1hY3ZNSERiR1dU?=
 =?utf-8?B?SEhha1ZkVWpCUytWay8xZ2xMNmw4Z2dJa1dxQkNnZlBES24vK2xWZFpPVThn?=
 =?utf-8?Q?THz1UHRbC8XVqFCQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	mGS8m19UTHYQSjPde39zY21sgoD4w/NOHyVd87IZo8OZdJp1fqFUs20ejJMU5eeC5rtD5295B2a49ATm0JXiNanD9nz/KBzkyK1z1AoCwW6onwdcd3s+gvBCv0FOw+AhEveustXUFhLKx8BKEjLPwY0b7mp0YTKrOCrxG2tiFi5pk3VoA8p5tju4vOLTHM7E3TouHNB7Iic/3/pEVGgfnsTsTV4/dUbc8YF0rfYbVwUi5z84YmLfQv4FmaR4LlMQ0ScTBvWZYJLutej529c/dzEzTEOd5f+RqnZ6+i70BHqn+XE9pq1ROym2W7ZwTSDMGSgHSh3oyJwT4DItBw3G1A==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d902d32d-e955-43bb-a71a-08de9c31f8b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 03:32:37.2343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: et/LPd3BB7SQqMsS9wC1h/FgBFF9NsEOH+0/cXK6O7avYBwf/X/tv70s0whVgRGxe5BQrmIZdNMm+bMsCzZUm8YAl82pze6WaKUcvhjYLpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8183
X-Proofpoint-GUID: vH0WOSjNRV-xXP-iwNsT9qIRjlTstIdj
X-Authority-Analysis: v=2.4 cv=KIZqylFo c=1 sm=1 tr=0 ts=69e1a9d7 cx=c_pps
 a=4uekZJdLSFpbpqOwIdQ1dA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=fKdYXS8PF-zz7EGT6f8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDAzMiBTYWx0ZWRfXxySlJNFhG9N+
 LS1NrIXkHwGr8Z82TZ6bAnGPx84VSm3a03RMhOkaxctLTZy1mWI7LBkGlYFnSyIhRumAyb8jjJP
 8fNPugpD3+DhTUu8+9yivzMjQMyGM8oRSlo60cME0vzdafe5FkXVEY8fQpn45t8+sqMJJUjRFOP
 NSGbN+qyNxcIeKima1zUuRi7fSZcgnhDV/HukMycQfvj8cFhTJ9HXsQp4Wm+0KLLSG2TdH/0pC0
 8JEanJN9szJtfxpsuXQOHA8pDdzfTYwAkM5VSyjTiz4sYZa2Uj8NXMItIYbMQuJwpVGRzW2eCBJ
 4C2Cwh4LvcxYCczVR8OFF6iaGzs0tX2sbPxr+d5cTx+YSo2akKnErw5AeuC88xkB4c2rlmc5cgy
 LWNKOx32TAPkxRW0GA0XkCeQBMbMZM5BCc17ttSkQucvBbLnW4vlRTS9F4Rc/4lis7RIC8vLBvw
 T1uNa7E4mAB3tGUXBxw==
X-Proofpoint-ORIG-GUID: vH0WOSjNRV-xXP-iwNsT9qIRjlTstIdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170032

DQo+ID4+DQo+ID4+IEl0J3MgYW4gb3V0cHV0IG9uIHRoaXMgZGV2aWNlIHNlZW1pbmdseS4gSSBk
b24ndCBjYXJlIGlmIHRoZSBkcml2ZXINCj4gPj4gaWdub3JlcyBpdCwgYnV0IGZvciBjb21wbGV0
ZW5lc3MgKGFuZCB3ZSBsaWtlIGNvbXBsZXRlbmVzcyB3aXRoDQo+ID4+IGJpbmRpbmdzKSBJIHRo
aW5rIGl0IHNob3VsZCBiZSBkb2N1bWVudGVkIGFzIGFuIGludGVycnVwdCBvciBncGlvLg0KPiA+
DQo+ID4gQWxyaWdodCwgSSdsbCBhZGQgaXQgYXMgYW4gaW50ZXJydXB0OiBvcHRpb25hbCBwb3dl
ci1nb29kIHNpZ25hbA0KPiA+DQo+IA0KPiBVdWgsIHRoYXQgcmVhbGx5IGRvZXNuJ3QgbWFrZSBh
bnkgc2Vuc2UuIFBsZWFzZSBhdCBsZWFzdCBtYWtlIGl0IGEgZ3BpbyBwaW4sDQo+IG1hdGNoaW5n
IHB3ci1nb29kLWdwaW9zIG9mIHRpLHRwczY1MTg1LnlhbWwuDQo+IA0KDQpJIHNlZSwgd2lsbCBk
by4NCg==
