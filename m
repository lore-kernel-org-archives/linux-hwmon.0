Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F371428BAB9
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Apr 2026 04:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776227240; cv=fail; b=ZgbMvv4M1LHoHu7GzksfYtVhBpeQgszMY6/9OiYpqnUR+CySeePONWuSUetUFoC5GMlBqE/MGmXxPcCCH08CM8hY+S82WYaSBHP+47yw9xZ22Z+gZfj44orDeRd90cWP2OA9fkS8NxwfCCDCCioGSEXNsFC8vBAEKOxg9Eu3f0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776227240; c=relaxed/simple;
	bh=erFXE85ptXnpyPIZeSIHBcg1UtjfKiFkdqPvIvVajrk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oX8uQg0AOrngUxSjji+uvcHDxfVklQKHW1GIyQPsgdA8cKs79LDExkYYxvJWSh13WJkkYRfUfAevdnTVGIH6Om+FmEzAcqVauj3guYcjmOB5a8kt6kyjnlqc0oIpLSqgvq1mdqGodRddDsmJaJYwiCB7/DxglaSRjmsGqQ5ZNWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=K16yyZ9R; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="K16yyZ9R"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F0CgkU2359303;
	Wed, 15 Apr 2026 00:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=erFXE
	85ptXnpyPIZeSIHBcg1UtjfKiFkdqPvIvVajrk=; b=K16yyZ9R2RGB6shWsBSbU
	GcktZFtzJ37PP2M40mOO3iTsjzh5hJLXuBhAt2LQl0zT1r87cG4qmp3GU8nJrsnI
	Q+CTKHZLMcG6Wm4FVl8Zmv2D+PQezJep9ErXV8c+Hm+AMPkVQTcrBue9aR4PsBQ6
	ffQYCkY9tIuPxmf8EDFuypkiJoXJML22pdIHGNn+tnbSCe3nTNT/dVw3stwtzqU+
	1Y4kL9kHKuv6Ps6v0Pneptj9TO+pbMGfXKuSDgP9l85A7Qm9szBB6VHwuzhaTSbP
	017aVG5ouF7wwETB2uNE2+Mi2JUQO5/kPeIk2Vfz2avIEwglFxgW4UJedbfVxGnP
	w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4dh86w5tm4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 00:27:04 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuNyZem8C+L0wvMwDitGCBStBrWvCOix8vkMj/py07OVvjs68kKlu3dRN2cYDdatZ5EAZautrF5U7LKHTLp6cGNdJp+5ftjkvAoby1uV731F/6APXCYWY8F+w6xo4NB4LvqYyWhDqzlA8mabL2zNYhZ3OC08LTlFR8k8sX35DBc+zj1QRzmlN29I/0hpppavqtrxNfhC0wEmafm0O5wcofbZoAEkW/Ux1rs7yZKleqli7r/mwKZdfjW4spiw8R2JRtZtnKO8rWb29IFFY+Cu8pPaIYC5fBhQ8VqFbwnQoaYaB02iGOR15UDhJ1P0CfJlEF/oib0P0jRUUZYUhlkmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erFXE85ptXnpyPIZeSIHBcg1UtjfKiFkdqPvIvVajrk=;
 b=arSbVYN0Cwmk42eVaAlMO+6SP7GJLdt89VsjMkQ+F+MZ17drL0gU7uapq3kX7eP4d7qJTsxIZnYRtvirFiQmXoQxjM7uMn243riecF1UWQ5Je4bL5nK+ZfM4LgzaO+o+71xk5UTV3obWj0EpebvCH83b4q7QUSRDqHGPldOF6vDloM8U/xJVtUl5OESvc1M7vzyhQg6i8uaeusAuz918bJxURvQRs6PsqAf+JMWc8uYbiB9xIwo5duERPlLt1UoK6mquJteKRmdjzBTHQ/5p0EI310Hip+JfAfoyjoHMef07FIj8661knnVbE1BXZOiYYR8EDtjn6b4I4AjE/axrIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by CO1PR03MB7842.namprd03.prod.outlook.com (2603:10b6:303:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 04:27:02 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 04:27:02 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko@lists.linux.dev"
	<sashiko@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Topic: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Index: AQHcy8dEUgafwxoXDUyLmPRX7RRvmrXd/qEAgACm9YCAAL46cIAADT4AgAATwOA=
Date: Wed, 15 Apr 2026 04:27:02 +0000
Message-ID:
 <PH0PR03MB6351D607FACABC276EFAEF01F1222@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
 <20260414045647.4AACCC19425@smtp.kernel.org>
 <69f893bd-bb38-439c-b7e3-30d17c6b8cd3@roeck-us.net>
 <PH0PR03MB635179B8E59E60DB994415A7F1222@PH0PR03MB6351.namprd03.prod.outlook.com>
 <e4a4c2a6-e757-49f8-8fbc-215a74c7a9b5@roeck-us.net>
In-Reply-To: <e4a4c2a6-e757-49f8-8fbc-215a74c7a9b5@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|CO1PR03MB7842:EE_
x-ms-office365-filtering-correlation-id: c8c9f019-1c24-4a2f-a872-08de9aa73ddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 J7AZSfUHKPRqBG3ZV7hbMOMEtQmtR9+yEGip2Fqaqv96bdRtSAteQAU8hgSPDfVEKAJtggIYmJZyDaF35Y96U6n1n6pkSkHDtTkbd5JfS2eyD1ij5uqWCBX28O1M+nLZAXdXa5ADudu0pkMyxbH7kt5nh9CAt0iY71jNgT8CqF5kOwbC8RuchLeGj33pvpqZFJWi4jTRQO3Ojgn3ubBATgDLyKDifR6mutysEavjxbg2jlUNxjJ7b2Bb784ICV4Uq0YHrxXcoVLesWk28lZ2O3MiD+F468NtPjOvyvPL64KukToRfLA39IJxhxkbW6tcSwyki222cFNql5kYveR6QvEx4HNJoS0EL8ZItFhRfnmTmpxH7kTVVwVFHiAViB7kdbBBr764BCjGcZfpoltbACdZSSDfxnvgn2TBNem+itFTH996dBhSiH9IH2WAt/2f+kZksFJeyD5db4EBhHBhP+YYmnsxY7doLfUquJssWZCg6d5P6bxeSAy6MvQFWCyjtSEnBW+w/XrNcRA6T+GGR8I/weDEErVI/g9S396x87KAafhuUo7pwrgzkIat4eDTtGzBoJmfu2GE9SzWWCqHzh7Qsf3QSRjhnzDfW2mBmuontzvQiD5zupe2QA2fB+iHqyfgNXWFv8VgJ7tKb9zyOCEFo0qYBDvbJmJ4Zbri0vixPTwKjnHEe1k22SzMrLtTOuO5XRsVqEFN4zNAxeLdKoOnwbZGoThDCtS45Ru6joDc4RU5OzG9ZYaOih/yzuNxjvVUjFhdWEJwetWoBjs0s/e+Fr7/DJCA8PaKLIr403w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGQ1VU1vUjgrM2Q4cHFmSmJaUzBxYmRVWG1LVEQrNXhwWXNnN3FxMUQ0dHNi?=
 =?utf-8?B?WTJ3d0xUZ2pvZi8rVHE0dHpDRktpUFlkSXZuZXV0bkFpci9JRWh5a3RGUGQz?=
 =?utf-8?B?bXozOWdPTWozTHg3Qy84dkxwSUJDNFRoR3hORlprSGVBdnpKSzg2d2JBditP?=
 =?utf-8?B?T09kcUlWR1c2YzRMOU04UjBDMjVlQUZVSS9yZ1BQUGFCSWhHdXJObzNDYTJu?=
 =?utf-8?B?OUpUc2VUYmlpcE85Z0VjbktZMVU3bm1mcmNoNFdac3MxeVJ6dTVxa0EzM1NR?=
 =?utf-8?B?RXlOcHRTek9ybFdvR2ZNT3I3aFhiNm1JckxKTi9DM1VuRm5ycXlRK0tid3Rv?=
 =?utf-8?B?MVJyTVE4ajBnakVMbUl0ZXN1VEpZd2hoRDhVSFZrb294ck5NMXRjVGdmeGV0?=
 =?utf-8?B?QXByVy9NZHRLWlpmQ2g0S05FU2xveFZTdHJpLzV2MkJJWE5Fb2RXZlAyaDVl?=
 =?utf-8?B?RU1zOGFhVmhkdGd4TDVNTmZvZ1NzQVJzUTZNOFkrZmRMNkhXSzAvUnUzaTRO?=
 =?utf-8?B?amJDbFI2eExHQ0NLRUdCbmJSYXNSUFIwY1RiQ2llRThzVmxuUHJQU3pCUUNB?=
 =?utf-8?B?SVZlZ2J5SVNmSzByY1BxKzRXYnloS2NIMWx3cUlhR3JyR1RlYnVRVERvVDhx?=
 =?utf-8?B?UmFMM0MzSlBCVHRHbGRiekg4SjhlQ3lnNk9IbzdDK1FBYzBkYWZIUVNhRXhQ?=
 =?utf-8?B?TEZnc3FJaHZjTDdQUXpHSGo0NitWUmp1eHN1d2VSeXNzTjMrLzRqYTFmcWFF?=
 =?utf-8?B?NXBNSWZjbjZxSlpYbGVQenFGTTI2SzdFNHhHTnAzYnBFaFVEWmJVTFVaWEtn?=
 =?utf-8?B?ZUxxTVhBUXZjOXRib2VLRXN6anpyUGRjR2dqM2g4UVJzVVptL2xCQWFudUVp?=
 =?utf-8?B?Q2FhY0VzWEV4THlOVlRDSmNZTUJvR1EvYjI1cllBa1VIYy8xTTZ5eHdsTkR6?=
 =?utf-8?B?R0lQTE5meDhEdCtTczJZeTd3UElXNHRtZUo3RTlVR2l0OVpnZ0VneDJVT0dm?=
 =?utf-8?B?VjhnRXgxSmExaGFzSTBkWVNCR1BPbDFKdVRDK1htakxOZjNaWERFM2x1QkIv?=
 =?utf-8?B?YzZuT2laVTFvcTFDZTRLNFpHY3RGYWcwM1JVNklINUl2UjhuVWtxZlpDNlZj?=
 =?utf-8?B?elpqODVZVTFCODl2N1d3dEpRVm00VklFSmozdHZlMzFnSUo0MDZxQ3ZtRG5B?=
 =?utf-8?B?TWoyOERPdEhHN1l6RG9JT0NFbWNmZGphODl5dkhZMzZpdVRyeGliWlBQd2RG?=
 =?utf-8?B?WVk4T1lhdFh1R2NXMklCZ2Q1NFZ6Y0VLQ2g2M0dJMUZKK29DVHNkSExwU2Qv?=
 =?utf-8?B?VE1ONThSVW1ZNkltNks4VGtLYkZnQXhJK0MyZWpSMUZnNDR6MXlabTdBdDhI?=
 =?utf-8?B?MXRISXRJRXFwOTMzeTdldEo0SVNJWU50T05IWXE2ZzJyMW9NME55Y1l4ZW0z?=
 =?utf-8?B?YnZWYjhzQ3ZTdFRtQkJjUU1nbkJoSUl0ZVFTR25aNkNsVVA5Q3BWckVKNFdw?=
 =?utf-8?B?VTFEbWozU0VGYkRkbm1Na3VybVhrdjRpZW50REgzdnhTUXkyc3dMTkJ1czdu?=
 =?utf-8?B?Nzl0SDRlY2t6aGJnOS9neVhHdHAxYnIrRER1MURvVG9DdTBwMlZpTWk3MGlV?=
 =?utf-8?B?SlZsU0o5dXFhMmk5NHZkazYrS2RaVzhhNTJaV0FmQkFTNlVKczRvK2tUYnlY?=
 =?utf-8?B?bXduRjh5d0VLdU51bUhjZ29tLzh4MFpjdUo0ajJnZTZid3pCOGEySmd4ay81?=
 =?utf-8?B?MFVmL1V6QTNNR1hQSGRRTVNWY1dWNEx6TWhsckY3RDVPZWdSb0YrSm1EWmNy?=
 =?utf-8?B?bSs0ZGw2eU8rWHpjTGpQeUFibUtmZEQvMktuRjRBVng3VjVadS9OOXlKaEpZ?=
 =?utf-8?B?MFFkMTJCTllBZ0UrQkdvWXRCVGZHcG9PWGZ4Q0s5WGorbHJuZ2RXeDllcHh1?=
 =?utf-8?B?a3owNFA5ZEFsTHNPVlZITHZjS1hmcDU3QzQ0YzBqbGJ6aFZ5b0wyUmpmNm55?=
 =?utf-8?B?L2YvaHdmdFFMWGloMjc4bU1KR1pwY3hHekZzQS9GM3RNNXhFa1hJOHVGcjJ4?=
 =?utf-8?B?KzJqQXhiUDBkbGZHQmpvVGk0NURHbWF3TlRHNkNmV2xNQ2M5MnRVOExhelJG?=
 =?utf-8?B?WVBFS0FsY2I1clB6TmRLaGJUWDZKNm1tcXpGcXVoWVJkMHV4Nm0wSlhPMFFV?=
 =?utf-8?B?eFJwbVZsUSsvdUp5ZmFleDdCUll5K05sMUU5RnFtenRzdlk0TTQ2ZHE5NkJO?=
 =?utf-8?B?eVk0eDBPb0k2SFZtVyt5QlFQVVhOb3NXeEozaDJpZzU3Q1RoRVAwTjlZQkZx?=
 =?utf-8?B?WS9lenFwWFIxenJqRnFMU1VPZVJSNDNSLzlGRGFPQVFMNTVFUnNyUWF6ekhP?=
 =?utf-8?Q?syZwrWtXyTXBJE48=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sJvScAQVLJxadb98JcUoMZzzD5BoPuOfN3GLY1eDh2bJkOGhK1nEc0yxCtLnJZwffMDDKmzcCF+aU+WidkPxxSZirC5u5vigiZXBUMU+VaNQL+s+A0590P2Cg6eBHOj8RbyDpGZgECPsRMw5xopHdE4MyXo3+CdLBs3QOJxl/DzqXzzpIXr0viyyx1UczdonURsY67bVzMXS+0GzltVAA8zt1m6ijkxGT/ZmwXQ6eEgpBahsVNDSUZi7m1rhcqeAIgH5hUPVYMKtJeVtCWqOYsrnaRh2bVE7AQT3Zc3rbV/GtEDenefhkf7GbNLPZS/wCQ9QdP3or7gUbK176yB+mQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c9f019-1c24-4a2f-a872-08de9aa73ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 04:27:02.1407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iUCGARquxLAdm+RNtbgkI1Kvg0nL6TKivJzRqDrJLgrAcqFzPdLWVfA23PTYaen0NzxMykVW0SVZ882cCQjm7ixqK/YiN3OROLY4Tuhw38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7842
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAzOCBTYWx0ZWRfXzfWfTBhfgu1V
 V/hC6M64EzDWi5t1u9W1VmIgdrSVtZ4wf6zzJKljv3RbNlKsov2t00MX8EFOYgY75PchKyR7Xbl
 isFPAOdGzAwUGfnPTQZoVv7ZvyDqoFHseeFNYY89mU62iXtz/6xlJYYV5g4u7xxAyFvPCOg6NDS
 G7qRw4w+qP7I645qWjgEiHatpaXnFgya2YzAE3gkC8GutvTqY+G5VX0eIwIq8uUFoGEnKwK0UQC
 74IKEq5PZb+naLnfU3GKzFoT3oa5hf3Vq2Mq10MPXdamL0uc+w01wUtI42nWOtrADB8FmKVkqfN
 qnasPROvzZL6gIm3eu24w6wxIC4AdZSFi+cYsMth9JQc1c+Gh+3+gpjQyWzK1sX9W2PZUgcFWiT
 OXcdbEYKARDZgIQ4DIJECWnbSxx1lFXn8Tl2aByhsV+08CPswzo9JVYp+tfrdmckOs6f3RIjD2j
 X+VvT9VKXL0stpJ0I5g==
X-Authority-Analysis: v=2.4 cv=FKcrAeos c=1 sm=1 tr=0 ts=69df1398 cx=c_pps
 a=wqOHD3zG9oVgxNNyXktjPA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=uHK5vGP3Vi_Djc78RagA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Td97rmSIsOF1n6lK6ueos2YrUdtV0PBB
X-Proofpoint-ORIG-GUID: Td97rmSIsOF1n6lK6ueos2YrUdtV0PBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150038

PiA+Pj4gU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMyBwb3RlbnRpYWwgaXNzdWUocyk6DQo+ID4+
PiAtIFtNZWRpdW1dIFRoZSBkcml2ZXIgaW5jb3JyZWN0bHkgdXNlcw0KPiA+Pj4gYGkyY19zbWJ1
c19yZWFkX2kyY19ibG9ja19kYXRhYA0KPiA+PiBpbnN0ZWFkIG9mIGBpMmNfc21idXNfcmVhZF9i
bG9ja19kYXRhYCwgdmlvbGF0aW5nIHRoZSBwcm90b2NvbCBhbmQNCj4gPj4gbG9nZ2luZyBhbiB1
bnRydXN0ZWQgYmluYXJ5IGJ1ZmZlci4NCj4gPj4+IC0gW0xvd10gVGhlIE1PRFVMRV9JTVBPUlRf
TlMgbWFjcm8gdXNlcyBhbiB1bnF1b3RlZCBpZGVudGlmaWVyLA0KPiA+PiByZXN1bHRpbmcgaW4g
YSBidWlsZCBmYWlsdXJlLg0KPiA+Pj4gLSBbTG93XSBUaGUgc3lzZnMgYXR0cmlidXRlIGBpbjJf
YWxhcm1gIGlzIGNyZWF0ZWQgYnV0IG5vdCBkb2N1bWVudGVkLg0KPiA+Pj4gLS0NCj4gPj4+DQo+
ID4+DQo+ID4+IFRoZSByZXBvcnRlZCBpc3N1ZXMgc2VlbSByZWFsLiBQbGVhc2UgYWRkcmVzcy4N
Cj4gPj4NCj4gPg0KPiA+IFdpbGwgZml4IHRoZSBtaXNzaW5nIGluMl9hbGFybSBhbmQgbGFja2lu
ZyBxdW90ZXMgaW4gTU9EVUxFX0lNUE9SVF9OUw0KPiA+IG1hY3JvDQo+ID4NCj4gPiBJIG1heSBu
ZWVkIHRvIGtlZXAgaTJjX3NtYnVzX3JlYWRfaTJjX2Jsb2NrX2RhdGEuIEknbSB0ZXN0aW5nIHRo
aXMgb24NCj4gPiBhbiBycGk0IGFuZCBpdCBzZWVtcyBpMmNfc21idXNfcmVhZF9ibG9ja19kYXRh
IGlzbid0IHN1cHBvcnRlZCBieSB0aGUNCj4gYWRhcHRlci4NCj4gPg0KPiANCj4gT2RkLiBJIGNh
biBzZWUgdGhhdCB0aGUgYmNtMjgzNSBjb250cm9sbGVyIGRyaXZlciBzZXRzDQo+IEkyQ19GVU5D
X1NNQlVTX0VNVUwgYnV0IG5vdCBJMkNfRlVOQ19TTUJVU19CTE9DS19EQVRBLiBUaGF0DQo+IG1h
a2VzIG1lIHdvbmRlciBpZiB0aGUgY29udHJvbGxlciByZWFsbHkgZG9lcyBub3Qgc3VwcG9ydCBi
bG9jayByZWFkcy4gQW55DQo+IGNoYW5jZSB5b3UgY2FuIHRyeSBzZXR0aW5nIHRoYXQgZmxhZyBp
biAuL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYmNtMjgzNS5jIGFuZA0KPiBzZWUgd2hhdCBoYXBw
ZW5zID8NCj4gDQoNClN1cmUsIGxldCBtZSB0cnkgdGhpcyBzb29uIGFuZCBnZXQgYmFjayB0byB5
b3Ugb24gdGhlIHJlc3VsdHMuIA0K
