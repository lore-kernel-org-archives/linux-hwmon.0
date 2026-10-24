Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792854936;
	b=nQ1UhNslt5z9O31YIZkzboxzMnUSw5HraUP8bpP5CsFZorVmBsdwIfuVfxyYUeoAkTzY
	 7irUeXmtYdGz9u/0fpMLOl7CWZGeiN9uhCiF+tFXh1HkttoesTmPAd9R53Imvi/L4SG1J
	 s00gS2RkuPyqZhWG7kD99pt4yF4FoDMDYCMlQBaGpEbRqQYzYvoK10Mgen+nf+3xsJ6zG
	 aT6SFIo8UZ59JM8SR2za8Wyxs+bKI7NFrL5Sd/F3RElbuEEQkR+bhAZHDNAJhZa5zarg0
	 ZqnMhgfGxFvR4p9MKY2BoWgICa1LzRICc5QcoZ97cQdxqp/sIWcus3EPhq3kEegQxfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854936;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3N97Zc9FqimchZ2AEh48X4M54igXtFsY5+1MFwnWWgE=;
	b=CdcqXKW3dMwc1DGS7T/2WlNetb9ycbZygWuJKSJejD/S4WeY40tnvGRB3juT8YF2XDzt
	 MlpOhmYWJDu7lLt9tBllLaGDRW4BJkYQAMdiFpV/tW7J6Cp0NchkYBmBuKQFRFAXqFa6V
	 trv+FkQCyoncgikV/KR9XLJhrvOANUrVAr/ybBDrZz7lV4NqyrFuJi1hzbajzrRREejne
	 LrdW4Hruxm0FcSDUhGXJs3wo7Nb7wQujZ2zLE5AAPK3CgZm1w6y1pb4pK51T6VjXlJp1F
	 8OYbZX472KNp0j42mt/1R1A4CNfcuUe6XYdNgsPRhaJ4IeIDbdGRDnnreJlHBiZStzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qittmg3E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.22
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357EF606A320;
	Sat, 24 Oct 2026 15:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qittmg3E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CztkTl5UAH1d2zlriVxtxEH0grzRxwOUHqTEAjwqwXQOJoFOAxQLBJJXFDcXn9uLfLWqIVFSj9gl22BxdSH8fjYXGfN0bpID5ET4Vl/IepPCjhVDf1I4lxfodCCgK/gsw6+SN8fmvODi5m9P/tcOzhlspzrSk9OA08iIb7srBo5Zbi8z64d6exXwVRY3yn5XJn0Bt77ksAz0RYltjYwT5z8a8Qx65d1KHkPOWhkPGZahiVu66ATyvK8ON2sveSecEPrUurDQeWZ+MFSaR8sA1+3dAGuo9tU4q/vaqSQXsgUBdXZVD9+wIRZAH8hxW1jbToob8McUc/g4v6gFJ2VUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3N97Zc9FqimchZ2AEh48X4M54igXtFsY5+1MFwnWWgE=;
 b=MOORBNoA1ZfkPfVt+NF8aXa3oeRDyJgZweUV09Tm2PxilDoSM6l7hGTf3DrYQyM2YZJhtcbvgvs9IumAbyZ0yBlL/5p2BlrHm79d6v4mtfLHrvtxLUCN3Fjy1vlZCKeVEuncW/3CM5GjSnwxu0nxVygT3QY18l9YEz+v4NXYql9xxqBZiYK4Fv21Op5ZRb10eonm8ncyPyRFldJod6zimWqcxxYnTYQ6Ng8JdhjJpJJPJ6etRB2ngzN+Ap6GNwjHj7WJsoRyxhGOOCcsQlbdIGnT6sBZ2JlgSvHYYyt1x8n7i5KH9pOaMCLPEBDHFr2dI43n+9DxTpLNNFO+sY2Osw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N97Zc9FqimchZ2AEh48X4M54igXtFsY5+1MFwnWWgE=;
 b=qittmg3EycuWj10Srcyxt6h+WbupVlWNLatCYzTpAD1Fc9gMTQol3cmmB+IeS5Ba3LwKlMYxVft1W+02aZSTeUaHM8ROchArE4kYnRoQ/3m2BFHPctHdcRMqqqzkV3tll0rjAxVSN8cNB/N7nzKjHkPgVmk//vfxK58StKvvtaw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.20; Sat, 24 Oct 2026 15:15:33 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0546.019; Sat, 24 Oct 2026
 15:15:33 +0000
