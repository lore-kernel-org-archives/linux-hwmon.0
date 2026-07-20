Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D720B80B;
	Mon, 20 Jul 2026 02:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784514478; cv=fail; b=jKkktRF/m68coyJwVS1enPSLgJQr+EXoknCVk5L/AnTPIkazMnVJ/LaudjX+Zz5J76mKqtgC8y5D3U4uFGUa0vTXqw1QLB7GJgEpuvaMiIyz2Z66vcsQwtxruYtsKs2LA+tSBmQC/O47hdqxXo5JR954dv0dIeHrwX0Frtum6f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784514478; c=relaxed/simple;
	bh=GYYt2o2bhb+nolmtqem/8YRjUxOzaDdRB7+Kycg0B7c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iBnTKQKx+cFkWmjw0r37GNAl4MyuwWybbO7tSLKgiE8DoQTm1YQe1H9eEJAEftiKSKk+xyMUfdVj/CfhL/OZ+KIw8KJoRUZkRCKalJBHJ+9JUmq7x0/IM9Z1FJ7xi5TTdc+CYSG3GwPz8dZu9PpQfORsOt4Q8eL+IM2XOqNOsz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=eYABSeEG; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="eYABSeEG"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNs8hY3343648;
	Sun, 19 Jul 2026 22:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GYYt2
	o2bhb+nolmtqem/8YRjUxOzaDdRB7+Kycg0B7c=; b=eYABSeEGvQapARXBmyOEJ
	/8HfLfuic35wERHy95PtQ3vvFGbtTkSgBW3CsYItihKkfo+bfPFGOaV9NuY+3f/0
	qZLOwVeBRI8Shi6dvdL7TqJWwJ9Tk7p0EplJj0AvJh+3BZsMe7ujGYCr/MrXJTJN
	pvou9B7eUyWY66Swl9VjwjGFgcpafv/7w6RvNFu9d09Zp2Xp2HSb4c/+7MLf1+8o
	nh52qJMxrnKnCI8pkRl2RYtiE1zUMM9KSX8iY4ALAgv7HHCFEXE/6i3AoTjXjZZG
	xP3sCrVzS/jHakAXNgBoSAjSeOVxZkq4wO2ijprkfbKEKuMUoqZx2aI0obHVdE7I
	w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fg644by7r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 22:27:40 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4lzuvrxG2x/PO4GIH6uUf7fo7zKiKHoBggTvmVOICHStTp3ekreOXy2dn4Qr2mTNjr9GoCgSLtvFOP/3RvCT44WZ2A+7h+yR63reakBg14wwrBH6f7L095UZNBESQzyVHNJPLVNAG5Db+NagOCDiWnk69XD4sJaiIc6CKu6pHs1lnLl3JFFyNLqYRq1CgB3WmOquPo3/veOCPNL4QjLRYmBaDsTEsa3JqFOwXa/MNnWDVnv09SZnVAvibthlnxvSPWe9/VpoUsBGodsLT9lNccMlkF27g0/rnblQswI0gPeBO/pYeec8QPCShSSgVCSIr45ZlumYlKe9XmyaDGsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYYt2o2bhb+nolmtqem/8YRjUxOzaDdRB7+Kycg0B7c=;
 b=eAZgDCqpJU94UV7U+KrA6p9sOT+qEJfqQOcoZs8XknLvuXEZhFvE4Ex+DPHB9F0lHjXNXUN5nHp4e5FVa5qHil+CYNsnYtMBrt98HeiRieD0NJ1g7u+bMCv78k6hfXI1y6D3kT+RbfUqPoWdptPNwmLrXtVJDSxubiWPM3gycQayxN62BZSjkuz+ZhA4MR7NpsGKL3LLJ7jQx/B1xJsyDQmBme4tlVJDvSY3pO+6GkcCY7y0mKQW2vdLEAn6WUmaQbB5Yvv0mUIPno/HMJiOgl5PrinHqSZPxbSoW5pWe1tzUMwPPJFuZkC8fh/VsR8e6YnBxiI3Tb1+WVfN6YvJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7876.namprd03.prod.outlook.com (2603:10b6:a03:5b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 02:27:39 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 02:27:39 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v2 3/5] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Topic: [PATCH v2 3/5] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Index: AQHdDOx2XA6AA0obaUOWsNbooF1ZrrZfwpSAgBXt9rCAAA9eAIAABJvg
