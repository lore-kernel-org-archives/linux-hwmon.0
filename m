Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0F346A13;
	Thu, 26 Mar 2026 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774565154; cv=fail; b=F+7PRu/Bohdqg1hRx42lAYQPfeM3eFVrL9YZNiaZI6Q10eUcqQHkIrFL6JKcYXZuEYgNHh0okl3Dhj2+OmSfduFXM+MOn6DO9g6FmhBTvNwdHltNEsKuU8+NPbH5kyAHFXgkFrx74wnHbGm1q10gZaz52vhbxznZjKOKkX0/Q+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774565154; c=relaxed/simple;
	bh=+MVWe3apH5dzJXo+VFA/3q6CD43XX1UwD0wj0Qlb69U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rnfWMZh7Sp6fIef9VO9dmtRkobxUje2X/GgtIEdLvoOn7bHOcCphGEiUMGSfaUIQYVhrVbgN7ShjZUjOXQZOclKAzfuDD9Vn5n7VomR7YFS71ypJ+ASKxxzY77jIHUDaPQoviDlXsrZqTif/sS9Zne17M72fTCatJvRFpB0QapY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=l80P4OhG; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="l80P4OhG"
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QJTq8l1968403;
	Thu, 26 Mar 2026 22:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=UJ
	0I4Vp1acMM13/OjMfqikYX5G+AdNPdOVdjTjEyM2E=; b=l80P4OhGz3FgTvORHw
	yMVvMf7NVdaPxpqctYvMwy3Q0b96I7jZi8Q0N9l+JbGTr923AtWyFCCJODfYiqAq
	cGnFIVM4lVieyg0MBrzFq4WB+QLFzJIIKTMxL/PEGCKNWfY2QAeV7+rxAcxD6bmA
	qOLlPJKXJ0y9hYex2dNH5jEAPLbq5rffHRG8z7kRcnnQ6N6/Xclr3QV5RjM10hG2
	o860+6qP1aiTL4Z2d87l5PJn59F+BjJ3L77akbgMtj1DmfMCfU9Y4a6NuHVekX1Y
	WuYv6m/i0nS+LzCLWiuCP/miJB47RGnkhrZQ3/U/zpHSpVEW1SDCWpvKLToxvto7
	ml3g==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d5a0xts1j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 22:45:38 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id D70BD801713;
	Thu, 26 Mar 2026 22:45:37 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Mar 2026 10:45:31 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 26 Mar 2026 10:45:31 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 10:45:31 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnlSqEmeEaITAquDM5IzJuuKujzB0KlygJ1eIfipPTfwLQsJ7VXLIpbPw1wWBJMtqHY2q0DikJiNeEy2oewY+S+BAsYUnN52Qb5S2rqMOi0JvUSThBscjO7caBYHoMQF+F42gVnohXbYFpT5GL9vSz1bAmY6w4a8L0+gOc2WBb5zsVEPZXaUDLCNzLw/yVY7kB2boGe6sOZIQaaiWr57oBpxc1XmFpqXHM9la3jItYtNL+YFHs90Xj+Pvv5B4EZwBkYOBc4lGZe0rkKkJJ0rzlAi+2qgDbp6apU/bW0cucGJAA72sI54azsSEyI0RM+X3cHOGV6gmK0MxsVzK7EtFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJ0I4Vp1acMM13/OjMfqikYX5G+AdNPdOVdjTjEyM2E=;
 b=q7gxnOGWTdT+O++c1Mhq13yZg1xIg+ExSaNezKqLC22A8KjnEnqiioKxG+I4BN3ikhIjCLBYoFp0hmifJxh6wJ9sX/HYjEHHQyO+9EsLM0f+c+xHZ9CGJGzmLN2USFez0eg57iASLsdtvz+t8hdtGxlBJV7ucKG2gn6TaKa3+9DBXvusg01cPgxw15isEqoY/E5kmRmG+wwnfN0IT1L6b0ZKOyDvMQwMpoNpJnM5l4dS8uzmJDojIZTGuC5iB119o1znM4OQQ+YYLL6JSK7OSgIHnaHlXvvOEJ/eW/6qGIv8BRcwjZN5O+qZnLbjK5Aj/PAov88zhxhEMRLiQyRvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV9PR84MB4031.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:2e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 22:45:30 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 22:45:30 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 2/3] hwmon: (occ) Fix missing newline in occ_show_extended()
