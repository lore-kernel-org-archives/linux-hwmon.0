Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE32C21EE;
	Thu, 23 Jul 2026 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825058; cv=fail; b=NJQ8h3XDbCvCVCzowRXXHQnEK+wu2QCYigyNif25IcNKRzOFT8ZNpC8zQSFTKDAQT/sG5Usvvj7li1yiTBFg8K5QyFdqVHH3Fzx81GwIPhGHaOwE5EqAAS7CVALW7OlxbLzIkCNw1cPdVEQBkH36J/FmFDaokJTVzWzfn4LJtc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825058; c=relaxed/simple;
	bh=m2ZJfINgUzML7rT1dlBeeSxvAc3QxfH+rBWnKVKpSgg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qyn6TNg3bwD/N4RHxEzVc/rGMZGWsV2S40NUDkCBy19c7KBkYU1Zj6YUtBQxe5yYFZIy21QDHd3ONBE3CyEB1NTAMH4KZXdNBeCjpr2ptyZe4STdbCmTKz+r3vLD5vr4Qemf1Y0CBlEfE+NkpqDrgvOhuKcOxXmHN/qC6u0OL+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=ZFxwpNZT; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="ZFxwpNZT"
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NFk8E63299433;
	Thu, 23 Jul 2026 16:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=939fSDqmB73ZgWL6NyYW7CE2
	GlJHn6XUUf90QLsSxjk=; b=ZFxwpNZT0DQCG/CsaxXfg3xlsW9zyJMkwqp+BxH+
	YkaPlceTri2Nu7Oh3Jmlfy/aK/ctcEl44ed92kX8q0CLBqbU40qKhkHVFvx9RyTj
	wdX240VJCxNG+UJF3XD0EUFhvFxF8t3yoAiCfEyTMCKdiF1e6MRPBCkfwV7SqQ6G
	Bd4ZBeK7lAJ6VFHMbiEhKjrO4KzXbtLFarKOq1BuD3lO3iWxlenkO1Px0Msx2zAX
	RuNAu6dSY3voOfojXG9pOF57uF3yC62g//xAayIEKdZSLd8Sz0kvK9kA+qv4z908
	OCP3VzUmw0du7tdP2QIG11kGdk2xGs4xsV7g7wJREMDuWA==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fkn3ca0ax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 16:43:49 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id A91B2147AE;
	Thu, 23 Jul 2026 16:43:48 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:43:45 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 04:43:45 -1200
Received: from SN1PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 04:43:43 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYRPznRjXkvBqa8TkDqRUPrSwZAupv9iUqyWvp8D2MSVs0bAPBdefX+RUl2estBRv9S6/QHYtvsR0ERGev97potdUJE4++FiAM9dGx96juhnB85QoOzQrbN9kKlFfFMnnDAD+nBZ+yXrtIbRrWE+wD4EKAV+pkR8eqPAsHEtUlERHCAPYlVrT8VoEt9e56b6xC/dnbMKmWxsR1rJ/6w5szVJHmhvv97GBpvsWQIsi16cLRJpzjaF3NZluwQLDECPWf8T6Ihnl7m5uRi1UuNynpZDnYkyCQjWUnEvcKv2du76ROWd7qMepYzG1iR4orbungt5iQ5HKqe0cz2/V2aqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=939fSDqmB73ZgWL6NyYW7CE2GlJHn6XUUf90QLsSxjk=;
 b=pW3J09B1Cf5D2pRyaO6lAbLBxyTl9EXo27jn7D/PNqdPJLNCSHQPzWQ1mXPOpojJ4PNw/o46W3I2glOlXD1GzDGJue6R0xyBz0vdtnL5Atl711NAjWCDFGibP15AotDgLU1Cju6f2ix9Ur8dYSsfg7V5xAPhVRQwWf/XLwOVBhGew4IaocQEj523hPEYX9UKjSgYqPhqr7yanmUcyx5uaVy7IWgeA3h2NIxqNXMNgv5iaVeujo8e7Zb9nbqHdxe7wRpXofU7h5tJHzwwIHAcz7syYcpjvocRaKPnkQZ5l3wJddtQOQByX2ohAQAz+oFimaZ4k4Y3zNePtiK6BwY7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SN7PR84MB3154.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:272::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:43:31 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:43:31 +0000
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
Subject: [PATCH v2 0/2] hwmon: (pmbus) Add Analog Devices MAX16545/MAX16550
 and Volterra VT7505 driver
