Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4C311C32;
	Sat, 21 Mar 2026 18:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116747; cv=fail; b=W9uK1sEguFd4k/IVj2LVSunYCwg+pGAlogllT1cs5PacdgiR8JTH/QbsMdrwyKeo73/D24coGaYLJ69HcAW+1kMqY0/K6SYIpD3KwCHXJ0AkZFG04Usc5bStbdgr9vmvgak5yjKDoyl9CKZpKMBwZ8eYmCuWF1QHer0WeEj3I40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116747; c=relaxed/simple;
	bh=OzrFza8H53p4n7wvPetIbf27NoWxYlHjs8eRTWWwzJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UE9swoY5bGBTAS//MRJv+Uw6CL0ZdXsT3YIyL1OcfQQVjJ3qW9kcRkZF4Qa8bWccKgeXEvxEWfmwU9EFz9XY3elgiHhUg44+2N+y4MgmAeAokFHpqS1p+x0KL8wuLOVqOevUmMMCj3/GPDBAyaGO6bzCKwfXcYK4Du5X1+wdMd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=n8wMF5lX; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="n8wMF5lX"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LF4GHZ982849;
	Sat, 21 Mar 2026 18:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=W4
	B659lFA9BERi7CDAd3/FQC4uLfHi0CLKHZ/V9vVUg=; b=n8wMF5lXpKTG3HUI94
	y3fztb5oFsNfZKVVCDfnLT8XQUajY1ox+06LOLdBBojrpz/yGr5TCTxkRtIJ5Tjq
	pZDZ5z+Ch52zcSh3CM5tXcp4IL3fPjWvlVqKk3dUMahG8Wu9aOOhOmXh09vNqak9
	RjNVDNxkmglrMiNKKxJ3uZEqwRcIgzboumdMIrdB9NSZ42xhoiqAir/rG6+TJKJk
	w1iVy1hHbAKCs7UwfYiBYlfVJnOVQM9GPIyVI/R8eIyDZ6TMCT/DINU8nS+EQBFU
	OP655ydrOvGs53gbrJDDD1b3kBzjL2n0LOZ1T3gEQjI2zJExEqgzI0m5mbUjc7jw
	8sVQ==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d1v0nhkp3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 18:12:12 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id BAC38D273;
	Sat, 21 Mar 2026 18:12:01 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 06:11:49 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sat, 21 Mar 2026 06:11:49 -1200
Received: from DM2PR0701CU001.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 06:11:33 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mS9akum4fRGFJD4zxRquLzqhJsnBgQKoBY+I+RHBCKnZoWNorRap1022cJ+Z7MksANQ6MFBxuhh4xqrU2ohbNyjMhIK4MRjSHOPjHkJz8irfaKq8ybQmbKrI3baux93eCrtfc9bOsknnXqLmZp3sHfTuhKG5KAs5Vn+BphUk33qdwLAHUSqMjc2JJmzReNjGAawvDEKWCcGyZ6DogW1GvSUpGwQmJGVVX1F0f9TCT9SdPzBWrugLGxU61dIMug3Hgzpf6Eykl13Z8EfPcy3A+70KINhoaZ6oqUgNHK6WnYwMuOIjzMhGuBU2botwFiO+5rCmV1WGYf8Ojb73sVdOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4B659lFA9BERi7CDAd3/FQC4uLfHi0CLKHZ/V9vVUg=;
 b=Ytz0xIgArB5wttt3JOFUDdLDgKU81kngsUzXGMFKCOiPwEPk9eLHJHwMHQOaKIh5v9v+LAx1fD6Hfqk5mxR6G5FQ3tWk9EkiflFeVfCqCquRH5POwjMF/1QbrzOfQ9GtKcRI889K3/DQO1EdVAk1YQKTQxDZ26nY1smrKZbseOlYDkxPn9GsZtZGgosUdrdDAqkFa/MR52E6WQPN40c/U4ZlK3tuQeRk2xQEy7xfuyT45+BCzef4nFYXnmH0wM3FtrLBV1TivnzcE4gFJ3CmesM0Nc+Fg0qgvSglAVauwnnp/POfEf6pHBpHQoLW+UOes7Y/xCypgioLGfXhCJpiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SN7PR84MB3208.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:268::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 18:11:31 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 18:11:31 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v6 1/3] hwmon: (pmbus) export pmbus_wait and pmbus_update_ts