Thread-Topic: [PATCH 2/3] hwmon: (occ) Fix missing newline in
 occ_show_extended()
Thread-Index: AQHcvXI/6TW7aqn1K0eZmomApoEPKQ==
Date: Thu, 26 Mar 2026 22:45:29 +0000
Message-ID: <20260326224510.294619-3-sanman.pradhan@hpe.com>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260326224510.294619-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV9PR84MB4031:EE_
x-ms-office365-filtering-correlation-id: 296b59b0-88e0-45b9-66f3-08de8b8961ba
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: MmW0EjclPU+sqShXrNUacmptuLrlO3lPCfk1MmEgNtR/WLcMvkZh6ZhvPe6xFrVD2TzXQ8A7Op9LRAqL8KXsSjewPJpSe6xdoobmefD+J0oVn2Wz0jhuK6QBTG2POwE7b1dj5PCts9dBl9Qf88vF2Z72/HGyu9Fc0Q9NjzfBSvjJwiteX3aufnJjlIQT/JoSI6cuJ52X9BRF7MH1gJ9c5WpY1NFehlZ7Ogb5td6gSxO6VfCNYHT/LQ/6C+3mZSlnA6AxY8id+QqxOEe5Z1XVDF67T085c/EYBtum9F0eYCXWO5UeYROk4pegkwUSwWQF/LQH57O7QBiiyBRpnj79J3krS9lse4Ohi5HPjmm2LARsWtNcLLaBhdHG9RenO65YYqSzGbADGqyF6yFQy4vD05t6ma4MCobne2tq+gH/c3KvvXOop2T1RKt4Y/FoMRxRSQi4efF0XGQuXrdBHe+A3/39jhYgMjx27lzvwSvOkNnsuw0RVA/Ey0vt0lWBa7fNaWICyT+HWtOWi0jlJ5EEMGP/hoO37eMhwkwqBMUv2vzqO1NDpOqsIkMxbJajuu65eoCTgqzKyqvJUbZxRiSfY0nMC5rV3ESULsiCzG1yBYiJODaBizchk5J5rLLfiwSePJ+bsjfqBto0BLw7K8xb8HyZN9iVDEHVDRiu1PmPXqPna8orZbzcSC6JiDCCdRv7v9s1DF/kMoYE9blzWw4O4flkh7FF7IKD6zpUi4ebFZYPmVsL/Hqw79SPhOl0pdp3a9Q0OgSn6vHmpg4osGEmIJgY+5xuPlcHD5yvIJoT5zc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kAMeEKVKKS+wu20/yIZ20DB/Cqo7xbOA3M7M5uSnamBSVYM1+NUxCPzHdd?=
 =?iso-8859-1?Q?8mjVcGo3dVrQ5DTmaFWOIXuIpKIo4S1wSWw8ctY+rUqF2epYXYmkdw6lYm?=
 =?iso-8859-1?Q?EI1/Q8e5TRgE/iShteyRqnDTsf5UVoPthyGpeZRmddEO9v8KKRt+WI9rM9?=
 =?iso-8859-1?Q?AQ7WpuincE9quS8n/+KW/AA4CqWo0Pf7LvlGMvcIfaB19mAA6KznlfzdkW?=
 =?iso-8859-1?Q?LggUYsHAQEtWnH6I0kYfRqUJwNQM51qDTF2o4BX46jM972l2M1w62d8K92?=
 =?iso-8859-1?Q?Fn+rxhfELjYklxrBlbyCEbZaLQzrFUh8wrTTqH63oNbs2rCHGGKoUhJr8z?=
 =?iso-8859-1?Q?k8AecVacBIeqi8hmC6VLVEDd9eql1UMBiHpDIaG39oEmvxdIzjsDP3rtGE?=
 =?iso-8859-1?Q?Dv/+eWHF7esT/+y8Bh5rASCrG0aF0vbagFAWMGd+USPIQPv6Sr6DglQG1A?=
 =?iso-8859-1?Q?0RvWssIMCGGTAsWSKKQKkhCcHQIcNZGSIyf/NhsHW60gFcEMBaXJ9CsHFD?=
 =?iso-8859-1?Q?nDmOI8bmFoOSfw5tw9XOkXBRCxWrxrqn4E0Q8+lRHHXKCFqzkv/kRIrWuV?=
 =?iso-8859-1?Q?wYgXTmdPrizZU8jybH9AMdQ7E58VIbgaT2FqwW6mq94NH67PKvtFvjTYq0?=
 =?iso-8859-1?Q?KOgMa4CWIrnM6dqZObK4XtauTz3PWTmgpFVtGjdosXAmrVd57JUcM+6SO3?=
 =?iso-8859-1?Q?9V2HQfrlDlmuW5SeDZEfDVViVLplPNOyGLEHJl3DjF6XYwyasdm8/aK229?=
 =?iso-8859-1?Q?8jOx5EqK4Q5aw5yzawICjsWGEqgLZRf1T/RcyXRbIamkChXdjR+UarMDGi?=
 =?iso-8859-1?Q?MTf2tQ7V14B01yxgBEGbyM5oCw5ijDxoem35BrahSajVEfzcccVw0USzCv?=
 =?iso-8859-1?Q?qHmva5tS3BrPbiPKRrRu/5gEF6uM//WF4JGocYkfI4kT56TJlpj8OvgACq?=
 =?iso-8859-1?Q?T1r7f1kraDYPAQI++SoP1Y5q0XrGIt+dar4pvFdGKUM5uh9WkH8aE2aM5Y?=
 =?iso-8859-1?Q?tZ5bb+a986mLbbWs9loEy+WxpnBEaflw+KXWLsEj6xjrRQnUePyemnf7Dv?=
 =?iso-8859-1?Q?oTSjaTlB0ktihrwZitWr8Dqz5hjYZv/yZxT+01Jpsnyl7LAJPd4TRzRVWN?=
 =?iso-8859-1?Q?7QDzIyGT515iejucLtCxCZ2p2RAe0Jz4Jl2/csM262kc3kbOkQ1duthwmc?=
 =?iso-8859-1?Q?B7s+LHMBD+UX7UjI9crcvloGjbADXSjN9KWv5LnNx6AsPNWSVvE0lS5eY+?=
 =?iso-8859-1?Q?e+Mn5oOWhfy1dgoeElcy7qjXVJ7DSTpGJaobrdANx2ocRaebbHWkiMj0lR?=
 =?iso-8859-1?Q?MU8vZEX0rnkTIaD2vTb6AEuzwkN0bOMuJOpZcD0+Qarj4g9TojlffoWefc?=
 =?iso-8859-1?Q?TrtLash3oaqLIDKHSrClyz2SZWChvl+srgIDUfsxAmwWgoBX5Ka4Bgg1VT?=
 =?iso-8859-1?Q?i7slLQJNfYhjZiIt9n3OEUqqzBT2C+S/Fsya0Yn4kxkPaLdDuxRRKkNjw/?=
 =?iso-8859-1?Q?rHNe6n1jQSkrKR4du9jA7jNlqGU5m0oIKD4kO+vZTFhU7G+5pHj8Cj3Pvs?=
 =?iso-8859-1?Q?xFWrFusChxwbvJfKvBTVkzhWT5LiWLLWrTM3p5k0fUgezBPrXoItwBkcBF?=
 =?iso-8859-1?Q?ot+/VMz3tmm7O6LGbqYsUSW7s3y2tnw/6nxV93Unc7xZQ9RzHc956oiB9U?=
 =?iso-8859-1?Q?ZyXZx8Q/TS71erQMlm7g/QDR/hAjHX1NBpqr6pDj59B8FD2UPfX0qU8x0L?=
 =?iso-8859-1?Q?G/VwK6eLiVApbt7nexl/vEZi/YsZjfSAysMF/bge6ihJ6wsg17d8GQTJJg?=
 =?iso-8859-1?Q?pwsdPPAZxQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jjP24QBFSHF0X1+LHKE4E4SD6d4ZOiqa1UcHekJ4d/t0HoPU1ZTNtOe4+K4JIENRgJqmXC5c69MgIp/QPmC7GwDdvrGt2nH1nL9zgw03tmYWMTkkXIwooKfuBAR5XPx7a6NkWLemdoivVQVFgccPMfCfmEqoZWsSdTfVJUU4r+TlRsoEWO1JNIOgpjutsHleTKBIKQ+EpD86ZnQrDKzHOAd90tZ1FCOzGCeoN58/lUTog1RfyUqqzSjG+qXBc5vgVLr8HK5gch6sBzwa/oQRXlWk9PhZ7OeRqZWCUf18FhRGlDZwp/KxE05KJ4/uC8bjZ0rXIz7Z54Ec9DsjRSdP6g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 296b59b0-88e0-45b9-66f3-08de8b8961ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 22:45:29.9263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9qqyt6r4ZRVx3/BPxTlp8hQo8yY6WfbhJDqCCYxXOhSuzeYlgRThSwtT4q+nwUPM4JUzQdUZR7oP5dgpWso4fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR84MB4031
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=D9ZK6/Rj c=1 sm=1 tr=0 ts=69c5b712 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=NCWKwCw8Xy9Og0ibBRsL:22
 a=OUXY8nFuAAAA:8 a=2H3EKZeSjaA4hqO7XzoA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2MiBTYWx0ZWRfX0eM2Ck7yogEp
 ByDQU9C1MA0kXeY7R7PDvdp8Lw19r4CKRJlx7mWFzXIwBoweI9fWUUgPnjYxkTfs1kDvgdmjFoz
 wA0R9px+khAKTA6xHhM0Zivz3FRn29pmg2j6QKondcnz3ya4UnGEfti003S0bh2i28fHb/hB3Gy
 pAGs/Yw+33+hyyvOQwNi46m7vnRqTGVHi/qFamsY06EOcId4ylZ21+MK/nfVOpUrlG3LDVtCe6J
 PvDkWkfllR3aSnFVescz/o7aqf8d7PCJmItWaNrHsdudqt171LSbsKtQE70NSyVqFSt+yspaau2
 S1VkUToY+rbbMVYxjvGPwp1XkC0p0dt/rthItHN/O+awvQ/am0+qD4dwYDclVfXIy4WfuRS5HUX
 TlJk07/MUE0UpgOFkH9nLCxts1ig1m85X/OZsuuUwhbcwKYwgBuV3BJG4cpavGBA62kPDkpiexg
 f8nZG9u0tpSRV6MshIw==
