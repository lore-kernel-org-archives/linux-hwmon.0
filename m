Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B4322522;
	Mon,  1 Jun 2026 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339555; cv=fail; b=unG89ln/cjyPFWhO+Gthm7a5xXRqV0xo7MRHGuxY61LzkzPEz2GlUaeozXWHCoup2BU01CAsNGrJ2qy4vK/FH7TnJCuGqKM0dWZmdgNw2HIn/xu3K1Wuy1pN7QvgtAzEiUN9u/JkqRwzYLkGKhtG/9CmQ1f9FEYRnk7To30bkc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339555; c=relaxed/simple;
	bh=Reob4W/K0TnmSU7kkbUCvO9WdXenG1p4H9GT5fQWWjM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ci9A7JuRCtg7sk9wDiLzQm1SQCZwnU/82CS/M+oI2Txg+6upTHW2dn6F/fnx1j3eyyzG7SclY1AQRSCdEEwiuqXyIR5a/INHQ/2rJWnF1setiDjjt3AHY2X7milNpnwtruoRuGb1eYyDC8c8W4/BZR8jVbIRnT/rlu3xFeN/ycs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=R6x7iXdR; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="R6x7iXdR"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FqkZ73742067;
	Mon, 1 Jun 2026 18:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=thPhiSKRiqVQKMrS74OHjGJ5
	30tnqMn8hxQvUzxW7R0=; b=R6x7iXdRPH0M/8+H6gFjDYOccH7HR6B+GJ72jVhv
	H0qyI/RpkobMUC/7qjZLxhbsaWJDdeYmvulBkH7IsmMaCw1Ef5cFubich8CPXdau
	tmimCGoyJALL2x8TYQyX0rPL4YDv/3PB9+++uZo/6LCKHe7OpWUVc+TWh8Jo8ixX
	kkl4wlDj7bSuIzKwxzC2+GdP3rU2Rmx3wdV38mzNqcpxlnwnOvke+86d4JKHMz0o
	5+TqLt+uSK+rkt5U5t5XX/WdT5YS8bGSHoi7xTjDrqFBT10rIMuwqFVDYKFjyGGa
	SzLixWp6loaKZ8qLhbEB3yLfMng63adfdHKaVGkGQuWQ7w==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ehd42t586-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 18:45:29 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 5E0268003A9;
	Mon,  1 Jun 2026 18:45:28 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Jun 2026 06:45:28 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Jun 2026 06:45:28 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Jun
 2026 06:45:27 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4l9IsGwciExOGCIL1Pe66G/tbJ0yZL7ufugV6tGPMJK3+mssQC4/yWtgL2myAAeY0/q8v3iAuxw3SzPXVGM29zjUbAwyPTSmhnTAjQT624BOjF7NEGHsrs10OREU2L9UudWhWdV2ZdT8+4ps3hrw7OcHZjZSLWLx4STfGT7ikF4JaAGNrCJQoXm0HiHid9rvRbADJWtt0FakObeKWmvXRWSzqzbj5iMZOPw1eUzWEyRClM36gRTiTixukG8gA446KqTyOPad/LVMyD5T4T8B1oc17gVn2pb7DzH86p3K4LSQeSVtOKSiZ4+zyVquDCKhUOpNCG3bcq1D37TJZpA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thPhiSKRiqVQKMrS74OHjGJ530tnqMn8hxQvUzxW7R0=;
 b=Tb9T1iDJavyzvhVm3sHQ8JiQHdeg8VAU2zzyj+mL+sLuZQCgA3/xBK7mL1yEmDyRWZtVXkY8z9nNeAirfEs6hJHWa7hpYyCMpmpCG4gx1JbSZK9ryHnmLJpPOZGjeslH/y4WTZCKIQJeV06AGWaeVjyYWBuTlt1dIZvOSx7U4uwLM7+RpFZ4jTW9g/OjVHDl5jZTaFFyugF3CmRZzU/mXzxi3dMbDeqB9Y8B4naK+kiHXbW7KIE7uir24RByLroc4TxMt60YDLnTJxrQN7caM08Gi629ZUK3idVqeSgvedjXrhYqrsU4x4HOLJStuKvZYzhGhSHRS8W3hav/xp+xQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB2095.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 18:45:25 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:45:25 +0000
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
        "noname.nuno@gmail.com" <noname.nuno@gmail.com>,
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v4 0/2] hwmon: (pmbus/max20860a) Add driver for Analog Devices
 MAX20860A
