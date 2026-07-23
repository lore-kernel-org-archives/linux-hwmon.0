Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E741D21E;
	Thu, 23 Jul 2026 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825126; cv=fail; b=E9doPvHVMEcCsGzouqp+7oNlnVXDvfjCVpGId6qVobyzFdB8xCSC1Bw5RFApEnxepQcKhRPTEfRtENwljoKejtddjVGORkLfwLLQ3gLdcz9si//PSLHWKPBt9I7thumr2hu1+voGronC5dqw5AdlBpNFcuDsIf9sd/vGtDroD8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825126; c=relaxed/simple;
	bh=Jb9eMMNgfVhmwwX1cvvaTwhSGWSV1INNgeOrjrIHlBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cIlXH6OiTFy1MMtt7L6lVsSq3tsGvGHvlRvwDHOWXnarXIkJyotIwE/7PunNhUZ9dKtUDjKI3srHFrIyfDl4LCsSv5au6KllwFspNmOvt/6O2PCZr4IAr0yPZeSIQbaP6KXmUvg48x8UjpuQ5//rl4dMSlx8cfKTCRcwxPbWDMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=QPJs0irr; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="QPJs0irr"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NFk6iZ3463088;
	Thu, 23 Jul 2026 16:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=62
	+Z3PC5iM+qoLplYi8EiXbcgHHTscp39nyvLDTVIww=; b=QPJs0irrqk3+Kgvslq
	/l134aJacKW0n55cZUiZnqR0onWf4rAbFIO7vJOvT+Mr0OCemJQM7MBqlZ8xTqpN
	ITpw2xAOXS6i3VUZqwu4NDMY+xYlQ2Czc0kRVbhPTCWn/5V7PoQdmESdSrlZOIJv
	TYSBDpo6NTaF7M4fdPUZc9PI11WrS3yyEFS5MDj4dlOhmt9l0BHZm0h9WutCeesI
	1T1FV24YtYXT2Gbz2+PLeHGn0+YruVh8RS3NlBO7GLtTT50gjWH53LGaBt3HHjNA
	Y51hGVXToAaRPuR6V5SQYdfFOYBesxCCvTB19DtPuwJjPaaSPKxT1iFpkZnQaUtb
	yfkA==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4fkmgp2t9u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 16:44:48 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 6030E800200;
	Thu, 23 Jul 2026 16:44:47 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:44:29 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:44:23 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 04:44:23 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 16:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciklGTun0yYiBEP00Fhwez0bOzh9T0K314mhCMnLSNhNAdDJkadPQov36zfqkYZp9Pyo8Jex+OKGmpVbxK0bQk9Twk112e4+6Y5+qtzOrGrfYAWemRHlYe1f0jopK6pCqPjb8hwri9j0nP1o1tnfpePpvmlHb6IQ662BcabLJro5CSfPDy4FKodGm3GEmdplG9UrCpsHJJhbd55Vn+IRTGKGKTn0BJOzQ8O//TkbetAPF6OJ5Ad/lgenxmJYHmRVyHmsAVvYuWnewAcFgv71tdGJWV/WeybS4GGR3iUbI4N35Jsp9cTy0Sgg/scjb7xYGzhhGVj4PZwvsABtUg2nDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62+Z3PC5iM+qoLplYi8EiXbcgHHTscp39nyvLDTVIww=;
 b=nGMz8qJfu68sufkq0+ntMH9XnB3wPZuSkiOJaoPqT94EU7wgePupo6MqpiizXpmYLv+k6ncInRyMwR77rFemr7U+SuGUtvIt7HnWrSgPYByxHCbJw85WSJxB6xQapf1opvE6pOjNZ5O6helNkUFheb03mL5vUJyUHbr45sgGP49AtGCp5viCHJ+M3xlwtui+MM5iVvFLfrErBKMPblBsa2EzFGP+PUCCcuZly6KSQXmts5QeAYx4xspocB0kIcy89amaLW95MBYKQQeYjKXD5r9LDQYABUKY7MQG7X0C1THjyx955NJS0wxJ78fjdPmylYso+XcUgBQYISd6l78fvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by CYXPR84MB3515.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:930:db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:43:47 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:43:46 +0000
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
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdGsJu1DPrY7wfh0CJrkgcZbBUcw==
Date: Thu, 23 Jul 2026 16:43:46 +0000
Message-ID: <20260723164249.199442-2-sanman.pradhan@hpe.com>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260723164249.199442-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|CYXPR84MB3515:EE_
x-ms-office365-filtering-correlation-id: d480843b-35d2-4a66-f5d8-08dee8d990ae
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|38070700021|6133799003|56012099006|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: i4Qwpw8Kk1XILyVZHU6MNVUjvNAtIqMk5xbc9zDijxge849/WmUvRMrE/bBCdoW0S/jH17Pg7IOGVF9kCUm5GugWOfgRKkSWixcAsVkoFjDSyH8xanuuuUqi8lDok+otn/pp5Mr9Szl0sfmQXLWxSko8jp0lTiYQFmciEVwXo87sKwIxpQ2lTuOrl9y8Gbqyoe1zNxGbJ3HgRc854yDmQoCETN7IYvD5NR+KgJ65TkXt3K8a3kGcJgdekKDfoAhTf3DQSHVmAv0+lmI6SqDfNNnuKReW5MvYhDj3rGnR6i6DqfVgya2SAepzDSzqCk69HNaJzzJ9SR48gzr/doZThEVHeB9ZB8cVjSASrZuv6zw0VpJySXowV/tSewI6NYv3AFDwZeBdKJhBpA/Xao26DFDKiYWE1qM3EURE7Vk+AFPPzkvrqw5L8s40tSSos9su8/D9TX3vQ5caD0EAuSnjf+yyws5Mm55v/hoL7y1YRnqB1XhHVffponN4EQgYpJwY/0jKCSsDOsZhFt+6pEsr2/Fhv25yn705ylQqjgaDPePCQymYa+mbQXFjJlpb5j7qMYNc0CwiwjSCbXWnwFcOfR2ZialSPtEfWzk4l2DO2yTgSERWAyvdQ9N3fYm3eSXChNll17MUc8BWJCpYXiKys6dzIqrUj3YwJWNH3RCD0us=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2v6ZAgvmxwLkQ9y889y2lviaak/yOCU877ieXW7Rmb1twuNnEnMvv8FKFn?=
 =?iso-8859-1?Q?+SL2ZBjDMgWwn7iv8AI8/rOeIVO7BmbSWokKTDEeq42c7SZvkczdE/B2s3?=
 =?iso-8859-1?Q?/N5asPSkWKdIsUEJSd80JJHEXUuBPfIOdSA2e+FheDWXmgNvjiVxhCjYDW?=
 =?iso-8859-1?Q?9NllNRakUhduxMhkARcD65YMVS5+tZgJmcRErC02FNNkB1h/MhK09wwCLe?=
 =?iso-8859-1?Q?PovQL7dPHwZ5e7q4GHxxqv+2hxZ+fxNPO+H8bzY/UV2SxW3iTQZT0Pzqx5?=
 =?iso-8859-1?Q?SSKk5gGIubu/7fJXgcVZ87XkFq+cap5JTLyMeaUmh/nA0NZcPTscLJlu9Z?=
 =?iso-8859-1?Q?/E0cSsHV2JIvHEm9S90zsbMi08cv9nXtRkSMHg7MaCHBn3OKzwv5+R44TX?=
 =?iso-8859-1?Q?JNR+q5VQXsqihJbEnPozftW0ghjqu9NyvKmobAkTsve+Ea3z7487gLvQfI?=
 =?iso-8859-1?Q?OH7qQVejDowzBMjhAeHivoaXgjJN9U6mrnWfekgyrK3Ut2naH5oIH29xR5?=
 =?iso-8859-1?Q?+TfrSQSk/JJ3mVYh/nj9jd4oztdHJdNQ2GlXGYiWHWNn2TLNkN6/zAu8hG?=
 =?iso-8859-1?Q?kGJD8ldyA5OMlOjRPxlcp4fG1b0Jbke9x9wv7WfDXUdnw9LjVxdxJJ/7ai?=
 =?iso-8859-1?Q?ojEIiiOORhnXUghPVQh6bVvfIwiMdGpny+t3LqM//LzctfU9H1h1uUU44M?=
 =?iso-8859-1?Q?EjkMaJBNpqMqukMJyeW8Zn7RbMP/jcjyWrz8wtH2e/oEQzQ+UuBDq7iBzk?=
 =?iso-8859-1?Q?Ye71g1lgRBHTZnzAgreIgHN8L0tmoyr10rw92pUFQ2I87DYrepKiX/yS39?=
 =?iso-8859-1?Q?P1c4InNVmaHjf0HM7FeGaoSiu5XplWeNZmy/1+wI5ImZOcEVwdEQ1C73Bs?=
 =?iso-8859-1?Q?VskvmA93IvwvA2RKUy7LAaaeCtqGbJZyRDCfMhGSVP2ZHkoys3JcmLrayN?=
 =?iso-8859-1?Q?SXmjJ4dLnmwtqaVJUvdwikAXlaYbIl308qm0AAR0qLgyC0DNWLWHC89kwi?=
 =?iso-8859-1?Q?T7hp1wC1qlisFFfYI1Z2jW6A64rhJ30WYezyX16YZuEJTToSoDGidTftYY?=
 =?iso-8859-1?Q?9oqY+xeYNn9K7F8LeLAeYKEOcNh4inf7Ik0CvBGBhZEcMTD8WDQzgiz+vj?=
 =?iso-8859-1?Q?SMIUE6iTAWSNp9DT85V3hrDK4z/SCgW24ZGgm15zTb4xALfqVq7Eo9rZLY?=
 =?iso-8859-1?Q?8MltcFaG0rlL4+NzzYVyvLhn6Q/avpwLCJN718++OR54FubctXO0/ph0h1?=
 =?iso-8859-1?Q?2n4TI2gCsEV1b0rWS9SLZSWEzCzOO/ECAGTXXugxyj2p+ghuP3sPXn83o5?=
 =?iso-8859-1?Q?o9foCWwtKhyeiRD9yoBKc30xU1ZMmee4zt0TxTzVPI9hO05hbjJhKIrTPp?=
 =?iso-8859-1?Q?So3fZQXzHoH3VKFXiRTVFX1zDdzsE/jsB870DglwRsGr7brrOsHRnr17zx?=
 =?iso-8859-1?Q?UeDrh97LORrGLWT/MnV2lqu9gqEApXMj1lFPKZRq2R0hYoh81DbH8PC9tV?=
 =?iso-8859-1?Q?YWORIDOaSxpQHGC4St+5oEa9lm7mNVnH5B7BvQsmDA6w7Ru+namNJ9yAN4?=
 =?iso-8859-1?Q?0G9AQT3mX1c5u+bT+/C7Cp/YTBuyp/yivSQQy9mfi7CNU8g1bbt6ORWGC5?=
 =?iso-8859-1?Q?vWau2dfc7QoAJh42fGKIA1xqkdAKdbKaNJdhe4vlwoMql03WERYiAiizfa?=
 =?iso-8859-1?Q?xnTiiMR6Q+/8QVyhiDpU5Md9g69CoSOn0G2CPBvWjOsm0V1GsZrzZDarcH?=
 =?iso-8859-1?Q?wYv1RYaIeos/HtBhj5HIm5vknSfyLf7si4bUpuWa39Zhg+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UO/GJ0pD1Sly7dqzrs8OeyLMp8yvfAGs6I7YfqAmd6xK5MNKyWPnj5cGT25cPniE/hmoQsAffD1t38ReWuTpfp8wyt/wc3oQm/v/hAIwbFpZCvpsesMKj0RlM6D6N/DLC7nZn+tYEL1MQj2H07kDKnKF3EhJCZ9/aadLk4DqLs0q1Bp7Spjg0FgRjW3ec3cW+5ocYs4g/WuKsGIANvDkWpC/dJHEVKC7fvOKgi04lzvhsteMnNe3x7L1glGWCrnPfxTiRcUD4TyPlalgTEE8gnuiulig7yuTpR4P2Dem4DYCepEj/EtVTyrDAAN6hKphTRfKRfi+uHj1cw1atGBvGA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d480843b-35d2-4a66-f5d8-08dee8d990ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 16:43:46.5985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gIHyMBYjRF9a6wXKcLLNeDb42rkmIcL3F3Mcjj7K2yCCCohI/rMftPvxK2/RlNVoerihdy5vcrpItpyZ2RMdRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR84MB3515
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2MyBTYWx0ZWRfX0xp0ZMGIbt66
 NPXhe8brqZCPXISwqKcVpIqFSRpCuImgHO52oGzaGZ3sFiKWJ2YquRPY32ocH7iYU4jclyluf8I
 5tYjlqN3UigwLxGiPNZfwXr3zuzhAhih5PfBkQYfIGT3wygFyorH6Pyj6MsT8W9n+EdlLZW1mZu
 AgOzNBC+kiI0OARiicdHe4zVZTzuK9oRL7vaEQMvAAN97owPhxg8/bZ0MvBLWX6NYPoEyu+MXw3
 P0FqB7rIotJ3XHCB+CrLifAFzpjDopwMI8geU/NcUI73o0LTnFCq8eWd5H1+1pXGkOrdyVHRLdM
 j+W6UkERAoKVEqSG/Sg93gmtx+5lIQ5zrF3dUsbOiEnhsr1xGDbrBFeAtWvwWPGslO8HhyVLgD7
 WF65c7GPEAMDQnfHCri2Q/PXuYGz8Io4+NKL30FViK3Fd3teGOXR87Y1no+5icvw+acBRWz9jOM
 bQ0kBfTfq4Xw4NDhY8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2MyBTYWx0ZWRfX7WGuHHgouVy6
 7PgWsgBAqMf8oJKofqrnEQu4RMJQdm/Gelt9N3C8CAMgwVzF+CBv48HjSsP5Ofb+aXHVkJSiTiT
 fik9f4qyKRnsLXmpn/QaxXT/bndAT8o=
