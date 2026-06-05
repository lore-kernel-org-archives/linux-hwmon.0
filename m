Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11021080.outbound.protection.outlook.com [52.101.52.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C0D194AE6;
	Fri,  5 Jun 2026 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669187; cv=fail; b=OTuz0Bu2RohQbQAuHxbAv9cAMQdkEqX87UgqG+9i8vgVyA97nr6wQe2A5bf6mjVCG0FEawNsX23DR60uiWNmX1KYuRZhSXISM3q1p3SOAo+Ood2HcXwJNma15/CPI7iFKEMZ3fLoEcgqDp96n0Mu85O6QGXc6heZzLVK0YWH+ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669187; c=relaxed/simple;
	bh=f4NUaCLTr0cwTuvVYsjSI0Pqyg1ZLCiu8J4iNiQEKpc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uDBXzmYBWhfDkJu4dTFsS/3WYMrBkWEVXmk9O5xKuzaFyluO8Z1DE+O0g9mVNLhEXO3f7Mpb2Qbo27VpFWcMz93UOcf3UEFNFX3v6YepPKcd6xHNgJKmbaSJ0hZdMCiyg6rqobpi2FK95eFUpdNqXC7nZbAnFtdIdFQ1qxZdj7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=RXdlgPwo reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.52.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="RXdlgPwo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkRUiH9D/GkDLrzYxj/rTp/ZZnxiGW2uZo3KLyZOK84lb2mLBov6sLDFOcf1qjF+WdZ2T/7S+9cUFyFP22RvI0AudGR2v+44p2XeRwNsWjm4tw+pgu9FTP6viJQY5C5sr2fYRJmP2USe//XHIP2das1a4ACz4bpIdBDHLilMzBX/3ljtpNH6RCUlhYr3jfDToaTtI87t5Xd9k/BRMXCrOZ/+64rm4Y5Fh06vgG0n1afWYKKFDVj3dk1L45lPZrBrVvayhV4mA0Mg29wFy6eeWFHUW787QL7iAH3C/3amH61Kosdwvv36GbpwGT59VwmcRaekIOa6ONDyPMSwMuL2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRYbGOjbP9SLjeZ6uBWt3gbp+e4gEjiWXBHOZOvJV5k=;
 b=GQVg9qoDPu01TWvjb4A0WA/04JdN1QWL10agbStsEeSTpm4ZH5VJhaAAXRyTValE3A6d+WHisitDnXxaoVbODcPKcAbaftl2OjvHw9pKpXIvK244atkkDz/ycVjz/z6VvnYaxgNsjZaPTUga9AyYzXJ1GCuKjPFA5lac0k8QXMi/b3CUqi7Md1/bXSjjZgmU/WUBfP7HoUKsAFst3vP+TY4VSy3rZcPijy2091VVcTY8V9wtnVJhPVZk4K1yG9wz1K/qO3nybgF8PkXJW17+Jk2lLeSpyOD7ED0byO1w+kNKybL8vqleId6p/j/xXK75pw5g15uRZJs1ArYafxg+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRYbGOjbP9SLjeZ6uBWt3gbp+e4gEjiWXBHOZOvJV5k=;
 b=RXdlgPwooX4btNZO50IiRfd7tZsvj/B5rFjOIazzkPIYDtNb8EXcY6W5t6gNAt+VsgEvhIdzJePWTqUMJ/pQ/0ByiL2LsBgJbihwDwV8+TRRGEWKTwHx1FRTxMLqsqcDRVLAXjvHV606wLlpVquhIyVLAaBppi0PaOjYd+AlH6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from CY3PR01MB9194.prod.exchangelabs.com (2603:10b6:930:109::7) by
 MW6PR01MB8577.prod.exchangelabs.com (2603:10b6:303:24b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Fri, 5 Jun 2026 14:19:33 +0000
Received: from CY3PR01MB9194.prod.exchangelabs.com
 ([fe80::4005:a1db:71b8:dc8c]) by CY3PR01MB9194.prod.exchangelabs.com
 ([fe80::4005:a1db:71b8:dc8c%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:19:28 +0000
Message-ID: <345d17ed-2795-4c28-8027-8b680c644b34@amperemail.onmicrosoft.com>
Date: Fri, 5 Jun 2026 10:19:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v01] mailbox/pcc.c: add query channel function
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Huisong Li <lihuisong@huawei.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org
References: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
 <20260605-undetectable-polecat-of-wonder-f817c0@sudeepholla>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260605-undetectable-polecat-of-wonder-f817c0@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR12CA0033.namprd12.prod.outlook.com
 (2603:10b6:930:49::12) To CY3PR01MB9194.prod.exchangelabs.com
 (2603:10b6:930:109::7)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY3PR01MB9194:EE_|MW6PR01MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b72792-001a-4006-a965-08dec30d743c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|55112099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Jj1JBxQMHlLHqYka9piRxCg7+NIoB8KFNphz7lFscGrPM0Bt00bxxqpGVSv3vpV5fOkkfCTW6BnzttSNHaIuNmzkR0Y6wTQGRiGai8wO1XxKu4PpSfDnhmyoDAAjjKhEWu/HatxxLlORITBzWakMzttaVAIKztflomzfeOwV2/thhrio5Dv38RA9SHj/+2uJAzoXLfHTqMulktexA5cSmJRoqgstS0NfHWib4FeOZglCxsRPIvr/4rr1Z7jy3Swz1a/4qQphbC8nIyuoPQ7dEsyRuPA2lKMcyBVUqMZjWEk/HnseUHwjvxVxuHszHOC7sSaMJzAXnuxCCSulEWKAjivV3xuPEvEBh1G8s5PuXHv0bwb/ch0oFi7oyFV/mz0m86IiVu5LVrWDZgy1g8mC8YVoLfzHRj4UZT4iydZD6MHvuvyMIm0pMCHD6DFeWzlIXBIzJh1q73UAj7/b9++69+PW2LfXpinm2sj0QyItE098hr+hmsCsuw9+2xdoetXmNVJGzLVZsM5iWUDsYj3PXfcQWakjE+9kjMVGeAxkj9Gxlq0movidB0+eCK2ROZXX8coghgQC+k+T2T5Sgxte9uAmBKzBfQLgkBl1ikTpD+bFcLfjA65NRc4bHAyXqf/coGzmV7VSI5KNL3xMMSxGrZ5su8ws2K2FOn9Oke90Wo5mtya4StthVaIDg8CeBsATII6qMa/R/8Bfu20C4exJbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY3PR01MB9194.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(55112099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWdrKzk3U0JSSGRmZEltSGlmbWxOUmI0YmdNZEZnTk41WWNlSVdub0c1VjBO?=
 =?utf-8?B?bDdUanNIV0JOZWZWV1M4N2pVcmc0M3laSE1NMWR5NjNVKy9kNXNWUmsrMjA2?=
 =?utf-8?B?Z3c4N1JiWUVHT1lTSGRLWXJRWVJBWWVwRWpUUkNsdExvK1BxUTlMR1RTMm9L?=
 =?utf-8?B?S21acHhUckVRTW5PaE14dlRPUzBuR0RTeWJTcnkzNGdKV2d3cHpuaFpueFNJ?=
 =?utf-8?B?R3dyTy9qWFhYN1c0NWE1Y2luYkhPMGJtK2pjUXpxWDI5YzN2dzQ2T04vY09r?=
 =?utf-8?B?SmJQSTcxZmlxL1NzeWVGKzRUQlA1TnV1L2NCTG9vUklnZGxzMzFreVhLancx?=
 =?utf-8?B?U0FISVF3K1lzcnZYR0ptSm40QU9MOVd4dHlrV2F2TkQvMnpUNmJGVHE2dzBn?=
 =?utf-8?B?dFZnbWo4VkhKUWtLL0RESFFDUVo4WDRPblRyY29NeE9XVkhaM21kZmNSODdn?=
 =?utf-8?B?ZFZITy9Rc3lYdDlwamFXc3JCOGlCOFN6NkZtMEZTQU8wV0NjL21IRjkxMjh5?=
 =?utf-8?B?bUg5MmhCd1lrUXd4emZ2Q0RMK20xQSt6dWh6MHVOU2g3SnNyWW44Q1dHWWRp?=
 =?utf-8?B?SWxyb0I3Vy9mYlVqSWV0enE3aytVTVJTang1eEoxb0w5eUFlZ1JuVlJyVUJy?=
 =?utf-8?B?dzAxdzkvbExuRGpkOXBKN0dmVkYyQWtuMlpoMWYrRXJ6QzlkaHZwUWl2MFBp?=
 =?utf-8?B?ckxmWGdISzJLUERTTEZUWUtieEdKNmlaeU91WWNwdDVjMDIxaDlPbUR2Qkxj?=
 =?utf-8?B?UGdwbDVwOFpCbkplbnNBY25Kc1FtcDBWVStwbnBRMkZBZnNJR1VYNWdVNDI2?=
 =?utf-8?B?VmRXWWwwbGN3R0JLRXlRZzlybmdXR0l6R0lLMFV5VURIaXp1L2QxU3RWUElJ?=
 =?utf-8?B?ZG9oQkNFTzJiQzFSRUF1RkswWVd5ZUNXSVZuM0NjVzQ2RkdyeVEwbVlHM2tS?=
 =?utf-8?B?YXA1YndicEhjUHZKc2hCYTZ6M1lacVplVC8zL2JxN251SFhDb1J1bFF0VWoy?=
 =?utf-8?B?YlA3c2RESmZXVGxPWlRCbkxzSjhzVi9VWkNialFjT1hZWXpMUUhmOERIT0Yr?=
 =?utf-8?B?UEpxTXVkQkNUWVdIakFteUtHN0JUT25ydVM4UUhRSkVCMUJDaUpaa1NHMkFM?=
 =?utf-8?B?R21EOXBmMU1vZ2ZPanA1eDFyK1I4YU9kbkZKb05EVm05NG93NTdkOGFScEtV?=
 =?utf-8?B?WWQ0dDl2bjl3d3FseHpldnFWWGk3QVN0UjRCQzY2Z1dsanp6ZVNrMUpTRUJs?=
 =?utf-8?B?QkFpQUNqbU5vSVJJVnNKbHh5OWpJd2djckNrSVhPSWVBRzdLUkEyUFZRWHpD?=
 =?utf-8?B?QW9PQXZHWmhEZVk2WXhZTXduT2gyL3BOQ1hBaEhYeGlSRWZqanFxdUU1Tk9q?=
 =?utf-8?B?QUc3QkZ6ZjVWS2thbDgwRkdNWFNXWit6S2NxY28xdjIyYjRIU2NsVlNTRXgy?=
 =?utf-8?B?emZjL254bEpCd1hjaXk0THBqZkNpWk1PT2MrcjhaTEpyQUJyUy9UZGE2aGRT?=
 =?utf-8?B?RWFlVHU2eTNEVUhiQklHNVVnOXp6YjE4Uis2SjdZWVJjK0Z0Rlc5d0xyV2gv?=
 =?utf-8?B?dDVwZUQ4WGNHNE5sRGVuQjVkenQvVlkzRS81UFFUUUZvSFBSK1B0SWppUklV?=
 =?utf-8?B?cGFRWHRhaTRtbGh1MzRGenYvck0vN1NOMEJmQkhvdkMvbjN4Y0EyYkEzQ2lV?=
 =?utf-8?B?VGE4Mi9CaU5FWmNiQlROdjhETktRL2ZOU0dPZ1ZIWFhtb25zOHFORWJRQXky?=
 =?utf-8?B?aXhyNnhZVnp4Y2t6eDJCUkNHQ0N1MFptcmFYYWkwN3R2M29FREY1SWlJRmZ3?=
 =?utf-8?B?M3JoM2ZSdFRuUzk3b0hZSWNjZTEzakxOOXhHNkhpc0k1M1VYM2NrTjhGRG9T?=
 =?utf-8?B?T0R6OWVMQ2RkNmdsTlJqTnFSVnMvMDZ5aW9mTUxPTjUybWRQR3BDMGJhdHdQ?=
 =?utf-8?B?YVRyUVFqUWdqVWdEcUYwcHY1THQ4VW1PNWZrbVFGOVBhMnowKzFlRzJmbjJ3?=
 =?utf-8?B?VWJkZHJGcnEwMUpTdC9DRzVYcXRuOVY0WVBIL3hGL3RsMzh2TmttS1hPdmZa?=
 =?utf-8?B?MHl0MHJNa3o2OVNuSW8vNnlMc1JaWXhNQURnRXVlak8wd3BHYVJOMHZSR0xF?=
 =?utf-8?B?a1cxbDhxdTBZYmR1NzZQOVFkdVRCejRxM3kwWk1mTUl3aHh2eWRkRXBnNTA3?=
 =?utf-8?B?MVBNdGZGU29ObmFXY1dON29wMStPTXlYYis3YThDRDY2Mnd5Z1RxamFESHNE?=
 =?utf-8?B?V3FjaXpRaFF0VW5SbVNMalBaWFlLdmpRS2Fsck1SNUgyTlVxRUxDRnNTOXQw?=
 =?utf-8?B?QStwei9GVXNPM1ZzY1BJbG9sQ2hiaGI0aGNLdW01WTl6a1pLVGR3WEkzVFJG?=
 =?utf-8?Q?5MMfkxY5eJsGDciMnIfNERs7nioBNsUR5zPHJrNAGanaP?=
X-MS-Exchange-AntiSpam-MessageData-1:
	wQNapukJHB8sNJictABQMXlVwgnxAyOO6Yicab9j7CR/zxV8pBl+Cuy3
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b72792-001a-4006-a965-08dec30d743c
X-MS-Exchange-CrossTenant-AuthSource: CY3PR01MB9194.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:19:28.7407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8Uhr92NgBpAVtJGmUI9193hgfwtmnj1/Q80UTXL6mauB03ZXeGM7yayiWb6U8tr7X4kC2PJxtKr5yrZ2SDsIzYyMFOYxbNhySv29cTlVGs9py8jPCLXTht5U088qsQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR01MB8577

MCTP-PCC.  I was not sure if I should ad the Patch to this one or not, 
as the MCTP-PCC is still going through review.

Essentially, it need two pieces of information before start up. 1, it 
needs to be able to check the sizes of the two shared memory buffers in 
order to set the MTU.  2, it confirms that the Channels are indeed Type3 
and Type4.

The base patch for that is


https://lore.kernel.org/lkml/20260522193610.234166-1-admiyo@os.amperecomputing.com/

This is the diff that would use them.


commit c02159450cf38cb778105f10a11708d358a3b633 
(admiyo/mctp-pcc-v45-net-next, mctp-pcc-v45-net-next)
Author: Adam Young <admiyo@os.amperecomputing.com>
Date:   Thu Apr 30 10:48:41 2026 -0700

     mctp-pcc query channel information without opening channel.

     Opening the channel can trigger the sending of
     a message from the remote side before the driver
     is ready to read it.  Take advantage of the API that allows
     querying of the channel data without opening the channel.

diff --git a/drivers/net/mctp/mctp-pcc.c b/drivers/net/mctp/mctp-pcc.c
index bb5d53ee3d7c..01a9966eddd2 100644
--- a/drivers/net/mctp/mctp-pcc.c
+++ b/drivers/net/mctp/mctp-pcc.c
@@ -318,25 +318,50 @@ static void mctp_cleanup_netdev(void *data)
         mctp_unregister_netdev(ndev);
  }

+static int check_channel_types(struct mctp_pcc_ndev *mctp_pcc_ndev)
+{
+       struct mctp_pcc_mailbox *outbox;
+       struct mctp_pcc_mailbox *inbox;
+       struct pcc_mbox_chan chan;
+       int actual_type;
+
+       outbox = &mctp_pcc_ndev->outbox;
+        if (pcc_mbox_query_channel(&chan, outbox->index))
+               return -EINVAL;
+       actual_type = chan.type;
+       if (actual_type != ACPI_PCCT_TYPE_EXT_PCC_MASTER_SUBSPACE){
+               pr_err("MCTP-PCC outbox channel wrong type: 
%d",actual_type);
+               return -EINVAL;
+       }
+
+       inbox = &mctp_pcc_ndev->inbox;
+        if (pcc_mbox_query_channel(&chan, inbox->index))
+               return -EINVAL;
+       actual_type = chan.type;
+       if (actual_type != ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE){
+               pr_err("MCTP-PCC inbox channel wrong type: %d",actual_type);
+               return -EINVAL;
+       }
+
+       return 0;
+}
+
  static int initialize_mtu(struct net_device *ndev)
  {
         struct mctp_pcc_ndev *mctp_pcc_ndev;
         struct mctp_pcc_mailbox *outbox;
         struct pcc_mbox_chan *pchan;
+       struct pcc_mbox_chan chan;
         int mctp_pcc_max_mtu;

         mctp_pcc_ndev = netdev_priv(ndev);
         outbox = &mctp_pcc_ndev->outbox;
-       pchan = pcc_mbox_request_channel(&outbox->client, outbox->index);
-       if (IS_ERR(pchan))
-               return PTR_ERR(pchan);
-       if (pchan->shmem_size < MCTP_MIN_MTU + sizeof(struct 
acpi_pcct_ext_pcc_shared_memory)) {
-               pcc_mbox_free_channel(pchan);
+       if (pcc_mbox_query_channel(&chan, outbox->index))
+               return -EINVAL;
+       if (chan.shmem_size < MCTP_MIN_MTU + sizeof(struct 
acpi_pcct_ext_pcc_shared_memory)) {
                 return -EINVAL;
         }
-       mctp_pcc_max_mtu = pchan->shmem_size - sizeof(struct 
acpi_pcct_ext_pcc_shared_memory);
-       pcc_mbox_free_channel(pchan);
-
+       mctp_pcc_max_mtu = chan.shmem_size - sizeof(struct 
acpi_pcct_ext_pcc_shared_memory);
         ndev->mtu = MCTP_MIN_MTU;
         ndev->max_mtu = mctp_pcc_max_mtu;
         ndev->min_mtu = MCTP_MIN_MTU;
@@ -378,7 +403,6 @@ static int mctp_pcc_driver_add(struct acpi_device 
*acpi_dev)
                 return -ENOMEM;

         mctp_pcc_ndev = netdev_priv(ndev);
-
         mctp_pcc_ndev->inbox.index = context.inbox_index;
         mctp_pcc_ndev->inbox.client.dev = dev;
         mctp_pcc_ndev->outbox.index = context.outbox_index;



On 6/5/26 03:55, Sudeep Holla wrote:
> On Thu, Jun 04, 2026 at 04:37:48PM -0400, Adam Young wrote:
>> Drivers need information about a channel prior to creating a channel
>> or they risk triggering message delivery on the remote side of a
>> connection.
>>
>> One of those pieces of infomration is the type of channel.
>>
>> Add PCC channel type to records and expose PCC channel type to client.
>>
> Please point me to the user of this interface.
>
