Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6E126C17;
	Wed, 27 May 2026 04:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779857724; cv=fail; b=QbjxvhNiXm7GOjjZHmTxGZGMCUPOHywlqJaSleL1AphYaYEUvuBSm85yuky4CiIwMcq1pblpogeaWoZtiqGMx1oXvEU9tWQAwnb+YCh6+dKJKL/kNO9AenFg+A13sqNSeEOcILtS2Zs1kLPzZqm9xEaUXvPr4zUSWYawXm5t0zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779857724; c=relaxed/simple;
	bh=GMZwKBGVRZ9DBSC8K+CRatICEnABAFpFzCFRHLKrTA0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TrWrN3qZ2m7hY826//csVYBs3iMo8IcEtetFRdQUnAV8q5g0kyJLk4P62oLdNo20zNVS0uX9+gKyxguKHKronNvuQtJMswSsO51IxEttXErhggyXleurXlP4xCBZdMPl7hhuJcVmovc56Nx+9CLefxeWYiRvo1rT78vu+i4tWKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=MxGx8Zc1; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="MxGx8Zc1"
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R4ilpC3929941;
	Wed, 27 May 2026 04:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=HUzTbB9SaVgnQ5KAwXlN3F+z
	MbJqlUCS5Y1GbE/IdAo=; b=MxGx8Zc1Tv7XtekmNgg6VxR2Y3NMjTVFZRcnvE7g
	IY5q1pZVFdwwtSWwM1/DQMCKJkDypsff1X8GhPFIiZrSuj9SW7cIKuVYm0MEPjLk
	rOuTGluW/6Mj4wWgWNv9wsdmoVgrqd1ow9QNeQC+CAPmQzK2GaUDNERRzb9BaYJv
	9AleBvQuwfa6efwngVaOxI4aNNuc/XLuk40jeM1nF+I0xiS88AEX6E6XGFMRVaVp
	pmru3AANqYWukSNjM437tSYST4zEwQi1ZF0/h86TDWzVykI6bV/GVtzKvVBnEymj
	rHeuF6H5J+vTjNV6emSz75X+u3FAxgln321MGQtTHX29Og==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4edj1fcp6s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 04:54:54 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 32C321317D;
	Wed, 27 May 2026 04:54:53 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 May 2026 16:54:30 -1200
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 May 2026 16:54:30 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 May 2026 16:54:30 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 27 May
 2026 04:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXKpkcYVbTHBOb5r/RKhBe6DFOCdWDSbOu1FCqtxvtqYW86nECstLPzVLbwP1rRqY6tLhpc532pkJVSJWJxr8NV8PByVDZuyRTizTlPOQ64mER4P4S02sAC4O9KqBtczDcNbDhIgvIefFoEupth4ODwBUq1DHWEK5tJsk6QJ5xgSOr4b5mHac1sWfLpkKxc29ns3kd6XZ2F9wzrj7nXdIa2DVwa4chHaBy+TI4z4hwhZH1mJrC5MYE+A55jmLaUrr2BKctuztI4X1+yiq51HVgWl9tBQKYCYYGQy/r+OFyQsLb5m310KCh4WGfT7Ogj7Hzfm7dTtX7VBdlx8vPp3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUzTbB9SaVgnQ5KAwXlN3F+zMbJqlUCS5Y1GbE/IdAo=;
 b=CM2lIrszYzRG8aBI1/xFMuohzHnXNoUHNTLXeQKQ6OsTsCodz6uGAePQvr0HUNZRAabsf21mx2fmgRHOKegvd2WlahKSI8tXJltTKYqjERUF17172YuGu+pf6qUCMw7y7q5K3VWgUnk5hxOYEGvlZXS7H5/+Xb/1cK0un4VSB2f3SQbg73axsrJqQW7elfIR9Xt83rfQiDuMZ3uVNKwHfwrPxFnZbXQcg6f+uCGXRQX7iYtNiIOG1T8HlI+ZbvJAYVfA+UD9W4yXsQGdHYt7LEEBEYOfqPFoQTtFywXDK+w44B79aAM9VaYNFcAVCxYIe77lh1nqa4dzmN/gPFwhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB1496.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 04:54:27 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 04:54:27 +0000
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
Subject: [PATCH 0/2] hwmon: (pmbus/max20860a) Add driver for Analog Devices
 MAX20860A