X-Proofpoint-GUID: NwuYZ-yZzq_JWHZ9amKPGPSZWAt3KIpL
X-Proofpoint-ORIG-GUID: 2SiLrjO0t9Wo1MapU1Felah8GZ2WecQi
X-Authority-Analysis: v=2.4 cv=Zqbd7d7G c=1 sm=1 tr=0 ts=6a624500 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=Hk0O5Nsy0ObjQIZZsMkA:9
 a=wPNLvfGTeEIA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230163

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add device tree binding documentation for the Analog Devices MAX16545 and=
=0A=
MAX16550, and the Volterra VT7505 PMBus controllers.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
Changes in v2:=0A=
- Represent the severe-OCP deglitch filter in microseconds=0A=
  (renamed to adi,ocp-severe-filter-us, values 0/1/2/10).=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,vt7505.yaml      | 82 +++++++++++++++++++=0A=
 1 file changed, 82 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt750=
5.yaml=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml =
b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
new file mode 100644=0A=
index 000000000000..6096e03cb80a=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
@@ -0,0 +1,82 @@=0A=
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0A=
+%YAML 1.2=0A=
+---=0A=
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,vt7505.yaml#=0A=
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
+=0A=
+title: Analog Devices MAX16545/MAX16550 and Volterra VT7505 PMBus controll=
ers=0A=
+=0A=
+maintainers:=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+description: |=0A=
+  The Analog Devices MAX16545 and MAX16550, and the Volterra VT7505, are P=
MBus=0A=
+  controllers that provide input/output voltage, input/output current,=0A=
+  input power and temperature monitoring over the PMBus interface.=0A=
+=0A=
+  The MAX16545 uses the same programming model as the VT7505.=0A=
+=0A=
+  Datasheets:=0A=
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max1=
6545b-max16545c.pdf=0A=
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max1=
6550.pdf=0A=
+=0A=
+properties:=0A=
+  compatible:=0A=
+    oneOf:=0A=
+      - enum:=0A=
+          - adi,max16550=0A=
+          - adi,vt7505=0A=
+      - items:=0A=
+          - const: adi,max16545=0A=
+          - const: adi,vt7505=0A=
+=0A=
+  reg:=0A=
+    maxItems: 1=0A=
+=0A=
+  adi,rload-ohms:=0A=
+    description:=0A=
+      Resistance in ohms of the external current-report resistor connected=
=0A=
+      between the ILOAD pin and ground. It is used to scale the reported=
=0A=
+      input and output current and power.=0A=
+    minimum: 1=0A=
+    default: 4750=0A=
+=0A=
+  adi,ocp-severe-filter-us:=0A=
+    description:=0A=
+      Deglitch time, in microseconds, applied to the severe=0A=
+      overcurrent-protection comparator, programmed into the=0A=
+      MFR_CONFIG[15:14] field. The MAX16550 and VT7505 expose this field.=
=0A=
+      On the MAX16545 the severe overcurrent delay is fixed and these bits=
=0A=
+      are reserved.=0A=
+    enum: [0, 1, 2, 10]=0A=
+=0A=
+required:=0A=
+  - compatible=0A=
+  - reg=0A=
+=0A=
+additionalProperties: false=0A=
+=0A=
+allOf:=0A=
+  # The severe OCP deglitch filter is fixed on the MAX16545, so the proper=
ty=0A=
+  # is only valid for the MAX16550 and VT7505.=0A=
+  - if:=0A=
+      properties:=0A=
+        compatible:=0A=
+          contains:=0A=
+            const: adi,max16545=0A=
+    then:=0A=
+      properties:=0A=
+        adi,ocp-severe-filter-us: false=0A=
+=0A=
+examples:=0A=
+  - |=0A=
+    i2c {=0A=
+        #address-cells =3D <1>;=0A=
+        #size-cells =3D <0>;=0A=
+=0A=
+        regulator@40 {=0A=
+            compatible =3D "adi,vt7505";=0A=
+            reg =3D <0x40>;=0A=
+            adi,rload-ohms =3D <4750>;=0A=
+        };=0A=
+    };=0A=
-- =0A=
2.34.1=0A=
=0A=