Thread-Topic: [PATCH v6 1/3] hwmon: (pmbus) export pmbus_wait and
 pmbus_update_ts
Thread-Index: AQHcuV4kyicNodFaPEeTJJD+DGScEg==
Date: Sat, 21 Mar 2026 18:11:30 +0000
Message-ID: <20260321181052.27129-2-sanman.pradhan@hpe.com>
References: <20260321181052.27129-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260321181052.27129-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SN7PR84MB3208:EE_
x-ms-office365-filtering-correlation-id: 4215a633-63d8-4455-ceb2-08de8775474e
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: XC14lYzoyGztfmcKVmlaMgUhU8Np1E7B0DM1hVfHpr4vHs+xeT3cnszAVxKiwS6JFNnxe6Giy2MUZfEpqeo5YpYqvRr+2xEnMYnXN8EDsrp1GtqmNphKNdedIAdL4+wJvJ50nVxnJ3TJOGT0KB0S4RTXUODnizRVcy9bAwNkJQ6VBcKDkIPN0I6nNCA5YWESDjd/blf5p7UsJ4UTLty5yAff3PzqwVghh2zP676Va3yJ+WQcnKei15y+/VabCwAX97B1ehU25Sk5EOKbN2hHaWkm4U68T3ymaIvQqQntBLUF2UFr3AAlXwBxG8N7p6BrIUGFwvstadFy30ITbs4ErFz4zL8DZi4VSN7HAB41Zzf6mL0V42J0AAv41ETireXIoVsAOGTatXL7VbOOrTd69K5DCEEVrjxpWBeMFgdunn4XHZzZ/0Hg4XacQ340plImtm+W/Y/IGwjyqaUg5XUbvPO6X648JJzfNEGRk0zas7csfFT6VCqwmK4TbylEE6qVjOVVKlKqyIj6TtXEyjN1wgWi1oKx4HZA2/bRxwkC9bpDMSv+XItuUhIkSnoD7YwAUqD2tvDGzeQ8J0lT3rX2Lb9ZDZQUhvcFUTi5pkufxdFwvp3AG/i8M6cmmPW2VtakOwd3oe2Syw6BQii3gb4Fep8R+mX3wQvN+rZca0PXUsbAsQQCi1uR6MXTUMUOG0wN+ZfbGg615NJ2kRFsbNIKdMeke10a+IEFTqMM+pSmtUZSEIWk9WJ1LFQub4Fi//yvvz7Qm6Zo6HUS99+9eYRs6uF0zgXjvp62c3Nk7sNMFPc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vRSzsexkjNHoHLi+qv7l21NsddkmfzTQELLmhU87XhmiUFV4SAEM9FoDS7?=
 =?iso-8859-1?Q?04sqzHNmsM+GOpRAl7a7EVoWqyTSQLqd7suVIKJK4/r6hqeNoZdXcp7xfQ?=
 =?iso-8859-1?Q?EbBnqBHxAzAqc8DhtGnOEWtqVAZ8VM0TLpyxEO8Y/P17K0Qu2JtinXfyGL?=
 =?iso-8859-1?Q?03B6QoIcUM7XfhwKGL5hZMbftruWXg8yZefpisX593Qa7Ov9UqMdVzuTrj?=
 =?iso-8859-1?Q?F0Gx9vgYBrRnv47QD4mqqWp4YKN4Ns188LoqjbIYIiBUfcEITkeY5XSKRG?=
 =?iso-8859-1?Q?STCrwXTuOU8rFDLBfz7aoPL1vvrQSPkjo2XWIxj603xbd/fzYmlYVWMNhC?=
 =?iso-8859-1?Q?a1JXGlqCKk12dCxeK0ToS0GNEGeVTu7S7tH2kfmU85SeKpGIdDhAJM8Zvn?=
 =?iso-8859-1?Q?buhJtZye5YMbAasGmxUIOYjBwfBUK8q1tNgUS28mUSe2D55rSNYmKNoB52?=
 =?iso-8859-1?Q?vOA8Qo/uWtWmJnkpNP7I7K2HXjZry59hhvcd7ZthCBlnjh7S5IyOSOUz2U?=
 =?iso-8859-1?Q?rlgHEoRPrCk1Qoh/jEkV5jE9EZCLZ3aGdMIGBSx/ncqLloonjuhzuAzSsK?=
 =?iso-8859-1?Q?/IdRBlivslVhpm0rfbV2ZUOr+nRSmo93M6+kTc7kNpxVGopT8DLQ5/xRM6?=
 =?iso-8859-1?Q?W3ZmhNfYsWIQgJ0+jKljiwhi0t1meiyB2KTgi7FP8Jiw06P08EuqGUQgr7?=
 =?iso-8859-1?Q?GXPkWFL3j0IgEI3F5Fa62lfAmYtGYbgen65aiw/3TgyF8HFqfw95nT3+Kq?=
 =?iso-8859-1?Q?PCl+5BPcK7soIFMOCExp7UY0T16bYHjLBewThAJyEPWGb9I9g0a+ufg3/+?=
 =?iso-8859-1?Q?VhD3FIDuf6KwmaF3CXFKdj2psnpZo/GJ+7COwt/F8l5iM5R+9PhxDfT/Wo?=
 =?iso-8859-1?Q?0kV+gaKHWO8BaMntpzSRWtIwXzOvA0oa+Ty2ouHW5mWMxqRKVEZAr4vpmF?=
 =?iso-8859-1?Q?lMMje4WHxBU5EGlrOSLD74qVhCpHE2108Z6ofSURw7SeqQqFNQN4/ejfmu?=
 =?iso-8859-1?Q?XZM0CGfpSW94+YVG8OVEtzl26xJIPvp8klQySgf/IJW8c5orQCnFCTJBbQ?=
 =?iso-8859-1?Q?1xyVJExRtUOmcQkRIMCAVNBt8+27BwcWsGxmfTT2Ke8kn/8qrHm3RQaAdA?=
 =?iso-8859-1?Q?Qz5WGp9VjCsovmM2i4uM6vC5N6+UkSK6ZTL3ymPpRR3aMG4Zaj7GDG0xCN?=
 =?iso-8859-1?Q?gvK2BuRa0/+uBik2lj4BAoWBPHJdeqUYoht/pLW2YduBGm1DY8gxgW/L55?=
 =?iso-8859-1?Q?Cqn1FEPUBTjSG3MEZGeiT/TH50dtsaj0Q0w7ye10Nb9sW6OVk/F/CXvHbf?=
 =?iso-8859-1?Q?E2jEySVUseOkbCeXQeJZExmAeYosQXC4/5luKOEEX7pS6vLJ8IDMX3i8et?=
 =?iso-8859-1?Q?B2Y6J8RC5o8EHYYL/I5+F5kp8z/Hh6d+aUt3yRE/Crl5fZTw5e2Aen7aLV?=
 =?iso-8859-1?Q?vHbBtTolEdAwGMp02CA5wJ9U/4VpxQ8k9mSMCfEO5Q9ldGj9KyPePsfcTq?=
 =?iso-8859-1?Q?uJoej7MJJ93s6Z/PEUxk7COqMuiL/OqQ1tuZdnxWA0wM9FtDsR3OJfu6hQ?=
 =?iso-8859-1?Q?R5GuYintKe95riD+1qxmxA3z4fQpzs5ccen/iTLeqvVPLvb2US49Oqz5qj?=
 =?iso-8859-1?Q?5qx2snfyM6g7ygMoUkXs0kSeF7DgoWEX3ub9fft/YIXfGAzbTvAwpKjyfr?=
 =?iso-8859-1?Q?UjDFbtj6wtNIHA9N249Uz3A1n98Cu16Uv9Qc95zkgYqmnibYwiX+T19K4h?=
 =?iso-8859-1?Q?pMkadvaX+sYj++w0ZDnyLrhTDkc7orx/tZdfMedOF44nzX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MWuJEPKu3USsaLUnv0EeLbdEM07Yeg6Ahacj18En8mclHAebSWabCFTkX4kamsa0OSp+ZZ650xrPb5wKxHlP/bWuvCO0ZxDkeumTD+eKaOrvSJ0ba3cwjU4f6ZCXniyenEGttmzwUdTcby4PjK2YpIHpB17YvEg9t32mIQ2Qt4vOsvrtNTsYYzw9Ybnizy8KGulzec50he7HdYVAv8YY92M/T6NORcEgPsvLkiM3NAPW9FieloZExmQEwOlJ6Jkx+nhTqC3piu5GuyieXQ8frhV/65ejpT4UJbdf2gBzzlALQth/WF0Ng9jGDDrI+oMvz3s7bUa1iQbaG1Qecb22pQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4215a633-63d8-4455-ceb2-08de8775474e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 18:11:30.9875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJSo13TFvkjvO3JQNcVvANpcoqyL3EhKuhUSCtCdv90JJr4SOsjD8cJAXSmhLsqkeME5huCd1X/TeQclpzIU9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR84MB3208
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: wcpiBOdTv-C1g47fVD289_4LTXtAbb-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE1MyBTYWx0ZWRfX155CBT1xMhpG
 mgMYWwaIVsai91uG9XPyl0iMMGn41fW3GL3vce3pJ96e5pi7XEUTGW5yUr9o03utpCWcheQ42VK
 rFhIO0+OytEZd62DYWK84PpEYHOX0vN5e4iSMNEqnw0rRu9HnttUqpCOWJ6XHschf6lpYqT8XC/
 W2X9/I3hNLOpQYHFeRE12uiIOBa0FPjipBfMQjF1PSXN8PnADcrUhEzKIUKi0jcrAPc/KGfaNpS
 sDRpoUnYTA9zw5d8fYxvUuBNZLb7mUgvLfEeh33OJwEVTIwk4YSI/NIrYYj4yaxO2wcH5ale8Ng
 PkNX2e/OxZF6rLFpBlFcfUOvuQ5ZCSzQfcULevduRoekOiPo1mHTys7wA6hfdyfuBdfwSJ13GRn
 1V6t8HvYbsbJH4SbwyebZ9csPX0ejjKWQ8k+vBwf+SMxyrW+mpdAoDtK2w+SR9ZOBqu2beHvIqt
 NbOwJEuzuLRR/8HdTrw==
