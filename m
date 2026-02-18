Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B9530DEC1;
	Wed, 18 Feb 2026 19:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771443823; cv=fail; b=F14wjh6RdbNJN6DR5Wc9/SSF2FsmXs29HNofZzAaYniA05JvjUrRH1dUM/FeGuANo06ftC2AswlJ8JICehyehXVXkDAL1+5Sh71ywVUjHRNgwFjN1QvnuHvyp6NEnYudElUJ4oUxzYkUeuXfzs8gmRq3HG02rmdO16UuHnHIMRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771443823; c=relaxed/simple;
	bh=NGo4JgbmTuNSVyGXtQmH0Nn3JWJnLiSmyXAp7DHZFgg=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sVKZwUyXHGfbHYvf+6h10aytzW6ivTXGDIh/yUo3bnMOs9CCaqEM+Jr/uqTK12TKC97LbW7W8TLXbNsd1N0bKaQa/3TGD4AH2VX2tTWpOkRUyCdcJpdosSdm9SLU4Tt6fiGJti8eDhUO/Qu1mUOQC4yNnYoUfJaQZMzJSMMYIOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+WCHSaJ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+WCHSaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771443822; x=1802979822;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NGo4JgbmTuNSVyGXtQmH0Nn3JWJnLiSmyXAp7DHZFgg=;
  b=N+WCHSaJDmuzsC5NjrNqHkZGi7v7V9MlAkMw5JYWhe76qSrni+cADo8l
   uOKHdccYhvbJ07OPkBz3hdfISuQ/4bWg1fR75KUoNr3KLU+Oklo3bNa51
   mNy6Ru70DQdzDAlIjMLOKZtzSc7gId78+gzOqaWkQFoprDsuE3eQBaA6E
   NaMJfLMlpow6JdUsx8Ar8FN8C1qKvWaisyT1qiEzEMCIMrXrxaysvmHCW
   SYz8gzzAylH96XQqpRMf9004ty50eQA91DTByNzF2bVRmDbrzYX+LqLCa
   gCVstafyUgKZkusH81gznbxhm/tPAu0iNSRaDKKwli6QWfGwvqX87wMuY
   w==;
X-CSE-ConnectionGUID: 5dG+Dc00Q6G5wV5ZiHSVoQ==
X-CSE-MsgGUID: 8gEE0qlTRIe3/hF0Es4lAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83246167"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="83246167"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:43:41 -0800
X-CSE-ConnectionGUID: xe4Z3o0tSteA1qj6cGN9Tg==
X-CSE-MsgGUID: ociI5cpXRbKCUUjaEfwAKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="214138095"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:43:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 11:43:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 11:43:41 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 11:43:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lu6cxRrID2WwLKBTOJjRs8QpP+ufQwkCuNxY3cJoT5qZda3loQ3nFQ2O3Nj7vhTKKiczSM0am1Icco6WRCd0ZWm+Kt/rZyIn0uiaGpC1g9ptQT4JzOigZTcU2tCyFKLhHhKm1hdojbckVNPsdgBvHoQPqHw/TMH1VAkoSiVglDMLX6bIyA8JPLWwyuVPY6UJqB7rWD5Rx4d/NyJS5lJC8bKRDn1J9NjKT0MVFrFMWTJbzcdB4keM3SV2tMmn+7TWBJz+TpJKvVAln6+ng7TuUmhil5dWqOFpWJRBQ8ZDITknKCM5jPl0caIFX7r/y+RRjZupQT6NyJobCciexYjcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx3xwNj7A72yA22TdYufd80eUYjUo2+sBzWfrOp5W/4=;
 b=gfFjRTPaoKgUkbNWLA4AdXvvm5mI4JYoutBRQJHf3kL/9AYZVMa2oTPZeIrXicgZG5Nqxlp/+xl6i7GdqLxSLh1UzzaITpDYn8WM/Ul4+Wm9GAPaBqsgYE/V8gDiHaR4e4VIthYOCWlWQMqFqhSO8YHvq1ienQRZIfClOI2JYTsshxOObfrJoMD9Fyhow1xwZHyu4BiKox8Ip9U+VaiX8/wRy6+ayJUTQp1kFQljMfWA4Rgz2n8TsZupnYsR/y6Lh6xiH8HpusqpuKaqPgeeLjHZKZt8Zixj2EsrSvZ3ac3c1CRO+L3/o99i3Mp9hlyX1VOPitMZsKYfXfFxk/NN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 19:43:34 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 19:43:33 +0000