Date: Mon, 20 Jul 2026 02:27:38 +0000
Message-ID:
 <PH0PR03MB63513183EF9045768C6D2FC7F1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-3-37761e89bb5f@analog.com>
 <20260706022155.C5B251F000E9@smtp.kernel.org>
 <PH0PR03MB6351F16AE2D15684260D2930F1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
 <2e93fb55-5055-4c54-8ea2-6ef59248c842@roeck-us.net>
In-Reply-To: <2e93fb55-5055-4c54-8ea2-6ef59248c842@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7876:EE_
x-ms-office365-filtering-correlation-id: f0b5af95-834f-448c-69d7-08dee60677f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 QoZwo25CEcLzuwNBqRjgGv/9EHwVuCeka2f72o8f4CzRiY0enb11bFqU40dDBGUh06mIo2QLkVy9Wm5hY5fL7EYLUzpUsWq6HihenQhVxPj4uor5zvVYESSkA2sfQ1SL8rV680AdA/YCUFGskMYyrkjJEajrPlVQHAhc5KHru+1nHmxZYAUXuRkOLb5iNGP5x5OOfWKV9k73PTXswBmmXvRnZOPoOz0WSuGy6Ii8H4W+iQlA4ArQV107mykMeZfZulxGfd6YkTeLY1WP246dFUqOpnebbPk02JDtXCL2vqWUJXrpEiDI03qrgN3gg7tckNpf7rnZZvA1690YBnf0d7xd03zrb9eNlROzMFOtdHjarnWBRQDNuJr+9n92D3+4LD2+OyRgFmqVBQp/IPLrjjwq+cL6jNlGmz9F5D2By2bzaFohUpFucyAjqP3/CL6ijWbCsuR22btJdrzf353Mygk3d7o7TSUmaJEBtlzL1f+uosYdhLp77yLTfXgO1Hf4bgkZhpA8oDx3cjtzt2rcLW2vvxfyqYVJ4+l5eoieBsi0FipLrWaKOZAnGTEeRBk3a0N4QciiIpmXo48v5ltU5skmRW6krQmmKP3BTnwdSCAAZOi60iuWans9PzV57qpyvvLwd8RiTBOVnaeujysnnvsKqgXc4d+VHxfybnKg2XZX9Vq2TSpveaBF2uWywZSHAWWF5VVZtsCO4bCYQhJMvuY5UQlh/iWkp7gEgZW0jTk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YllUNVdpU1NaUlE0WEF2MmlwSGMyeGViVmxNYVh2VzFDSTBqYmpFUXpUd2U4?=
 =?utf-8?B?Tk9zcFpwQmJFeDJzOUJ6ZjFTT0dKTTZLcXNqQUVvQjcvc0VhaFJCbTR0Nk1J?=
 =?utf-8?B?cklkazIvLytPc1RIaDh5TWRkNFh1WUtFSllDMlZ4UWpURlZwcHJGN3Y0WVRn?=
 =?utf-8?B?Z25HRWFhYjRJUlNabUxBOWZGTHkwemhmUnVwSHZOcWFseG9lS3NGUytsZ0xF?=
 =?utf-8?B?eTRGdU1Hd0E2WldxYVlWV05hWjcrUWU2cnY5VUtrcHUrMUVXaVVaNm9pSkl1?=
 =?utf-8?B?SUgzMUNRdHFOVi9hS0srR1JGKzNNTGJ1RE1DOE95N0t4QnptMEJsTmhBbGk3?=
 =?utf-8?B?N21zNngrZ0dUYmRxSTRSMzhMb0FQc1FBYWYrR29ZdVFLMHBndFZSUUEzUGQw?=
 =?utf-8?B?SmowcDlzZnJRVUEyK0M2dnhtR1FzK2VYdXNQazVhZTQ2allELzgvVTVPUllY?=
 =?utf-8?B?WmRsZmZTdDI1TEtzV285Mi9KZkdobVpQRWZnbC9UcWlzYXhjRmo2d2x2SkpI?=
 =?utf-8?B?V3gyZEFpZEQxNTVvSk1KSHRIQmNjY0NFSEJ2NEtsaVhXQXlLZm5SYnFDYVpn?=
 =?utf-8?B?dEVLaXMxdTY5czZWZEp1SW51aDNFSVcxRkxraHVwWjdsTjhHQ1VTeDFwMUtL?=
 =?utf-8?B?YmhPbFlIVVdJWklWSUYzV3ZhTHc0cytIWGhhaUVFYjFKeHlNdmpET1dsemI2?=
 =?utf-8?B?RTRXcEdNRG9RS0p6NTkrcERaSmgvdTc3eCtwZHgvTnBaWUF0SUtWSHEwSWhZ?=
 =?utf-8?B?Y2owRE1qVWdmU3VUbFFXZ1ljeE0wcW9MdjJCcFV4a0Y2ZmRMckVjTm9Nc3F0?=
 =?utf-8?B?MnlsdkpRSFRUcEZPWHp0QlZDVlh4UkFNYUZTMmRjRGhZaUEzVjEwa0thYTRR?=
 =?utf-8?B?SHlFVHIvVUxvSGJKbWMxSmlydVFLb0hDYjQwWHB3SWZFM2dlVlBaR2VZeHZW?=
 =?utf-8?B?OEpCVW10RDcvMFgzOHU3TnV2ZUE0S2VyQ0FuL3R2ditNQ2QzM3VEVjJTZW4x?=
 =?utf-8?B?a1hBN2RtUmErWGR4UWRWOFRMUHlzTHJXWkR5ajdQQ2pZQW1XU2ZzVlAyS3Vi?=
 =?utf-8?B?QlZ2Ymg4TnFwN21sWk83ckc1aS9DUVUzQTd1Z3VMYmpNS3RrWVA4NkhFbzVt?=
 =?utf-8?B?dFdJbkFqRWhCREduTXFHSW5hdTZQbDZLQmcrT3REakh3WGFEVjZPTHVxSzJZ?=
 =?utf-8?B?Y2g1UjZkUXV5RCtVb09qU2JqS1ZJa0NkR3Z5OXJOeFJGcndra2d3V2tSTUU5?=
 =?utf-8?B?MytjWnlwV3hmR0pQQ2ptaGdXR1A0b3RrSVZaaklrbHFnTjNTNys1QlB0bHJp?=
 =?utf-8?B?YWdyK0F1YTRPekJMaWtiUGZsNkhjVktnMXJVY2NOWWxWeVZXaUtZMEZjbGxZ?=
 =?utf-8?B?eTllTDROa2IyRkZMUGY3c09wWmkyYjZ1UjJqdHY1MHFyQ2QxVllMN0ovY2JC?=
 =?utf-8?B?MlA4ejY3VXZuWGk2VTM1alZxWkFhNE41OVdKLzFkMHYvNHUzaXRlR1hDc0w2?=
 =?utf-8?B?WjdQanFETFRwODl6ai9raG9wU3dDZG1EM3VhUVZMSFB1T1B3aDJDclNnTjli?=
 =?utf-8?B?N21LUEdnZWh3RmcwNVVOYmRYTk5LYXhHMktHZW96c3MrVWYxNitqRlZLZWp3?=
 =?utf-8?B?TitKV2xrRDFsajRUQ3FoYmZrS1NiYmc2bWRKY0R5Z1NWMVJ2RXQxOUE1aXRp?=
 =?utf-8?B?b2FJazhVQkEvTHdJVmQ3ZUtUcXdlU1BLNFZDL01hZlZGZkxmNjNHalpYdm9n?=
 =?utf-8?B?TDJiWHRzTW9OWG1kbnVWZU1kMkdYdnFybDk2SHA1T1EyRWhlRTluekUyaUNL?=
 =?utf-8?B?K013Zzh1RndLZjNHUTIzOHU4SUI2RXZvaGV1TDBSa05VRFNQVHRISDFFMXUz?=
 =?utf-8?B?MVFhZ1A4SVFIWmxmWjFtVEV1L1BsNWZENDc0SkkvY0VqcWRXOVY2MDVCSTdB?=
 =?utf-8?B?eFJYT0xKVFFEZ1kwcnp4YjVhd0hOaHhpQVVGR2pKVzVWRkloeHJlZmVLWGlj?=
 =?utf-8?B?R01qdG5LZGtzcytDTEtNUFhGcEswVHM3amp4K2RrOE5zWWRvOXUxalZURVlX?=
 =?utf-8?B?dFlqWlJxbUFVa2NSR01UNDBCTmxPbnZkaWdnOW53MHE0cEFLMlJyRVVydXhi?=
 =?utf-8?B?SkZKR3ZzOWoxcTFwd2xQdGk5OTdNZ2U2bk93eHM5aWJRdElldi9qdEJsN1Jz?=
 =?utf-8?B?bXpDanBxTzRBSUdlc20wenZDczhNZWNudDVvd3RqT0cvelMzMDRPeXd5WlJ4?=
 =?utf-8?B?UmJIb1ljcmNsOURMcnpnS0dQcVMrQUhuS092RXFvNFdxUFVyd0wvMXpYOW96?=
 =?utf-8?B?LzEvK0JzdkZkazMxUkduSnZtOHAvcHFGQmVjME1sVjREVXZQNFBFcENwK3Y4?=
 =?utf-8?Q?KxBe9FusQ0RI3o2M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	GUg2wLbcd2wLBucdArEYuadHXQtaYNDard7wgXqTkKXlVvSczG5LJVUNsxoSMRxoLw6p0OxBlakNux5oedG6LRcIeEfIQJ2wz7FEePCra1wc2s4UfwiRHQ+hK10gD7xiR7S8U1Dvg7gEMl55qG0jRjwWEWpFMQApRyUzIch0BSLR8ktGWGitMau/BAmpFm24aDnTWLNt6VVmXyo78Elt6tPBiRnodggDNy2ltneddBAF9A/6Rox3Aryq0UaR5+Dd1/Vuf3xwOa/OgPzkwZ9no7PXdBTLc25DJQgiQyr9tj/pfWzRc3H1PhEKMVpfmHiprQzZ2G7iHI1Hy9xpCsIzUw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b5af95-834f-448c-69d7-08dee60677f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 02:27:38.9697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ITOlpFHhhzKPqtMnvTRoCcWfJEqPSr+mAx9qoX8i3DTKowFbjJkXa+xYlSNb2/OWw3WDHWt/n/mPMziQI6+gszYeutkBRo6VMxpsvRp+t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7876
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAyNCBTYWx0ZWRfXzsVMhY3lcLR0
 RTJzpJD42sr4kno1gmRZ83LT1bA9dLlLCpxN6Rzv0LRWeYlfksjGw6yDaP6LbecYp+jaeMlN32L
 X/Zw/gcapZo1ZJeQRSw+qj0p2PDtpiahIykWK0d/zEfOPpNyBhVy
