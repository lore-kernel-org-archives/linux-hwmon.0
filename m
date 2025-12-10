Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010079.outbound.protection.outlook.com [52.103.72.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C84E2C0277;
	Wed, 10 Dec 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765360122; cv=fail; b=sJDDUoWCvTSsGGNwmKq+eIFai6zO3h5uNRehok1PWdFt4wD+RHiOUhSFLjFrMxmmn8CNmU+yRnsV8GxvsvYpI9mSSUf4G/H/aaFOQPb39hPQ9MlSSSZ9MBQnsqVWwbTLypgrR8YyDhK0+Ev0AlpZCWVrE4xK4trbWkvGAcT55N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765360122; c=relaxed/simple;
	bh=LnZZFPqsXnFS6b0XQa7UrX9Zui4sSffbR2CcFzbXSJ4=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=KsTZNjxVZ79EVHzo5NdlPZ8PrrhPWLV4GomkEuaYXF4dnyd7NzkOJ/fVWUpgs/ZsSRnwjdEYzW3K5JPHJwGUaTf3JdgX7Admd0++rF5fbECa1u4lgxlZIvxUoaYrAwRylObdpe68CO0FXnoLj2RguD2vAXdcKu/SsK4YjUWVLKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GnuM0285; arc=fail smtp.client-ip=52.103.72.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GnuM0285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9T1HjgvWoffV8sWWUa9gvDSpDB5ZrswDfU5pvhMGkIc5hU8TGT/jcOPuzDQJyYkzm1MZR/mApfNhlIZda1+3gky7xhYyORINOX+GxumKusUaxwXGliZVBnSRbf7biAS6oKmd+0JHdG3DljXry0PMiEMQjuPoZ0L7EuYc4njdBoHZBtN5E8tVhgYcaJCCQ9cbKfqB/0x1Qw5jzfiJF4QQCnRMWfnhhb5J3PNWoouF72Tv4atWg3AYyyfgB1xl5JChMy4r3jsZojhArxUCeY7Z2v8azc21tWv+EbrzAUdEhjcXhpUf06TenWrp3MJM8iNFhGChasqb/gwQ2kMjoxClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnhNJAP7JXlD3YAgXWfVyQ3MZ33L3+krxrVrQAlgQ2w=;
 b=gjz+mQyUxDNMXRrtqivydg1JT5bLBfRW9FmjtsD1cBYj5pnwK6A+etwpLK6qGCPqXZDc9zw8U2b0eb1WNnS7l5oiA+PlgI28klsFtq7atuY/iNapKYZxfRX8YkugatOXlYppr72HeHMYamYbv1vJ4wkpIY4yMLuZwafWotLig+KAKON2D6UviU65Rl7orZO3xkGuxvPyIzr6vgBq4YQHykhJschoBLx4UpUc3QLzDnCJQJF0lTI9Pf0wUyrbkQItzvhDXSHPcdyztitV5GvfP43sQW7r4dQucmhFe8svvabgs0AOMCfGnTsMyKmHXdd6fMNResoZ5fSEu00bqGB9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnhNJAP7JXlD3YAgXWfVyQ3MZ33L3+krxrVrQAlgQ2w=;
 b=GnuM0285gO2Vch+hl9ZPR59XVBOHrgncUSr1e3Mr0NigarUGlMGH/CI3aDUymUErLLYzTv4nkcvpzKWYkaoR4tnEWC8xM/IEVJUA8+U7KcOsCMxfVERk9PLGuHderAlkuQ4dVUYGiLGBB/jWcSZgqgy5Qhasewxt5BXQeqN2U+R3A6ICcKR2V/Vg7c4DtWbQgU1Pr/qY1l2EHvOjhINRzm+Qr8YoubJFrG597h0B7Pg5srKkn3iDD7A8MKZBws+0tEeAHLeEyM2XxKpX3K8/TeHoaDJ4Ckm3vduZGrdXrhA+q2OjibBcq02ddvYJC6ii8pgJP0r0XIPbJTnJKBuU+A==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by SY9PR01MB10358.ausprd01.prod.outlook.com (2603:10c6:10:2f6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 09:48:36 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 09:48:36 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Wed, 10 Dec 2025 17:48:08 +0800
Subject: [PATCH] hwmon: (ibmpex) fix use-after-free in high/low store
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <MEYPR01MB7886BE2F51BFE41875B74B60AFA0A@MEYPR01MB7886.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIANdBOWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0MD3bTMitRi3RQD8yRjcyNLA2NTAyWg2oKiVLAEUGl0bG0tAEEZkKl
 XAAAA
X-Change-ID: 20251210-fixes-d07b37290350
To: Guenter Roeck <linux@roeck-us.net>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>, Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=LnZZFPqsXnFS6b0XQa7UrX9Zui4sSffbR2CcFzbXSJ4=;
 b=owGbwMvMwCVW+MIioLvvgwPjabUkhkxLx1d5Ymc2KAY+zrDi3DvnxBT9d1GhBoFrl8foPJnCn
 vmXpVWjo5SFQYyLQVZMkeV4waVvFr5bdLf4bEmGmcPKBDKEgYtTACZSe5rhf6Ht9hLzjUcFT50y
 2LKhqXLqEc6t04/9uyR75p+JhKivuxrDHy6Bs3/8Ps6uEZTtOzDpxa0zXzeL3PV58bxxb8s39T9
 dR1gA
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To MEYPR01MB7886.ausprd01.prod.outlook.com
 (2603:10c6:220:17e::8)
X-Microsoft-Original-Message-ID:
 <20251210-fixes-v1-1-0e84411be3bb@outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|SY9PR01MB10358:EE_
X-MS-Office365-Filtering-Correlation-Id: 6544800a-a379-4fdf-493e-08de37d14842
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|5062599005|6090799003|15080799012|23021999003|41001999006|19110799012|12121999013|461199028|8060799015|3412199025|440099028|53005399003|40105399003|11031999003|12091999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGJtR3dZc2NsRUlwRDB6dm13V0RuTTVjb0h1U0c1OFIrdUJEbVRxSUw5Y2VD?=
 =?utf-8?B?cHc0WWtFLzFrSFo1c3UyZHhCUnQxWGdaWWJYOHE0dXJ2UFFHRjhpMGtBVVAr?=
 =?utf-8?B?b0ZXTGo0K0tMWlFhTG5tQ1BpUXhxL3Rha2ZyMUw2TEM1VzF3eVJPdkF5Ykdn?=
 =?utf-8?B?Uk5zNU1tZyt5VVVvN2JlbktwWVpFUGJLWWllZHFEQU9IUW5QM3BVWGtsWmtw?=
 =?utf-8?B?Y0hpS3dqeE55N1pZNGdoczcvVmFTNkROMkJsRUU3L2NscXpRRkpGRlNYdEY4?=
 =?utf-8?B?RVJrOTdZbXpyMkV1NFRxd1hEc0VCTVhZK1FDZEFveUR1STVXUmNmaS9sc2Vu?=
 =?utf-8?B?SkFLRlRwVlcvNEt3a0V5UEZVMGJiTEhQRDNFYW9yZ1lpZ0lzbC8zczB6Kytw?=
 =?utf-8?B?OEh1a3A5bmlaNGhKMkQ3UmVoaURNNmU4ak5vek1QM2REMExDcWk0czF4a09q?=
 =?utf-8?B?Y2w4K2oyY005dUdoc1lzQmVLTFB2aGxrOS9tZER4bHlDK0tKdi9CSDN2RUN4?=
 =?utf-8?B?bFhsNE5jeGlKanJqU202RjRpMDJyNDRFWDlQT0d0dFYxN28xbm9xK1Ura1Jh?=
 =?utf-8?B?dXJjd0RpUFZGaGUrMys1WmFhYk9wSTlSeE9wZEROU0srNnhja2dES2lXTkZx?=
 =?utf-8?B?MzlpTzNRamlpeUVkM0lEVlhiZnE4TnBUbUFWMEZxQSsrRUVNd3ZXU2NTWStv?=
 =?utf-8?B?VjBQZ0JJbURld20xWXlDT3ZldlJQTWNVdi9rT2NUMEZPNmFkVGlocWIzVktv?=
 =?utf-8?B?bkYzZmV1U2RHNnV1WG8wemlDdjVwbmtpc2tka3JXcTIvNFVONzVodXdLNDN0?=
 =?utf-8?B?bWt2SEg5Wms4SXU3bllSTkJuRWR6eU5CdVd3T0o5RjdqTDl3OFYzOFNPRDlV?=
 =?utf-8?B?WHRzQm1ydnBuT0JoZlhoQjhjK1IrWTI3N1N6eWJHVEYvNFZ0RFAvZ3g5TVI4?=
 =?utf-8?B?VFNsOGVMRmltZ1g0aXEwUWlYTWpSbHh0SmNPZENQbC9kbno0c3JLUGdQRzl5?=
 =?utf-8?B?OTh1Z3BCdmQveGc4ZVB1M0hrdzJQQzlyM1lrbkN5ZENzZTNlc3Z6VnVRSTZk?=
 =?utf-8?B?dEdUUTBZUC9tU0lUWnYxaU9ISHowYmh6TzZIUTFNNWNJNCt5YlRHWDU5VXg0?=
 =?utf-8?B?YkZXUjkrWVdHdVBQa2w3cXRkdmxBNHYwM3RMckViOFhOM1VyMUZQSGJaWGEy?=
 =?utf-8?B?aVYyWWRTamtUVnFxdFBCTWxVUGJ5Mk9FZ1Znak9venRIUkFaTHI1Z3ZYNWh3?=
 =?utf-8?B?eVYrZnVlYXU1UXpEdUJNL0xtQjNkRXB2SEI0bTl3UVZxM3hOdnJtZDUxZ3Q3?=
 =?utf-8?B?TCtRbG1SN25rcWxMajl2YWhLVVVhNFQrRWdOb0xLZGhDZDhEaEt1cER6RVA0?=
 =?utf-8?B?MVo0Z0FxcE8xbGhwdWxhRjFNaU1tQTZPdGlPd1FBS2ZRcWNjY1lLUGlWSHlh?=
 =?utf-8?B?Y1RKaXZxa0J2bTV4bGNCb053V21SamxTbHgrSStPVmpneWZYY3ZIM0d0WjhE?=
 =?utf-8?B?UU5vclhpekZILzkzSFU0NmVzdTROdkZVbmF2RGRFMlI3V3pBQWx6RXJscHM4?=
 =?utf-8?B?SktwSDc2OVM3R0gzb1lHTEVXanduNlFjZkRGVWI0OGYvM2trVk1yVFhSRjdn?=
 =?utf-8?B?WVh3ZGdUMjRnYTYwVnRoaWVrRVY4U3laeXpiL3VoeHZyb1dhZjhvWHFmMkZl?=
 =?utf-8?B?cENFUDFUWE5rQUg4V3BWRnBneGo1eCtmL013a29aN0ZBNmhxTzRLZlpUa0Jo?=
 =?utf-8?B?OHZoeG9CU2R5TjF4QjdyTkpoRmdZQ1lsK0N6SHYvVGFVTGtvaTlGZ1dqei9K?=
 =?utf-8?B?Uy9SUm0zUzY3emNKc2FPeUY5bWRGUEl0N2c2UmVNRCsxMWNOY3lWdHVYYzYv?=
 =?utf-8?Q?eXbvKPTjwgm0b?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmErN05NcjNWMC9pUHFTSUoxaVBpYU5mQTgyVDBDMVpHQlYyOENDenpGYVNk?=
 =?utf-8?B?V2pLM252bkdxVmVyOEhMbHRLZmhrc0gyK1JCbzlCRm5odzJ6aCtJak1JV0Q2?=
 =?utf-8?B?RUtVMUlNaEsxejUzNnNJQWFNNEhlNnRMODZrT0d1S0lTZW9uam9OM1lubFRG?=
 =?utf-8?B?SkRvOG5nRVZtUUo2bnIyRndFQkE3U1JxVzl3Z0kzVURJMG9UblZ4L2N3d21K?=
 =?utf-8?B?OXZRVkxwKzhpYTluNVBVUDhKYWx3MHRRM1VmV21nUGZKRzFMTXBkckJIL1ha?=
 =?utf-8?B?S0ZmNU9lQ2pWc0ZyQWdvdkpUeDlYM0xkYWhVdTJxZHd1SmRBTG5xY3NWekFZ?=
 =?utf-8?B?andIUUhPYTRHWE15ZU9lT2tteUpCQXdjTWliemVxckNrSGY0aFYyZ1dhbnlP?=
 =?utf-8?B?aGhxSWJsYkhxMHI2SXBseUJIRjltbFVieVFFMFM4VjR6cTExK0pwcXBSQmQv?=
 =?utf-8?B?VGJaaEZwc1VHd3UyUWtPVTVGYngyVVJQVllaY29lK05YSWVmKzBhSFZMUlFF?=
 =?utf-8?B?VHYxRnRTc3VYZ2dQNlViTmlqWXhSNEtUaUJlVmp6UlJ2Z251Qm5DRVdCZ0lC?=
 =?utf-8?B?S2VUcjlFTmd6cUZscXhMOUN1bFdtUlk0MkdrYXNjVEkrUXk1WEYwSGdjQVlw?=
 =?utf-8?B?MVRzajVpK01xbWFtbGFaOHR5bk1WbzBmUTNXSXdxUkNkZ0Y4WFRTRW1mKzhT?=
 =?utf-8?B?eTR4SkhNN1BNc082SzBqQ3BVejZmdXJNcXczajVabmtVSVFlQWdEWklETGJp?=
 =?utf-8?B?VmdvZ09mZFBEL1Rkdnl2YzQ4bUF4SHBCN3BSK0VwNnlmck8zc3pXZnZFWk9B?=
 =?utf-8?B?RysrTFpuSG5HQmNCQmVaditqb1c4QXdMc2hINXF1Q21CWWxyUEdiVnVXVkJ6?=
 =?utf-8?B?UE85MW5FTWFWMVR2Mzh4cVBpRW9XQkZtdGZXNGkxSnVkQWRUOVhJSS9PRUhk?=
 =?utf-8?B?NTJ0bFZ4aHVEYUhnMllZS1Iva2hMY3NxWUxjRmt2VEVkZlhPWlZ0L05ITzBY?=
 =?utf-8?B?N0RYeVIxSFdJY0tiT0xLMVdqVnJZOVAvNnljekIxVXFTMkJuWmttam9NaTBi?=
 =?utf-8?B?bFZXN3pjWVJZaUo1MmJ0RExwUGl6M05SbXNqNFlNdHdRRDZPQ1RJZXBQeko5?=
 =?utf-8?B?aG5sQk1mMkFacmhBMzRFbWM3RG9la0JKL0lWMHZpRWNURVNzS09xb0ttUExy?=
 =?utf-8?B?MFVpMmVuZUN3S29zLzU1cktoL25MZlVFa2lGcXhYcHU2c3RBejlFY3IxU2dp?=
 =?utf-8?B?MWFKTnhMOTI2YVNXUVI5T1R0eXd2b2tsekpMNmEzNWd2SWRFd3I1S1cxZmZl?=
 =?utf-8?B?U0d6ZUd4TGVTUkMzU3VDalNWcWgyYkxFVEhiSWNoTDBMYTZPdFkrOVhETUtq?=
 =?utf-8?B?WDBOOFFSSzNpNDFVQytra2piMDc1TklwNmpwRC9leHZESHFCbHlVcmtmZith?=
 =?utf-8?B?akFyNE5ITXRzc1FkbTRmaVVFcVROL2R2bVVZdytzNWVVNCs1YnNZVmk0OUdr?=
 =?utf-8?B?Zk1QeFJWL0ZwWWN3eU9MaStidzZ2V2hJWFpNejFuRWN3a00zUkl2R3E4Y0VY?=
 =?utf-8?B?ZkIrU1kwYU9HaE9BTlNiL0REZlhjV3VSaCtqMkhPRE9rMjhPOXdHRDhQOEY4?=
 =?utf-8?B?dTlkNUR0NmpSVHFveEpJSnVLS2dMU2wyZlRmbEdJN0kyQ3oyYXBLMkliSFV2?=
 =?utf-8?Q?H0zSE3IV9w5ulavUUZby?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6544800a-a379-4fdf-493e-08de37d14842
X-MS-Exchange-CrossTenant-AuthSource: MEYPR01MB7886.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:48:36.1586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY9PR01MB10358

The ibmpex_high_low_store() function retrieves driver data using
dev_get_drvdata() and uses it without validation. This creates a race
condition where the sysfs callback can be invoked after the data
structure is freed, leading to use-after-free.

Fix by adding a NULL check after dev_get_drvdata(), and reordering
operations in the deletion path to prevent TOCTOU.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Reported-by: Junrui Luo <moonafterrain@outlook.com>
Fixes: 57c7c3a0fdea ("hwmon: IBM power meter driver")
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/hwmon/ibmpex.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
index 228c5f6c6f38..129f3a9e8fe9 100644
--- a/drivers/hwmon/ibmpex.c
+++ b/drivers/hwmon/ibmpex.c
@@ -277,6 +277,9 @@ static ssize_t ibmpex_high_low_store(struct device *dev,
 {
 	struct ibmpex_bmc_data *data = dev_get_drvdata(dev);
 
+	if (!data)
+		return -ENODEV;
+
 	ibmpex_reset_high_low_data(data);
 
 	return count;
@@ -508,6 +511,9 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data *data)
 {
 	int i, j;
 
+	hwmon_device_unregister(data->hwmon_dev);
+	dev_set_drvdata(data->bmc_device, NULL);
+
 	device_remove_file(data->bmc_device,
 			   &sensor_dev_attr_reset_high_low.dev_attr);
 	device_remove_file(data->bmc_device, &dev_attr_name.attr);
@@ -521,8 +527,7 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data *data)
 		}
 
 	list_del(&data->list);
-	dev_set_drvdata(data->bmc_device, NULL);
-	hwmon_device_unregister(data->hwmon_dev);
+
 	ipmi_destroy_user(data->user);
 	kfree(data->sensors);
 	kfree(data);

---
base-commit: cfd4039213e7b5a828c5b78e1b5235cac91af53d
change-id: 20251210-fixes-d07b37290350

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>