Thread-Topic: [PATCH v2 0/2] hwmon: (pmbus) Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505 driver
Thread-Index: AQHdGsJl4a4ifTkPDEOy8Af81hh7CA==
Date: Thu, 23 Jul 2026 16:43:31 +0000
Message-ID: <20260723164249.199442-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SN7PR84MB3154:EE_
x-ms-office365-filtering-correlation-id: 85e10ac1-6e94-4633-8707-08dee8d9878d
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|6133799003|56012099006|38070700021|10067099003|3023799007|18002099003;
x-microsoft-antispam-message-info: H6Z/OOutJBAD52TA1/M6zwl854g54PxvJ7zHHwc/XwNfPw1sfZnD71HFOiew1jpgB4oEB0c363fJePQSGvtJN2sXFhQqqIDnNxly4Qyw9mS6Cf8Of9S+InPX0em8GKGydZi+SInwVrLWOiD6gpydxVOXPskIJP9Sr95/C/N6fXjbW8RBX0vRvhdFnDNT4AW9lkPoJ7VbIU+aKQdqYn60lQ7i5dfaASeSp42QvyjLyk3SbJ9m4wf+pkIOD5yO5ZZC2C1x0YBF+CRphCDE3aL09GNreBPJIV4M5kGG+YglEZ38YzXGH7DUF9ckJiM5YXn8VVdrl99RIsyGXHbuqzKJIPBH1Gh186CslGYykpxczht2XCp7gPX+duaM4G9p5VUVHQUsuqJOc9IeaKV+BLMn02IeIE9jq+b2mKxmByhnbaLKjMlRBKN/el/P0fk4QsWX2xNKg3vQsX/cfJAJqOY1xbVlaMP1CWHSrblkyqS7ubhz6Wy+GtH6ymBZ42bpXsC0HsEW1qW+TLev5Aer+OoqvUyyuCDIEL3TsioK3OW9ec1vCMnpF1YOACB2aSZaxw29Cqo8lKApj2Ixn38malGuFpsMlkhnI83kHJlVoR5hHB5HEaLdAeiFHRxpQBg8NfGkltMkoLrRcSTHzrHidLweYnE0WaITeESm2wwiFpVX8l40/xnROHw7VBXkOlx/04ZCvKJZ8X9S4Fzcgeso88f6JNrGZH4oXcizm+ZaGDDw/io=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(6133799003)(56012099006)(38070700021)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aMnOrRYB1CRac1pvnmVrxDOmaO5u8dxqwx/nBpeSbGCFYN/8EMnx9ZzsMI?=
 =?iso-8859-1?Q?yelp5J7TqAm1mELyC4dFMAkkIUGsRgP1CuIWoN0KX343bIpAKB4hQh1THJ?=
 =?iso-8859-1?Q?brqzBtkhnMrIhLpWIBrzeXJzfu/A148+7uboMdGE2Xp6HeI2aR7UweNIim?=
 =?iso-8859-1?Q?AiKif+bag9J5ZyRLZk1CekDZOMpWDJtQn2wDlNT8TgoVGpyGeAr9FvfF+U?=
 =?iso-8859-1?Q?xPEmoP6hLiro/tg8dvX8XwdRlJ/vXer+CwPo/cMxh257D2sSMH/zTvll4S?=
 =?iso-8859-1?Q?EaUwmtc/MIrRPNQ0WvdHGdA3gCltsFvM+HsFVylwhxSpP4pY+46TCezKt7?=
 =?iso-8859-1?Q?WuE+SFywCD8hBWNAZ2EHTWXuBoLV0SyrBGRdNxVk0T3mZlqm6DOfjDRbn9?=
 =?iso-8859-1?Q?bRxgbVvMe5lF3JOHPqvt2Dy/dpXAc6OGumgLiM0eV4bKskx7nKeadxZean?=
 =?iso-8859-1?Q?dVSPOlW8JEz5tqMgQcIhGQC5BN9iiPqGjVP5mcbxjP2LSENFwg+7tLDygv?=
 =?iso-8859-1?Q?QbZDIE8QER3BOOiWffVmSGesD1Yv/U2Pns+D2AuXkZkb+XHJgSih7lFBk9?=
 =?iso-8859-1?Q?gkw6y3of4+1itHTLkws1l6mpeOI4UUfEqeL9OeW+q4kdIaCiFmar7FMNd/?=
 =?iso-8859-1?Q?XDon1joE6beVfY9naJYpMWRwktW/nPi+Gwy6YXh1hHu+Y3wyvG+E0NYCpH?=
 =?iso-8859-1?Q?JIOt/FVNY5iunrPJvSMtedjObDGtTj4piEyBBuUiYUDJpz/NsvXBw4XRWy?=
 =?iso-8859-1?Q?znELICo/qJyV8ZlqWl5hUtOx97rUZBdUTS7pR25Sli3Emw09kUgJB7Q3uZ?=
 =?iso-8859-1?Q?PWjb7HzydM9dFzVI/hdAU4tzkUDEqz4/WDbahqV6NnXpqYLE2GdByxRXp8?=
 =?iso-8859-1?Q?pMjfOJ7PeDwStVy1vYqo2XBcpE6co3e9bjYmt4Spdr9uyUCipldlU/amr+?=
 =?iso-8859-1?Q?hP2qzuOH3RV1rMz8beqK04b5cGcrbGW63cA27MXgK0Ck0aTIup5E7V3GkI?=
 =?iso-8859-1?Q?FqE9ZryqVEA+Twp6Qg13EfUzQOqmHHrW6tAySVoHTFXfFFsAPW2mgBsN2+?=
 =?iso-8859-1?Q?UFlCE53xTEMwGsguC6eY2CuIpdDtFGnBMSR42l65Q/1DB3E4hB/3g8bH9W?=
 =?iso-8859-1?Q?g4iJLz3EAxhT7mqjnyHjAGT+ZBEgNXVzFL4ns5E0t0zOORhFZ4W12XfZRB?=
 =?iso-8859-1?Q?ytHFbUgJPxSd1pw6e9KX8RXj5xfQ6tS5PNtmqHKsS8xDd6uSZxx943gwTC?=
 =?iso-8859-1?Q?TLF6InVoZ+KhlEoWu6vvi+3CV0yVw/WmwgsknD+G5p2YBalIjSc30JddS1?=
 =?iso-8859-1?Q?a/ea1jEavg/aNE3j0TfJwek/hEpnhGtxQmsPGTAQvvM7waq0aP0rd7v69e?=
 =?iso-8859-1?Q?j1FiYlTyfBzl22CiH4LW0mncgiWNkD9LH9nPZ3lu7ELtxMtZmaT5jAVjXq?=
 =?iso-8859-1?Q?ruJOJkeiaxYi1st/zv2PPYN8j2EXl/TtBQkSKnL83srtirV+A8x2TkbWot?=
 =?iso-8859-1?Q?GIE7AtchkqaLCecOkJL2gFo2vXmItodqu4bvXThGCjGyUU+w6UPOmsUrR1?=
 =?iso-8859-1?Q?9IkIwr9sizbtskmSY2SEylaqSolizbHR7YTt1Qu/2oW4salQ0ZwFAkRjcU?=
 =?iso-8859-1?Q?XcqOXRXaYJOC7dAkzvWFDLS8PEvfWdKQipdJGV1u7IzbRXJxEMqX5VKYud?=
 =?iso-8859-1?Q?YJw4H+vc03xOVHK3WyWMXdlV/hGYzqwyEdm/+wa/DYSedYGHgfi1a+abSN?=
 =?iso-8859-1?Q?aURQ7PBjRqO2n81a2Yx5eLkkwMRWuUpytvayWfND7k1G3QRLcDMKE89lpW?=
 =?iso-8859-1?Q?kFUzYgAFaA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pBdF91oMuTpB2YfYeEeYxXSpKX+L6iizasYWW5bVbMg131jpSeYNjuNC/swF1703qqbVVJySLduMHwVWRbr0/sXJHoRsnzFAQm9HzefYveBdYSfKoIP5sbEyv9LmdMWUjgjjQg3o4B89YzfNYAFpaIXDb6XjqMEltrA8m0k8AxMSYJipDer1JNhvM0tUhRTG+stA2gxzBeY+sNQJLogvUjN85AW05j5FQTrCyUYFDE45e7EzsozLQK5pYJcyd7h5Q3kBIe2dzLVt6KDoJUl7+CkJqa6bfDi1t3Xli08+K78nbKvVqPU4fEeJ3lehxsS8RUPY1S8DIAsEtB1IUu/07Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e10ac1-6e94-4633-8707-08dee8d9878d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 16:43:31.2728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCrinCgG0dgyFGZYqzTRx4Cmr7VdQVAIWiuhYYpgckX3INpPsKiTuviLB/h1qsVDkUXDOd6psl8cPUcbIsFvxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR84MB3154
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2MyBTYWx0ZWRfXz2b9co3Yuo9K
 Qs6JuK4NreG9Jd7Ms54DZd8qmmpmmSe/dD9YUrveH6HvRkRRueG0sswEAHp8W8Va8nH7/cEh2h3
 DIaZnNOzeEHIIX2cGYqQCiDMWIcFW24=
