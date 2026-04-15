Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C9199FAB
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Apr 2026 02:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776219701; cv=fail; b=BfwuA8cHahJLz6l0FIdcPQyJTZF64TgJ4TR5p5RZfz63fTyhkq0TlPhY4UAotpAH0LHsJx8NYDYkMLYjXt1VLMck8GdR/MfdZjC05//r7/8+pt7vPcchRO90hD9h9H7P9Rk4R6/lNSq8jXA7c6Xwjk74+d0zVaXBK15xMJKm5a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776219701; c=relaxed/simple;
	bh=3kr7/5Erqq3kHi4OtmxeEudBrFmehHAybW2sG7j0tBc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s6xJTTcruG9DNCGPk/UHU8Y3tRQgo5WSN08ROBk+GVQjAsB2MPW1k/jTM3YXFCFr0tvMyaT3TchBzqgp/i2Uuk22vq+002SPtS5cuqunc42vJdZzBaiMfHBKueqg+gdNgaikyzKGV65bkDqWp6bMB6mwWvFn/BI49wcbdMY0VIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ktP+ealO; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ktP+ealO"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F0CcpC963396;
	Tue, 14 Apr 2026 22:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=3kr7/
	5Erqq3kHi4OtmxeEudBrFmehHAybW2sG7j0tBc=; b=ktP+ealOA/2El/o5sSVkU
	D8PFkFfR7RuO8L/SjWGg1/bokC0aY++/nV2LiCra5XkGbb7TRGYtVlKHY0Mp/VrE
	tt4A8smhv9ttiuvC9CGlrc2hXhL8M8L43UP/PIRuPyCMbfHaK2zhBmzHxa3YMaO5
	L6O9z2hJ7dgVzNiD4+qAi/2PQeB6Tc/JDtPK3C6+xbU4Z46i6ordKIy/3cVW+2PR
	xa6Ix5iBR2QOCQqnP9+7wcEgq6WLAlFYYjHuEsNomn3DDdL4kTYtsv7TDGsgcelJ
	qxAzitnnwmlBcvQ9vOLj3E9JnwpO2zTcLpbXRX675As+ai4RJaiR2hP4DGY/Eb4g
	Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dh851dfgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 22:21:26 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzF3xbzZd7zE6FKHs8R26vmacTWKsGIyO+5egYno/30OkdkM7IPnDT3Oq8qLZTgyYyFMUtDUThG/l+QXc4oYU5dqFn5wwRes+UZ9IYUUAnELsHGzJGzHXRUGv+yVaMVtTladiR7iQi2DPHlVZh8RlZgC7M19z6ucPlMMR6PAWdFGGNEssku4LExjWBYFJWERQx7CcoHKrd1j7yG8fBAEHwoan0l4dqLQahthSlmDOqmFTsonzKXnFPiuuAGYjrlusPpOq0vrIa3dc91W7Vyvu6FCRABH7beGnIZmm722L6Rdou7A1okSqPnF0g+ykbPbK4WnRnXCpjXnGexkr9PVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kr7/5Erqq3kHi4OtmxeEudBrFmehHAybW2sG7j0tBc=;
 b=DoS0xdkXqJA0Y2RyA+hMRCrFxy77homGigmKkxb3vGPPrYpbcdCwJQ7S2PscYw0cRqvzhQYw2OKGoSq9zP1PGjLp1+SeGhEx2IYQLPkGTWkan0o8mPAzNyzG+GukXw3N/D5uSajzDLDr+3b+1R4yifwNYGciAQrL+2ZIcicJMMXUe4J3/6/b9dwxw/id5moAgxTKUKksq4oW5DEAj1lKjg74oVZMvlLAlgE4aBILlQo6eavmj+EJcH41nN8ywNPAst5gI+WZavr+LnB5VFC8cTWLk3NE1RlUX7II+UTDQXI6GpX48JDeQ69c/FP7PrboIAqmhTdc0LAbBIMwNoXTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by PH7PR03MB7414.namprd03.prod.outlook.com (2603:10b6:510:2ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 02:21:24 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 02:21:24 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko@lists.linux.dev"
	<sashiko@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Topic: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Index: AQHcy8dEUgafwxoXDUyLmPRX7RRvmrXd/qEAgACm9YCAAL46cA==
Date: Wed, 15 Apr 2026 02:21:24 +0000
Message-ID:
 <PH0PR03MB635179B8E59E60DB994415A7F1222@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
 <20260414045647.4AACCC19425@smtp.kernel.org>
 <69f893bd-bb38-439c-b7e3-30d17c6b8cd3@roeck-us.net>
In-Reply-To: <69f893bd-bb38-439c-b7e3-30d17c6b8cd3@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|PH7PR03MB7414:EE_
x-ms-office365-filtering-correlation-id: 1cd0a07a-d1e2-4a84-1026-08de9a95b137
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 u2RGFBMGEHBeOOWU/MdQ4fpwper1qJn61x/whKnmbUEmBFp7yJpxNKZt/BBmbPh/kY+DgS2m+vDQcDttUh9yjhVahC2Q6Eh3RAPfUjGteB+nJ7wZsAC0467Q/Lr+6RQWZ8oFrMpJWmsCSzXrw7VjCZ1Y3OXmmCXmT2st01eMavVQpY5jllJGexCRikRVy4vHuNb5IPRiEKdf0lK1uR2IP98c9yB6sVeNLfhltelTBHkWGIExIvd2HfTq69gzDnvqWMayUht5AO5mjch8TCmKU9njcEG9jjqLLdlpn8mPkEx8+fmeIlTm1nqhnOdShT0JfOCul5sDh+ZXZP0Cc3hZBV9A/4YQBmc8gfx6IB19dO6kviBmHRi06d1EVpTiX006okBJAHkT9HPwYm8s5cHQh/vr34pSG9CHuUUMHZrwAWry/wDTSLOKtq5KX0JUISUsfvEkMIX1k5sGibEZ0s7hefXPU1bFXHSpNR9GPa9ZosLtVSjOa9PKz1IR3BbzOMrdW1wbTuVAf7adaIg3zEjsQdZZLLmTt7W3IDhO9DZ+MOL2VX5tkAB+oW2nbPdoJCl8XsN1nHf3mGUaftHCy8FaXsRKXw5eq1e5J/CXVdYo2mUFOM/ZOXwSIEirQeh4cDhI0xGInodmQ1DPSflsK46yjTmrMYDHmAwWK3y7izxrng+Kd+p0nsLMidi4qigLd5bQ/bjDg/J/93ZijOULTyJEFSDAK6rUYJCVnvlKROSwoGzhRHfyiRzsM/JI3ZdFCTvURt1OcZDCwrIYJesYvcfKURiL7B634SfuFgvIL67ZK+E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3lzZ/DU+WxHgaXVfXjduxbdTDAAflEoS3cpAiU8Ac3YD5xuSxyqrB4MUptvu?=
 =?us-ascii?Q?+wpXvhbgDpWOcPbJNL111utlhRhZCo9wmptL/YD6g239eK9SsAvyZYzMHJ1c?=
 =?us-ascii?Q?zPeQ1dHaBIL2dNOiQGqk/AqH4P7urs5gAcGqxugWfiw3oi3OvTl5G01iGAZM?=
 =?us-ascii?Q?JMN3eLvevs5Qr4gOBB3/EiHN68p6T0yGP7RFqQyPIiIerZnVQFlQSC0cJLBy?=
 =?us-ascii?Q?xtt2eWIjSxcoMXLoNW/S+NZBZusiTLYA2Kie8OnYkGWb8+gaN0BdNjusZjF5?=
 =?us-ascii?Q?njkzdO6Fdp1Oq3EZGVtBd3vVI6RDgnme9W1eXO7tw8CmTWvoXDKbfZLjEfxx?=
 =?us-ascii?Q?5k6RLWEGAqVnXf/vTuHGddi1q51fSCLGoCrfjOoj5esdW0nrxskhmpn0ADix?=
 =?us-ascii?Q?Mu2GXJPCATQVB9TuJrIrnQiWVPhtx6J8oHl+rgqppTD3tgPfEYFMVb3X/U/d?=
 =?us-ascii?Q?lZ181fnB3RtThNmofCuj33Zu7ctRKFTBCMWVX9S6EEn+h6rZcHuABx4bJhpB?=
 =?us-ascii?Q?07FWlqnl5QEnjLDHC1/zcPAgOXOs0ADqsyuul7su31orzUigNBDFoPRvJGqp?=
 =?us-ascii?Q?xyM9T4aJLL4O3IlppDhhUaHE+umjUoe621N6BOj871UKXSEEcig7hAyADESV?=
 =?us-ascii?Q?PYrUPXq92GDN2y1Yyin2YixQyusnIhah9IhKijCp7lny0N/IWv9vIkjjEBDa?=
 =?us-ascii?Q?CDTzo+grMRNSqsGaAywe9+TvDOYBb8Kmzm/3cynvy3TPT+k4C6EfuP3itV0i?=
 =?us-ascii?Q?j97s0iszCotoisR+Tn8I+/12NICyaGtWV1vok7DnznffVltcyognGUfgsmK0?=
 =?us-ascii?Q?14i3PArlskr6N8hCevjzj/jK9jBLftWx0+5LVDBwRCE3mKrhimUjlQ6r1cT3?=
 =?us-ascii?Q?F5FCpNJ+YwdUKsKLhJbVG8yXohiZdSt8Rv4kO+JnGKY2caUOvKVFvDg8/p9f?=
 =?us-ascii?Q?lROYO/sZ5SYR1vlz89iVVAK5Pdzb4v5wZ0Y6FVGfg0fWdfOVoPplz/ANVw0X?=
 =?us-ascii?Q?7n4nGqPJf/GnUURtJ5Dfcbk+ZgMWQGnoi8fIkIYtFRdyCJY7tUSnUqbT7VT4?=
 =?us-ascii?Q?efqraaytrgNJvxVNuJBgZ6O4q8j9IH3YYYKubG2iyf1ZXbHXe/XKipA+4HLV?=
 =?us-ascii?Q?MFKtIBzaw5I/v/2HNUS5NMsCB5j/cJZr1Yu3b8p47bYfmUJDQO8QhF8gksGJ?=
 =?us-ascii?Q?HwubFgS3oxIxnw/TzPnar5vTp3udVPrxlYiUEf4Dhj3dRZfdRZU2cwmxH4Tt?=
 =?us-ascii?Q?iGtrFjYfZr4ITyZ4XMDtmVyuAtrhxsRtRfUesZyIdlO/AfCVcQ4eOTcbo4tA?=
 =?us-ascii?Q?naS6mWwnmLYKtTDOJbUFFT55PogmfFaeC7PuAF7RwHHGn3Nk8YxNGOa6/rMh?=
 =?us-ascii?Q?PsC9/hXlCnujw8+WsZDxtLMsEcIaS6K3Ef039b0woW+eYVhh5vJsCwJEJkAo?=
 =?us-ascii?Q?jrpeg0w4zD1tnOA3vC42+pgtBTtHPKqS7r2XCneVyUnvUpC1R6360D6oYLHc?=
 =?us-ascii?Q?4YyIbmhJp+9gotahaLyfxwyJnx1+vwPq9DzXRh/+QLeZjiOVMpw1Ln+v0zou?=
 =?us-ascii?Q?hW1Rcz+I61VIGzXijHeZ5u9WTKlRn+1p39O0ygVKafzrjS3ttLyDowcf/J3W?=
 =?us-ascii?Q?5O4IWV3cw51BhrBhECtyWOqDoujofsrXRqYHVQHp4mcQ3I+tsPvDzq+EI8hR?=
 =?us-ascii?Q?sh1J8zIkOF6/hjS0ieK/Q4YqqCx7QKl/1ul6s4PBb2uZMEG1PPvjqr0HrzSV?=
 =?us-ascii?Q?5IcT1gVxKCbiOwzQ/hOl0aL8wBQJ0RU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	UCelBDJrS8w/V42SIbnmFGeCaRuutzAA0khz6IkPpMjFSQusgCJ/LF0yNwaZyUmvN+nJgsYmAQlfxis9euiAjd8rcbNJ9LPlmBubIHOuOjLT2gsc0us8fb790wGgEnAvVqB9YaCTjex9x7qJaqvvl76SU8wRLN70tJd18trg+tX9q0QUoM1LUnO0/Cjpu4zxbPF+1kFbKJzNHa67XnAzbyToJAyKP/A1n3HB2XZJLIfrSXshC4ucY79Ujb9keh1tPllNoNQDUp9IpvYms0xy2nR1QqEs+oawfrOyFZjLfyHV4rLpYj7a6p6LZKidqqgqthpCjWs6pgCD9gxPtoLZWg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd0a07a-d1e2-4a84-1026-08de9a95b137
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 02:21:24.6561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: teQ2MsVMrsXSRhLD0ozypgo/Pv74tBlCLmqqz7JmOzr6UU11t9OBHKqnlrxo0f+7fdP4g48KtHT9k2xSGUb3tVC+gobT2GepA9UiAPcR7AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7414
X-Authority-Analysis: v=2.4 cv=X9Vi7mTe c=1 sm=1 tr=0 ts=69def626 cx=c_pps
 a=0Wok1Aa8RnZXRT++mDYMDg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8 a=DCdF2NmUIAWP7tm2pisA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: vhToxQbspBxIS--_3QA5EkroKL2bWwzR
X-Proofpoint-ORIG-GUID: vhToxQbspBxIS--_3QA5EkroKL2bWwzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAxOSBTYWx0ZWRfX9bb3VktWc5fr
 OGSAwwaiWJmH4+BynWbqzE+Wk+zVuJWDydbv+xNL4ww/YQSZxDpG+44eRDmsoJ5zqgNsrfjDjnF
 A1HQNrxks9+qyzFx/SCGNdCSX2Shx2kxWiSZXMVNaZ/Qhqpl2YAz4duk7eydv0Ymn0sIc51Hvaw
 fFszbV0JUgYHDwql/e+iAquzRpnL1mGK4p3/JBSGbMCxKDE+x0S8Bas4gsYssDp/Ohp2tslQMdB
 lkEDgnxa7k9p7MHghVcXZEuofIRIerthZARvxtRo5SHC5QtSzJEKXE0PO2y3nUG7Gd5VhLgX8vm
 DvN74lz/kRh+GLfF7T2CbQezIfs8adWQz7yM2+Jmdy6emmXycZu6Oc9Yty/zss1Bj7gnOcRVW5A
 2usEXuAF2+B5uzHqvTckPUE5Sd0n7Z9AQ26cxdjIvxG+ZHE/LiD78C8hKZ3dS8GRI15caVNF625
 oVRLQQB8fQLAhQWsTWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150019

> On 4/13/26 21:56, sashiko-bot@kernel.org wrote:
> > Sashiko AI review found 3 potential issue(s):
> > - [Medium] The driver incorrectly uses `i2c_smbus_read_i2c_block_data`
> instead of `i2c_smbus_read_block_data`, violating the protocol and loggin=
g an
> untrusted binary buffer.
> > - [Low] The MODULE_IMPORT_NS macro uses an unquoted identifier,
> resulting in a build failure.
> > - [Low] The sysfs attribute `in2_alarm` is created but not documented.
> > --
> >
>=20
> The reported issues seem real. Please address.
>=20

Will fix the missing in2_alarm and lacking quotes in MODULE_IMPORT_NS macro

I may need to keep i2c_smbus_read_i2c_block_data. I'm testing this on an rp=
i4 and
it seems i2c_smbus_read_block_data isn't supported by the adapter.

Regards,
Alexis
