Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E213A3F7;
	Sat, 25 Jul 2026 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785014448; cv=fail; b=aoyFqrZd1icbA4LcjNi9IrvOUL+9R5k515jwi35q2VMW+8sVu471yxvgj1E/VlLV26+zqEHC1DXsw3rJR3forf/kRWdC0azBHMBMskywozXngKl6g8hoyly/Ih7Fr3vaMoCJvXHvlMozE+giHhd6672WLhAShNWQZfWZ2Grx7X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785014448; c=relaxed/simple;
	bh=YQxB3tufcshoY4PbIVfE3pYiVkLWqxyBQdxQIQxcNuI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IoEoJiMPjWKvhqiaphaf4P09Dji9Bc4Cm2tdUv7Pnv3ljyWGE40/4NFQkiUqDks6oU9wQBjVQyCj+8W4z+OqunxhwsKHBSEBjZkWNlYyc+GLVzFUxSSHQTCWj6n1PIUIZ5nZz51WhyOB7NXUU7tEjzVgf0da2qn8pc5HCo2gNFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=I6ABaWGz; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="I6ABaWGz"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PK5SH5450911;
	Sat, 25 Jul 2026 21:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Ni
	Ve3PABPbIWKA0WFScd+Gj5OD83nHyw1rn7oQi73CU=; b=I6ABaWGzZt4724yzcS
	XuKBimJWMNV6GsvBvMPTiB+EQdXRm926tR4Qud/5L//IDI4UjnpVYxdaea969BTE
	4VdrBLxqOOWBHgUKr/codfOb33t+ckWHszJaMVaN4+xQ4B4sunL6MnAi8i3vWw7i
	MW+pVXBz1brtAB0YpXUA42wnMmTSC9Lw+Fn0awOECzi8AIibTeDgvGwg+G6G1SaW
	8iCLWPA3fcgaKgSzD+tixqqzNceEmdCqe7SFz6dk0PruJclxVL6/nox+VJxevBlm
	UP3bXUCUiecIsi9hWJaejrom2C3QrReWEfR1dWee7veIFnSSEElzDStjcuak9jAx
	VXHw==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fn1gushhr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 25 Jul 2026 21:20:15 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 0BF5280565E;
	Sat, 25 Jul 2026 21:20:14 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 25 Jul 2026 09:20:08 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sat, 25 Jul 2026 09:20:08 -1200
Received: from CY3PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Sat, 25 Jul
 2026 09:20:08 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWylliAQmtTvlAypjTO1BWKRZijsl5p/2caMqvdm2LLfQumvt4IL4lktsDZhkfCTlmj2MwYNQXl/ng2VQyG40494m6mcd5vdHYO3Oo7hyudKmg23JdTDoTNNmPV7L3LJMFSKaVjlI/JtbdRsSKr0lT92LlID/Nq64g6jXFbS2VeAcaE3ZCHir1jSsocCnxZH64p/EhnAnZoJ3CcbMMYq+90Sf26/AYe0uYDYzjJQNp1BMLzT+Ox62beT6tn1rQXfSMpOReZM44LzGvBpkNpu4OY+4js9CYpMsRq37YBX+oEw+R+Dpvk+8jq1iD17iS2Hxb2qaS+EWmYDAL5jgTptFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiVe3PABPbIWKA0WFScd+Gj5OD83nHyw1rn7oQi73CU=;
 b=hecMAtosN9sKLHbcVqMIl2DDl83MNU0PgaV7rcsaAuD5HiuCxkD5d0G7AI4VJ2qr/P/wjHtt9/POfnWh17IjDIKZHoK0+yJxbt4/jHJNo0xHafKZckhex7gtYK5O8r84KhDG+Gxt8ZoNadCQ6CEVu3duzsvUvfyS6DiuLUwf+IF27kxMip1Dgf1ap9mmsGJxFeBUiQuV7Dlk60Cs4e09HjC3g+oL4j43O6Qy53ulwo/NpKI1iL+YsKJRqivxZbTFwofxjiJphCk3oc4ohnXkBhnBv3c8tEsvC4uA9lTs0KxO4XA5YyZcHSpQn3bVGfgHhxDJ7oiQCm/SZfd5DFMORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW5PR84MB1498.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Sat, 25 Jul
 2026 21:20:06 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 21:20:06 +0000
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
        Brian Mak <makb@juniper.net>
