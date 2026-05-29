Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687D82D0C7B;
	Fri, 29 May 2026 00:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780013984; cv=fail; b=Ik8GhAzHkvzDfG5D+9ZX+jyZbVG2q8BZMRbQcBHXtAt3PcrzuV35S/uhDMYiQHM1RAtsbZv8kLlbAkUUVQVGeSflwCeRFfyV3Q3du56Hwg5kJyEbjRcDFmE0ePLHepUmfDflc6ySRiFs/Zw+fGq8UjJcvib+Pz6vVfoyKR/mLJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780013984; c=relaxed/simple;
	bh=ZeaK1wzRTyff1Yb158W9YiwwT2STzh2jfckfDsk0nqE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rRwHhC01B8rarSKHJxY6ugxy7oSX1NjLhH9Ldgi5jlQviQUJhsTgj813SMQ0RiL3jOtB+n1Izyr9tFraGfNagZwkcbo60kjmPeh2kVaG2/hHAhlgNpsXsOAGflDVcpgWRo5dHE1yfMTlwgmotdeRT9UE8yQZ4w2iU50x+atK0Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=cnMW47N8; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="cnMW47N8"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0AJch169747;
	Fri, 29 May 2026 00:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=w9
	auK8N1gMdeSbRv+/YuIvC88zpfePy3Uq5m76zJIi8=; b=cnMW47N8yd600rzj7l
	kkIQ87ltTT9uOxzmsTOW06aYgkRO1i+qc1j8oQnETATX0LdlzQSo+SNeAn3RoNJC
	Apzg3i2BPV5oZdtyItTM9n6L+/gTLX7LdQReygHShiCc/flAA4J3Mw3dEIjBxBrU
	bXvx0XxmLzt8jlepgJ+M92NFloHHA6VUYYcLUW7X2cMGatOU42bjSVFfq1jJtltI
	t+JR4Zs4Vtu9ihLxuELasb/BKLs5xhfJEnV2WaY1bDLIWl5JaTd4LNQuz5u5fLiQ
	BU63O6yRYsYwwtNGYAHLnEZutlDWWOm5V3oaxtLdwnLuDfv0pZQAvwU82YbJHsJl
	9IrQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eerwad5de-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 00:19:25 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 1D24313175;
	Fri, 29 May 2026 00:19:25 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 12:19:24 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 May 2026 12:19:24 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 12:19:24 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2tCk2NX8VKA7+qBhFZ1fchYS6jf/ZkQYaHdZtrQefA1wraGKhauoh3+IdA+48Ot1KLRL8mLIZXMMJtgsm0bjG0hZQ0fwZAWlhD/6aRpSY0bx5+T/3uBqS5yQjWStNSiSwlIKb1pD5bXxf3KldexDOKEsTk9zUK+Ar+jfEHhwD61JiRPPBGAmXXq3yL7GWrljG92ku6P/trKoL+VSp0NjcR9oMhQxodNhfX9t+nqg17h/5ihQsUvAM2/QOjFgOH+kD8YLC/gFp9S9gvppfUWJj/Wrt99B50hz/td5wZFIQa9vMZ80VyBiYTlET0HYOfQO6jtPV/5I7y0QYQuXdZ3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9auK8N1gMdeSbRv+/YuIvC88zpfePy3Uq5m76zJIi8=;
 b=a8oUK2GseAg7eWmc/zS+EaxLLKNP9dpGwKIr6XULepsefaDDvdwczMjo4Zm+U87Ogy+9OXj+qgFZBIzXJRAI9SEESijXOD/9zU3w3EVIOTwPIlTamR0PhD58mWAyAcxaHWaQYJkEwyt3Ls1WfUeJpHaLtZ3NbWTwsCy1+gMSgXkIKhJ72SNivasOffeC0S5p92dHKbptki3tZ6PIROy/eiU0/zk1/sDOM/9zXe4qeQC2F9m8Oj28S35Qj12GK/6AO4uu42iBl7NtwPAdpSd/jWi1VsbnQK3Q+B8M2V6yxdEcUCaam/gZQxvoveK0Srklz41JMmKMDW1vcdicoOQsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS7PR84MB3086.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:9d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.5; Fri, 29 May 2026
 00:19:21 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 00:19:21 +0000
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
Subject: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog Devices
 MAX20860A
