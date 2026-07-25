Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F84379C5A;
	Sat, 25 Jul 2026 21:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785014451; cv=fail; b=JpVBWmIx8RbJDoXrQv2ewefFqOAFupbkFYPnLDBp4/oDRmXSqQYR/AA9iQlsF9OY5llAJJALLtGoolSWwighJuHJwhUzbXHA1TkavE/cYiYuh2UNNQviBuJMEJi9mKeL/sK6QMlbKsOWKpyJ0XhnA2JDwKqaELxSSJTvZgpbTf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785014451; c=relaxed/simple;
	bh=KGUDsOV2e9PyIkd3bN2NCr6TZY2DULUWjLuyKge+ync=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iCDuKsmR8liYFlTsR7XjWPBhmbFKsSqBqdLyVE6ZuFHJBWGdGhW7mWF2uXl6eynpdV6j7oIx8nCygAGV8oUxit9oXIkbNDFoLe3tDFH7k67RWwEayEfczmE0WVAflYc2PnGxHcgKdV2v08Fb54zNR7S4EeQxNBj81ksGxgq+UDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=f9uQhJXN; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="f9uQhJXN"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PLA4Zg731635;
	Sat, 25 Jul 2026 21:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=9a
	Yxjv6xCqOUIVNP5P8xEoafJGEMdp1VmMc15jOBKzI=; b=f9uQhJXNqkhjo6Kot0
	Tg61JuUhtqRfOPyIAMMCSP78ae0nQkhO6ROguIut8pgHUoAdCPZVZ2C4Qwsd6BDA
	fF4y2VmNe4Ml2pmh7Y1zGSso2dg6uvNRmm7ZaXusrXX54MZBD+LKIKprp9lbW/s9
	7OwkbCfiY9r21XNoftgfDTgcW8h5M+qJyfAlX2R3zVUxfh0Wrt7LTiwvekSynSdV
	8yFWsjkGobN+aP2EqcbHcVKK9lOrlP+DfUhO2jH/ujXsg3okaDk2ToEzr1Wn2lq7
	8SlgzbIxRBDY4Ff0bqesBzZQnrSmx/s/yIceItIBM1NRCTFm2lslDm4/JHIv4lea
	lZ3A==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fn4tr026q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 25 Jul 2026 21:20:19 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id A43DE147A9;
	Sat, 25 Jul 2026 21:20:18 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 25 Jul 2026 09:20:17 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sat, 25 Jul 2026 09:20:17 -1200
Received: from CY3PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Sat, 25 Jul
 2026 21:20:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGKsxSra4ICTVpqq6E/v1VnAyaTpcYMho+W5twBlo4/T9W35qerDzpD3J+K82aYkgyWm2+Vrkf2uO+F3TdMBv/iCCRFNFj7d6YT4aGb6g/lKgFdvESh/LDHqS/CmFPFrufoqZ3wHlV3ejrBncCYaLsfLc1yNxeNXuLR7m+xqfHqwAv21uAI/aQmuCtWao3zJmjKWO6h8sqWi20kecY4+H4V4HBl4SD5TjV6tpJ12Jw96//RwQYte54FfDJehWgkUDpXI7Tn8eRCqvR3BOEVCDSTb7AkRDkeTyGg6gSqWCraCWj9RThyNt7yDv9wt9Kl1o8m4dryaIPyrP5FCo/ILSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aYxjv6xCqOUIVNP5P8xEoafJGEMdp1VmMc15jOBKzI=;
 b=VHH7ftbbExicpn5m4OOKd03ssqooGmc3HTAGgbvI3B7uKOSVdxKXhfK9Frr/5ouJOKwfzI0LVxfDD9XaXFr611guEy3spRkBkuuUC5haxy3Ngub/CTXjGFLQNzSE9ZajwzwAesEHAROG2THc86Lv1Id0nTYYKwgKi79dzrf7Wj4imKYHzCySUyBUNdD+TaLNBHqaEx13e49NdFw83kWimj1omSTxUE98Uxqbtg0XRaQ7aLek3fH3zIxph+XFH+5AI8XCAefvhsReszMqVImpQcXrHRu+G723nJ0Q2xEwe0XSU+BDJ4v9hHNkMfdygv570W7sFHYMtj0emq22Jm/Onw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW5PR84MB1498.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Sat, 25 Jul
 2026 21:20:14 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 21:20:14 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>,
        Debjit Ghosh <dghosh@juniper.net>,
        "Jawahar Balaji
 Thirumalaisamy" <jawaharb@juniper.net>,
        Santhanakrishnan Balraj
	<sbalraj@juniper.net>,
        Brian Mak <makb@juniper.net>, Georgi Vlaev
	<gvlaev@juniper.net>,
        Dhruva Devineni <ddevineni@juniper.net>,
        Avadhut Naik
	<avadhutn@juniper.net>