X-Proofpoint-ORIG-GUID: 4DTv3SLldVnlQYtOkMLvPTu22m9SZQjf
X-Authority-Analysis: v=2.4 cv=ZZwt8MVA c=1 sm=1 tr=0 ts=6a6244c5 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ModqzXLkJJ0tFyq98apW:22
 a=OUXY8nFuAAAA:8 a=sXUdujponYPtaW3b1fsA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2MyBTYWx0ZWRfX6PstH5EQ9JEJ
 DaQVOy4iwCe5HkRX5rhvhJcfApKbErarfsbtTzgaSBWIM42mJmivKPgYmffeQwe9ouLQfuhskUc
 bPbLapw752gBd4mn0usFrwOgcwZt5/gDAN92V3/1ezVm9t397Ckr9hgwEdUVNrV0hdDSf3pKszL
 CGq9So0sMlUQ4erQNR5YV2ypRoXNgYgnecuhkOBgubXb/zf6GhCTIFj/mk1sT9TzrdR/CNjjyFq
 HkMvoQ7vJur/UH4RDkk+TPRF6N+JlvrGX2yq0auSinjrmdUTxhKXk4vQc4+/yyrvkEGdTPVpfqZ
 LO+FtsbZL9btQR1B+klTF9M0lCKnZB3wJ78JRYlqKYo/4OaxrqQs+4OO4AD4X6Le+Dz7j2R0rnS
 ZZOMjD9qrzrCvc6m6vEn653InQC6MlhJIVrCIRMZKkeQzPJ6g03ynCxP/QN6hgfBStpQFbmKusr
 PGaIs/O2PQb8irVL24g==