Thread-Topic: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc7wDM7+FlL4i+8UaJulySqZHrIg==
Date: Fri, 29 May 2026 00:19:21 +0000
Message-ID: <20260529001903.625737-3-sanman.pradhan@hpe.com>
References: <20260529001903.625737-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260529001903.625737-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS7PR84MB3086:EE_
x-ms-office365-filtering-correlation-id: ef2b26c8-a508-497d-0943-08debd17eea0
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|38070700021|3023799007|18002099003|56012099006;
x-microsoft-antispam-message-info: Blv7yNhlIgmIyrv5QAc3vEnMOVdDHveDtjnMfs7iwanLKMCsJHu0geAZY7/sQVC9QUUiKZOe0KgHui/9iMpUyFmnt4NPez7yVXO4C7zDNLYIU46yJlwwAIFdcM2J+xW0WazVoSJ9gL+3GwNXy99F/OLi1VWqsMMZ5341Sh3Jjn6mFJXqQD042Wl8m/7U1j+yZNr1By4hNtndfXSMaiEXYgLC+5ImVK4fYyA/JK4ZYVVGvLh5p2sZm6xs1U3rR1dvIZmiDWDVOEheF/fUlE//SQ167f5g3PDZ8/wviGPJgTIcNgMqEhpaxvXU0tjhJZRWCZPfs/K2v56gMcwwVu3bl+R9PcJXOABat5WBq83WOCvk4SuXAskylRlu7XJ3zatLAUXmA7tmz72X8Am6OR64NrkEsQp9eDFmt2418hhGdOb01yl8dFHZf9NYYAxhcpBSuRfMEG/sY5KPdLU0ZCiOOJ7vpR8ChmLhdvm8XXMAv2nxDB0DlpArKluokqNaQIl+eIWSWIFrxKzC4DG65OVl/Murq/AC8J2Bk5L2rhXG72yIIBIJLsuNdml5/XYp2WBkws3Y2/d2r7hgVNld+/IkwxtlhuKjRsUaF0D7eMh2trZsElYPikge7UA8DBUDsAccrvB0Y1UC6lbCWP5PHs4w5kLLNN5MxWffYg558t7qYtmE2XoGqjp0LajlUQnBQNt3njxq1xFtRKFVqb9gL+P6b7i6/qBgLvAUEWG9MuIQStfN+o4S/UhjJyusNqEfYAFg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(38070700021)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QZCEducRMsJzvMP1aXjd67V+mg9HRVBqkMEANme3lu6kNSi/PVO3KnyH+K?=
 =?iso-8859-1?Q?XDwh/DGaYBglVwko1/ORBsS4GtkryFu6Tx7d+90D7q2cRsslT06ZZQCKZL?=
 =?iso-8859-1?Q?ayZutc2GxZmkGULKVeBg8sP4D61JFYimSygfTDAC60M242kNX9LrSm9IE4?=
 =?iso-8859-1?Q?qKOLADUV1yDpebMuAbC3svJ11/NeRrxr1wqSWPsA2oWkhYUJ/XZ5qM3XGA?=
 =?iso-8859-1?Q?PIBApBcNd23LYKhx13nn3MBSzDCYgqR80j3KF2bhZEFEUXL2gw2nOkLjAv?=
 =?iso-8859-1?Q?3OlNYJmDZA+eAgSdDwzaWg3uWAgLXGVvtqtWztVIpDPwMEOJM2oEsisFN6?=
 =?iso-8859-1?Q?SkzbBn+K9GscMOJgd6jbrFIENTjwuKliFHdKekxh35RETH/Tik3hHZd5GH?=
 =?iso-8859-1?Q?d+R0qcyNCN4bzc1bBPneBTJ21A42iMr7WevN57klRfHlnY5X2/kqtbdymR?=
 =?iso-8859-1?Q?pL4DnA9OdHWuwfH8iYJxGTeaR4AIsp3Yn/mFO9B6ca+8kPf4jFh5AYnSos?=
 =?iso-8859-1?Q?Exbtv9cuT0UDB4bSJZuTTBEuhtuXBgYITeriQVYZxfEEg0ruYEtd9fmgbp?=
 =?iso-8859-1?Q?+wN8b+BEm1gXlVRVV/fp/RMyfwfYm2EhfgotjnVMT8SN2iiOKssOz3P+6V?=
 =?iso-8859-1?Q?MbIC9EsTRGIYB9ralTiNtzIa1zH+/xLgNO13fUho9VqBxq+Ga5Y36Is6z3?=
 =?iso-8859-1?Q?K7/gHhRldBbxpkhdDn8dZ1E4E4EB4Zht6+lN8KpKbbIpowoZp4noA61QrF?=
 =?iso-8859-1?Q?RZPtLeF4MsvrhEMShomnYhbyJ/QGzvOg+kGfe51hLO6PmUV3IRAWVdF7G6?=
 =?iso-8859-1?Q?L/hkedO9d54B6/uYS1j3ZDs2PKTtx0cDAFJmmPLxgo9fLHn61Dq9pfPMfR?=
 =?iso-8859-1?Q?caJTAwgpN61m7a5fKTqq3XleV3shE4L90MKsTq7Rz3HzTbEXNdbgE780DB?=
 =?iso-8859-1?Q?IA2aoHxcHBxUM2Wq1nWD3MCKv+3E+/PLvSEsB/shrMyF1WLitiDCLijgnL?=
 =?iso-8859-1?Q?hTu8rMsVs44YXWpse23VkFuhNFG+99JQA0a7UeOJtDMl7rrL9xiPmnLW/W?=
 =?iso-8859-1?Q?Twr/eUuES+UQguF5JZtMZ7ppkL9hGIT7+sfQ+0yMsBQIbAMabmyLsvuQlK?=
 =?iso-8859-1?Q?7ENGNEZv7XLI44gYpLcUzJfNh58rKCedUM/dAXPQPdkWsIfgyLfFGH0+61?=
 =?iso-8859-1?Q?JnHnO1T+hLX24FIv0PvKvx646Ge9SF+U0LmwaD5J2jBmCq2bwZEa59dZAR?=
 =?iso-8859-1?Q?7SEvg8OWPKmyKsXQTHjIf+Gdju1ygihKxfPWbCQyUUbwVtsjeWD8O3QWvP?=
 =?iso-8859-1?Q?XJ036T5FIIUu+Mvj+DILiTCuFCQS19rLehUqxmIbCbIdzGAN9aiOeX4ndw?=
 =?iso-8859-1?Q?RAaeBjUP/+qhcsshq8906N6+GbTEyfRW4E7DTlkp8cYEzSyrhFmD9/Y0Hx?=
 =?iso-8859-1?Q?qJURyyT4ZVfUy5Y8fD+aCHVEK/KXoUrOmR66XZtrBvV2jrGQ6w6ZZY+60g?=
 =?iso-8859-1?Q?tafd6MqZO6HgW73toX5fj8iGfx02H1Gn/DIWnnjMJ4HDnOmZ1DaGBx4IlD?=
 =?iso-8859-1?Q?0i1Y0Q25b1dU+JeI56asxlcHVP5u/f5RkpbtGMSs4zh5j9IAUw/e+/25R2?=
 =?iso-8859-1?Q?faIonarsidN0lwjDVKwUV9c/1nm6IoAZG6aB3y6ddtI469ETz3FgmvR2z/?=
 =?iso-8859-1?Q?sh6doe3H5nU60NLCdNJnkI+LEJCjG+cCU+wNfP8mF6Xat85l3VQWW0i8V6?=
 =?iso-8859-1?Q?tf3k/OFqeSKJHoBeWzjvkFOFhgP8diEIoPz7BB4MutxkV2k+/WXUi0n9ET?=
 =?iso-8859-1?Q?7vGa/A9IGQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: I+ndq4OHr7vpQon+un2pc2KYpumL/qqU7LIKDbOwh8LTo8EPIUqS3ZwA2sQDHrG9x+p6uQ6OaotaG4lBX8xfwvHV3nwREooec3puhbszRB+zjU/9JfqQG54MF5yd3eMIK4c/AjcBgwv0pVpuY4rDqKozi2wlK9NN1ifzlvZWx3aVKOSYzxB1h2B+FCS2UYHHZcJKDgDM4zX0YUVM4kBVW/g5RmnIyy+n5TwRAil7vfDGuyjxELoot8h18sojnM7NYAZt7q49p6onn3CXyMp3J9rp9rU5fNQicqF4Cp+TBeJEeqpE56Yx5fKYbrKBEjtlYjR8fKf+/+X/3rpt3PzgZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2b26c8-a508-497d-0943-08debd17eea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 00:19:21.8238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3s2CVhF/AYEYC612RHkolGKUeNA005vs7UGNpGm7W718Llm38oaPZKVLTmEe/L7ACTkKIM7B98ZkSIdS46DoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR84MB3086
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=A6Zc+aWG c=1 sm=1 tr=0 ts=6a18db8d cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=gAnH3GRIAAAA:8 a=MvuuwTCpAAAA:8 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=g-UD0_MmSVei7Gk8AtgA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: 9caFyTE_ra33cQJ80EMSSFxrHnmMQPt5
X-Proofpoint-ORIG-GUID: 9caFyTE_ra33cQJ80EMSSFxrHnmMQPt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwMSBTYWx0ZWRfXwHFQqNFbMtsr
 NahwuDYBhM/D/vr5j3PrmjFd03lt1RcrLX6mbkf2D6/N3b4AIfmhrsbEGEbrmlimZGMEU9WjRNz
 ICOcDMLNg6rABMASKwbUJsyG+B9zRcrzDboube5MJsaE0wn6GaX2NMPVphMJSMweUjMlHYJhaxp
 zMWNZfIoQAYoXwIipX/q7hfFfkvpYrJDym4WGcFA9bX8K7QukSGYInVMb7+2M26Hxf9Rlgyzz99
 9UhhL8WCQb42bx1CavauSVio052OfGY8eFe9eBusXEO/cAMv7XGMQBvim3zizSHUYEMr2Bp67oH
 6LisebpUtDMDEbjOMbYlaElHm7/knqEFrgwzykeRmLItQw2Qbec+Jwnw8pknxsBlKzexT9yjDsp
 xsJZiwpWrezyX+WpwnsArHknd4fTtxiBaDcIW54K9w3U8LcLcEPaklkn1nhX4etd1hM1CAgbH/o
 FWWqHNRwuZMSBVQYMEQ==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290001

