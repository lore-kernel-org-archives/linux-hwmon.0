Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793841840;
	b=jOnWofPtxVoLPWunFsvFer4Sze2+P+rh4LM/VBkw7oIN5BomX7nXyMA8pylamiT1zDXG
	 4tcSrH3/5Is+rtrJ+8LlmncbsVXYDMgN2kusVMgnQVCBNKgxY6KqvY30UfyvsTGTmkt7r
	 9WQyaDm4ieg1ytOpPQ+qPlwblHYFowFmvnegtiZf4afVn/35EpRouSWiwrsYhiHQkDvkj
	 OKJ+eD/iNxhFMjcdS5Jk+dQm9uC0wfenISofdgKQwce/kZa7TZSPoq/qzgNnjwrSnrD4y
	 4BA4yiZbC6PyaSi4amM1+xibkhXhmn3yB08heWuHhA44mDe0+oidvlJCzP8DiczIHOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841840;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kPiCOsFUSz0M6oHNcPZWBHqoXEhJgd302hvXO+G64mI=;
	b=Ar1JxagUsbAf3WVmLUeLwPWhgBsLRBipQZYY/VaIWA9lhrKS5THYceAIVSfMMFu3Qg3x
	 3pOHVkgCI8ScM6O3TYbQoklKvW+EUjHzWJ5e7U0vKY8Jrq0jrh5KhtI45VGyRG54o8mcP
	 XHAecYoWjfAU9viNamdM1XFf8did7axDmU8xx6DjXNZxoKHEFsxposl3fVxlU4GjmM1Y6
	 sURxsI2ZqcLSD1vwDxykZCiDXkeYRuaTUyVxEHhR/l81l0I9ZSWdzX3IzcdUxZxpO7FLs
	 etK/mEUDPM3ZCYniJl0RwKS07fzOlqVPRrjZfIPoGM31gS+ZQ0F0xR4Kx+LnvD7G/Qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cfOQN752;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="Kie9JJ/K";
	arc=fail smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B5D606A329;
	Thu,  5 Nov 2026 01:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B5D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cfOQN752;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Kie9JJ/K
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50q7di753989;
	Wed, 4 Nov 2026 20:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=kPiCOsFUSz0M6oHNcPZWBHqoXEhJgd302hvXO+G64mI=; b=cfOQN75
	2hAnhbPqJE9SJefecCmTDCykpADCBZ11rwN3woTJGPnmJg7u3d1uRDLTYYl3Ka/9
	BJt2CYpZfB9c5nFVZiATb7PUWUu7ZUjdV3kZV538wbhaOAA/9gyIEjIG8xE/sdcE
	3JubRBSOlSObN2mirEzx+WjLv8ublSDfXEwe8wSwxTBpOqO5m5uFqm3IxWGB5eX+
	fxNDX81RHHRZvR35FPDa+YCTT0WZCOpNQkJC5OXenTWRgGJzBkrTasrIaDGt1cER
	kTegXWid2OuH1hDsHYtiHTZTTIpUKeE0eOriTHCpy703zcoV0BLWEqFKWm+CjMgL
	uOnCjqnjKi9JxyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=kPiCO
	sFUSz0M6oHNcPZWBHqoXEhJgd302hvXO+G64mI=; b=Kie9JJ/KhYRwqd5cXM2Or
	glTkWFEdz57Rlyvdglb+C8EZwPo2RL94g3OnDMiVFLlAIGx+nBRpiRjuCTZWbUvg
	2SK/9FoSvaxQ54UUDN5tBexdJOp3nYVCiXxXXq8HHw0xmAFJcrwGXccRoN524uBU
	G7ppCY0wpVGyeeiJfxdcqHWd35qjWEd3ugkqNR1SewrqE2kQuzN7ka/gDy5/Gu9f
	6DHQj9QDGhzLWLkx/tTsZvLYvzgx/mHPtk6OwkiMUdy5FmWnSXasa8aczcjoJ6x8
	kU9CHQ8mTKBi7wlxf+Pny+2VjVs8OC2Cj+xhTHTuHNKuZoYekZeDErJ1sIfNIY95
	g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hr873am1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 20:23:56 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzyXOPdI10FS5eE3PhEKUsaQEkYSf1Fw5McGMFR3U4umH3dWY4Q/ZDEHE2okYu0LHhGzNQ1/T++FNW/bvmCmdBRgpuwkKhv7EgXfpWwQm/uB0ssH1PpgwXnQwvsaR3i0oHfMxqfX32GaKr3KIjbhWGElBWwCk0YxSnDGfc1yf8bg+wlJYYKKOxwPLPCoqAc9SS+SJQHOJk/rBE3ppZhtq0HyHu3vA0CnAm9OnEIws0O+aesXTyusD1WouzxMeMsPLsq4aThsT0eb1uDusXw7uDcw1tPqsMQXfMxY9TTZ61PJkC+PS+BrtcGX7HyNhaoWFl90nOaws0yvSgqDiRWqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPiCOsFUSz0M6oHNcPZWBHqoXEhJgd302hvXO+G64mI=;
 b=WB8jNSoSDGGXQlPwEPrZQl5gcf+rOhSLf6TyXnng9BcR28R7wU0Te4eqLXbW597vulgz/yhgTI8QFL63oiLstCn/7Fx0MAI4hnVXsf/WSO4e1Q/nY4LP1qsA/+lEoz1BYvHU6z8MEE/VtDtRoiRkf8fUdU3feWjvF4u9dTDZOVICr2IZfqnaedaa8Ao3Hei6MdTSwBuB6D07WR/T+O4kzTB+S03gB4rvuKXithk1mQqmWhuh/o6j5GGk0H42XXbGx6Z8JyVen89QK30rtYucuxAehW8WYj3exWSWXJoXU7GxVwLcWk2f4cMiDyU0q4acY92qBXStFhnK/4D5aoJ1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by CO1PR03MB5860.namprd03.prod.outlook.com (2603:10b6:303:9c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:23:53 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 01:23:53 +0000
From: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>
To: Conor Dooley <conor@kernel.org>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Topic: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Index: AQHdbAzfnJo8jtVgE0WD9mxm0YLL+rcdRDIAgAAFgxCAAVLtgIAAE2iA
Date: Thu, 5 Nov 2026 01:23:52 +0000
Message-ID:
 <PH0PR03MB635147317D180CE482897D59F1772@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-1-49fce67ebc48@analog.com>
 <sashiko-outbox-196618@kernel.org>
 <PH0PR03MB63510EDCF229B247474764C8F1682@PH0PR03MB6351.namprd03.prod.outlook.com>
 <20261105-glitzy-uneatable-0eebf04012ec@spud>
In-Reply-To: <20261105-glitzy-uneatable-0eebf04012ec@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|CO1PR03MB5860:EE_
x-ms-office365-filtering-correlation-id: a61301cd-0be9-423e-3f08-08df3adb742a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|22082099003|18002099003|3023799007|38070700021|4143699003|11063799006|261009223027099003|261028144727099003|261026140227099003|56012099006|261022105027099003;
x-microsoft-antispam-message-info:
 jT/dPqD1AfoCD46i1IXrGvvxjOqt3XGL7NDy7ucB9OYSTPnlKk/FkZ2rbta/78Mt5025RbYyTwr+sATWhNUYQcLEY7auJX7SGro6uYS3jBacg0I6uw5CX2OTE2Fuki0W5KDEIRkYyoa1Nh6RZVTjs2yAqVBcrLdyh/ozEhTw8dqdJ5O+j2Yv2cWYJsjbDdxAr3BLyoYbchEljTwIep1l6mUawFGajLZFZnNYO0rj0tpngSasxcv3zIiX1n8RqG5v7gg0Kcom/RjJWkVpVNJ//R6QAei3PWxIDAdBLZKLHSIdWLJUfXz/w6cNzqqc6pjZ8nR1eoFlQmnkFDYBdevGTrzdtRUJQjve0EcJSKlqZp8/tq9zFewsdauKzD1YnRDaCOZqpkLTkFsaxq3pTSFEKTXuxFzZ7ndQtgGNo3bNlz31PsbvoPLVW0rZtLyFri18ECRlb3Lc3zpErLm4QvoY3DA77HMygZ0Ew+PCJxNyLGpEBbZP0wG02G9eDOKdqgVsM5c3R5nlJCcvCegMnJ5wG9/MXmGFPk0QvP1voOUqGzocxKPTo2WmubFnwyl7tKvi9r7OKvh67mo2UM9kbsSpW/F5Bl70S9rpZa0loxDlxdeJ+pqD1hIkcWYBY1d8rglDaT/CaJjI/pOPQ5KQPQ2ahiBpUQnzajm1uZrODzQVpijeQG9/pl3PFz/e+HpQK5Bp4dSl33wzMY/mpO96tDDnnDdzpwbx9EqNsK4a+RqZmWU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(3023799007)(38070700021)(4143699003)(11063799006)(261009223027099003)(261028144727099003)(261026140227099003)(56012099006)(261022105027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lcaBUXfkqTCSeZW2aKLX/QUZQm9+cIHWxzXQ31vSsneOtZPN1E00C0ytNgMx?=
 =?us-ascii?Q?is2shrHND3rwnqFJ9YAZX8iR+eGHjZGV/O2MFFpl6FiMPpMerH8d+iGL/pSg?=
 =?us-ascii?Q?W1aVooyX7Lbp15cO1p4Esf3JbUmq7h+PZSOsR/dKp9tdKEcGq/Zfkj+/ao8k?=
 =?us-ascii?Q?XFX5kqSrtJDcSZ4f1xT6P15ERDqMKThJsEDe+kBOzhfe5/xhAa7offQXXHQh?=
 =?us-ascii?Q?BdUs54FeiGbYodMxjsAUiujw7ubxLnUUjnVVIlY/PZuAJHIG5BV7BAbma2PS?=
 =?us-ascii?Q?3CZR7q/fzrn/WSUnov//AxFhHcm6MZLuJUtvDGFsQyuOgsrSBpQE5PsTDf4g?=
 =?us-ascii?Q?18LP8tt9hJE1vcI0viPCcSh4QZpSYvsnzzryOc3Vm3O2D7MZqEfmKfRR5cBR?=
 =?us-ascii?Q?f2NlL4n+NP936NipeiUloSHfBRrusOCpVVx0Y+7Q5QWJ1pYUJv9RvGbVEPQB?=
 =?us-ascii?Q?HA3fwnjiz+vMobSomc99fp+J9ieyE/72c6dMUCCMavthwMib0QY5EQkW1j8H?=
 =?us-ascii?Q?qvH/IVcaPxMRYGxwlfk4fFT3XumGRO8CoEatapk9YSdmqhpyJQHBOFTO3yHR?=
 =?us-ascii?Q?pPB0miG189RBVtFFeBacS+dltBqLtCPGMaWbV/eiE8Ea1Ag1qrFlMdyjuyR6?=
 =?us-ascii?Q?MRSKhGJ30b/L2lUx3tIKBL4YVWwhAQzKtDY4VlySKMJFEyNqHVbO2wYiKPkG?=
 =?us-ascii?Q?G5/qRi9GkXEEBl4wBp1LVD0Q67loxB5+6+DvpvOZaqWmrpUTHWU+eYIT6zSX?=
 =?us-ascii?Q?fqzHSDZ0Ss2FgEuY2VZAXrdVmu+zCchi5KycJNo8UmlKlalR0W0uR9UKZ9uy?=
 =?us-ascii?Q?XUg2DRBfElCkmlHyJeCLnT154KoOcM9MB3V9aKwexNhQrTbATHs2J0dxluRp?=
 =?us-ascii?Q?Wn0GqSXjfZ3P23WeT1ff7me74xpzVwKTOH0GV3p5F39pBYfo3QyisiW2Gb8e?=
 =?us-ascii?Q?bAy8b7qmJoiOW88OFdz9XCKxJ4Qyvq9x2nwAIxD/o84IZ1z3u9idEwRRqZwi?=
 =?us-ascii?Q?o77PXQ4UqI9SMTF+t4qlwjHhkNup0C3Yd2DmXJx5D733PIRGl/uNYAHvccd9?=
 =?us-ascii?Q?wXc0gxyGx8FV3B8CcU7Gyc71sKmYK/bP+jqtcfLbYDeKMEvHM4+MwNc/52G/?=
 =?us-ascii?Q?5GGlqyJihato3ZA276V1QbTJKlUKtFAYKKiUGzgQmV411oZcaCXr5E5w9+/f?=
 =?us-ascii?Q?oKmk3yfodzIDqu83ezi0Ud/+ifHh5Q7//etMkxVZ9U9FOXREn/YhsGlrLb8i?=
 =?us-ascii?Q?8xsavRCOXp0q0oCUdR7hvyAgTQVKp/kdueY1ABPtQ1O4tSS0C/LADSA6Ry0A?=
 =?us-ascii?Q?+h93YWU/0r6Y2rtXpS7hgTr9mdohxEr2DRY30VibXrUxkqag6yRTMzpwBem9?=
 =?us-ascii?Q?iHXwmyLbBZPoxDXbs5osLzSo8qqyT2A+15fF8TIILLEwdLTLmYq5ZeBHXNdO?=
 =?us-ascii?Q?9Aw3O/MMbzkIpWT6i2tLtKwB3l8G1j8rroH2EWWLr3UKtSzrgUXLILkrvdQK?=
 =?us-ascii?Q?WhxVRT4ej+XaqKpu+iM/Nuwpgm/a1lUO1VzJskmBu0rBdjLHzKb3OpcmlD4/?=
 =?us-ascii?Q?6Km/dqLl0YvexiGRbs+AyM94mS9DwnG9bJpzuA64UuKpdf+/ECEs+v4VbCBa?=
 =?us-ascii?Q?dDiRckT4LH6StIZXi2I6CXQdX/Nr6cyKHl+ZJsrFAfxf7q/dzOWPS9B9gkcR?=
 =?us-ascii?Q?VqK7idJN4it287nLssMczgsHupFpOWFJp4jG9CqpWroqJAgwHyODBlMxGsHq?=
 =?us-ascii?Q?NApmhmnSwDNsrCRHom2CuBDf+lbzXh8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	pUadoXMWLIAVgG/DXO6GrkQEjcaI6UW58lgrGHscBcZaiN2H3+YYmdVMCqKc6Ht1zpFPKL6Du8LfzZTEsmLgYqhHQLQeQzS4GHnjipIKt5nQ3jn76EQ5duZPlLRcA1hQoytj59YWC98jP8b7uKt1JybyB7LVNqxElHL4CQYqf/Uo54iySUYcPdvPe2TDORxpz2Zz1u9F5KuEpAR4MUVIqwRBtrm748psCu41k6Abv3D6u4soWJB+LkKljnWvyQ8M0dcADy1wLrwSl2rk9yTRBFMyFt4q6g5o/chMkZx5WgVQNaOeQE5SRs0Q7oVd+V5TH+roc3e0R8vCkzdVUUVE/w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61301cd-0be9-423e-3f08-08df3adb742a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:23:53.0456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HgEWe/vB3iFR10HZg/9TOqkaYZgelO5wFEgbHvfPG7qUgmNZBNXwZ+T0nwtvhBCuMxOWLmPR+4AVpZYtk/gO2HbRsIgAFgd6c6pFtI4xbUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5860
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX8LkOao0YoARP
 GtwgU8sFAbx/tw5/NjxiWSz4/QoDK/zUMtszYIeXn+oSnxtN3L4k/t3WrgtL+oPDdCSsq34n966
 gnPQMaCLyIrVckuAXrdu/1iQHgiXa5Iqt+QIjNYQYFqusjI+Uj8T
X-Proofpoint-GUID: WEJOLifOoH8MAsYOJrm4QbcyqcygedP8
X-Authority-Analysis: v=2.4 cv=S4tMU4sP c=1 sm=1 tr=0 ts=6aebdaac cx=c_pps
 a=OswsEo8IlqVTC7zrgcx7Gg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8 a=1IiE6_uShVkjzHpa9-sA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: WEJOLifOoH8MAsYOJrm4QbcyqcygedP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX4UhxjXuqhe/Z
 Rphz9Kz+WD5JZOGDLfnG0GrC/R7CAN+0eJdJrQnFekHN6wlYujTocRVBhY/6F3zPobHVpQusaD5
 tMyYwVeEBuyNsH0TIk4eeKa0Ka0u6VIodv1MCyfyTlCfjokggc2kbjualuk8o4VmPTWO8TQ6GII
 q/nWbJENtxIdGJS53JPxBcFnUEd14zpX72mO/V5OQztYNlnBvAz3S6VvOMuLW0WgO8O6V930Fp6
 /+V+Fk86MK7TGhdZjYs+AMDiHVq11uqbR66kMJXhSstVcC0iVCBuQigEcsTq6GZVckDEgmEiJFD
 Fd+3hy7GzneX9Phpij24S9V9IH0YkBx3j6vfw48DXja5hjMqvGekVjdJB3I0lBd89LYAC/qNBPz
 LMzjz/dbDK5zX570fyZjh0PJThzL3jQHDBjZUv856aMaKxjPjXhYyYOD9BRMuwoGW7J9Gsbpb5y
 Rte2ICONGsFlIMRP6Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005

> [External]
>=20
> On Wed, Nov 04, 2026 at 04:06:13AM +0000, Torreno, Alexis Czezar wrote:
> > > [External]
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential
> > > issue(s) to
> > > consider:
> > > - [Medium] dt-bindings: hwmon: ltc4283: requiring rsense2 breaks
> > > single-driver mode
> > > - [Low] dt-bindings: hwmon: ltc4283: ltc4284 example sense resistors
> > > below min
> > > 50000
> > > --
> > >
> > > commit 9676b294cf2ad1168e5ce0d8de5c0cd58e68d9ed
> > > Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > >
> > > dt-bindings: hwmon: ltc4283: add ltc4284
> > >
> > > This commit adds device tree binding support for the Analog Devices
> > > LTC4284 negative voltage hot swap controller to the adi,ltc4283
> > > schema, including new properties for its second sense resistor and AD=
C
> resistance.
> > >
> >
> > ...
> >
> > > > +
> > > > +  adi,rsense2-nano-ohms:
> > > > +    description:
> > > > +      Value of the SENSE2 current sense resistor. This resistor is=
 connected
> > > > +      between SENSE2+ and SENSE2- pins.
> > > > +
> >
> > ...
> >
> > > >  allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: adi,ltc4284
> > > > +    then:
> > > > +      required:
> > > > +        - adi,rsense2-nano-ohms
> > > > +        - adi,radc-nano-ohms
> > > > +    else:
> > > > +      properties:
> > > > +        adi,rsense2-nano-ohms: false
> > > > +        adi,radc-nano-ohms: false
> > >
> > > [Severity: Medium]
> > > As noted in the binding description above, the LTC4284 supports four
> > > hardware operating modes configured via the MODE pin, including singl=
e
> driver mode.
> > >
> > > In single driver mode, only the first MOSFET path (GATE1 and
> > > SENSE1+/SENSE1-
> > > ) is used, and no second sense resistor is populated between SENSE2+
> > > and SENSE2-.
> > >
> > > If adi,rsense2-nano-ohms is unconditionally required in the allOf
> > > block for adi,ltc4284, wouldn't boards wired in single driver mode
> > > fail schema validation unless they specify a nonexistent adi,rsense2-=
nano-
> ohms property?
> > >
> >
> > I suppose I can make rsense2 optional (+ corresponding driver code chan=
ge)?
> > Or can it be kept as is?
>=20
> If it's actually optional, the dt should reflect that.
>=20

Will make it optional in the binding and add the driver changes in v2. Than=
ks