X-Proofpoint-ORIG-GUID: wcpiBOdTv-C1g47fVD289_4LTXtAbb-s
X-Authority-Analysis: v=2.4 cv=Sej6t/Ru c=1 sm=1 tr=0 ts=69bedf7c cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=OUXY8nFuAAAA:8 a=nH3FplcY2SvcWnwWU-MA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_06,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210153

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Export pmbus_wait() and pmbus_update_ts() so that PMBus device=0A=
drivers which perform raw I2C transfers outside the core helpers=0A=
can keep the PMBus core delay bookkeeping in sync.=0A=
=0A=
Move PMBUS_OP_WRITE and PMBUS_OP_PAGE_CHANGE from pmbus_core.c to=0A=
pmbus.h so device drivers can pass the correct operation type flags=0A=
to pmbus_update_ts().=0A=
=0A=
This is needed by the max31785 driver, which performs raw=0A=
i2c_transfer() calls for its 4-byte extended fan speed reads that=0A=
cannot use the standard PMBus word read path.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v6:=0A=
- No changes to this patch in this version.=0A=
=0A=
v5:=0A=
- Removed spinlock usage; pmbus_wait() and pmbus_update_ts() now rely=0A=
  solely on update_lock serialization.=0A=
=0A=
v4:=0A=
- No changes to logic; standardized on the Juniper email address to=0A=
  resolve the From/SOB mismatch.=0A=