Message-ID: <2ff19b89-8bb1-4670-a54b-326ea05ca49b@intel.com>
Date: Wed, 18 Feb 2026 11:43:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] peci: Remove dependency on x86 CPU variables
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
To: Dave Hansen <dave.hansen@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>
CC: Borislav Petkov <bp@alien8.de>, Guenter Roeck <linux@roeck-us.net>, "H.
 Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Iwona Winiarska
	<iwona.winiarska@intel.com>, <linux-hwmon@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Thomas Gleixner <tglx@kernel.org>, Tony Luck
	<tony.luck@intel.com>, <x86@kernel.org>
References: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
 <02494c50-8239-4e9d-b653-451728e5b5fc@intel.com>
 <5cfea5f4-1ced-4559-8de1-4e96116536f4@intel.com>
 <513b4954-6c41-44f1-ae54-d7408ccd999c@intel.com>
In-Reply-To: <513b4954-6c41-44f1-ae54-d7408ccd999c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|DM6PR11MB4564:EE_
X-MS-Office365-Filtering-Correlation-Id: be095e35-1124-47cf-b52b-08de6f260048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHdUOEY4di81RHFVS29Pa2FENUFpS09RNGk1cU9xemU1ZFY1WWxqcmxTOXJk?=
 =?utf-8?B?RHdWR3ZNdFBHRVJ2M1VTSGZrdXhtcVhvdUQwVVRRR3NwbUFxMlgzNEFuNWkw?=
 =?utf-8?B?TGFiSTZPb0IwQXQxSGFXZ1ZtaXR0a3BNSmZxY1BMeFdGS2FkeGxHd3B0RThC?=
 =?utf-8?B?WUNaTy8zaUttNExnTFQ2djAxNXZUTGZLRGhEMDhzZC9ERVREWXltTjMvU3Q0?=
 =?utf-8?B?YVJmMmpQczYrOGYwa0JHQUJqSi9sREViU2k4S2xibTd6UytmSmJKYTVhNnRx?=
 =?utf-8?B?dkNpTHFHeHMrd1NkZDBSbW1ndlNDUmVtcHFRVFRRQ2VndHh6ZHFMTFdTdUhD?=
 =?utf-8?B?WnAxZzhVRXEyWkUrZVpJcTlRTkJxUHc2TExnTGlieUNwNWRyTFhRV3l2WUhO?=
 =?utf-8?B?eUUySnJ6aWd2NUZPVFpNQ2pDMDZ1SjlFUjdhRmpSbHhSMFErdmJRT09CK2pB?=
 =?utf-8?B?NlR5N0Fjbk82M3dFSFlvci9tZ3lTS0wrZXNMOWpybHFSaFc4ZytHTEJOeUZN?=
 =?utf-8?B?Z1M3MHBFMlM2cFV6ZVBmMnVSUU80S2MwOVlrV0NwMjRsQU1YQThkaFdMK0JC?=
 =?utf-8?B?bmc0M21haXUzWCtUeHVtRk5HcXJxYUMzMS9yaXQ4QXpDMkFQVC9TcjhrZVh5?=
 =?utf-8?B?dUViOUVGZjIvOGZ5NC95L3ViM3ZCVXp6Q3ExSGNWWVpIM1V5a0tPaW9ZUHFN?=
 =?utf-8?B?eVRUb2hpamRtbUpYSXh1N0lYckpRNkl5Q1pnTGFpdlJwWm56K1diTmtzMWxS?=
 =?utf-8?B?Q0VPUVhIVlcwVVRiTzNzZzl1b1RhRUJvZUNQdGZtdU9MQzl4YmJlQmxjd0ta?=
 =?utf-8?B?ZWY4WWp3b2hkdFArQlN0M1hBKzhQR2tIZllDLzlCZUphR2d4VGEybGpvOUhu?=
 =?utf-8?B?UlBqV05URUUzL3RaSjVSWmZGY3VzT1hnL05sb09hQ3cwYkNDd2pKVWpNanQ1?=
 =?utf-8?B?bVI1b0pXNnN5a2IxN0R6VXZxSE5qV0FEamxUalRnN01vYlpTYUx3WTl3bk1B?=
 =?utf-8?B?dGg3czlNVldqa09DQkoyR0k3bzBsTWJSZVNZMWNRKzR3R3Q4RUpBNUJMUzUy?=
 =?utf-8?B?TmVGOHJjZTF1NDlDdGxpQno4clJDSTFNRUlEU1VwUkVaNVVlYTJ2QlZmRXpl?=
 =?utf-8?B?TGpJaGVLVWhPckw1TWtJdTlPSUFzSWJoR2dvQTdQcm00SzJiSUxoUytoN3dy?=
 =?utf-8?B?blg3MlIxQ0xleVpWM0RPeFZkZHVnZEtxcXUrMW5OZTUvNUdlR1c3eWlvZWFH?=
 =?utf-8?B?SVgrQy90VVJ2bWM3S0h6NHR4SzNvNEZlRnpnMDRockw1NXlYNWFqek5FUkZp?=
 =?utf-8?B?MWsvQkoxQ1NmTlBQM01ZTTltNDdBd09zZkEyaWdYN2dyMFp6U0RVRlR2MVlV?=
 =?utf-8?B?ZVgzK1FRemZKQU5ERXBuSHIwOGU0a29YWHFzdVM0N3BuSm9RdXNURDJwSUZo?=
 =?utf-8?B?SDNRWkFlVS9Ya3VKWGNvTFd0SytrUmlDMEJyS3JRUFhvWTFZNlErZFJSMUJ0?=
 =?utf-8?B?MUlIckpYZDlJSXQ3anJGU3IyaTh4NG9HeUVweU5wbC8zRkFWbzlHZkRrcHZF?=
 =?utf-8?B?dHp1L1pzbG9qcmNGRkVHWS9WRVFqRERXekw4VnBWMG1zQXErdmwrUUhuSDFS?=
 =?utf-8?B?RE4vWExDTkR0Mi9ZbThxeW1MNExVTXNNaDB4VlVzS3FTQzVSaG1TM2sxQStk?=
 =?utf-8?B?b2V1MnROV2JqaUQ4K1grb0dtOUJoL2pwa05XUTlJM1ZpQW5iYmhKQllqQ1Q3?=
 =?utf-8?B?aUhoVVlvbXBCS1NjM3NXdnpXSXY4NGtPK3E1dU94eCt1UjRDeUtVZk11YjVh?=
 =?utf-8?B?SVQ3Nm9XMlVLS3FpL0YvMG0rNWhrQ0kxYmxxVWJiVTZhMjNrMy8zeHFCS2NU?=
 =?utf-8?B?L3J0UDFVb2hRR0NSaktYVWpZSDdmek8wVWs0UmExVXBKNjBNaFFpMVRlWTNJ?=
 =?utf-8?B?c2VJQzhLSno5QVhvOGhOR21aZ29OREJqODJwVWZldEVDdWM1RC8xV21RRGVh?=
 =?utf-8?B?OHRwQitLcnNscENoT1o3KzhHM0pFNUZNS0FCNHBlQ2pWWEpxMGVnMWxmdzg4?=
 =?utf-8?B?WDF1b2ovRXc5ZDZyQ0FPeEtHaGNTSEJ3dENHaDlMOTNsNXBDTjI1dDdhbkJQ?=
 =?utf-8?Q?h6Ys=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFJLT2tvczZHRVMwazNoTHM1RllIcStacFpibU9oaFlOM3F0K29PSGZBeVZB?=
 =?utf-8?B?SFMwcE5vYjNnVkZFcHkyTS9MbGowUnl2ejJSSUJjbURJbHZvL042QTFuMTRL?=
 =?utf-8?B?V29YTG81T2dEc08zandXdmdGSDRkTmg5clo4SFdhZTVZQXpnUytUdTNmZVRw?=
 =?utf-8?B?eWFLczU4dmZwUEdYRXV4T1U1VyswR0xveWRkN1JmcEVydW1pZlRvVURqUkxI?=
 =?utf-8?B?MTljemU1ZU9xREZvUEN3UllwUlhjTThqS0lrMm4zenk0MWdzSFp2ejY5UkEv?=
 =?utf-8?B?ZWZ3aGZZeVVTMXNVUDNtQ0lNUEpwYkxEaDZ6MTNXYWtURVZEN3ExR0VNYVhn?=
 =?utf-8?B?RjNWWU1UV2Q4SnVJSTJqYUloeXZpdW4xNDFFYXpHaGtmOWhEUlhEcG4xYWk5?=
 =?utf-8?B?c0FMN0kxN294NnU0SExMTmVtdkpsSEh3WlYxTnNEeEV2dStoOFVmZjIwd1lV?=
 =?utf-8?B?eDNXNUErbHlncFlOampkWS8yZEErcTYrMm5meHZFS0tsZG02dkVqZk1HVDBo?=
 =?utf-8?B?ODRKMmd5MysyZ1liandFVEJPRmZ3TlN2bDBiaW1tS2QzamdZeEI1L2NOK3J3?=
 =?utf-8?B?aDVlQnBCZ054SHVINXYyeG04NVZWU0hhNDhMOUVkdldlckVwTWQ2S0pCT3Vo?=
 =?utf-8?B?VENxQjBuZ1dBaTF6MXdIcnVhL2hXaE5PWk8rN3VOUnZFZFN2QzY3T2FPcGJX?=
 =?utf-8?B?bDZkQ01lbWd4d0QrVWtVcmZna3NIN1BmbFVxN3M3R0pLZno1RTQvRm1DR2Y5?=
 =?utf-8?B?TytURXI3M2JSUE5IOFhMcC8rYW9USUp4SzkxY1hQbHR6TjdDL0VXK3RqV3pu?=
 =?utf-8?B?Ym45SWcwQjdZcEV6dzc5NGlDMGZ5bFlDZGxyRU95QnNEN0pYNmd0cDVTNG9t?=
 =?utf-8?B?L1BLV1huQXdjQUU3OHM1NVVsZFFoY2FudDkrdzV3L1V1L3RjOGN2U3Q2YXky?=
 =?utf-8?B?dXpOemZ1YmNBWFQ4MG5Oai9idWZtTjNiUXVsbC8wTkVaWWtsczBuWnJ3c3lK?=
 =?utf-8?B?aSttYndNMElOOVR4eG92bVdYcEd6MTdCRUY2am1BWmg5OWl1VWlCcWFOemoz?=
 =?utf-8?B?TTlyc1FRSjA4MzdFOWNUTy9JZDgwa2tTOWNpWmp6NU93VWFzNjhGV29GY1oy?=
 =?utf-8?B?MnIyQ01RUjR6bVlSc1BUcStRWTBuVkdONnpvUHIwOGZIM1NqOXFTUk95M1VS?=
 =?utf-8?B?KzBaZXFxZSthK0FpVTliang2MzdUbnNvNTVuQnhqOFEvRWhHWnhIc1E3enJx?=
 =?utf-8?B?UEV3ZldkNWpZVnJEcFd5azgvZ1Z4cGVsbmEzSjFvR1BwTHl1ZHpXb0pmYUhx?=
 =?utf-8?B?M3Q5S2p1QzB5dlB0SXI3NGhqMURycXk3OWRqK1dTVFpwS1lMdFhmTHBydEdD?=
 =?utf-8?B?dVpJcDc1N0VJMkVvWGRPdEg5N0hXWnpKS2xmQnpXcWZxem43V0JScmVRNzVt?=
 =?utf-8?B?UkRNbXU4WUVKMUlZdzV0R0FQc21vY3hJMGxJbHhPRXlvb3FBWnV1TlNpKzFZ?=
 =?utf-8?B?bDg2enZpNTcrcG9QRXRUbUM0Y1JSMyszTnhoQ2crYmxBNmxuZHNvRlZPd0pm?=
 =?utf-8?B?MWRNL2RrOVNURGJKOW83VElQMDA1U1NEemI4Z3BjWEUwMUlpL3FmdVovbnFB?=
 =?utf-8?B?MndzSDMzNk9XZ202d2VuL1prZ1JrdUw3ajd2VjR4ZjRLSkUyMkNscU1CRmJh?=
 =?utf-8?B?Q3UwbCs5RlFKNHVERGZrOU1KUnV5SHF1VmZSUnZuWkFwMmIxUXdvNmtiMGJG?=
 =?utf-8?B?c0VPRjdvMHFlZDV0Uy9kMmlWRnVsQTlKSCtyN2xMd055VEwxWTAzdnUrUWFR?=
 =?utf-8?B?WDZxYXFVSXlXVWE3aWdkMTlWYmdYZEVObkVCWmk2VzhSZEZMT2JnM25zOXZj?=
 =?utf-8?B?VlRqczlMUHpTaFlQeng2SSs1YlZ4TFFNaXA0WXI4UVdGcnBBTG01QVcyOU9L?=
 =?utf-8?B?T3U0Y0toTEJnc3V6RmFvVlI4L1M1S3orWHFSMlZONzBNaGtxTTJVZGFLQitV?=
 =?utf-8?B?Ull5VUhXUjJhMnFxSU5lem5vYkt3dytaTENKV2FpNHZXZStNNVkzQitxUGJX?=
 =?utf-8?B?MGRIcTNoZWxXVnBVY0NGWmZ2Wk5oVktsakgyR0l5VmJMUHdnVVJ0dkRCMWpV?=
 =?utf-8?B?aEdNU2k3LzdSVG9iRXdHYzdJNzlqRzRNbmZESXhLdng4c2dHZWZZcit5Snh4?=
 =?utf-8?B?c1ovMGNFUHlYdXFCbDFqSU5ER0JSUFhmZXQ0UVVmTDBWdFYwcW5maXFpWVJQ?=
 =?utf-8?B?OGRpQ3pFc3kwUmFXNm5DNWFrTkplMXFlTTYxQ2wyY3VNYmc1VWxkV0hia2VR?=
 =?utf-8?B?YXd1SjNiSE1GMHB1Mkw5UDJST0hSVnlWTURWc3Z3TVBaZ0RqOEZsdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be095e35-1124-47cf-b52b-08de6f260048
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:43:33.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB8mQe2UTVRbErK+Rw5nbeNGS2snHUjwugxDkRz3yFBg7947+WfZFhqWQR9sztkYh/uH0LYkeLt2nm5w4bZ0+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
X-OriginatorOrg: intel.com