X-Proofpoint-ORIG-GUID: mhI2emxG_Dl9Z-nJgra7nrv3G_U3Grwr
X-Proofpoint-GUID: mhI2emxG_Dl9Z-nJgra7nrv3G_U3Grwr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAyNCBTYWx0ZWRfXx6K6+LlL6Eze
 S0DqlqcG0BdhKHdM8Q/kZeLOOPBp0XznYrqDUMoJiK9yPZvIdlI5UvID2nrLCZZsuqsztAJuDQY
 mUwRoMk/GorLAPQPukbxewumcQjd4FdKbKhM1ht/vb2OS+HtYZZk85LiZItEpR++8xyRb5LwF/b
 75yM6lXMi+pEf+gtLFciIR3nK7ZCvdtaZR2TfcG/ezkMZMaGUo5GrYlLFO4u2C1kHEUI8k7XjWj
 TueuwRnhi9fIctqhQa9Bnj+lkmq+GPo5/dtZBXpQpG1YYZlCjy20zcXzgdPB4e3/zfUld6Tr8gR
 ugaEn2arVTPyEsosYtJuKY3fFTqawBsebsR4IEUyRIPg1TaiEgMlifX9sX8EskQdRyMJQPJ8YEW
 ydDp0dKQdv45TV6s1OP07GAhfLPlsM1m8uLhe65jg4ZBdM3JfXKnbVvIG+yGlV4xWNP81xQpurP
 EltLw6jrSb7BO6+/QsQ==
