Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AA329D291;
	Fri, 11 Sep 2026 01:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089042; cv=fail; b=ScPtL08fejs+J3WZFpWWiYvCC7SEtICZp0jBi23yq1TP4P8XaKNUZ3amSDfCrqTJ7GWJv505OSs8JbRVqd1tJwJCpgGIc7R2ZauJMIgFhri4GP08EKmxJjDGPu8BFmYlqY+8dGPFmypssOxtfC37ynMqspvdoo7MpbP6/fIKvOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089042; c=relaxed/simple;
	bh=G1GmCzbcfyKuS/h566zp6e76IuTVXFlaov6SZo5eHLU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z2rR95AuYfJC7e5dpRX8QOdQIERvR6ozxEpuGH0nJmQSF3nMg1rUkJXtHpX4ap5371TcrJlskc8Uf069By09BOPC37NNg+HkkU26EFppRhU3+3vHcX2VbjlwsZ8os5ZcS98YUiPdPrFwRRi8gIB8WiPqohLpbW327Ndbefmqk48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=gGnpyeCN; arc=fail smtp.client-ip=40.93.194.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="gGnpyeCN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDEh0nuhPI1QgaBISkE5jXHRrd9NguZE8KOem4W3z2I+++JKY05KKSKqjr5S3M6lvSEqvIVhIM4CjE4rXlwcNQ7uAdTy7I4UoYXR3G9jj51pZVmTlnooEtzVaLM+Gm6b2NWHBpd2WF09U5h7QKou7Pw/DY8LCtWuwyDll2pneRsiNsAIsDrFbDjRwW1etHGaO2+CCFM+GlCNgA5vBSxTJl4aB/edwjFWQUcsZ4EETxmrrIXVNzcq1ocA3/zbh0qgUfVWapYx0Wpff4JP0efian2jVi4vpmPXQF4BsDptTFjRfqs7GvkvQwA6byEy1GyRiYJtC3KUP7M9wifR2dKQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzHhfzHf3R6kMOfpqY0qeJn0M0JwOl9wbDcJXoLxiAc=;
 b=czyPsUDedwi5IpHKib/LEUF75RpeRYd1icDbYkjbdi4bqUkSF2Qwz+Qc6J15ptIle68FpoUUGiGWB4btu9Z7rljM1iVfp82tt6P6iRCgzNTeR9OfmzNYdKnYNhvPudLgeih7GrWc9RKH5glQK90baKhTGS1g43nfYYc/BKq2TtefFRFmbCpyrMGXIw1wwWVy+ddTkhvn9Fu1GzTu+uIHNkMpuSOrBrXxVjOfoche/tydGsnarxztm3S/Syc5Y7HTCwaA63BJrTaZDtPRFzKEXuRLhKDt1xde7QA/QstF7K1a8WxY+RN1bb0MKmPF30OT1uWzBkIPaoVNGO/y+VCrNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzHhfzHf3R6kMOfpqY0qeJn0M0JwOl9wbDcJXoLxiAc=;
 b=gGnpyeCNAPouTZXtwjHbTsmYUIt/YXxHyFofMlAnMV8xwC7CYJZDuOsgu8myO6RbUSXdEW7A+u6oh1agNnL7fvf8DwUqQHga049qBYfSpH9Ukmb4eDhfAoGlC70Hsnllk9CNAsh3aJxJeNwlsqDULWPyWvmPydeclnwu2HBV2G9s2XPr4zD3ADOnK56EeydjMEhOZdZ+pO6ehswnAH9ClZaB3GyYx2QPxCcWssZv5Kt82LcIaGfSJQIBqPwm/sZ8upA48aSMKfKX2kkEuOcwpWRnTUhzKq2hAcxoDQbYckEWDn+vAS/9OQGosafgkzpnu12IuzO7LViTgMN+83J4fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 01:10:35 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 01:10:34 +0000
