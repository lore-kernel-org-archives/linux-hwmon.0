Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE32D8391;
	Sat, 21 Mar 2026 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116714; cv=fail; b=WVvEtGflvu8c3hIebRJdKnh+ABdEaBnkGFEnEZ3QUS/VDh2k2xRZBAq31l4BDrx/9aJkNWi5kLGVEGUrA8mk/kA+Nh5F/iFqoGW9Bp7jfJ5vOb739HvNenW/AIa8O1Oa/Rq6IHYv0iuLi55VO16mDMz8445/u25zPAmk4gi+ZN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116714; c=relaxed/simple;
	bh=KGb0Mk8WFA4ObR5WVvvbHjyxA6v1e0j3VIqo84lX+rY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kUYkS40bfv4Eozyb/+CeTnvxmn67ecHmMMs3gLELR0W6TOGVmiVyY06GN+XuBVeiF8MhYZ4OPLibWNVHZOeXfSbkbI3aKdQqbfVapwCtwvB3od7pDTGi5YSEBxfkRyaTDcl460qsbUDuGoUj/G/YbghosuIy2w5nDO0Z9t1+0qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=iQCHxKhT; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="iQCHxKhT"
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LF2WBJ900671;
	Sat, 21 Mar 2026 18:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=WbBEp2ym0Nr0J7UAj6YNIBO8
	xlsr/FunABxbI0r/fXE=; b=iQCHxKhTbVduJFPnt1MWWY91At4hX6vtcjbG16SO
	+zQrkCLyWLgLlh4VGKW3LTk4xOym5uLGMGCAnt40LPg5PKz6+oEDmRyv+jWupiOr
	BIQMUpca5HAkTuRP6WkFbWQUkHFMVwfkYB9EM8Mxnwsch1zW0wO/iitX2US3lyZe
	n9jnXguNdsgTXAqec/4ZGl3tTXhi8A0A8KFUvgQX7cGf9nTta2rUTIJGn+tp/qkS
	YrRk+d9G1gaXcxLNQFGHTT0aiMYcR3lzvaXkJvCXRMe+rOoBxqBsOMzlHRQtB/AO
	jXMyLrzEcAbT07yR9sQXTDbGIcDWmJr9DvM2BY8Sx4tO+g==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d1kqsd3m5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 18:11:37 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id C37A2338;
	Sat, 21 Mar 2026 18:11:36 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 06:11:16 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sat, 21 Mar 2026 06:11:16 -1200
Received: from DM2PR0701CU001.outbound.protection.outlook.com (192.58.206.35)
 by edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 06:11:16 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5Y07QzFUC4knIOHPDBYohgQxAOemspQ28kLNsGrttcnWzfBtrwD+Q4rZh+2PDXfUUscG38DkeUlH59FxkX24W/qQqnZyn/zPbR6vedrFQE9n7r4F7BZ7Rvk/Vf+SCsgNCPk3I3M/TA1KFmt2x1o6dEs+LLzj8BvcGdiYGTeAW4BemPCpQf2hyxbpiQcaFCwma5TnwTGlECMgfoy8ZqOeOPdKPMOrMiQAKfL2BoUwi2jvTan/EPDe3++FM/6bWWg1aWVPxJRbXJdJAQF8quiNo2EKFivXgoBa14m/zcBLccTsQTjZIXL9zvQ5TqOOYoTlI0rzm6B4pMHz8pADZRAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbBEp2ym0Nr0J7UAj6YNIBO8xlsr/FunABxbI0r/fXE=;
 b=cUQrVcAaOYQSIUAzDxDhc+HkANU5zbFifAPKfL4bWRdOZWsJ3NPHV6emAMj33il+i2tgeIA61pB0qb03oC8GPduMF7M9ia6plbOtgtnxm4zKTb1aNJvXwkcRFILbRs+l/BwWhwISDiERr8/LGJ4bFi+c7QZOp4do7O5jM6nac6ogC1r4IaWqVEK1VPjeZhSMmEDJnGQAScfAHdOrkUVxRY6zUg+KhpybDf2GVx0xihQ4LU9rknemOZF8TI+Od1DEK33qdF0Vvhx7hCkqS9UnhfkSGIcu7s54C2b1EcAIoEeo3aHOC0tTU0PDji38D0yUwrRn6jSSySVeK8VYgJv7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SN7PR84MB3208.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:268::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 18:11:13 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 18:11:13 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v6 0/3] hwmon: (pmbus/max31785) refactor inter-access delay
 handling
Thread-Topic: [PATCH v6 0/3] hwmon: (pmbus/max31785) refactor inter-access
 delay handling
