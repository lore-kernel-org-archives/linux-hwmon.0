Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1634887C;
	Thu, 19 Mar 2026 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941525; cv=fail; b=Y1kITkNx/TN4lQvqeOoKUAHH4nRBrbmmxmgFQHoW4KgHceUvBtoQp0PZ8zeapmiRN4158IsBW1x8yyYCOZyZKDAL5OzYBGOeKu1z/xgXba6HsAeq2QRbngKA6LktHSTBOXIPEBfnIQbK6iSMN2xd8bp0qAu2/6kMT+8AoNLoDd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941525; c=relaxed/simple;
	bh=JFh10RFyr80MUU5WyIYMpjnHxRWGkYddIkkWlnYLHNk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=I3LMhpiZN0Mj/W5cjEo2q0LqBVpaXcuP67Jlnc0zDfz/6qd9RzBEqheCHZ8Xh/tWY8ECiPFpQsyfZZZfcCJ2MCW72HbBaf9uIVTZ6VlqYpja428G8WyCkDiFC2tkUKYArftPFqo9Cz9oW3o+e+Yd/yr5eHe3wKRbufmmqb7XMI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=LmuUIvW9; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="LmuUIvW9"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JD2qru2007835;
	Thu, 19 Mar 2026 17:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=8gW5jpsmy+uCr2wGbWzYLHqz
	NDt/sjic9Pu+7atWkgg=; b=LmuUIvW9tr0o8izoEzZJHnYqh/nUjsGOUF6B8EvO
	EWYE7jhbxL6KhPb9nZEjhtujZU7Slx3wSHsnvhpkGdgvLrZCQ7JQq6tM+9+LGZRi
	U4FYkMT7tdNr/nOetX3S/BrNhkMq/ANrt9LsTnvUw0CFZPGoA8PaIFQM2HDoG9XN
	tbOMJocgU+uCMqzBwv61+makSc9qcI37MSGDlGPJL6xw3unStFnV5XKMoJx3g+q3
	WhsfGB4fzYCRAmDhD2KAdRup8rreUkvwwWEva0HVHM44DNFaj+k25BjTk36hs8g6
	zVKE/wBErO/0nAu9ZNPAO+PjEx2RXg3mNLoxX44y5KSRSA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d0c7fy88n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 17:31:39 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 5BFE3D1D8;
	Thu, 19 Mar 2026 17:31:39 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Mar 2026 05:31:11 -1200
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Mar 2026 05:31:10 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 19 Mar 2026 05:31:10 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 17:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAGj5pPnCXeDqf+ljZzAb1yEfVVIpGJ4WrXoYn5GhAD8fvg4ybQ2TSspnInbjbrJIPS1uaETtmMM9KIAHYjYG05SkmNe4Sn9Xw4NUyFmdt46XaMpri79y6xF3wD/5GpT1lVCKXPsS6h5Id7Dk/EIdA+tHavPh+oON9ckNmLspXd7DrAul48duwlTI+C/Nb5G70FYeq+cp5kCjca28OjHqYrLRJYl5vhxAOf5FHcCC5YO6jDBJKDLC/bN2vc6x/AZe+3//3kVNcpanAiahp/Utd62xZ8rMll5Sl9xUm0dNANc6aa3jAfpGISrRKig7VcHHqSDZ1tiRgOBIogEvQmHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gW5jpsmy+uCr2wGbWzYLHqzNDt/sjic9Pu+7atWkgg=;
 b=cvNHOCvs/4LZgegiTXc6b4yfzaWB4HdTwQYsBXmrVD6j/yt78OT3xzY8pAiVCu3YBu6TWYCsJa7xVq1b7adqWy6EPnFnGvIYTTuT9Uyod25BQYAIlZVAAgwxRjI+r3mo3APCGGeFb7XsUZUkrgqxy/HjjYKa4cqegwO77XpaTsrr/yhy2h3aIptEgfB61+qGcq0Ix//kk8uvpnC/wIUPF4yLSJN74XeWcn33XSH8QvuPrSJWwTuIzsyudMqLeDYo2ZRyVgOr0xEF49g/ZeGKTGxhPWlrR/zlmHNq3T4862KHGZIgGEGoaX7j8HWOw+Dnpmhmjf7Hzv9w7XWW+to6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV5PR84MB4049.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:2fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 17:31:08 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 17:31:08 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v3 0/2] hwmon: (pmbus) Fix ina233 error handling and isl68137
 locking