=0A=
v3:=0A=
- No changes to this patch in this version.=0A=
=0A=
v2:=0A=
- New patch in the series.=0A=
- Export pmbus_wait() and pmbus_update_ts() to the PMBUS namespace.=0A=
- Relocate PMBUS_OP_* bitmasks to the subsystem header.=0A=
---=0A=
 drivers/hwmon/pmbus/pmbus.h      | 6 ++++++=0A=
 drivers/hwmon/pmbus/pmbus_core.c | 9 +++++----=0A=
 2 files changed, 11 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h=0A=
index 3ddcb742d289e..deb556971a726 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus.h=0A=
+++ b/drivers/hwmon/pmbus/pmbus.h=0A=
@@ -424,6 +424,10 @@ enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd6=
25mv, nvidia195mv };=0A=
 #define PMBUS_REV_12 0x22	/* PMBus revision 1.2 */=0A=
 #define PMBUS_REV_13 0x33	/* PMBus revision 1.3 */=0A=
 =0A=
+/* Operation type flags for pmbus_update_ts */=0A=
+#define PMBUS_OP_WRITE		BIT(0)=0A=
+#define PMBUS_OP_PAGE_CHANGE	BIT(1)=0A=
+=0A=
 struct pmbus_driver_info {=0A=
 	int pages;		/* Total number of pages */=0A=
 	u8 phases[PMBUS_PAGES];	/* Number of phases per page */=0A=
@@ -541,6 +545,8 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,=
=0A=
 =0A=
 void pmbus_clear_cache(struct i2c_client *client);=0A=
 void pmbus_set_update(struct i2c_client *client, u8 reg, bool update);=0A=
+void pmbus_wait(struct i2c_client *client);=0A=
+void pmbus_update_ts(struct i2c_client *client, int op);=0A=
 int pmbus_set_page(struct i2c_client *client, int page, int phase);=0A=
 int pmbus_read_word_data(struct i2c_client *client, int page, int phase,=
=0A=
 			 u8 reg);=0A=
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c=0A=
index 4d7634ee61484..ada962d9d2762 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus_core.c=0A=
+++ b/drivers/hwmon/pmbus/pmbus_core.c=0A=
@@ -36,8 +36,7 @@=0A=
  * The type of operation used for picking the delay between=0A=
  * successive pmbus operations.=0A=
  */=0A=
-#define PMBUS_OP_WRITE		BIT(0)=0A=
-#define PMBUS_OP_PAGE_CHANGE	BIT(1)=0A=
+/* PMBUS_OP_WRITE and PMBUS_OP_PAGE_CHANGE are defined in pmbus.h */=0A=
 =0A=
 static int wp =3D -1;=0A=
 module_param(wp, int, 0444);=0A=
@@ -173,7 +172,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg=
, bool update)=0A=
 EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");=0A=
 =0A=
 /* Some chips need a delay between accesses. */=0A=