Subject: [PATCH v4 2/2] hwmon: (pmbus/vt7505) Add driver for Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v4 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdHHtiKhztLRzhQkio04lToOiXfQ==
Date: Sat, 25 Jul 2026 21:20:14 +0000
Message-ID: <20260725211945.288415-3-sanman.pradhan@hpe.com>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260725211945.288415-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW5PR84MB1498:EE_
x-ms-office365-filtering-correlation-id: 9e8fa9fb-261b-49b5-e224-08deea9284a9
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|3023799007|38070700021|10067099003|56012099006|6133799003;
x-microsoft-antispam-message-info: /awjBZ3EgQ2R6yiaNjbziGB0Vx1/2lsGngKqE9BW9Ez6Lz9HUMQ7I05SirOftnxcaxQ5OvCMq8w+OBjQxKGIEpvN12z6VXU3njfs6A6xxDB/2sbm6Xcl5us2F+y6oskn6wCGJWzybKcsr7Oat5/YjghohXIomOH8/j8hvwFsXRAS7cnNR3C3nM3OktS1alSMP9qSQWdhbAEg/Wb6KuD5Bb27NiSPDfOvOp0QF6LcJbKxaHfW6I0/zTmfy4y4iYbrxm1NywbVN69nYNg5vWAxzFfSFs/LDh0QGPmny5D4jlQQojO4RSw/4QDXo8vfsYZjEkERvsQEYnI8K/PbV0tb6cMygkghBnpXJP7OaUz101XJlM+ST/RNN55Ykse6sszMEgAk+TWfez+AsgRm3jD3kz95vQ/vBZx9dGFA+G94B4OD6NpL+R8yBmAEByjXenq84FQ09ARZeIWE3OW4B3y2prlzoxj0YmY4gPJ/aTphbW5Ip9j8DWEAzP23qsPRBYqwEIzbizX7Fpiz7UINKsLObRaFXQNx8C1Ref0ZRU4K0G2Zojx0sAOdsXF4YyyHLCnkW5tvRcCiZb8xNbID8Hrsst8CGJKLN5eS2VbHcn1jkRhb8qWGHI3lPWkqwjdrzdVihx1tnBeJV/xzvhaWpksj4d2Tsdi6B7RBJFLB/3WIELD7TrmF3veny3v71LFPd8hjNigVaUWmLtYYFc7dttL/xUjMUwv0kL0VuxdOAhj/l2A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(3023799007)(38070700021)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+CkEhXdxrh9hWsMdMuyRtoo44UFCNT/lqs7wmpH+kc16YvQ+BnAmkedxkV?=
 =?iso-8859-1?Q?sL3yOP/N2PmtUaRYB6qgBJlK20UdJwzNrJsIO4G1fbpdSmkpWn7ZgUzJmK?=
 =?iso-8859-1?Q?7MMQZn4Jgr5bKmwDoEWwSbJtPPWZy3gZNYgOJIg+l+/p28zzBcs9+KmJes?=
 =?iso-8859-1?Q?1zjevJ76V4vYWfg1V4qWiyX31SDlN2r/q5D5hrgpx9fG3H2T1WQW2kLmFN?=
 =?iso-8859-1?Q?KbvO17JuS/QOyY1xJ/aV+8ZEHQePBq1p2LhDhgL1FoJ7ugd6fV6kxN0q9Q?=
 =?iso-8859-1?Q?Kq0WDerC+dacVxu+hseFbNnL5JhiPmmwjtDtFi3jNA8Q/xOKFsvd6tNVxG?=
 =?iso-8859-1?Q?C7/nA5eonIL7s++dy43kKUD7AtRWzywEZRETRc7IpgDfu9W9tjQ3Mwy3Lb?=
 =?iso-8859-1?Q?GyxDds43vgMiwfe7dEsANmVJtsOXYBlCRb0//esBeiZWcfZLJW1qK+bNUN?=
 =?iso-8859-1?Q?SjIijP8MqkQZ/wMZnZ6wHAPtJ9yBSy1ooxrS+bn2c33CFJP9KbzGvVXKmr?=
 =?iso-8859-1?Q?FJzfCbI9H75w2272vdp1+LInXBIp7gRLvnqK+GQff+RI3zfrHFw28DoCOD?=
 =?iso-8859-1?Q?7Bw5XukzCc8MYziIuaA4V/X7p/pbxxZEcb1XyGwiWoe8J6f7urEC7/AKA2?=
 =?iso-8859-1?Q?qzmE1y9J3l0OhPPDtsmWH3c5lPC6H+qABjDpD2KxrPbG4qYIXnffHqKzKA?=
 =?iso-8859-1?Q?QORXIGKG4JGXILQGQ+OG8IyHOo5GvXH+6ViPLmbTcK2a20eYVtDHCqxYaS?=
 =?iso-8859-1?Q?9qR89ZiTc4VbOM51DPL8pmwyfsMoKFLsjDilV1oPkrf2ca/W40eWE7wgQ4?=
 =?iso-8859-1?Q?VBkDFyHExfFxaEw1Lran54/IZqsqkbjBxVm4QPJRsBgxgSH9WljhNcEXvL?=
 =?iso-8859-1?Q?FWqsAvym1+Uo7XehUjE+LDDmvy5Mv8OyjNMo3eG8pLyb/N4gAn2Xvv+0lG?=
 =?iso-8859-1?Q?skNSv22BVP+5S+tbqQ7ieONwBHvOEYVqYqAhp0A2l+kRRDA5vn0Wp9cduj?=
 =?iso-8859-1?Q?M+L5EPLgOiph/HOp88322SeoRNU6D1yjJJBLVRNnaCzSITW1uQ8qu/wmTH?=
 =?iso-8859-1?Q?ZeDbbLKCHaH79VFEmmRWl/wfdwvbenHWAbzyxNAf6gwKEYDSnpiyynOa8f?=
 =?iso-8859-1?Q?UZexUKjlzmHDN/HYEsC6xH3jCBLJlnci6Yb35oZ/slMhZRbBzu2+IPmF72?=
 =?iso-8859-1?Q?y1KRn6H+IvvaxRfcz+q0AYytmS9iMT29LRyodpiENy47MIEXK4o+4lZF5y?=
 =?iso-8859-1?Q?btlstgqsl/3RTythURjR+dSIakcW5n7IRqxBExkzpVPB00jI3xOeYznNwQ?=
 =?iso-8859-1?Q?28qgzeXpWUPpaFmOJaXd9vfS2S606QOjP4x+Ut91oo/ZlkjyszSK5MDwXF?=
 =?iso-8859-1?Q?jWrRmlxLq9CqTr9fDnOB71kTdbGi6IN4IP0GKB9kqqqTISIvCecN8NpzVx?=
 =?iso-8859-1?Q?ZlrTifyxdgiQOaedyeRXmwY76EwfzrKVnmvA2/0LvhT/AKB3YjixOM6gB6?=
 =?iso-8859-1?Q?gklZuVGMH9S9HhsGG6rjEBUD0jt7znkCBpyPSFULLlxjN8l01/CNe/pVnl?=
 =?iso-8859-1?Q?bXOq2Kuu3nLGH8170gJqDy3OIUcav5NUqrOsVSaBtDCm/lHudLDCH3II3q?=
 =?iso-8859-1?Q?N1txFh1Dh7X49fYmZGQi+XiAqP3OMO2mFrf8AAgSbgGgvmEk0HzuUP1wWi?=
 =?iso-8859-1?Q?cHwBo+VV6caAVo6wPqMQnU6HiHKZ3dAvY2Ga2IbofgwB8Di4pLyib0plFD?=
 =?iso-8859-1?Q?guTHtgYsK9HkIXfNjJ+oHh4YPWXCYAvRhGSQBG7TxUUQGv1N7Y4xPWyGpN?=
 =?iso-8859-1?Q?wxMvSmcKdw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hVLiKLl/d0X6wS80QgoGB+G/3RCpcUEdfUepf9stFGRFO4oRCugiPgAssF3Sdd+9lfAyrKhu4pgh3x5Cjfw0bWtmAURkIujgPhKikavOI5UMfiiouMbN1sznn7g9hhvzEpDS26U8m8t38ZB1QqP5eVdPebGhIFGHqN2PyYUR2JHHByFAO+KUoaiSmDekOcC2bjDxYnl89RH1zh99VUQ1b+ZWJQowi+ZSbB/2/0NslbrjHjjRKTzccTslu/QL3GAOUpsRCtaBCPPfACKNMWU26wN7mQKG2SmNZ06Q+gMaOfyCM6XoLBJ+3ukB2lP7K1wYiZJQ4KedFubhs3ZeZfFMZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8fa9fb-261b-49b5-e224-08deea9284a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2026 21:20:14.4956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ZYWR71DmOr4R1iLPadEk2OjvpnU1QidYUrFDp0awayaNltL+oZVw/PJ78dJ/aHrAxNnQtE9fNd/YYH5ejwRoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1498
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDIwMiBTYWx0ZWRfX9khupd9w88Xa
 UWgXb0zhG6FChWbAdCtwoqePsGg/LdXRXsHfpYg4TWqCn88ahVLizO/BtqiawEkYoEXFZaicGEE
 jVD5YKPQ3jzJcNEknl+h6L9jp2KfjqkdUZtRvfZ56BhL6T5oxStXfmb4EQHbGybuBDXKN+YjXkQ
 hYWFaW8/8Zd8QGA89N6IWQKNw7vTqBF5ad3gbqJcSHUXEwkYZu4NybKtGtEa37IQgcxZj0P4Zw/
 9wAqmd7f4YiAO5LLdL7zNJYSRRx9paASqOOBjZSjCBIpE75WrBHoGCWXLNNlREH2dtBkf4mZB22
 R26GVPFi85OJmmgEl9exQ4AAWBBwGNuPYa7O+8tNjQv3F2rTpkt3dtw7/D+EeDfTblaUZ+t5bAW
 KyIHEFj/Kt4M6PNCcAbMW7U5g921hAkVOpzdG4PC2sCq88RtwBPJht4u25ifJoYAVA2lDoWwgAj
 I260JlBUdfFRpbOIAHQ==
