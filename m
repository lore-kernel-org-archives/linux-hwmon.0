Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD74409613;
	Thu, 28 May 2026 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989716; cv=fail; b=Dz1hLWhAXutV/OQFCe4XSDOqBwNeX7giUzq+ztbUdv1miWoz5ii5h/8cTbHcPaccroAJD8FhiTqhoGFoAUIEwRedAWfTdoIDH4MIZFtHylDuy5RhSISuUrQtqsoWnzDVkCtzVLZE7tNlpeG8XAzeGEWLw6n4ld0IVnGc+KtPRbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989716; c=relaxed/simple;
	bh=o49Iu4wGhicp8ItuQfr/BbwOUkyeUvBDFwLtz1Bpwhs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r+rmY3M6LWI0wZozkJ3TJw3SxPhC0Z5a5MTWDzK32DvEKquJ3Xv1WzUF503Dt59hhjxyS0FPvH3EP97T5Q7bNn3SKHPWhHwpFlLATEcsBBPk+aV4HN5mnEZ7S2lWjHhdhE1zTvUk4Cf1dlEoR+0PbHcgj7ZVzUnn/AZq/iS0Y6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=WYy9ahL9; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="WYy9ahL9"
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SFWHVu3859291;
	Thu, 28 May 2026 17:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=ym
	v8QUl8rxjDdSM0wuTcTrqbDet02CxtD/XiyGdvOeo=; b=WYy9ahL9qoahqRZroT
	Pvv/b/PjroqJSM1YIl1EAIhE0z9HXuo9HVpT1EjcZ3FFf8XzXnPDkLepta8e39GG
	gihQFEVJuhwsPJp/Ei4HOUiPpUHU6jcybV6YOM5mtcm1aad4WjA/gj5Uv997ERT/
	uMhGNCD5w9bNotJZBrFt4piHXxI1sWmeqsIs7NF0794HYF7+gisS+QU1FoHY9uc+
	4cDqLPzZUnKNEUkfgX+KLHmSMECTnft3DBFImIjwgyQsfc7jBeJ31DjnG2G9/JR+
	k3GYqehnYAC0rtoZYS804dgOVm8nGbobD5mk5eKqpoV5SfpQ0WshiEquIhlnNg+l
	XYPA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eepvjkd2u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 17:34:55 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id B81181317F;
	Thu, 28 May 2026 17:34:54 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 05:34:39 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 May 2026 05:34:39 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 17:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGZCGTEuvxGl8Sep3X5OOJBhwIlFgngF9ZnIIcnHkG5zKcV9dgXLMYDX6e731TZ1DFHpt+l41U8gzMAmZTeu1Y2HUHR56VU+K+66SRzX6G7h+uDKNRSSkeYC2Pup+JaUAM1ThxDa/Qu08jAv8Auotn55ttAGb4T9Zv7exlDgbRtpP92446bG76tDrZoGXIxQFaAJK7VRG1sX/kUDwzfj4Aru1v+2NeAmkuRdUAa5Q/GLpPXobB6rFZjlpxEaeqpupUhFQpcI9XZaksG9aTmyDVLvprY3AJBiz/qlNWnh9PmWTYl23B+3Id9kTX9g5vqir9c8FA5lsBx65NP2XT0Yhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymv8QUl8rxjDdSM0wuTcTrqbDet02CxtD/XiyGdvOeo=;
 b=rqn5v3DJfO32/TjbiT7Yoqte5SLjxjLYEYA5GoI0SJE/wXr4Nm//KrdK4VSR9vmfW4rY8HJwW9dSQLnr5rR7tUsPKSZ+xG32M+1iJah4PIxwaPHFPsmbL+UJyeLPVRVDBNvhWRM1gMI2Fi85ldaNLZ/cv2WcuPjbImGo1kzXKBrGT+JTAFgDIcfc9365XQdLdx08/7v9Iytvu3VaXsYSq9AENJ1itijofk3WEhuR7XjCtTX22EG3LSWyCB0E+64oASuanPyBNaDaD36IthHCB1V/a/5d0opfejHZZ1OGXGOq3j3rzC8KwPy8DT7gI1+GKM+fS8y6nx7g1SMVVsZOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS0PR84MB3745.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:34:36 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:34:36 +0000
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
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Index: AQHc7shAOHTZueUXvE6baumeXsV29A==
Date: Thu, 28 May 2026 17:34:36 +0000
Message-ID: <20260528173424.87503-2-sanman.pradhan@hpe.com>
References: <20260528173424.87503-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260528173424.87503-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS0PR84MB3745:EE_
x-ms-office365-filtering-correlation-id: 1c4cfab1-9837-417b-303d-08debcdf636c
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|3023799007|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: egE716zoemVEvS+Qu0gu0AgFM6XBTnFeG7vbwb2RiasAepLSdoMXNbx2923t6Bf0tqDc2bbBgM9Rml3SwPy5v4eu4bKeHpWInJU0htVpvBFZYFMdrZsFu1wjJeYONI0P3lEOI2SeBXfVkTBtacAGsHRBOzg09rym5zkzTjGwPY19WjscMwhL/awQ714MgUOotLHaUFA0A14jlUoQmlhjpqAFzvYfywxCXfk+0LF6RB/fTf5vrlf8rg/oKrH8X7A654V5TC8tjwHoYpeNtxeoHvB0rXZs4l1YDgowZL74D7RimKOdBmaUuGFdDIuc+R90TMHjWuHRkIUcPTjjtZf39f+g37CbWoXhPOKB+rEiprw0sVuhtkqQliIvDno2wdXBzlrhI595WU1GlY1BpFRWsYEZM+WXD7ps+c3zsTIT8XKRPUBg0K9659CrxvYCYMxDxflGBU/v9TdUYzSw6FJgf+mNxb6yd1UBDuYlrCGLodu4uP5LNAWReRakkBpSrVeZ9vdbFfrtNQtq9fSccIu+UdYNsd+bFkQttxwAUK397SabtNZwx7QabaXcyl3ts+ngcFLmCHkC4GdFop59PmibOEK9M7/fqHJ9Ck43d4eWnxcbquJg6fw6aw2fWPoJHC8mSqTxprhScYrBQDTcxMoYBa13FcZXfAnlKFoTUqUDpsOxKrtq7fPDdjSRYM+dI2M7hPs+tOJSCIBtNZzVB+6p3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cNi98GB7J2KnZwg1H4KoBay+idaC55qmOUHOkCt07U/HLAQd4BO1344HUm?=
 =?iso-8859-1?Q?++IirrU5rvNVFl17bQRIjnA5KAUOBqCkPWEWMQQwJBcfKs8/nrFkHZwfjC?=
 =?iso-8859-1?Q?oVVBSSLT0Hu476N/XkCq9FveGwajweklZDZBuNEJjIyx3wooe/sUPo+bxR?=
 =?iso-8859-1?Q?K3Kv/yD0o1MGTY3A42Mdb3LCNrnKDNPUH3Mp4y5F15Kow5HPHsDJnjaeJP?=
 =?iso-8859-1?Q?4FbWyyA/nCZhfsMf2Yb6xQqryy9zFMunvBbTjA6byMQNWh+IiOs9LYMPoL?=
 =?iso-8859-1?Q?dftDmn7ULIUOkQnNIscOG7DxdwP0RK/2qUSUL79OIguN8Ik2aZdXuRZ+wp?=
 =?iso-8859-1?Q?y2uSZIsBxOPPLcDfV6RqjLt400VMJrLGAKprZf4eXvTLWSSNT2r4jPIZgH?=
 =?iso-8859-1?Q?wh540rjMnZjr5ZK2k9oxKyrHkL0Dx7vEqTHx23CmQa7tmX5Kp2S+3FQc7+?=
 =?iso-8859-1?Q?e3YXEl/k97O0X9P9t0MsxV6Y2m2zu2PSQGx50CSWaV9Nb8zZgtJjQItHJS?=
 =?iso-8859-1?Q?iNPXltyizep3kNb9uer/j8gu5ev6KIIGaZjmopxhFxxPkqZRyUdDUKDO+W?=
 =?iso-8859-1?Q?h4SQZqn0cJHMFII8ZXkQUZXVeXaV0y2pZ4zBYUD15YFVcw7bERTCIkGQr6?=
 =?iso-8859-1?Q?RMwvl60d/mxlWCNK192jiULsk/Ug5mhigRsDJqrHqc3bKHaOM87YKYS6dH?=
 =?iso-8859-1?Q?Hi/r2gEGmbNkk6FHN6OHMfXFfAqgzUSoyRTD0Jv3dmq+ieelhhXcNPfDsB?=
 =?iso-8859-1?Q?fkEKadIpXtC7Xh5Jqmcb/uAqBviKZgWOKJq1miJBqq2t8QNBtZH6o1PSHK?=
 =?iso-8859-1?Q?m0UEGQj+PmkHdaAq3eH7ftDq3e5E46iSUMdPgAPRjjauc/kGZJVI8NdoeG?=
 =?iso-8859-1?Q?IMmbzFdopSflvPcYjV/kYN9CrEdeh0xt38Qm52D/gnzTTt1pmynzb4HuiM?=
 =?iso-8859-1?Q?/wrG4Wo7b6EHAfHZMmOWWcsTbS48Q8hN8u91xUHcDKh2yZ2WlQajgX5yGk?=
 =?iso-8859-1?Q?EnfdLyxh1qNouMVDdv09AJ+faCHQDw9bS2doteaeV9jbiMQl+UCPFctk+Z?=
 =?iso-8859-1?Q?+dx0NZxA12rrqIBtNQpEVXRNdMffjfq8BP31C/PfmAtK2mk7eE2kTFb3hj?=
 =?iso-8859-1?Q?qlfSoo5+rsqenl5rAvKXkNFc6GHQEQzViBHBIG37gBWGyv2GMwZU4j9aNX?=
 =?iso-8859-1?Q?izZpPm1ELkbtdEiGEbPdCMiIR/3BHAvM+JgGk9hneBHWSLcyWRgimQk92O?=
 =?iso-8859-1?Q?7n93ynPp4hD4h1kEuYl6PPOMzRY+w4RFkSNMe0lUifdPDhCmRbqNeidjC6?=
 =?iso-8859-1?Q?W1xExLlF3iks36wfp41YwbAehYUjOyefsMzqIDycCSdHeIyVKGw4H++aHY?=
 =?iso-8859-1?Q?xbQKRwChJw6h9DwloLomXli845PJauO/8MR74se2UpSBS0GNG706fIVV1+?=
 =?iso-8859-1?Q?7XdbfOomXpaN4nlY/gTc9n8KER327uwyDHXcFm7rvAj0tB11QHfCKGFlrk?=
 =?iso-8859-1?Q?OxC1t+hoYwp0QmwNbb8r8YHiTR01C63KciZEc9gq1tP8Gaco1ghMpYQ0KS?=
 =?iso-8859-1?Q?YW/pnRp3h+eCPP/9p55KXzoa86flraw46VZhpew1qEa8lCOTP6AQhfdKPk?=
 =?iso-8859-1?Q?4npmFjltPeG930M6qNEUdlk86bTXycLe672IeldY8ZuFYl9VNLexMjVdYu?=
 =?iso-8859-1?Q?zpqDOvUApdPfxZOeQYUrbu2xN666uEHAfJMIebEAXTrVKzbil98L/KSP5N?=
 =?iso-8859-1?Q?vwB9wqNEMAPtAIicZJ5IRWgO5mRPQGJVsllxKl32lCvo99fqOLWb1u1Uc9?=
 =?iso-8859-1?Q?abER1VQDfw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LG8pMscVycmdB2wm8CPnE3fB50D1mIo+vxTBMpZt66H8EPyLDWky4hfjQOYmSRyVJNLCxy0fJu3VPC2teuwU/5/2La/tz7FQCaLuC2LbgSdG3VTjHEpowJiZFjzbaEq0TdwG7inbiKlF/5uZo+pfcJ4Smoib9JxQLdqkKuvV6NGhWxryXlR7kcj4J7jqr3Zxi0XOGI5sW60OG0wnFErklGN1KUZXUfSVBsFvki22/IUagASWsn+mkiJxlyOyJ9SvrJx6HGRc3N9z1oW6J5N0jw0CcPm3yFNHL20dV0KkzSN1uRp4LA2FtTaE2iJV30NCHsvI97lHPVD4FCDAJ9+2gQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4cfab1-9837-417b-303d-08debcdf636c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 17:34:36.4369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBUjgDv+mTswqOt77LKBrOT8lqVxrYhz5DvztRDSBx3wpdjapRVAr8slmM7AbApnW+rIviOxaQw7vRX11f+pwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR84MB3745
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE3NyBTYWx0ZWRfX8S4Pw0fRVDDV
 p7N6DevFPdmnRjttSm8p89XkvDB1LVvv1na3VWiBjodfLmqpis5oLsQ/fYkn3KQ5yhjv2xG6Xh7
 KF99MUgJrcdUXfiiKzpVcHCI7T92PrONQX7/Wy4nrSIb8y0Mvc1XKKv3uZKsNP2Wy7d0T/Szwaq
 K19IdB5YTjapppLCF/abrhytDSOJIpZxb8LlE0dtpP+Ubk+/L8q2lyenT2s/vamsKCqZbKEqnQ6
 2aLKCdV0EnYxYpfyG/LeZhd+ZQPpcNGk/qvStX/x5smVTKtZEKvLURwx+MiAg7ueyeCWRx7rvfM
 AIvsmfBajezoyal91T0g/fOkZrwhxqR9w1EledW3wnNDa7TtagcnJ7GaNSQxfWXc56bkyfxWg3e
 N9FsHWKSkcepoWhgUgdVO51GBortwmznYsUjAZW+wNKi+pMloasiX4J4a7TrXcrqx93Lrt4dWKU
 8OkjYGeWyjh9iRnTrgA==