Thread-Index: AQHcuV4aXm0An3ZH1Uqw4BdCPeaaNg==
Date: Sat, 21 Mar 2026 18:11:13 +0000
Message-ID: <20260321181052.27129-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SN7PR84MB3208:EE_
x-ms-office365-filtering-correlation-id: f38edb62-8f28-4162-89c4-08de87753d01
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 0fKTgCw6iAsgLByiSrcRjkqWCHpOVbF1Zgi+1K7CIeZtlBiebN5v80GrBot3Vn2hwdccofOFOIFhSYgpSRkXEqNNZBlU70phX2vOvf/IGi980yQnQw0g+ECqOaNTwsMpUGNDXaedUwVOilgXwPUpIDXKl5ld4kMuG+yBdLZ0//2POvz1niYBpdvhF5OArcEr/C74S89cccrg93oa6y7zFJ0vzLQPkp+xLGs4+XUTC6rpjL7Fbulrv2XW1GsKltVmSiewxLps1zZ7W8KUq1mP43uzAhSDN0a50GeuP2d+qDF98KmC9HepiQAc4axJcJBq18ggGjUE5Pn1DXuK6E5jPU74ZbrvY0wRk63eqyC7t64cPLpGJbLqCzUs6fUrdehKQ925i7/2EQosN1RHZfW7PvNb11W5ukc/GSXgRJLXVt9X05jTQX1WnGK4Uhw4kXe2LFoycosKbMF9sSxD4LJl5EkJHG7eOZ2vRn6q+JR+zn3s2jhyD7L2bYJp0A+P6O0wUFqJA2tqBjFz8vE23VtX/71B2yMZJxLTDzgj1m4mPrk1iLTJ6W1l+U06wj7CBsI2J/21izJ3pRng64EXqe5BkxzG2+v25CD75tslOumkQilaAKotWCFOO8OvFgyuw8O5V8UK3n//oBaESRVswtgxTJa/XAXFtiOv3OVJWdLwdgFSOv8LErmZ8lN/LC2XQr16zjzcp+uHhaNBqqDbHcg+IjXFHAuOdJbQ1bU6pnJs9V3klmN/XAQGl8xc5SXjSOC1WU9nwsSbI7UQkTGV7Bv7KJkl07cOJTlNBG8UBzbPDFo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?yvo3zG2XNMUctb1DA05Nz51l5AEV+RWRCxoJhBZTY5f0mtIL1hawY4g2TO?=
 =?iso-8859-1?Q?NAeIdvH/cAJdnmL3zFdW9Blkn0FuLJPwmz3Fh6EELPcpR9FmSeeXpuAi9k?=
 =?iso-8859-1?Q?sAF5mZoCmunZFFO0yYCy+q3S8PfhygoSQv+nxZqgL5ZfSxbh+zJBI9v0tC?=
 =?iso-8859-1?Q?e3bvKZlFXAqRUu5JsYGEJgW4XvR22hDK1tT3SB/vSI6QdPAOWbdHtNHJeA?=
 =?iso-8859-1?Q?TVNOAm04UJf3pdij/IDjWIl3QNVHEB3mRVjhUedXvZAAEV5+zlnO3b+nec?=
 =?iso-8859-1?Q?pn12uGa9Dd6flqPt+M2qIz9vxgJWDRTg9wYTqUq8JWfLB6y9KC6Y64QJ3U?=
 =?iso-8859-1?Q?rrtuK2R+icZEQxOBUuSVWrsgvzGcMMwXJUpPKNcIuCiN7cSpH7VtUVymjW?=
 =?iso-8859-1?Q?WsiDIPQmbsfxduiqcBwF2jXQS7TsJxffj63xvxb/HIMmH8L+6wLgv4Nvqv?=
 =?iso-8859-1?Q?fnmb8B7rzl8dfEZ/oEfOXRYYiMSSQzfY5ks1ADtgzhocw7MU5hrFGGQj1V?=
 =?iso-8859-1?Q?DfkSI4WRYytiq07WTAt0MZX1ap86k3fpZ9SGwRDUtmOgGy9GwAQSDeCNxL?=
 =?iso-8859-1?Q?VO2u6Dj/zbnMuA1p0HL5bQutrZWU4NkeeFily1Hrs8AHsdd5bi9fbrNavT?=
 =?iso-8859-1?Q?kg5Uo2CbHFLC9QJfgmmCLYeibZ8QI4QOyX9TGWLSo6mURHu2cji6bgCGlP?=
 =?iso-8859-1?Q?wZ9swGN3mjcuBxMn2zVbDc/28keZ5IMSBn4plXLWDVJ6saIRgcNKPdU+t6?=
 =?iso-8859-1?Q?OG+ZUUZYZ3Sgz9Q+hkfSEntc34lyEiw+GdrK/i/O3VOjFJXv9zNGl2bBSC?=
 =?iso-8859-1?Q?ehymPejZ2ryJ5Xb7CB/Tccj+H4QWvtvqDiZw1gAK6Mlw0AmUL4Tv7ZJ9I9?=
 =?iso-8859-1?Q?XS7iA1c0xSOauhQvtSJFUUzxzHcVSqBuwVbpBl0fDu3EDNfxPZsGTzM9Yv?=
 =?iso-8859-1?Q?b7RTTgRGVDmyxBTDfavX6b2yWZ1O4uo8sqeLhXP2YmkkFOHAuZ4FNnyTwS?=
 =?iso-8859-1?Q?E3UdPk5cZ9H3FkB5SZnavIjqCT+LUNP/RMI5Nh9qAuwDozKWgvVZSJeqBV?=
 =?iso-8859-1?Q?wpm/cPgyDVVZEl3OeET1cnHfhhIBRjQwBnrw4FE2q1NYXhPUh8iPnX6kKH?=
 =?iso-8859-1?Q?z4Dte1zWK2ffSaGHe2aZiXvQJtYJZdZkxLaZ9I9zGgMdgFcEZwMEtz5Uvz?=
 =?iso-8859-1?Q?u3ZUuN0ODwBH/dq8bXjtaOVHpEqVvwIjuQXaXXuFkAoA0gUH8jUzpt9T3d?=
 =?iso-8859-1?Q?R+0UPwRbPGa5jvE09P0btlkhwW7iEQ55epwaM+VS24BylvJuZJSEZu+dTa?=
 =?iso-8859-1?Q?txSAxNZTmKhXBhXHpepzKbjSPJFGyWeZtKNSsa0+0/B8PNGL+ButgsRUpY?=
 =?iso-8859-1?Q?OpSseGuYSixwUpEPM2C7ObjK/CqUp03OmYiqTWc8JTnllIAb/hgYyzUpXJ?=
 =?iso-8859-1?Q?gSAdyotUziqsIgPZT+OStYc2QBQF0TxdPLteGb/7PK2bsPlDDqHn7vSRJi?=
 =?iso-8859-1?Q?N7nYCQGvD27LgrqIXSIOwgOgMOUx6TUC+G2jDQpytKOs5G5H/vupdBLBev?=
 =?iso-8859-1?Q?J7LBrbeHIz5rd92ztwgsMAcAtezx8tuTlvCZAQrYD4tQZMqXPUHCUaN8Dr?=
 =?iso-8859-1?Q?XU5LGR5ZJabFumGwHZ+nDGi2BsBg5fHFMsZjXlQcYfzi0J+IfPvcOo3YyS?=
 =?iso-8859-1?Q?F0oxEVdFbuFXZ9n41s9qAD7ZkLAj4X6Z7Gz6dquJ0wkf4CazR3MZkh+sJT?=
 =?iso-8859-1?Q?/pToY84/Ruyd7WOw2e6n/ax17sZWRDz/OK8/QLUW41SQiuzMlcW1jCmx3O?=
 =?iso-8859-1?Q?i3VZ2d4GCA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f5G7UuTsS4Is4OBA9LzRCD8oCv3yvGI4+ehyPlLVfZxsUk/qRfMkcAEEy5ZMsjT/SSbxG5/YBWPJ57erqzECV7zBl2BgTgU0c0/G7JtixI3HUM/CWyoXYh0NDxicn7cYXV+z8OZJ7nhfmD2qeNCLKbBAmJzsDA+z7Fx1unDM+XD8iHsnDwSOJBYLmaP6GTRin4koclQXqCqh0eZl0xdTzF/oBi/IeFL8XTSHiXfYWrioMesX1GnO11i74v9EnWKB3D7bf2wGt2pn2uJeS3j3+sefhJBlpWYUNI5W9ZRC/2sYF9lhvF+9Lq2K/QosLH71AbWGRuLa5/Jt9EqqbmI5bQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f38edb62-8f28-4162-89c4-08de87753d01
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 18:11:13.7138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 04iwu0ev5SRUGIeB76s7AOloSPKg/YjPyqLB1tNTLv/FFvCp8N6Am4+dLkamGVGIMpc4A3VlIzbWiC4vxqHzig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR84MB3208
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: bDLto3LbNwLa4edOnnuajr_2hdG1X-7_
X-Authority-Analysis: v=2.4 cv=W+I1lBWk c=1 sm=1 tr=0 ts=69bedf59 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=_ZmgHqWwjZUDpi_pur5s:22
 a=OUXY8nFuAAAA:8 a=gqhRMPgVA9zmgczqig4A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE1MyBTYWx0ZWRfX9B3SLimJvZul
 psO3KAqEV0j6tYo5UP0zj8/UEbobWHg7SPU0siuTLuiK3rEL71MZx2QTwVefjb0+2VBu4LVBm4N
 9c8LIPhLKeRvljWGVTG5GwaqOnnLj83B7pfSiGDNsRpwS9pDmOF0WWWuwmSvMVu0E3LRB4b9z6Z
 yDpqLIk/Y+oFAIOiobqAs84r7Eq89pRp848PmeuS0i0PPtdZcIdvguiLeYGRANCoK272GB7Fl79
 j0t1sJR1rsZ9pvYHG0kN6y1TdYP3tPnAAp94c/76bsxAcbK12NqQOj5GPzkKCBcnKPkZroiIpWF
 htqDIeTBTzudaeVvSdSaof1ssOMW4wim7LJJapXbqqMF1tHz8/khMAhV266YGy2G37oCDa8A20V
 zG9dbLkL9MxN8PeRWlVhIaJnEXCLmmXWwhVUa5/auX2GUFyrPrVt2Ex0LLDnkxm15OuraGtw6S3
 ysbplhYdBh1WAAK6vFw==
