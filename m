Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8882D0605;
	Sun, 29 Mar 2026 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774804222; cv=fail; b=XyvjOywEm0dHFb9YGHFLZo18ZyaOqKgzbFbfQWIPJg/kAOfL0N5k4RC7pa36b6qLUIu26gzNv7VydVlsJO/CcdfkZSGRdDfBt2KP5elze06NGLU3uLuHyfqHKqJLe1DbF0zIseI5k6w/U7b+gfN+Nv6Vq/5VyjfD3+FbUq64fQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774804222; c=relaxed/simple;
	bh=PXDqlSQDL063VTkZUGp1lZ17qXcKpd+8E/oBY38ltec=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MzJOEl96dFwcev9UWfWw0trr7MKaSjIYkvZXW0oYXIyQ/qWYUtT0LxlmKZ6ILVsypGeiXc0+78l/iVqAG/JngmObRHSey0ekkFCbmu6gaQNRtUTO4yWmaC62Ubq5OqBH4ek8Ojbf9lra6rd9cbFJYAR+dbpkRksA7uIHOQeG058=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=H3oxp//b; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="H3oxp//b"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TEsswO2849921;
	Sun, 29 Mar 2026 17:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=PX
	DqlSQDL063VTkZUGp1lZ17qXcKpd+8E/oBY38ltec=; b=H3oxp//b92u901uJFk
	VrDaFPut0mOLLiG9VC7Fvu7CDw/RsiDe+/6jCfoJQViLBIom41jYWv3YA2j8e0lF
	HPzVs05X3X2hD6QLkGiG7agpxOKBVzNDaWp0zYlcMr1Irey6IMAOG0dU4JKo8r4U
	DnpwVCiixmfnBZh6GYGN+bTtiUweOATfJlPWLEFtH92mQNx274WI1AZ1ah1W9DP1
	HkqKsgDwUsTDaYaZOUkMZvvzsfb4gn5dyigVJ71Im0tJEQzPKdsLBbpuR/NDjoWX
	AjSSHUhR+02C4yZknlH58reViCoQuDauGl/UU+PfSnH0MEjY3WA4PDzsRAcRub0+
	cQiw==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d768egkwd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 29 Mar 2026 17:10:00 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 14FC2801AD0;
	Sun, 29 Mar 2026 17:10:00 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 29 Mar 2026 05:09:59 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 29 Mar 2026 05:09:59 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 29 Mar
 2026 05:09:59 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJHT1IugVhgIAPerAEjnSGE3xmADd1swGVOuY6Lh9+j4qPd5RnRk8VrsWVViNLJOxG5KeWvHvLtUjlLEsQ+TTwmey8E/f0ymQaP9BRGHqBNF70/it/VyCv42m/+m9cvymhrmRKQAdSLnwpUSuEEbwJUQ0hHr0sD96EUSqqpbb1dC+LK/1WT8uAA7c+ckBSHTTePnqKXa+0EXQJ9kD4j8iQo+s47TEUPyjNwjM/IsLO5vxY0DXTeAJHi2HnLklWPg2yvquhfnpwK9jkPcfKXKLf5EC3UjvZBFp1fS8ZyInn+3ESmTIcNT/+iaX1fRb9PyfzBMjORThdq2aoAYWN1OQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXDqlSQDL063VTkZUGp1lZ17qXcKpd+8E/oBY38ltec=;
 b=KZT7pIc+8oTHKCXq9R91lIb5cZ46oAW25G0PojMP3e6e9GUgkVxHBJsI57PEh7KrZiygoe7Y1ahPiJKhUEbQPwtMcSO2axFq4pFIZylWAyzLcRzh59CfweflSWx07buQiUkjHbltIlkHggdujQh12FNCYMj5MzDxxMC7pUbhQrJS6mVn7Gi5TJ3mLYjBeBVKiBbH/6jILaN10I1hS5eXoXpIHF1Qh+qVpevqwpE/K0umCsFf6gyVj9Yp9o1vK0uYgjEMeLeY7q12jBU+gZSe9YWhKwEnt2dmTIOeB+2FHCbQZ+Nbvba2+o3YYLqfZof38VrXP0Z62BAibBnDCT78kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SJ0PR84MB1992.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Sun, 29 Mar
 2026 17:09:53 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.027; Sun, 29 Mar 2026
 17:09:53 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "Delphine_CC_Chiu@Wiwynn.com"
	<Delphine_CC_Chiu@Wiwynn.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 4/4] hwmon: (ltc4286) Add missing MODULE_IMPORT_NS("PMBUS")
