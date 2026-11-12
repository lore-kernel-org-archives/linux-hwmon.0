Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474339;
	b=fJutowB2vUEQt1qQ0viy/3fxBfkiPZW52BNEK2IeGia5BEsxCE18jD4pcRsBC1yRQoi2
	 lsX8NCs66qupVNGId5RKmXp8jlqpeM4P5d3oS3MkZruACJ1Fq39cMsZIbkU88eVbZREn8
	 umb9u5VNqNvXR+7qWBMUfnwRB58uNuuHB3pNrbGcdjD/PeesraHoaCLg7SW+bJszuWmzx
	 SK8tI3xr3YpcY6YakpAXlS68MRTaqisYxfpxniib2RxnEnlE5Hrpz+pXtuHm/gFbD5kGq
	 2QHg66Gg85vmmLzFyeZZ8l6YL8Y74yt5SDoVVR12GPQrHRDfrgUc+I/GBT0tdT0Kf+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XpgTR3j74wFiTCZExv6XPL9kLDV5uMEPJ3TGZ7EUhjU=;
	b=Qhod9TlINoszE+BYwTgk/Zw4hXyryvSqX0YbbZq160LPE9O6ccdOUsb+Ggwz7sGNL8z9
	 dHk2YQssmMVrUy0mVaqQRa3CT6KlZSxYQo5d7uy/xUtP+BhzwZo6JeX/m9fwu+paUeSds
	 7yzil2D5AovAGsLlxtyNu/gRRn+k5R/837KW6wvbMhLe7Mnyvib22hIHUupgVdTLtqswo
	 8nuBoXkmZZeSNmvdf/M4nxslAo0m9/5bjsiwep8CX8W7EqIPzROjzLq2Y1KBM+BGKt2Mo
	 rCwk+pIiSQMaaGdYJ0NEVniL5MXfxg6DXd7Wu2OWyXksYCxlrffrqXmuZOuZPo06i2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=hwyM2hL1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.104
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9141D606A333
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 09:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9141D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=hwyM2hL1
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8hB4B2573786;
	Thu, 12 Nov 2026 09:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=XpgTR3j74wFiTCZExv6XPL9kLDV5uMEPJ3TGZ7EUhjU=; b=hwyM2hL1bWOC
	p/PBYHl0jRXcs89qfnNSinrwfEz2N52mqjXmvsccwMppvUasJQiWzompUJx8ZXx5
	/D9JEk9rFqFyPVtmAYTFk/2QrlNBZwlAVEu+ZBSQYYQ2MYQ2sJJ4CY6pspqVt9Ym
	3MrEb4X7L8F658UQ2VWQKcP8Fw2vwMhEtJ0C7fRbwnJSKgKCpMGanVuBmtUS81yV
	4QmF35ZRmUL0khdNAXjrZ4qRk54AiRDMpjyPUQS4U2MT3XUFL6RI6/86uZlli2RJ
	LT3YVSMZeQFbxIeAy/twUZFZcNRKbvHM/aX7EYu0ya8DbmJxeLZ2BdVv7VCtYDqw
	JTVZ6bOuYQ==