X-Proofpoint-GUID: En39Kf2h9UfL70zYx1NMKsXfxTpodQpp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDIwMiBTYWx0ZWRfX4NLAIURKf69l
 RE/fhpAOhfP4TbGsbSPykLhDMZ1uHEMjIJhyKb32Nijxm1lZiRAC1j/ApvxnHRO6JE0m4QcKa5S
 OTZYx3lLMQdhfsXrJTy4TwPJCjgqvvc=
X-Authority-Analysis: v=2.4 cv=ctCrVV4i c=1 sm=1 tr=0 ts=6a652894 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8 a=EprCN7UrAAAA:8
 a=iZzoODi1DZXc1RShzHEA:9 a=wPNLvfGTeEIA:10 a=cAcMbU7R10T-QSRYIcO_:22
 a=HCbi7XInCiJmNhJA85EG:22
X-Proofpoint-ORIG-GUID: nBZNenawyk0NdSmWlSK11FuBL73zRURh
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607250202

From: Georgi Vlaev <gvlaev@juniper.net>=0A=
=0A=
Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the=0A=
Volterra VT7505 controllers. The driver reports input/output voltage,=0A=
input/output current, input power and temperature over PMBus. All values=0A=
use the direct data format. Peak input voltage, output voltage, output=0A=
current, input power and temperature readings are exposed and can be=0A=
reset.=0A=
=0A=
The reported current and power depend on the external current-report=0A=
resistor connected to the ILOAD pin, which can be provided through the=0A=
"adi,rload-ohms" device tree property.=0A=
=0A=
On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally=0A=
be configured with the "adi,ocp-severe-filter-us" device tree property.=0A=
When omitted, the existing hardware setting is left unchanged.=0A=
=0A=
Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>=0A=
Co-developed-by: Debjit Ghosh <dghosh@juniper.net>=0A=
Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>=0A=
Co-developed-by: Avadhut Naik <avadhutn@juniper.net>=0A=
Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>=0A=
Co-developed-by: Brian Mak <makb@juniper.net>=0A=
Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
Changes in v4:=0A=
- Reject an out-of-range adi,rload-ohms in probe so the current and power=
=0A=
  coefficients cannot overflow s32.=0A=