X-Proofpoint-GUID: Hp1LrzPp6g-w7bEPt4QlXooN9Rzbb_Pc
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230163

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series adds a PMBus driver for the Analog Devices MAX16545 and=0A=
MAX16550, and the Volterra VT7505 controllers.=0A=
=0A=
The driver reports input and output voltage, input and output current,=0A=
input power, and temperature over PMBus. All sensors use the direct data=0A=
format. Peak input voltage, output voltage, output current, input power=0A=
and temperature readings are exposed and can be reset.=0A=
=0A=
The MAX16545 uses the same programming model as the VT7505 and is=0A=
described with a fallback compatible.=0A=
=0A=
The current and power scaling depend on the external current-report=0A=
resistor on the ILOAD pin, which can be specified with the=0A=
"adi,rload-ohms" device tree property. On the MAX16550 and VT7505, the=0A=
severe overcurrent-protection deglitch time can optionally be programmed=0A=
with the "adi,ocp-severe-filter-us" property; on the MAX16545 that delay=0A=
is fixed, so the property is rejected for that part.=0A=
=0A=
The driver was tested on Juniper PTX hardware.=0A=
=0A=
Changes in v2:=0A=
- dt-bindings: represent the severe-OCP deglitch filter in=0A=
  microseconds (renamed to adi,ocp-severe-filter-us, values=0A=
  0/1/2/10).=0A=
- driver: map the microsecond value to the MFR_CONFIG[15:14] field.=0A=
=0A=
Georgi Vlaev (1):=0A=
  hwmon: (pmbus/vt7505) Add driver for Analog Devices MAX16545/MAX16550=0A=
    and Volterra VT7505=0A=
=0A=
Sanman Pradhan (1):=0A=
  dt-bindings: hwmon: pmbus: Add Analog Devices MAX16545/MAX16550 and=0A=
    Volterra VT7505=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,vt7505.yaml      |  82 ++++++=0A=
 Documentation/hwmon/index.rst                 |   1 +=0A=
 Documentation/hwmon/vt7505.rst                |  89 ++++++=0A=
 MAINTAINERS                                   |   8 +=0A=
 drivers/hwmon/pmbus/Kconfig                   |   9 +=0A=
 drivers/hwmon/pmbus/Makefile                  |   1 +=0A=
 drivers/hwmon/pmbus/vt7505.c                  | 274 ++++++++++++++++++=0A=
 7 files changed, 464 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt750=
5.yaml=0A=
 create mode 100644 Documentation/hwmon/vt7505.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/vt7505.c=0A=
=0A=
=0A=
base-commit: fa8ff8bde9207509f90adacc157b208ee732adad=0A=
-- =0A=
2.34.1=0A=
=0A=