X-Authority-Analysis: v=2.4 cv=BsytB4X5 c=1 sm=1 tr=0 ts=6a187cbf cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6XKncaru_qjgLvANlS_8:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=OqFmrP_lak0z3EliHaUA:9
 a=wPNLvfGTeEIA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: 7YgU82iNfurFEOGjNv2X3K_zScZp5Vpl
X-Proofpoint-GUID: 7YgU82iNfurFEOGjNv2X3K_zScZp5Vpl
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280177

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add devicetree binding documentation for the Analog Devices MAX20860A=0A=
step-down DC-DC switching regulator with PMBus interface.=0A=
=0A=
Both "adi,max20860a" and "maxim,max20860a" compatible strings are=0A=
supported. The MAX20860A was originally manufactured by Maxim Integrated,=
=0A=
now part of Analog Devices.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v2:=0A=
  - Added allOf regulator.yaml reference and unevaluatedProperties=0A=
  - Added "maxim,max20860a" as alternative compatible=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 47 ++++++++++++++++++++=0A=
 1 file changed, 47 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20=
860a.yaml=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
new file mode 100644=0A=
index 000000000000..f7eeb30f11b3=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
@@ -0,0 +1,47 @@=0A=
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0A=
+%YAML 1.2=0A=
+---=0A=
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20860a.yaml#=0A=
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
+=0A=
+title: Analog Devices MAX20860A Step-Down Converter=0A=
+=0A=
+maintainers:=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+description: |=0A=
+  The MAX20860A is a fully integrated step-down DC-DC switching regulator=
=0A=
+  with PMBus interface for monitoring input/output voltage, output current=
=0A=
+  and temperature.=0A=
+=0A=
+  Datasheet: https://www.analog.com/en/products/max20860a.html=0A=
+=0A=
+allOf:=0A=
+  - $ref: /schemas/regulator/regulator.yaml#=0A=
+=0A=
+properties:=0A=
+  compatible:=0A=
+    enum:=0A=
+      - adi,max20860a=0A=
+      - maxim,max20860a=0A=
+=0A=
+  reg:=0A=
+    maxItems: 1=0A=
+=0A=
+required:=0A=
+  - compatible=0A=
+  - reg=0A=
+=0A=
+unevaluatedProperties: false=0A=
+=0A=
+examples:=0A=
+  - |=0A=
+    i2c {=0A=
+        #address-cells =3D <1>;=0A=
+        #size-cells =3D <0>;=0A=
+=0A=
+        regulator@40 {=0A=
+            compatible =3D "adi,max20860a";=0A=
+            reg =3D <0x40>;=0A=
+        };=0A=
+    };=0A=
-- =0A=
2.34.1=0A=
=0A=