- Credit the co-developers with Co-developed-by only (drop their=0A=
  Signed-off-by) and order them before the primary author.=0A=
=0A=
Changes in v3:=0A=
- Use per-device match data instead of an enum (no zero-valued match=0A=
  data); derive the temperature coefficients and severe-OCP filter=0A=
  support from it.=0A=
- Add an explicit adi,max16545 match entry and drop the compatible-string=
=0A=
  check in probe.=0A=
- Use designated initializers for the I2C device ID table.=0A=
- Replace the SPDX-FileCopyrightText tag with a plain copyright line.=0A=
=0A=
Changes in v2:=0A=
- Map the microsecond adi,ocp-severe-filter-us value to the=0A=
  MFR_CONFIG[15:14] register field.=0A=
=0A=
 Documentation/hwmon/index.rst  |   1 +=0A=
 Documentation/hwmon/vt7505.rst |  89 ++++++++++=0A=
 MAINTAINERS                    |   8 +=0A=
 drivers/hwmon/pmbus/Kconfig    |   9 ++=0A=
 drivers/hwmon/pmbus/Makefile   |   1 +=0A=
 drivers/hwmon/pmbus/vt7505.c   | 287 +++++++++++++++++++++++++++++++++=0A=
 6 files changed, 395 insertions(+)=0A=
 create mode 100644 Documentation/hwmon/vt7505.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/vt7505.c=0A=
=0A=
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst=
=0A=
index 956f3da0b7223..62687bb994ac1 100644=0A=
--- a/Documentation/hwmon/index.rst=0A=
+++ b/Documentation/hwmon/index.rst=0A=
@@ -281,6 +281,7 @@ Hardware Monitoring Kernel Drivers=0A=
    vexpress=0A=
    via686a=0A=
    vt1211=0A=
+   vt7505=0A=
    w83627ehf=0A=
    w83627hf=0A=
    w83773g=0A=
