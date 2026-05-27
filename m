Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12282F3C26;
	Wed, 27 May 2026 04:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779857725; cv=fail; b=M64Oa1fLrktN/IUDC6bMP9i/MkIcWpEjDif3/b9sj25lJkglM2ZxDrv7AvCk5x3sZ+jePhrSVBZ0dqnMuM8qsQxyKMLFEsMLJ5xM8T7fbbxqSaHC95EsuXX0es2jx3yVPiFcP3VJChL1KPl6Czj5TSftL7ZChWE35qgamEM5smk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779857725; c=relaxed/simple;
	bh=8LKwusRpSAcQDn5O8Y+Y4qPDohHlMrcaaLL04K9qMOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U2TZK5ZOFvCJjRw/a0uo7loAxVd5G5TAVPJP5zxh34VcxBSqSHyEoCml9ydOjaS+HIFhesNYsJz3B2ttJTGyRLMt3GilYpvaaAjZW9MzH/jW+HMyvRT6qRaPCk+SVZSlq/s00DMFcI3cXutM5hFq0cKk2EgT49T1FGroBornOvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=PJiJQFQa; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="PJiJQFQa"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R1WFqU499490;
	Wed, 27 May 2026 04:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=b6
	5K7nEcuZOFT3XPz8N9Ez92gp4QV330kfNtBt6vjHI=; b=PJiJQFQah4HiRYLVqw
	EkUsdgIn8Y2KuAGUkEBhWJJ0yJ5slke6/jkCXttXgzBcKT1xVV1FuAkU622waumH
	pPBB0/PWiWOWQJV3GvMc9wqTJ+3lHPHkNgU1sA+zwZQoZBs6EXvS10/JhsAKSFui
	ejV6o2lLgSUhQHUB3FLuuz3I9ZUGu+5i2W0EdGLHIS//lNFIE2/hgpqMcy6ud8iH
	125gyD+nJpTVC82Jh2EN8HKM4xVkvFpBswPsrlPVvQ222x9RAP5KC/A/qvfbqAqS
	uCEc3U+KkqQRNTJK1HX6JX6VoCsZHZuYpBYlbanMoDsd76gb4VikaSy7UBxLVE2b
	2UQg==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4edg06pbrw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 04:55:06 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id F18191317B;
	Wed, 27 May 2026 04:55:05 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 May 2026 16:55:01 -1200
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 May 2026 16:55:01 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 May 2026 16:55:01 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 27 May
 2026 04:55:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFe4Ykf576o6f3sXYvFVCo4OeO6H8rDwoUm4TzJFk4SDiPnTq8UBBbYi+1rfflRDMkV0HtcSETAv6L4cypeH6iyFvh2+yEvp7dOi5W2OLYWCnRuR/Gd3KF0j36ZFcVuHd/YQvaMs5GBlN/EnC6J6sJYOnoB8rIrDFjuzUxRTHjMQ6HyNodbr8NZRz8rsYYFNQFOyqi8EM+xvyX7mDxAXsgNdLa9/jR3V0gyGTc+awDNTF2vdj5zEQifIxz2LD2xmXtumj8MjSb9iXLJ/XaFqbksy7FUHleQmhyiRBcAo8SlUt/j8PAv/W4I4K8GEAEumnU8K/6mrWNCj9tkqv7W0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b65K7nEcuZOFT3XPz8N9Ez92gp4QV330kfNtBt6vjHI=;
 b=NEdehYjeFp9x+X6uokP3G5uK48qiAZ2lmXBaJJRl4cmzi2PXdBpj57J46BVPSQp1fsLdG55LLZD2fD+SxuMbcOh5mfcu0V6eFGoGmDSlO0Gf4WoUch+LMK1qHHF+8rqHPUebvnZjGzHKCfTofpXNnaCqEmTOjTFHJ9HN1P01i/6dDQFiSZ7jhaHfNq7BZOVZRsMB6cU+IRkeP3ySmPU/Ah/f0ezkuUNoPPFAOh1u99bPpp3R3OdlExu8o/OVchKd7lauMmKbC0x7i+6k961q6URvrYU362aGA3ExQ840ssI9HA0hVaxCV0VtkALN+SC4XOlYEpITS+Bgc58VtFAKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB1496.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 04:54:58 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 04:54:58 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
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
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 2/2] hwmon: (pmbus/max20860a) Add driver for Analog Devices
 MAX20860A