Thread-Topic: [PATCH v3 0/2] hwmon: (pmbus) Fix ina233 error handling and
 isl68137 locking
Thread-Index: AQHct8YsPmEwbfq7PE6iQkHOk4Ting==
Date: Thu, 19 Mar 2026 17:31:08 +0000
Message-ID: <20260319173055.125271-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV5PR84MB4049:EE_
x-ms-office365-filtering-correlation-id: 20832baa-ccc5-4fb4-cfca-08de85dd4e87
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: H/M0aJKWZ3GYsMmEqpWpN/pHy6cP4cuOJ5P1UU2UxiDZazX/02T0cszDV6dup550JbJCsoTKrro9+uw9Ftjw+Yc2eSQ75JD+jtaxpITHT0Wx+B76m8K9/zIdl6ER5S91/Wiumt/nAddEUxjRXnOhysB59rYoZFkCYqeXEXyXg9XEsOiKaFViXRQzpEbPw+dCHUEZduH2uMhMPoW8o7xkzx00SB/HM2CCU1gjLjAvxwZneaa1qGAZsS7USWhBwEk3mS3LVUCn6lQJbGv6e0yyLmbfGq6j/iKWJMLgUSa+bpQ/5okpyXw69huXS3LolcugBakS6fcLjMiRXsQav6bu+Pe7K0gx9+ICF2P3AhhgnPbY3IN/fYmv5TlRbqTffu71Tb6CQUhSmsOkO4MAMfgniqTh/G/kJWcK08GQgDRzw5Sj7iGtZWfsRvSf7ToiRNo+04uZLzILvvEUC47GbfaS2htxXReU+ZsUngDatGpsX7FKs17a8Nx6myWoA6mAzPbDCsffB+VcNtGXRb/Nl8QqRPUqf8VLSVhDUmzcyBF1rsf9sKybnnqLvkvxCyzqZwmO+WPPtA2CVW4kVo8QCvKLMq293F3Y/I4L2zHQoAqyqfNnqteU12EGspoGFunKBc54d/TiQOTFFOKZPuy0Ka2YsWku66i8veYSqJMq725riqc71/Qi/I7UQEDFSUwdxDrESv4/bBTv211YpeVeXrrkPVZ+QRS/KiE8mL/DMNL+2WrnqGkJJgLdwv4Fm2a7L0zbulwjBfaQ56f+2imBUKN8t2LPpf55AKHvqmJcTTizloo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?z/f9CFFbl8s1wNb/LnbSTI7skl4h1XzfJ8CCCizPz9f64d+OEfk4FfG51n?=
 =?iso-8859-1?Q?YfahrdlKnnG9cM3xKY+t2LybxJBwSfywNA+pzKoSc/z26kkfJMUhKqdRIl?=
 =?iso-8859-1?Q?mW3/+sAns+59UQzC6O+dOOa+iflYDmnDtk0VdnuohyRCvOvjBpYjEvPh+y?=
 =?iso-8859-1?Q?WKg0vpZ1RUx6m8rObYoZB7Q2NBCCM8ar45X+jdIo6b/yw5htaDOUNig1OO?=
 =?iso-8859-1?Q?iRGMuX5tk0NW1804sOumfrLIkNGpXGRSd3uzuejzguab89xecu6gNyozmb?=
 =?iso-8859-1?Q?nXsYhwuRJg7UHmL2jNb8d/+TrnxneLFUS+ofbau3ECbYRCfq6nT1cVVLbi?=
 =?iso-8859-1?Q?AEeCDhiv7jlHsc873w4GOCp4LU8yLwNsuRfPwmMgqiNgHQ0iaZLuKpWeeE?=
 =?iso-8859-1?Q?iTK+gtUzIXwTn5xKTHKXb73qlzTYxdekAYNbm8AuuiZBxqyLTF4KLwfHND?=
 =?iso-8859-1?Q?44709NaJysuWsvKrd7FWYYBWShfjeH9OZBL5moJdvg5rlZqtnidWKS+lxh?=
 =?iso-8859-1?Q?qoihkJgrB6AF/2tKwxvlRHapY9egO80bVAl6Si9zv8RWsEwHihzenSRxKk?=
 =?iso-8859-1?Q?6d2O45JYPQDEkgAYHXEAMYGpFdx0lYnXvjDoT/zIOilVxNsHbw1lSY6q77?=
 =?iso-8859-1?Q?+SQJLuQb8PVRURef2vt/9rKP0WMWn4q1joPj5eqAxPPwBMpnLwo3yZxiWt?=
 =?iso-8859-1?Q?TqwKOvSY+8MrwrGjDyH3yD4J1Py6CTrBh57w93s9DjOWfYLNCA2WJkHTHb?=
 =?iso-8859-1?Q?TAH6tzz2bs1oplFjuedbN/t0AT6aXd7+nh2/xVWwDIoyC5LURUe5jTdhu8?=
 =?iso-8859-1?Q?lG6p7074h3rTYoDHt9c0QpQMdQ9hwzSb7kteFqUTCTICZTSeGwNQGPNz78?=
 =?iso-8859-1?Q?p4XZDs91zDgnJzAkPFN87AKSEGxyBsVL74D3rnvJ7ol6AemjK19iX4hCIm?=
 =?iso-8859-1?Q?jtUcDW7F35els8xfgIIl4xnlGzVmyYX2U2/C0pesu1hCWXlSJ5fQMfixnp?=
 =?iso-8859-1?Q?L4ZlPiQGJIu7F8y25teFfOXyr7R8ihTvKDmKlZcn+bDRvHR4Q59EXOqJ3M?=
 =?iso-8859-1?Q?bRBS49kN4LzsAkhP6G+ZKwuMZuwpm5I6rHkZt9wJ3H8dAJhrdiRcevOsdV?=
 =?iso-8859-1?Q?LFGBHhQ9YOpiWLO/IvbXd6OlsqXP06b9yOIv3Z5MP6dE9CEypnD68uE36r?=
 =?iso-8859-1?Q?JwdW7Wpyf/f9H+rx05rsWHonXCaQcpTyyoy3xuGPnPwtXI53rjbiOYBUv5?=
 =?iso-8859-1?Q?oyEIUL3ownGqOcFNYE8NhfGebLz0kEbE+w85vfJpPIkX7dX6d9dJTJUreH?=
 =?iso-8859-1?Q?Y7mKU3+QcpfWzxt9t4tE637zsXm1qDfqjbFOCMbwKz5pAzVuweOVq5WzUi?=
 =?iso-8859-1?Q?aeuq0d53hbM+D0v0OZZzv5fMcYdY9PZ/w5Tytz2U88M3SbhOjyqqgG5Aqr?=
 =?iso-8859-1?Q?fOHtVIjSAWwDx6tIjIgg+GNlLQxnxxTOmstTwCO2hRoKfAB3k93VmFuu9+?=
 =?iso-8859-1?Q?SCR6gebRjrpsJZGA2xffWXfHqFyQKtaOdXBYmNAwf2yejyun/P8Bv6Wef4?=
 =?iso-8859-1?Q?RktzPUiEgXpCEGRYSzMo6pdWy+KtyEPp0LXhIXVOM8jKGi6zmHoLO/ERxE?=
 =?iso-8859-1?Q?YyiDJmMoCHJ2/9KaRzuoZvN1NVqya514btYgRfi9SFRT5ugQmfVrxyTj3C?=
 =?iso-8859-1?Q?DYLAuTWRo7IVu4TUldhBbju2oNib92mGU3IKeOHMCxiuJL/R3VmDIL8rhD?=
 =?iso-8859-1?Q?ELFD8MuzS9nVfGDHeySt16n6WqbGxtEVsV+kJyg+0ouJNw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FipOSmitDju8MmW4GhgaassepJjf2UKDZLnICC5OSfp73uPiFNZsWxoZlUI0En+Kef76xXzpzjS/4jt5UxYpvdPQq5UEiuUUfByxtgtcZv2CooEwr+EGKEBNH90XolMPrXpkbBtndJlvk4R2LnNVHwQJD9VGqrhT+3jYrrDCqv26IhyydbgRSGZO+aWYK8muj+1Gq/3lEncDcEQg8FMQ8qPKdjIOG3toqVpol1+rizoQvuaRlv1gy+s53jJon3cU7bxTE67pcNijXmT43QOOnPJPcZtuht1ZmP3OYhM+I5vUobyqq5cpE0n9AJ8nfIfAN47zQeUWBjb0tbfNkU3ovA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20832baa-ccc5-4fb4-cfca-08de85dd4e87
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 17:31:08.4856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hj5nwowsq0dcQO6fKg3XNQCCQ4MMogKeArjzghJMmhi2zda1t04BSAl7CqTTlOMNK76AxEv84X/yV/rqXWdhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR84MB4049
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE0MCBTYWx0ZWRfX5Euwtb1KicSY
 QRpsjRHU+BggHGzuFwpGfP8a02XXcIgtHQO8Iu551kFHwTPAwVOMwSXKaweplB/GwEwhc5uX0Xi
 v3ns+Jq/GbPVngwBII6Ze9PqlxAxWm4UDzm8cOVtyB6uLgD8pK/hOhn+Mp9zy1kDagCunycsNfP
 PVvRS6JchsLLAOYo5y+g2kv/BEcqUJ5lZxTWmLJ6GwKEbRwo81CCbocS1drzAlTMz1Nn2HcwXEW
 yApXbAEQ16u2kMePldKaUuWWrJivnZbM2kmfptFYbLSfZQSb4XzzDtX6p3sLA0lCcJY4ewnPGZm
 MLYWSV4ZTDnxfxfKL8lXiHHFM1a5TqMB8bZ6SOfpc7l7ejttEMBJsZZN2q26WNSMqxyAVs3Yh6u
 +WuSBE+bn+EYt6/nBdeezXUYXdVskZMp+QvUsaTMvMdug+gR/dHq/Qr9Xjx/VMtZ29VmcCsTqft
 76w5iPkV4refib4zTKA==
