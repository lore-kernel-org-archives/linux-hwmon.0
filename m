Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B222279DCC;
	Sun, 29 Mar 2026 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774804222; cv=fail; b=jrvmHyf7mw7bqRJ2gScsVMGCZa2hQn14Ayh4NPIV1AI2wVObURBbEn/lEtrlVa+BwCK1Z/Cj1cftlSD8ko0u0SnkBN/4JsLvWsCb4H/LkoSwZ7Mp6qRl1j7i0LQfSe4DbTuyLNWk66+jkjbRiy07h8X7OUwl6MMbAryuJSrzHYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774804222; c=relaxed/simple;
	bh=gP+lk+hI0t4p6rJuenp8mSzmbATRgoTv+BXA7oOKPLM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lT25J9KvqQNAC4G8VdYiOOsCAY78U1epOQ7Jay0BG3DiNsR4C39Pzg7pQnsqja0I4zv5IBOUdMwCU1mxGM7MV6dUmrSVcQeicVE8Cno2UPJx852n9n7oUBFbzbcy7L1KtFyThAfc9M2Q4QsOi7A1WSWNbQB29kAHH8n4n9TElI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=aBiqOInI; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="aBiqOInI"
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T3XPxP2073616;
	Sun, 29 Mar 2026 17:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=NR
	VesDss7pcr/oeL5yqqB9RfBgnpVs5T+zfAgJQMIOU=; b=aBiqOInIw4TC7H/ONP
	r5h0pROXRVOXislYo9MJxIaca8Gwg5szhH4GhDUl4s24+nUHRSPSU1PXDKAaiBOQ
	G9E3F72mgRj6lv7ULC5BLnbhDneRtbkJF7OFt9pi9bMBkH9EkpqO9XVkeqV5M7fS
	i/qRziiSy8+Wxuyw7rQ0vpzqXVLMWRYbLn8bMnhnv5bYJJD74cbmMoSP5wtyThjr
	vuQdAg7fM6f+FbT/dMexl5BQZP15iZ5bweiXRpZDz/qKf8Vuu/gIjimbPFWMeeLU
	57M7C50N9yhhDeIg2OXGz0Q5AvxVVx4sPzdEB7bjYcH9phXt01DaTnXb/VQlOdDM
	XVXw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d6v993vyp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 29 Mar 2026 17:09:59 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 1F5B5D281;
	Sun, 29 Mar 2026 17:09:58 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 29 Mar 2026 05:09:57 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 29 Mar 2026 05:09:57 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 29 Mar
 2026 05:09:57 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlImsQnvCoEtf5iBPWq0ZdWKwQC86fHeodTYY4evzqP3voMM4A52FzJuCK0Sk5qOhJ0P/TeZa/4IL4NYuHyEtJ5F60/xO3P3lO0e+vqid+eBTLoTVO+usGkllz1Jt8fT2djaGrDTH5clGfCKdAKZdtdLobsI/vn8LSQ9t0IlWMkGBDVK6nATpbh+91tT/9QuNTY73QJtVgyJaiIG4vgppUI5bc5UMfPm2HgG6TkOd524cxyrgq6xtstOXonrdhWT8SYJNQ4h3mWx0ZlIrwpss2fd7IRQPhzMYW4EEGIsWTpdh/qS84yZM3e5CNPMU1XyY4iZOVTOpL+6EkeCUWrDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRVesDss7pcr/oeL5yqqB9RfBgnpVs5T+zfAgJQMIOU=;
 b=d5NK00oGjUiv71ETJyJqB9Mkn9i4eoNrZJ+WMPp44N9kkbflrF4l9qgcNK/e31SnRxBj0c5Ok7K59BXaUB/tfZKX5qKG6AzLnCX7kRWR71dkcFxlaEZcgI+iLX9dT39JMsGl986uHJst6bPt3idOzJ2yjCSg2iAR3KBDub2pOAJTgxs1ecZ3TIqd4E28RKrry2p3MZc0lblZ3nuE26saIav4FrH/XX0EK9Km0zNHUrfnAqgeY5HRR1v0FLqhuvuP/0LwWQqYn5WlDefNMOQM12APDP7MwMjuB/mev/z0fug8OtM6CUJHu84eSnAyhYzhY/BaoImhQyhdgRDODaFSZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SJ0PR84MB1992.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Sun, 29 Mar
 2026 17:09:40 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.027; Sun, 29 Mar 2026
 17:09:40 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "Delphine_CC_Chiu@Wiwynn.com"
	<Delphine_CC_Chiu@Wiwynn.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 1/4] hwmon: (tps53679) Fix array access with zero-length block
 read
