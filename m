Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7943A11CBA
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618957; cv=fail; b=iu8vA8cKfe7MytAPW3BQM454YXy+HnvzuqAFBIiHXT87lq9Er7XBW/oj2pKUWsU9HCaLuLF82aAgc8Yo4Bn2m8jKarnIcZx2+eVjimYRZJ5kp48sinidXpUVQaJz+qeQEeqrp02eCK5l46k+AeqIk9zQ/oa0S3GzKEiLbyC5QwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618957; c=relaxed/simple;
	bh=EoKat2BQQbJbj9w91AOdnM5xRikKYNeqfapWD69icgc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X3VDLDRP0wQiEt3zOsYPSpM098jAPlRL0sxmYd11QM5FrROKYXMdjQ25kWnxWF3LUGjJG7cHNPL3f3Gw5Xx3ncBRKCths2jPpjOva17tPI8KFLJ7k+lBZv6kd9LVlxkeDCg93vTIlvmfnccgcIsja72hNoJMJw+KjBzPyC2HA0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=MgC3KcFy; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="MgC3KcFy"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4HO6d3081051;
	Tue, 21 Jul 2026 03:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=EoKat
	2BQQbJbj9w91AOdnM5xRikKYNeqfapWD69icgc=; b=MgC3KcFyKLy34oCS0j3P+
	jUk4i1XY98nfkRxrYenCPoc4KUje4fVsavm0RAQYtzQFZ38ZnsfX6AUc25NJ+53L
	t/Q7f1S7gJ4XJYjR3g33RZ5xTbFJFyv/Oq0PhqSnZodm8+eUeHy/NJCl4/NqlKPE
	aFGPO+VMIXcR1OmgpX+wQRsCOp1u9Zy7r/61xbD0Otl8j37bDnKIQdf0KU2ZjvAF
	Mdfe6zmWx3J3RFTVT03dKRL6mrblmmG5upUUIfCU64meOonj6amGtiG0mZOgT//P
	yYZzGWJ4fl47qrBI5bEGOuoIFZArkyG52GobaJ4Bv7L3uMB62cw8j2oH9+0Zu0bF
	g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fg6d1jeax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 03:29:01 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVlT8V0JaOS7udrmCOkTq7ISp9SCawjUHrFkUDxE1aqftdJ+c7/MPY1VI7ds51jAYE03FedOwHxKsbdszQMdyrpZ94yNlK+4XD5GQUvrIksvN3/qWZhwyDHbn16JE+udYjuidzxfxzlqJxYUfBs887rCF049INONPDmJwBsL0rlqB7iR+sqAV2Nub/uB/a9gfkV4bgULC1hvlQPmuXMkqs1DQH1tmuhLGnmV7qvupZMRQqG848ZvqETP9l73QTy+p1hhuHnXBrv7TtFSWYiTpQAWYV8MijB0n+MUGF/P1coav07kbiGFi2LrD3ToX4lEJUZIjn8BI5MsKR0BEfZhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoKat2BQQbJbj9w91AOdnM5xRikKYNeqfapWD69icgc=;
 b=F89VUFUL9ZnS3O7TcPpYQmskzkY3n20L3pQM3pvXLn/JrdQTgSebYR4v4+dvOW4zEq7oDleD8ukdQYmmJNEjDDJjHjhuinXynw+Wpo4iem85Cm+YS57zXJdH8PUjoZvygSNX7LEgKh4AJbZJxastlPTJchMj4Vt4ghOtD3/s87ojgf+FgulRJ55aJVYDvZrYIwjx3EKkESONnwVa0WKziiDASF79whC5eOZ4e0UwaXkX33DdfDwb+ElUs1djtgzeXN2NDdfAq+mdsTblu1SpJmpzMOM+KHE92VAnOJ4SjQ/3dABXuNF1eLkEe9W/6Y/klrSvLMtIYpHiAZ9lUybAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by LV8PR03MB7448.namprd03.prod.outlook.com (2603:10b6:408:182::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:28:57 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 07:28:57 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Thread-Topic: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Thread-Index: AQHdFP0KHG1nLTwPxUSiOhrbWS5u6bZv0jOAgAUR3gCAALLXIIAAGG8AgAHpsgA=
Date: Tue, 21 Jul 2026 07:28:57 +0000
Message-ID:
 <PH0PR03MB63514193F4A54535036B3A40F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
 <20260716083544.1B5B91F000E9@smtp.kernel.org>
 <eecfb767-972a-4b21-a088-d7c7b68c29c5@roeck-us.net>
 <PH0PR03MB6351C0B2AFC4CDD92F67AACBF1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
 <0b555e2e-f687-4ea2-8b7d-cd80342fdaf0@roeck-us.net>
In-Reply-To: <0b555e2e-f687-4ea2-8b7d-cd80342fdaf0@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|LV8PR03MB7448:EE_
x-ms-office365-filtering-correlation-id: d0ef6603-efde-45ee-27db-08dee6f9b9ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Txmnuor1r0Pl6rxwUbyITr6sRKcib4bLVFJE+DetEWz6fyIYZ5awLZjNNJiUtG1Mke/i31zmj7cwg1ZXkW2oCM/YREVhkqQtCT7qKhDuMRzIPqI75kq3kstMpt1kUcZSKqy2FaZ7r1FssFLJRLjnT4yf8bjQTKzqShQtOxxECbCMF0ohxakZf0dA6oHKDNHR8Hr/hk27ClbpyZQzwy9n3Jsasbq8ArFka+DyGOTriXVs2qv7F8exxNA6wwXVF1GvrdCNGBcP3/4+6JNe+7JIW9qTo/nEoOq/kg8Y64OH5ucg0s2R39fkRdszzqC1MxHwXV3WoEo20YpnFOCA7o8y0/gH98LCyn1MGP4KXmT7m94GysrMawTz3QpMfSCW6rryNyqhXPaByfz5lVz8W7KkvImAOCEgmQZ5Hll3N+S6v6Ati/DPGEY1h+zmB4oJI1s6OXG0hAb/6ct7GZbZDjys/polq5xzQUR2B0/TKnaqiFZKtrjZF3RffcBYf6l1IMBhkx8858XhwrGim7QZbgmslSHlcSg6dbFNu4Dia89N5hRjpNR6G8wx97vfa3DEni4HtVVUVsQXCJstjtx2JbOoa9Aan6E8JUkwVXS3jUz0+dy/8S1RecnAbPouXrTH636VRqthWPj9GzkLg+pIXKmL4WqSNX3hOnXJVmryDQmmNcQSJjsvYuZ/1Eiznngj1EYZLKSX05qIN7VNXAgj/9NuPZfe10oSWWO0qwSZ7yyJuqs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TH3JQjazb351jcV9njmIBMzimy/beWjuEnMmHb98hTYbLHORTTtZnSfP3Gna?=
 =?us-ascii?Q?Qnsoc7CwFhX/0eluWGIt2DqYDlv1aUNq9MFmhR2Q/lQFjVL6iO94YTTs0+Hc?=
 =?us-ascii?Q?n6bo96k/FJpmylzrMw7X+GS2TO2SM/Wy04PvCYSZ1XwIuebv/9ods7iSXtKX?=
 =?us-ascii?Q?jVKm0nuV95KVP/UXd8b5W0HNBX1ij4D0z8w3wJpg4suGH9XNVCc2ZuQIoljm?=
 =?us-ascii?Q?8NGFK1CAL+Key7xf55uqLlJ6R1X43NCwgbKW7Qrxo90a+kVRHxFbBUMOfw87?=
 =?us-ascii?Q?c745Bj3+6mdxx8hA8O1bGhpHYOlJ8pTwPuA+3Om8+o1KdoyDyiNgVAIdbI6j?=
 =?us-ascii?Q?yEczlOTxS/PH8nN8tk8T7wRZANmG9dL/eGT0RA/0SmG//yb9NpZ4y1Hg2U8n?=
 =?us-ascii?Q?vpyN+6GwQ9btPa6xp/oWQ+j2VCid9rWbRIAVs8IXkXVWEw/lepLwPuDWB11l?=
 =?us-ascii?Q?zTYL7wGGvd4Tqsz9Qjnl9Nu/yy9ImXVlSndqKOYhzehnyV/4f/No0IlwlcQW?=
 =?us-ascii?Q?BRrM9Xq4NKz2mqX+4xYM5HjpvkFrwM+5dhCK6fE61E9Rs5TgWyPqrTlcfgTL?=
 =?us-ascii?Q?REXD/f0stRopjHtpBd6BLQ8CTvNrbp75VO3AoBcmg8rOmVritRbarhK5Qpdw?=
 =?us-ascii?Q?ieZNFCt+mItbCCf+Sc6j3XKZbFqeP7owWQWclgXYcrW576x5cp2ina2JwLmi?=
 =?us-ascii?Q?LhSD6nYiWKAVngnbK+h82K/3YBvCY+perPw1TkVqc6Oyi5Q9RaSeqBoeX6qb?=
 =?us-ascii?Q?MuJfZF06NRKrglihq3B8syDY/D0T+eRBbX3BTC2lgLYhSl84sgEk2lCsQLuK?=
 =?us-ascii?Q?73+9r2wBbUb0ICUVqtaUi7IhdT7fAmOZr6ci0vot0e2N3I9pbVSLrE+hcU2t?=
 =?us-ascii?Q?UaX5cVulgzl0+uSHgXDHlbRfIQN9YiaCv05hXFjCDfUcdrKZzkZlprNYSNmo?=
 =?us-ascii?Q?cmGV36/EOaVevS9y/mWAS0XWtFOQ0jPrZAxaN/9RGPrfE75S95C0vMa9JIwz?=
 =?us-ascii?Q?9soAN7Yw+cHLp4zMe0Ias1ZR+MK0DThAWnZ34gjZhQHKAbsc2D5cFwM2unYp?=
 =?us-ascii?Q?hnfReUxFd+x+IjKEIwNrLPjreqPk16FnVNu7nVXyhDUzhtgnvC0vRJTwyYm+?=
 =?us-ascii?Q?wmYDd3Uhw/Fw0a/PFvFh+3Lm5ZZAG+UOR5qHA6+i1y5MJ1sMZSTKyYVv3fEs?=
 =?us-ascii?Q?bVoW2YxJTelyOe7AOl071kxaXU/2RvXfg7bwkd8oYAIiDR6JGvTfy/Kk2X32?=
 =?us-ascii?Q?D12i06zypvdW6pVr8m77a7DWZ/XdqYSs+l7UdpDY2bQih1pxufgJ5ahTh/yS?=
 =?us-ascii?Q?04iimpp/HiKomX8fKpy0oxz1fA7SLPnPfkwnndi8MKzo4S1rKfcugH91mjsz?=
 =?us-ascii?Q?xrGhpwdKZ3AMEuCSCp2BYSIXsefr3HcyZkzOygPpGw+6ww0QbsfEXFkOcGt4?=
 =?us-ascii?Q?OIWqzYtc9IThuHKv/Y1Zt1PE77o//aK9ept9+m8iQ0YNTrcbEqKXuYEXt92S?=
 =?us-ascii?Q?dliselcN+3ldDGbcmuw5RjM5ROpQrO+axXlLmfxFauXo3d0BPT6VZE8jjDuf?=
 =?us-ascii?Q?LSSHQIATiZ/6y94Uv7QPUoGMgymiyziUc6c4H7TIIx0G7S2ZB6KSeelhvPSH?=
 =?us-ascii?Q?YRut13qET25AnoJyt+VGloeY6lvGv6nd+n8Uv9d/z88BVdnBaJ+0asVasVS8?=
 =?us-ascii?Q?wyUcdZJdN9RsyZJOb64Lv1ALqfG4Tm/JuE6Pux0f53i8a+Ycp374C9y0lR8E?=
 =?us-ascii?Q?cj/jZlbaIk96IuMXeMZZw/7gdolHWn4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	lvbC6VfoAuYwQvVs97Q9RBMrkkM9cGgU6OYcdOGLNE0LXywIq92UywaHFwKhKIdGI21cEiPhbZR9POS7Ns0shSc1nYwTPLWSVbtlLqBSAv26UB4wc9+E5/nzenl71LlZ1tNfmHo3DUHoLyMKlVCN4bUK7hZ/AMz/7+09sOxT6hqz9qCweVKmGj3Faru3LuT5gS4KnB9rAG299TX0KXfnW5auiHkF9FXjAEqs+BXtP66Ef/TuboLMiEUMFPY+YAsvJtfZ+QUFRXUG/eyV6IVAOq9l+F46na7B46iNgKpIOF9bG0OfNkk+He2EJeylXB6sP/zIyvovKAQ65Bfqi/A4RA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ef6603-efde-45ee-27db-08dee6f9b9ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 07:28:57.1332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyDx9E8MchqI4uoAtnpVtBOPS4tRhnKqGjs+yz/0XV+uwhFjqNqpmvdJPi4NT0TtmiBrwddAInc+pZZ3bdz9vib+Wx7p4oFwWvvyTN845WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7448
X-Authority-Analysis: v=2.4 cv=ds/rzVg4 c=1 sm=1 tr=0 ts=6a5f1fbd cx=c_pps
 a=vqIpJ22NDJOYTIB/W/KhXg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=Z0pTeXoby7EwIRygza74:22 a=0Weod8kiumk182yDBHoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3NyBTYWx0ZWRfX7oMbKvATtpM1
 a67bPQ7s2unnIr1z9Yci4ABrQCK8LjCXPU0qGogeLvYqvX4VqXm8Zgb8cFo54P7jKe+p6UdbCKO
 4FJzR6m4vvr4upy0LdU/CtjHKDQ0kRzfZKHBpWhhRx8B9y6nqmdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3NyBTYWx0ZWRfXyIjlCfmVpWZ+
 xeVOzMKp/Z/d4LdFm00sOsW64E4FOyRuiRvDj27yhSg0dkrLgx2zqDfaokIZHRDqFsvan2hChYT
 iz680SAwHRCwomryKnN1j8/sSkKLUl0AiQB2/7MY3GQv4jbmflwLtrf8s+IwUlnWyVxMVh+aar3
 dJBl4+2nU6JyiBx3L0/8F33oSXZJXCjiIE/Q0jAYUvsizgY2pMEpGrok2eEe6EH6JYj0zyFJBvB
 MZt51vI5PXk4yX7yImQLCQyhs7hEbozjFnQ2ijFhcshA6Uk+72qYo3nY5Dcq/EgDCluAbYVCq+f
 2onZyTYbBkjpPVot8ZFf+5F8mVXFNC/qb9nXfhd48Ga/LkEr0MkqVDzoyiVSbtdu8O74Xnz+OMC
 kl77CrqE0bF6EBmeFJwTevt4Mp/hXUD2ffysbj6aqOk/9SLgd4CD7pZDDsGcfr6Xyuj8dM9CNkV
 knMVop5ZtgGumYWfldg==
X-Proofpoint-GUID: Ag-NaGQT8Oe7enV2TgUV8sNJnDHpObLD
X-Proofpoint-ORIG-GUID: Ag-NaGQT8Oe7enV2TgUV8sNJnDHpObLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210077


> [External]
>=20
> On 7/19/26 17:42, Torreno, Alexis Czezar wrote:
> >>>
> >>> [Severity: Medium]
> >>> Will this strict equality check cause issues with future hardware rev=
isions?
> >>>
> >>> The commit message mentions adding support for the ETNA8+ version,
> >>> but if a subsequent hardware revision probes with a manufacturer
> >>> revision greater than MAX34451ETNA8_MFR_REV (e.g., 0x0015), the
> >>> outer check rv
> >>>> =3D MAX34451ETNA6_MFR_REV will evaluate to true, but this inner chec=
k
> >>> will fail.
> >>>
> >>> This causes the code to silently fall through to the else block,
> >>> regressing to the older ETNA6 coefficients rather than retaining the
> >>> newer
> >> ETNA8 ones.
> >>>
> >>> Could this use >=3D instead of =3D=3D to maintain forward compatibili=
ty,
> >>> similar to how ETNA6 is checked on line 328?
> >>>
> >>
> >> Please comment on Sashiko's feedback for this and the next patch of th=
e
> series.
> >>
> >
> > Replied to Sashiko on both patches. As patch 1 got applied, will wait
> > for it to appear in hwmon-next before sending the fixes. Thank you!
>=20
> That patch was a bug fix; I applied it to the hwmon branch. I plan to sen=
d it
> upstream in the upcoming week.
>=20

Hi Guenter,

I forgot these patches 2 and 3 are dependent on patch 1 (the bug fix). How =
do
I send the revisions to hwmon-next? Should I rebase my patches to hwmon
or wait for the upstream?

Thanks,
Alexis
