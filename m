Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211393A8750;
	Tue, 28 Jul 2026 05:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785215187; cv=fail; b=CI4pzAw5y4k8ajzt/7Wx6NT82dP2RRVX+q64EWMINRi0dHtGEHWgY1y2yIMTBK4DP0c9y8ZNkEuH9kDzDTHOHqs7FYgDAqvcZGgf8NNYVKnu0UOy/C7uWt6qLZ+WQCeXZlkp7SnKECLS1g0meCbo2DD1zh84z+4H5z+/lNlNCGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785215187; c=relaxed/simple;
	bh=wNedDeAsYc2PmGn8Iyg9TDZPIDGYWnwTS6Gmytst1dg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZQy7J2gWcA5+ncXzFncs6U/bkgnrz09/phv50LeN7HmeOCtYwcECHxQcNjOSvvsZnL2ZVIKq3ChYPUVufgG8s5eReNJ72QV/2ykYINERCcscfuMZDrPiagWaodSn5A9y/LuVyEiXtWN8y3HkRKqa/m37euD7ZoBUBj7mJ6JWZW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=rHtcbZLU; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="rHtcbZLU"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3aIjq188400;
	Tue, 28 Jul 2026 01:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=gBx7Y
	ZZMoaPTXOWbvespHTmCZMMh18QAROgBrTIzpIA=; b=rHtcbZLUwZGBD79ySxEOv
	vZBn3EmNweCusSDZqmrNbMMfa4PU4QGF6O6PP3MhiV6HB91Fp6ZzRvFAkRz6/6BO
	ZB6Ee0gfR1BLcxQaW2VfRsdIgxB5XjjfBKh+OsPGxEiffwwkZfgPyxnP0sgNCKZX
	JhcsfNtTnOkBJyUQRyLCGHKI9AJBBTgDE31Z96vnZ6fcrZvUuqFy10qq9/aEb3Nk
	Lh5kyv0uKxHyReDiZPHSl53MIY6zglcuk4925awoGI2MGOzgfKZqbWZXh127SAF7
	i1xXowZeNvb/wpQQlU+b3nOxYrZKIhvLFmvkiIq2JCTrwdfjHNIHcUhWA+W72gw+
	w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fmpwa9u4n-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 01:05:57 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZ/ge9wAMCoTo3AMfrnyWsPh376vy7teI3jTWNOe2odsDzjt10+m32JK3frwhbfdeR5l8oIt2URlvGKIxJ/f5nAyGlAzYGsx1rSqUXwnPkFeBK1ioAcKfORgBU/XWNYTblVr03Oqa9fHnzu0CEwV7MlZQGnLqIYUh6p6Lx3+lQ9eoe+5Nn8aV9GgXPMFb9Yzg/+Nq/PevJuieIAS6cRvIDMYgL9uOWuZweKUZkqZtSaQMGUdwA4X/BEk0wHw2vu+8SBYA+PFU/myo926L5vCdw+WHbmEhpGgXxwUA05Mhg0+moHOMlilx25RSRGoDziheVeZfY7E/WVcUG+EX26x5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBx7YZZMoaPTXOWbvespHTmCZMMh18QAROgBrTIzpIA=;
 b=L807tbKIpV+yGcnAQ8KN248026JdtfBVAqkV38k+aXrysTt2+x0m/kqJAldeBFjy1oGdXUqzN8XvGjwvMUmkj7OCG2dbaE+Py3otwL6jTo5RYoeN+zhPRELJre7x1bBSUptA5D0lrb88MCeRIPyu11vlThpRkz6RukyQNEtj8Y1dzy5CLr2iqt3XwkCbAjHIwm0+osnMZCXr+yHEmCNgKkf9DGalagQPipi0O65lJRJDEsyuh2PHKh1vy5IcqHiuuHLqfFfmH9XagqXYlNJXIjYzM8dsz9BQ1gXPqm4tTCp4kl6IFnHKyRpVDbdrjY4OYdnOM5+jeDv9Gs1MrgdRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SA0PR03MB5419.namprd03.prod.outlook.com (2603:10b6:806:be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:05:56 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:05:56 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v4 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Topic: [PATCH v4 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Index: AQHdHkHfk9AdU2nPiUyZI21haGs2AbaCSpwAgAANmoCAAAMDgA==
Date: Tue, 28 Jul 2026 05:05:56 +0000
Message-ID:
 <PH0PR03MB6351E5F74D16634FA34A081CF1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-2-cec034298535@analog.com>
 <20260728034543.3F7BB1F000E9@smtp.kernel.org>
 <69a7e430-e7a7-4b84-aa1e-f0f07393b9e0@roeck-us.net>
In-Reply-To: <69a7e430-e7a7-4b84-aa1e-f0f07393b9e0@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SA0PR03MB5419:EE_
x-ms-office365-filtering-correlation-id: ed679557-2f35-4ee0-964e-08deec65e82e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|10067099003|18002099003|56012099006|4143699003|11063799006|38070700021|3023799007;
x-microsoft-antispam-message-info:
 tA4/tqB6U/MOUg0J3D2RKcQo4J0hPmYEFMSbvZpJM/IEJZVOS/e6TugGI6Nh/nqGaN0Pq1+Ea7nYJabUEYzt8qF7cePUb0X+XpBh2Svy/VfoSG9R/7n2D80CHta+I1WyPYnEHRlrsaswPOaTskb7T/5Y6LGlKrXPfWfyXfrv2zGO8CcQ2i9YcdMsBtClymumpjFgQ1SBoigWCPhHvOCgXQ5yDGqnFelKeU+ufHsmv9aZr6cToaeepFl8ip4fgeScaibTldZ8cxivjtJjwQfgs7dnBG+eFDWLovqoUsu5tGY4X1lGkUSu40dD58vZAAQNWJxRJh0TGLUl4DD1fPUS/kqTS3vzjaoJlfM7IrCnWu5OKuSmZL72AyN9SV5t996YQFPKOMpd1hEkLW1WshxVQS9LOPTonb/pGfwTWU5GDeHu9KPyaA59KjdgyiEKr0oD5c4DbChwASawCKYIrU6+e7IldH1ztUXdSMnVp5UaPZVCyMaQpygY4/pbOTcAjB7BHU46zR0G6n+6OvoOEF+Fy7NBq37mCl9X/NeVCqt9M89qt4ySg/N9JnytsuJucoBNJoRjPgOr+LwXTCUgOv5YHNKsiYnSOp7iKHML02apB503robca042GiZbdOQBCD2WDtG4b6mmujSXalnCL5CPyyQrKV9cm7memR0JBvZUgVFn5BnOdCxhRNy1tAYO4zOwjGgWbTY91Nd7Y8E9l/hvmw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(10067099003)(18002099003)(56012099006)(4143699003)(11063799006)(38070700021)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lMUlo+XXIPlUspQ2dqtaFVcJSdPg0Nf7OEuJ8FrNMfe3/ESzZgR8lNpwgpyb?=
 =?us-ascii?Q?zGEUv77mHGcNH8F4iLzdREpf/kq5wKHghJztaoPAEvAmY+i2pIAgtZ3wG8Nj?=
 =?us-ascii?Q?jjr8a3egasyNzcVkyMLhFd9bNn3wKe1kiHTklhVI955vCegFBh47177XI7eG?=
 =?us-ascii?Q?oXA1RaXTJv+Zx4LA0wHkdNMBgXeBJwlg25gk9xLTxENMVjD/Wz6x90TL9aLS?=
 =?us-ascii?Q?FfE5StIwpubOAYBIN8HFOzG7Lf5Qz8U5U44TK8e6A5hu6Y4otcu0FNz1VIV3?=
 =?us-ascii?Q?m5ombcf6Ayouu7q0HPGlpgdrmkUE/LywTuTN32q7EZcXbk6hufuzQc5GBYv7?=
 =?us-ascii?Q?NW+Zb14Z+ooXmER3JgtrUjRVZOTDXKyBgmMMpmDaQJepfSJtHjMxfIDJc6BJ?=
 =?us-ascii?Q?5W2MwK3qN5xwrxqyIZd3QiczK97ZC5T66FKUO2LXNHfOI0IE+TZuqGOl6IoX?=
 =?us-ascii?Q?STN50FqzjcFfB312b9XbGQzbctuABGNirE+Ynka7eBxWhz49j6B3cS7fRJxy?=
 =?us-ascii?Q?wS/nvJWql7d/9rJn+Um1OijOpS0zYoF9OFUBVXL2MBzsQs8cHAIhbd/TqleC?=
 =?us-ascii?Q?U0e2y4oek/rp5RjmYcGakJaRTdZ/Y5qAu8W6MzOF7DHqOj7qOXvkvZoTd6OB?=
 =?us-ascii?Q?MZrGUzd3RPfLk5jhZAQZZMcqoe1Acer/cXq9Bg5k+2OyMf9xbDHp57GB8f/4?=
 =?us-ascii?Q?t08xy6gJMwIIMUZnFCh32WvAtCbTXiFJNSHHtX2NH0rorfrX6tAOPb1YUoYI?=
 =?us-ascii?Q?Y/kzCrtCdV/4sHGXh6r/LCnogyQKCIEw47wPgE5gRaoZvmbRT/XVzv7/Bh+W?=
 =?us-ascii?Q?QiVVL3Gb1JMPn5ge+W6mAfGNteiAvj1PF3J/KXg6qSFphYs+aLgpUneoIw1e?=
 =?us-ascii?Q?jGhAZ6hBWxb4+uBZCoxbQ18yHvjTKkwedPXNNhXM3n8iXwTObAu1R1s+GIOc?=
 =?us-ascii?Q?0cTTpZT2tRzs/FJtlDysHimDMNW5Dkb39kR+qj3MNEEYpW4bxIqjxmg9B0DN?=
 =?us-ascii?Q?73LSI+OPekpgOC96EBoNdPDIx6edpRLsuTiPxAOgiVZl3sE9GmuInpvpTMps?=
 =?us-ascii?Q?wKt87Oc3z32bVdRRpxqVHSCc5HbDSnaPkptfcGPe7VWWRw6rFZ0o8MgKH85r?=
 =?us-ascii?Q?swFwRIfP+XJ0kW5yIy44oAfDHJBfK0FCdNb+8BxGVzkvCNqACGXNU7Syj3wt?=
 =?us-ascii?Q?NAEldy98VVui61zjJsRxN0kZPRFuF+A1JWfXWoAJYMRCgPrSpYAF7czYeKTy?=
 =?us-ascii?Q?hBhxiw4wktRdaDUiERh12vX299pE0rZRkt0UuN1BpopAH8mGR92BknagunGC?=
 =?us-ascii?Q?Fmgv8qgIEYq6RwJK7d2WoIaZJWTAtf/eboARugRXAvFilVatlqvrcV0fTLky?=
 =?us-ascii?Q?1Yt646nRGqK6soOnswKbLB4g/Gs7QO2qCIUkemNBZqbXBbQ+McwClHpgDKb0?=
 =?us-ascii?Q?ABpq8w8DGHi6ZOR9EJ6KdRZl2FLgZSaYutDUo9K1heQEbgVdxXcQJS6uhy+C?=
 =?us-ascii?Q?xClmJW5zweC1xooxDJ0ujVP1iZtpk8hFbRomiGfIu5Ci9n20/yWSIoMCmwEv?=
 =?us-ascii?Q?F4/hocN/9Qr6R0LvKdQnZEz/fzr7UUXjn6ARgpiLidZgioZGxmPNROzAh2EB?=
 =?us-ascii?Q?gJNS4EMv/ogZ3ERgIjaUueYHjsApjdAsAmwELGiSJBHrZtH9cSb//BaYBu+a?=
 =?us-ascii?Q?B6iHjjzcXoc+EDdYHQXY5+aLErVUqLz8rbnutOwLVuqDkcl2GZnYZ3Bxx/ak?=
 =?us-ascii?Q?ql1ePr8Rd4Vu3h0kE6GtZ3NxokiDQmE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	g+n8uk/7SeGwyH2kF/6S8jtfFdDL2Q8VoabHQQSm3V5Fo0J6MMURNCZo/mg0xOrzlgrNrwbO9WCMMgvqUgJGwTdaQ9JjJzRpIu2BOJye7EyHw0vjn9uKx28Zq1Y5TF7znpGYaLW+osr88aDFuBdXaUOMW0DxiyrJJNbUZfoCB4cgyysSprgSMimVSs7efXY7oPSoE1dShxl4HV5LPLHVrgp471NgJWMoqPDeeM44vg9uTNov4Fhkd2AylOMNstEN+I10UoEg4AqXpHP0sNhrWql2Sm1h0Y6iaTkHc9r16q/ECHvcZRJfjRTpqWPyJge9lwK59qwp/gadkUc7F1CRYg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed679557-2f35-4ee0-964e-08deec65e82e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 05:05:56.3897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhUeDRtgO8/qz1goBnLt6/R6imQHRnlhJ4jguq23NtTb1Ei+vjo6gan5DEQOyFEwAJWqIyArJFYlU1YFucNzcc2kBS4vLjNTC+hijBBHp2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5419
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA0MyBTYWx0ZWRfX8TjLmzyD2kq5
 1opjyb46ag7EC0/pkCM6vgq9icg5M1PaINA5NZ6SZvZmGi/w6bCMNX2wY7MCYsNzw80m/cNN/cm
 PRvx+OiLYBTjadjbDR0VMdRgZvDSsUOBQyBssj0qHO4P//diyaZDRboDNzC/smIitZhge8bruL7
 heusngniEgVnASGc4b33NwB9NwneJ1/Rw/uaCQq0HP4h5hoN/0qHanYzSF3mls+rzC3w3mmsQwI
 LMkMwu2UIOMsY4KNV2/4TZIeGL2GHsCzqub07KB7fotM1CioZdaK4Dq9Eskz2RpJP8nFoY5TGz0
 lM3SGFwKqX7jL6rwmAl0lnEWNNFHPwGWfiKNXhaSELP54u/cHysRV5/l134P7GF6WC0UiaKlibh
 c95oRIT+HgTW6klSYFehqEEoPeZE21KtSSEyNtvgJkd5c1vYWLr0eFnBULCXg8j/WcjLXy0jv+5
 5BpoAkKj2R87TR3LLQA==
X-Proofpoint-GUID: 0uYXOoMY8n5dTYsToY6vcdce1-bPzVeJ
X-Proofpoint-ORIG-GUID: 0uYXOoMY8n5dTYsToY6vcdce1-bPzVeJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA0MyBTYWx0ZWRfXzRK5VZT2HlRE
 3JGxDHxzkI7AndIIh7UTGpcInQS2h0SPRnhyGn8mol7yC5YKC5GKtyI7HBwVXVS+4rM5IyM99qV
 6bXLW/6Y2/X+E7vaiyDCRHr2/FtTi5s4FgPJhzQGD4aGO3e9ufdX
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a6838b5 cx=c_pps
 a=uJxR2RjB/d5PFa0hjvWx4w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ugNRTJOwpmtT476g4l8T:22 a=IBuVGQhXcHG9ZNpbHGwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280043

> >> +	switch (reg) {
> >> +	case PMBUS_READ_VOUT:
> >> +		ret =3D pmbus_read_word_data(client, page, phase, reg);
> >> +		if (ret < 0)
> >> +			return ret;
> >> +
> >> +		/* Apply voltage divider scaling if resistors are non-zero */
> >> +		if (data->vout_rfb1 && data->vout_rfb2) {
> >> +			temp =3D (u64)data->vout_rfb1 + (u64)data->vout_rfb2;
> >> +			temp =3D DIV_ROUND_CLOSEST_ULL((u64)ret * temp,
> data->vout_rfb2);
> >> +			ret =3D clamp_val(temp, 0, 0xFFFF);
> >> +		}
> >> +		return ret;
> >> +	default:
> >> +		return -ENODATA;
> >> +	}
> >> +}
> >
> > [Severity: High]
> > Does this code introduce a UAPI inconsistency by only scaling
> PMBUS_READ_VOUT?
> >
> > When in1_input is read, it returns the scaled output voltage.
> >
> > However, because this switch returns -ENODATA for limits (like
> > PMBUS_VOUT_OV_WARN_LIMIT or PMBUS_VOUT_OV_FAULT_LIMIT),
> reading limits
> > like in1_max will return the unscaled feedback voltage directly from th=
e chip.
> >
>=20
> I would suggest to add a comment explaining that this series does not sup=
port
> any limit registers. That should "address" the issues raised by Sashiko, =
and also
> help future readers understand why the limit registers are not scaled.
>=20

Will try adding this, thanks.
- Alexis