Thread-Topic: [PATCH 4/4] hwmon: (ltc4286) Add missing
 MODULE_IMPORT_NS("PMBUS")
Thread-Index: AQHcv57c6U5hhqhL+0WfONoAgKOMRQ==
Date: Sun, 29 Mar 2026 17:09:53 +0000
Message-ID: <20260329170925.34581-5-sanman.pradhan@hpe.com>
References: <20260329170925.34581-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260329170925.34581-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SJ0PR84MB1992:EE_
x-ms-office365-filtering-correlation-id: 115fc983-9e79-4304-bd1e-08de8db5feac
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: sJyBPq4pNp7r/QnoYpzjBzFjQXivJmuLyUYLv2gR1Ql7QNCIdxaFojhYp0Fv90jRcrowUi08Okqb3C8alFzcYk6/d9aqQ16FY7bTgtaVSjc36nkYQQFl29Ii/hrbgYQeGXMn3XxcNcUQJDqf6dUdXcDXzT+jVARVlaZ+Uje9xJH3+zgMVX+PvIlDaE2GBspApDSQJVUvOqIoXtY6J2zBAUA+9VWuxFRtReJqkx5dSWFMbKOOtUn8g4KKmmEDprKKDn8eb9FfUvBDZbMVpQVfWMJKpLzG68tKp+/vQA0jEZXrsnA4vyFxuKO8y/3naMx8q/qAtCwrOX6FS92yu2TYLyHKfXoNGu+8Es6Hz6iFc11ewhsv4eAta4Kyhy/SLXj67ZW9/uJFYV+b4l3LSjJ20AtPoT22PzIe57uE1REcIywjQqxDr4CdmaR8O3IhNoN/1UUbhbx+zXD62FslbDh11zHK7dA8lPPdfK/Uev5DaoDwAwguO7OYTnsWgqRXXwqgmDup7ALhWUmcSH70iBp5kO9NhsR4TE/mOTyBD/2w9Ays/tkGYbQTf/sU9g+TPGjDLMN/yygcDOn+vXp5AbtBPkmvfjHnny2XAM93a1DZamIZRctt24LkWpp1njlHjayHyUVJMTJ+S9Red0VpEUpdO5iJKcA22IaAyQSHmn3ZJn6xD4rqMB/4pDpcICeTyQaLWnPoHknLZ83h0GQxuMJS8Kk25rPfeYTbcYYZ9Uudk5zNQ5vfFJNVbuOuT/OkD9FSv8EpZbEFglAwp0MfwcEFgHVOFmfMzii1+tSmLtm7+gE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4gC0OXlu8f8Q0t5pApXEDPwQX1TIWhRQOriucHMCP1H2lM6wmJ8G+XgckP?=
 =?iso-8859-1?Q?xyx/MYFUQKfdAfYTUQM8M4TBt61zHNNPQJ+8UgPHhQMl/2yjOVvczbfxpT?=
 =?iso-8859-1?Q?kCTEiNgfKVoIb0NnoF+7ib4Kk5LMXMg3ylL5Mct4Tf0n8pvCbDcRJvws10?=
 =?iso-8859-1?Q?LvKE565PTamW8h8XmeBWMdG4tU+/BoheTHKXi0ITQuFVRKZiFjLI9QG0a+?=
 =?iso-8859-1?Q?U9Am4qqBsFgOUGYRcqMzffbZy8uDx05jue+0xSseWC7CQWeLOpW8U6BQb7?=
 =?iso-8859-1?Q?dhjHOBgI9yHeRGV+tamWUH3pb9IntFnwgO3IQZwC6yp9tmQ/6wg5Vtq38T?=
 =?iso-8859-1?Q?gQN1WXzem+KGqFfNl6Jeti16qc7o/2weNcY8vLzqvRsnNwOkgstxoayTqE?=
 =?iso-8859-1?Q?OB5RuMVK51rtxCBQHi5h0P8IQBcryatE2X7sAeqYuTMn5d3mRvatwdftBu?=
 =?iso-8859-1?Q?owheqdh5T/S3W4C2/E/WEyf3IBofeAwV7tA4OHB4NwkzeFMpyU7t+h3IxR?=
 =?iso-8859-1?Q?bVeWMyqTecjsudIPFvugkISTo/wBXwnphPAju1soT8NB/rQwafvfvpnnJ1?=
 =?iso-8859-1?Q?GqAEvJ/shHBdLsE5idgWwwWDEPKpVpjjSrF+NJK1M4YXWchrPjoSauXv8A?=
 =?iso-8859-1?Q?139+hZ8XAoaSKqo6NTDleQp0Q6pOzeCmudV57MW1I9EToEcDJ+ow3dujVA?=
 =?iso-8859-1?Q?vwHQbV3vUncR8/CdivhtQB6yj8/v6t7lrFpRC2MNo0V/FSXyn5vP/nL49Y?=
 =?iso-8859-1?Q?JVA679tq/f2PSVfpahNeg2GDsMtcK5cYiAGLQsSNiEtkigf0wifFbN0xVN?=
 =?iso-8859-1?Q?w0OoAqFF0vctuk1QmyC9NZMPetQnMKQLfIoDexSkDcl/gwkymxsB+/1ly1?=
 =?iso-8859-1?Q?w9jwUyqwFeNwVargrKppZScbHq6sNVkObIHgK5r1vrxU5Gf5kQt/3Go00F?=
 =?iso-8859-1?Q?4nwRA+EtEhnQSmvLPG6YYC9QAhCs7lQzXcy8lFv6wMBrpA8rqbgD5TfKTm?=
 =?iso-8859-1?Q?TzUYHxCNWd6GwNMibtpOVUrrF25ML+qgmTgunJvNOZKqeOEhS5gQLAbVIf?=
 =?iso-8859-1?Q?pd1JiBRcevHtw8QPDihioY+RwG37EyE3rg/xxxab9Y2febxGW7EFUfCKNK?=
 =?iso-8859-1?Q?/mdbBhn5oBr547IL+meoj9fY5FyIKZr5+JDimUgWhwmVE5DeEFLE9FbrIZ?=
 =?iso-8859-1?Q?2TNCcQd0O/eZyPwWeacAUnRRJSJNQ956tI4Om8ZglvrgKTc6q1/pjjTPTN?=
 =?iso-8859-1?Q?fsmTpXmz9VVobQDcbBhbVznqvblf9tHYuF76IcF9VQmxX+sEeLnKbKCazZ?=
 =?iso-8859-1?Q?pzlqIku28yqAtKTTrTwRI/UxBRV5oHr9QB7opc/DaRP0Va7CqGWO8Mp+Vs?=
 =?iso-8859-1?Q?05lkS9jFQdkr67MX45TOxTxfPNZdwSlK9Ufz03son70sj8Oli44yfhgTPK?=
 =?iso-8859-1?Q?rIOKIpy9S9NETktktKyxvHErtxIZ6JcBUKFRRI+QfACJrODOqGQ7D+fvDL?=
 =?iso-8859-1?Q?Hysq1rxyHv3cy1p5Wh9bqoUQuUNg69gfHX0Mcu/U6fPTiltqkCVCqoMJL2?=
 =?iso-8859-1?Q?hfFoFk3NJOGwJ0867JWYF1djGYysQ8Vc/mSIaWvoXV2J+2nKJchlNu5Ubz?=
 =?iso-8859-1?Q?MZgj91Xxrb38N0OBT0g+f7jBarVmDlBbX55iT2gCQuuJyLkf16rPL6imkP?=
 =?iso-8859-1?Q?M99/m37CUxob2L2AF3TtMoeoln/YHYSs9wDpaUxEfkW9i9fpbGF6kKxFa6?=
 =?iso-8859-1?Q?OrhuYoqBrXCzAeUhDqVnnIJGyYveZYuEkV0z19yGcTwKS0CaQnhVdUEHkY?=
 =?iso-8859-1?Q?n3ZugIj/1w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Bc+lVOmuMiQymo9CpwUq5XKBrCxOg9HOF7NNMnx2aormbzdfGDdfzWnO5dU/9hsQ5uyt6l2xWwsc3gOKA00kRKP66IekLzyKOMsGMxc1JvpFRSUm/ZkC4nzGw1Bs0wOpUI3eagXLKYQgCqD1oUBgNHfGj0auXr0HycVLNf1NHeQ2cr3bj8mOA1UqvdE0YfXrVo+uBuADr9BuHF5cD3dsuh4ehWM+fi3tLu4hXJyYanW9A+UX81sFrKistd+GF6bJiPNS5uV8pykSkYQQTbmR+5XsczXJDdjDAihyWw1hiIWsGRB2O+K3fa5jEOqJOALeeJ8mpNmKgKtCIa/rREDzHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 115fc983-9e79-4304-bd1e-08de8db5feac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2026 17:09:53.4275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Tb4SVPeVyhFRQIDQmQ5F9jpgk//DVqoKXS66IA4XRoblbqHyM43kci2QBHIaW0UqW0/GKcpdx0vdfOMLqTzRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1992
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=G5IR0tk5 c=1 sm=1 tr=0 ts=69c95ce8 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22
 a=OUXY8nFuAAAA:8 a=cPYzWk29AAAA:8 a=utbyc8ruBblTlh3aM0cA:9 a=wPNLvfGTeEIA:10
 a=zZCYzV9kfG8A:10 a=cAcMbU7R10T-QSRYIcO_:22 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-ORIG-GUID: OdqyEKAelzaVxmP5nwmJAVij3nkBnrCC