Date: Sat, 24 Oct 2026 11:15:27 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Borislav Petkov <bp@alien8.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	Guenter Roeck <linux@roeck-us.net>, x86@kernel.org,
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/7] x86/hygon: Add Family 0x18 DF node enumeration
Message-ID: <20261024151527.GB1164@yaz-khff2.amd.com>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-2-wanglin@open-hieco.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022074218.667049-2-wanglin@open-hieco.net>
X-ClientProxiedBy: BN9PR03CA0444.namprd03.prod.outlook.com
 (2603:10b6:408:113::29) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c5d1c4-12be-4fa0-cfd4-08df31e1a606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|22082099003|6133799003|18002099003|10067099003|3023799007|56012099006|11063799006|4143699003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	dneBjf+AHuJihfI5zgpNC/pUL/AwKt04I3icgDxPyiH8fUlaA6LwBNxQyKgUITS7R8oM3F0KuSiQXlsp8euAR1Q4eQ4SQG77eAKNfFml+5j1dOx6fPc92fMeOlZlV3Jdm4f1ILSImc5LKKWmbzLTDTGmnp+F7ceVFeFyZDNuZUftLAxTbsGhCCQ0erupDXT9HALzBB6q7OVX/M/ajQDkpNfy/IL2VwoE6QfcbD087GjcPgCx7GsstbJ52JzvVM5qIbPOyvUjituvf0SM7VnpLdB6rhqYjlRgVss+6dcFK5BBTC6QO/oyyfENUOpKfCsMSZZoslQhM6lfZFswOjxXoWIRPsS5FxrH7ZTWrTpdXsEihYJ4mLRd/vAraVLYuWOQjvJW7Zynw3+j9GW+dnV3KQkSnpnjUGLkk62ilD1o6yJMD56ujOV3vq3AbVShWDq8oQ+oI3Y/Kb84ILYbbEdj+eukLBAQmqMQgstT9tNlYR3vQKu/6Yqasn8Ay+In9IPuRupIS7SE3SRmil8l3kwZK46HL+3+6x5iPNtcPempVfKvn0pmX3I9JtCzldDc5MY5duQWC3nlu1s8UF/ieuZZajN5ZiKXwpESDVm2pf6eopPvE8MS/rjNNnw3rX58lCQ5LfzobbuLAlD/Vg43NJcGGAuFb7UTbUpaQGgmi3w6u1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(6133799003)(18002099003)(10067099003)(3023799007)(56012099006)(11063799006)(4143699003)(261021121427099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pLKbEMHQUwa+pYDPJS/zGR4e4hxZnfYssrXPDzeUccGNHBDcCwABY1CwvNIM?=
 =?us-ascii?Q?Za8SKPYl5L1LwGNp2Y0FOK3Lv7cnW0DGoivFGS1tTGfbrz1OCkRtsJTbeW5o?=
 =?us-ascii?Q?rU7RuL4oL85Sk82fPrtJPajiCHQLgp8Odrl+g092eq4mn2Xe8ozlVyKB8HeX?=
 =?us-ascii?Q?OidnOlhVmVY4kQ7h3cIZJcvUU2v8H6pNFQ/51DK7a8feQI5e6JMjEo3oS2nv?=
 =?us-ascii?Q?ybu9RhbAQb4MAmk9la34vcezcuTHOmzGQz15IUxTNBKoz2qRZMFEVQIkoTy8?=
 =?us-ascii?Q?J3j+s4GmSb/T9n1M8Dv7/vJ7ef6R8bie9FqjRU9nWy9pfke+MOU7wUlfWdTz?=
 =?us-ascii?Q?HJTtpFbgqAl2Eb1On2k2uEZqbsnP+nbIbuDOgJZTup53n3vwLn5uZfeZ3Mlr?=
 =?us-ascii?Q?QgtjowTYIJJtD1BXEH+GvH0HggFay3je846nT2uHVRs1hhZcGgpZEc58/uii?=
 =?us-ascii?Q?i2g5zxYHgXzgJRi3Iijg5Bnr0YkWtVlzZS3ke40jp+al0eB8XM5sfFAgXbQ9?=
 =?us-ascii?Q?a+PY+IS8RV7qdrfsXseMPzb/rxhDAhxmPXbErYKMygTjf8oos5aB6ADo3DL3?=
 =?us-ascii?Q?Fg8Y+HBhK7RmfV845tbF8+49xmzZ17zIwU7t+Ks3tPE8edqFpk5T+PRN//hE?=
 =?us-ascii?Q?4bIS9P41UuEMMM8QpnBPKxakM1YU0v+efw9v/rB57bSb7QhEqO/yUXpnNQp7?=
 =?us-ascii?Q?KkCgZT6huV2Tpf8ABRzjAP9KFdxkja1PmDqtQ/CxvH7JN4PpoBqvVdgBDEtG?=
 =?us-ascii?Q?PAKyonm9XnMUeRzv0582TCWy5R5305EBNeXHJqIBfIVUosF2yS0UErAkIPMK?=
 =?us-ascii?Q?FCrx8tc+rQjiDbufBO36Xu7onuv1l6gRUo/AZAqcxYUjkFgxtaru9+D7imfR?=
 =?us-ascii?Q?yM2ynJLRGxm6yXv4XvYahsGBCqIj+xwc+yCKtkdmxnZ9QUaltAxMoGP+mRKT?=
 =?us-ascii?Q?DduSTewUhgLirmWbghIVuoLnb4O+vmELyYS//LkNNyQj5ve+K/13uzU57O2S?=
 =?us-ascii?Q?2sjmyLlRYe4ult7KKJdWzpO4OWcFYIua3Do91vWIrSOIjqO0ARa3SY7UT+BX?=
 =?us-ascii?Q?SBffLJa0Y2dUnZQtUzuhbbU2CSfavYc31h4ORdyy6mDfdxutKZChCnhKLM1W?=
 =?us-ascii?Q?OxmdvfzN7EwAT/9PPv/aTqQ7M/+UdpwiBFSFtKF7XVgRCNARis3ocL2MgFCE?=
 =?us-ascii?Q?ijiFR5EbTJ730UVkBvAUrNyMqmq006tCbSj/23o2+bIn9wzh44ktELvIZdHT?=
 =?us-ascii?Q?LJ/xItgVPpfEdcdGOAdb4B1H4fE6X5W6pCoeGIFYk/d9vNl/wUIxxZgKfvlE?=
 =?us-ascii?Q?dk/0rL2pya4phaiuRqNEGCiP8mdobDnVVPARCweIhgpOqnfduigzUT1d5xbv?=
 =?us-ascii?Q?vl4Pb6QeHDsivP68P7gztxHRA5/Ek4kUUGO//bFB0HbX6f7wYVJRdOoz29w7?=
 =?us-ascii?Q?I3do7dJ+/AtEgCwgRYAseJO263t/sf2oBcA/US17Ma5g8PwhsXswvVwBxPIl?=
 =?us-ascii?Q?Iuc6aR+P7PYBHDTrXU6GhIRe5li3Y/UM6AfmalOcVzEb6r18C8mt0k3dXfxi?=
 =?us-ascii?Q?i0Q0FvMTqXTjB3Dt78xjaw2O8nMHKd3x0dVPEkc90oEv2vG9aFABXteSPxTM?=
 =?us-ascii?Q?c8WQA6wlGpUkkfCPJNa2LM8+r0ydOaInsxgpfT5vmxR4FLBi5iXAvgGhhELB?=
 =?us-ascii?Q?YP85j0qmYy6ZrMXtGhB9dz2/dOtX2KPrW9dIhQDy1QDUHMn8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c5d1c4-12be-4fa0-cfd4-08df31e1a606
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 15:15:33.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ca1Uax3j5FhGjZtUmQ07boSCCuUUo1Qfy/oZHDKX3zcrSjIQz3+w0KaBC9BjgGnKZq1cuoV7ruhqpZ0GNztgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431

On Thu, Oct 22, 2026 at 03:42:11PM +0800, Lin Wang wrote:
> The AMD node code locates function 3 for node N at PCI slot 0x18 + N.
> Hygon has no equivalent node-index-to-slot mapping: DF F3 devices are
> discovered by PCI ID and the PCI BDF is only an access point.
> 
> Enumerate Hygon DF devices by PCI ID and read their identities from DF
> registers. Build a dense node cache with Core and DDR Dies (CDDs) before
> I/O Dies (IODs), providing node counts, identity and PCI function lookups.
> 
> Guests may expose a supported CPU model without DF devices. Suppress
> the cache-build warning for -ENODEV in guests; keep other initialization
> errors visible.
> 
> The node lookup helpers remain local until Hygon consumers are added.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>
> ---

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
