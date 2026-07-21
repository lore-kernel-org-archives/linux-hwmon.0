Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A26A390CBF;
	Tue, 21 Jul 2026 00:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784594691; cv=fail; b=avWGvcBrOvPAQTBdDmnHfr2u7mVjLAiEjaXdN61aQkyG0OLwlx3nfeja6W5Lcbj0m4fmVcSw768/XHge7oIbvHxecNF9D25WOUNShwjvDj38sYNWkB7ZoU5lW3svLcAG3E5Xhg35ndLpEGaoTd9ukQBchpicd+UjC5BAgGLezm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784594691; c=relaxed/simple;
	bh=DOR8RqhqjwJ5HaiQVtQ+w5mviB1yFJvPEddWQqJ+u74=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ozDqv81oC2NklwHBz3CuO+JP1yiro/V4WVg40mF14guJdpv3ZI5cOkVvyS0c+jH0M+eJh+4ENQ85oTbh/bVOUDk0SgI387qlGxmVBxBhRGP1FOHh8UnqGAxGRVC274UxkEYrbI8MjccgHOJSI56etGNzdd01GpaVuasiX45N/yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=zg0XzLC+; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="zg0XzLC+"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNBpM91523824;
	Mon, 20 Jul 2026 20:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=q7NGt
	yXA/YyVLwSXDyieALsSAh3YEUChlNLiYep54uI=; b=zg0XzLC+HzRujhmrZtpl2
	MJlw4gX04Uwfqbhz/U4L5zWVQBazNTjXvc9EZREW0Z6+oCDRChcYItKBLJGebpTy
	165GMGHA4+zkCbXlRf01cGXonxVSYrvdn7tdFVLi/2sbOjcDM881k7EJTZsZ/k4W
	QjFZzQs9xncOwgBR9OyGGHhozzKnyQvSY1o2xBvD9HgBHXlBwu+bJU4EWd56BXBU
	8bH6CP58P7aYRrpuJHJP4w0q0etpHUia4wNx5D0UGWe3RPjRxDnY68ZtYMyW964Y
	5UKHkWXntpQSIGWqBBYRedwEJtCXKw1zUkHd6zXSZM7e/+J3mBTYgojNurSrA2Kr
	g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fguhfwkdc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 20:44:40 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYXrAWHDUibauXJ0Aeda8OCjzwZ9IFMnyhEONfyhSX8PLug6UQ3cwCl/KVv7W9TpBnmme6ui9KG69Zc4SNixOcXK0lTVqUNfkF0GageV2oLYxmZjXh1bFKoPDFY8knvK3FWC0C9jJN3qGVdHykuyG7etq8UOAgVFr84R8ptewbTnYaMik4jj9Ch4++EuBiNmeDxEJiYfmXWmpSTXRWblfr0NYD687cyRpIn0AWQFvwha1z+6F+IH0rDU0/1endCvZA9isXLB31sQ5R1gcI82HPs8URL6bzJFO9MSqrDbj94n9e1cxY0ubhmN8Rk2jOd0JDjOtVO5zQb+F8nD3nXXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7NGtyXA/YyVLwSXDyieALsSAh3YEUChlNLiYep54uI=;
 b=geLJdz0tzlVmrzwU8yONQpan2U7X98Y7Waxcg4KHKvTaahCFJ+5CQaUwjnpyeLhaMvE/sjykyValmIzdA0/gMPVmu9b9WPhTXmGtr+FAEFWTVIW2iAJKar6oi8md+z9ZdkqloRI4xxywnEjEj6KWYKPbYhrkkfERVii179T5Oijugdy3oWJDe2E/ZGzxdcuXyrZo0iz3dyXCzSYCYkNL6sTqPQDr8+JIyXHzXOLefIOFduCK6LYyS4CkYR0bQUL17efNnuY8zJXm9z8tFjsT/nC3zkBnCX1IO0RA38P1LwcPlQRq0bv1XsPr7yBuNmS/J5OtRie6n0IFaafb9Uv1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BN5PR03MB8056.namprd03.prod.outlook.com (2603:10b6:408:2a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 00:44:38 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 00:44:37 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v3 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Thread-Topic: [PATCH v3 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Thread-Index: AQHdF/YJPqkE3QBbFkeFnRBEs/hOLrZ1wCSAgAFfRqA=
Date: Tue, 21 Jul 2026 00:44:37 +0000
Message-ID:
 <PH0PR03MB6351840C485DB5012440472FF1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-4-9d06d27d6da3@analog.com>
 <20260720032956.5FB041F000E9@smtp.kernel.org>
In-Reply-To: <20260720032956.5FB041F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BN5PR03MB8056:EE_
x-ms-office365-filtering-correlation-id: 672ff2b8-a197-47e5-07d5-08dee6c13df5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|6133799003|56012099006|11063799006|5023799004|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 +1yPbIzS6dYi7ZhvroV7ACwem4MuRa6jaDJsgvYe3Fc6UoaMgsoGg5csNAIb9Ac/lMJm21cHqEVKuxETfC1FwPeqI+aOEtx/Is0/zXg51j45ek2Q1I0jIu4BjcvurCqxHch2BDLbXItkTNtjMr7ybQosAG0kJ0630lFhg+WsTD0Wwle8l1WxVHC33HFm0Ymxp3qG8xI65bWXAaSQrvkL8wVUux+SnwCusip39KjinmMm/gD3el5sQBL1R1SvrFbgwtuT1nt4BIG46jSalX3ckra+jYedoKXk6m6pOQtZrmksIE0KIfLJzA/homIbRa24IyoiMljVp3P3+bO+A23jGXbirOHggvTQyYd9oYOhKmnQemlYJGrh+UeZqTiG7l9//l+H0aVveQNrdYdGYAperV2Q+NtG241WkU+at94eI1XJJ48EIYlEqb02DtLkqUMVRPG741AzS9S1SGQqjblD31szl0QnlqV7ziW+Uzv75arfBxE7wUsoLCjFl9RhLCikWhPiUgqQWfLNGKQnEgmExEcN4EeZR2+3jihp039tTqaauDstG0zt9A4pYLcEsXcM3I8i58MaMIzjCr8EcWN1Dl3CKP+LuFHMrdU5N6cIgwmLM+ONn4ne/zFjsYfRL3exfdvAhDxvZ8XVsusaDpYWgaB6svcoaO7k7LfsVsL9lHw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?U9B3B88xmFBiYGXk6Xj/Q75tuMD46ASRz2yn8OFhYy1eivkc8z4eP6SxAau/?=
 =?us-ascii?Q?BiXdpySo5tFl1/e/41IUvwdTXsQEXmG9lyys8fsFNruBPz0EnAiRVdGyPg5t?=
 =?us-ascii?Q?GL/YPrT7QwpBeQiht3vdYBHeoNWQrc6yipEvfKhZbunX6t3nyjQSkcVuN6rf?=
 =?us-ascii?Q?lgp/30nNEs87wBgpYr1kW8viytjgpgcp4FnZZwbdHJuSA1VWqLOq9st+lBNY?=
 =?us-ascii?Q?KAaAAatUi2nubpFRGHV1sIulb/N0xSIycke3Zo2BJP+LXhTA2VU72zluNhfK?=
 =?us-ascii?Q?EvdPfqN3z6xTEzQzTfPuilgNB1NQo+vewcBjopYLq5QNvccKIY/iRQr3cM1H?=
 =?us-ascii?Q?cmdBheP6ivFHxg9Mu3GWfoObQrp5zmZG8Fo+m66Rlcc43YazghKqHUSXsY4c?=
 =?us-ascii?Q?+LTtgQxIUP/PsqCZPHqO7qUJUMgVOw6k/2M2EPf/wFO7woot8C+l6xE5WzKa?=
 =?us-ascii?Q?qkPQDoDS1cMUGhWnrT3tNE+yCIxuaCzwbl9fNfbaM7NCvVg/Y/1AwkvE92SP?=
 =?us-ascii?Q?/2oh+LX5ojplXe4cuX5COfUx5SBsheXX2bSpS3Ajjszq/Q0at2/7spATb3h2?=
 =?us-ascii?Q?DcHDinwV2hyitm20R5n3ShVEqyj2wiXa5I3kzO8A5MVjLIEFr+KmqWGW6YJU?=
 =?us-ascii?Q?1/LkxAUE2uaCMytWN7n850zD3A9c9d2LpugGGcFX3d7gJD0uxTt/VSX3xm5o?=
 =?us-ascii?Q?qxHKSInN6rzkuaARxFNOfjv0ES6JzvaERmTZK6raNQ0ldhBffJjxgc1XAd5I?=
 =?us-ascii?Q?3qnFP3sGcNk52VPQ2B4+k2Xwx2eYEUBYQgcIiIKf525MR28u7+v4QjdKSFPI?=
 =?us-ascii?Q?KLK+fkCbOUmn86BgQCq4QZY10/MNXt9WPeXT2pWDTEkiuniXJnQDK0TDyxJ8?=
 =?us-ascii?Q?WVLlpQQ7192Dh6cMXg9lJp/QP83EPRWnuP1YXFS46Y0MGNa42KckBSzuul7n?=
 =?us-ascii?Q?oP1G4MQ19I9x8SI2nTBKZ1qwV6dZ9MJdWZiUl/Gy30i6e1kFVsvQ2eRqFavx?=
 =?us-ascii?Q?zyRm8poRWLvdYA5t0Fip7s8OlahQccPYbNUiWyuIk7DlsnJBhY5LeKY4S853?=
 =?us-ascii?Q?sZq3AyJ/h6pfWd55zZezneOkylaMWAEhzR1wpU73WMgFFSXmHg7ZEAYuWBPo?=
 =?us-ascii?Q?IV4qjQDKMp7pSrTk+zzwPhsoLsoHkBOa9AfmMrH3ncaoHHEEtbzhoRww61mr?=
 =?us-ascii?Q?DTUIqZvELfIB0rJi3AviztLOfHfurFEp99P/Qz9W+1Pfow8XK/rHno8C0aWk?=
 =?us-ascii?Q?AUljKUw+pY6/CAn/tL47lkQQ/OiPc7jHKZG3t4NJ3EMxVZYkYavVwYw0YTHu?=
 =?us-ascii?Q?J/Jp/D61tQOyeW/W7a4DV/PoMlCTewYjhCsqhI55dmY9yamraO2X1lr/Fjn1?=
 =?us-ascii?Q?qLdmgxu8gEWKS8OGlPfci58eW6cuK1VW7uRdEMIvxag7ka01k+kXFCtaIkAS?=
 =?us-ascii?Q?FrItpurACCVwCYIoBDdKNbAexB10Fm7Ctl5gU13BYyC4bZl40ZoyNOE4a/xf?=
 =?us-ascii?Q?DoA2eNG4H9jnj4+p5yfUnayUlX9ub42TY49mTxbwiB+ueGhp70fm4jdszbgS?=
 =?us-ascii?Q?4yGuPEOxI0TQCmXHBgUjUITCOOnr2F87SJ+a9OiscLzQXkdUuzQVrFSya7Ol?=
 =?us-ascii?Q?2ioMlfkKwe5sk16XHfwsSd80gFC/jHeschFS6eKyO4j7TvBCYa1q3N7eufy1?=
 =?us-ascii?Q?ssgXZoURgb83hbLBpdjJTJvbWmuZOUPlMu4LCIHIw2LyMlP326sNWqwl+wMn?=
 =?us-ascii?Q?k4QMk92DJ6Dc86o72GLQ7l5HogWwjWU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	kpXZw/lTetdrfDNBxRyB2TdYZc+8qdmh2KBtQOUii9UnAK1ra3xvSNUiz2IjuGZ81h9vSqcgDAQMdsp+JeVtDy5hjA6Se1Z694tM1INJc1qDu2P/uUk5FbuSdmxv1VkjrDXhfFAag76i8AOVnoSIoeYuQEsIwkQuDYtxeElKhRtixVLqzfa79DtuZHCJNQW8ggl7LLh5SEtWZc71hQDkHyFAVFJ7hDMidev9zJ4OAEBK46ZjRjtWeeIPQuwPrsMl6ZKQWEPOACY+cYGoXdTU2Qfh30wnwx0t4XMN9uNKl4njmqDjEZKi6la2b3UeVrpsEJ67R1OK1bVH021+FMBgbQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672ff2b8-a197-47e5-07d5-08dee6c13df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 00:44:37.5187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSH6dC+L7iXtIIU0O3oqXCdY8cJ+T6tOKresRmOmPqTICeJYBYKPwj4Cc/2Uy5jdn248c+un92Z0x4W76pyLhB4/oq2LcvbpFtc4l4dRFtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8056
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAwNCBTYWx0ZWRfX4AXsAT+sh+r1
 iIITCXufjdUY567IDY+frLXfZMdfo8bRX/PVwAuXjMCFyEpPfSqcqtrwY0BEf8EP3ANTf7HFwjv
 m9e8IBQv98gL8wSViwecISiqPq1aZ2Pjf6grNGGCnZHpH471+86bcnyk2xEmt2YAnRKFu/TnPgP
 2W5URpF56UzsKEWXVkrYcdY5E9H069ti/bntYbdINjf9GWuGzkQEmGWm4Hf9nDcwsj/OOrXlpKI
 yuNyQen5Avr8rS5gu0bZ8oVyJm6G59NhqNb873uvqucvrd0mXfW3gVlxDNFZQ7hIvv5vkMxc5TJ
 Gh6hbT25PV4Mj52DCM0t3dwX1Mli3NscW1i8Ca9+nZhEk3uSg22YP5/F/IWfP1MSw/5W6QEiwtT
 rOCKJGg2z0AHy9C8X7+vV/CxaHUqqxuAGmPWcGcw9VsvDojZcX2/v+uN4olVav//2eBsgL6gkTD
 mNnlLH30/nkLskXE45A==
X-Proofpoint-ORIG-GUID: 0AKDfCkKHQv78sg8wsd6JKIKa0NmpMR9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAwNCBTYWx0ZWRfXy2xDMbYQ6hO7
 5QsmvEz83m1sSBMRFY+Rd2gyCFB/3MDwLJbrpzfL8gDbnCmveKmgdQvV452JRQuP6OwC7/F571D
 M1EScFIi2S0SDLMbgCVa3KC9v16x38ozjKXFE2Vczr+nvvRz0iVO
X-Proofpoint-GUID: 0AKDfCkKHQv78sg8wsd6JKIKa0NmpMR9
X-Authority-Analysis: v=2.4 cv=VIztWdPX c=1 sm=1 tr=0 ts=6a5ec0f8 cx=c_pps
 a=xx7W88v/Jz1hHwbI4fXbew==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=lKZ3dfJkCFrrC9Jp1yQA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210004



> -----Original Message-----
> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> Sent: Monday, July 20, 2026 11:30 AM
> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
> Cc: robh@kernel.org; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; conor+dt@kernel.org
> Subject: Re: [PATCH v3 4/4] hwmon: (pmbus/max20830): add support for
> max20830c and max20840c
>=20
> [External]
>=20
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to
> consider:
> - [High] Missing compatible strings for MAX20830C and MAX20840C in the
> of_match_table.
> - [Medium] I2C block read path truncates the device ID for 9-character na=
mes,
> leading to potential false positive matches.
> - [Low] struct i2c_device_id array uses positional instead of named initi=
alizers.
> --
>=20
> --- Patch [4]: [PATCH v3 4/4] hwmon: (pmbus/max20830): add support for
> max20830c and max20840c --- commit
> dca1bbdb54e3f769bf22d26e97ead67754787a95
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>=20
> hwmon: (pmbus/max20830): add support for max20830c and max20840c
>=20
> Add support for MAX20830C and MAX20840 step-down DC-DC switching
> regulator with PMBus interface. MAX20830C is a different packaging for
> MAX20830, and MAX20840C supports 40A regulation compared to
> MAX20830 that is only 30A.
>=20
> > diff --git a/drivers/hwmon/pmbus/max20830.c
> > b/drivers/hwmon/pmbus/max20830.c index 7a5e67bd33c0a..73fe59685cf15
> > 100644
> > --- a/drivers/hwmon/pmbus/max20830.c
> > +++ b/drivers/hwmon/pmbus/max20830.c
> > @@ -98,13 +98,12 @@ static int max20830_probe(struct i2c_client
> > *client)
>=20
> [ ... ]
>=20
> >  	} else {
> > -		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
> > +		/* Reads 1 length byte + data bytes */
> >  		ret =3D i2c_smbus_read_i2c_block_data(client,
> PMBUS_IC_DEVICE_ID,
> >
> MAX20830_IC_DEVICE_ID_LENGTH + 1,
> >  						    buf);
>=20
> [Severity: Medium]
> Since MAX20830C and MAX20840C have 9-character names, does this
> hardcoded MAX20830_IC_DEVICE_ID_LENGTH + 1 truncate the newly added
> device IDs?
>=20
> In max20830_probe(), if the I2C controller lacks SMBUS_READ_BLOCK_DATA
> support, the fallback i2c_smbus_read_i2c_block_data() call uses
> MAX20830_IC_DEVICE_ID_LENGTH. Because this length was initially sized for
> the 8-character "MAX20830" identifier, could it under-read the new longer
> device IDs and cause false positive matches in the I2C fallback path?
>=20

Non issue. MAX20830_IC_DEVICE_ID_LENGTH is already declared as 9.
The quirk is MAX20830 replies a 9th character of Null. Declaring them all a=
s
9 length poses no issue to the string checks.

> [ ... ]
>=20
> > @@ -120,26 +119,28 @@ static int max20830_probe(struct i2c_client
> > *client)
>=20
> [ ... ]
>=20
> >  static const struct i2c_device_id max20830_id[] =3D {
> > -	{"max20830"},
> > +	{ "max20830" },
> > +	{ "max20830c" },
> > +	{ "max20840c" },
>=20
> [Severity: High]
> Are the compatible strings for max20830c and max20840c missing from the
> max20830_of_match[] table?
>=20
> Without adding them alongside the newly added i2c_device_id entries, coul=
d
> this break module autoloading on systems using Device Tree when the OS
> attempts to autoload the driver via the udev modalias?
>=20

max20830c and max20840c are functionally identical to max20830 and uses
the same configuration. DTS has adi,max20830 as a fallback compatible for t=
he
new variants. Driver only needs to match the fallback compatible string.

> [Severity: Low]
> This isn't a bug, but do these entries violate the I2C subsystem coding s=
tyle by
> using positional initializers?
>=20
> The I2C client guidelines require initialized arrays of type struct i2c_d=
evice_id to
> use named initializers (e.g., { .name =3D "max20830c" }).
>=20

max20830.c was using positional initializers, so for consistency the others=
 were added
as positional initializers as well.

If requested, it is possible to change them all, including the original max=
20830, to named
initializers


> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, max20830_id);
>=20
> --
> Sashiko AI review *
> https://urldefense.com/v3/__https://sashiko.dev/*/patchset/20260720-dev-
> max20830c-v3-0-
> 9d06d27d6da3@analog.com?part=3D4__;Iw!!A3Ni8CS0y2Y!5gKYVqJULNay7eEZv_
> L_8_gucJb1N86NTpoIzkSsewioUyVMMHaaxOqZzCyePUogn-
> 8pmaMWp4WmbDN1rInYx6qi_lW_gTM$
