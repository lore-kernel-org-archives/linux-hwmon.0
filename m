Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5617D19D8AE
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Jun 2024 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718373433; cv=fail; b=RA1s0gjyIbqPC1miR95wJNlosThNgHU246qyUQjcx8m7giQHY8/lQsrgHX2/iwY2ahcZ2Gcukkys0qF5NT2Sg7CBViwzAhaVZycOFpnqjnCakGKiGxsdrsjn38V/oNcTuCasBKHRpbagwZSBBMtIC+2XcZ+s/KK6i2dkuiZvBNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718373433; c=relaxed/simple;
	bh=b2t9U4DU2u1fZT8kSwcR0Q4EdN5fr16NSP8HJh7s7ks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KKUvjwBa+wlupJaYW46an2j9kl1OPrse5YnA0jKEjmK7oxcwbiitcsHes4ogxHYj5fG2ryI6tifu0JOFPq3jXB3M/P1rNVQqy+EH6tTHzuRS3lO8x1LduPgGSSFGIeETM0Ttfc6bBgNORUJ8v4YSMxJH1CqMuOFGJre4K2MYIg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RY9qLftb; arc=fail smtp.client-ip=40.107.244.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RY9qLftb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjwyQNOWE6Bb3rQpe/E2fRd9ksVkJw7bGuGA/hYuCrNq/NdEL+elc9n47bVpMapf58cMjmGrkBiViiEkwDoVL6YH2tkU1bpTH7nlR+pcD40VsFx73O+mUN6XJYO+Ke3Uq1LeQc5xDbi2jGDEw7Whe6mkPlhTXCYOrViz237hhHa/WrwU0FRWDS6UQr2Ivhyq8/eKzmncjBTFhrxFHQyyyAnV6ITBq9UXB0eKcc1kG6urJuT1qbu2njS8kPYXwiwZVhi+D59sFmlw1Z2RAldmmEgImf00GGHe3fqMPqn7orbGxBccThgdct4j+QKnrNWKNe+50JUU+6YlG2ZblajtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EiWLLRmy3cwefY4ZZIOmVzjsJ50ZMIvis7Hph61iVA=;
 b=W2PYJKf3tExiQSwhjY9AtiDMYRk8LfFTHE8GbVVWncPoW/SSZbCOwrMXE3Y+l8hDmXuJMbT4ydXRgYEQmwS1vySU9I+iMEBRGgsCvRi7QVE1EXKVhWZ6i56GSj+uMV/04NSWDkYjYai7iSYhwj1bVm3u1MP2twyJxUfQ+3u+Tes98rOSpf2Ad5zzGnDy4zOnKCp8FIVqLBXW6EElCTlLSLiv1tKdJKRbSybmjkaofcGY3LYYTHQKqtw+QThduyPD8h+gMr2JjqlsO+6W+JlBLXkycuNtqI/77yeIQ/SrE2CJHe2Rsij1rbtlDjGL5A7K/j0qjl3zOstzgqeYPrqC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EiWLLRmy3cwefY4ZZIOmVzjsJ50ZMIvis7Hph61iVA=;
 b=RY9qLftbVT+2SsO+7P5+fB/eFY3i7v4B4PdvDMfdaqgTg9T+Ni81EX2f/uEdBU/3YBJU8CKYcavbWbohzeS6nRkinlF9fHC1FKQXAUR3qMQ6ilbjlxQaBgyZMZl3kJq+U/DWet460iFlXAw0Jm2eSpNVzO6vcHfEwCGQCu5kTaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by CY5PR12MB6321.namprd12.prod.outlook.com (2603:10b6:930:22::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Fri, 14 Jun
 2024 13:57:09 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::35a:28cb:2534:6eb7]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::35a:28cb:2534:6eb7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 13:57:09 +0000
Message-ID: <e37f0503-0ae2-4651-8e32-1e6444e852c2@amd.com>
Date: Fri, 14 Jun 2024 19:26:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] mfd: add amd side-band functionality
To: Lee Jones <lee@kernel.org>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
 linux@roeck-us.net, gregkh@linuxfoundation.org, arnd@arndb.de,
 Akshay Gupta <akshay.gupta@amd.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
 <20240613170514.GQ2561462@google.com>
