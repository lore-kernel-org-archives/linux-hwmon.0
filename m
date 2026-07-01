Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A66FC3;
	Wed,  1 Jul 2026 01:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782868600; cv=fail; b=XzUkhqzKkrdIoy75/YwBj0pZ5j3sZ3tTSWxpD/wZSnnjH2dyY9HqPNDEMJuXtZicsPIamR7Wp3XprdtNmRvIuI9+IqgfRtYyIMxLILxErzpHCJl4a5kQ18PCmVoZgWFwoZRI+IwJ9O7ip4Gt+XChIbWVh2BfaUUmQoi1Z4xRw1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782868600; c=relaxed/simple;
	bh=IU/0RsIGW2LBfGUk/UMh9z0LNqWuCUAg1xZ2kGqOeHA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BD8s0W+vXqWwVSP6DZIDILtDONbZdARc8DJff40palQZU547GvleW6i86sohLzW5CqyTHcpWS4NBSgEUyqm+BDbki+qanLgdJbZOBgWEQl23BnIWYtDsBzo5MRhgZ42LXh6/qXTf6ciqlPcJ3iZPZG1L/bvkKgz8vkihZTTL7KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ADHC+nY8; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ADHC+nY8"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNNehc2086830;
	Tue, 30 Jun 2026 21:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=IU/0R
	sIGW2LBfGUk/UMh9z0LNqWuCUAg1xZ2kGqOeHA=; b=ADHC+nY8PxMhF591uDi8U
	xw2kwCpymjygPSt1yZCSVsaUGBgZBfYmxtKP8+co36alaksXgmbSPnCYsuKqRC3/
	JO/fsWXWF+FmPSN0vJoiQvJr8O48kE4/2W8SLlz25m/S/h+j5CRAFCaw34BM3I46
	MQgQjbqgGqQ+G3EE7TgQH8c//gtNEaodyua2Q9K+IH4mjdQ/dgY1aU4eEEH6AjWf
	/4p2138razNq8/X+fvjRXWdghwcOTxuu7uh2zI3DPPKfbyKlWvPIho+eMvDG+Vd6
	Z3jhmQzong3tgftKVslKXTh3fgZHkrWrpsU0BSha+sKaSmC4ox039kOnyU38teLD
	w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013033.outbound.protection.outlook.com [40.93.201.33])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f4kqt96bu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 21:16:14 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDHrB9vFZvr1JQS2Ev2e6mmJWkXJedhYYQfUAUULgS6zw1YG7wk5i7TbZw0PEULMsu58L3cqguwCw5kYm47W6KMVDGXuqxxmdnkgeG4GJUhA/IvxdZAHwcQe80+4Xlx2ot1XFgm9RGSITYyLQxS9WGibfuu2Xtt6pruO1MIBZB7oZAxTRwD+OJcq2kO2ck6DKk7nRf9VWgSlKtuLTi2eBr2f36pRkY4guew2QsiPtMfekAFPrxA04H2VqlbcMfuzn1TbNhhfbh8SbKs1SLGzRuI6lM9jhiryMmW2wJkQPPe7i5r07JhnYeI49yzCp+P5UoZuRRlV9FyIu3Xl7Bv14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU/0RsIGW2LBfGUk/UMh9z0LNqWuCUAg1xZ2kGqOeHA=;
 b=CQeAvlviuFIvUA1zfm/akdvy4C5W/S5BuUIF3vl/MQt0mla8IGojSK5TQvrkLtXkMkTFnWCV0FPZKHHv6RuHueq2++1qUrMzriVxQ2/Q4rfxrh0MrxCLmKACARcssZoqTBbDr2pVVNLdCHL+9jPNUGsyn6IEEaLDWoZ1Syd8Fe5e0o0whb5rnQJ857rVPLhwH45/CozmDdKjpSHFCTTYrGs/JB4UwYtWeZ8DuGEV9JFkSML7jXRudQdIMndTrl47CY3xLYFAaX72tUBGdsbmZSY/Hoq1ax+FvrAAsm/EQNWnqKzQ37e6cnYATPbJkzaBS5iaRy7gqnRORjf3QfzGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by PH0PR03MB6679.namprd03.prod.outlook.com (2603:10b6:510:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 01:16:12 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 01:16:11 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 4/6] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Thread-Topic: [PATCH 4/6] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Thread-Index: AQHdCDrVZiwchKg3IUms2bCkbJ1VqLZWiGmAgAAvexCAAIOHgIAAnNGg