-static void pmbus_wait(struct i2c_client *client)=0A=
+void pmbus_wait(struct i2c_client *client)=0A=
 {=0A=
 	struct pmbus_data *data =3D i2c_get_clientdata(client);=0A=
 	s64 delay =3D ktime_us_delta(data->next_access_backoff, ktime_get());=0A=
@@ -181,9 +180,10 @@ static void pmbus_wait(struct i2c_client *client)=0A=
 	if (delay > 0)=0A=
 		fsleep(delay);=0A=
 }=0A=
+EXPORT_SYMBOL_NS_GPL(pmbus_wait, "PMBUS");=0A=
 =0A=
 /* Sets the last operation timestamp for pmbus_wait */=0A=
-static void pmbus_update_ts(struct i2c_client *client, int op)=0A=
+void pmbus_update_ts(struct i2c_client *client, int op)=0A=
 {=0A=
 	struct pmbus_data *data =3D i2c_get_clientdata(client);=0A=
 	const struct pmbus_driver_info *info =3D data->info;=0A=
@@ -197,6 +197,7 @@ static void pmbus_update_ts(struct i2c_client *client, =
int op)=0A=
 	if (delay > 0)=0A=
 		data->next_access_backoff =3D ktime_add_us(ktime_get(), delay);=0A=
 }=0A=
+EXPORT_SYMBOL_NS_GPL(pmbus_update_ts, "PMBUS");=0A=
 =0A=
 int pmbus_set_page(struct i2c_client *client, int page, int phase)=0A=
 {=0A=
-- =0A=
2.34.1=0A=
=0A=