Content-Language: en-US
From: "Chatradhi, Naveen Krishna" <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <20240613170514.GQ2561462@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::19) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5286:EE_|CY5PR12MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: d15251da-d93f-4875-d456-08dc8c79e1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTEvVHBzbElMQVJNcFNyWWNvcC9DUUl4bVNwUE5SYkc3U3NaVHhHV0NSaksz?=
 =?utf-8?B?cDBHZTRROWFFYzNnSVNjQURneWlycmhUbzVtaXdDUVBvUGUvZVdISGIyY0g1?=
 =?utf-8?B?TmdYUTFjekR6MzdzUFE2VkdhbE5sRHIxbFVpNGJmQy9SeG5EbHhhT0VMc3NG?=
 =?utf-8?B?MGxwM1Z4Z1luT3ovMlMxUDJuRWtVRHd1MVBGY1pvYmZyODkrcGNsT2pJUWwz?=
 =?utf-8?B?dU1xbHVFYkd4RzN5cTQzNXRHUzNHSzdwaTV2c3pvZHJyVlhPWUFPUGRoTFpz?=
 =?utf-8?B?MEZKd0F3b21PM1FvRHBXZldNM0xMVGx4VWw5NllwVlpqRFhDZ1hCTnZhcFUw?=
 =?utf-8?B?V1JzTm41cXRSRUFqZzcwSWVKeFdScnBOVXlJWDhIOHVlZHVEVmZ0cUYzMjVO?=
 =?utf-8?B?Y3gzZTVqUUJnZCt1VXFxWEhRWWg3MGNKNExuMmdoQnNqbHRPOUVqaWpKSC9x?=
 =?utf-8?B?K3dNTmpuSUUrcWtEdFViRkRHWTBqNlpjUml1bjA3dXRXN2swUS9nN2l6eTZz?=
 =?utf-8?B?L0E0M25kVm1icjI5Vkt5RVZESE9Bc2NQSndTMHZ4QXpzS2drSG80NnJXNzAw?=
 =?utf-8?B?YUttV3JNVW0rZlBqYjExRllsK1ROamxEM2hVcjdQenExMTRSemdzR0RPUkpV?=
 =?utf-8?B?OThDdGRVZlpZL245ZkFHeXE2YzFXb1NoQ2UxeFhjTzU2RXVOU2NRWWRVKzBw?=
 =?utf-8?B?cVp4eVMraUczUFk0ays2Ymt4dnRPK05ITTNscWRoaGVkbVh2a0IzY290a2FC?=
 =?utf-8?B?ZWhDQ1lnTmovaTB3MmJMNkRkT2tnbU45WGlXc0FmQ1h1RHVxa05NRXF5dEJN?=
 =?utf-8?B?OHVqNVlVaHlmK2k0Nm5kVHBOZ0poSXpTcitrSkdwQW9UcCtnZkZQcVVtVWdN?=
 =?utf-8?B?R3FaTCtQcEI2RkozR2ZWSUM2K093aVI4MzlUVDM1QWJ4WC9KVTFWeVRibHU2?=
 =?utf-8?B?RmZVakZKbzlXcGxRekM5UFI3RnoxRlNSQ21SRDdXdWpzUTZsWDFEUkFiQ1FM?=
 =?utf-8?B?cWJyZkRCenlRdnh1Ny9DOG03N2tQMjE3VTdkVUE5K3ZYcVgxV0VlcEpPTkJJ?=
 =?utf-8?B?eENPODNXTGJuSE1MTWp3cWI3S0lYUVUzUEpSWlYxcUVGK3dvZm5PZEZoZUR3?=
 =?utf-8?B?L3UrWGF1RlpkRG9vNEJvSWFnR01kVFMxOW1WMmkzRzJISHAwdDlnRmRqQmRn?=
 =?utf-8?B?ekFUVFk4WnB3UjBhSVg1Q2dFZlVleGRFUDR1SnJiczI3M0lEWnpBTmUxSmNU?=
 =?utf-8?B?UU1NaWpmK3BERVFOdCsrdHVyMjBURmVteE9KdXp6WHZaU0IyNGIvZ3crTzhU?=
 =?utf-8?B?WjRwKzVVeEIvK2R3QUhHZFBEYmZKamVaNTlXNE9tQ2l5aTRnUzJ2OWswdTF1?=
 =?utf-8?B?a0o3eEhaTEsxN1FHOGhnSXJwZVRiY2pmWlFRVXFnNjVLMUpWQVhqVlRqZldR?=
 =?utf-8?B?N0NoSituTnduOHB3cjkvb2xWTzh1aHlVUUVTa3JzSGxlcGJkN3R2ZGVMNkRS?=
 =?utf-8?B?NnJSeW92SHZSdGJZdTlOWGlpaG1sS0c3WE9hb3oxMU4yQUFPWTduZVhiZ3JV?=
 =?utf-8?B?WUV2NWFrclk1OW5VWXRHWHVISmV3OUhubFNxekFidUtaY2ZQQjZVNUhXNjJO?=
 =?utf-8?B?S2pnUzh2d0c4bHVWSVQ4MXlrdGU5NGphL2NvUjdMWU5ZWHBXOGxuOHdSeVA1?=
 =?utf-8?B?emxWMXJJcGRpdHgvRDdmYUR2bUllZjBXQWluT1ExTllHNS9SQXFBOVlKWUJJ?=
 =?utf-8?Q?L76cZ5eD7Dbuj9PwRp3WYOBgtqtMC9nAbe+bhr/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmJpVFpscnFOYjgzNXYrZDJlVWtZVzE4cnpDN1FOcXJONW9rQ2ZzOXIwS09t?=
 =?utf-8?B?elhybzFVNFF6c2F2cG1oVTgvalhkNXFJQUtaR01seitnUFVldHZnQnJTRm1l?=
 =?utf-8?B?WmpZUi9RYWhHemZBMzQrRVpsL05FbjdnK0Y3cmxFamZpLzdkSW9pQlpLWlBH?=
 =?utf-8?B?cnp1SVpzbzA1Qk44Y3h0QVlGc3Izc0xDWXZkUFhQRHlpckNza05hd204aGNv?=
 =?utf-8?B?c3lBNWYwd2VwTWwzUDVlb0hvcmRjaFo0RE9TMEcyc3lnT2JKR3ZHOXFhQ2JW?=
 =?utf-8?B?bWVnQVNmVFJveTFJdHljMzhIaGVmTnFQRHQ3b0lORHNqL0thS3FFQmlVdlk3?=
 =?utf-8?B?d0NhU2tRM2gwdFhLajl2bnRVNlNDSEQzNEpEMkxSM3lYV0IvOGM1ZUdtK1di?=
 =?utf-8?B?RGNOdCtxSlBqM3ZFb0hEQkVKckRSMWxuSVE1NW91QU1Oa0ZKT3VZNlUya25O?=
 =?utf-8?B?bHBUaXQ4RkFHRkRFV2hCN0xLV1RoMXJrK083QThkcW8zYXJXRFQ5ZHA2RFND?=
 =?utf-8?B?VGtvRnpGcDMwdTFsdkYzL3I4WU1RNERwQVJEWXdPN2dEaENVbG0yS1N3eHpX?=
 =?utf-8?B?T3RKcWsycTE5K2hlYmdvb2xGbEx6ZnZURVh1a080Rm8zR1R5VHJNeDE2VG1R?=
 =?utf-8?B?RkI0alVZUVJYL2lTQmVkU0Q4YmNRZUJxQ2MreVNSUlBpeDVqV1ptS0syYmhr?=
 =?utf-8?B?dHZvV3pXNDRxVlFKampGNDhxNHM2SnYvcm54YnU4MEg0MTNXT1phQWRtNndy?=
 =?utf-8?B?cmN1Z1FKd1RkZ0JzbFpwRW1oaVVhMGVaN3A0dG1JZGU2NnRjckpCcm9VSi9G?=
 =?utf-8?B?YWo0b256dlZjbXFicm05SDNYeE40Q1kzVnJHQ2hMQ1pjeTFhWitMVWZoSC8w?=
 =?utf-8?B?V2gwWDF1Z1dpUmNGeTNlMTBjcCtxRm1KYVI2TjJUc3kvdjBLU2FhTEYxN1RG?=
 =?utf-8?B?S1g3V2tCZmJvN1NUZW40dGpLZjlwTW9mNXhxT0dCenNmZko3RllMZ1BPWGM2?=
 =?utf-8?B?Vmd1R0w0cGI3bjBmMXBWNmgwbEM3TFdWZzFDRTI3UmZjd1dDbHRxdVhXZFB3?=
 =?utf-8?B?eHFNR1JpTFBrQ2wwZkNuQ0RpL2w5M0o1eFJpbG9qTXA1Yjl2dzVhejJiRXEz?=
 =?utf-8?B?ME50cFc1eUo5UitaR1oweGlUYmo5cG10Y3FEdkhTZGpoK3V4bHByR3g5Unla?=
 =?utf-8?B?U09scUZCZjNyVTRkdDVwNHd1ZXZCTjBKYlo0TTZsYTljeWpuekpFV2FJUVN4?=
 =?utf-8?B?TXNScjRoK2VHRUdkdlFweG90U3pOcDRoUnhjZ1o5Tjc3dFE3SlBCVzhEb2ZJ?=
 =?utf-8?B?T3pMMzNqZHNzN1c2dE5YVmdQQThnc2xQY0MvMkZQbDkreFViTFRjVHZIelRV?=
 =?utf-8?B?Z2xUd0wwYVZ1SXBlN09YdmpOS091ZXZlbzZDbGpZdkJwY2Z0Y2NCbmdxeXIr?=
 =?utf-8?B?S2EvY3ExMXkvZnJUUjhsT0Nhb0N5Q3NweDBmMjZ0V0xvTDRBRDl3TFFSTUxY?=
 =?utf-8?B?dE9ubmR2azVVRE5yZUV4N3ZySmZnalVzRktVdm4yRVRlQUg1dzlJTzFFTHYy?=
 =?utf-8?B?MUcvdWxOd0lxV1BnYllhWVVLVzQ1SFVzd09jQm42cnZLa1N2QVM4eUgxeENk?=
 =?utf-8?B?VU13andTUHBxUWVRTHczaTdGMHlvZkI5Tmx2ZVlyZFJMdk9WSk96cUMyTXhQ?=
 =?utf-8?B?ZTU3a0ZkeGNKQktuTWt0NTZQc0d0eXJiTGZTTWVSOWh6NmpsYmlEbVdmanU3?=
 =?utf-8?B?cTViRWZpRVcrU3JCc3FQSlZ3Q1paMDFXQXFIT25uMm1DbTI4MzNOSkNURkZ0?=
 =?utf-8?B?TmJIOHBjdnRXbE1SRDZydHFpU1lNVmw3a256ZmdRb3pDVittQnlGNE92Z2dV?=
 =?utf-8?B?SW8zdmFiWkFPQkFFN3dmbU11VlZaM1Nkc3BIKzhlYXBnNFM5eVdXclFxcDRj?=
 =?utf-8?B?cnF0c0x6bnRVdmg5M3lHcXBQMDg3Y05iTmV3M05JYVNHcVo5MVFFOU9RU3F1?=
 =?utf-8?B?RUFDQWJ2eDczSUI0cXJFWVdsdnZJSjFidUIzSXUyQWIxNHAwQ2I3NU1ZNmFv?=
 =?utf-8?B?bWdMdmtTRUR1ZTFVMEpiTFVkWHRneHJRNnJJTkdUQjRzN3daMWh1OXlCeXA2?=
 =?utf-8?Q?L2ROV/sGUMXJ1Nu9ZtLqGe9pg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15251da-d93f-4875-d456-08dc8c79e1df
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 13:57:09.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1O6MQ8oX2/g3pqQx+ryOh+SHgrzDEB7u8SN3gXGDVtv4YW84xXv0UzJ+jMmmN0EjCl8rwoNjimK/W8FLjqbwJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6321


