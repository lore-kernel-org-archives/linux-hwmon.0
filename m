Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76F46AEEF;
	Fri, 24 Jul 2026 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923185; cv=fail; b=qyxamPtVR7KomRBpHK6e4ztE2n5p7O++GIjCjS8UTFDH4OAcm9mz2zJ+RsGPXQ5FlVu1YTfoRAjOnOa/5MfU2I13dOxpN1dFFJf2eFNPQSQXyQzUCzthmc4/fQJ04KrQHVZ72W1Xiy/hVCF/S6v8qbqXcunSmMpqUzqjWW6cRF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923185; c=relaxed/simple;
	bh=2SJUNid39upoHem1MzBKi9Hky2BfohIvhyIxvSf+CiM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JgnAj+wBtNj+rttWRXY7lJKVHyQjiAlLPwkFsUCLWuC/rjDzEGssa+oFMPbcfZSuoQIxIy/BX5k3RGE0/ePH4cMYTfKv4wPTPLEsGy8r25kOzwPoWPtt3nUCsyI+CMy9mSf/VfVeyv4wGuvMsp7wx//8IA603ZhB1aZHaJP+vdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=LHSPGyrX; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="LHSPGyrX"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OJrPUb964168;
	Fri, 24 Jul 2026 19:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=bJ
	qK5wfvNJrKyJaRvVOEhK5Aqgz7bZ/RfsaGrS6PMsU=; b=LHSPGyrXZYNVs9zo80
	sOVPuhX48bBrM+knb9TVEkz5EiMXumB84yD6yS+4x6wB5udFuksB03aDb1K2CEIi
	bhQAtyXiSJ2bojdolhGuy7gcfMfTCExQlasyk5S0m6esDaySVZWYRA4/1NM03eyY
	kn3OWDWZk0uPkkr4TtHxDG8SaaZyDkfujX7eMdSV7i70EDuzW9wgz/eNpYTrxbrU
	nbSpI4FwUsvhkpy0axdH6KGbNnDBqKVtvK5NMnUDeo6cQMTVVe46gs4JF05JffhF
	bF0DhcPtlNw2TrUGgLAAtAih15ug+97XIQcFqqMq1P/31YOa6K3HgvtImvcQx9qx
	QLeQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fmab94wxf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 19:59:27 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 2DBAF147AA;
	Fri, 24 Jul 2026 19:59:26 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:59:24 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:59:24 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 07:59:24 -1200
Received: from BL2PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 07:59:22 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAFYEV5oj3OCqOAU5LaFVWlivCZEJcmMfhnhm00ldNr/L/Gt0fKrCboRqD0RWhG7N+/tfzzbD13F/nDCfU3a5IpaWg/8C721GIcASsJXx88uzi94+I1S2sP8JLguvsmg93rEK2vUSkWTJ/FOE1ZeZCPgM0yCTnnWGyi8LwxSR+biVcVhkXFMS0CNsTMHKQZg3qqxEnNhryGNLL38XnJgrNGWd3N7vY95Y/FX8ztp9kz5H41UpNedGLjjglEl0MPRHMWAevWurnFloTnFzJPNx1jLx4316HI3eFacIFpzZn0qXXV60bUKOlu8miT69pxD9Nd4rdg4ZW9XE/ISGsMhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJqK5wfvNJrKyJaRvVOEhK5Aqgz7bZ/RfsaGrS6PMsU=;
 b=pPNJkSKUHaaTzKTNQg1eVf3JEuNGFLV3uN07oxZfu6vh9yBMiCN5n8qi4CnnUdtU72SuamxeDRgqG3Se6h0eLWZ/plWDZsWk053IKwC1sjEEGxg3tBZ5wKewcanfqlQj5FiwTermaS5hO+0TeoGitQJZ+34T+XOHxwn/qJvct0OJgf+Gi08wvjqdve7wvlHtjXWg8ICR70khAOLTPNReU9WKKpPgoI0/2lcMhoBixvY9wBm9JvgspytzTI1TLFk3AKFJjRl++tO/OEjf2MRquQaOjQULZba8rfOulcr/1PwhtHzagmx6RI2bDbBsHPz69VYBk3CYdkcf07f0uia7vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by CH3PR84MB3546.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 19:59:20 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 19:59:20 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>,
        Debjit Ghosh <dghosh@juniper.net>,
        "Jawahar Balaji
 Thirumalaisamy" <jawaharb@juniper.net>,
        Santhanakrishnan Balraj
	<sbalraj@juniper.net>,
        Brian Mak <makb@juniper.net>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdG4x34Q4P1zCD/E2JxkiuennFRLZ885oAgAAjGAA=
