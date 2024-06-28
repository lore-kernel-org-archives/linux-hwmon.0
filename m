Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F3C1865A
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Jun 2024 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575824; cv=fail; b=AmLLIqcCrha6Lp3OBuuCAElICY4b99UDProT9URt+E9VRmfo2zIjDNAHsbCNczkpjyfqIAR6NaA+vWqfzpKEefgF+866QbkwFMQuYM361ugEups8OvJc2ajIJMiogag0X83eXtSEUVs6rrnHwCy+wLkR8YGNxJP6/8x1UUo8Vx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575824; c=relaxed/simple;
	bh=+yQC+2NGxZuLjaU5w3W6eULSAYmSY6nuMAxNfqKAXVI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZmxddPCwhgj1A23fqKeADqnHJEFhYc17tOvPXsggH4HuHjPeCnmSvPGuTJZdh7PhlS69T3xt7sdXzr7g2Wg5xLo8dlxgZTT6xWHJwOpzKQfrMZ0WLssckal0xqLEyz4ywOJNIo1Qm9cGsBdKN1NxJ3R5m3MCwEUm12Rrww5M+s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EFjZWG4R; arc=fail smtp.client-ip=40.107.236.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EFjZWG4R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCd1gS6JmZy4Rh3lo/Uj9Ky5DBy5rNe0WJ+G3R0Casa6r2jZA3u+U6B2S/+36aFg9q0DSs2j5sF5la2sacj/p5CB0Gt1M9Pi7P359dtMhTEbM+5ltM0d7x7RXHL+gIcHMObP9UOjzMecQ5HsLZ1HIOsg4PCTDr4Doe97ZxoklLz7GpnjEc45U2+cBLQ9hzlnbv7oKBcLUZb8ln3EhPByHrjxTZZGzgUjxT8PIkREWhhu2Qrx6Dmz+dVrCppCN6C/R9NgEbmXOMJrZRHvyWfhc6Q0KLemm2Off7lN0PxANkHv8MIRzhlHewmbk1fBswP5/I3wRBaQyS7XXpXVwLnUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF+7WiXjJSdDCaq+lKCYadNDlUJ0M//0naBdXhu0dSI=;
 b=dPwagYdwj7URy9LUEQBJfS/21ze2XWItbxNGj5S+dKkWRfJI16U2du2aiNVkXWOZ6Q3KRMkmFt44C6c8UaSmf1d2KxBiTcQSFrVXUOz9lADWzfkOyv4AKRZJIP8qmS7SraLOYUPTW5QE2uqzQ8J6lOTOApkPqJQp7hdU9JwhHkI4UIlzmnZ2CTm6JvZE8lKoN8VdpTx/O0MB6PAf43yxCJ//1LS/N45BnYYEwCImSsWTJAESfoA/K8mrnVMU61LlCEpeUOePyIWjnz7P6D2l4HGmPbxXeeJvp+m6pngp6r7/nr4qkwGlJ2OZHiXo2Wop7WS1eBuPEeU7/GiR4Z8n6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DF+7WiXjJSdDCaq+lKCYadNDlUJ0M//0naBdXhu0dSI=;
 b=EFjZWG4RqPuulWRAlGl3mntNcRKjs3ud8UqXyZtA5lAEvezfgM6QQffeMs7OLHZ3hcu+Rp01W69wAKQREurPoepkCsasePljYWTNeaa9UqIXjdvuJ7TYgrc/Ku0CqeAPFvpO5QaPbuUL78C5Qu0eif7BBn9+zajLK5/gJp5PgS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 11:56:58 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::35a:28cb:2534:6eb7]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::35a:28cb:2534:6eb7%4]) with mapi id 15.20.7719.028; Fri, 28 Jun 2024
 11:56:57 +0000
Message-ID: <1c5ab6bc-52d6-4a89-bc52-5db7c7235d51@amd.com>
Date: Fri, 28 Jun 2024 17:26:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] mfd: add amd side-band functionality
To: Lee Jones <lee@kernel.org>, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
 linux@roeck-us.net, Akshay Gupta <akshay.gupta@amd.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
 <20240613170514.GQ2561462@google.com>
 <e37f0503-0ae2-4651-8e32-1e6444e852c2@amd.com>
 <20240614144930.GJ3029315@google.com>
 <19708a93-be04-4163-b111-68d5f71487ef@amd.com>
 <20240618122752.GX3029315@google.com>