On 6/13/2024 10:35 PM, Lee Jones wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, 30 May 2024, Naveen Krishna Chatradhi wrote:
>
>> From: Akshay Gupta <akshay.gupta@amd.com>
>>
>> At present, sbrmi under hwmon subsystem is probed as an i2c
>> driver and reports power.
>>
>> However, APML interface defines few other protocols to support
>> OOB system management functionality.
>>
>> This patchset the following
>> 1. Based on hwmon maintainers feedback, move the i2c client
>>     probe and sbrmi core functionality to drivers/mfd/
>> 2. Add an MFD cell, which probes the hwmon/sbrmi and continues to
>>     report power using the symbol exported by the mfd/sbrmi-core.
>> 3. Convert i2c to regmap which provides multiple benefits
>>     over direct smbus APIs.
>> 4. Register a misc device which provides
>>      a. An ioctl interface through node /dev/sbrmiX
>>      b. Open-sourced and widely used https://github.com/amd/esmi_oob_library
>>         will continue to provide user-space programmable API for the following
>>        - Mailbox xfer (already defined in sbrmi_mailbox_xfer())
>>        - CPUID access
>>        - MCAMSR access
>>
>> Akshay Gupta (5):
>>    hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
>>    mfd: sbrmi: Add mfd cell to I2C probe to be used by hwmon
>>    mfd/hwmon sbrmi: Use regmap subsystem
>>    mfd: sbrmi: Clear sbrmi status register bit SwAlertSts
>>    mfd/hwmon: sbrmi: Add support for APML protocols
>>
>>   drivers/hwmon/Kconfig         |   1 +
>>   drivers/hwmon/sbrmi.c         | 284 +++-----------------
>>   drivers/mfd/Kconfig           |   9 +-
>>   drivers/mfd/Makefile          |   2 +
>>   drivers/mfd/sbrmi-core.c      | 490 ++++++++++++++++++++++++++++++++++
> It's not clear to me what any of these 500 lines do, but they do not
> look like a good fit for MFD.  Perhaps I'm missing something.  Can you
> provide some more information about the device and why you think MFD is
> a suitable location for it?