X-Proofpoint-GUID: OdqyEKAelzaVxmP5nwmJAVij3nkBnrCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzMyBTYWx0ZWRfX1ZXz16sTEG9p
 5YXHh+x0PAk3N8b4SJHFmzc2z8nOpxKqHqLD5KPVRV2fnWp7ADITm6t0VxlaxLj7A2E0E4zb1/b
 wRFlV8T2/aSw3Y1VyS/DEBN0MMTQmBAwzKGhni7GhJoxrvKsGvBsQtvPIlZ7KDj3uoyfhLRD1Jm
 5CsP8w+3PmE+1jka1Qr1rgYiqG59T6wf26bW9BWNH1q8oQbN8GDc/gAi0rRlxBjnVuNAWy/R07n
 svRGEnP447U8WY2IctKYOURngI73B8BSfHirBMIIFqL1dNgLnXSFcv+Q6pbWo84G1NQdB/uHkPr
 N27Qphe9ht0YKtbmCSNxruRWboVDhN2XqOOKHlqOtijHIfv9iXknxI+mvELiPAO/s6Gx+0xnXzV
 vI3HHliUlF5t3aXgVU4H1A71NLoTAFEHcFg1+Uhx0NeO+xPyPKvkyflUue9t/871zVZBZqTyUiN
 CYpJY8pwV8yFgn+vx+Q==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290133

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
ltc4286.c uses PMBus core symbols exported in the PMBUS namespace,=0A=
such as pmbus_do_probe(), but does not declare MODULE_IMPORT_NS("PMBUS").=
=0A=
=0A=
Add the missing namespace import to avoid modpost warnings.=0A=
=0A=
Fixes: 0c459759ca97 ("hwmon: (pmbus) Add ltc4286 driver")=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 drivers/hwmon/pmbus/ltc4286.c | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c=
=0A=
index aabd0bcdfeee..8715d380784a 100644=0A=
--- a/drivers/hwmon/pmbus/ltc4286.c=0A=
+++ b/drivers/hwmon/pmbus/ltc4286.c=0A=
@@ -173,3 +173,4 @@ module_i2c_driver(ltc4286_driver);=0A=
 MODULE_AUTHOR("Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>");=0A=
 MODULE_DESCRIPTION("PMBUS driver for LTC4286 and compatibles");=0A=
 MODULE_LICENSE("GPL");=0A=
+MODULE_IMPORT_NS("PMBUS");=0A=
-- =0A=
2.34.1=0A=
=0A=