Content-Language: en-US
From: "Chatradhi, Naveen Krishna" <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <20240618122752.GX3029315@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::26) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5286:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c73d5ea-fe64-4e73-b4d8-08dc97696912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW1nOUY0UlJlME5OWWw3ZzVYVjVsMmVTdzBZYmE1RDhsMVg0MTJFMDB0WWU5?=
 =?utf-8?B?b20zYkhpUUhkRXVmcFhORFRJdUVYOG90SFF2d2t0QkRzWHhobUZnTDBwcjQ3?=
 =?utf-8?B?SGRPTFFRTy9RMC92LzJRbHZtNkNqMW5IbDBtUWxBbmplRlFDelRsQXhaTzFv?=
 =?utf-8?B?SWFINHB2eTBxR3h4MlJsSnRFcFRJUWNZTVlKT2R1RUwwRGswT05ocWVZUWY2?=
 =?utf-8?B?UVpwTmFNNkRrSHk0bVV1dDV0MjRqYXFtN3IvQ1RLUWJSSHdEVThvR202amg1?=
 =?utf-8?B?VHBNVVRBeVNiRG1sR1FrUVFsT0NPcWNFb1ZaZFJvVm1oUytXdUJGZ1JSNmxi?=
 =?utf-8?B?MGlOQ3Z2UlkvKzlxVVFsaGZsMlMrdTNTUVQwendOdmhPMEtQbWJ2NjJ2RmtV?=
 =?utf-8?B?VmxacHJWMExzcWR4aFlSem44dGN3TXp5dmZ3K0xQY2NjUTJhK0l2MjUrVjVp?=
 =?utf-8?B?ZzJ4MUQ1YXlYWXVVSjIvbnhCd0paazZoZ2d1eTFPQmprUnNKUENmS1RvZk9o?=
 =?utf-8?B?U1RvbWNwTzNOYXNJWTl2dlZ6c3FFUHVCRGdjM1pLaWsrbXRsZmk5M2lqdmE4?=
 =?utf-8?B?cTNUenZ2RFNQVm1FQVdsdm5sdURrOWN0b3M2bCtNUCswcEYwUmhWb0svSDJn?=
 =?utf-8?B?MHlyYi9oQ1dZZlMxZ2JFckgzb3VOUHFGWmtVSEhQWTJpc1FRWDFIS0dTV2du?=
 =?utf-8?B?NVpBcWVTMjhEc2FmY0NaNDhUcWFpK3NBQ0lTWGNpdzBxaUlaMmdNd3ZXYmEx?=
 =?utf-8?B?RFlmcWRHbm5XY1FWSWQ3OTFtRjI3NWJHVTBBMDdkclZPYlF5Z3ljL0ViZkJw?=
 =?utf-8?B?OWF1UlJVRUhkcmVuMmRZcHRyU1dEb1MvMlhXL0I3YnNEcFp1M2t0T0l5RkxY?=
 =?utf-8?B?VzZCUHlUMWdCR3M4eHltUGhBMzF4TEpqSThmUElrRmltUk5lMytBY0RYd3U1?=
 =?utf-8?B?YU9JcWVLRUFHSml2amtsamRhLzgvN0FPVXg5azFEREdteS9UUUlOUnhkLzlr?=
 =?utf-8?B?a0FucThDRFRhbHZmK09ZKzZCVlJGL1d5MThSaWRac0RIUFBrMkRET1p0SEVT?=
 =?utf-8?B?cExSUTFscCtsOHVxMlBraGhQTHpsRE03VEh6NEg2RFBMMVFrclJ3b0c4YkRS?=
 =?utf-8?B?SkxzN1ZWbmo4K0lDaXZwK1V3WG90T1I1eVN6d0swckpLUDljeUNCdXdEM3N2?=
 =?utf-8?B?S1F6Y25VWmNlcWNSN2JENXMyazFwMnZDazVsamcrQzZ5ckNGQ1hmWG5YTDJv?=
 =?utf-8?B?OTl2eEw0ZnY4dFByNkNBU1czME42ZHphMzMzWDFqV1VZOXhqMDBiWFhJbjhs?=
 =?utf-8?B?SmovOUtUWVZWREN4enEzWWhpYVBHWWZ1T25jMjRDTFJ0Nk9rcnE2Tk8wczZ5?=
 =?utf-8?B?Z24yclU4OUF5eGkwTDJ0aUhmVUF4YVY0SmluaGQ5QVJmaGFET0ZrdmxaMjRh?=
 =?utf-8?B?eGRlSzZUanBBSm9STTlPRHJRUGp5dlNjb3RxeFJCRzVYeEVER1JrR21QTXVF?=
 =?utf-8?B?VW0vWGRCMnNTNHgzTzBVdnROanVmZ29wc0l4K1k1aDFQY0t3Q2x6VFBrL2ls?=
 =?utf-8?B?T25vYnNSVk4wdCtlNktLRm8wY2t6L0M2dlUyeUt3UnA5K2FkVjlLLzBONFky?=
 =?utf-8?B?N3h1aFhpbUhhNEVtSU1pV2RFcGhqZkVUREdrYVdJRjlITTZQYm5ubUFqL2kr?=
 =?utf-8?B?ckFiaDdIR1R5WGE1RjZmNW9RRFFSTFhqc2orMjcyUTdhdHJXc3JMeU5sSHRS?=
 =?utf-8?Q?isiGiTq9rmy6NGHMx0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlMrZ0NFUlRGd1pvUGhGa2JFenlFWWlMeFhFelBsVVFoaElYblFzYm5Ldk56?=
 =?utf-8?B?SVcwOXBCeVUxZUVFSXdvU2FmMmlmaDQ5MU0zZUl4RHUvbTVzakcvbzNtQmh2?=
 =?utf-8?B?MW1YajhkVzdVQlB2bk93TXNhWkU5aGorRXFpdUhHaDBFRTZrNGxlYkFCT1BZ?=
 =?utf-8?B?NGgrcEhNQ3BzalBCSU1UeEZmdU15NlhOVzhkaHAwOWxreFVDZlBFaEV6Z0VV?=
 =?utf-8?B?TC9OSEJVcExDd1BYRHM4d1Y3SFhhN1M1ekhNSjNnMnNnRFllNmVtZm5TSTd0?=
 =?utf-8?B?S05FWTZpRmV6N3FpN0NCQVZGS0QzMXRDbFNLY1BqVkxnb1ZWeUt0N0x2eW8r?=
 =?utf-8?B?NXNoTGYwOUt2UFlCRmdUOXJGSWtDM0JBZTd4c0x4amd3cnh1OU5tUW0rbHFZ?=
 =?utf-8?B?NTdIYUZFUkR4czR0RzBwQktUd1lZeUVZZ3NmL3VoL2k3RExIaEQwTEhoNFNL?=
 =?utf-8?B?VTZ2cGhMczN4UEkwQURYSXlEemJ6aXJ1SFZMczcwV0E1STNDU2JxK2x2SCts?=
 =?utf-8?B?L3JHTFJDdmcyS3NDazJ5bUxwT0tNR0x6RkJJSSszKy9DRVlXbVI4eFZuY2hF?=
 =?utf-8?B?djhFOVY3aEwzUHVIWHZjQlQ5WmxWZ2ovZFFGNDZrdzB5WUpiTVcwaUZQdXpX?=
 =?utf-8?B?YjVPeVEya0RScTFIT0hseTNCQ1ZLVFlBenhCdEJFcHkzZitZdS9tN0ZFeE1B?=
 =?utf-8?B?V3U5S0tOR01qaytRWnh6eS9jN3lEK2tqbE80UWpjak5oMmU2cnNxRUsvTzdR?=
 =?utf-8?B?aEJzYTBFWWJqTFlIUitWczFFUW1rVkdIL2dIb1F2SDhhQ0VyTkRVWjljTDJl?=
 =?utf-8?B?Zk1JbUVYTUtEMFVmWUJ5VVpvUlg1SXl4a0FoM2o2bEo0L3diSVZmME5GSWRS?=
 =?utf-8?B?TXpEeEtkRDRwdHk1cDB1V0YwaXFvYTYrM1FEek9uS0llc1dhTjFlMlYrVGdC?=
 =?utf-8?B?SnUyWlRHWGppNEhmVW5sSFkzUytpa2txYjJtOFVidzZ0S2NyNlpnbkI0OVNw?=
 =?utf-8?B?bWNYUzFEQ1VmSmprQ1N0UDJMRE9XRWVrdTExU0R3ZWtlbWxwQzVOSGdzQU5R?=
 =?utf-8?B?U3pYUllRcnF0Zlg3c0pwdk94d09Gd0tTTE1hKzRrdW5YUkdXbzUvQlk1RHRO?=
 =?utf-8?B?bnNna3B1Q0FLVzA2eEYycDlvL0NFcTA4Q3pyK3YxRWNWcXlyZE1jcldFV1lh?=
 =?utf-8?B?dzY3STVhaGVUOER0YVd2bWpNQlplNVJibEtMOFlCbnhORU1nOWtMRjBVT0tR?=
 =?utf-8?B?SzVDN1pMYU1ycG8xNHBBN1pIbUxmcTloNEs3WnZ4OTJ4RnJ4TlRhdHNuYWJG?=
 =?utf-8?B?c1BYdkRlbmtvbEhuUXpUbDBZQUZZOWl2M08zZ29WSXY5NEtEUkptdG55aFJL?=
 =?utf-8?B?NnE1ckM2c0c2cXRHbHlyVWxHbFFrd1dtMXpEKzFwdXJGS2RUcE85eW1Fa3BT?=
 =?utf-8?B?blZnemRkQmlEMklnL1NHSm5WUTdEZS9EOE5lQlE3Z21jWnQ0MjZOMGlpMFJt?=
 =?utf-8?B?YzBQUWlDelhZdVlhV0dZcDlNNEdGM2pJWkJqTXVDRm8rc1BFTkhLV1FLL3hu?=
 =?utf-8?B?OTFqOUFtQUVpcTBaU2VDb3d1cExzZFM1bytVTzNMSFpxOTRnYi84bitCZURQ?=
 =?utf-8?B?Tk9nbjE4Ty9sVUFsU3diVnFFL2EvdlJSUk00eDRFU3MzQjFHWkRjWGxwVTVh?=
 =?utf-8?B?YnVFSnIvTi9EYW1Uem8wSEVLVFlkNjBZdmxvcGNjbEhMRHZvSGJFS0NBQ1BY?=
 =?utf-8?B?VTZTc1dCc1lBWTFPNmd6TnFDWVN3L1BsWjJScUhaYVBSUzJMRVRyTWNCWDg2?=
 =?utf-8?B?NzMwczUxOTZsSXFUQmFTUFFzSUl4QWIvNUsvT2xKc0hUOWhjUFJUd0VIOVZ6?=
 =?utf-8?B?NFFjVkNsa3Baa0pQNTFHOU5rRTh4TXB4SjJOVU5uclMvcFRaZjNXd1hhU3lj?=
 =?utf-8?B?MTlDVzVHenlMRXVHNmRxMkFlYXczOXBlY1d2dUJBKzgwTXZsOTY0b0UyR0dG?=
 =?utf-8?B?VlNDb29kOTZQN3VkSjhGZVV2ME8waVArTGhUbUMxbDg2OFhwbStyaWs3aWls?=
 =?utf-8?B?RDI2VjhPcW1mQVFNaTlGZHZuSC9Cd1l0L1JyTFdWbzhDN096MzFWMUFPTmZN?=
 =?utf-8?Q?x0t/2Bfs5T0D+E4Q42VAdjXdo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c73d5ea-fe64-4e73-b4d8-08dc97696912
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 11:56:57.2951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VWVD/pEMPirRTTPWE9RrzuovygV3jovbMa/aB5O2h46oA/9NS4ocLuGB2sZYySAzhNsxVKH3gtCDh8pf5F3dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123