Thread-Topic: [PATCH v4 0/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc8fbPCr/wl/967EiO72f9pbdCBw==
Date: Mon, 1 Jun 2026 18:45:25 +0000
Message-ID: <20260601184516.919488-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB2095:EE_
x-ms-office365-filtering-correlation-id: 075cf22c-6dd7-48f2-05d9-08dec00df1ce
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099006|38070700021|3023799007|18002099003;
x-microsoft-antispam-message-info: xLPw8cJNb/1qY6fn4mpl+OuxVm6uq0WFLZfPUvTwh3JdG78/Utyvl4YJkrTbAtYuGuzVPmodNqJhbvw7SUQHfkvKnljtgKFeUXCso6028IebTahIecwun4V2mHJw16j+sRuBTlvkgy035qVdpRzZJT+ntoT8CyhbRlT31c1IbUo/eJKgee3UI4X/kl8dvmNTNnArLAohWy6TaERF4TPdGxm6fdUtXzaP4LtaGu3bugLshDjop5OwyaZE9pzPNcobd5f7uwpfvWTGXqPRfzF+34hXeVCdccPJoBw1J+2DmHySmOf8VLyC5HnY+q446wVhvJ6jSuFybMu9O1b+1+y43CoEOnK97HlJ4z1G/z6rYv4A83xyXTuF69GGKzEOuPVi8+pR1DugNsintgKUX8nGOQM76w6k55YftvaEsbjIcB9BmN5Zp+uHqmUWN9GRUFUSSLdhJY76mz03qxrskRommVY3snhic3DaCP3KB8x/oHFAKEKNvI5c4/PkH5VQ9fB3JZvFl+Cj1uNNSpaaK1G8MJXUnsBg/F5jmvqJ5DEFTFTHicDEjlb/TXxG9Gq2hRuMwsfwrp4W08qVliYYPAd8JiefHuvbsime+ekvdpbXrTK1EJjXPJXBI/kimjR/BjS/eBLJW179YMupOrUZRxkdxw5eVEjmPIKfPTED7fNX7Rsgc+jY+kP02JLiVEB5Orixr8ipxC60S6HFq+4QuNtH+OLh74RddprzC+d4uaiUfHvQxyvZ1/n2UlvJ++yNgAG5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099006)(38070700021)(3023799007)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Uuc7prVMiJWtM63xcXxeginfd3Eb2yLM5srFPjgbCEol92ML+zDnlb+6MY?=
 =?iso-8859-1?Q?ISbtHexsS3m1U/DeHmd8c7JUsJjA+GmeUeCrNg8tyqUgHPZwu5lKAKVc6c?=
 =?iso-8859-1?Q?HREhyeTmJ3L+hZn2F9vuRMuylTtBWLE4aAbtN/lFRDLYEHzV7LAp3jSQY1?=
 =?iso-8859-1?Q?bUOoSb4StZMAQbXA6PubJcDZQlCsKTXDhrZ4dhmwdFsZADghmeX8pnmVxv?=
 =?iso-8859-1?Q?UBvBESCu+eaSj3qpT5hJX4reVIHZHWx+EkyxU8cJOCI7D5vhOSr2E2hl9P?=
 =?iso-8859-1?Q?piyPUZjJw4wTuX/jW2snb5FqLviOgl8/sunFwQ62nInV+YIpGE5/anhTSq?=
 =?iso-8859-1?Q?JnWLSW9aYUeJ5bRoj2L+fd9Qp5rr4bv3jVM9Ox0apMFgTphHrRXkvYqb9+?=
 =?iso-8859-1?Q?Bcc+cxiJQI6bmeK3Kyfbt2uvcxDGV9rkyBKqOPxfs0TUlJrWraFs5HlIYg?=
 =?iso-8859-1?Q?sni44sJ/J/X494nUJ3iZdzi+bl32aOiHr05irOoXH0VkgKnV3XnVpZzZZA?=
 =?iso-8859-1?Q?Bb0uK6kJ86+ws4ZiCrxyB6rm0o1e9F0QREExxrORlgK6qejMZP25TSRgWm?=
 =?iso-8859-1?Q?xrBEZlEDBvRDEEhBlan5EySxhy+6O9UzARjHQ1n8gM+6wrhTthzXL66PVF?=
 =?iso-8859-1?Q?uL20sHYmx/Rs8qUF4+oiL+wbcOLLmnOS3xSNuTFn5s56ZmxezISbJiBcJK?=
 =?iso-8859-1?Q?d86I/JNbJ7DK7rCYFHx2AtK+lDsSYwQp/dsJiCSaFwRh4qskh8e6mrTM1h?=
 =?iso-8859-1?Q?KjM+R+wFL+yKuvDOnXxHZhB4/R0uQ9gcF2sBZ5iDi16hYolG+biKZsGwPC?=
 =?iso-8859-1?Q?Uj/3Jt8QNM7HXBmi5rsxGdevUJZlhxxWXSTd36O65iNzLOwcXtH6c5RcY9?=
 =?iso-8859-1?Q?5PeuTen7uwTIBC+vEEssXrXS5/tV+i7rWQlVhk/DlekQfW5MINpGtUtEtl?=
 =?iso-8859-1?Q?LOnYKLYQUhIctyk79pqBVuruEMAhuUhs/8tv4wEgraR7T6ykEzDAkjdGQn?=
 =?iso-8859-1?Q?fbui91j2axFtL6+liH3RygAxdBBH9s2r21n0oNMFN3l6Nz33Hk01zknxxP?=
 =?iso-8859-1?Q?1vuyVwyVNDyhiljFGsWQHEDovTnzAinHLUdPYQDxAlfltuwYPJ8Bcdyn6y?=
 =?iso-8859-1?Q?Yha9YxEgPKowXWJ66o/dNxMcugJmGcuigjFbBGvyNFg5p7Hoco0/46K0Gg?=
 =?iso-8859-1?Q?Lr0j67UdS6FoClFzsyrCK66wU7pMTFaNg2joROA8FSxwhwblriLKJgU5+s?=
 =?iso-8859-1?Q?GZlJ8Fro5vrIWJNHMgQ0MBx04Sf02O3k3yAYOGZtI41gPMBANE+KQx5bdP?=
 =?iso-8859-1?Q?TwoQ6LXZG74BD5CT0fryHXnKXsE+nQA1yAR/53RCkSWDYzbRnidAw6GdMe?=
 =?iso-8859-1?Q?Dcaehi1gW4ApV8ZEn60DQN8osDtUMgfv1dsn11m4dl8jp4IODF3U7NFsvj?=
 =?iso-8859-1?Q?B7tNPga1dFWsMoPg3Hvi9Bzj6HXGJi775BM8l/Vvdw7OWbyJw8DN3XsO58?=
 =?iso-8859-1?Q?U8HTlZcxnC205/HIcfKaPpWJfKh+4bCnXUQmuRGb7KI1wZcKs1E/92+7yh?=
 =?iso-8859-1?Q?zAqnpPFBchkHwkGoMuCkbtAhP4R75mBSW3XoNkIKFZx9k0QBLtxU5/M06N?=
 =?iso-8859-1?Q?VkZvwtbRfEksbLcdWhhbF9JPfnLPtWO9gCWsbUzpxTfc8/a9IywxIZKVX6?=
 =?iso-8859-1?Q?tgN7MY6ctNZ5c6h8A2pBMRRQKDX3zdw8WjEwpw3+tAya/WS5TcZSQt+V0i?=
 =?iso-8859-1?Q?nnZEvQYKG4wyYULHPujP0PE+7jJZTGNNfJBAg08vv7EUMdmVOrrYxtMeDd?=
 =?iso-8859-1?Q?SXGh52Cj5w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HBUIWOxoxcMFAOSGAmBJM6q0vvzHE5s8jArR44LUAiQojjk/tS0dZj7/ffJ/WgyALf3KTD8s7QeaaXiNJNof/qkbydqZS2J7oVy6FQqmb+nHMmiLlHkqYQYPYE4rDHki4PfY5YmGN9Sy6zRW3eRrE502+cbza2sbO7upw4zcrUp730d70k0cMaRzhfz5gldt6vGB9O/RP1AR4lY6jjcnlLBV56/RpcP+A5iQ/B0w9FKPVxt677bC38nUr/f0QR8HkYEh8HjtV8wHmTfZRW+mjoyYiXo/Ak6xwyK+AT/uXzBTKJVh9iRskqjxBnWmi5Jlh9jcu37lRU9YuAbl2dyCzw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 075cf22c-6dd7-48f2-05d9-08dec00df1ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 18:45:25.6656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXVU5GlJbDwPjFWeRkWoDjM5YIz1q3j9QYZWvZIKlYx/gRSUum+45sh0FHjY56v2C78mlepZGWxC4Mlw07x+5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB2095
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: P9h-wapnMF6Qgo8TMhFgWczOOf4iCO07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4NCBTYWx0ZWRfXwTuoN9P2me54
 NsH2MXdiNqOnmSH6PUWuOp2MrC9LHdWQB4IwMOevd4kEKoUM55MmVMErUNfAdKNs5lPzEqTwWOa
 MZnDRPZ625xVrmDcIKC064uhmtoIelo/LqujNHojMEGB+e+0jBbO6wfBnwcjx5/4kXhMxoyKUkH
 Qbt4v5D1poYvkteWojWGzUI2gfcLzsRCBjgPqTxlDicTrNQ1OMOijh6SWvmfnEqrCZLC/hMb6L7
 B7gi4Gf8bBWhDe8z5HpptQdPS5Uys4Qvc6YU0tnAavLUi6T2ypw+vlvxibjkpjbZ7dQXkdUdJKn
 UtzrD+Dxepds4xQJnUe1KP2x8+K3C0T1hTIQKgFQbykfHMF42gtiZbT8BMVr4c9TDp8vcr2L8cp
 U2x6A544IGxjHWpAKPLo4vRJ20kOZMl9V1GIS8wu02BpTCnQw8JMKOq/qzMwTe+YjFBdW8spvp/
 BYs/mBvDOtz0XvSp5nA==