Thread-Topic: [PATCH 0/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc7ZTlxUcBB3eys0iVIjymd4uA3w==
Date: Wed, 27 May 2026 04:54:27 +0000
Message-ID: <20260527045409.9092-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB1496:EE_
x-ms-office365-filtering-correlation-id: fd88789d-6a3a-4f80-8320-08debbac07e0
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|3023799007|6133799003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info: KYCFpXv8TNH62NsyyNDw3sH/6JduuLmyO5dN8X27UbubLXakLdi1jxhlL4bgfHowbYzWi/54fb53wuhTda+LxYvgJjHcAyzEKvjyj9D3N3txD0lzZf+XI73ZmqSLLbb05yBg8Xsose5mH0IXdx17KjEWHjqhN6YWqnYr/ZIoyzLh9O1w/cD/evpAP0m5PRfPExP8zYuajma41sc4sfiQnkPa3fDiltuO9eljA2uyo3EJfVycIlrkT5PEaHNbAhriCnCCRkNjgeuhHaFbTsiXKLYCID0mpqSAlU3GFgaokNoaEBbfvSBMNwtyFj17fEsBZ3xcKiULgUrC0ilSPdDNfkI6wODQrK1pKauVizyZz3Z2OCCoF0TeMglsWN6H11Je9IuRBnFysdmQ4XSPhSJ0X9Z+is1el4eJEMnKSluxA8mj80e+iYNn5Y94iHouG5AVwMt5xesPfErP+bXU9DfkXPErj8f0LboEoWcXBcoPYBQ8cI8fQ83FHO3T6Qr8MCT/tISRdUvmaz2XThGhQU/RaQLmxgKQKgLeedEE8UYrYXz2HMRTLU6pz8x1Mb19UXoVSkWgf2dOCZzBFBh9sBqazfEALwKECGZJYeHk38KxyMTZ6u3Egm5BHFwdK1n2KG3YbD6gV3I4PgNp09Y9aYQF2LT0A3/yyE+otVWqy96CkFGH8GMUC6ZCcehEHRKlHWhxMn48gu3FEHd5QRwU9FSKTB32KefVH0kPrgYneeyYrJvkr9RIOmepMnEAqbVSwPVp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(3023799007)(6133799003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cCg1xYyy6bxCcawr+l4mTUlZXoNqmwVfGI0hP0Po/tOoGeMxGriAXuqYsx?=
 =?iso-8859-1?Q?Qt/uenElurCkAIgq+MQmgumNci2Lo/InPX60dzKA3/gDCAdayHnWB85sXW?=
 =?iso-8859-1?Q?ezxkMSMkbl4HwR5b+wCti3/wLCQoKBTa97BFL6J1Vdd0DGGDvxykyCjSIe?=
 =?iso-8859-1?Q?pHWOJ9E4OReFhOrUy6z83wWnklcUvHMNIqmjI6zjck8uiAP7gCKeHHwWQ2?=
 =?iso-8859-1?Q?exKPNYXTOO272+skqSy0t9mSrOsH2I0x8/wKflvpeoQEMkvke4MQdRWlfL?=
 =?iso-8859-1?Q?5dQ7H4NwuxsXbBePlP7eBZ/IWr/sG9Nl4JTUKggB1DoAawNkfToJBkkp8o?=
 =?iso-8859-1?Q?tYCKE8DD6pzcN0E0uAHqHFAMHG69iKJHEc8/6kcVNUyXGXPsxRIa0O+8pr?=
 =?iso-8859-1?Q?0UE48jaB6kLqCE2P1OPWSEAbVquRQRmAiVSFhrZEFH3MQOvEQlXaYAHGus?=
 =?iso-8859-1?Q?UbgUsv2F1uEYq8/HkV6yqVa0zz+7S343PzyaNISh7Iirz9djlydE25yTWQ?=
 =?iso-8859-1?Q?1jzlhkaANHmF9pXl+7qua2E3o95KIRgaZTOEMqkPLUKDBsq9I1gMSPjIyc?=
 =?iso-8859-1?Q?fANfTTNahIJcFWeo2MiAkPLSz0HycUq49lHSGmE1O6Y0ghyAvbntkKePd0?=
 =?iso-8859-1?Q?ACBXKrY++t/oEcNnQ4wIB+XNKJKbxkQ0jx7YbnC0bKtRH8Aa6UqRGopfnY?=
 =?iso-8859-1?Q?kUQGVRaBFcA0K4jGae9dUtfPm1hmBuV7v6JVXHRW4bUmoOcAsE3BRs7e4S?=
 =?iso-8859-1?Q?EKS815Uiiz12wfApueHoFYocSaZ4cYCAAhjX7NnEetcA8lfWFN2bFBR25p?=
 =?iso-8859-1?Q?lGmkKofaGWM9+6RDjRg1FZ9Jl3nw2HWLfVN0Qxxf7L+qOTKquy4CBGGQnd?=
 =?iso-8859-1?Q?Q2tAaWN2OCpPgts4gnglIzbydg+5t2IfwHteuy+6rd5dQAnAcRC0EEs4qe?=
 =?iso-8859-1?Q?flSl83CS/NHUubkw7kZvrJXYU/i0RxOLHrMbW0Eqa1LZcFney2LyDhnAX7?=
 =?iso-8859-1?Q?DgZApuu3nFGgccLQMEQU/GvDvbMS/HVW5Oro651qco+TxX3b62AvsCpEIK?=
 =?iso-8859-1?Q?SakIDFRGPJ0e/QGRbe6MHUuR2PxcoohpT3x3nILCQeryRaGzux7LaVC2mw?=
 =?iso-8859-1?Q?f0wCOB4zZTT6h19VofnQflkSiawjSxlESLz9pqxE0k1RS2d4Kw1eqHuVBM?=
 =?iso-8859-1?Q?WNzHBKepMoYJSPXLrjlgopEjTQUNN/MwHzUGxnj5zbnxfpHdN6TE69WXQH?=
 =?iso-8859-1?Q?TTi/hUH6KNl5U2lT/2Jf0pM6Ik4MyaPRkxxhesrII8o8kgqYr5MncaiLjt?=
 =?iso-8859-1?Q?c5byF3o4a+NIKy4niN3Woxj5CVuVFsrVjfJ2mTz5spUblb58XPL/M2KDzf?=
 =?iso-8859-1?Q?0UmsNxaXhghFXEtgpA6DnLJcyW05/V7iz/rg7IZxf8vV39YJigsvI6dQW6?=
 =?iso-8859-1?Q?JDjz4oQukJKI7bYrxSTkvgAIFks62h8YDYnkXwK4x4XLHlHfL7Sg2357xX?=
 =?iso-8859-1?Q?cAGrPMZYNJM1HRJ2kxXw6TmnJZo7Zn14Gv8Mv7Ak3kAVeMS48mqcMM8vqE?=
 =?iso-8859-1?Q?xwlxJ4q7hMeVLfPHufAUnjzyZBl95yhF3GS9Dg+GKYYD7/177dw3F2zaht?=
 =?iso-8859-1?Q?T8lYnj6GU9jZFNze4IaZ3wO+zX0j+9OQIWHd5o6S7x89bmPeMAr03EtNtC?=
 =?iso-8859-1?Q?Qv5YsHB9rBOCy2+P4hTNBjq7/bjKbYrO/7WLA5jF7vNEhAaoQwGVQPXACG?=
 =?iso-8859-1?Q?axd6BxEh+X6TpQgi0ckTb4Tt6b4uWLrSKtnK8M58tppFP90G0SCbjhig0t?=
 =?iso-8859-1?Q?kNi6eQ85fA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iQC7eJWxlnvJ6n8JCjY2p8DdQi02Qity500HGumNBgnnclnQ6QSK0kg5DlFGSVSq/lohNc5EwQRDancTK6RxtF3KoO6fC8myA6F5Gi8yogwy7/nz7OUHAH10B75p1/PjbatLHZmgRDgLuT9j0ASab6i0c2S/quaYe4c4hCE/avfnTTrzjTzW9tgaG6YKkYZ63lIVua6H3d7RVUerrGHxvI7kXw6qAeWqS5bI8IUXu/tCBO9h/CeZjgCLwdb49Wnh8FvoR5PivWosgrTpxz8X2I4FMUMXVFmzQ9Ks4IBcwaCSsgl419xdIfoY4BHkz9fNN9owbNOy5kfxKCE52iOQlA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fd88789d-6a3a-4f80-8320-08debbac07e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 04:54:27.3617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NOiYcw7NxUVGjSVzFl16MOKgGqQyjJx5HYyEyzV1P0j882SGppNj/l+Q4UCN2iesHqAdKmqG6L/4AwqwCZkWBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1496
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=HpZG3UTS c=1 sm=1 tr=0 ts=6a16791e cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=J0OTuHAx6l5K1fCpvPfz:22
 a=OUXY8nFuAAAA:8 a=J9G0Jz65ynzcncFBqbEA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA0NSBTYWx0ZWRfX8oKZ2n6TIth5
 iSRZKD0x3GOCSmogDkjFSJy+lGd73KGAcKIJ8CjDhjtLrb4a5RTnJEcozp8Oqo38Yi1otq6+1BI
 D7XBMgKOy+pXFrbAhHCiLi4CHn7+njm0lQwvMB7YNt43twQLmwyXxIOcxMy/VdE5la1SgWrDfga
 LsIJ4nWxV5FVSeouCpk7+bGNsrGTMf9QvC4MygMdmS8gt/wMTSXZNbM7cvhmXHX7YgREYnCkbyC
 Mnssf7K1Y1wxRnGOOBVxUxGO3ThIDiW/mE9LIPzmqeBnwhMWwSpsYe6cU2AzRF7WI16JRBvyZJQ
 B/zD1RWCXVgzBpcw386tJ+nXcf95VtuMNC6zLqD4J3InQZIjoIhbrl+XavrEh1wwjm60qjStada
 jTst5SnYQawQHIGGTJOnc0lNjOWPcAfQvokQjERhs58JxM8drcGY/ZWGQ3FqSvn5SXF+LYQUCEk
 mOub2Onbx0LLau3JeoQ==
X-Proofpoint-GUID: wHQx1oCzj_JJgdv7pH5_7P1vVu9BCf_A
X-Proofpoint-ORIG-GUID: wHQx1oCzj_JJgdv7pH5_7P1vVu9BCf_A
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270045

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add PMBus hwmon driver and devicetree binding for the Analog Devices=0A=
MAX20860A step-down DC-DC switching regulator.=0A=
=0A=
The MAX20860A uses linear data format and provides monitoring of input=0A=
voltage, output voltage, output current, and two temperature sensors=0A=
via the PMBus interface.=0A=
=0A=
During probe, write protection is configured to level 0x20 to allow=0A=
runtime access to configuration and limit registers.=0A=
=0A=
Tested on Juniper Networks hardware. All sensor readings (VIN, VOUT,=0A=
IOUT, TEMP1, TEMP2) report correct values in expected ranges, status=0A=
registers function correctly, and rapid-poll stress test completes=0A=
with zero errors.=0A=
=0A=
Sanman Pradhan (2):=0A=
  dt-bindings: hwmon: pmbus: Add Analog Devices MAX20860A=0A=
  hwmon: (pmbus/max20860a) Add driver for Analog Devices MAX20860A=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 42 +++++++++++=0A=
 Documentation/hwmon/index.rst                 |  1 +=0A=
 Documentation/hwmon/max20860a.rst             | 60 ++++++++++++++++=0A=
 MAINTAINERS                                   |  8 +++=0A=
 drivers/hwmon/pmbus/Kconfig                   |  9 +++=0A=
 drivers/hwmon/pmbus/Makefile                  |  1 +=0A=
 drivers/hwmon/pmbus/max20860a.c               | 70 +++++++++++++++++++=0A=
 7 files changed, 191 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20=
860a.yaml=0A=
 create mode 100644 Documentation/hwmon/max20860a.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/max20860a.c=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