Thread-Topic: [PATCH 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc7ZT3BDgUNG/nXkSBTSVbqf901Q==
Date: Wed, 27 May 2026 04:54:58 +0000
Message-ID: <20260527045409.9092-3-sanman.pradhan@hpe.com>
References: <20260527045409.9092-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260527045409.9092-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB1496:EE_
x-ms-office365-filtering-correlation-id: 48842064-229c-4d0d-b95c-08debbac1a28
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|3023799007|6133799003|22082099003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info: yJWOeGfIoERHrZM/9RkEG546i8UaWjgf/JiiDtbShoAp+VVyum+PlI1hsimWr2rop9buFhieNLR3ASlazwizEox51Xg2UKuOikzRcWrZpiUvTf0tUizoavBkbLudBASP5pP7S4M4SxYtlQmeSrSJ9FoWPrw6EpP/HIq6Wqqc1886LX2cIQg+jewrYBk2AsvMrfkj+vlyyl3md/6QnA3LJvp7LtxuMP2Hg87dyATuanQRatdr18/LS3EVJR4+TYjr6lou9XfF8EXnzzkdf3ab1HjCSAXrmsCskMgEDXXA8XtmEBV6xvydrsIT7L7T4AvHEH8/XMbfVz/hHOKr92RM7UgXEm+doII/TsN3nkFxo7rPqoYtJ9RQwIIwcTgYDSWtMVDXf2rYKLB0ZeNYdENszbZui//YsXvE3EBAwAT6gdel0YHxS57kWm5s81KTJnk0GUgjYtYcDjijeO1sTIwvyxJ4/aWkywuxFVpgNi29BwSJemDYjgTYVf9sBKj4G+4aa4JycA6nMIVL59GjLE+MyThu8bkahbrWM+0YOurDb/cBrPKsRE7qGBev/coelhPgHrNxTTrjTUn4AoQJuj2ubLYCOU/EsWb3Z05TGX2V1J/I8+kSsbffVXgLRztkZpqeySNQgC284R5bBUeFkOYt11d1PTziHlBcm2FR+e6CKyWpbnbyhsdWp4a7xydrr3FtOPLDp8D88gLPyfhFBikyGJI4Fl3evsVV3P2LJE6NFEhWqPDgF6Qz/HHSdo3GENqk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?b4bBWDEM1y5SPy5oK6n6nhxi0ihVO6uMiLPrp5wlHCQTr1f9vpIA+iV2AU?=
 =?iso-8859-1?Q?M+L3RDqEv/CD33xTCKPpncRdOJ0dCSAZMRzQ5NDhzxoxjVeeHF8ljuk2iS?=
 =?iso-8859-1?Q?0gnGXfHW5D4ISQUGSMu5e4YtqXG/m1n9eDylR6UTS3uJ938ZNppNeXIrN/?=
 =?iso-8859-1?Q?lTNYlQ8a5rQGkM2mlgtn+al8JE+U9WE/PFS82s1+e4eqxfHgAu+X+aVGWI?=
 =?iso-8859-1?Q?/Fdd3fhZy49F/YhZO6WQiKeh9LME6Yl1iBLpu09dHup2up6zJpHItQq5G5?=
 =?iso-8859-1?Q?wnQQdP6MBYXASyzugnintX/NYEg8bSIMTK67m6nE6YBjSsHkhl6Fp7z+pq?=
 =?iso-8859-1?Q?lcuLonRxs5uS3FSBkjrYN4mywrhxHvvXTLeAx/Wtl6Wmut+z2XDXpjY0Dq?=
 =?iso-8859-1?Q?/jvT+n/aJ6quAwEkCsJTYOv1Y+SYFYERzJKx6OW+x6i64Cvlni4q6rfLd1?=
 =?iso-8859-1?Q?Q7BMGFLp39xWMae1UhNBAKSwW2efmeevDAW+cZw9tyenbggnKpzEQSX1ob?=
 =?iso-8859-1?Q?TIzQ9biCM6mkPyQbuNctYbrxzMn+cvuYPja8WGXs7NVRYhTpFVxEffs5T4?=
 =?iso-8859-1?Q?18LHyrcyq4HTy4wL3rEmaFg385GRppEXn5ijCs7P01+wAgMkB42aJZIAzq?=
 =?iso-8859-1?Q?mS+rhIBAKiFXA1ufzWmxBPrM1xi2QbEzOmzG26MQudeJ9fiBZqeBtF2Ufy?=
 =?iso-8859-1?Q?huQKzzsBUo2SV1+5al6hhI8sBodzp+vBfeARSW7DqGTgtMQRW71G2anNUI?=
 =?iso-8859-1?Q?IB/bArqSgpGKhgCOPVS1YZLCrBTZ3OkwD6ZgCl84S/lEZjQCXaqfkvPFYj?=
 =?iso-8859-1?Q?X4BRbmZyLmnMdROP/QLzx0Htph3VJ6GfuhZfmyQSG/oopG+zQRAZ3dWGWn?=
 =?iso-8859-1?Q?LBTjqto5a8TpkXBLmJBEkg/vA4pIOaiMvLcC6QCcn07fhaQQXUlVPjMCWI?=
 =?iso-8859-1?Q?q/vYQ9/4mDX7+F8ntk/QZnQaXrZa50QE5Z72s3o2M9r4cYHqOfynv8UHA0?=
 =?iso-8859-1?Q?fnd/x+pLTZmdOI01blKx/uG6Y7KjPEJpZPcAH3NxaIV/NCsFP8MKb3krRi?=
 =?iso-8859-1?Q?hrbB8Qte8v/88LgDvlqsztLoRmo3Nr3SlyyIkIT4SZTZ0SMIO8roPXYYoN?=
 =?iso-8859-1?Q?YVsF6Gh/RRpRKj4KXMh5tiqJUuL0ugXS8f7uLCITGuoZ2ubjnj9K0Av45S?=
 =?iso-8859-1?Q?C9zYyEU+EjohPvlN8dxC1BM8SgCINgLSpKQEwYuGBxWMqhYM4C4z5616py?=
 =?iso-8859-1?Q?MVZDun2thwSaX5I9Y5V76hbm/8kh6dnnPxPY1TBGA27jDtTPXLVkPxYwRP?=
 =?iso-8859-1?Q?8bB2srHjEJPJ9j2PBR7O25okgi9FdLlDuXXicqgPIEc6l+km6poEnJmneb?=
 =?iso-8859-1?Q?Zewn1rqBZKPjZwcQsItmi8GEIeSXp52VBw7DscyceGqRwN1tx54mb71Ezn?=
 =?iso-8859-1?Q?cQxHRXORGtjAyJj5/tvO5a8OTw2SzsCZXZmt4jj6zMDVFI2gtSROgAkSXb?=
 =?iso-8859-1?Q?bB1X10VhxpHnmyQffgmqRqy7r+7YCrn7YxveZ2K7pO0TZHIxsf5pToyeIa?=
 =?iso-8859-1?Q?yQM7d6+aaQseakJ37MqskjJ7seEL7n11xxJsH4nCjfkqDhM25QZUu1dqiH?=
 =?iso-8859-1?Q?AcwOZl30pw6jcypLHM9m0ofuHb/drYHZ57zdyF2MxDxSyOyNkie6UfMN0W?=
 =?iso-8859-1?Q?23NSqRSBYPI6AChIDBwERc/LACfyIx3JwhHAD5EWyUXncJFJlw/t4ZDeAh?=
 =?iso-8859-1?Q?/3N+eZiueZ1xI6GTsK8oTrka1nsUyKWwCQPJuKrV73OYPuAQnORH0dlqSH?=
 =?iso-8859-1?Q?NYvfssjKEA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FBsmxmipfvBd8YZ/olpjmEsMhf0SuYEYlLksnjfKrtCH+YkoX1vRgBVDhLyKBrbd2bO0eM27SpSvrjSGe0I/UwQJ6ATt0lL0gRJLwhlUlY7EH6LZ2fbX6Hv+kiTPnrEHtNBRaAswgBXxEvfLUqt8OP9HmDaKjq27C9D6+J5qRljLgmh5F0sN81B5g3/A6Bv5m6Ux4Gom0mOc4N2DLRXKbM4jQSr9/omyX8TQ1MpeTgk381iccr3QqsWTYxntSPvp7IbgXap6Eo2s6MDsWwg+/zJjZb8OziImjqAzn7/unkTNP+JpJPeowHZ4bh2YnToOoHt/uuJmp036oPlU9GMfRQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 48842064-229c-4d0d-b95c-08debbac1a28
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 04:54:58.0326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0cO2sLY9vl+IPf1S9iS9ffGQP3q+W6r9yuDciZWpVOBFeqG5f0HzwznZQNJRll3Q7ByQXf7hYC1mduvmt2KLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1496
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: _QnolA4e8JMU7PQZfYfbcbCsUEvnR3Qs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA0NSBTYWx0ZWRfX6BpssZCqmTnO
 onmgFQfl18RHokVuN4DiEJfoTK4ldiKcmXL0KPG4h6VklDCtFaKmJg9gTYytwAZkpgAeGpH4Oqn
 +ISsg02zG2TC+oouT9G4PfvtkLzufI7qj+Kef2bXcE4c8J43O5HMugT9gUaL15XDVw9yiNaeGiG
 xrg/BPMaY/biruSVAatcS9qH2kyzeNnVUXYkkdw+gMXkJYvKuIQcFiquq/el8s90CTGn3zyRIJ7
 fH0irfvwquy457KiiO0PQAF87z2/oyNazOpswgnzq9/RM02w+3dbm8YmsE/miIbkYak4GVKD92E
 2RQRg/rn4wbAAenUCMw+J7DdyM9sJgxrRin1W82jgHd365BEjkwO2KN9AWFf+y8tNYwxayCHy11
 AYkIJSAZ3nu14Cklt3PuadjarEPyi1uXrrMe3PkzFgpKz5+XkwWoJl3aiYDwRCH5ubWI1rhMoYg
 LdDzGQ2FRiZbEpF47Yg==
X-Proofpoint-GUID: _QnolA4e8JMU7PQZfYfbcbCsUEvnR3Qs
X-Authority-Analysis: v=2.4 cv=F7FnsKhN c=1 sm=1 tr=0 ts=6a16792a cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=w9wWoLD1dqBvlLaiBBMA:9 a=wPNLvfGTeEIA:10 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270045

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC=0A=
switching regulator. The MAX20860A provides monitoring of input/output=0A=
voltage, output current, and temperature via the PMBus interface using=0A=
linear data format.=0A=
=0A=
During probe, write protection is configured to level 0x20 (all writes=0A=
enabled except WRITE_PROTECT itself) to allow runtime configuration=0A=
access.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 Documentation/hwmon/index.rst     |  1 +=0A=
 Documentation/hwmon/max20860a.rst | 60 ++++++++++++++++++++++++++=0A=
 MAINTAINERS                       |  8 ++++=0A=
 drivers/hwmon/pmbus/Kconfig       |  9 ++++=0A=
 drivers/hwmon/pmbus/Makefile      |  1 +=0A=
 drivers/hwmon/pmbus/max20860a.c   | 70 +++++++++++++++++++++++++++++++=0A=
 6 files changed, 149 insertions(+)=0A=
 create mode 100644 Documentation/hwmon/max20860a.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/max20860a.c=0A=
=0A=
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst=
=0A=
index e880c6ca84f0..ffaacda416e7 100644=0A=
--- a/Documentation/hwmon/index.rst=0A=
+++ b/Documentation/hwmon/index.rst=0A=
@@ -163,6 +163,7 @@ Hardware Monitoring Kernel Drivers=0A=
    max20730=0A=
    max20751=0A=
    max20830=0A=
+   max20860a=0A=
    max31722=0A=
    max31730=0A=
    max31760=0A=
diff --git a/Documentation/hwmon/max20860a.rst b/Documentation/hwmon/max208=
60a.rst=0A=
new file mode 100644=0A=
index 000000000000..d9bf2ef90734=0A=
--- /dev/null=0A=
+++ b/Documentation/hwmon/max20860a.rst=0A=
@@ -0,0 +1,60 @@=0A=
+.. SPDX-License-Identifier: GPL-2.0=0A=
+=0A=
+Kernel driver max20860a=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+=0A=
+Supported chips:=0A=
+=0A=
+  * Analog Devices MAX20860A=0A=
+=0A=
+    Prefix: 'max20860a'=0A=
+=0A=
+    Addresses scanned: -=0A=
+=0A=
+    Datasheet: https://www.analog.com/en/products/max20860a.html=0A=
+=0A=
+Author:=0A=
+=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+=0A=
+Description=0A=
+-----------=0A=
+=0A=
+This driver supports hardware monitoring for Analog Devices MAX20860A=0A=
+Step-Down Switching Regulator with PMBus Interface.=0A=
+=0A=
+The MAX20860A is a fully integrated step-down DC-DC switching regulator.=
=0A=
+Through the PMBus interface, the device can monitor input/output voltages,=
=0A=
+output current and temperature.=0A=
+=0A=
+The driver is a client driver to the core PMBus driver. Please see=0A=
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.=0A=
+=0A=
+Usage Notes=0A=
+-----------=0A=
+=0A=
+This driver does not auto-detect devices. You will have to instantiate=0A=
+the devices explicitly.=0A=
+=0A=
+The driver clears write protection (sets WRITE_PROTECT to 0x20) during=0A=
+probe to allow configuration access while keeping the WRITE_PROTECT=0A=
+command itself protected.=0A=
+=0A=
+Sysfs entries=0A=
+-------------=0A=
+=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+in1_label         "vin"=0A=
+in1_input         Measured input voltage=0A=
+in1_alarm         Input voltage alarm=0A=
+in2_label         "vout1"=0A=
+in2_input         Measured output voltage=0A=
+in2_alarm         Output voltage alarm=0A=
+curr1_label       "iout1"=0A=
+curr1_input       Measured output current=0A=
+curr1_alarm       Output current alarm=0A=
+temp1_input       Measured temperature=0A=
+temp1_alarm       Chip temperature alarm=0A=
+temp2_input       Measured temperature (secondary)=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index b71acb130395..1d9651947ee3 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -15688,6 +15688,14 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/a=
di,max20830.yaml=0A=
 F:	Documentation/hwmon/max20830.rst=0A=
 F:	drivers/hwmon/pmbus/max20830.c=0A=
 =0A=
+MAX20860A HARDWARE MONITOR DRIVER=0A=
+M:	Sanman Pradhan <psanman@juniper.net>=0A=
+L:	linux-hwmon@vger.kernel.org=0A=
+S:	Maintained=0A=
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
+F:	Documentation/hwmon/max20860a.rst=0A=
+F:	drivers/hwmon/pmbus/max20860a.c=0A=
+=0A=
 MAX2175 SDR TUNER DRIVER=0A=
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>=0A=
 L:	linux-media@vger.kernel.org=0A=
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig=0A=
index 64f38654f4e7..5825dda75f2c 100644=0A=
--- a/drivers/hwmon/pmbus/Kconfig=0A=
+++ b/drivers/hwmon/pmbus/Kconfig=0A=
@@ -402,6 +402,15 @@ config SENSORS_MAX20830=0A=
 	  This driver can also be built as a module. If so, the module will=0A=
 	  be called max20830.=0A=
 =0A=
+config SENSORS_MAX20860A=0A=
+	tristate "Analog Devices MAX20860A"=0A=
+	help=0A=
+	  If you say yes here you get hardware monitoring support for Analog=0A=
+	  Devices MAX20860A step-down converter.=0A=
+=0A=
+	  This driver can also be built as a module. If so, the module will=0A=
+	  be called max20860a.=0A=
+=0A=
 config SENSORS_MAX31785=0A=
 	tristate "Maxim MAX31785 and compatibles"=0A=
 	help=0A=
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile=0A=
index 1f2c73b71953..ffc05f493213 100644=0A=
--- a/drivers/hwmon/pmbus/Makefile=0A=
+++ b/drivers/hwmon/pmbus/Makefile=0A=
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MAX17616)	+=3D max17616.o=0A=
 obj-$(CONFIG_SENSORS_MAX20730)	+=3D max20730.o=0A=
 obj-$(CONFIG_SENSORS_MAX20751)	+=3D max20751.o=0A=
 obj-$(CONFIG_SENSORS_MAX20830)	+=3D max20830.o=0A=