Date: Fri, 24 Jul 2026 19:59:20 +0000
Message-ID: <20260724195912.262226-1-sanman.pradhan@hpe.com>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
 <acd92cd2-ec1d-447e-9e80-35ec5289fd0f@roeck-us.net>
In-Reply-To: <acd92cd2-ec1d-447e-9e80-35ec5289fd0f@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|CH3PR84MB3546:EE_
x-ms-office365-filtering-correlation-id: 7c2840dd-f80a-4292-de7c-08dee9be0cf7
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info: 33FaOeI8uh891I3leRsgmfa20ctdYmzOsioo59uRiDawzG/Alu1o37bKzIIJEQDiJy0l8HZ0g3420B09P+7LlFnMkbUJ2aOCxXbAkgX7qgXfH6ISvhCzQl/4igzzg/nK0iGF1gn8VPUF7JP6yDvsE5Qc6lL9xb5aF75WY+o/DPFxEh/DcOUKjKjNwMT2/Eo5gigo974dOjCaycgWr/gUq33hBno7ULYotIqqQsl6zrABgotEe6gCN2nm9j8y2nurlyWla+wHhQHdhwF2rE8FHln/k7b+gbeE4as7exYnNsxKEquJSqmVK+BpzfjHR0RV20IJtGXPBWzXXrD5W9nXP8f1XedNdozrb1DO5FNX0NThqDa4i5XyGgi1TtUCtIk1GhHrbbz6RLxS9YSyFpBEBO9KSk9aYIHOtMklwnBy9/RdfKdAYgY0q3k5apalM78gXpB5EyiWAWLvqxMRTPcGC5DGSIWL16h63nzwwKJCr9BlPK23AZP1K5IIUXInwbwznPaRAj+BtRE6eUTSqAeapqmb9b/Ps1W+G0i+5qb9f4vW7RJ1euG6ZgJd9+ipGsbw2AfHIjBJR9oIqFKs8lTv3heQY/1wUeDz3ZfWYtoLsTA1U3Hv3GLhydLz9auryQOP7XI9lG0ieJ482q4oVxVRlKz1WR5FSl5PpVAjQARJbK8z+Ve8BLVICbbkM24zNsMDIGuLoBi97D8T0m0uoYZVZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?elyIWRKaqCSufKQYP8fgvTAMMto6E+pzP5QAhMwvWyiL0ugGkX+b3iW6oY?=
 =?iso-8859-1?Q?R5Xmgp7FtKPfVgwuudIUs0nnTHL3b5EEE7sympsRegh2kl4ZzKRax2Vi9D?=
 =?iso-8859-1?Q?Wcn2H3wbU9c2E3l4vtnBwButERLwfJb7do6NK7BgvyWA9KV3HJlrc63+W4?=
 =?iso-8859-1?Q?Lfve7AfogAXu+53sfj5eihFpMiAsMK9+JSYKXxKa+XNvUO8JjGQ9VDUpHR?=
 =?iso-8859-1?Q?xsM9EACAL7hfnJimt4hVsWRICibDn3GN+6uM3jc4BQzNLsI9l89mDJdwmu?=
 =?iso-8859-1?Q?rcHErT50eTIVz39i+vTziKXLNCDUnfaVxp/Q2gQQIqNlyr5C5JaCsg06pV?=
 =?iso-8859-1?Q?sXrd8jOsjPsCux9MxRpPZclKP0OXYydkwncEkmiPOfv1efzD1E8pAzfHda?=
 =?iso-8859-1?Q?RrFvrWhu9Jjm99JFm1gqA+kfbbMS1wfSRFHZo0GVAGvRxbpu4HmI9tQtQM?=
 =?iso-8859-1?Q?WH3O9Td206HN2PhBORXXnQR6MU3L+HFdJMZJ/jrdiBUNpjzsQMSC/Hf0n2?=
 =?iso-8859-1?Q?PhOxZ0BgURh6yzjxzdUqYv0ggoVZ8y/nC3vOjM/2Q4yRWb12gkjetg3AJS?=
 =?iso-8859-1?Q?boxSg1czr7VFQOOq1SsgfATfliTWJoJKpxa9O8OgnHz5fjgWLFeCuhJX1z?=
 =?iso-8859-1?Q?sSFL6GZ8QWsl6AntizyOiBjLimDymEe0Z5aOnmKOtggChlSnE/Wai0fcCw?=
 =?iso-8859-1?Q?Jrw9Lcja0pS7d5mZUkFmB8rU5uKr9huDXysMqJEBnFZiZeXkLWECJzAEgc?=
 =?iso-8859-1?Q?KT1gArT0p42GWXhRCJ0UOBLLYtwJeI1zu7ShbFyPSXj31/HsuISeSFveyF?=
 =?iso-8859-1?Q?yWQb0DLhSJ0hzAL9HXtCtIQoQW+Ja6HfpnIR/TYdjYbtTrpufcH9C+9PKl?=
 =?iso-8859-1?Q?3p3h3cDhj0Jqv2DxoKh0spWPiqz0zEraJnIaNTOA1NMwn3C4Uepbq2tVmu?=
 =?iso-8859-1?Q?2fOcVR+lYksDM5OonxPJqIOSRItJsSkVpwYpwH1LZBysO3sIk9n1+PImcX?=
 =?iso-8859-1?Q?24IOlaqH7fKji2DOF9hl2vkDErsQTjj0K8Xe9KtCsxO13GiLePaf1KYkcp?=
 =?iso-8859-1?Q?0W/zn9dnsrs0ITHKjNXhgqF/raoCygdm3ZQbAVxXqED6QzKZoe9V89VAHu?=
 =?iso-8859-1?Q?o0F3ii2ea6TXR4+A/7wrrT3LNQyyrpTms4SMa6MMqgLeC4FGL3CrMBI09T?=
 =?iso-8859-1?Q?Dstyv9quioAxFAfFueRnm4mCTeb3qRb6hJsD7L3YH64H7UixhNHY/YYOgh?=
 =?iso-8859-1?Q?h1Ic2SoHNADEgSUzWBMWRvZI+0AR9B28jE/6NnUtFFwcmovEzoZPSbf2Wd?=
 =?iso-8859-1?Q?c2xT+SNNhHFf4NAzhHcnG8rxsWGqrwEPOYsolN/taFiwjfzqIwHHRN9+6T?=
 =?iso-8859-1?Q?b+npMriy4VmMEsyRJoCWzvl5xeKqvyD22wNnLqkRZZyTDXZcEtOsF2xFBG?=
 =?iso-8859-1?Q?qFU4hZOOrHMZQN7/MfJMJM+U0WK5gS5ylW/dXlPLJwLvib3uL3ZXybK6lS?=
 =?iso-8859-1?Q?Y1d9b6eOBKuK1q7bgV2pndCoQXTtFtDU/uaB+J8FcuDNZVuteFnwr5mmL0?=
 =?iso-8859-1?Q?ghAL6tdhLqUBN6DnhpBQIoid3CvDxLYcQOgMvTLuihxdDB1JN0jJexUGd5?=
 =?iso-8859-1?Q?iB1+oZBMaatxbTK7Y4JxwONbajlo16Uh6kZmkdRxz8MENDpVdH8IxmdVXV?=
 =?iso-8859-1?Q?B2db/0vLtZJQMIDMKZe4g+NhM8WwFLCixg14tAeFzkPPwldfADXUGROVT9?=
 =?iso-8859-1?Q?P3yxA/A+PPDteb3+hyiwDRqkqReO3AYp8c8zlbY8B/J8dM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O8tDFpTbLgM2zMTczMyrnVBN9Imnue+Evd7ZnHBy7V0EHDJ9+64fN/OwKDtOHt4TQGgLBDaC3ahYlZ7DFAEX7C0S9hNej4KhvAZA8y7RZIoSGgjQ7J90HR9tUtbbAc/zJGj1rSB4/7HJzIGYpgxdQ/GFIca0/u+JgXDNJ1Qvqgqb4o50lWnN0BxSq7rpX0I1ZQ6M8BTMqdj0UjZ/lmrabSZswj1sX5PtxYisX15J6rAJekZD7HuhHAjPcImNrM+roCvC+juWuwSxyGHKowlbYsX81eiqCoBS2wk7l9+eB6VSYr47yQypYz59JajEccJ5nsAEr0HBD5IbngZ7dW1LBw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2840dd-f80a-4292-de7c-08dee9be0cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 19:59:20.3200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /uN+L3zZ+ElPy1UqtK1d7VFSkcbe4v983DS4nEB4EqyRBkv2/HVmlnfjNo+zl8ACWTn23Tz+U+Cl3semBvs+uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR84MB3546
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE3OCBTYWx0ZWRfX9LSYfLvdCy6w
 kGNzs1sQj2O5QElpzYHnigGR3XY0V8OkA9ExYY8Kr2lpenOXAQQvjkbI2uDQBPhzQXHXp1bOegS
 FsIiz0bVvi+UwKBLtpVSZkYhDlpQrXA0EdURXWuYpWeFsz+ZfCdA3t0/B9Jix98ckk6nAgTm1UC
 H/5M8OZ8Er0bvF4rEg29Cm6q96c3DHS7iOPsoPfig/1fG909knMjn5Iw1XEFyi/i4xWSPjGDG6F
 eWdkUX8bA9qrTyzXVYZlpW3cDn8Ape1PNVxxZITQix5PkN6S6f5PTgYrH1uE4LzTMbwkerBOuT9
 9ml8PuQXzhOfhzgk4KMHvXvyn13z+d8jEklQS/OHN6xIvAK1U0wcl3/ptUGCsDrxBXHHhnYSAn9
 AWnNp8qGklLFqcRmKfEXBcv8GuAARHY6iYtwmUQsWcGZZIZgyRSyaB8dnNci8TsPwLSIVTWFOTy
 DKdISRUKTcHanm2j0Mw==
