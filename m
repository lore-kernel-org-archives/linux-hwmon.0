Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4B25A640;
	Thu, 28 May 2026 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989417; cv=fail; b=Buo9AaHRfOHN+DY/qs166X9dfUsR7KX8y+YHZgdluwvv2k2k0WNLhxfmvcZHQ1rYrntnosUX4quiD4Vd4r0/1+PP1/lZQCpMfrji1jaQgdbL3B5cVSGkZAUGfOtiKO6L4YmWad32JoT5bzVx3NSSci6Eci7L+oSu47dx3qAFhiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989417; c=relaxed/simple;
	bh=fy7/EuWREq1kfGAaXYrTpllzFANjvAByPa0iDfxIo+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b+amrb3X3c2htrEAMeX2STUV9VSSYtbiFAYs8AGLhFXtOJIesTL1xNKoaGKRWRoggYP9nfkFWDflqighZ0ejZe2/NQ/VROFFZupOjQFzOaXHVeiVSw/g9pPGP7WM0kmtcyI4tRvDWbFGfPuMey+gxnHzLDEjvRpZBRta8Hd+ad0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=inJ+IAQs; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="inJ+IAQs"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SEqXIt4076910;
	Thu, 28 May 2026 17:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=fy
	7/EuWREq1kfGAaXYrTpllzFANjvAByPa0iDfxIo+U=; b=inJ+IAQsKaR5wfZSpb
	DJBZpB9OqW56YQDOl32LEjO0sLzi3s+sCb9T+aSEzdm+ksh+kytxLp/uj3DdKhLF
	1pZyQyCOnTWPZ/pwN9VF3c6qKHssOTrHEe0jN2R+lPJ+POPKHWQss4EDEW2CMr0Z
	rSl4uHNM5lZFNWuD02j7yWCFUgwLFB8tn1q31r0aY1kWBttQfcIC0fmiCEzg2H2I
	ynLpCCe27EPkSziXLkzGhxT9A8xxWHXOH4DDMCxcsO2HRh/zzj9KhXlSb/jjd8fT
	rY3AcUIyH8rQ21et0PM1+RwoqM6ynCyuqxpPUcJbcL5rr1qpky9RQTW/LC2E1rq+
	4bhA==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eequutfu3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 17:29:44 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id A51D6132C7;
	Thu, 28 May 2026 17:29:43 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 05:29:14 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 May 2026 05:29:14 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 05:29:14 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KT90uGteCoiz3FwKVGjA9AQhp6SAXLPLU/QlyMGjuDQZMYxR4E3nqAhAZmmeyEPieSytUSSoBOhd9Rm/QXC7T66jNUgOJ0mnfiKeG7XurVNVcN0S+uIg3zfapZqsJasNnkbvjJeeGOnURNHP9mL16k8XE6n0VCBnAVZ895wiqlLGAmwLpD1sTVzik6w/MVWyK2XpATXNILDSb8IMYqFlvA7mEmHp920ec2WCPf2joJvzaBJDwcTwIK5/df4aBDnsw+uAeAJgMlLqZY0fuWD4kmeCmHIxBXp8JhflFVP5ptpMsvcoHEYnCXx5YHAMtds0Z2gDIOVtqxHbVV3iUxFYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy7/EuWREq1kfGAaXYrTpllzFANjvAByPa0iDfxIo+U=;
 b=i4GHi1lIoKh3L52NxfaICUsDieEhrvN5miCHQGHLT7cDf/g90TONdVEKQzSJDe918YLWxD61uoyxT3sDnJ+3kUuEUx+Nv4OkGA9vSclJAm8yo0vuAnodGXmFNb/Ao91dAxlhCdb6hKCecxaoAW+coiKWxoMCYfcrLVYMfBcnJCOQy2OwCf2tu1bBuYZuhZW+WZ/FvwsV7oH3fdDQxaoBzRBdXWy9gKtV7fVGe//BRp3Ax5ipkPQiB8gRNeRWB/VkWGRTaJyzxuDdHkdrqzQp6c7Z4s55uYpuwMfvSZnxGTr6ohD7jq4OEsn1YZ5eNqb2ROIwMdZuVIqgf/XcdAYQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS0PR84MB3745.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:29:12 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:29:12 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
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
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Index: AQHc7ZTud9s8mAoGu0urhIKJwj0u/7Yh+DwAgAG1MwCAAALTgIAAA4qA
Date: Thu, 28 May 2026 17:29:12 +0000
Message-ID: <20260528172905.86852-1-sanman.pradhan@hpe.com>
References: <20260527045409.9092-1-sanman.pradhan@hpe.com>
 <20260527045409.9092-2-sanman.pradhan@hpe.com>
 <20260527-exuberant-broadband-052c3526847f@spud>
 <20260528170618.85027-1-sanman.pradhan@hpe.com>
 <20260528-resupply-sympathy-f590eb8616ce@spud>