X-Proofpoint-ORIG-GUID: bDLto3LbNwLa4edOnnuajr_2hdG1X-7_
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_06,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210153

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series refactors the MAX31785 fan controller driver to use the=0A=
PMBus core access_delay mechanism instead of driver-local timing=0A=
wrappers, and fixes a pre-existing bug in the raw I2C long-read path.=0A=
=0A=
Patch 1 exports pmbus_wait() and pmbus_update_ts() so PMBus device=0A=
drivers performing raw I2C transfers outside the core helpers can keep=0A=
the PMBus delay bookkeeping in sync. PMBUS_OP_WRITE and=0A=
PMBUS_OP_PAGE_CHANGE are moved to pmbus.h for use by device drivers.=0A=
=0A=
Patch 2 refactors the max31785 fan controller driver to use the PMBus=0A=
core access_delay mechanism instead of driver-local PMBus timing=0A=
wrappers. The raw i2c_transfer() in max31785_read_long_data() is=0A=
bracketed with pmbus_wait() and pmbus_update_ts() so the PMBus core=0A=
timing state remains consistent.=0A=
=0A=
Patch 3 fixes a pre-existing bug in max31785_read_long_data() where=0A=
partial i2c_transfer() completion was treated as success. If only the=0A=
write message completes, the read buffer is left uninitialized and may=0A=
be interpreted as valid data.=0A=
=0A=
v6:=0A=
- Dropped the regulator mutex_lock patch (was v5 1/4) due to a=0A=
  deadlock through the regulator notifier callback path. The remaining=0A=
  three patches are otherwise unchanged from v5.=0A=