Date: Wed, 1 Jul 2026 01:16:11 +0000
Message-ID:
 <PH0PR03MB6351ADE44142C6A3EAB38721F1F62@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-4-a02786bde470@analog.com>
 <d306dab2-efcb-4626-b480-c4e8779cdeed@roeck-us.net>
 <PH0PR03MB6351C114AA65A11F2E133B8EF1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
 <3e5fe838-6c2b-4bd7-9248-7879403e6f34@roeck-us.net>
In-Reply-To: <3e5fe838-6c2b-4bd7-9248-7879403e6f34@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|PH0PR03MB6679:EE_
x-ms-office365-filtering-correlation-id: 433e2f61-10c2-4b8f-6ad8-08ded70e56c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|22082099003|18002099003|38070700021|3023799007|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 E9Hf8kavCuHYA3dMXB5+Lc8w4QRWzcer7MSx0JgK3FTspSOZTFhv51tGs5lcJSiEAb7i/PPXE90D/LKKaPUM8iEFVkEYtX8XNOgORGr/VGKNdlQsi4tX6/HJREeD7QJhhMxFocVcD6vxFj5BiNLX+PFeZ09po/84UxcRgcML82TWHh1wmuDdVcLElNTSC0GX5sdM8huN0zFM7C6PXVKj1jSts0U9boUCzMI5umuK6tiRyUM0JWG1CmbM7dfnGa4RCGFDGl+mFxuWb1+EoYg9MTXmMCLWT9Qa66uxDA4cMw6oLQvDxtLlB5BituEm5nAoOEjtUQgRfsUcX++whfKutGlIi8GnOhsyJEHDO5NTLMU4ZM8yWEk80SwwarjPpBnpKUWcaqnqKBZ15zzw+xKLDzoAhKLWdaivRShQVsuyFep/IXOxM+pAQAFBKwydSsCIcgsvuitiHrzc+iRZMMhd5Rob1HruF56hKaJljm9YQkfoShbfxxKW/y7GXnLFGMnhP3fKfmKFMons45EekF4IubzdN7n+ZErzV9sYrHG9+sKh77R4fm7wUDN+Tz/NnUsGec4n/sh8jvOqww9Ue6+8htCLUbWbBKsNrsYF9hhmoZEsCSVolZJE4N0xcpqjEqEC9VQcMASJVRRTVbWEoF6k3J7Wk+RWLKnkhG+0AN1CLJqsFBkIK5OJZJouTdzi2ODUPFdMpr3+eyWYedC/KRROBQYv2qXoMOVOprDHqOeKL8g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(38070700021)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?06G5FzVsHTccRdA05s8N/9p4CdLeHgHai0Pjv20A21n9Ksq/k+XvseSJoX?=
 =?iso-8859-1?Q?F2CjaTVyAA/js0ZGM7nBO4WRyTVavB/nYylAt2BYSa1sCVd13+x1qC24oB?=
 =?iso-8859-1?Q?g5tgz48qEVFe3MzyyqQx3U+K48iM92meliaP+SIzxAAq5G5NjxdTrEvSqP?=
 =?iso-8859-1?Q?3/7gyWK8YTcTpB8A4BvcsHmu7HgJEIEjZygpoBzscyoZlhEknPAu855im/?=
 =?iso-8859-1?Q?6ohjyvJysu+liJtovhCCJU8WSIdepMoOz4P6cgeDPBwUR+CQfbgWwZK3tY?=
 =?iso-8859-1?Q?PB+OcSnA+Oi6XuzXDTbNC41W0Ryy3MnQ5DBAoz1s7xXXHlJabLilboagLk?=
 =?iso-8859-1?Q?nCWRJBBHEGeDkNyPpyvLYlx2wMjjEJfxKjRW2pTdXxCRGVk7yHvgH8zrrf?=
 =?iso-8859-1?Q?MfzuFvvJ7GwgDt6zpPky7O0b+QUVoaLpCr0Ct/qYXPoFJnQgyYbO1RiOhf?=
 =?iso-8859-1?Q?/4NimHQBMakFAaOFKnGvTN5ejzYQBAqNkoxp7+n++GIIbk7dxj7/lCQdhN?=
 =?iso-8859-1?Q?wOeU8BqWmpIk7Lw1QM3qOBUZZmFvJA636g2hnmrVW9r2viDqMKTLvjz7EX?=
 =?iso-8859-1?Q?bPFzeupQSULJGItIMz7b7SvMFHIvnQ1zd24qjTVIeLd+rOeUxee1Z1ODqc?=
 =?iso-8859-1?Q?HMFBGE6ozk5au1WvD8G1MOLSgG11UEhDlCcOqAvFbpQWO3RTQYz6mTJSDu?=
 =?iso-8859-1?Q?5eWuSDDxSHlj2wPB+J1GHQ+1DImyI/hqaNo+9p+EcHrEtUcS3ODm5KXZmC?=
 =?iso-8859-1?Q?75XU8QrXhZXK5GN6IhmVt+4vDR7+ZvkontykbAH6/RBY+6RdTnMIaraY8m?=
 =?iso-8859-1?Q?oezzTZNABrcHfoT5Kc2zmY4zeCtUehrEk5kU2q+xhdi4dekKE5rJNpWUSw?=
 =?iso-8859-1?Q?6vBWFc1Nz7DS7ilWsu2F7dDt/28wkNO9+vbM7RbuR7GjQ9VX0qNLg+549L?=
 =?iso-8859-1?Q?tgN+PNaedqnbIHup2DRzNfVJZyCS6O3buBTt5Xu6KNiEIKPx3IGWrC2A5B?=
 =?iso-8859-1?Q?uyYGzPXO2BiUBWUYxsHy919hFkGVK013hpwqppncjhLiPdil43JfrtfVDX?=
 =?iso-8859-1?Q?cynwjU1eDPxqTQXpmOdJh1khxpolxZLbIC79cPw7jKX8WyJrlzvxAlppzT?=
 =?iso-8859-1?Q?mhwF0cz+5UKLVlaZOgXcb8qjqNQgE0+mKhQq2GvHEa9fQo5Eyd2XfV8nCQ?=
 =?iso-8859-1?Q?n2kBd9KzDss+mA+VpIDvz7NFfH/dZsglDaOCWVIShDmx3M5CycE9FXS4tc?=
 =?iso-8859-1?Q?ZtfgE2DzfRSqhFst3YvYo3HIiVkyYcsUVhnEkPkGWyEC+GkujMvynLzR08?=
 =?iso-8859-1?Q?d5FPv2dlNSREURJ3EynUNYgkWx45AuNU+PAgR67M0SrJQYQrZbbbxxKsIO?=
 =?iso-8859-1?Q?T6lWY83CMEm3+MbehIQrP948idcys1xeK8xah7dAwRihzH/EPThTbLW76V?=
 =?iso-8859-1?Q?kNuGI+Ax9SOTSMwlTHsCvZKUYHm6mlUJ/YJJm+0RIyj8JusDlon6MBuaHU?=
 =?iso-8859-1?Q?2mFdDDND9pEK+Q7SRJDWDoX4xYqsWeHMs4yrqG3MLx624LAoko0UJe0rEX?=
 =?iso-8859-1?Q?mK86b/9uwsXwpMq9HWKdLYr4ZP9HKE///7mqFM2ooeF1erfz4hL0cZDplQ?=
 =?iso-8859-1?Q?egb/0chaiMIEjYeWDeLiPqgKWLsq5tjIag8qOFdJ5NzqPLJnatub9Z1kIw?=
 =?iso-8859-1?Q?9Cykm2wt9a24t9+OEIT6MMEO8Bm0KYW5q5B95K9Vel/rAdGebMdbcGSPdG?=
 =?iso-8859-1?Q?UYyYlGJAmjQq7yznoD+BBZzcXwsVbRb26rJRwuTmoqy5Np3zf664YLDe4s?=
 =?iso-8859-1?Q?m3kC/j7lmE0xh/36rL4XZtHU9mAUUeI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	DEE/eCXUOm+1i7+NxH0uVn0YaP6Qxt0YqVPZyhGBKcghIfZr9ZcRpkKLR595g+qXzW9XBVG3WbuN2phXG0QRrWwGin4WXwSRprKTDDjyR7L1bGeE2COrtbpfOL28kZCnMZX0Rx+c5Dx0Pe5iVwSzk/rGSyOK9/M1wpYrnNivgDY9BkpWzjxHVjP45Yg+RH3uIWueGbe3yRzsKa/vONWp/stSoPt9symTaPqV0sEkNOnaKHTlDZdaoDAo4ydCE9i2ckb1/uG5oh4Mwdup1Wn4C9hPRZPbnnAit5sZ7iyVgur0DzlENSEbXDB3XvmRZKX8jsgL6JO+Rvyna6hENRlpnQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433e2f61-10c2-4b8f-6ad8-08ded70e56c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 01:16:11.8350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52KGkXlEr+rZILpCTfzA5S7k5Et5s5MKcYbEWqrZYUn5f7+wTuqTz5/Ncflh8wv0l8CRD4NxG1i9uaLvt9VYl3zdIIbvZ6NxBA9rPCcNVZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6679
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxMSBTYWx0ZWRfXwrXHGxHTnjk9
 KxlpkXo2ad6zyviwQjdpGnC50ZsKuAi0cCN9ODlKZqoE0lFjQUhCIqRVRcun24ovfeKTtCcJApm
 KKTYX3Qv1SjbqhYgsnOU3UBqDBUnMjLE8nZ8CgyKlUOGGt1pAmRral+RiIKimbpv+UWJj17+OCd
 ihWL4xFt76vS8Ner54f/3KverfhdJfqJOTSsdoLxAbwpHsr79jxyos/Su/O0//PsMZKZ9ZOVlcP
 dAvlRACrgUE0t8Wh8y8RMPz+cb4GN4YTjbMnVgFaFu/s07EKOw24RPqGF24EIOjf8IUXPtZ+rEu
 +IbMFZx+N85mgC/zx4qnCZVZ9jCCJK1ZNcNAhU0XXOhBqLFakAqgFqimuml+nkp0S1pIrtNYgUL
 JBQikIOYVaG8Z7TtLoxtL+SIreZU0Z5UwNZGwMGQMS/3v/WanRY7qTvneOfltfUsIGfEJPASvVh
 3ueEqV9aRmH8GILxMNw==