Thread-Topic: [PATCH 1/4] hwmon: (tps53679) Fix array access with zero-length
 block read
Thread-Index: AQHcv57Utu8gXvMxhUyzn+KwqJdXeA==
Date: Sun, 29 Mar 2026 17:09:40 +0000
Message-ID: <20260329170925.34581-2-sanman.pradhan@hpe.com>
References: <20260329170925.34581-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260329170925.34581-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SJ0PR84MB1992:EE_
x-ms-office365-filtering-correlation-id: 5e8d5c0a-67ae-4168-784a-08de8db5f6b8
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: sJOQHMy2UVD3XZ7slc519ga58zphNut7bThVIlFqt5x7mT48oI4E/zaF9rb53E/UbdFsuhQob3oEe49jnAZxyGqmlMHjZ104cLfD9VhvU9yUd+ODGbe/vbTPFYSE7/cx0BKeBML+r6n+eL3Kd5scJgQSMQsQhyl9+1m+rfLQkXlvEjW7+8z10YxhXdg1kHYrhR6qQ+zeS9dhV1mpbQ7D0uHw9Mat3M0KU+ImZzRSgqdrXwUF/JwB2rTG6at+TYEBRx+0ykeCrp4vNiHQf76grfsyNk586VtAn+GEQNWBc4mZ7Wfcgru6MFU+mqf0OhkUOH6jPgl+ywpxT9EVnx/3WmxbqbVeWHkYWdyT+w69TocQkY4NvP9lg7/9SnemZ4LwryKLgPZ46VJRCq43ipJgyapKJtNzj/pnLXrbNLZDZJche3d3OL9o1slrR219qdRjyhU5OSwSxReS1TxWSeOUQvvlbb4udmxUo/30bTsiXB6C5ThRGhtOcRFqXnoWGpQuW6MWmgNjbhVg2eIMBgbphjmh9oJ/B2WB9T32tSjmf2eP/swOKFiQFpOFtOT4lA+piMC34wqkh25X9LSpE6yrRWn+AcaOtEcdhTGoNfne6S5AQLmPGVsO10fXlxC8Qfg6DbPi3+J/6b3A8XJw4b+NjnoVPd3aGU2QIIeVLM4x1PTS6ym/OssogcpsXSmAyxbpa7U2lM8zLVDqqRN0sPY06HurrFzo24tNGDo2krHDVA/OiRavjHm04nsE+eJp9jT5NCZTXvEFwEl92lwZYtleguaZcGzG+lNrC6CN3OjCvuk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?J39B9W32gRI2SGEP0Dz8PfLUbTyAv2ZQx5W10Aj5vRMOHTSDbXY+/5HLpv?=
 =?iso-8859-1?Q?arZRkQ6/zF0RI1kb5gABE2iK83O+uYqADRwcjxjdB1y94BKfIlSlK7EnR5?=
 =?iso-8859-1?Q?a3J0mL+uVztYhNkV6BI+OJhFNfSbdufV1eA72/DysT8y3vrklphGclWW84?=
 =?iso-8859-1?Q?lVx62Fz1PBxeZxEgG85hvnc9/PlaTxB8dKqbmQs3iBtqmbk4J73ZIxoSzB?=
 =?iso-8859-1?Q?GozPKrmQ1XxgsaDaFvChR7wBWY+lhcih6FJQTPBseLDN5hyCiYAqpZxFI5?=
 =?iso-8859-1?Q?d7xFYYddnsJEC6MVNSCvdb/3b6TAgmbgDARqciWBN4ImNeOxWzsLAzIaTX?=
 =?iso-8859-1?Q?0aLZaY6TY4LATDEtWa1E6PglE66K7Boznf2WMADHZp+LwqknaEu9712Xn/?=
 =?iso-8859-1?Q?PfzbfPWkxklQBCXBi1n4CgrmOnMgznbnZItn+edK55ro10Uq/b6EzJPx1k?=
 =?iso-8859-1?Q?QezcKQylTYJOUhwLfj3XFJ2LPe2+8C1qK05FO2FWAbskQ2V/kNFq7ZPH4s?=
 =?iso-8859-1?Q?M5iib0AXCnKODG0hEJOKOsidjzKWt3JwrIPYnXu66JnqEoiEVxzFoqy+zt?=
 =?iso-8859-1?Q?cEL1nvs1xeRZ4TGyRTLiGFnAYkutIDhP0DO1CziZ2/o+czqvuPu4HvtlJ+?=
 =?iso-8859-1?Q?cyegOuGZtPZXaLyf67uwcNysffGn37ESvVN1kAofxQM1klx4MlmtRwjk1g?=
 =?iso-8859-1?Q?MZkNSZZA/6CK0+dhVNBqjMH7D8j3P4FgA0+snHMFrH5WttZabkxz0UqG71?=
 =?iso-8859-1?Q?sA0bpJ75J9jO1MPDYR/L8xO5RnOeoZt9C4KjqtqGLQNMvItECrKoC3QsFN?=
 =?iso-8859-1?Q?TusBj3KkvFQ5va07OqhW7iOVLWbooXDn6J/NyHIxM+vCCdGSvFLSbdTS2U?=
 =?iso-8859-1?Q?Km2kRZ9aH4CZt08LcTFed10hviMLMIkD0PT9qGLNv6WfV02Zz8bJYcWYZq?=
 =?iso-8859-1?Q?pgAcL7iH9EFFoZzzPWrkFTSDe8iTPvs2qGnw454ygzbt+7JIMF7gL2JBjX?=
 =?iso-8859-1?Q?LBWbYZ9GTKIfpKR0nRyWTZIxCr6wdgMPGNFQmTAaQEehGwd+tV6fO2IIEo?=
 =?iso-8859-1?Q?V9Ko8L61Oz0m3+CzFiyQrsUi3T47dsuE5qgMCabirPuaoBPNAf8xqvowqK?=
 =?iso-8859-1?Q?LOjUnIa9AMC43IkFn3IijeUTfusGlL+zTBSiCabu6j84eof/8oamv/9lRG?=
 =?iso-8859-1?Q?7No+Sb1hm4TxJ6/00x8Tew5qsRf+bza89O+UqUsY3nMhoSxg6bQO7f6sYE?=
 =?iso-8859-1?Q?7bMmtK6XyRn1sbRgxY1nmxJIRqHzd4WO29AInmRMCNTmjkfo8sv6lv469Z?=
 =?iso-8859-1?Q?O20tbjyD1pgt+LggW0t5SgZvlaX9+MHzPoRNfmBEUfCWzrvuHmYu1/BHgb?=
 =?iso-8859-1?Q?sMEV9ggscy0lF7qW/xfxzQNm2M7IcyUsTezxSf7Plt7vebjanNJrTTuByE?=
 =?iso-8859-1?Q?4gAOcyJ39N6SJTKMEsVXcbYM3O5OiQY14id/YiUXaPs7ZUUHi9+o/ekVij?=
 =?iso-8859-1?Q?JeC6GTdFjXfO3CXbb+xfwPIvoqqLamcflB6m5AcIZ1zaDHmdBq4y5gTRjw?=
 =?iso-8859-1?Q?YbiHZ58Ir33d0DEq8XIamQ6F+J75aA3VMSfkQUF4Xg4JkXOf9JRdQ0+WdF?=
 =?iso-8859-1?Q?EONyH2Hj3gDFc9miyt0OhI7VtB7UrJQPLzX5W24pp/zotg3WQZprNNzFlG?=
 =?iso-8859-1?Q?2bw4LKUrM/d1d6m733YnA4qa4RNpMGQbTRMMv16km6pGKAmX/tq4Nicjsp?=
 =?iso-8859-1?Q?8bi6BL6G7IulbEBRqOQmhXZ7pY1dtjE8xA6/UKUzf0hNLpwJQMHjwkGzyu?=
 =?iso-8859-1?Q?59NOsvikTg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AGmgPyDQCzlfK27Od98Im2fpnD95rXNoHsKafNjd4jMYIJOKpx3Au2puMnb3Drguu8I8FTdEdf9hSA2dXvaruu896BCd1aXl99yCJ7C9Uq95WBrCcfpC2SFtXxU9/ujQgnJ5PZYc882uaHsSls9q8J8qEBkM7bZHZORJTnPfNhKtz7awKaCogN2t8O6843ZSMxnEVO/ZM4rnIuCbXSDkBIv0WxvAENWcvQ61I+0KBYxnCGtFVZTuDvWuhoMA2gFGNrAbYwbnblpuH9REX8ZVVvSVHP4n2v7qPhn4zVN1gJ2vJn6lfxC9qNN6yr0T3pRBefpkB3KwqY50I0CzXd5ejQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8d5c0a-67ae-4168-784a-08de8db5f6b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2026 17:09:40.0424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dC9cqBN0RvA+JMZtyg9REpeauJitxwxZG4fJPY4anyfe+R0N/a8JsffV6wY+3FuGnAsBoKnkSC1uAi+Hz463gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1992
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=aP79aL9m c=1 sm=1 tr=0 ts=69c95ce7 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6XKncaru_qjgLvANlS_8:22
 a=OUXY8nFuAAAA:8 a=8qga_VDxk_QUCVnnbUcA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: lWs1hF1B7FA1Pq10VGwcnBsbG4NcVRq3