X-Authority-Analysis: v=2.4 cv=McdcfZ/f c=1 sm=1 tr=0 ts=6a5d879c cx=c_pps
 a=FYRcjPsbj8Vbl0y3HSZiwA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=_jAD5XSDOtq9-5Nde2OG:22 a=g-G_j1WuW4yPHWuA9EUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200024

PiA+DQo+ID4+PiArDQo+ID4+PiAgIHN0YXRpYyBzdHJ1Y3QgcG1idXNfZHJpdmVyX2luZm8gbWF4
MjA4MzBfaW5mbyA9IHsNCj4gPj4+ICAgCS5wYWdlcyA9IDEsDQo+ID4+PiAgIAkuZm9ybWF0W1BT
Q19WT0xUQUdFX0lOXSA9IGxpbmVhciwgQEAgLTI0LDEzICs2NCwyNSBAQCBzdGF0aWMNCj4gPj4+
IHN0cnVjdCBwbWJ1c19kcml2ZXJfaW5mbyBtYXgyMDgzMF9pbmZvID0gew0KPiA+Pj4gICAJCVBN
QlVTX0hBVkVfVEVNUCB8DQo+ID4+PiAgIAkJUE1CVVNfSEFWRV9TVEFUVVNfVk9VVCB8IFBNQlVT
X0hBVkVfU1RBVFVTX0lPVVQgfA0KPiA+Pj4gICAJCVBNQlVTX0hBVkVfU1RBVFVTX0lOUFVUIHwg
UE1CVVNfSEFWRV9TVEFUVVNfVEVNUCwNCj4gPj4+ICsJLnJlYWRfd29yZF9kYXRhID0gbWF4MjA4
MzBfcmVhZF93b3JkX2RhdGEsDQo+ID4+DQo+ID4+IFtTZXZlcml0eTogSGlnaF0NCj4gPj4gRG9l
cyB0aGlzIHN0cnVjdCBhbHNvIG5lZWQgYSAud3JpdGVfd29yZF9kYXRhIGNhbGxiYWNrPw0KPiA+
Pg0KPiA+PiBTaW5jZSBQTUJVU19IQVZFX1ZPVVQgaXMgZW5hYmxlZCwgdXNlciB3cml0ZXMgdG8g
bGltaXQgYXR0cmlidXRlcw0KPiA+PiB3aWxsIGZhbGwgdGhyb3VnaCB0byB0aGUgUE1CdXMgY29y
ZSwgd2hpY2ggd3JpdGVzIHRoZSBzY2FsZWQgUE1CdXMNCj4gPj4gd29yZCBkaXJlY3RseSBpbnRv
IHRoZSBoYXJkd2FyZSdzIGxpbWl0IHJlZ2lzdGVyLiBCZWNhdXNlIHRoZQ0KPiA+PiBoYXJkd2Fy
ZSBleHBlY3RzIGxpbWl0cyBpbiB0aGUgdW5zY2FsZWQgZmVlZGJhY2sgdm9sdGFnZSByYW5nZSwg
dGhlDQo+ID4+IHdyaXR0ZW4gdmFsdWUgd2lsbCBiZSBjb21wbGV0ZWx5IG91dCBvZiBib3VuZHMu
DQo+ID4+DQo+ID4NCj4gPiBOb3QgYXBwbGljYWJsZS4gTm8gd3JpdGFibGUgVk9VVCByZWdpc3Rl
cnMgYXJlIGV4cG9zZWQuIE1BWDIwODMwIGhhcw0KPiA+IG5vIGxpbWl0IHJlZ2lzdGVycyB0byB3
cml0ZSB0by4gYWxzbyByZWd1bGF0b3Igc3VwcG9ydCBpcyBub3QgaW1wbGVtZW50ZWQuDQo+ID4N
Cj4gDQo+IFBsZWFzZSBhZGQgYSBjb21tZW50IHRvIHRoZSBjb2RlIGV4cGxhaW5pbmcgdGhpcyAo
aWYgeW91IGRvZCBub3QgZG8gdGhhdA0KPiBhbHJlYWR5KSwgdG8gcmVtaW5kIHBhdGNoIGF1dGhv
cnMgdGhhdCB0aGVyZSBpcyBhZGRpdGlvbmFsIHdvcmsgdG8gZG8gaWYgcmVndWxhdG9yDQo+IHN1
cHBvcnQgaXMgYWRkZWQuDQo+IA0KDQpBbHJlYWR5IGFkZGVkIGJ1dCB3aWxsIGZ1cnRoZXIgY2xh
cmlmeSB0aGUgY29tbWVudHMgSSB3cm90ZS4gDQoNClJlZ2FyZHMsDQpBbGV4aXMNCg==