X-Authority-Analysis: v=2.4 cv=V89NF+ni c=1 sm=1 tr=0 ts=6a446a5e cx=c_pps
 a=ZRTQSBiCf/ik28kxSsFIIQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=Z0pTeXoby7EwIRygza74:22 a=BChY_YDTufD-rpaUFuUA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: RLyAj_v5-5iR41D-tY_w6ztWo2z0uVOu
X-Proofpoint-GUID: RLyAj_v5-5iR41D-tY_w6ztWo2z0uVOu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxMSBTYWx0ZWRfX2tMpqVjbdJGj
 5e1zh2K2GQlxwY4QCmqz1m373O/Sx5ZFLwSK/lisSdHoGLNxtawrHLShDpUkaqQfjfSbWqw4jSj
 SWWru56taLDgKq8boq6z7zADygzx1tpshH4TXp8nEqeekdAM+Lpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010011


> >>
> >> On 6/29/26 19:46, Alexis Czezar Torreno wrote:
> >>> Implement support for external voltage divider scaling using the
> >>> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.
> >>>
> >>> When the desired output voltage exceeds VREF, a resistor divider
> >>> (RFB1 and RFB2) is used to scale down the feedback voltage. The
> >>> driver reads these resistor values from device tree and applies the
> >>> scaling
> >>> formula: VOUT_actual =3D VOUT_measured =D7 (1 + RFB1/RFB2)
> >>>
> >>> The properties are optional. If not specified, the driver assumes no
> >>> voltage divider is present and reports the raw VOUT reading.
> >>>
> >>
> >> This will require a detailed explanation why only PMBUS_READ_VOUT
> >> would require scaling but not any of the other vout related commands.
> >>
> >> Guenter
> >
> > Will add it.
> > For reference, the device only has 3 vout related commands. The other
> > 2 is referred to a feedback/reference voltage rather than a scaled outp=
ut
> value.
> > Hence only read_vout has scaling.
>=20
> The other two commands are VOUT_COMMAND and VOUT_MAX. While they
> are currently not used, VOUT_COMMAND _would_ be used if someone adds
> regulator support to the driver in the future. Thus, even though those tw=
o
> commands are currently not used, you have to at least add a note into the
> driver that the register values will have to be adjusted if regulator sup=
port is
> added to the driver in the future.
>=20

Thanks for the added info, will add this as a comment in the driver.

Regards,
Alexis