On 2/18/2026 11:36 AM, Sohil Mehta wrote:
> On 2/18/2026 11:30 AM, Dave Hansen wrote:
> 
>>>> +#define PECI_INTEL_HASWELL_X		0x306C
>>>> +#define PECI_INTEL_BROADWELL_X		0x406F
>>>> +#define PECI_INTEL_BROADWELL_D		0x5066
>>>> +#define PECI_INTEL_SKYLAKE_X		0x5065
>>>> +#define PECI_INTEL_ICELAKE_X		0x606A
>>>> +#define PECI_INTEL_ICELAKE_D		0x606C
>>>> +#define PECI_INTEL_SAPPHIRERAPIDS_X	0x806F
>>>> +#define PECI_INTEL_EMERALDRAPIDS_X	0xC06F
>>>>  
>>>
>>> The _D has been used in Intel official product names such as "XEON D".
>>> AFAIU, The _X notation is specific to intel-family.h. Should that be
>>> explained in the comment above?
>>>
>>> Something like:
>>>
>>>  *	_X	- regular server parts
>>>  *	_D	- micro server parts
>>
>> I think I just verbatim copied the intel-family.h names and added PECI_.
>> Are you seeing something different.
>>
> 
> No.
> 

Scratch that. I see a difference.

#define INTEL_HASWELL			IFM(6, 0x3C)
#define INTEL_HASWELL_X			IFM(6, 0x3F)

PECI_INTEL_HASWELL_X (0x306C) doesn't match INTEL_HASWELL_X instead you
seem to have copied INTEL_HASWELL.