From: Syed Arif <arif.syed@hpe.com>=0A=
=0A=
Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC=0A=
switching regulator. The MAX20860A provides monitoring of input/output=0A=
voltage, output current, and temperature via the PMBus interface using=0A=
linear data format.=0A=
=0A=
Signed-off-by: Syed Arif <arif.syed@hpe.com>=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v3:=0A=
  - Removed "maxim,max20860a" from of_device_id=0A=
v2:=0A=
  - Removed WRITE_PROTECT write from probe=0A=
=0A=
 Documentation/hwmon/index.rst     |  1 +=0A=
 Documentation/hwmon/max20860a.rst | 57 +++++++++++++++++++++++++++++++=0A=
 MAINTAINERS                       |  8 +++++=0A=
 drivers/hwmon/pmbus/Kconfig       |  9 +++++=0A=
 drivers/hwmon/pmbus/Makefile      |  1 +=0A=
 drivers/hwmon/pmbus/max20860a.c   | 57 +++++++++++++++++++++++++++++++=0A=
 6 files changed, 133 insertions(+)=0A=
 create mode 100644 Documentation/hwmon/max20860a.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/max20860a.c=0A=
=0A=
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst=
=0A=
index e880c6ca84f0..ffaacda416e7 100644=0A=
--- a/Documentation/hwmon/index.rst=0A=
+++ b/Documentation/hwmon/index.rst=0A=
@@ -163,6 +163,7 @@ Hardware Monitoring Kernel Drivers=0A=
    max20730=0A=
    max20751=0A=
    max20830=0A=