Message-ID: <35cf1a83-e9b4-4b51-848b-80c681d39730@altera.com>
Date: Fri, 11 Sep 2026 09:10:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (socfpga) add Agilex 5 channel mapping
To: Guenter Roeck <linux@roeck-us.net>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <0701aacab270fb8ca7bb35e8e72b7dd629e2cdcb.1786428156.git.tze.yee.ng@altera.com>
 <42ac07a2-a812-4dbd-a771-70f5a16129e2@roeck-us.net>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <42ac07a2-a812-4dbd-a771-70f5a16129e2@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0152.namprd05.prod.outlook.com
 (2603:10b6:a03:339::7) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SA3PR03MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: 41dacbd6-87bd-4715-0890-08df0fa17b72
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|10067099003|4143699003|56012099006|11063799006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+ZranROuq/amWZRderZsVDlpUr0x7zeAZqFvBvK0VTlgDsppCXW1RBIcZ3Jgnv3uH6W2L6UE6fUiRzBnt1feep7n/fUC3Hq9exEqhdPlocccli2BYBrB27Pnfu4/oCRHbanzAw0An2ZnXmndXdu3kj+Jw2Ch/6brkZs+rjnbMH3PIg6HWdz9wZHn0hFA4ISw+9PvG9x3K3oobBQtCEXz87w3MPhV07WXiOB4RaKJx4L8nkSkZqQNztCTLdDZQS/Q0EhB09vmLuDwGKW7iwy0LIBT+Ms0/HrxLw04RrFfqpkDtTQ1Vdr3zi3A/MujbZPh7OfkkyqMeuL2KU2qrlfmAEuQ0fc/QPpdqxmjg82vt1m9F8RIgdMc7dtJZAgw9UhPZSYyGyYDttho2IOIN+71/HWqd6Q8odls/4Essor4FfvOPXX1sMrGuDlF7qhDa8e/0qSJpzF/BE2eo4H8P1Phc7S+wgpqK0aKDoR2awYhU/ds2k8Prt16aWIbYn0fLHn5DJNiti0mMsxarWLyXkDvuBBTqu+UC4m0mgVsehKVDJmeSVHek6b0HZWA9kyZ2I0qOVgRQHL25+q0ie7SK+IumuXNItvLinhXl0nJeDtxLe7pwqRRDuiIfkKcQvPSlbIkTYPLwnB/NRxoegC++Pvp19KHE/BSOoBux5DKMA77H9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWcvTjJzTHErRlE4cXRNc3pwZ1RiUUVZNm1Tc1gyc1R2WjUybVBjNW9saXdF?=
 =?utf-8?B?enNrckZUQytRZ01ISGxFVzNHbWFSeTF1SUNRS1Y5RFRTUTZ0dDgxZ1FRd05y?=
 =?utf-8?B?Z3dneUF2TEx3dy9xcXlUckV3OEtQTlUzdnBrZjFtb3paTXpHeGVmMWIrUWdH?=
 =?utf-8?B?U3JuOXNiRlJ2SnJhSlpDUXg0RHBoMVBwWW5GcksxUjNqY0tIMDZoQ2dmVTZx?=
 =?utf-8?B?QTFaWEkwWTRqMUQwT1VCZWRqb3ZjcnZnK2tIWjhja0VnUTVlU0JpZHJZd0dV?=
 =?utf-8?B?aDBlSWEwdUlpa0NiL0xUMWZzdzBYRzZDazRvRmdFWHJMclU3Z2dESEJ4YnJC?=
 =?utf-8?B?YVpySEJuN0svS3ZhYWdyMU9NbWdwb2V6VEZBV1dKNkRnTjVIcStOaVM5N2RR?=
 =?utf-8?B?enAwVkJoc25XVUhDYzVDNjJsbDV0Y0psMlp0SzJvOW51U0RySW5yc2QwQkhG?=
 =?utf-8?B?SVZXMi9jejFnNGZualZGeVZsSFA2VmMwTHJubXZNbEgxSDlqVElzdVRPR205?=
 =?utf-8?B?ekprcU5ySXNRQ1YzWHMrc01VbjRVbTFUT3lFbVQrK0VmU0JZS21KZWJ5aHNv?=
 =?utf-8?B?V0FVbjIyVkF1cmw5ZHozQkNMWTFnQzBlK3FTVzROOEZEbzVhZExCeHprNEtR?=
 =?utf-8?B?T0dVVEtJNkZTM3lsVmVqb2VZdFhUTEtzU21iVlF1aWhrbGVSSFA5K3p2SEcr?=
 =?utf-8?B?QVhZZDI0aUxmNytLZS9wYWJQUUhSdDUydkM3cTNPUTcyWmFNcFppWUVSOWdJ?=
 =?utf-8?B?S1hHZENiZStNUmNFTGJIMWg2SWtqOXY5WlJFZGNCbVRVMFc4TzVLMllpbVJt?=
 =?utf-8?B?d2FKaFhIeXg1ZTBSbmtwbVZtUkRjSXBCRE90MTJrWVVLSDhwdzRDSXc5REtK?=
 =?utf-8?B?OWRRRW5rYjk0dWpIRTJjTGc3MjBNbjgwKzkySDNDYWE1blh1dEgrVFZrdnlY?=
 =?utf-8?B?L0NZV1E2VGN5MDhUREdleWhRWlNnakJJY011aDZUbHBxOU9TVzBxU0JaTndF?=
 =?utf-8?B?WlpxNkN2U2txK29rZVk0dm9JSXNYZEZmNEZqYUkxMEJHMkIvR3hGUU9LNGE5?=
 =?utf-8?B?MGNBMU1JY25HVEdnejhCcXk5SW8wUmdCYkFYa0VWL3Z3T0VhckkrdE1wVXJ4?=
 =?utf-8?B?bTY0V2hCMk1PTmRnV2RwOEtuci9VUVMzR2ppaHdDSmZBeGdDUmZVdWx6Yi9P?=
 =?utf-8?B?SVgxbUhtRzJCTnordy9DWks2Q251bHVwVzZzbTlhWUYrU0FqUUk1SzFsc010?=
 =?utf-8?B?RXUvdWVxMlo4SXN1YXBLZ2E5MDFnS0tWNzhJTENjV2tZTnkxcjBHNzBSM2Rk?=
 =?utf-8?B?KzR1ZzNYcDN1SEVvQldoenZkUUNHWTN6ZVphYXdLTXYxdS9DdHpCb1ZkR3Br?=
 =?utf-8?B?c3B5ZHlTNWZTR0VEQm5mWS9IMko3UkFRZFladGdZKzN6WkFSRzBkM1ozdWZi?=
 =?utf-8?B?STdvL2I0ZHhEUS9aVFlGMS9ZYlFDQjBjMUhJVWRkWm5JSUtReVQxdEttRkEw?=
 =?utf-8?B?T3p3MlFzL1dwRWpaSWxPdlpLbGIva21iQWhXVHM5TTZtV0xSS0ZURnFsQmwz?=
 =?utf-8?B?bG9rNWlsNUtLUVFOVnJpRVNDWWRKZVdEbkhYNmxWNGxSVERLYzZVSnZMc0ZB?=
 =?utf-8?B?RHdpc3hiZjBsdTh6RDNYMys3amw5enFlRTFUL09XMWY5SUlkM2gxcEFhQkNo?=
 =?utf-8?B?NXhxOHdNOWtTcWFvbGtsbGV5ZFlHRkwxb3JENXJyWjQ3SFR1TWt5cm1kMktQ?=
 =?utf-8?B?cmFZd2V6bFliRTVRWDR6Ui9wcXlOQ3RxQUMzQXBxeng3UTJPNHlCUHc3eVZq?=
 =?utf-8?B?NHlYMzByNzUwbFRCaWxqYS9VdVVNdXZSNWVRTGZMelhGQ0M0bnNRMVZKK1Z1?=
 =?utf-8?B?QmVkQ2xlaE56OWw5WWcvN2RQbHNIV1hOdlFWZjFuQXNCWk1HUXdHYVR0UVlH?=
 =?utf-8?B?T3grS0pIbHhuc1NkU0ZiaTUyQjV6SlVqTUFyZmNrMVpIVEQ1MGxOMkVjSFQ2?=
 =?utf-8?B?aG5nQytLS2VuaXZSdTl5OWZFMWRTOXh1NjQvMm0vRTlBdS85SmhyWmRzVHlw?=
 =?utf-8?B?bWoyWU43M0lSM1lRSkxUb3NMNVJvSXIwa0FvNThlWG9qcnMydjg2Qk9mWDY2?=
 =?utf-8?B?bloyRUl6NzBrcTJOcFVwd2V6NWxueTA0R1pyeHpnWWIwZnFkVU1ia3YwRjdv?=
 =?utf-8?B?RVY5azRsOWxrV2pTUUpJK0YrdXRjNk5LcHArdkNzSVpNUFZTVmFzam8vU2Jx?=
 =?utf-8?B?anZvRjN1RWNQdjAzVTNnRFkrbHR0TktQYmN0SEg2dEduMjlPYlkwL0I0T0lk?=
 =?utf-8?B?YXUvK2MzRXFXcVBYK05mSmp6bXJHSjRtelpKeE9iVkR4eFFwSGRJQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41dacbd6-87bd-4715-0890-08df0fa17b72
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 01:10:34.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VE0OMCZEXWozTuCzfNNuXajaKTxASliB9a5eyx/2fj6My/Bk0LU/0nwHbvbwTAehwoeMawbK1LM0HF+ZKNjIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7419