X-Proofpoint-GUID: 4WwUu3TIuNggUMATI4gwbb-9ASYB69R1
X-Proofpoint-ORIG-GUID: 4WwUu3TIuNggUMATI4gwbb-9ASYB69R1
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260162

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
In occ_show_extended() case 0, when the EXTN_FLAG_SENSOR_ID flag=0A=
is set, the sysfs_emit format string "%u" is missing the trailing=0A=
newline that the sysfs ABI expects. The else branch correctly uses=0A=
"%4phN\n", and all other show functions in this file include the=0A=
trailing newline.=0A=
=0A=
Add the missing "\n" for consistency and correct sysfs output.=0A=
=0A=
Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 drivers/hwmon/occ/common.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c=0A=
index f02f815dc960..44d80d7a3497 100644=0A=
--- a/drivers/hwmon/occ/common.c=0A=
+++ b/drivers/hwmon/occ/common.c=0A=
@@ -725,7 +725,7 @@ static ssize_t occ_show_extended(struct device *dev,=0A=
 	switch (sattr->nr) {=0A=
 	case 0:=0A=
 		if (extn->flags & EXTN_FLAG_SENSOR_ID) {=0A=
-			rc =3D sysfs_emit(buf, "%u",=0A=
+			rc =3D sysfs_emit(buf, "%u\n",=0A=
 					get_unaligned_be32(&extn->sensor_id));=0A=
 		} else {=0A=
 			rc =3D sysfs_emit(buf, "%4phN\n", extn->name);=0A=
-- =0A=
2.34.1=0A=
=0A=