Subject: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdHHtdKCZc5SU/YEadrHkRfdOVjg==
Date: Sat, 25 Jul 2026 21:20:06 +0000
Message-ID: <20260725211945.288415-2-sanman.pradhan@hpe.com>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260725211945.288415-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW5PR84MB1498:EE_
x-ms-office365-filtering-correlation-id: 0554fe68-ca98-40d2-fba8-08deea927fd4
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|3023799007|38070700021|10067099003|56012099006|6133799003;
x-microsoft-antispam-message-info: jdLoV4Y0qR4TG+1a3Q0HnCLcTccKD89eb+cTVbfJGfKCIBHF35bMJ9woa1iz7rvwr5ajoq67bIo2oj12ACTF9SMNiqJa7qSXr048WOCvfISBdfIkee4jetyVvN1FGZjeR9ZwrXxjBANi6h81S2wpB7FLo4c/sCK15927GDMN/mIW1EhcyII/sy+b51NUNQiAAcCRfhDbtTeBmRQ3sizlpgnrNCKqxeRkt3I6fL8AQ91lSmjYw53ABgz/Azm9q0oPRARY7z7Li/oaHeNt1GDWbshEa4Kw+xJTZO3aZ2o/wjLSMiRXx9aXdFW6hrmJ6icw+mVA1ZIIBLegE6J2Ipu0NW9azDFpa1YGeYswlsjRA+mTuSu87K24CerRkM/1x/2cdl95Lu7py1TsJlp8KtefNdOFdQDFA7QX7IxquPy+CNd3ICOVoaS3YNUF+4qtR7Sub5tEHxMQqLzBg/9bzMdVgx7En5bEqf3CcwYwjSwDrZNGQkiANQP2axS+pAx38ilAmcp+fzO89zBm7IGBMB/8pDJDZhWClHoOQT1iQvAMQnRFHKp/fiBpqNAO1Wu2u6Qiw50PmoD6JfNsrmrrY7FrX8l6xmlnDMx85D0LhthsYZ3X3ZWOnJ1fkQXs21Z4dhT79j1jg8lMcnLZxN4f7KmJBFiXtVSgPkKvulfX9EhkDgQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(3023799007)(38070700021)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Of+RaJMMJJpBRxgqZ690nhVbGNGH7ieo0vvkZJjLuSShRNCtr/n1PhOY8U?=
 =?iso-8859-1?Q?rrnSAZlfL0dE8LPA8kdvJAXNW2XhkKObSUyZ45JsDNBDBi+VX+LTDC3O29?=
 =?iso-8859-1?Q?fMrKhMoWKhCSC1B1Fn0vR1xBudTxmk6Ysvzt3cf5KdQ8fPYz422rQvMQlZ?=
 =?iso-8859-1?Q?7RI/rTTXYtG7blMtOkUSAs1rsDdoFAjqbyKhwPyomjVnzIRKl/4kXRP0j9?=
 =?iso-8859-1?Q?y/+uE1IAwx0qTjI2x2jwd0QYUUqQz21zt/5C6fTTYboL7kQeiY63ZLsSgd?=
 =?iso-8859-1?Q?vfRXKWdAwRzw+u0EtEmqMSMyWcJEyeexVCVIn20RWvck2a3CWosbmJCouo?=
 =?iso-8859-1?Q?75wSG7qgS0LIbKLFgB9SGjroe8S9HtHAFS/xqphK4kwwfFfkOELlaTJLbp?=
 =?iso-8859-1?Q?O0Fe90Qi2O7IIRI2+N10O/fh6wE4/y5LYzrUI6ZlxN21WHOcxfqWfc55Q0?=
 =?iso-8859-1?Q?+V8HKG2mClyCTv9SV8WVLg/mTmnt3Ih37kE4VXhgfvg9lokeVV2CtaKv9b?=
 =?iso-8859-1?Q?nTlCc6h8w7t3Wh0BsJ536wewNGdP8DfxtDw8A2i3NlSntJe+5rwORm85JX?=
 =?iso-8859-1?Q?CgworZKSQSyeXpEh/t4w0eoi2b6p+0+MUT5QlB4qUhzhxdR0Ikx48iYSib?=
 =?iso-8859-1?Q?fg7x47GHG5poiEkQXb3L/Rryt9yROZzI0yn1ggzKvmXWuA0Q5Hd5/0Qukm?=
 =?iso-8859-1?Q?g9lAW4EgERt1jOx7L7DONuP1aDhWyxnYlWXACobZ/BiqEiXafL3ekGWF+s?=
 =?iso-8859-1?Q?VUu4E25b8WWRO4kKNmL9/ikBtcAnw+atIkr+Zd3MojUozwA68HaNuVPsbX?=
 =?iso-8859-1?Q?9arV7kB4Vl0p7EvqPSwl4vYHheBdr3iOoloWzCCsarketRKAqU75UmtT8h?=
 =?iso-8859-1?Q?KRCpjgBXu4G7X5LGFHW+k1jlKm4ud7C3XhwdQSv3iZAxrXOcrwRQpEJP0s?=
 =?iso-8859-1?Q?No1SQytfHvJVQKxFcPX4vrNY1aHw0VQ7OVYCCVljPYDDYKx6fq3YgWuEpA?=
 =?iso-8859-1?Q?VnKirtZB8JxXSjC9zLNoTOYm9vLeDhnZz/Z0t+J5TkEGPCzKfy8a+1kl0q?=
 =?iso-8859-1?Q?CQcYIq25YpuYgVEcMJVehM6q1/FS7fB5aNZ93rYJHUiRW5nTTnxzQ75bSf?=
 =?iso-8859-1?Q?DVslD3rl2ppHwxb3iE+5hmksPSOaE+/KKpJT7rys8fssqM3kVxgg7z8yPb?=
 =?iso-8859-1?Q?R4UJGuJfjm8DUHnHzIwPi/TdLhUPuU7Z17UWU6MzHngBEKU04+DRss/o8j?=
 =?iso-8859-1?Q?cCufHFrsz8VeJEjDaMlMbDcSpFr9cKBOUkRk73kxaBBCPYa8Q+QOhqOSm+?=
 =?iso-8859-1?Q?1DSTshShkzS7k7G1fj685mPyBsk66s084/CeUm6/3sqk96GIGRpTJpjO2h?=
 =?iso-8859-1?Q?OkqOsNvlEBgMzIIhBPlhxGhRRWhT9Fg/XeUq+Db3x8d3ZD3UzuCMlxtIKW?=
 =?iso-8859-1?Q?GVlR+QJhyo1A3bed5qYcjJiySKtRwtxK8gR6vBOd6sXWAZ28PvzMgGofQG?=
 =?iso-8859-1?Q?FrxSUwJYrIwC4TDHxVetouBWseOiTeOmEA+M3mvLB2mzN1cfol0JW8RUaX?=
 =?iso-8859-1?Q?rjQmviEh9idyPnsHuwgmdSZ2yNZJe5S3N0LqrMnB8HSdjQHmIdoR8oW+u3?=
 =?iso-8859-1?Q?n/BE6BvpYeQMMihu/APdfDxOYegzRNYyN0gFQK664SPViOkoKBDG/TUVhr?=
 =?iso-8859-1?Q?h6qoX/yeXc35LbEGIqZZCWrRdPSn8WkI9tH1qD35DMKrSL7O3koU4epEl0?=
 =?iso-8859-1?Q?53pTyyhN6Nw3DscuH3j2upvxX1PtZqL5f8nhxDB973R7jDPRqDvbgUTJB1?=
 =?iso-8859-1?Q?SELa1uVPsA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: afmiEMUfViQcDcilBu3VsIvjKmTB7d+5siET8Kuq09ppdeH7it2OqfCzjcQBLQsAKr2dW7bNMMsnToRdKCZ+bmNdKK1JerdaXEdsIGh5/yw/lxCxpptgCeomFqb41Vv9+vlwxzcDbpv6mY7rro+GavVYxnKPbGkg4RycKSl73ac2gtnso9ugESZPSUYQisOcH/VPdSsWO1aFCVppsweq/ZoLLzCRTQmx1y0kFQYVRutOMA51bIci64J6UAYy2lRDEBkamaTc5GOYAowuFlowom7oHNvwVlD/wswIeRFdiE2SJRkF2lYUFQGHvLbFiia+4Ib3lEh99F5Z8RL9FMSl7A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0554fe68-ca98-40d2-fba8-08deea927fd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2026 21:20:06.3910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ME0DHdsVCNc+9Y4hcEvrtzH7HUeGG9Sqt+VR5anHDEnONHxnI4JolOrb2hcbI3jf4sjRMVz/pDoV1FVAAy4iOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1498
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ZJ7nX37b c=1 sm=1 tr=0 ts=6a65288f cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=0tmZBUMiZGfltDqTPNIA:9
 a=wPNLvfGTeEIA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: Wm3aXuUnrDj_96PtPG5u56r5un3G6jGD