On 6/18/2024 5:57 PM, Lee Jones wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, 18 Jun 2024, Chatradhi, Naveen Krishna wrote:
>
>> On 6/14/2024 8:19 PM, Lee Jones wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Fri, 14 Jun 2024, Chatradhi, Naveen Krishna wrote:
>>>
>>>> On 6/13/2024 10:35 PM, Lee Jones wrote:
>>>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>>>
>>>>>
>>>>> On Thu, 30 May 2024, Naveen Krishna Chatradhi wrote:
>>>>>
>>>>>> From: Akshay Gupta <akshay.gupta@amd.com>
>>>>>>
>>>>>> At present, sbrmi under hwmon subsystem is probed as an i2c
>>>>>> driver and reports power.
>>>>>>
>>>>>> However, APML interface defines few other protocols to support
>>>>>> OOB system management functionality.
>>>>>>
>>>>>> This patchset the following
>>>>>> 1. Based on hwmon maintainers feedback, move the i2c client
>>>>>>       probe and sbrmi core functionality to drivers/mfd/
>>>>>> 2. Add an MFD cell, which probes the hwmon/sbrmi and continues to
>>>>>>       report power using the symbol exported by the mfd/sbrmi-core.
>>>>>> 3. Convert i2c to regmap which provides multiple benefits
>>>>>>       over direct smbus APIs.
>>>>>> 4. Register a misc device which provides
>>>>>>        a. An ioctl interface through node /dev/sbrmiX
>>>>>>        b. Open-sourced and widely used https://github.com/amd/esmi_oob_library
>>>>>>           will continue to provide user-space programmable API for the following
>>>>>>          - Mailbox xfer (already defined in sbrmi_mailbox_xfer())
>>>>>>          - CPUID access
>>>>>>          - MCAMSR access
>>>>>>
>>>>>> Akshay Gupta (5):
>>>>>>      hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
>>>>>>      mfd: sbrmi: Add mfd cell to I2C probe to be used by hwmon
>>>>>>      mfd/hwmon sbrmi: Use regmap subsystem
>>>>>>      mfd: sbrmi: Clear sbrmi status register bit SwAlertSts
>>>>>>      mfd/hwmon: sbrmi: Add support for APML protocols
>>>>>>
>>>>>>     drivers/hwmon/Kconfig         |   1 +
>>>>>>     drivers/hwmon/sbrmi.c         | 284 +++-----------------
>>>>>>     drivers/mfd/Kconfig           |   9 +-
>>>>>>     drivers/mfd/Makefile          |   2 +
>>>>>>     drivers/mfd/sbrmi-core.c      | 490 ++++++++++++++++++++++++++++++++++
>>>>> It's not clear to me what any of these 500 lines do, but they do not
>>>>> look like a good fit for MFD.  Perhaps I'm missing something.  Can you
>>>>> provide some more information about the device and why you think MFD is
>>>>> a suitable location for it?
>>>> Hi lee,
>>>>
>>>> Data center processors from AMD provide a side-band (often called
>>>> out-of-band) path for manageability
>>>>
>>>> called Advanced Platform Management Link (APML), which consists of i2c/i3c
>>>> client devices called
>>>>
>>>> Side-band Remote Management Interface (SB-RMI) and Side-band Temperature
>>>> Sensor Interface (SB-TSI).
>>>>
>>>>
>>>> We have i2c client drivers upstreamed under drivers/hwmon sbrmi.c and
>>>> sbtsi_temp.c reporting power and
>>>>
>>>> temperature via hwmon interfaces. However, sbrmi device can also provide
>>>> performance, telemetry and RAS
>>> MFD knows nothing of these characteristics.
>> Yes, we will modify the implementation to define ops structure with
>> functionality that
>>
>> can be called by platforms drivers in hwmon and other subsystems.
>>
>>>> monitoring, management using AMD defined protocols. One of them
>>>> sbrmi_mailbox_xfer()is defined in
>>> I large portion of this should be moved out to drivers/mailbox.
>> we have explored the mailbox subsystem, APML xfer is not a ful-fledge
>> mailbox interface as such,
>>
>> it is a custom protocol, which accepts inputs and provides outputs over
>> i2c/i3c. It does not support
>>
>> multichannel (tx/rx) or have IRQs or a memory mapped IO and it is one of the
>> protocols supported
>>
>> by the RMI device.
>>
>>>> drivers/hwmon/sbrmi.c.
>>>>
>>>> Patchset would do the following
>>>>
>>>> 1. Move core functionality from hwmon/sbrmi.c to drivers/mfd/sbrmi-i2c.c as
>>>> an i2c_driver.
>>>>
>>>> 2. Convert the hwmon/sbrmi.c to a platform driver.
>>>>
>>>> 3. Use mfd_add_devices() API to add cells which will probe the platform
>>>> driver under hwmon/sbrmi.c
>>> How many devices will mfd_add_devices() be registering?
>> This patch is adding one hwmon device.
>>
>> We can add additional cell which probes a platform driver in drivers/misc
>> which handles
>>
>> the user space interface part.
> It sounds like MFD is (once more) being used as a dumping ground for
> random devices which do not fit anywhere else.  A Multi-Function Device
> driver's role is to create shared resources (memory, IRQs, Clocks,
> Regulators, etc) for and register more than one real device that uses
> those shared resources, that's all.  Even if you were to move the Misc
> part out, using that as a second device to prove it MFD-worthy is not
> going to fly.  Take a look at what these devices usually consist of:
>
>    git grep -W "struct mfd_cell.*{" -- drivers/mfd

sbrmi is one physical i2c/i3c device with a set of registers and an IRQ

which provides multiple functions via different protocols.

         |------------|     -> apml_xfer

         |   sbrmi  |      -> cpuid_xfer

         |-----------|      -> msr_mca_xfer

                  L-----------> IRQ

We were thinking of adding each functionality as an mfd_cell + 1 
mfd_cell for hwmon interface.

I understand it now, it doesn't fit well. Can you suggest any other 
sub-system that can absorb this.

I can think of moving everything to a misc driver with a misc device 
node and

register a hwmon device for reporting power. please suggest.

>
> This submission results in a 650-line driver that registers a single
> cell.  One that is attributed only to the device it's being removed
> from.
>
> I see that Guenter already said:
>
>    "This is not hardware monitoring functionality and would have to
>    reside elsewhere, outside the hwmon subsystem."
>
> Well it's not MFD functionality either.  Sorry.

>
> --
> Lee Jones [李琼斯]