+   max20860a=0A=
    max31722=0A=
    max31730=0A=
    max31760=0A=
diff --git a/Documentation/hwmon/max20860a.rst b/Documentation/hwmon/max208=
60a.rst=0A=
new file mode 100644=0A=
index 000000000000..ea6d2228fafc=0A=
--- /dev/null=0A=
+++ b/Documentation/hwmon/max20860a.rst=0A=
@@ -0,0 +1,57 @@=0A=
+.. SPDX-License-Identifier: GPL-2.0=0A=
+=0A=
+Kernel driver max20860a=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+=0A=
+Supported chips:=0A=
+=0A=
+  * Analog Devices MAX20860A=0A=
+=0A=
+    Prefix: 'max20860a'=0A=
+=0A=
+    Addresses scanned: -=0A=
+=0A=
+    Datasheet: https://www.analog.com/en/products/max20860a.html=0A=
+=0A=
+Author:=0A=
+=0A=
+  - Syed Arif <arif.syed@hpe.com>=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+=0A=
+Description=0A=
+-----------=0A=
+=0A=
+This driver supports hardware monitoring for Analog Devices MAX20860A=0A=
+Step-Down Switching Regulator with PMBus Interface.=0A=
+=0A=
+The MAX20860A is a fully integrated step-down DC-DC switching regulator.=
=0A=
+Through the PMBus interface, the device can monitor input/output voltages,=
=0A=
+output current and temperature.=0A=
+=0A=
+The driver is a client driver to the core PMBus driver. Please see=0A=
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.=0A=
+=0A=
+Usage Notes=0A=
+-----------=0A=
+=0A=
+This driver does not auto-detect devices. You will have to instantiate=0A=
+the devices explicitly.=0A=
+=0A=
+Sysfs entries=0A=
+-------------=0A=
+=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+in1_label         "vin"=0A=
+in1_input         Measured input voltage=0A=
+in1_alarm         Input voltage alarm=0A=
+in2_label         "vout1"=0A=
+in2_input         Measured output voltage=0A=
+in2_alarm         Output voltage alarm=0A=
+curr1_label       "iout1"=0A=
+curr1_input       Measured output current=0A=
+curr1_alarm       Output current alarm=0A=
+temp1_input       Measured temperature=0A=
+temp1_alarm       Chip temperature alarm=0A=
+temp2_input       Measured temperature (secondary)=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index b71acb130395..1d9651947ee3 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -15688,6 +15688,14 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/a=
di,max20830.yaml=0A=
 F:	Documentation/hwmon/max20830.rst=0A=
 F:	drivers/hwmon/pmbus/max20830.c=0A=
 =0A=