X-Proofpoint-GUID: psf0XRq-5xi33-3AD8mr4fl7zWJYzEFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDIwMSBTYWx0ZWRfX5/3bJttPY4KM
 BUehqVGRp1yXwU3W1ItVQRmt2zFcT3TvxViXj9j7DELuYeEFON8JM950lgPPSubyWzWaZ41CB4R
 rQFfwYmybCcEpK+zllrd5/WS6MzZ+0ta8PcnNDdtvq6ce0sfOzIhwy37BNsuwnyfv3iYsmY1el/
 zmbbqiBFIgPRqdC7h1o+b1DqhNjWscY7vgR04alfS312zR9AgOaggdDoKmojr8rDbxkRFFBy8MD
 4gT0iPj8V32duxSUdUza6P9NhC/ywOio+J1zQYMJaqPxUXdB4sFH51IeqQGEbIJ5tVqojiEcBr5
 8fN1DsvQ1+7JcUsKt6Zxg2mp47i4YoLY5x2hoS67ETlIxJ61HdJF/Fv7IcxnnxTfxFhalohN4Ap
 LHGH/J4fy3/hfr9NvVuLYrqMBnZXKeK60V6n6hicKQwtkof6PI7TPNdOC3xIRnzssrfC2NYDlOC
 mUJYCo258090eZB7abg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDIwMSBTYWx0ZWRfX+wdn/zPKcGT/
 cZ3W6DpkqHvjicOfBp5KfZpnbkcBJ9w20sq7rQtfBTcpb6EY/UobcgKfqCPgAYj7AhKLqHHvTyd
 fkv+mymiNe8QR5NjRUef0zj9nDi4IfE=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250201

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add device tree binding documentation for the Analog Devices MAX16545 and=
=0A=
MAX16550, and the Volterra VT7505 PMBus controllers.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
Changes in v4:=0A=
- Add an upper bound (maximum) to adi,rload-ohms.=0A=
=0A=
Changes in v3:=0A=
- Clarify that adi,rload-ohms is the ILOAD telemetry resistor, not a=0A=
  current-path shunt.=0A=