X-Proofpoint-ORIG-GUID: r-WQXCNQxo5aUkb-4kwpR0cpklKmPxti
X-Authority-Analysis: v=2.4 cv=WJVPmHsR c=1 sm=1 tr=0 ts=6a63c41f cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=SGdVYZoGM1mfx5QjSbMA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE3OCBTYWx0ZWRfX40BgOn8xzND3
 icvQtN9LQw6R8Kte+TLAtY+UMlRWR7EJax+/yfyU2vRVozvD7fksor93K/gQRTjhi9zngcwIkNT
 h5CiACU0Bmlasej0nkJoGWKhGVIrVf8=
X-Proofpoint-GUID: 78mXz-Yx6PCgFl1JoLMwBpmPRaqz6xh3
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240178

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
I think my ordering on the trailer in v4 should be changed,=0A=
I'll restructure the sign-off chain so that co-developers are=0A=
attributed before the primary author, rather than after, which=0A=
should better reflect the development history rather than the=0A=
transport path:=0A=
=0A=
    Co-developed-by: <co-developer>=0A=
    Signed-off-by: <co-developer>=0A=
    ...            (one pair per co-developer)=0A=
    Signed-off-by: Georgi Vlaev        (primary author)=0A=
    Signed-off-by: Sanman Pradhan      (submitter)=0A=
=0A=
Please let me know if you'd prefer a different arrangement.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