+MAX20860A HARDWARE MONITOR DRIVER=0A=
+M:	Sanman Pradhan <psanman@juniper.net>=0A=
+L:	linux-hwmon@vger.kernel.org=0A=
+S:	Maintained=0A=
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
+F:	Documentation/hwmon/max20860a.rst=0A=
+F:	drivers/hwmon/pmbus/max20860a.c=0A=
+=0A=
 MAX2175 SDR TUNER DRIVER=0A=
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>=0A=
 L:	linux-media@vger.kernel.org=0A=
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig=0A=
index 64f38654f4e7..5825dda75f2c 100644=0A=
--- a/drivers/hwmon/pmbus/Kconfig=0A=
+++ b/drivers/hwmon/pmbus/Kconfig=0A=
@@ -402,6 +402,15 @@ config SENSORS_MAX20830=0A=
 	  This driver can also be built as a module. If so, the module will=0A=
 	  be called max20830.=0A=
 =0A=
+config SENSORS_MAX20860A=0A=
+	tristate "Analog Devices MAX20860A"=0A=
+	help=0A=
+	  If you say yes here you get hardware monitoring support for Analog=0A=
+	  Devices MAX20860A step-down converter.=0A=
+=0A=
+	  This driver can also be built as a module. If so, the module will=0A=
+	  be called max20860a.=0A=
+=0A=
 config SENSORS_MAX31785=0A=
 	tristate "Maxim MAX31785 and compatibles"=0A=
 	help=0A=
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile=0A=
index 1f2c73b71953..ffc05f493213 100644=0A=
--- a/drivers/hwmon/pmbus/Makefile=0A=
+++ b/drivers/hwmon/pmbus/Makefile=0A=
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MAX17616)	+=3D max17616.o=0A=
 obj-$(CONFIG_SENSORS_MAX20730)	+=3D max20730.o=0A=
 obj-$(CONFIG_SENSORS_MAX20751)	+=3D max20751.o=0A=
 obj-$(CONFIG_SENSORS_MAX20830)	+=3D max20830.o=0A=
