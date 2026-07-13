Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8002857CC;
	Mon, 13 Jul 2026 01:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907788; cv=fail; b=hegTLBTDzJuCQP8+5nn+hXRh3gmK5ryqOWbaytWZ02JxtQBW7MlBMv9yEwtzAl8PIN6nQMvWF5+AnDcHkGqY+h3yLqL23w/wLpDyoaj8au2x7O6Kf94CDK4XcRASUv2LcvCDZeEt1MFceN5OF7Jj5L2wABjWI4zFWcibQN7SqjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907788; c=relaxed/simple;
	bh=Hrgb0+je8xbRqWu2M1eM9b0KVCypnP8fO+4CxhI6/N0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L9gYVe9ppejzRQwKaLmNWlfJUdQYu9vKcofoWFUVI0LPMnLlzf/rW/xe5Wn+KpRAzoQ7hgQAwKSTl2mKiqPEOfuL6wcUU8JdNTDTwnm7KGfPhmAo00Zv6Vv98Jc/fVvbcGhe5Ms3htBYvIS0P3hnybKOBgJ/dczR5w22c4nDlSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=SLknIm38; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="SLknIm38"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNXkB42055641;
	Sun, 12 Jul 2026 21:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Hrgb0
	+je8xbRqWu2M1eM9b0KVCypnP8fO+4CxhI6/N0=; b=SLknIm38g+pDVKC28b0EX
	TXFXpH9TzgRFl+6o7e0dWXo1LUKmumlXWJAwxYu7yiDltvuex3Mxw6VGRxHfQNno
	NfWsPt5MsNPrl6JV07tsZ5TkeQ/iCWoaE3dgCQbajluNgnPQDOcsyKtX3L2tt677
	H/+9e2AajosHVCF4SCE/mkesNVby0ANqnD8OiVSs6mpCVEDnIWo3+CocGYefZeQ5
	PXm6Ml7Xz/1307Mi8vnwKyQMchyBi2XViauUZh/6p0pmwYpUqmegNWQ/IEdDQPp5
	0a7FG6Rir3c04nLO7Sl0TdJjugQOX4HhpnQabb5aEt5Cw5K1HlUux+RbfUo8y3TK
	w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fc75fhxk2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 21:56:00 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2r1T0s72eG+9SsEqORX3NnrcBOmEwoiLzDAWIN/Vl90TKsPyo3Fofc/71roRK0pyHtvjWC4jQ1u8+h4y1+nWsI4dcMUZjkZPymwMSnBrS/OgD0CVOh/Yp9pqUQdf6yuOzHNFzY9Gp5dD5iJUSN0GIpRTSruyvZnhPC5lgQeQBp2MfEhmVKoOHDrdz+wxVVbuw5kzPibmOCdCRINz8g0UDCULZbd9AZy0l1ufnqiBlA2mjJiefkjzQepVGdxbb4wEdol20C7pmRfxlF086ym+cyV+B6BcjZ+1KFTkk0kWIn+RQiBCWJyrhX0U6280gJffNUsTpKaZDSaXLrDhXrtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hrgb0+je8xbRqWu2M1eM9b0KVCypnP8fO+4CxhI6/N0=;
 b=qk6zp9jF6wplVHwhIpeOV+EWEDueYwjFeXhTU9SBRyDVB7KaAYVujQxH78lY3IJ8aNq1ODy9ZCmiBnib1cLntyMGxjuxs7F+liPP+Wul7sOheqfBEwVbJUtVZryd++2kw2bFHLwKYCWO4QPTs3vFTcYzM06BQaUGyt6WGcayVLt21sLp1tut9xUog7JyqhSYdHh66nutak6+JpaOuXq/zgzchE5VkZdc4XIVZ18467va9cjIhdcnHKr8jReNiGLACvo+MCkQeTK9ISQn2fp4MKh8I2zDq2VqEUD7IvFr19MJHrsXSonoCxUtLbgvOGWB3JEyTDoIHf/YmBgrVTFeQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by CH0PR03MB6017.namprd03.prod.outlook.com (2603:10b6:610:bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 01:55:56 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 01:55:56 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Thread-Topic: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Thread-Index:
 AQHdDOxxzu1e3Sp4mEyeW6BY1zw6brZgCpgAgAAEpoCAAKFGAIAF3wsAgABK5gCAA9LJcA==
Date: Mon, 13 Jul 2026 01:55:56 +0000
Message-ID:
 <PH0PR03MB63516DD874DDE8372558CE12F1FA2@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
 <20260706-neat-perky-malamute-7518b7@quoll>
 <PH0PR03MB6351C4B212D2CCBA3F1BF113F1F12@PH0PR03MB6351.namprd03.prod.outlook.com>
 <65ebf21f-5a23-43b5-b10c-684fe421b0dc@roeck-us.net>
 <20260710-acrid-enchanted-prawn-5de949@quoll>
 <6c26aa82-2efe-4493-8992-b6d2c5889fe5@roeck-us.net>
In-Reply-To: <6c26aa82-2efe-4493-8992-b6d2c5889fe5@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|CH0PR03MB6017:EE_
x-ms-office365-filtering-correlation-id: bd655abd-da32-49a4-63ea-08dee081e11a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|3023799007|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 WxFefR9V4BKdGK2shsnyopQW02eeNeHWyczL5Z56mggLlkm5OwR4pJsFekARWRXkdb36CBxvs4A6PlLq3rQDdQJB3aWrANNei5/CSjNyxKxgJ7Q4HE4v9w+j0O+SxDc32aAPFNoGr1aTgIC1HhfT/jj3J5KW0Im+spDP9L1vqHQHK6fuIX22dZwmy94CSqL+k7JjMn+yeTWQNsWb1z8sh8+Fd734DGWqjxXoazu5sVgFwdnIT0GCY4ALyQdJZdayIyzniCTFmzRIbMxJFXUniN+HszmMrRTrPUitSKInRI9PQXROCEhhqW0/73NokCYadz1NEIJqf4Ra2ZO3sPXQ1Y/9iJbFntevPcW6bH4g6tyq308yhTUt8QKFb42pboQem1jINazVmyPAoihKqJ/4XsvjXNI3VZnZuKtlXosfzdFdAofl8k6CPD4jvbEdO9s2mii6+9aHA8J2eae3injVUJRefynUOI+Jp+3eiDi9lHktQJ2JZO0osGlp4c7CF5m56Kz0Gn5gwfmMrfTtETTf7mXz+1HrHqAz4Yip7DaqVJS/Be7NzbuKLompz4qFMFxVB8DkgF7flHN3FmtbAFzcGepB3c65Ua63PjS5Bm5euI9oyhclU+DdEUkyLic51xJOYKs3sRisBWrF76W7NhlCOayZ/3YVQTSFPdxozJAJYFPc7eqlC6b7Im5giQFN6H4gYKgo+K/LkhRxNF8tc3o4hV0p6g2pJAzpLneVsF5uo+0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(3023799007)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W5YJ6P/w/KXhG5SKQYqzUJeU4THsjQ2Pla3CcCASrbWNq/xkhEycsxGk1az7?=
 =?us-ascii?Q?SVQZtZRxu/kKB7lFtWmx1c0WeCOlCHBBFUtCUW8X/YiHUmfxPWsc1ysCUgjz?=
 =?us-ascii?Q?nVoapq6akBavEulVn6GEkEEaJBMicTUh8n/Th4BbnGb5JU7te544tzt7XQcU?=
 =?us-ascii?Q?kGB2VmZ7lgR0Q2OVLcMrr6PtvIhH3liAfTDNXfn+b/IDv8Kz1XJEahAc2vak?=
 =?us-ascii?Q?GY6X/smwCJMIGa72YWQjQDgM7jHf8zT6rU60705sztSHxyBFmDHgP/lGdmn6?=
 =?us-ascii?Q?6s+NQD0YGrYBdzn8mjfBPaeehXIEngQdp7HnSItOCfOVZl4KOoVdAtEOT7h3?=
 =?us-ascii?Q?gvugd3JLa2RYLDpaUCymavGHJ+KmBPh0befVS9fOWRp/unRegEt+ogCyw5s5?=
 =?us-ascii?Q?ZarNk0CV0yjkteTo5RahBUrB2Fb7gAzAdoE6lZl2xmv6y5VnVbszPHPRPuIa?=
 =?us-ascii?Q?miCzPO3qN7skywioKLhVoRYyJmwX4ZfxW5QEGW6cWUQ9PUTiO/uzOQVxFfZL?=
 =?us-ascii?Q?BT+emlDME4p6u8VZYUlRWWqmzGGidApE0S/q+26Cg9lIjcQ8jPnaTueM/ZDy?=
 =?us-ascii?Q?u1zXnQbFMXm1+gBTCO8ra0X7ajwsvsGV/S/qKkYg6LFeb0K1gkaXpSEYja4Q?=
 =?us-ascii?Q?hmRmgvrFacgdbdwoNo+mXusyg7M43kPdNiAi87yeBw+nz8NO3rVq9rizJ2gk?=
 =?us-ascii?Q?ru8+89ZXk2NQddOcVbhDn7YvUpR4hlxPIJinagbYEXRTFOxTyQax7WPZ/eqp?=
 =?us-ascii?Q?KEWDpHOEWD4zTCRjWG3UM2tXWrynI/4agKuHu8Uvi7DmaZqJTu1UB8hADQt1?=
 =?us-ascii?Q?k37mZXbnuYF7fmpmmlPbIjQhKt55HGKWS+6Pg2xj85ZryA9BilKdhrxlt65y?=
 =?us-ascii?Q?8IxUDOckeouEAAaV1hodxJ5Kc6BD3+44d/ntjodghQVz/nd2JLhW1nDTQkOi?=
 =?us-ascii?Q?Sx2ezeZoEfqu8JS+Wjq7Ac34MoaEwoKrMtiQ++ErQdVd1+V82rJeh0qJgz2P?=
 =?us-ascii?Q?m2LJaftbozkIKSjKoJhxTQyjRUc28RWdpBpNs1pYH1ed2RBfhcQPjZ4Zkk3u?=
 =?us-ascii?Q?r3Dvvuk1V8gLZ2eCwNG8U/69B2cWusiiFAAfzP19uMeBmFsVrwzr2mmkWEqL?=
 =?us-ascii?Q?ySijSdFEHV3ggnGHUs9LE9/JIQ/Du+wvnDi+B/7w4t1YhsDqVPTL7HjjHTef?=
 =?us-ascii?Q?O0IfpOuilxPTrkLQdqLiimOfDsRpOnRhFKf8Z/MW7m+TRSyWnJ+/cxaxD3zF?=
 =?us-ascii?Q?wo7KBVB8S/J3hDBIdXQYkKC4H0geYtuK4dGqGUDs4BT6gxT0BaJNdF9iDTgf?=
 =?us-ascii?Q?xr0IjyqBH+yZ9BMognX0zzK/Ja3gWX14nSqySB3va8jHCWwNWnR85yK02VuE?=
 =?us-ascii?Q?7n+nkme+yDXm4yN7Qw+QDwHNUsFXAWBf7UDhRVTVb/CnnQZczZiVnHnOBbu8?=
 =?us-ascii?Q?lciZRhPLBhJaXHCAbeJ54NzZpPCMLEOgaoYKvgToCTdvZqTt7lHJpL5BF2Eo?=
 =?us-ascii?Q?sr8AA/tSHRrvTZOojugMFk2L8s1QxL9dQSD7r75Imn1W1vvATf46067AZATF?=
 =?us-ascii?Q?cLfOJofLGbR7BqeZ6SEn31Z3FQ6YHaQ5boQDDRHj6FtJYqfi80rjtrHJHEMC?=
 =?us-ascii?Q?aBsJsr0uv+0nl3YBUV2RITJhcnVDEqt8q362QFP1Wai4MGbMpYUDDTqoy/vH?=
 =?us-ascii?Q?8ZgHf/IQh9ijhHddlEAMbmRJ5mkjmzV3/SqudUaQNDRguReyH9wJynmeysGj?=
 =?us-ascii?Q?QIeKAyxgYpCv9EcfkJY+NvHycXVxd2E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	HVIBP48DiVqRQ4CpjHSEXkQ09LN5yQ+V9ie56/mIM2rUadDyp7vXDPqOYnQEVw1nfkXTOuZBPCWdgSNXeVANWhVF+fmIoHefeFPjShY6P6ZRTEBS2d3S4xBXokTzvNPrKEhQ5V6SBpXibLUDxwRAwdBofgadZI2h2YmkcIlLYtxAk5Edww90SW57UxQW2luFU7Dt6+S4BPbOiG6cYOtlU/Io5ljYYt0mIa8sgKPSf+RFmSMBytJkzRFoHXY56tGWYMXPlbo7kNJUWROfU4eeLbSmVbN9bDdi1JdTV6c2P4H0GsM+1NTWpORUtUqK6DrW34PZ+1PyVWSOI7oLKd7o0g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd655abd-da32-49a4-63ea-08dee081e11a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 01:55:56.4888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0dOIWy2ycmyHUcCfm34IgCT05zk5fbsSfLhIDvYwu70+9ygSplezaOsUOI7Stagyy6ZUiJQKVZRqaA0xCFvjSLTXn8Qbw5X58JCijhvSWhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6017
X-Proofpoint-GUID: LdJowh-2LKMuiYSp23njqmb2DIHqO7dD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAxNiBTYWx0ZWRfX95rSkv0HkMfQ
 QlB24pXtkNpm38tVO9ndICfX8LO2PbUgOYtgneonozBFFrXkUAWea4UEV6/MNqu54EWo7hRe59g
 0IDDD4PQ3Fb/xANU3Q4MSBfx+oyw5TGHDhgzvLTSJ+MZo1Hmnw7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAxNiBTYWx0ZWRfXweZiiXXvTe+s
 DE7glnQt/Eea6OTxOspXtXHxh4opZI8j3x76lC+o2eaCLpf9+uVPTXZ4zXsBODSKs4akoWotz5u
 Po/9wIES74lz5XSQ6KYIfjFdHeh4yigjj/3vg2Vn5/UrVO6LCc1TbD6An+Hz0Ait2Ji/bvqroRr
 MnJKwVNmAxJfUXT8HOnzWL4qbrOxCJrTW1MjwPx7OnC2V1U74XgdazxwR92ZLhSOgZsahQBpApI
 IMntvFwIbJkFv77TWJuwO59BABDZiK4eBCqnYPK0AgF92ZkHITtorbFxdhwPDVVJlETvtKtAKjO
 zmLT8x58YiZHcSqC1VUR27+qWtdKW/1hazjZZ1EHwhy0ZUoG2DMrMrtWaSLkXxeu+dVFJwzJ5G8
 j+kVBusW1V8tGW1tWkLQxUvKlVS3RR04LicUas8EkWg7SGpTpwjnrk2yaGofcuj7HdyBfW7JVhh
 KcyIcwTUIvVt12o5ORw==
X-Proofpoint-ORIG-GUID: LdJowh-2LKMuiYSp23njqmb2DIHqO7dD
X-Authority-Analysis: v=2.4 cv=Qo9uG1yd c=1 sm=1 tr=0 ts=6a5445b0 cx=c_pps
 a=65kS/IK/0KNveI1QfQMUCw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=VXJfApiZzzC-KKHF0LEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130016


> >>>> How did you address previous feedback?
> >>>>
> >>>
> >>> Regarding the enable pin, I added this since I know bindings like
> >>> being complete and saw that I didn't add it the first time I submitte=
d
> max20830.
> >>> I added driver code for the gpio but learned that it wasn't really a
> >>> use case so I simply dropped the patch for it.
> >>>
> >>
> >> I guess I am completely missing the point here. I can not imagine a
> >> situation where one would want to connect the enable pin to a
> >> driver-controlled GPIO pin, or why would one connect the chip's PGOOD
> >> output pin to a GPIO input pin and connect that back to the driver.
> >>
> >> I think we will need guidance from devicetree maintainers explaining
> >> what "complete" means in such a context to avoid having to repeat
> >> this discussion for every driver going forward.
> >
> > I think complete means all reasonable hardware resources/properties,
> > regardless whether current OS implementation uses them or not. That's
> > why if there is enable-gpios which is not used by Linux but could be
> > in the future, then it should be documented.
> >
> > However if you claim that enable-gpios will absolutely NEVER be used
> > by Linux or bootloader or any other DT bindings user (*BSD, Barebox,
> > U-boot etc), then I would skip it, just like we do not describe many
> > other parts which simply have no use for the software.
> >
> > IOW, DTS is description of non-discoverable hardware for the software.
> > We do not describe hardware for the sake of description, to mirror
> > schematics. That's not the goal. The goal is to make some software
> > happy, even if this is a future software implementation.
> >
> > What is the case here - I rely on your guidance whether enable-gpios
> > can EVER be used by software. If there is a chance, then IMO property
> > could stay.
> >
>=20
> Unfortunately, as it turns out, some of the chips handled by this driver =
do _not_
> implement software-override for the enable pin (or at least so I am told;=
 the
> chip datasheets are not public). Given that, we will have to support the =
enable
> pin property.
>=20
> Sorry, I was not aware of this detail.
>=20

Just to straighten possible mix up of parts/submissions (sad they all start=
 with 'max20')

The parts that have no software override for the enable pin are MAX20912, M=
AX20916
and other chips that we would be submitting with it (as the original submit=
ter
deferred to us to submit our series instead + the datasheet)

This series deal with MAX20830, and MAX20830C/MAX20840C.
In relation to the discussion above about the enable-gpio and "completeness=
", the parts
here don't have anything special to their enables.
With the clarification that the DTS goal isn't just to describe for the sak=
e of
mirroring schematics, then this patch I believe can be dropped as well.

Can drop in v3 after the other patches gets reviewed.

Thanks again for the clarification!,
Alexis
