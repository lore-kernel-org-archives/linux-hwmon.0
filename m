Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F537AA6B;
	Tue, 17 Mar 2026 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769074; cv=fail; b=bnoZ1E5NIbrNR9bpnqCxM5iaUrxzLV23AiQLm6Q5UD9iuhb5buxHwVPoeTo7SnhkLQgsxpCHOV1vjDj370bMR5edWHlXSGOrqJ12hFj7+Ighm876cVstRy7Tds7gIYZQdi+cgtj0G81ELJ635D+DOJFIOjmIixBs3UN3ALPFuIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769074; c=relaxed/simple;
	bh=jv4hMgPFVhmdcZuW4xmHzswOms/Mv/MaEFwgCb5RVpw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dgB9HBjyeNsnJn4PmLOcW8gwuUFQ1C5P/sePu9sMoMd7h3RDbbBdqkrjqMzYMJT+NVxwSZKiaqZ8z+pfxdNRj51zxM658LN/EARwzGE7otAm0dlooeQYxJ0Y/WRqMpzMDc9OkoHONlrFKIZf6YtszyYSwAybHZAxIL1H842tsDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=o/wKpA0M; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="o/wKpA0M"
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HGxR252574190;
	Tue, 17 Mar 2026 17:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=vANkISu1Qhqp2rq8sRZRwLlp
	GZlt/LDCbgFFURTTRKU=; b=o/wKpA0M4TTgZNjyihPWy6KZA7V/ZpP912UBvjWm
	aqYweM7QusimZABwPnqYZnOeSrSaKqH97hYkhrWVmlcUOLbBruPaQle/bzUxrg4s
	gqu5THljYu6XFPcjk1z29R0NXGSC0NUMCvPj4ZcwBDbQuRQl44DISzan2CVEBbvd
	gPFrmA5RTtsfiBTQddnrw+2RbjAJ4qckToNMoWBe3S6zDQXQxU2wqiCiQ53pOZcz
	E4y9UY/ci1DSMqPt+v+iWEYN7To5AgJiVhUJPNKmUq8PpTdFi9cM0rq9HsfjHujJ
	9E4oOkAX4WuBh+PlSz+2WwOriIyHrceveHbjPDY4rjqeZw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4cy89m31p9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 17:37:22 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id DCF79D1D6;
	Tue, 17 Mar 2026 17:37:21 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 17 Mar 2026 05:36:36 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 17 Mar 2026 05:36:36 -1200
Received: from BN1PR07CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 05:36:36 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdsenGKhnDLTgCJn018rvJ07WRSfGjRmFUeTYOuDmHgGiGEyHmDbmimBQdxqVtzzqgWnYMsnbH0B0Si3u4xNnR5fnrCLKHypLkaXKtHFsxF4uC74dqTmukIcjnl42gKrbyaMyFJ7/GlOvVYtlpKEPHdlKSrq6nCJIiR6PIj38g50T1VeOPTnmoOnt+SZqM9zyH5YKeObLpLY14L/LLxQK2LmvuyyYPy8XmBSzFXzpNefh2jOOpjQFRnL/oLTe3cQ5eeePElrJc2uN6ix3RhXgVZJC3KTYC+ZAYWgb6MEVO3yNCRGSr5Y+dL2X3FDNf3K4UOEkAa2IQxVbZU2aVBkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vANkISu1Qhqp2rq8sRZRwLlpGZlt/LDCbgFFURTTRKU=;
 b=A3gnoD3Frws6QxsuEdrlkuq0LE2zjwz/KWCS5mh0G2+55ab08fM8fSeNwsBgHgJbJ3OLvnh9NJHvuaUEb6NrSBKZjNysnHDw348W5P5/r+iSrQo1mgUe1Eu6RrHZ8pGaY0CXZ8JbaegCkOClrYcjkYHjivzx5+5D3zwWvqGXeYQTfTeGmU8vFVEKw0OUq5Xz40RbURMqq8nIFiMJtamLhI2FZC9dyU+O4iOhOUP5SHbrEA7QqPqJ4HnyNm+zq7ipxUzEIMSOwZcY3E9MFZN/3+cDtG6F9LUe3rLYXOhFFrEht8dG/RugFKF4K5AK6itxpSjKMRh4fup7KVLufYXU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SJ0PR84MB1579.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:431::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 17:36:34 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 17:36:33 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "vasileios.amoiridis@cern.ch"
	<vasileios.amoiridis@cern.ch>,
        "leo.yang.sy0@gmail.com"
	<leo.yang.sy0@gmail.com>,
        "wensheng@yeah.net" <wensheng@yeah.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 0/5] hwmon: (pmbus) Fix unchecked error returns in multiple
 drivers