X-Proofpoint-GUID: P9h-wapnMF6Qgo8TMhFgWczOOf4iCO07
X-Authority-Analysis: v=2.4 cv=JK8LdcKb c=1 sm=1 tr=0 ts=6a1dd349 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22
 a=OUXY8nFuAAAA:8 a=0bwX27tMA4ljDho7v6AA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010184

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add PMBus hwmon driver and DT binding for the Analog Devices MAX20860A=0A=
step-down DC-DC switching regulator. The driver provides monitoring of=0A=
input/output voltage, output current, and temperature using linear data=0A=
format. Optional regulator support is available via Kconfig.=0A=
=0A=
The driver does not modify device write-protection state during probe and=
=0A=
relies on the PMBus core to handle write-protect detection and sysfs=0A=
attribute permissions.=0A=
=0A=
Tested on PTX platform with MAX20860A at i2c-195/0x23:=0A=
  - All sensors (vin, vout, iout, temp1, temp2) read correctly=0A=
  - Limit attributes correctly read-only (HW write-protect honored)=0A=
  - Clean dmesg (no probe errors)=0A=
=0A=
Changes since v3:=0A=
  - Driver: Added optional regulator support via=0A=
    CONFIG_SENSORS_MAX20860A_REGULATOR=0A=
=0A=
Changes since v2:=0A=
  - DT binding: Drop "maxim,max20860a" and keep only "adi,max20860a"=0A=
  - Driver: Drop matching "maxim,max20860a" OF match entry=0A=
=0A=
Changes since v1:=0A=
  - DT binding: Added allOf regulator.yaml reference and unevaluatedPropert=
ies=0A=
  - Driver: Removed WRITE_PROTECT write from probe=0A=
=0A=
Sanman Pradhan (1):=0A=
  dt-bindings: hwmon: pmbus: Add Analog Devices MAX20860A=0A=
=0A=
Syed Arif (1):=0A=
  hwmon: (pmbus/max20860a) Add driver for Analog Devices MAX20860A=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 45 ++++++++++++=0A=
 Documentation/hwmon/index.rst                 |  1 +=0A=
 Documentation/hwmon/max20860a.rst             | 57 ++++++++++++++++=0A=
 MAINTAINERS                                   |  8 +++=0A=
 drivers/hwmon/pmbus/Kconfig                   | 19 ++++++=0A=
 drivers/hwmon/pmbus/Makefile                  |  1 +=0A=
 drivers/hwmon/pmbus/max20860a.c               | 68 +++++++++++++++++++=0A=
 7 files changed, 199 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20=
860a.yaml=0A=
 create mode 100644 Documentation/hwmon/max20860a.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/max20860a.c=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