=0A=
v5:=0A=
- Dropped the spinlock patch entirely.=0A=
- Added a new patch to serialize the missing regulator voltage paths=0A=
  with update_lock (dropped again in v6).=0A=
- Updated the export patch to remove the spinlock-based timestamp=0A=
  handling.=0A=
- Kept the max31785 access_delay refactor unchanged from v4.=0A=
- Added a new patch to treat partial i2c_transfer() completion in=0A=
  max31785_read_long_data() as an error.=0A=
=0A=
v4:=0A=
- Introduced a spinlock to protect 64-bit next_access_backoff accesses=0A=
  on 32-bit architectures (dropped in v5).=0A=
- Standardized all commits and signatures on psanman@juniper.net.=0A=
=0A=
v3:=0A=
- Dropped the u16 -> u8 wrapper type fix (already applied upstream).=0A=
- Fixed a comment style nit in max31785_read_long_data().=0A=
=0A=
v2:=0A=
- Export pmbus_wait() and pmbus_update_ts() from the core.=0A=
- Use core timing helpers in max31785 to replace local boilerplate.=0A=
=0A=
Sanman Pradhan (3):=0A=
  hwmon: (pmbus) export pmbus_wait and pmbus_update_ts=0A=
  hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses=0A=
  hwmon: (pmbus/max31785) check for partial i2c_transfer in=0A=
    read_long_data=0A=
=0A=
 drivers/hwmon/pmbus/max31785.c   | 197 ++++++++++---------------------=0A=
 drivers/hwmon/pmbus/pmbus.h      |   6 +=0A=
 drivers/hwmon/pmbus/pmbus_core.c |   9 +-=0A=
 3 files changed, 74 insertions(+), 138 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