diff --git a/Documentation/hwmon/vt7505.rst b/Documentation/hwmon/vt7505.rs=
t=0A=
new file mode 100644=0A=
index 0000000000000..e56dc0055e89f=0A=
--- /dev/null=0A=
+++ b/Documentation/hwmon/vt7505.rst=0A=
@@ -0,0 +1,89 @@=0A=
+.. SPDX-License-Identifier: GPL-2.0=0A=
+=0A=
+Kernel driver vt7505=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+=0A=
+Supported chips:=0A=
+=0A=
+  * Analog Devices MAX16545=0A=
+=0A=
+    Prefix: 'max16545'=0A=
+=0A=
+    Datasheet: https://www.analog.com/media/en/technical-documentation/dat=
a-sheets/max16545b-max16545c.pdf=0A=
+=0A=
+  * Analog Devices MAX16550=0A=
+=0A=
+    Prefix: 'max16550'=0A=
+=0A=
+    Datasheet: https://www.analog.com/media/en/technical-documentation/dat=
a-sheets/max16550.pdf=0A=
+=0A=
+  * Volterra VT7505=0A=
+=0A=
+    Prefix: 'vt7505'=0A=
+=0A=
+    Datasheet: Not publicly available; register-compatible with the MAX165=
45.=0A=
+=0A=
+Author: Georgi Vlaev <gvlaev@juniper.net>=0A=
+=0A=
+Description=0A=
+-----------=0A=
+=0A=
+This driver supports hardware monitoring for the Analog Devices MAX16545 a=
nd=0A=
+MAX16550, and the Volterra VT7505 PMBus controllers.=0A=
+=0A=
+The devices report input and output voltage, input and output current,=0A=
+input power, and temperature. All values use the PMBus direct data format.=
=0A=
+Peak (maximum) values for input voltage, output voltage, output current,=
=0A=
+input power and temperature are exposed and can be reset. Writing to any=
=0A=
+``*_reset_history`` attribute clears all of the device's peak values.=0A=
+=0A=
+The reported current and power values depend on the resistance of the=0A=
+external current-report resistor connected between the ILOAD pin and=0A=
+ground. This resistance can be provided via the ``adi,rload-ohms``=0A=
+device tree property; a default of 4750 ohms is used when it is absent.=0A=
+=0A=
+Sysfs entries=0A=
+-------------=0A=
+=0A=
+The limit and alarm attributes are created by the PMBus core for the limit=
=0A=
+registers that the device implements. See=0A=
+Documentation/hwmon/sysfs-interface.rst for the meaning of each attribute.=
=0A=
+=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
+in1_label               "vin"=0A=
+in1_input               Measured input voltage.=0A=
+in1_min                 Input undervoltage warning limit.=0A=
+in1_min_alarm           Input undervoltage warning alarm.=0A=
+in1_lcrit               Input undervoltage fault limit.=0A=
+in1_lcrit_alarm         Input undervoltage fault alarm.=0A=
+in1_highest             Historical maximum input voltage.=0A=
+in1_reset_history       Write to reset all peak values.=0A=
+in2_label               "vout1"=0A=
+in2_input               Measured output voltage.=0A=
+in2_min                 Output undervoltage warning limit.=0A=
+in2_min_alarm           Output undervoltage warning alarm.=0A=
+in2_highest             Historical maximum output voltage.=0A=
+in2_reset_history       Write to reset all peak values.=0A=
+curr1_label             "iin"=0A=
+curr1_input             Measured input current.=0A=
+curr1_alarm             Input current alarm.=0A=
+curr2_label             "iout1"=0A=
+curr2_input             Measured output current.=0A=
+curr2_max               Output overcurrent warning limit.=0A=
+curr2_max_alarm         Output overcurrent warning alarm.=0A=
+curr2_highest           Historical maximum output current.=0A=
+curr2_reset_history     Write to reset all peak values.=0A=
+power1_label            "pin"=0A=
+power1_input            Measured input power.=0A=
+power1_max              Input overpower warning limit.=0A=
+power1_alarm            Input overpower warning alarm.=0A=
+power1_input_highest    Historical maximum input power.=0A=
+power1_reset_history    Write to reset all peak values.=0A=
+temp1_input             Measured temperature.=0A=
+temp1_max               Overtemperature warning limit.=0A=
+temp1_max_alarm         Overtemperature warning alarm.=0A=
+temp1_crit              Overtemperature fault limit.=0A=
+temp1_crit_alarm        Overtemperature fault alarm.=0A=
+temp1_highest           Historical maximum temperature.=0A=
+temp1_reset_history     Write to reset all peak values.=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index d88c0dd4c8142..b914aafb8514c 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -28958,6 +28958,14 @@ S:	Maintained=0A=
 F:	Documentation/hwmon/vt1211.rst=0A=
 F:	drivers/hwmon/vt1211.c=0A=
 =0A=
+VT7505 HARDWARE MONITOR DRIVER=0A=
+M:	Sanman Pradhan <psanman@juniper.net>=0A=
+L:	linux-hwmon@vger.kernel.org=0A=
+S:	Maintained=0A=
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
+F:	Documentation/hwmon/vt7505.rst=0A=
+F:	drivers/hwmon/pmbus/vt7505.c=0A=
+=0A=
 VT8231 HARDWARE MONITOR DRIVER=0A=
 M:	Roger Lucas <vt8231@hiddenengine.co.uk>=0A=
 L:	linux-hwmon@vger.kernel.org=0A=
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig=0A=
index ca312be58ed5c..6c97a6dc88a59 100644=0A=
--- a/drivers/hwmon/pmbus/Kconfig=0A=
+++ b/drivers/hwmon/pmbus/Kconfig=0A=
@@ -795,6 +795,15 @@ config SENSORS_UCD9200=0A=
 	  This driver can also be built as a module. If so, the module will=0A=
 	  be called ucd9200.=0A=
 =0A=