X-Proofpoint-GUID: lWs1hF1B7FA1Pq10VGwcnBsbG4NcVRq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzMyBTYWx0ZWRfXwK+sPqHGSgNR
 91lN2kr0V78BNvCYWG1znaZxun0rZwmZ/rW3LKZPh49sDb5mfQKnzTI0WmU+i6OS8xTKcp2PhBV
 5SZQ8o/13gdcjj+iaWbjBPGZBLx9o/QUpVtuZ5nl0hUBK8+mnV5xnEjtC0/zoNBZ6D281QWgHN+
 T/bANKoqPC0sqid5eaVuq39WMe59HntAtABEd0B5tlaCKi+M58pnhwrZQTirRalFv8faj9kFHU0
 ckdsl0XYijpCeoVwP/EYQHEsygjrFOEqnszBbmUiDj9JAVoSoFq/Oas2yNpRDMsI6pAdKVYNdWE
 gJ7K1vZCTPY/cyTju7BHvv6hVGpFZcJuC/7LYierNV/BK0LmbLQ40TA274RNEQnHaJRrig4ySj8
 SEh0anEQ+izEp9ZQKQiDqYBgxZJ1JuxcQ6AISsk8eF6064aTLdw/wE9ibCosW6j3MyJbnQtePGG
 RdIK6PoucoRYDJ12stA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290133

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
i2c_smbus_read_block_data() can return 0, indicating a zero-length=0A=
read. When this happens, tps53679_identify_chip() accesses buf[ret - 1]=0A=
which is buf[-1], reading one byte before the buffer on the stack.=0A=
=0A=
Fix by changing the check from "ret < 0" to "ret <=3D 0", treating a=0A=
zero-length read as an error (-EIO), which prevents the out-of-bounds=0A=
array access.=0A=
=0A=
Also fix a typo in the adjacent comment: "if present" instead of=0A=
duplicate "if".=0A=
=0A=
Fixes: 75ca1e5875fe ("hwmon: (pmbus/tps53679) Add support for TPS53685")=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 drivers/hwmon/pmbus/tps53679.c | 6 +++---=0A=
 1 file changed, 3 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.=
c=0A=
index df2726659a4e..1a6abc32afe2 100644=0A=
--- a/drivers/hwmon/pmbus/tps53679.c=0A=
+++ b/drivers/hwmon/pmbus/tps53679.c=0A=
@@ -103,10 +103,10 @@ static int tps53679_identify_chip(struct i2c_client *=
client,=0A=
 	}=0A=
 =0A=
 	ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);=0A=
-	if (ret < 0)=0A=
-		return ret;=0A=
+	if (ret <=3D 0)=0A=
+		return ret < 0 ? ret : -EIO;=0A=
 =0A=
-	/* Adjust length if null terminator if present */=0A=
+	/* Adjust length if null terminator is present */=0A=
 	buf_len =3D (buf[ret - 1] !=3D '\x00' ? ret : ret - 1);=0A=
 =0A=
 	id_len =3D strlen(id);=0A=
-- =0A=
2.34.1=0A=
=0A=