On 11/8/2026 11:55 pm, Guenter Roeck wrote:
> On 8/10/26 23:11, tze.yee.ng@altera.com wrote:
>> From: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> Add temperature channel mapping for Agilex 5 and bind it to the
>> "intel,agilex5-svc" compatible string. Reuse the Agilex voltage channels.
>> Agilex 5 omits temperature channel 2 (top-left corner) because that
>> sensor is not present; remaining sensors keep Agilex channel numbers.
>>
>> Match intel,agilex5-svc before intel,agilex-svc so dual-compatible DT
>> nodes select the Agilex 5 board data.
>>
>> Update the socfpga-hwmon documentation to list Agilex 5, the matching
>> compatible string, and the SDM temperature/voltage channel tables.
>>
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
>> ---
>>   Documentation/hwmon/socfpga-hwmon.rst | 52 +++++++++++++++++++++++++++
>>   drivers/hwmon/socfpga-hwmon.c         | 27 ++++++++++++++
>>   2 files changed, 79 insertions(+)
>>
>> diff --git a/Documentation/hwmon/socfpga-hwmon.rst b/Documentation/ 
>> hwmon/socfpga-hwmon.rst
>> index e5da42556a62..664103a38195 100644
>> --- a/Documentation/hwmon/socfpga-hwmon.rst
>> +++ b/Documentation/hwmon/socfpga-hwmon.rst
>> @@ -7,6 +7,7 @@ Supported chips:
>>    * Altera Stratix 10 SoC FPGA
>>    * Altera Agilex SoC FPGA
>> + * Altera Agilex 5 SoC FPGA
>>   Authors:
>>         - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>> @@ -32,3 +33,54 @@ driver based on the service layer compatible string:
>>     * intel,stratix10-svc
>>     * intel,agilex-svc
>> +  * intel,agilex5-svc
>> +
>> +Channel mappings are fixed in the driver (not described in DT). The 
>> tables
>> +below list the SDM page/channel encodings used for each family.
>> +
>> +Temperature channels
>> +~~~~~~~~~~~~~~~~~~~~
>> +
>> +==========  ====  =======  =================================
>> +Family      Page  Channel  Label
>> +==========  ====  =======  =================================
>> +Stratix 10  0     0        Main Die SDM
>> +Agilex      0     0        Main Die SDM
>> +Agilex      1     0        Main Die corner bottom left max
>> +Agilex      2     0        Main Die corner top left max
>> +Agilex      3     0        Main Die corner bottom right max
>> +Agilex      4     0        Main Die corner top right max
>> +Agilex 5    0     0        Main Die SDM
>> +Agilex 5    1     0        Main Die corner bottom left max
>> +Agilex 5    3     0        Main Die corner bottom right max
>> +Agilex 5    4     0        Main Die corner top right max
>> +==========  ====  =======  =================================
>> +
>> +Agilex 5 omits SDM temperature channel 2 (top-left corner on Agilex)
>> +because that sensor is not present in hardware. The remaining sensors 
>> keep
>> +the same channel numbers as Agilex.
>> +
>> +Voltage channels
>> +~~~~~~~~~~~~~~~~
>> +
>> +==========  ====  =======  =================
>> +Family      Page  Channel  Label
>> +==========  ====  =======  =================
>> +Stratix 10  0     2        0.8V VCC
>> +Stratix 10  0     3        1.8V VCCIO_SDM
>> +Stratix 10  0     6        0.9V VCCERAM
>> +Agilex      0     2        0.8V VCC
>> +Agilex      0     3        1.8V VCCIO_SDM
>> +Agilex      0     4        1.8V VCCPT
>> +Agilex      0     5        1.2V VCCCRCORE
>> +Agilex      0     6        0.9V VCCH
>> +Agilex      0     7        0.8V VCCL
>> +Agilex 5    0     2        0.8V VCC
>> +Agilex 5    0     3        1.8V VCCIO_SDM
>> +Agilex 5    0     4        1.8V VCCPT
>> +Agilex 5    0     5        1.2V VCCCRCORE
>> +Agilex 5    0     6        0.9V VCCH
>> +Agilex 5    0     7        0.8V VCCL
>> +==========  ====  =======  =================
>> +
>> +Agilex 5 reuses the Agilex voltage SDM page/channel layout and labels.
>> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga- 
>> hwmon.c
>> index 5b43274d0aa2..92bffc02e309 100644
>> --- a/drivers/hwmon/socfpga-hwmon.c
>> +++ b/drivers/hwmon/socfpga-hwmon.c
>> @@ -433,6 +433,30 @@ static const struct socfpga_hwmon_board_data 
>> agilex_hwmon_board = {
>>       .num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
>>   };
>> +/*
>> + * Agilex 5 exposes the SDM and three corner temperature sensors. 
>> Channel 2
>> + * (top-left corner on Agilex) is not present in hardware, so the SDM 
>> channel
>> + * numbering keeps the gap (0, 1, 3, 4) rather than renumbering.
>> + */
>> +static const struct socfpga_hwmon_channel 
>> agilex5_hwmon_temp_channels[] = {
>> +    { SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
>> +    { SOCFPGA_HWMON_CHAN(1, 0), "Main Die corner bottom left max" },
>> +    { SOCFPGA_HWMON_CHAN(3, 0), "Main Die corner bottom right max" },
>> +    { SOCFPGA_HWMON_CHAN(4, 0), "Main Die corner top right max" },
>> +};
>> +
>> +/*
>> + * Agilex 5 reuses the Agilex voltage SDM page/channel encoding and 
>> labels.
>> + * Check more specific "intel,agilex5-svc" before "intel,agilex-svc" 
>> below so a
>> + * node that lists both compatibles selects this board data.
>> + */
>> +static const struct socfpga_hwmon_board_data agilex5_hwmon_board = {
>> +    .temp = agilex5_hwmon_temp_channels,
>> +    .num_temp = ARRAY_SIZE(agilex5_hwmon_temp_channels),
>> +    .volt = agilex_hwmon_volt_channels,
>> +    .num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
>> +};
>> +
>>   static const struct socfpga_hwmon_board_data *
>>   socfpga_hwmon_get_board(struct device *dev)
>>   {
>> @@ -443,6 +467,9 @@ socfpga_hwmon_get_board(struct device *dev)
>>       if (of_device_is_compatible(np, "intel,stratix10-svc"))
>>           return &s10_hwmon_board;
>> +    /* Prefer the more specific Agilex 5 compatible over generic 
>> Agilex. */
> 
> I don't think that is going to work (see Sashiko feedback). On top of 
> that, it is
> conceptually wrong.
> 
> Guenter
> 

Hi Guenter,

Thank you for the feedback.

You and Sashiko are right that the service-layer driver must recognize 
that compatible first. That is introduced in Adrian's patch:

  
https://lore.kernel.org/all/20260907082203.2639395-4-adrian.ho.yin.ng@altera.com/

Also, apologies for the dual-compatible rationale in the commit message. 
That was incorrect. Agilex5 DT uses only "intel,agilex5-svc", and the 
"check agilex5 before agilex" ordering was not the right approach. I 
will drop that wording in v2 and note the dependency on the SVC patch.

Thanks,
Tze Yee


>> +    if (of_device_is_compatible(np, "intel,agilex5-svc"))
>> +        return &agilex5_hwmon_board;
>>       if (of_device_is_compatible(np, "intel,agilex-svc"))
>>           return &agilex_hwmon_board;
> 