- Note that the severe-OCP filter retains the existing hardware setting=0A=
  when omitted, and add it to the example.=0A=
- Move additionalProperties after the allOf block.=0A=
=0A=
Changes in v2:=0A=
- Represent the severe-OCP deglitch filter in microseconds=0A=
  (renamed to adi,ocp-severe-filter-us, values 0/1/2/10).=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,vt7505.yaml      | 85 +++++++++++++++++++=0A=
 1 file changed, 85 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt750=
5.yaml=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml =
b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
new file mode 100644=0A=
index 0000000000000..ce5e9456c3183=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
@@ -0,0 +1,85 @@=0A=
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
+      Resistance in ohms of the external telemetry load resistor connected=
=0A=
+      between the ILOAD current-output pin and ground. This is not a=0A=
+      current-path shunt resistor; it sets the scaling of the reported inp=
ut=0A=
+      current, output current and input power.=0A=
+    minimum: 1=0A=
+    maximum: 283383959=0A=
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
+      are reserved. If omitted, the existing hardware setting is retained.=
=0A=
+    enum: [0, 1, 2, 10]=0A=
+=0A=
+required:=0A=
+  - compatible=0A=
+  - reg=0A=
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
+additionalProperties: false=0A=
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
+            adi,ocp-severe-filter-us =3D <10>;=0A=
+        };=0A=
+    };=0A=
-- =0A=
2.34.1=0A=
=0A=
