Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD923BB69E;
	Tue, 30 Jun 2026 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806881; cv=fail; b=M+qMeKoY/AZZHuh6B3zUVIdOZELWDkBPjcv7VXb7gnH7o/DUJAr58dQAwqSAXW8LQpHDCd1hQeL4S82FsT6PVCuP7IvyCsBbGgYzpgdRDUOcxY3dHNvsSsE79D+0LI6BgSV1LfcAjBFvsbMixo2GJNDUe44J0sAVyeRC0jw5uXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806881; c=relaxed/simple;
	bh=6GmKtYhi57fuluwx1i+v7OvuZ6GuO87bPFqQJZKeB9E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nlzg1A1/AA7QxB1CDlNWuW/+EtUohhjtqKKT8KZIF3Gr56Ekp+x0rGAAYy5uhHOAg8ui4HKmT7h7X8gOdjs/nbNjvP2Z8S/nEgakMD08rErM/x9cxYxF4hUeSUnZmP46+YyjAVSrVlGjt9XDoIkAlEutIYtSo7ldlMw4LIG781I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NiPxBWu8; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NiPxBWu8"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5iB0R3988098;
	Tue, 30 Jun 2026 04:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=AE+Lj
	DFhfXOGCn3te5NMwm7V4nKSES+9JGBwBYzBWWM=; b=NiPxBWu87yJv2rIT0Vcro
	30WAy8Q2evAEtwl0SM72WkxBZ2eyyJfo0wDqfs5JVpcozKu/iN7Pc/fifhht4df3
	W8QvJ94bnsFriRlvQJ4m6T8t4qkAsK13NT/8JLujEFTqZjK4AsBqdSr3etjMXdrS
	H5x8YG5ez0tqAzWNyiFvsW1bg0fnmlprCIcxVRWR5Gt8bh/1BshxC181b+N3BLDQ
	RJNt+sFoQ5zMs4cSoYkLfiZ62JrTU30Yg8+c0U1QkcVXeyuTCp/F2vxJYWbtvjQF
	h7q61B9u1xWPkkC1Xvfp/LrbA+6RqhdWn8zuQR2fadrbupB8lG16Xz4QqYt1chIC
	A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012014.outbound.protection.outlook.com [40.93.195.14])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f47wpgnkc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 04:07:31 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjze/qEWXRbwkOBynCOs3XWR9FE6wVwlIB1qQJ+gzbA8hvihYRiF6qi6995/hiK5VrgE//05EZdBIJbCEDcvBU/O+ApweqK4OLEH0eLBKzzVtzExfSfTKs99sQjJUnvrhQNVZosVTjBxxnPnYF+K0qXeKPBwawKVLAOwc4d+5eUCcgh6Ak76Y+NWBqBPfZ4NI8clQljI52rlfiOuyM4MuShcmcbC5u+TXsjB/9ogS3NRRcXwwEIT7XdtI+NuLfhFtCU7gf94LPSgddrNlWc4ITJ/0PqeroauqF/wfOlhQx43dt0Ym4OxS+3/5sPTKS344S/eHCAbife+1nnBSBqbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AE+LjDFhfXOGCn3te5NMwm7V4nKSES+9JGBwBYzBWWM=;
 b=LUZTNYPdfSKwMLP2TS6m05NQGwiF8lTvJE6JgzJ7hA3x7DMUp3Mn10cx28NjH4ZxeOYg5qLq3NszOULgOKQOujNrSpVwUuh5fm7nn1Bm/K7mWDVDjOlxKiCOk6VqtHwF7YgILL+Hc3u4d0S4l+acdGOUDV51VcqpJuE088predmWgyzdgCcSUqLGpfVpW+9WgtcUKlmXT0DADIR3vSk1rktdU9YMjhq9tY0xZQ6vSTo+0NpuevNjF3k2kjAJKqEUryCXKRmgWpcq7LF+kC+PZYYKb9zI8j7efWT0ITLuFX71jagtWQLYS171hwhkpU1HCCttEPwSEl6rlCL5dkdRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7214.namprd03.prod.outlook.com (2603:10b6:a03:530::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:07:27 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:07:27 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 5/6] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Thread-Topic: [PATCH 5/6] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Thread-Index: AQHdCDrV9DcJHzJAJkShiqvkOjk0BLZWt0GAgAADMOA=