X-Proofpoint-ORIG-GUID: yGw6JO1_fH6lFyy9roeitBaFEalWLAkK
X-Authority-Analysis: v=2.4 cv=f4VFxeyM c=1 sm=1 tr=0 ts=69bc32fb cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=OUXY8nFuAAAA:8 a=oOOmoVjyyLkRy_uQKcIA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: yGw6JO1_fH6lFyy9roeitBaFEalWLAkK
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190140

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series addresses review feedback from v2=0A=
=0A=
Patch 1 fixes ina233_read_word_data() which had two problems: the return=0A=
value of pmbus_read_word_data() was not checked for errors before use in=0A=
arithmetic, and MFR_READ_VSHUNT is a 16-bit two's complement value whose=0A=
negative values were treated as large positive numbers. The fix adds an=0A=
error check, a (s16) cast for sign extension, and clamp_val() to prevent=0A=
negative scaled results from being misinterpreted as errors by the pmbus=0A=
core.=0A=
=0A=
Patch 2 adds pmbus_lock_interruptible()/pmbus_unlock() around the custom=0A=
avs_enable sysfs show and store callbacks in isl68137, which were=0A=
accessing PMBus registers without holding the update_lock mutex. The=0A=
store path is especially vulnerable as it performs a multi-step=0A=
read-modify-write sequence.=0A=
=0A=
v3:=0A=
  - ina233: Added error check, (s16) cast, and clamp_val() per Guenter's=0A=
    review (v2 only had the cast, missing both the error check and clamp)=
=0A=
  - isl68137: New patch addressing Sashiko-reported locking issue=0A=
=0A=
v2:=0A=
  - ina233: Added (s16) cast for sign extension (no error check)=0A=
  - isl68137: Reverted Boolean logic to (val & MASK) =3D=3D MASK=0A=
=0A=
Sanman Pradhan (2):=0A=
  hwmon: (pmbus/ina233) Fix error handling and sign extension in shunt=0A=
    voltage read=0A=
  hwmon: (pmbus/isl68137) Add mutex protection for AVS enable sysfs=0A=
    attributes=0A=
=0A=
 drivers/hwmon/pmbus/ina233.c   |  5 ++++-=0A=
 drivers/hwmon/pmbus/isl68137.c | 21 ++++++++++++++++++---=0A=
 2 files changed, 22 insertions(+), 4 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=