+obj-$(CONFIG_SENSORS_MAX20860A)	+=3D max20860a.o=0A=
 obj-$(CONFIG_SENSORS_MAX31785)	+=3D max31785.o=0A=
 obj-$(CONFIG_SENSORS_MAX34440)	+=3D max34440.o=0A=
 obj-$(CONFIG_SENSORS_MAX8688)	+=3D max8688.o=0A=
diff --git a/drivers/hwmon/pmbus/max20860a.c b/drivers/hwmon/pmbus/max20860=
a.c=0A=
new file mode 100644=0A=
index 000000000000..9af6888ed07e=0A=
--- /dev/null=0A=
+++ b/drivers/hwmon/pmbus/max20860a.c=0A=
@@ -0,0 +1,70 @@=0A=
+// SPDX-License-Identifier: GPL-2.0-or-later=0A=
+/*=0A=
+ * Hardware monitoring driver for Analog Devices MAX20860A=0A=
+ *=0A=
+ * SPDX-FileCopyrightText: Copyright Hewlett Packard Enterprise Developmen=
t LP=0A=
+ */=0A=
+=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/module.h>=0A=
+#include "pmbus.h"=0A=
+=0A=
+/*=0A=
+ * Writing 0x20 to WRITE_PROTECT disables all write protection except=0A=
+ * for the WRITE_PROTECT command itself, enabling configuration access.=0A=
+ */=0A=
+#define MAX20860A_WRITE_ENABLE	0x20=0A=
+=0A=
+static struct pmbus_driver_info max20860a_info =3D {=0A=
+	.pages =3D 1,=0A=
+	.format[PSC_VOLTAGE_IN] =3D linear,=0A=
+	.format[PSC_VOLTAGE_OUT] =3D linear,=0A=
+	.format[PSC_CURRENT_OUT] =3D linear,=0A=
+	.format[PSC_TEMPERATURE] =3D linear,=0A=
+	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |=0A=
+		PMBUS_HAVE_STATUS_VOUT |=0A=
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |=0A=
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |=0A=
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_INPUT,=0A=
+};=0A=
+=0A=
+static int max20860a_probe(struct i2c_client *client)=0A=
+{=0A=
+	int ret;=0A=
+=0A=
+	ret =3D i2c_smbus_write_byte_data(client, PMBUS_WRITE_PROTECT,=0A=
+					MAX20860A_WRITE_ENABLE);=0A=
+	if (ret < 0)=0A=
+		return dev_err_probe(&client->dev, ret,=0A=
+				     "failed to configure write protection\n");=0A=
+=0A=
+	return pmbus_do_probe(client, &max20860a_info);=0A=
+}=0A=
+=0A=
+static const struct i2c_device_id max20860a_id[] =3D {=0A=
+	{"max20860a"},=0A=
+	{}=0A=
+};=0A=
+MODULE_DEVICE_TABLE(i2c, max20860a_id);=0A=
+=0A=
+static const struct of_device_id max20860a_of_match[] =3D {=0A=
+	{ .compatible =3D "adi,max20860a" },=0A=
+	{}=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, max20860a_of_match);=0A=
+=0A=
+static struct i2c_driver max20860a_driver =3D {=0A=
+	.driver =3D {=0A=
+		.name =3D "max20860a",=0A=
+		.of_match_table =3D max20860a_of_match,=0A=
+	},=0A=
+	.probe =3D max20860a_probe,=0A=
+	.id_table =3D max20860a_id,=0A=
+};=0A=
+=0A=
+module_i2c_driver(max20860a_driver);=0A=
+=0A=
+MODULE_AUTHOR("Sanman Pradhan <psanman@juniper.net>");=0A=
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20860A");=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_IMPORT_NS("PMBUS");=0A=
-- =0A=
2.34.1=0A=
=0A=