Date: Tue, 30 Jun 2026 08:07:27 +0000
Message-ID:
 <PH0PR03MB63512440FF07E171477CD42BF1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-5-a02786bde470@analog.com>
 <20260630-gerbil-of-phenomenal-jest-4dce8b@quoll>
In-Reply-To: <20260630-gerbil-of-phenomenal-jest-4dce8b@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7214:EE_
x-ms-office365-filtering-correlation-id: 4a4aadd5-8158-4543-2b13-08ded67ea05a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|22082099003|4143699003|11063799006|18002099003|56012099006;
x-microsoft-antispam-message-info:
 2uxJz6ItJT6a1X9SItd9XQ90mEbwg4yjf3mpd3bgLrOso/i0vaUVPqKPUcoiED3hnbI8lr6JPk7ERVfR8yi02TgmvDdXTFUaGKhGhDPg0w26HDxWIMmxm7chr4dmGNOP1JZQjkDmlxSTb5GEdkXKy7EAR1VvlByWdbTlHpuvio+eAziLI95VPy9xOUlWftyW6+iqOw8w+yVcP5GreAJ9wgParmLipCN3sCPl9JZStgy8Avn/c4rC7vA2rMtL8w7luTwAmIS1+ij2UWSMKM9OmK/WdjC0nQhirG8BujL6FeEfPEaVAu+nGUSQTePwYs9Zp5be3gencw1qsxD50K3WDq7cDCsIFLxXNi9CIEPOHH7+y6mFHlvfVzPSKzQI3M9ptq3glXQa2aWoBStHF2z8uZo+PJAddC3hDDuIfpFbvwXF9s1ApO5I7xinoOClpIcOkd82hH1OznO0h2uGizmtSk4JiXSYpUXlgfrDg/qqrzv26oU+z9h8H9vwj4QbQOAWsyWFYDXow5CJxWpW2vwAT2HmI5P1SriPBUGugDwDig2JhcHGsceH+/9Wf9afIX8+F2P+ouRZ51ZSLy6C+2W0x76fAg4o0HF+WgYPcyXfuwBSrb9N6fLgfbveDdw/wecCeX93VyfntXiGE797ahq3MJG8JwAsRDyGHKIr4LwHmy5FDpu2cs/X2cWzoxXucBtXCI5TdyKVe2kzzB6EOVDnkYUKCtKCG5In6exw0H69yi4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(22082099003)(4143699003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?l6hKQ6tNG74L5xpXjnnltUUKM3npTCE6Xkdt4tI4n8bBbyCe0cxlhA7mX3sj?=
 =?us-ascii?Q?WKPdNkuXREtJXP3qTVrkh+jmkSAhLNO6mRyIR6QY0tBHqre27SLqtdDJVzMf?=
 =?us-ascii?Q?O46F/ig70uBJO8C4K6ziFpJMV5uBmOGSxf+h/21II2ky4fImIDmhbPgh7kR4?=
 =?us-ascii?Q?1HaoyMmNUrdHxfCCKh8Wy+OYEzF+z0eGYleqjj+EIMheOqbTcOg/34wGNqjR?=
 =?us-ascii?Q?VO9URL+l7EYkgedM2baTUYLap2/RxTJ0QpZwQv4gWyNk/WNZb3OHLkp4v9AP?=
 =?us-ascii?Q?k/jhORh6rAVo6Ij2eYuQpCMfqF27V+UPuZ3HxbqWvdkFFwbGfbOL5Qi/omlC?=
 =?us-ascii?Q?tTF8FlQsmGctK8zxU2bav5vLz1QSpBBugZBzPzOfP03cSXZnd6OmVCCln7/z?=
 =?us-ascii?Q?jtGn5/E80HnepkrsRtuPBA5Ilgom1ZKd8jNiUErBypculsphad7sy52SLBuG?=
 =?us-ascii?Q?AeoDK1WGZvUmAxcbXPhS8bgCYuQEGaf8pHreozjPrZVKPIW/Hyz98EhW5t5g?=
 =?us-ascii?Q?wsCf1/1N+Wn7HhCXzP7Tm1sXzaBQd+LwRXThAHwjw3X4XiJhAIJmkQ9AKVKG?=
 =?us-ascii?Q?3tsP8Et39DxK4mcUWf308i3PdfUJSe5sZLsjPxAbv6+430maxXCy2mni6MO2?=
 =?us-ascii?Q?axJ0BKPQpMRIKNsNHC7JAF7+wOWQIHxS3ZuNJgPB1PHLM1/+xnaFhG1TWE2D?=
 =?us-ascii?Q?qIZLMxPmyzuQpj4f/qJtqnYeuAlZPsLiK/gNnT/gjKs0oTpOznNBwZJB4J5d?=
 =?us-ascii?Q?xv3QjzjU2fkoUbxoypjkJK5R+Rj0bq4pSViJu+yRhqPI54gQfRHXAKeo5uyt?=
 =?us-ascii?Q?AtlUu8FHD01NBd1kFzKd2mWxdfKiFpPp27cdHCMAY2Z/rsVuHdvwHgzOUlEf?=
 =?us-ascii?Q?RgGnVbP1ghkh9CFPZIFPdqAS16GDz8DLcMZ5jNiYJA9LblsyidnVL0WLNain?=
 =?us-ascii?Q?XiGa2uBPhc7GRjH6TcqOyvjLLyPk/ObJhYEFwM16c+iYZi8CkAlRZsP5qXw6?=
 =?us-ascii?Q?QRvxOqzoVKwOxWM3ji5DdREXTNTzfHDeeOa1uZ45Sc6hZ0/i4y2uzh5S9nIi?=
 =?us-ascii?Q?1zcGMSD2qONLhD/VeYDkuhh7FNGG4iGLDMEQprfUuxD44AsR5SIazmWZhU58?=
 =?us-ascii?Q?tZOcn1ahh+whCvrV9ZLrkfXa2zbwn38zYr6S7x/bITtwWNhZVD5wdwFHKfNR?=
 =?us-ascii?Q?6y0XtUCQ1dfvy5Xe/QP7MOPBoR3UwKmqbNBv+h1Lo/yitWi+Iq/BeLzznQuF?=
 =?us-ascii?Q?wsXKtSikgYse5TJpsxKSa7Kul1gc6U6lYjJFPycfQ8ivGQbjhhcUBQtZNqRQ?=
 =?us-ascii?Q?3/MFyqwKfcuD3zKgB+/TA4oKji3iDamRRGHHMe92S8ospS2AIMtLCTBdBg/X?=
 =?us-ascii?Q?Wu2ptD2/DnkzBsxQ4XAuxg/+mUVKlzDIa6yIIXS0G4JI90lg9YVLt9PnmFds?=
 =?us-ascii?Q?37nsl+ySdS0nvMsUA6OzMC6+Mv4uJkvw5lCb6lo8IKteblPeRR1eUDDNLEh5?=
 =?us-ascii?Q?zdw59c/xEnyfLrldHhfYd1OtMxzWyhezmLnccjET8ksEsaeTAiiAq5BRq7XP?=
 =?us-ascii?Q?RfN1mcrR/NsDRQYBE5MH3xmQ1cf/aq/2sCdkxWEtwhjzLNz6Egp2b9BuOKUb?=
 =?us-ascii?Q?IQbY177WmLScVC5KRU4kG59AtrLLheYP9isPhtzKRG3zgkYTisbDeJYGLLlf?=
 =?us-ascii?Q?C27nqv15Mm7XdqqAaa9ARILK7Xi3FaauP2n1AKmFRIacDOcw7/lO3igpEYJu?=
 =?us-ascii?Q?LxvYN108AKrmdhN8QVUnDFjSskH5lPU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	VrqfvSywe68cKzOt7Le/LiDqBN41pipyffQc0GHRpMFfztd0o6QBpzefpMZAmL2sYw/rpuvxIo2D4uFylycQ6cwrR9f1pgOZehxP4JRSpcjzGuQieIEu+QftkSV9UAb3YAshjlQD+c2mB0/O3JZpT2J434CqHTcNRdhrSRD9FivLy0o6peNixB288P/RdVJmsQPmHPGAD6XcAQOPnKUDR0c8J2grfZeG9VuyLWQW5CBI37Yttar3H5v9R8gzVsaO41cLmurnjQ9ii4gqQPoxxxC6B/mxna2345wck+wIxYTb7s80FTsRckyK03245u7t0ISDxtI977RUApDNoDP4rA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4aadd5-8158-4543-2b13-08ded67ea05a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 08:07:27.7123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0k5DrliynGK3/OfQeMiWriH0cbls0Zq7sJg9m+++WBJ6COfXmdd5IOOk3qyIxzCw1/KO8/VPSJzvSqaaMCfPvr5Sc41OzwXgGHJCIKDTqWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7214
X-Authority-Analysis: v=2.4 cv=UoRT8ewB c=1 sm=1 tr=0 ts=6a437943 cx=c_pps
 a=C5q/T6pJLpFJxMBEEzTjbA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=X4gfy60VziH7o14k9qoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 60i90cH12UjK4-OM9_h3oSBCYcq7PV5P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX+d8UPLKYFE2c
 W2b7ke+ygQWOwaXczuqWW9HIjO06T6ezq/WVvwpJ/OLJ7jfQ+fIUwQnq+Xgh0IVjBNRJzSXOjD5
 6lKaXtqo5uDP5oz32ELJu5qQJGhdTwVtqQwYYD/4wP8dUGKjmlGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX6KIIRHuzgGZd
 T3C8OGmruOwpswWi3tLlInOS/B4+9YqzCpn/f8J/1BVKVYv9LEICQX+hISQszWUKTO9sykWflYf
 Y7YWR6147Q+hkxtKlQCc+Jglkz5VLzxWgkRrUx8ms9QIzDjaUGtvrANGBGMpbUGLBJlP0yzeTYf
 iiFCGQlU7nYHGN/xOBRH+amSFcA7AukblDt++nOJlxITxkBRcdz6+idfwjlLtGKvY8CvGRb+LZn
 8qqULjHK58MCud56bcEk4lXXtFCO3Yp8dBbtkc6g1Lzbaa9f3N/6Yt1LNCmRT1YZMQqUH5Exqv4
 jqfc4l9UKrCjd1+/DvtHRq0aP+PEuGIIDEq7PSuX2NuATERnNXNTabMKXey9OpnB4lZYHcVo726
 fVw0uEXUQS1vHsRPPlCrVvDeb7JDXe3gwf3YlKCz9vD0x84LaRAaG/Uo0KbhRAhg1JT5EIDvXtI
 JlzYxVXpqpbjVxyObuA==
X-Proofpoint-GUID: 60i90cH12UjK4-OM9_h3oSBCYcq7PV5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300070


> >
> >  properties:
> >    compatible:
> > -    const: adi,max20830
> > +    oneOf:
> > +      - const: adi,max20830
> > +      - items:
> > +          - enum:
> > +              - adi,max20830c
> > +              - adi,max20840c
> > +          - const: adi,max20830  # Fallback compatible
>=20
> Drop the comment, it is obvious. Can this be not a fallback compatible?
>=20

After considering the feedback from patch 6/6 regarding this fallback, I th=
ink I
would not make this fallback compatible. Will edit out.

Regards,
Alexis