Hi lee,

Data center processors from AMD provide a side-band (often called 
out-of-band) path for manageability

called Advanced Platform Management Link (APML), which consists of 
i2c/i3c client devices called

Side-band Remote Management Interface (SB-RMI) and Side-band Temperature 
Sensor Interface (SB-TSI).


We have i2c client drivers upstreamed under drivers/hwmon sbrmi.c and 
sbtsi_temp.c reporting power and

temperature via hwmon interfaces. However, sbrmi device can also provide 
performance, telemetry and RAS

monitoring, management using AMD defined protocols. One of them 
sbrmi_mailbox_xfer()is defined in

drivers/hwmon/sbrmi.c.

Patchset would do the following

1. Move core functionality from hwmon/sbrmi.c to drivers/mfd/sbrmi-i2c.c 
as an i2c_driver.

2. Convert the hwmon/sbrmi.c to a platform driver.

3. Use mfd_add_devices() API to add cells which will probe the platform 
driver under hwmon/sbrmi.c

4. drivers/mfd/sbrmi-core.c will contain the common functions which can 
be used by i2c and i3c based drivers, such as

core protocol definitions, creation of misc device and an ioctl for the 
user interface.

This patchset is an attempt toadd support for these core protocols in such a way that Open-sourced and 
widely used https://github.com/amd/esmi_oob_library will continue to 
provide user-space programmable API. regards, Naveenk

>>   drivers/mfd/sbrmi-core.h      |  37 +++
>>   drivers/mfd/sbrmi-i2c.c       | 165 ++++++++++++
>>   include/linux/mfd/amd-sb.h    |  55 ++++
>>   include/uapi/linux/amd-apml.h |  74 +++++
>>   9 files changed, 871 insertions(+), 246 deletions(-)
>>   create mode 100644 drivers/mfd/sbrmi-core.c
>>   create mode 100644 drivers/mfd/sbrmi-core.h
>>   create mode 100644 drivers/mfd/sbrmi-i2c.c
>>   create mode 100644 include/linux/mfd/amd-sb.h
>>   create mode 100644 include/uapi/linux/amd-apml.h
>>
>> --
>> 2.25.1
>>
> --
> Lee Jones [李琼斯]