Thread-Topic: [PATCH 0/5] hwmon: (pmbus) Fix unchecked error returns in
 multiple drivers
Thread-Index: AQHctjSZgBIsWA3LU0mOoHnaVipkPQ==
Date: Tue, 17 Mar 2026 17:36:33 +0000
Message-ID: <20260317173308.382545-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SJ0PR84MB1579:EE_
x-ms-office365-filtering-correlation-id: 390cc5b2-d124-465a-6e36-08de844bbb94
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: fSvnRMXoNLGHA7Yc9K621w995rshIg4hrIXrbJIagSj+Kbgkf/SgDNP7vP9j2nRe1iUrHyTZ+qO0JFPTp6Voirju0xq5M9/uEI5b0Sc7Z/5ByA+Z/3taHAq/gkONioaqlwj0a6pOQHv59Rvw8ufpftex1Ru3nDh5KwkpOHy7n0ayvkZGQj4xtUj7M4l8USPoj0+KhHXWYitRGxoxjzeBnpF2fJlCaWM8A6oAm7oWcPOlmTWYs3t5AcEkjZXMIxfkzfT2OIRNt2l4ENHDpmfpgV5M3RrOmk7cZHUn6cfCUE0ROa+x6DK0FS81E1aGfe1/4bqUktld+7//4mkdML8F7moAIa1gycOSJowAJ/l0ZjlUfV5mVbyjkZJAVzosksu19rs372rKzQY4dcl8yezHMsWVhzCyrBTnIT3WXYwDSBpAfWN2fuFnNk1kqIf79AQ7HjFQbvC9ol7FEbR4yDtzIBPzT2/eMCLjBID2iChdo5zasWzaSrAMhNBg6Z5OCVR/94ymuEBI0I4gMbJF0Qwnj4I7gummRyDC56ImKHzydmiGqyNmNHcep9FovYWsFR95Z7wyVb3YzHdSE0LiFj88YaW78lBXr2KJenut3ffgfwg/XJFRIgjKHhbVo7mAhWMP5g14Tx+xokOqcv+u3kTt5YqCilepxGlxCQcw9ek/jOSWyc59anLPkJl/MWbwoSgrdZCdQbj/lzBXfYY3hZe3Pt7t3s0EQjScNdnGWJOlvS27y0Fx7dTbmvWIKxdOHjPW+JDJiiaWiZ+reZYOYAvI13siutC0gJKSaIx0/y+LBmU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4J6K481k9WAWWZLRZoFHQcRa3FYXQMRPdgqM2vGRyievlyIJBg9/RHMC3F?=
 =?iso-8859-1?Q?Dls1NO6LNPX4Z4I/17vn2E+LHx2keyvl0QGyfucO+xJ/ity/q1Cqf7RlcD?=
 =?iso-8859-1?Q?mzJX5LhN05z1alBiqSz+X6IaQUMnTWgzOZC7Hztl9ZUAEnQyVoTl7wWRfp?=
 =?iso-8859-1?Q?4sh9AjPN0E77u9Lgws37D9H/3cvGaOxNtf74kUy2SjTN4Krrx3PlqgsHrN?=
 =?iso-8859-1?Q?YTLKaqdUa2PXj0gGVT9s8vRsMzWV/+c+hHK6WzIMTx/PcTnzTOh+c6vByW?=
 =?iso-8859-1?Q?OnP/rZiPfYhIuHjShUcKLRzRWGcRNRyIEpJkvwX+sIgGrLW5ZOfG/KMLTO?=
 =?iso-8859-1?Q?y8yGqQKCWf1w8wMyPOlYIlIiRsCYFTJ3nMQXYhMg89EawZfsZ3TFzOSiJq?=
 =?iso-8859-1?Q?Wbtipx3Q9hgDYgyMfBkj16gd+99V7p2vbJY9n0ey+i/zqBBBnkpmoxEmyz?=
 =?iso-8859-1?Q?21paSp4WLZuvOWKQ6ETj6aeGGmmbzHhj0I1eqPut74r90/8XbrxxCyGvXi?=
 =?iso-8859-1?Q?O6bq8XwQ6hbow5uGExTH+se7D/8I0zVnpqr7QFHvwhX6LWVpNk940/SWjH?=
 =?iso-8859-1?Q?Kq5PHPvQjm1nicBOdxsk1JgCTyr/sO95iDltB1QU6csnltSNvIlw6zRV27?=
 =?iso-8859-1?Q?nBJDHTDk9CS2HNotnkWQhnnVSx8ysHg/VCvvqfnYJw7NBcNfQrxSG6Tm36?=
 =?iso-8859-1?Q?FBJLlwu/v2A+hd+dPjcoOFiZuwZmbG1wPNYQr9wGlyzlxM69tuWT+eBAjp?=
 =?iso-8859-1?Q?I9X+bC3NosmIfpFAq9GuKN04T1UEKXL6gMFPRM1OE6weJJRGFrjvcdAUAo?=
 =?iso-8859-1?Q?7R+ppVLsUt+Kx9A7mN4aenOW6owmS5i+QHYk9oXncH3Kr6nDYX+28j9I7t?=
 =?iso-8859-1?Q?ob1oZCYs1sELxaXk7sSQ9kL/nUFytr7CSsE0JXDa0xKQkAyCHOKD2Z9h1V?=
 =?iso-8859-1?Q?1Juyz+AFPpbUaGGckWH1mkIsTjIfXNJxRCaFRo1rch3pm64//VphCVeCqN?=
 =?iso-8859-1?Q?V43Gk8kM2KXYJ95oTx5O3AHKbRFY/HCReAx8OP7E3TeYM3zEKpzMjVD+kr?=
 =?iso-8859-1?Q?luyi4mJz/ZP4z3sDt1sewwABjacit+76Wss9GjaGbSHOWBKlYfCpWug1Lp?=
 =?iso-8859-1?Q?9InvL7UuVWL535xFm/6ZwK8hZri6NIJS9o1q+qWxXcQovHrygAHcs/PTYC?=
 =?iso-8859-1?Q?rm5f4tH9fX3po1MaLvznGnhMpQamGP21AYm3mlYEEM6dYj21ezMBrkRM3t?=
 =?iso-8859-1?Q?RlqNo3Tx8a9eDxL0HZKdGkhKC1lBxZHbCxo7sC/OmKOwoiW8KJQGlFhleA?=
 =?iso-8859-1?Q?5jq1EeDOJpBCKNaoqIoVvb9z8zXQNkp61rEAryvQQrhi0BpkxmzuA+5QmH?=
 =?iso-8859-1?Q?Fk2O1SSOhQTg6xQOjmad1o7dFBwiE1RkYminAc05BLyBsV6X5TYNohOSdz?=
 =?iso-8859-1?Q?6rT5GcpVwWcwA6zYM//EU3XTf3zDOifxexVu4BPUO2yT0to0xqNEL29zqb?=
 =?iso-8859-1?Q?HXranLXiea2dscA/TB5Ha7umbBlEyhHA6NFVLCCjP8UXYUI95u1g8nsgAJ?=
 =?iso-8859-1?Q?ZrASx47FLAFSKQjvjjzTtJqeX4oRDVAEs5Jiy5e3ufCAwDDfF+fwgfsGDB?=
 =?iso-8859-1?Q?dWE43DYA7x0v/mlyI6/3ZY9By+u93ID7yF1EBaog1Wkj4xqBSXisVFIjCk?=
 =?iso-8859-1?Q?3ZMD9J0hpKJlIEBEYnRIFcsTqlK2vqinUPfANgBgkCgRj0NwabWq0dm8BD?=
 =?iso-8859-1?Q?gmtpKpfh2NxuTk/hGQRtbHi9Npyjaww3Kqwcz7gUEf51raeeG4mLEvqhaK?=
 =?iso-8859-1?Q?XGE8zmLguw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RTHTA54WByQ+qKzF893hBmzMHHVwI9sa1ZtpSHT1pfciSR9q7KTwEsxzYLvlHDzxBJs1YTmPtbVVCOFrltnM0+OTVh2gEkkxtVgGrcuoufWxf9SOzaLXJmUXfv6W3VL+UgmfmvLhxYnnB+9N8G5owbkrnfHkgZ6daIrEYJNzWxzjdYLv1jipQPPZ9m9VbbmjCTUiQfE6skLoltSKn6lkxFWHfkbIEwcTXKioPYYwujGbBlcqDNCgiWTVyaz3FtwVeqn5Zu3yk9YTbYoEZJLC41MDLr6JVperDVCTxnX/tLQoxdjTg+afB0hRbO8yTzDLKIPaAObs7jbSqQS98iyk7Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 390cc5b2-d124-465a-6e36-08de844bbb94
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 17:36:33.7552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0NxFcy1UYAcH60MiDWRxrKnDtE7Gy0fmcgzpOgfX1deScQAlqnkG954m7UfBx7XhNKMZejndfEUU/Q01/m2bjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1579
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: atpv9FAhDqmz9mzroR7lT2mFKB_SDK29
X-Proofpoint-ORIG-GUID: atpv9FAhDqmz9mzroR7lT2mFKB_SDK29
X-Authority-Analysis: v=2.4 cv=HKTO14tv c=1 sm=1 tr=0 ts=69b99152 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6XKncaru_qjgLvANlS_8:22
 a=OUXY8nFuAAAA:8 a=835OhJalTrDGFiTNZngA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1NSBTYWx0ZWRfX/pw/w/mhA6oV
 3KqRSqOq+7nOu/tJCQK1XK7LI0p1CjeAYCErIzdzpPHBYxkoQoWlFV/uGwxhQulaGpt35Uo6lA2
 sTVYwLLCjGjgtmpAd9KCDvUQ6Xn6MAxbzw9Twv2CGoUwPx+fxAkIM29nepYD6WFVsec9ryn6Wqu
 RV9h8GnqgG8FpONgo/2Y0x04kQL/lE8O+FRjbf+F5c9tNWvKFXPNRhFur7cZ/X97/a24Yu9fyUY
 TdXxRxy+orENTA5Kkz3tfYazKDWjYEpT5tfG1uq2jYGHhb06hDhvmYe1OfoftQOGYMfVWrQg5JE
 XVeT/wiseu+23Qw45QOuwWclv0we0mYNSeO5j7MSEeDqwVprUO6TpFfGwoJelxJcQHCQ/F21u+E
 9qxqcb4Fz7hbmGyxTFOmB9E4bJRY3oEmi9MOmyw2oRH+TA2HCQsDGDaLBAzsq7u/pZgpejGDwNR
 5UpZpgm4FPbXlOkpOIg==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170155

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Several PMBus device drivers use the return value of pmbus_read_word_data()=
=0A=
or pmbus_read_byte_data() in arithmetic, bitwise, or macro operations=0A=
without first checking for a negative error code. If the underlying I2C=0A=
transaction fails, the negative errno propagates into FIELD_GET(),=0A=
FIELD_PREP(), XOR, or DIV_ROUND_CLOSEST operations, silently producing=0A=
corrupted sensor or status data instead of reporting the error.=0A=
=0A=
Sanman Pradhan (5):=0A=
  hwmon: (pmbus/hac300s) Add error check for pmbus_read_word_data()=0A=
    return value=0A=
  hwmon: (pmbus/mp2975) Add error check for pmbus_read_word_data()=0A=
    return value=0A=
  hwmon: (pmbus/mp2869) Check pmbus_read_byte_data() before using its=0A=
    return value=0A=
  hwmon: (pmbus/ina233) Add error check for pmbus_read_word_data()=0A=
    return value=0A=
  hwmon: (pmbus/isl68137) Fix unchecked return value and use=0A=
    sysfs_emit()=0A=
=0A=
 drivers/hwmon/pmbus/hac300s.c  |  2 ++=0A=
 drivers/hwmon/pmbus/ina233.c   |  2 ++=0A=
 drivers/hwmon/pmbus/isl68137.c |  7 +++++--=0A=
 drivers/hwmon/pmbus/mp2869.c   | 35 ++++++++++++++++++++--------------=0A=
 drivers/hwmon/pmbus/mp2975.c   |  2 ++=0A=
 5 files changed, 32 insertions(+), 16 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