+obj-$(CONFIG_SENSORS_MAX20860A)	+=3D max20860a.o=0A=
 obj-$(CONFIG_SENSORS_MAX31785)	+=3D max31785.o=0A=
 obj-$(CONFIG_SENSORS_MAX34440)	+=3D max34440.o=0A=
 obj-$(CONFIG_SENSORS_MAX8688)	+=3D max8688.o=0A=
diff --git a/drivers/hwmon/pmbus/max20860a.c b/drivers/hwmon/pmbus/max20860=
a.c=0A=
new file mode 100644=0A=
index 000000000000..f5feefcbe407=0A=
--- /dev/null=0A=
+++ b/drivers/hwmon/pmbus/max20860a.c=0A=
@@ -0,0 +1,57 @@=0A=
+// SPDX-License-Identifier: GPL-2.0-or-later=0A=
+/*=0A=
+ * Hardware monitoring driver for Analog Devices MAX20860A=0A=
+ *=0A=
+ * SPDX-FileCopyrightText: Copyright Hewlett Packard Enterprise Developmen=
t LP=0A=
+ */=0A=
+=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/module.h>=0A=
+#include "pmbus.h"=0A=
+=0A=
+static struct pmbus_driver_info max20860a_info =3D {=0A=
+	.pages =3D 1,=0A=
+	.format[PSC_VOLTAGE_IN] =3D linear,=0A=
+	.format[PSC_VOLTAGE_OUT] =3D linear,=0A=
+	.format[PSC_CURRENT_OUT] =3D linear,=0A=
+	.format[PSC_TEMPERATURE] =3D linear,=0A=
+	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |=0A=
+		PMBUS_HAVE_STATUS_VOUT |=0A=
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |=0A=
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |=0A=
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_INPUT,=0A=
+};=0A=
+=0A=
+static int max20860a_probe(struct i2c_client *client)=0A=
+{=0A=
+	return pmbus_do_probe(client, &max20860a_info);=0A=
+}=0A=
+=0A=
+static const struct i2c_device_id max20860a_id[] =3D {=0A=
+	{"max20860a"},=0A=
+	{}=0A=
+};=0A=
+MODULE_DEVICE_TABLE(i2c, max20860a_id);=0A=
+=0A=
+static const struct of_device_id max20860a_of_match[] =3D {=0A=
+	{ .compatible =3D "adi,max20860a" },=0A=
+	{}=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, max20860a_of_match);=0A=
+=0A=
+static struct i2c_driver max20860a_driver =3D {=0A=
+	.driver =3D {=0A=
+		.name =3D "max20860a",=0A=
+		.of_match_table =3D max20860a_of_match,=0A=
+	},=0A=
+	.probe =3D max20860a_probe,=0A=
+	.id_table =3D max20860a_id,=0A=
+};=0A=
+=0A=
+module_i2c_driver(max20860a_driver);=0A=
+=0A=
+MODULE_AUTHOR("Syed Arif <arif.syed@hpe.com>");=0A=
+MODULE_AUTHOR("Sanman Pradhan <psanman@juniper.net>");=0A=
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20860A");=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_IMPORT_NS("PMBUS");=0A=
-- =0A=
2.34.1=0A=
=0A=