Received: from tydpr03cu002.outbound.protection.outlook.com (mail-japaneastazon11013062.outbound.protection.outlook.com [52.101.127.62])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4htjgg841b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 09:05:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYyIDvQEJgPBPSv7xGpSB5ZSX37VnbQnLt5zg1lHG0we+eJsFFmggHvif1vHntfQ+hrwmX8pTLPziUWdhMuCphYSqd/wyV5u+kNqfjD5uQqXrV+9lktEprqMi+G146mZkDJp5WLTMAjNFT23YdnZIM6RhQNPqmOVBRRpCoYSwLXFT1VmJg1cffJAgMSpUmqDTwdaRdpw4ksSocmasw0Ac8x7B+RVUaBaHniHrvRTmhV2Q6DoMbsG+KnrMlJtSPQ+NKXncYl1Kb1fSiqR/ms8wmbfSlaZycoVi3mDvkRZ9/ZzsXFTCnjrQM5rbmO3WYQCj3FbhhzxwEZkI9PTmaHsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpgTR3j74wFiTCZExv6XPL9kLDV5uMEPJ3TGZ7EUhjU=;
 b=lZhIHeo7moT+Xm1Slk8QNEySCHdpkxZDjDJQ35sEu3d+6Rbv5hmC1Kr00kbwAnzh1tVurpo9NxF+yp1Fwmfm81ZG+EJeVCwYTl8tvUyUjX3dgCww12DyGuj40UNtlB/9Cz8thvielpsesTxcDZZCj32DWhhPbhs20y/2/uOvYIJ/Xsv36Ekx/PFwJPPa1b+zzSkzMc9kEEKqFUqulQ4t8cuDfHIwWGgHFZXSkQJ0z90RJXIrvbmFFALpoTh3pUzpXyXrer6As+gbTe3iwtWTmEFKwhATwsog9qRJ1DUBuEoa3R96B1uXZ/5+grRQTD/CVdochOZVT7zDZyjSe2QfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by SE2PPF7BA6A63F0.apcprd03.prod.outlook.com (2603:1096:108:1::49d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 12 Nov
 2026 09:05:21 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 09:05:21 +0000
From: Jiqi JQ9 Li <lijq9@lenovo.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
CC: "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [External] Re: [PATCH v1 0/2] hwmon: Add NCT6801D EC sensor
 support for Lenovo workstations
Thread-Topic: [External] Re: [PATCH v1 0/2] hwmon: Add NCT6801D EC sensor
 support for Lenovo workstations
Thread-Index: AQHdcbz02JhXe767n0GzsbCvm0ma07cpCnuAgAEWLDs=
Date: Thu, 12 Nov 2026 09:05:21 +0000
Message-ID:
 <JH0PR03MB863700C4D8896677F2876B1783702@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20261111091338.799889-1-lijq9@lenovo.com>
 <a94c7358-d1f0-4de8-9e77-2d50a47cb8ff@roeck-us.net>
In-Reply-To: <a94c7358-d1f0-4de8-9e77-2d50a47cb8ff@roeck-us.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lenovo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|SE2PPF7BA6A63F0:EE_
x-ms-office365-filtering-correlation-id: 462d4bfc-00be-4eb9-be30-08df409c149c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|22082099003|18002099003|6133799003|10067099003|38070700021|4143699003|5023799004|261102123227099003|261022105027099003|261009223027099003|261021123027099003|261028144727099003|261026121527099003|56012099006|261022075727099003|261026140227099003|261021121427099003;
x-microsoft-antispam-message-info:
 xBAdXmGnyI8Ldymz8pFyzcjZ1+3XyP5PH5aEERpoNIQ1of9dU8AO/Z9O4EQYLHXK60blPkeTBeHUPTwlVXxkkzQgiK+a2fAoiUBoj+9xs960LFIlfZVoWAUWmUI1e0cVx+z5VxiFsof0/lYsIvf5O4vHBIa/8ZC7qref6ZBapx78GMYJdOxNu67eZKfbZXgQFv8yCWvtHlAiJQNfUDgd45/cEM6HnVe/eUe1x46+0LtCFFsAgwf2IPgsKUrtnVVjhq52LqVa5gZRTzSnPcswpqY6tvK5g4sDII0PdcGfQHH5XRNOhXhrYVHvq+5Rs0A8ltNRGf6YozznNeRvesBkm30i9E2hqNi3eVNvtqtFm7LI+i1vfZf10TegnSg4a1252mGyxOM3NlmkbsfwEfqO66xfYxqxQzA+JOqC+7lFmgKVvvqRVg1DsP2TBkdKcnRqVLHVyn8aAq134EdHzqL9K0OgAnko7lK6yA5xdnAHXBcsRN9xnUKQ9pH2oFbo1Gkv6F9mz0ZuKI9kOnIkdRkLPfk0TjovMutOaOYYFhLi4sX2KSdyxqCI4D5VZ1ne8mX/PeAMSsNxIIdEC95r+9rbSYL2dihU56GE2rezFlP4HU1ksudFk1UX/PfFgd/sK/aHLLXKGJB6+LYDuobwgICdsW40zeLTGdInZKyJmVjnyEhj5r4mphxxp5VPN/d83Ebq9TLy/qUZIyBqfkrlwcR9CE9x1R5ytK7dn5S9E4Zxujc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003)(38070700021)(4143699003)(5023799004)(261102123227099003)(261022105027099003)(261009223027099003)(261021123027099003)(261028144727099003)(261026121527099003)(56012099006)(261022075727099003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c+ts2/uUtwAup5QOOi7KgDLzvSSiZx4e+NUxUyDAnu/rR0bca5Cjn3+EXS?=
 =?iso-8859-1?Q?iVpEzzIOZ3VYbGaqwoaJd1du4LhZNbyiElqhtxgXXyNgHcEtbvwlwa9nOx?=
 =?iso-8859-1?Q?2u0BdiBEnWTcwVP9U8XMux7Ur0lqdjyWHClzWHwGypSbjarwuEjeNETrAl?=
 =?iso-8859-1?Q?F1jixHFvx0cU+IGxk4Q00WSqvJPW5HurNDmFqiho3o95ZOJymQfoE+ECEG?=
 =?iso-8859-1?Q?ARWNS9zD0+vlriOjyvd3UsmxomIN5s49tT6vRzNfIexV5QwTj7HN8oKuzJ?=
 =?iso-8859-1?Q?Qp5dYeeLMjnGTfh57ciZtg1doSC4Y7ixy0+y1W2duD07AcTIv2/2O25pwU?=
 =?iso-8859-1?Q?n10ZDKDK4BYDnPvx6WXmGY60+Pb1wxolJlrMyDNI5ylFgWIAkbjFjiWhpi?=
 =?iso-8859-1?Q?pVitLTKtD5hgyPBI1kPBNjTpzBP66HeNUgePlH6qnA0RJFfNsJAc+OyYVF?=
 =?iso-8859-1?Q?Qc5JibZ0kzAen8ACozw3cvOzZn9JwJurCER/IZ/n6aiGCowr1eexQqOgo1?=
 =?iso-8859-1?Q?5iPAc8a6iXEKNNEVPaCKzG5Kpax4MI0ZiZcq75KzOuKixr78MBUi/7uWXf?=
 =?iso-8859-1?Q?DHniwfVr5uKYIQ+l5jIfTVcld7K2q9uxs/uTBredbQnqIZCyJhO7SRkIkM?=
 =?iso-8859-1?Q?/YFMaFe9V5G1JZexWvOnr8r46xfLUMpdORYI8lrDDWIX6+DJhgQ0V1hwnS?=
 =?iso-8859-1?Q?Xl7QDiFuO1wTY9a6I9eMedrRlTN5tk7Cp31rrqxpdvgDJ/UDdOiMwd1e2d?=
 =?iso-8859-1?Q?/MVUbbxZcQ9T3iJO5opmzBJY+AUTj2KER5YtZd6cMafYcj+rTl7j+d7h8a?=
 =?iso-8859-1?Q?ZipwDZlJxQ5D4n+KjR2In7ECIMhFyYPT2FsvakC3DRyBeRB28UtrvAUDzY?=
 =?iso-8859-1?Q?CmStJ6ENyUdUZ9aHpHnashfAIDZEOaM0TZv/3pHPOoQKp8jPAtGrbAVceD?=
 =?iso-8859-1?Q?gIeKZgUdEruvo/S9rfwjS1PnUeQDeCd1Yl4RcJKenMRjVSjJdZqC43B3I4?=
 =?iso-8859-1?Q?NFXOaV70Ob40Cr5zd1u5heJIOzQemNS8aXwZVJ3qf/eev1erIRrrrEXGLu?=
 =?iso-8859-1?Q?J8eqV8yRRzYxIvlbTl9AQfWj9E2vpk5VkMF8Kxt1LHtICfEJLbqCFB+4F5?=
 =?iso-8859-1?Q?2QWoX2ikXEiDIDtXLzGLtk4RzMHNuUsofgxg5TlfpC0yV25Utzae7HEduL?=
 =?iso-8859-1?Q?A5jcPmQg9DW0nfvi0v+aS5iEK1/IRvjryyiqHhIyGl6bxEhJeQw7kNLckN?=
 =?iso-8859-1?Q?GvNA6G9TQff0utJe4cCg4NIcage5NqQMVdBgJYqdRJS5s9EtOlhFj8OnYs?=
 =?iso-8859-1?Q?zPs2F14RriaiRbkvKIsWiV62hAtwZPCN8yghbIgFK2snw7PUnQhypWpJlh?=
 =?iso-8859-1?Q?B6oMt0mdcWV3n/pwDhIRS+IgP5iDLdjFzVrAjq6VtTOl8noo7W62DizM6q?=
 =?iso-8859-1?Q?PvQQqgTkM/glhehk/IUpHvOljMuOZJRzx9H7Y0UWEjM24qardHANXoVCpM?=
 =?iso-8859-1?Q?174QDbi2u1vTcEfUvlGrmjLRqc8rc/9ltQlUzOaVnqJtoxsca1mACIhepZ?=
 =?iso-8859-1?Q?Ab4CXHPjgsMnI3PODJlIHQO0S+jlAOBrQCSdv6yc1zccXNLPl/DVop2G1Y?=
 =?iso-8859-1?Q?ydC1MdfokBjh4MfQwCSxC+p8+p1qsOgDF6ojE4WhSZOv0bD3l5UCULmZz5?=
 =?iso-8859-1?Q?5vJ3zi3Qg8hy53ClKkxOEpYE0Iw2YgPFFFAitJ9/b1x7Eq5AlPgncHY6wg?=
 =?iso-8859-1?Q?k/qr5zfMZbqq02mw8nyAbFSNIQN17OopLVu4HAcxdw/giG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	p/jTDsLY+M7Pq+2cyfQJj+iLqN9bLPVVRAxbarZceVZ0wgauNx6QsXyLEk42Og0gd+LT9RQ1G+cx+7kCl1woeqTdYnPdpgfXLZVbpNdtGhJILX1i1JQJMMzx64EmTMh5ASJd0MAQpJ7xEOQI4Mpfm+hizPV9ZkDobinc4KBltJ19FlmAL/830x08mZdbYiLxdLhfHuKFQtlE5zOPrrVt+vzd2u1PBbJdPDIBwMln7qSORjod2jDPvu+cfyFBzKGzamK3liDIYeuUSvzdNNKoECoCK1d1zp3NRxav5wXsGX5DunmxYQAquQ67c/J2VK7ovLRxxPKI1npJwsTIIEciDg==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462d4bfc-00be-4eb9-be30-08df409c149c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 09:05:21.4390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LlhTJ1duwdWgH6qCcogET2IrH/CJgWsE+ELzDeo7denyaq/fPOsgixMuSO/A/6KoRQX002xpGMQqj4/MJKb3xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF7BA6A63F0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX9doDO2jTUuIe
 U3QkDtgD1sM0ZiZ045Jj1c6yegRmxedDWFivrAP/ySOmRhU3TMyrY6KifOAp7LC76Lzr4r+HUvg
 j7QW9hjkW4MP8o5CuM7fiZyKw3y+z7aEulB2jMUK2yP74CQ9imyiuOVMmlEnL0AYUpE+mQpI+RW
 i7p0uD8hDRhlQVb+T+NTYgjGTZJFb0X2PDZYEJhu7xiyMXsxM5TW281XFVIOYDwrps7qQj8nQ9B
 xWw/0Ai/JZRUfIN6t+fI8VkKH8TmXwcBZ+XmvqEOkLy/VIsyfnT9rqT2XtjBo1i31gNZrdIEpqN
 L9A0XlohvrJwkDbKcncwt4KogVs/ZUuAComwylKG5YmPJIVECTlOWRRCW1dzqIKUxdMKmDyAFAo
 t7k/W2xEqJKbusERCWmHqF0VJoJ1nX44uS8sli9CPUE7OAjKalE1o8oefaSeyBJQo76ik8Ru5aI
 VPOvpbWAzceoLyax/dA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX8scwgQ8UP+Qo
 U55+gQVlvfokJXoPNWuWfliCLe6hf0kItv9yZGtLepYs+py8rn1u7LJ5KfNZugHpeRYzc8WZHWM
 R4wN0vYCVsVwrPNEVzClcvetJtKMTKY=
X-Authority-Analysis: v=2.4 cv=S8dMU4sP c=1 sm=1 tr=0 ts=6af58155 cx=c_pps
 a=7gxl16i8FQH7x2TX812BOg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ohM_6DErYqYCNn4jCPz8:22 a=EQ-5l5bxFgnvs98h3uwA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: qA2-gs_2Sw1QmBJr_XPYf_N7hnFz7H_9
X-Proofpoint-ORIG-GUID: qA2-gs_2Sw1QmBJr_XPYf_N7hnFz7H_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120035

>> This series adds hwmon support for the fan and temperature sensors of=0A=
>> the Nuvoton NCT6801D embedded controller used in the Lenovo P3 TWR G2.=
=0A=
>>=0A=
>> The controller does not implement a hardware monitor logical device.=0A=
>> LDN 0Bh is the ATXPGD/BEEP/DDR4 block, and the sensor registers nct6683=
=0A=
>> expects at 0x100/0x140/0x160 do not exist in the Datasheet at all.=0A=
>> Adding the chip ID to nct6683 is therefore not enough: it makes the=0A=
>> controller recognizable, but every reading stays invalid. This was=0A=
>> confirmed on hardware before implementing patch 2.=0A=
>>=0A=
Hi Guenter,=0A=
>=0A=
>As mentioned in patch 2, you lost me here. What is the point of adding=0A=
>the chip to the nct6683 driver if it isn't really supported by it ?=0A=
>=0A=
>Guenter=0A=
>=0A=
You are right. Patch 1 is dropped in v2 and the series becomes a single=0A=
patch that adds the EC window driver.=0A=
=0A=
The idea behind it was to make the part recognizable by nct6683, but the=0A=
hardware monitor block that driver looks for does not exist on this part,=
=0A=
so recognizing it only leads to a probe failure. There is nothing in it=0A=
for a user.=0A=
=0A=
Patch 2 changes as well, on DMI matching and on the driver name. I=0A=
replied to that patch separately.=0A=
=0A=
Thanks,=0A=
Jiqi=0A=
>> Patch 1 adds NCT6801D to nct6683 and fixes two problems found on the way=
.=0A=
>> The Super-I/O ID was compared after masking with SIO_ID_MASK (0xfff0);=
=0A=
>> the existing chips carry zero in the lower nibble so this went unnoticed=
,=0A=
>> but this one reports 0x0113, and masked it becomes 0x0110 and matches=0A=
>> nothing. The new check therefore compares the unmasked value; the switch=
=0A=
>> expression remains masked, and val itself is not modified. Separately, a=
n=0A=
>> unset base address (0xffff) was accepted because only 0 was rejected,=0A=
>> which registered a platform device at 0xfff8 and exposed garbage instead=
=0A=
>> of failing.=0A=
>>=0A=
> Patch 2 adds a driver that reads the sensors where the firmware actually=
=0A=
> publishes them: the EC shared-memory window of the SHM logical device=0A=
> (LDN 0Fh). The base is not hardcoded but read back from the SHAW1..SHAW5=
=0A=
> configuration registers, and every candidate window is checked for=0A=
> plausible sensor data before use.=0A=
>=0A=
> Testing on a Lenovo P3 TWR G2: the driver locates the window=0A=
> (0xfe500200) without any module parameter. Under full load the CPU fan=0A=
> goes from 808 to 2920 RPM and the CPU temperature from 32 to 100 C. At=0A=
> the same moment ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C,=0A=
> x86_pkg_temp 100.00 C and coretemp 101.0 C, i.e. four independent=0A=
> sources agree within 1 C. checkpatch reports 0 errors and 0 warnings.=0A=
>=0A=
> The layout inside the window is defined by platform firmware rather than=
=0A=
> by the controller, so the offsets in this driver are the ones this=0A=
> machine's firmware generates. A machine whose firmware lays the window=0A=
> out differently fails the plausibility check and reports no sensors=0A=
> rather than wrong ones.=0A=
>=0A=
> Changes in v1:=0A=
> - Initial submission.=0A=
>=0A=
>=0A=
> Jiqi Li (2):=0A=
>    hwmon: nct6683: Add support for NCT6801D=0A=
>    hwmon: Add driver for the NCT6801D EC sensor window=0A=
>=0A=
>   drivers/hwmon/Kconfig          |  17 ++=0A=
>   drivers/hwmon/Makefile         |   1 +=0A=
>   drivers/hwmon/nct-ec-sensors.c | 507 +++++++++++++++++++++++++++++++++=
=0A=
>   drivers/hwmon/nct6683.c        |  21 +-=0A=
>   4 files changed, 543 insertions(+), 3 deletions(-)=0A=
>   create mode 100644 drivers/hwmon/nct-ec-sensors.c=0A=
>=0A=
=0A=