+config SENSORS_VT7505=0A=
+	tristate "Analog Devices MAX16545, MAX16550 and Volterra VT7505"=0A=
+	help=0A=
+	  If you say yes here you get hardware monitoring support for Analog=0A=
+	  Devices MAX16545, MAX16550 and Volterra VT7505 PMBus controllers.=0A=
+=0A=
+	  This driver can also be built as a module. If so, the module will=0A=
+	  be called vt7505.=0A=
+=0A=
 config SENSORS_XDP710=0A=
 	tristate "Infineon XDP710 family"=0A=
 	help=0A=
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile=0A=
index 080d366809f32..daa4b49bc90fd 100644=0A=
--- a/drivers/hwmon/pmbus/Makefile=0A=
+++ b/drivers/hwmon/pmbus/Makefile=0A=
@@ -75,6 +75,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+=3D tps53679.o=0A=
 obj-$(CONFIG_SENSORS_TPS546D24)	+=3D tps546d24.o=0A=
 obj-$(CONFIG_SENSORS_UCD9000)	+=3D ucd9000.o=0A=
 obj-$(CONFIG_SENSORS_UCD9200)	+=3D ucd9200.o=0A=
+obj-$(CONFIG_SENSORS_VT7505)	+=3D vt7505.o=0A=
 obj-$(CONFIG_SENSORS_XDP710)	+=3D xdp710.o=0A=
 obj-$(CONFIG_SENSORS_XDP720)	+=3D xdp720.o=0A=
 obj-$(CONFIG_SENSORS_XDPE122)	+=3D xdpe12284.o=0A=
