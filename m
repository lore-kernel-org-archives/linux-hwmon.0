Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022089.outbound.protection.outlook.com [52.101.43.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8302C3ED3A9;
	Tue, 19 May 2026 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200795; cv=fail; b=iNQnleFw7a2o1fe5ltLa7oHWgnSbYNw8nCz9TcZA48x9O9tSW3uAPPfGko9msYunh1pniQybqgatvj/HIlQiti5QBnUZMdHEt8FM6HG5Va5j6ImnALcGO4kXmi6rZ5XhIuLkh3iKzTOxVLbCW0xDbPc1T+nQ/Agz6ZGFvb0ctdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200795; c=relaxed/simple;
	bh=bgdJQq53KlN3JWvvwMJBGcAKAbsjNsrOb/YA83OXSAA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gbupd3BBs/nxo8OP0PoitV72E4uqzbhTIlnAJero8ThnqAF7haySpO8LCOwvyb64wTN3/bGMAowBUyIWxIRbxQCK3mjBb7NRe0pzwm4LXCGOqjWWrg6OXUCB3L2CD7mLrheSVyjRNomspkLNcsrSy8B+8Y6nbxBXEbRwoIxb6lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=zQVgQNUR reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.43.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="zQVgQNUR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRwtNwIJ9kReJisr37UufvGznGTt4mzil5UYlem2umTzSf6lyQtJO36XHlhylMig22uDaDSoXRjr5GJyVnb/P4x3ZhHpjnLh6Cww/jY0p/feMO2KPcTm3UBOGavdgQS9ITczgsmegTE0lk7GvHC1jGaLCD8f13+IZIkB9orFhbSwSiLrQPD7549LGhRn0NsoskNakVen9TXt5Q/ZNFtz2RmIAGe0LAY4zGrPtfXKSqq3uVgGmenoRIK/p7+S2OR7w8rRMb2/LDzfWe3C1XBZ6wf2XzcSfYXmwd2m0xDMSsZOGtX0RnobXaah8zAQI3ivpDMXWqzH4qzFXpPOKgMhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8HyB9xU4qgwyHeyiYb5DNauYBvkExwq69227ktoDeM=;
 b=WJWr12uNyOKnznxI/e50FpimKDWOQtV9TaHJ2XpCuJeQ5P98KSVc1KL1fY6LbO4KIBWNBPwsgDvGKeJErDYG+iwk2yjrAOzTLbZx7YNB38Pkdst+9rZsiATgG1xqXd9JqI5LiVcYJKDcc1HRiAjvD7T10pmQpjP/hfe+etYHWUZ8OJKg6XT/gfbCfBcZbgdBF3UzfkS7qXzphYQybvBRSE5e0r3ApYFsNG/vdYVjLScwFiwpKZozJ8udOShCrosVuO0MO4OjwtIBOnz8hda84bKszSuh/Tmj52hhk+jIpPyu86ce9VCWlLuwWWxh8bx+ARJdSGHtE6JRiN1AFGE/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8HyB9xU4qgwyHeyiYb5DNauYBvkExwq69227ktoDeM=;
 b=zQVgQNURbMWd+EKG1TrBMk7mXsJpCRSC3XzmMJlpgN2s70tsEvXLcSnozkm1TRJ2uVt2kVNkt/1IBBlDbFYXYc3Tm0FD+igkqvKATQsym34LuL6DCgtvS0EZRdsCvF0aGT/3U7oOK7fJhi91mPi+573dXW7xP1D15x7FDBTQ14I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 SA6PR01MB8901.prod.exchangelabs.com (2603:10b6:806:42f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Tue, 19 May 2026 14:26:27 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 14:26:26 +0000
Message-ID: <05347a7f-ce9c-41da-a4ba-fbd27bd9f934@amperemail.onmicrosoft.com>
Date: Tue, 19 May 2026 10:26:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox/pcc.c move shmem unmap to teardown
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Huisong Li <lihuisong@huawei.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
References: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
 <20260519-annoying-athletic-mustang-cf3f02@sudeepholla>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260519-annoying-athletic-mustang-cf3f02@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:930:8a::19) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|SA6PR01MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: 298ce677-6da6-4676-3543-08deb5b29c54
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|22082099003|56012099003|11063799006|55112099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	fzIrzLD+RnUwj/OvZkZxAFJBUm9Q14SsRZDnkfh6R7oA3oOw7MS84OivTx+/5PBj6DV05LYVW8Q23VkX/4jOV9Aatx7WETAG8z00vU4sRTWFh+GA5FeHTWTjSREa2IHdHqf6dpSjyepEjpELf8NwfuUGrkAoIzyI4ni90cQGOOM9RvV3R713dpv98j1af5NMSJ7cFw2mQ6MZuEyAAZU2l8Q5hAMNPcqw+t2eS3onOS2RY1WufTvrhQBrqnsNiSsa6cOTEx4JMjL14ZhqSsUvRtFxxwhlBGOjmsQmPRxkMUP16YASRCPlPQCxR7SaGH6BnVlPDDWOIWS8rsC2O6C7wz4YvVdzecI+5zlKvWslrzW0rbbUCPmc9XE/A4WdAkxcUHbH60aW8DbQYcGEoh79+QxcY6cKIDQ+vMGy8tqHwXh+JxCWd+VN0J3B95S1CSRXis05o/A+/e2Zww80ywagftINFB2UijrYUBBQPJE9e9uPHs3fZ+TLzsm/Cn1CtZaCeA9phTZCis6+858oK3T8YO3g8BjTeZ9qXue+qsKS2dli9lW4e3IO+Y4FeiyhpjMVKs4ypbll22TDpM/Hk51dT/Wz6BahpfV5KtcFxsaiyZ48sQ7Ou3hbEUrsdEYUH5ONinq0aPFzIbDc83usRIWMjPMLgpTDftfXkTiQdMjD13DcnYvnjWlNpMsE2nNhG3HW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099003)(11063799006)(55112099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUdiMWFZOS9IWFhKRWRhNmMvK244NC9RL0hvMDUvNEJqWm4xcSthYXYyUE9I?=
 =?utf-8?B?SFV6MzQyZXBWKzdDbFVReHNyK1NHRGE5c0tXOVJJUnhuMGc0cVhHcW92NDk1?=
 =?utf-8?B?TnFnM2h6N2tBVmRoRENkUmMwTzdFcDAvRGZMdWxlSVRtc2Q5Y0dQcHArSmJw?=
 =?utf-8?B?M3NpM2hJYWhEQnRDV05vM2VlUjd1M0FDcUdTdnppMDV3KzVKY2JJWVY3Wkd5?=
 =?utf-8?B?cnZIZ1Uyblllbk92a0JQOWo5eGxJdnY0cnVuTGwzNjRxQkFEalRwNm5TSElN?=
 =?utf-8?B?MzFTYkdYa2dLTzZXMWs3VFJ0SGpzbjVkTVlyQW5MVFBRbHRmMzhCYWZSY3pF?=
 =?utf-8?B?WFNpaFNreGxkd0N2dUJHa2ltNVZVdVQrZEEvQTdIRFMxWkJ1a0JadER4c0ps?=
 =?utf-8?B?V2MxSkZBalpsMWV4YzBVMW9uRGg0MkFNM1RyRDlDMktSOGc2UHdLV1ZuQlow?=
 =?utf-8?B?Kzd5ZHZPVXM4T1VyVW1DWlM2NCs5c09GV3htTUxQNWtwMjMrdnhTY3FXRUhn?=
 =?utf-8?B?dENFYkNMaHQ2OUdvZGhzR3RHN05pb0FReEpTb1FwbWFQRGMrTytYZEZJR2ZR?=
 =?utf-8?B?T2ovOHlacXc2WEw2QWhoZFBGTVdoQmRyaHNmZlZqZ2llUTZjZS84d0Ftd1Yv?=
 =?utf-8?B?THlFUHNxWGw1ak5HVkdSMVBMV2VUbUdsOXNNWUxCZE5hNWlYMFZocVJ5b2M5?=
 =?utf-8?B?UVRCeTBjcXBMMHhTakVHOWVKdmNkQ05mZHA5bTdoMFpPaENzcVV5N2VWd0lO?=
 =?utf-8?B?VithbVRDd3c3YVNpMDF5ZEFJTFk3aVNXTDNhUUg3RVpac2xtdE1CVXRMeFp5?=
 =?utf-8?B?US96NDY2NnF4eXZ3REhYRHYvVXdrdHV1RjVJdmFBWlZ5SjhtNEJ2bkhmWGR6?=
 =?utf-8?B?YzFTN1BXVGZNSVlEZ2pzcUlleWpEUE9pOC9PUUNwZlNqQTNXd3hDWmZkeVV2?=
 =?utf-8?B?Wlh1YjAxU1FIdVFRb21GYnRxRVFhZjBrbGk2THNyelRGZHQ1S2NsV2wveXkx?=
 =?utf-8?B?Y2VTMFZTaW0zY2hRbG44bmczWUc0bkZBNTFlK2F3ei9IU1pmazF4NzUxNGtK?=
 =?utf-8?B?ZkZtU1ZoYUZmeXl0eEUwRkZzOGNsMEllMG55bzlMZmFlaDRyTFdTUU12VVE3?=
 =?utf-8?B?N0NZejgrV1BkK0I3YVpybjZMN2lpbXRoT3ovWTgxcGIvVXgvREJvVzZlUW96?=
 =?utf-8?B?bnFwRXVsdkd4cjdOcXI2aHdFV1NrZ3ZmV2pMTDI2WmphU2QvamRvbkoxZzkv?=
 =?utf-8?B?Y2VrUVMzR25UUjVqQTNieEEybExOYkUyWTB1bDdWZ253djlqSWo2NitqR1F5?=
 =?utf-8?B?ZElOa24vMUhXa3BBclVJbFRDWnA0bzRxQnk1andzSzlyVUpmVHhEbVh3S2hl?=
 =?utf-8?B?R0JVMEw3NzR6ZHZUOWRZeVlNOHFnUVhHbXRwQWdpWGFKdEg2Ulp5aHQ3RER4?=
 =?utf-8?B?ck1YM1dnQm5pcUU3SGhOcGU1eFNvQkwrRlErVlVkRmJVS0w4Y0NQRWE5dmY2?=
 =?utf-8?B?VWFMTGNQb0Y3MlVtdEl2ZjdYajVKdHVUOE9YVVR6a1I0VGZSYVZoWWlyNXo2?=
 =?utf-8?B?Q3liUUQxZ1Z0T2ZVQjNESXVlNzlFdk1ac3pLVmlndXRSQXBwOU5oV1g1NUFZ?=
 =?utf-8?B?cXlqYklIeStWVzZzSmRlQU9rbUNYL0g1Tnp4VSs2MlJLcW9NYUlqNFlpdXBX?=
 =?utf-8?B?QnlFNERMQ2k1YmVDMlUrTnBrYklGeDEzbGtjcTFYditzQVJucUJZTC9IeG1u?=
 =?utf-8?B?WEUvK1lBMHhXaTNBWEdOa3VjOE85Y2c4Z1pGYVpqZk1nS3ZSTnVuWXplbWxT?=
 =?utf-8?B?ZUFZenB0eW96OXhtVHg4SytOcm5GdzZnU3NobDVFa2s2Z3M4MzZ2Y2xqSHlo?=
 =?utf-8?B?eUg0TzRZNEZ0SUplYnBzUUw2NWZ2cnlSSmVqTTgvaGNQK2VqQ29DRVJSYTNG?=
 =?utf-8?B?RFVZTlRtVUpEWm44OGtmd01MVkwzSU0rT1FGTWRaUGh5SkpmVXo1ZVFBYVRY?=
 =?utf-8?B?UFIvRzA0NDk2RFNUT1ljZzZrS1dQM1k1L2YxaVp2a0cyV3BYOHlpQWNJUHAx?=
 =?utf-8?B?ejhkMHMvckpERkxxeGpwZGJwaE9kRE1tVDN2dXNsREV0UUJUaWNIUWVEV2VK?=
 =?utf-8?B?cFNHNk1mWjNKTkE2TUtlc2xEWUFvRmo2STRHbGVaUENSeGtRVUpIaDJ2Tzkv?=
 =?utf-8?B?L01PK3BtT3BKazZCNmpDREp6WlFDb1AxNDNhcGI5Um9JTC9aR3hteU1zWVdk?=
 =?utf-8?B?WG9PUi9SZDc0KzN3QVo4aGJjS3FWdXErdnVFREd1VE5vaHF5SW9qcWF1dWlq?=
 =?utf-8?B?VUNpVHBYS3VpQVNlcW5oSU1Qa0hDU2NsNU8rckI1RklTYkd2eGsxSVN6MmlQ?=
 =?utf-8?Q?0TAwRrTkBQFhvlrsjQjqO3vgAWgco51y1qQTUJ/4EyebC?=
X-MS-Exchange-AntiSpam-MessageData-1:
	THhNZx6wQBZALblkRIGtpgWB8k44aaa7O3IGwgdaVgFW9oKGmhiomllG
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298ce677-6da6-4676-3543-08deb5b29c54
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:26:26.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYFaN5LsgJug840MR7MkMjhJQM2hggy61Q/PB8IlUIEluI+W5PMkOr2vkyhyuAK/MhH/Ixa8O5XvDzaiGbLBkBT3iruud3gnUxkFTnRd5fQ2DqUN8R+Q12V+Qx+MqdzN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8901


On 5/19/26 08:18, Sudeep Holla wrote:
> On Fri, May 15, 2026 at 12:10:01PM -0400, Adam Young wrote:
>> If the mailbox IRQ and shmems are not cleaned up atomically there is a
>> race condition. If the shmem is torn down while the IRQ is active, a late
>> interrupt can trigger a write to un-mapped memory.
>> If the shmem is torn down after the IRQ, and another thread requests the
>> channel again, we can end up with a channel that has had its shmem
>> unmapped.
>>
>> By moving the unmap to the teardown process, we can let the mailbox
>> mechanism prevent re-entrance into the startup/teardown functions.
>>
> The startup-failure path now pass NULL to iounmap() in
> pcc_mbox_request_channel().
>
> __mbox_bind_client() calls mbox_free_channel() before returning an error when
> ->startup() fails:
>
> With this change, that mbox_free_channel() reaches pcc_shutdown() and clears
> pcc_mchan->shmem.  Control then returns to pcc_mbox_request_channel(), which
> still unconditionally calls iounmap(pcc_mchan->shmem) in the error path.
>
> The startup and shutdown calls are symmetrical and similarly the
> mbox_request and mbox_free. This change is removing that balance.
>
> NACK from me.
>
Yeah, I saw that (since posting) as well.

I have an updated version that moves the map to the startup and that 
removes the unmmap call from pcc_mbox_request_channel which seems to 
resolve the balancing issue. I will post shortly.

I was trying to minimize the change by not moving the map portion, but I 
realize that both need to be under control of the mbox code to get to a 
multithread safe design.