In-Reply-To: <20260528-resupply-sympathy-f590eb8616ce@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS0PR84MB3745:EE_
x-ms-office365-filtering-correlation-id: 3f9cdfc8-3df2-4759-b017-08debcdea218
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: j2snnrjOcLFxaJ6tc5nymLlhbBt6FhRrf032apdsTpzCaLFPi0x45Nkm5u1CIteucT1YGfr3mO5p7B18/dBLtiYREnVRa076ZVvYoZoEj36w1d8em3xLu7oEUW/pLpPt0qmfwYvG4X6wHJG7k3/OTctKonpB1EZ4OIngjVFfbC9i/XVSs1d8XghFzGakVH/jaXYv3wU7WoFgoagjCwkaWJVvbfYXNfoiaFOFsz8YckP11jxNJ3PYppz5ldlr7aO40JA5TyyxmZYjTZ2g9uegK3/F1gFkVFBELX2UmwHu/YPhbyTUYw/lncXV4g99cicc6wWst/5xDc9uG5ASKU6VSZ6MYEJJ+WcRaj7f5R/u/0SJeJ8Xab5cm5PbUQU5VIWAl0FWHZcPf0CGKly1+tu69Sr1p4Af12DEU9Ko9h/5cMDzcymFxzNKKn532gb/lFJkIf8aRU/3uORk1X8Dxv5sSDTU8F7QBYryXiQCbPtIDSwLZvfvOd7+T+GX0GP7faPQZBvVKwNSOoleOEDPPh/9zzYizIpEskzdWiggE0FZ3NDvFue0A2S1KxntYhUYUM4m5eFUTpS+JsVKX4Gq3OPdpd6iygzX2fViJJEsd46yoHorc8Dtk6q91B+sdiOZqNWGSF5qQrGFX4H6AG8ZY7PT8W28MgyCagNXXyyL/8x/bmVEJdvEfEWt0pw9Ko4tTggkPrlC5rW1bE0TMLZSyYLwmp8aSPYL55PKm+KaKEDcrG61R/HLAMbyc6OqwQniPtI6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FCRRzsrBuxycbkXmet8WfkXphgBVI/ZVHUiKYkjVSAUziNM4PvwD66Wj4D?=
 =?iso-8859-1?Q?YDsNMzPVBDwQgC4UJjxeYzDWnU74BEhQ3DCWF9QTb5mb/kV/L3Yrt3yF/o?=
 =?iso-8859-1?Q?m7aCAmKIXHkz/MLuGH3s2bMGV9iI+zhdeoEeaxMAwMfVt4QvUVOWgtoPiE?=
 =?iso-8859-1?Q?lex6aqSOlv3hPe4j+vdqMhy1kQi0utIjodnsuMjK0LpVQiLkNiXtrnmeUJ?=
 =?iso-8859-1?Q?0JfUnmqZnHYChsKiy5qPEle00wBQu54S0ZcVydKF3RUoOggAOiJUmW5iCb?=
 =?iso-8859-1?Q?nZ/9tRDjLQwotLGver2pxVIOYu9v2b4eFhgWr15FYZCF+07qcYrBK4cG+z?=
 =?iso-8859-1?Q?XVDxrN5BUe7OmQMLeEZZTk3WbU7NqSDQRg1J3qSA0uNUSYIZoJAHzQ75Cy?=
 =?iso-8859-1?Q?S8yPmjHpdb1z2EBLLQSt+q/b4868HNfk5J1HV+i2MnsEkwfgbTgxaZT+/7?=
 =?iso-8859-1?Q?L1+UrwARm1+kpRyOpQ25RVieiEaMbwTwfyoj1i1TB2shUmsHvPqZ1HZtWQ?=
 =?iso-8859-1?Q?knZmPYNq1U365Xf67e8V+17W9RvGXkU6NEyyKfGSWLbZsv3a4P/weLAIdu?=
 =?iso-8859-1?Q?SihnjL1VXTQFf/Hp/lmXF6RHOkoi4U//UWYs3BZMAtcnn9tfPg/wfRudcX?=
 =?iso-8859-1?Q?UL90Qu7B+u7Nsn/nPhjxwfxFF7mE5bTwpUGe65KVXONOb1n/nhaSe7tcRE?=
 =?iso-8859-1?Q?ihiTEhkYEc4wpTpzPEpsanARlCq7/iLxvVHxufAEpVhMtVhPYq1IhyNZ/c?=
 =?iso-8859-1?Q?4lWku1a59xJbvc2wgai/fnz+hlfM1mTK9mTY7Gb6ZZZjatoDrVBeIFQl/4?=
 =?iso-8859-1?Q?f5YdZ2JX9A0etdj/eIK0iEz4NXrfMg019nfF+DSOflIzjvBO8WBcXdcO+q?=
 =?iso-8859-1?Q?auTyLBQ4/ndStf2b3n+UZIHem5YR2sRnCW4FB0H+o3oyfaCJeY1k4Sdr0K?=
 =?iso-8859-1?Q?UV2kGh8LJn4SKmiu3N6Mn1As+bLSWEDjAwGcE1YFBInla8B6/qXRUIGBNj?=
 =?iso-8859-1?Q?N9NkNMLaYL4m03ViqAQmVcx7NaL0uXeO+IhzgsWmYAswmXpvDAkrkaSS9M?=
 =?iso-8859-1?Q?2D/aoKAHaBBu1GCs66yxDMIDwMAm6W/Frjvv9idJ6CQ1gX0m9pcwxnFgNP?=
 =?iso-8859-1?Q?cDmv2dCYgNXw4Bb+9r/DoomFSteRqJeVjSCBT4LPiaBmj4VvO4TqCNShtf?=
 =?iso-8859-1?Q?ksfOKDEnCE6zBzA+QcWUpJaeiysFysBAdqHueVLmQis2SkfLXUdU6lKiV2?=
 =?iso-8859-1?Q?qF1VRmb9Bm1QEsqRcbQn13Spa+hRY8OHbRkMPszb2Z16jvt8PbIImeC/KV?=
 =?iso-8859-1?Q?cl/uDr9HfMGH3/XbuwB2+u8pPFSz0ETU8PqD2xi9rHET8FJhCDJLvhEopB?=
 =?iso-8859-1?Q?pUKFWs07uBwiM0bTX3fgz6CXWGpRHoZO2jZSlwpDe9MotVCMOArf5ZGOSG?=
 =?iso-8859-1?Q?atWaZ6cY73yzoWBbYkx44Is0lxHKvfRfBhrgDfD9nxgj7chdJpUWEkxD+L?=
 =?iso-8859-1?Q?FNBaedwKqcgt4AvyRt9/y+JN0ztIpYUJqFHYivLF++6hCYztXWq9Ir03hq?=
 =?iso-8859-1?Q?jzF/v298+UUg8wviCFGp/8Wqw8x/Y8W/r3AmmsmOB6WFj2Uqap4rkwz7d+?=
 =?iso-8859-1?Q?etIKln2fp0KrSQuFl0j1pSjoSXRrtlibydCwjjijRDAwbKJ6Btwp5ur1Lj?=
 =?iso-8859-1?Q?ReVeMN61+Kxs/ziW2ahGVY9cFoNUgnbHWSSgRjXbk6AJxaTRIOiR3PJ8SH?=
 =?iso-8859-1?Q?9JnQzqihMrLhc3xMZI3g1GxpDvZUGIPJGwSf+10EDyvR3WuUH/qSiLiEnU?=
 =?iso-8859-1?Q?S6nXXj/vJA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vfuc9OBOI6lUeaFtG6QgMjOPrGnh3nNKfsoo7ryhoPNQLAVXq7s8m48bm2l1tsb1b+zPW52c4OedPrJnJpck2pIpkVIkmZkl8fjDSUy2CVpNgpa8vTQMh2weqspNTo+BAspR9TaA4sebB6jddjJZ6mZQ2f+i7jl8TcopCQxLEtkYnuTh7dLh6FCyrbY39A9f6cf3R5jW5pzaSbcoteOeR578A9McYSC+VD02YaCvyedvF0nSwnEkWMmtvqOUzj3D9SecUmDXNAFz17OTbt+13l8cRUPxyxwWhSWCKCCUHlImHxcceqSq4xHfSLJyiJ9b092dZgC+la6UYsHd7VcWtw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9cdfc8-3df2-4759-b017-08debcdea218
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 17:29:12.0960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28GQruRkA1gz4izy21YdsgnnmZBRNh610HUS8U/7xj1ZBkhWV/7TuE/ge4hI/rL3t+uIHYZ+Wbry32kJW634bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR84MB3745
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE3NSBTYWx0ZWRfX0BhhC7rf8Pfo
 l3ljC8p9Dk1knQHTphSuYl6ESoGfejLTSB3BZ+jZiw9ZOrh/C0rclrxRfihn0KzUmuR4vc6RTjv
 D1dmVk9NF49j9IB8HsCmAYngchGYu5pZ4L3SH9mtQudPonLFQWQJSpoQ5VT2/GyrN+r9Yk7auks
 LPvGn74WK4liCUNioTUk3U/VjqfXAZ8NZu6Tc62ufhudLEnQB7OnBLXuHGPRzo4+UjeGEQA3bED
 J2zSnxlS0AYAaKfyOxMeLQiFB529p7NGLrw/IUunjGSOLhFReSsx6hVRLGiZi/kxq5tqJa0m+Qq
 cQ7xZqwi9ipafW/AdjCrmi4HK7ZSvO7LH8n3VJJ3/Vu8jfEvk3rut5q0VmYKGo2T72cFqCwH5JP
 jgcAdf3nk42O0RCOiJxpp0WX1eMrVyNpOrlb8UuvT5BH6qdztNaKEwQ3tuDDifJtpZZ9/8xyNE6
 h2G/MlBe0t3JDHGxUVQ==
X-Authority-Analysis: v=2.4 cv=AbCB2XXG c=1 sm=1 tr=0 ts=6a187b88 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8 a=M0c-bufj5LWMVCuEPH8A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: NWQPsDd9I5umlWwzCxay94ctxxvb4hnI
X-Proofpoint-ORIG-GUID: NWQPsDd9I5umlWwzCxay94ctxxvb4hnI
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280175

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
On Thu, May 28, 2026 at 18:16:25 +0100, Conor Dooley wrote:=0A=
> On Thu, May 28, 2026 at 05:06:30PM +0000, Pradhan, Sanman wrote:=0A=
> > From: Sanman Pradhan <psanman@juniper.net>=0A=
> >=0A=
> > Thanks Conor for the review. Will fix in v2, will add an allOf referenc=
e=0A=
> > to regulator.yaml and switch to unevaluatedProperties: false, will foll=
ow=0A=
> > the same pattern as adi,max20830.yaml, if that's ok.=0A=
>=0A=
> Okay. Please don't remove quoted text when you reply, so that I don't=0A=
> have to look on lore.kernel.org to figure out what it is that I am=0A=
> commenting on.=0A=
=0A=
Apologies for stripping the quoted context, will make sure to=0A=
preserve it going forward.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