diff --git a/drivers/hwmon/pmbus/vt7505.c b/drivers/hwmon/pmbus/vt7505.c=0A=
new file mode 100644=0A=
index 0000000000000..6a66f06eddb86=0A=
--- /dev/null=0A=
+++ b/drivers/hwmon/pmbus/vt7505.c=0A=
@@ -0,0 +1,287 @@=0A=
+// SPDX-License-Identifier: GPL-2.0-or-later=0A=
+/*=0A=
+ * Hardware monitoring driver for Analog Devices MAX16545/MAX16550 and=0A=
+ * Volterra VT7505 PMBus controllers.=0A=
+ *=0A=
+ * Copyright 2026 Hewlett Packard Enterprise Development LP=0A=
+ */=0A=
+=0A=
+#include <linux/bitfield.h>=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/of.h>=0A=
+#include <linux/pmbus.h>=0A=
+=0A=
+#include "pmbus.h"=0A=
+=0A=
+#define VT7505_MFR_CONFIG		0xd0=0A=
+#define VT7505_CFG_OCP_S_FILT_MASK	GENMASK(15, 14)=0A=
+=0A=
+#define VT7505_MFR_PEAK_VIN		0xd1=0A=
+#define VT7505_MFR_PEAK_IOUT		0xd2=0A=
+#define VT7505_MFR_PEAK_PIN		0xd3=0A=
+#define VT7505_MFR_PEAK_TEMP		0xd4=0A=
+#define VT7505_MFR_CLEAR_PEAKS		0xd5=0A=
+#define VT7505_MFR_PEAK_VOUT		0xfd=0A=
+=0A=
+#define VT7505_RLOAD_DEFAULT		4750=0A=
+/* Largest RLOAD for which coeff * rload / 1000 still fits in s32. */=0A=
+#define VT7505_RLOAD_MAX		283383959U=0A=
+=0A=
+struct vt7505_chip_data {=0A=
+	int temp_m;=0A=
+	int temp_b;=0A=
+	bool has_ocp_filter;=0A=
+};=0A=
+=0A=
+static const struct vt7505_chip_data max16545_data =3D {=0A=
+	.temp_m =3D 205,=0A=
+	.temp_b =3D 6545,=0A=
+};=0A=
+=0A=
+static const struct vt7505_chip_data max16550_data =3D {=0A=
+	.temp_m =3D 199,=0A=
+	.temp_b =3D 7046,=0A=
+	.has_ocp_filter =3D true,=0A=
+};=0A=
+=0A=
+static const struct vt7505_chip_data vt7505_data =3D {=0A=
+	.temp_m =3D 205,=0A=
+	.temp_b =3D 6545,=0A=
+	.has_ocp_filter =3D true,=0A=
+};=0A=
+=0A=
+static int vt7505_read_word_data(struct i2c_client *client, int page,=0A=
+				 int phase, int reg)=0A=
+{=0A=
+	switch (reg) {=0A=
+	case PMBUS_VIRT_READ_VIN_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_VIN);=0A=
+	case PMBUS_VIRT_READ_IOUT_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_IOUT);=0A=
+	case PMBUS_VIRT_READ_PIN_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_PIN);=0A=
+	case PMBUS_VIRT_READ_TEMP_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_TEMP);=0A=
+	case PMBUS_VIRT_READ_VOUT_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_VOUT);=0A=
+	case PMBUS_VIRT_RESET_VIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_IOUT_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_PIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:=0A=
+		return 0;=0A=
+	default:=0A=
+		return -ENODATA;=0A=
+	}=0A=
+}=0A=
+=0A=
+static int vt7505_write_word_data(struct i2c_client *client, int page,=0A=
+				  int reg, u16 word)=0A=
+{=0A=
+	switch (reg) {=0A=
+	/*=0A=
+	 * A single reset command clears all peak values. CLEAR_PEAKS is a=0A=
+	 * send-byte command; the device NAKs a word or byte-data write to it.=0A=
+	 */=0A=
+	case PMBUS_VIRT_RESET_VIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_IOUT_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_PIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:=0A=
+		return pmbus_write_byte(client, page,=0A=
+					VT7505_MFR_CLEAR_PEAKS);=0A=
+	default:=0A=
+		return -ENODATA;=0A=
+	}=0A=
+}=0A=
+=0A=
+/*=0A=
+ * None of these controllers implement the standard PMBus WRITE_PROTECT=0A=
+ * (0x10) register, so tell the core not to access it.=0A=
+ */=0A=
+static struct pmbus_platform_data vt7505_pdata =3D {=0A=
+	.flags =3D PMBUS_NO_WRITE_PROTECT,=0A=
+};=0A=
+=0A=
+static int vt7505_set_ocp_filter(struct i2c_client *client)=0A=
+{=0A=
+	u32 ocp_us;=0A=
+	u8 field;=0A=
+	int ret;=0A=
+	u16 word;=0A=
+=0A=
+	if (of_property_read_u32(client->dev.of_node, "adi,ocp-severe-filter-us",=
=0A=
+				 &ocp_us))=0A=
+		return 0;=0A=
+=0A=
+	switch (ocp_us) {=0A=
+	case 0:=0A=
+		field =3D 0;=0A=
+		break;=0A=
+	case 1:=0A=
+		field =3D 1;=0A=
+		break;=0A=
+	case 2:=0A=
+		field =3D 2;=0A=
+		break;=0A=
+	case 10:=0A=
+		field =3D 3;=0A=
+		break;=0A=
+	default:=0A=
+		return dev_err_probe(&client->dev, -EINVAL,=0A=
+				     "invalid adi,ocp-severe-filter-us value %u\n",=0A=
+				     ocp_us);=0A=
+	}=0A=
+=0A=
+	ret =3D i2c_smbus_read_word_data(client, VT7505_MFR_CONFIG);=0A=
+	if (ret < 0)=0A=
+		return dev_err_probe(&client->dev, ret,=0A=
+				     "failed to read MFR_CONFIG\n");=0A=
+=0A=
+	word =3D ret & ~VT7505_CFG_OCP_S_FILT_MASK;=0A=
+	word |=3D FIELD_PREP(VT7505_CFG_OCP_S_FILT_MASK, field);=0A=
+=0A=
+	ret =3D i2c_smbus_write_word_data(client, VT7505_MFR_CONFIG, word);=0A=
+	if (ret < 0)=0A=
+		return dev_err_probe(&client->dev, ret,=0A=
+				     "failed to write MFR_CONFIG\n");=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static void vt7505_set_m(int *m, u32 rload)=0A=
+{=0A=
+	u64 val =3D (u64)*m * rload;=0A=
+=0A=
+	/* rload is range-checked in probe, so the result fits in int. */=0A=
+	*m =3D DIV_ROUND_CLOSEST_ULL(val, 1000);=0A=
+}=0A=
+=0A=
+static int vt7505_probe(struct i2c_client *client)=0A=
+{=0A=
+	struct device *dev =3D &client->dev;=0A=
+	const struct vt7505_chip_data *chip;=0A=
+	struct pmbus_driver_info *info;=0A=
+	u32 rload;=0A=
+	int ret;=0A=
+=0A=
+	chip =3D i2c_get_match_data(client);=0A=
+	if (!chip)=0A=
+		return -ENODEV;=0A=
+=0A=
+	info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);=0A=
+	if (!info)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	dev->platform_data =3D &vt7505_pdata;=0A=
+=0A=
+	/*=0A=
+	 * The m coefficient used in the direct-format current and power=0A=
+	 * calculations depends on RLOAD, the external current-report resistor=0A=
+	 * connected between the ILOAD pin and ground. Use the default value if=
=0A=
+	 * none is specified.=0A=
+	 */=0A=
+	if (of_property_read_u32(dev->of_node, "adi,rload-ohms", &rload))=0A=
+		rload =3D VT7505_RLOAD_DEFAULT;=0A=
+=0A=
+	if (!rload || rload > VT7505_RLOAD_MAX)=0A=
+		return dev_err_probe(dev, -EINVAL,=0A=
+				     "adi,rload-ohms must be 1-%u\n",=0A=
+				     VT7505_RLOAD_MAX);=0A=
+=0A=
+	info->pages =3D 1;=0A=
+	info->read_word_data =3D vt7505_read_word_data;=0A=
+	info->write_word_data =3D vt7505_write_word_data;=0A=
+=0A=
+	info->format[PSC_VOLTAGE_IN] =3D direct;=0A=
+	info->format[PSC_VOLTAGE_OUT] =3D direct;=0A=
+	info->format[PSC_CURRENT_IN] =3D direct;=0A=
+	info->format[PSC_CURRENT_OUT] =3D direct;=0A=
+	info->format[PSC_POWER] =3D direct;=0A=
+	info->format[PSC_TEMPERATURE] =3D direct;=0A=
+=0A=
+	/*=0A=
+	 * Direct data format coefficients from the device datasheet ("PMBus=0A=
+	 * Equation Parameters"). The current and power m coefficients scale=0A=
+	 * with RLOAD; vt7505_set_m() applies the 1/1000 factor below, giving=0A=
+	 * m =3D 3.824 * RLOAD for current and 0.895 * RLOAD for power. The=0A=
+	 * temperature coefficients are chip specific (see the chip data).=0A=
+	 */=0A=
+	info->m[PSC_VOLTAGE_IN] =3D 7578;=0A=
+	info->R[PSC_VOLTAGE_IN] =3D -2;=0A=
+	info->m[PSC_VOLTAGE_OUT] =3D 7578;=0A=
+	info->R[PSC_VOLTAGE_OUT] =3D -2;=0A=
+	info->m[PSC_CURRENT_IN] =3D 3824;=0A=
+	info->b[PSC_CURRENT_IN] =3D -4300;=0A=
+	info->R[PSC_CURRENT_IN] =3D -3;=0A=
+	info->m[PSC_CURRENT_OUT] =3D 3824;=0A=
+	info->b[PSC_CURRENT_OUT] =3D -4300;=0A=
+	info->R[PSC_CURRENT_OUT] =3D -3;=0A=
+	info->m[PSC_POWER] =3D 895;=0A=
+	info->b[PSC_POWER] =3D -9100;=0A=
+	info->R[PSC_POWER] =3D -2;=0A=
+=0A=
+	vt7505_set_m(&info->m[PSC_CURRENT_IN], rload);=0A=
+	vt7505_set_m(&info->m[PSC_CURRENT_OUT], rload);=0A=
+	vt7505_set_m(&info->m[PSC_POWER], rload);=0A=
+=0A=
+	info->m[PSC_TEMPERATURE] =3D chip->temp_m;=0A=
+	info->b[PSC_TEMPERATURE] =3D chip->temp_b;=0A=
+	info->R[PSC_TEMPERATURE] =3D -2;=0A=
+=0A=
+	info->func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |=0A=
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |=0A=
+			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |=0A=
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |=0A=
+			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN;=0A=
+=0A=
+	/*=0A=
+	 * The severe OCP deglitch filter is programmable on the MAX16550 and=0A=
+	 * the VT7505, but fixed on the MAX16545.=0A=
+	 */=0A=
+	if (chip->has_ocp_filter) {=0A=
+		ret =3D vt7505_set_ocp_filter(client);=0A=
+		if (ret)=0A=
+			return ret;=0A=
+	}=0A=
+=0A=
+	return pmbus_do_probe(client, info);=0A=
+}=0A=
+=0A=
+static const struct i2c_device_id vt7505_id[] =3D {=0A=
+	{ .name =3D "max16545", .driver_data =3D (kernel_ulong_t)&max16545_data }=
,=0A=
+	{ .name =3D "max16550", .driver_data =3D (kernel_ulong_t)&max16550_data }=
,=0A=
+	{ .name =3D "vt7505", .driver_data =3D (kernel_ulong_t)&vt7505_data },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(i2c, vt7505_id);=0A=
+=0A=
+static const struct of_device_id vt7505_of_match[] =3D {=0A=
+	{ .compatible =3D "adi,max16545", .data =3D &max16545_data },=0A=
+	{ .compatible =3D "adi,max16550", .data =3D &max16550_data },=0A=
+	{ .compatible =3D "adi,vt7505", .data =3D &vt7505_data },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, vt7505_of_match);=0A=
+=0A=
+static struct i2c_driver vt7505_driver =3D {=0A=
+	.driver =3D {=0A=
+		.name =3D "vt7505",=0A=
+		.of_match_table =3D vt7505_of_match,=0A=
+	},=0A=
+	.probe =3D vt7505_probe,=0A=
+	.id_table =3D vt7505_id,=0A=
+};=0A=
+module_i2c_driver(vt7505_driver);=0A=
+=0A=
+MODULE_AUTHOR("Georgi Vlaev <gvlaev@juniper.net>");=0A=
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX16545/MAX16550 and =
Volterra VT7505");=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_IMPORT_NS("PMBUS");=0A=
-- =0A=
2.34.1=0A=
=0A=
