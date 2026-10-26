Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793033371;
	b=pBL2ZJ+d6PXxHHRk1hW0QPG7qG8GcPtgsnsnuRbhSYT7dU0KY6RJq3UW77m57sPSKy5j
	 qpah112ZeGyhDTJZhF50C1LwR/jQWrxrgQER5lCFY4acYvVmKXINNanGKR0B4nJW9iQ2A
	 1/iGWB8ipT5Q6biWeAzg6bA3FcMyISIhwgGlX4evLM05VjLY+j3TuCWVs2WdMohAizRRW
	 nr8s6wCohiOdBxnMlYdrWENuOWwuZCmtlp1dkK6TRrum952fCewtdc4IkS7qWVSez94pU
	 8qA8rB4S7QsF0bt/04/+L/ExJw+q3Ifdrk2U052aGtian7z61Mbfgv5h8E5oBYiQGVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033371;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CuMr5O2dc0SYh8l56ne+XDDxsQrly1A7DyhGpcssdaw=;
	b=zlu89Q+X7gzuoOEEHacLLdRQ9/8JMfbNCsDRFbkxe3r7acrseMbByz8vlW2EaC3Y3D/1
	 BzZ8AZtn0HU/TiKFLui7nxd+4CVza7Do7sMWkY87I6IRrXsVf+OdiJC5z8MHL+DxRrhev
	 wdI6wawqGGKg2wGdtZLiA8DGsWu7xV9roUE+SnvPDiFKSiLuI54G6/9cI3cFgq21KYHyd
	 mqYTaLxWc9VQXnWbV/a2glzK17J0fVdAXmf9/1UHJiozqDbWL1pqg5eHRaWeHSF3PNUkP
	 KX41bhmvCY61fkrHg4OeSmxyhM+vhRzZA3QH/wvcPwaSprglcbinsXK9HdO7gX3xQBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Yakm6ZzH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.30
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF0606A31E;
	Mon, 26 Oct 2026 16:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADF0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Yakm6ZzH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELgfOfyft1bSHslIbOsK7XWAVCcD5g4oTKJgRvpD5N1iu2PIb0h00Mvf+6zr4ycmc68bgPDqLgR/9tuhFAAjhkR7oeKHPPJJdRPiy8NTU98VzPapJ+wA7mVICVDV6vxBjQLUkf0551oeOmE9sYlQMjq8fuALLDqZ09R4ULMxMivFUsVtIm66c73YDgIsA/qp1ApdydGxYvpCsF2TDRimsaGmEKRE94n0PJSnsz2xw4FcIbUfWc1d/bihyMbSzX5vr5zPiBIHl1k2cqTroJnV75uzCfGTChOBxDfHIOZ1mU0XL/B9l57uy51Adhn24X1rvA3NxDPPd1vMjYSQNW4pHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuMr5O2dc0SYh8l56ne+XDDxsQrly1A7DyhGpcssdaw=;
 b=IqCMuTUnEDSCVypyRhL88wqc+K16QNWDEQBKPzMlRLsaPY9rbudyVPZVJoFwvaqy4IM23wQZwQlJDRjIo17VVmAKb7vxbxPjV3c6bNlMGKvsu9O0OlYXv+i1q3BPMpyuwN4+f9phyB7y7/vDHqxMI7GCx889Qd6kEwXzfiGukV7kkLqN/1mQCAHdFLPufDJBxTOFGBwggdHqAG6pxKRQ7Y0yB8x11PHD1991oC0dwpTXP6qW7jVazQrz+HU2gSbFmlWd/MLaKl9jWzFieuGidTomCNm5qYSoDBy+1FelJSsuiU7ZVQXS5JSsChrwf9v/k3fflHv4QZGoxyNYvm0KQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuMr5O2dc0SYh8l56ne+XDDxsQrly1A7DyhGpcssdaw=;
 b=Yakm6ZzHTXr5NuXiLvGTskGLGojXq2q1+ic3gsnTXARb//zSeiyZUW7mc3fgSAWHG2G1Tx5dwHSUE+6PU1MuVJEoQusV/K9BHCgviA0nt6s7YHG8lP2Tcys3ClexDNqiqm/C8p09Wo0QGOw/7SRs3YutKJibv1uhKCm3ICnKy9k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Mon, 26 Oct
 2026 16:49:28 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 16:49:27 +0000
Message-ID: <58b96909-215f-4e83-9b59-37dd24581248@amd.com>
Date: Mon, 26 Oct 2026 11:49:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
Content-Language: en-US
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 W_Armin@gmx.de, corbet@lwn.net, jdelvare@suse.com, kuurtb@gmail.com,
 linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
 <CAFqHKTmQ2R-UAP9rAZzoxe=p-T1_JKPU1NaQ2ijrVg0RXZEHUA@mail.gmail.com>
 <CAGwozwGUAEb4Q9pfd_+aXMw2P3qY376F+usPHdUFO5Q6mV_ATQ@mail.gmail.com>
 <baf91d42-13dd-41eb-88d7-d6311ee0d9f9@amd.com>
 <CAGwozwF00=zMvJKrjMG7mO18zRqSVF_Pz4DDf+og0giC5oSRcA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwF00=zMvJKrjMG7mO18zRqSVF_Pz4DDf+og0giC5oSRcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::19) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 9148289e-a99e-4f99-a5b9-08df3381189b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|4143699003|11063799006|56012099006|261026121527099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JtV28XyNlMilg+fuc39Mfh9pTgk0srct/ipW2hDCjQH7hQdgfCSSvZTSvYbxPjHW5urMeaNk8DSkoenaaOuJ+Gi2+MmAtIPuMLTluaxNkRMMTT0oD4dszfbk37OkPPZYIW2hP8992Kb2Zd1eLLzbT5DcWgZ226cvYzNDEAJfY9bMmUaNKshF4abGi8EjVk7ZaRTJ/zqIqhyc0+Xee3XdO+fLDJE29jlAkAMrjh8z3V/7+IsFXh7FZJoxWfFei6QfqOPoNnqOTBugAd40SDwPvCv1iiCj8yeNp1BJAUVbn+HWvdlC5IQ/bcJX6PCdemTTebq+XKMBkZAAdteyL05VcRJCbKx2NB47NIYoUpjvlz6XW5wbmDYi6WAYkjQT5931b+xCmWbWLmsbkUq7ZThjjL7wi7TPW1CGDba9jUUZYxJJuTW7IwhLpyKtGYs5BQKNkNzMbgzSYt9yAEgF6zcT6uLjMK+wsFNKhZe4GMGS3Ik06/QPukmDvwH0tFuutwDOUvOzF9krxa/Cf2XUlyanRg9w6Si3IBvkMnIjYse45Huk/pyBeyLRtbUQz8G2QNlsdb29shzcYxnstfryhezhWYQivNfzWWBVIoDfHMixCxoh37k3iYOhyV3WFM53CEKzz3Bw8gMC5OhT9SaqrmBrGMoA7odNbLFFf8o09yTDIeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(4143699003)(11063799006)(56012099006)(261026121527099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NXUXFRODc3WXBYbUcxRWNneTJWZjlkc0tlcVd6aGFGdVJ6dm1FaXVBMTQ0?=
 =?utf-8?B?eWMzeDY5cEx5ZFZvRi80eS9qcndIdGhHMVBnbFJVU2ZVNEE1dDdxaUg2Titq?=
 =?utf-8?B?b2NpNXhuY0phMS8xTE5PSVBOUFRtVW83WkdONXBrNTdMeXBvRkFWMDRwOGZO?=
 =?utf-8?B?cHV5MVNVV0lkN3Fva2R0azlSRjZ6aitJRTU3SHNDaFJ6dHlSTDEvVEpmeFRK?=
 =?utf-8?B?T1VDVUFRTmZUM01rL01XNW5Uenljd2daZ1AydVQ5RUNxbnlzVjQ3UmFKUWha?=
 =?utf-8?B?STlEcXpGeE5pSklKQ1JIbHpnZEFYS2tVWlpvMVh6QWNtR1JKbFg4WnV0Wm1s?=
 =?utf-8?B?bFp0cHJ4WkpLMG9WbkEzdXZCNzVROU9FK01aTGF6a0pQRXpLZ1IvdWtnNWg3?=
 =?utf-8?B?M0lVNythN3dRWFNuSUhsb0s3UmdOK2dyM3RWOTN1SDVmT2FxeVpBZ2Yzc2g5?=
 =?utf-8?B?V1ZTZkRCU2tyY1d5THVPUUFSVkx4NTdUNEJEdnQ2MXFZOFpkNmZxQUhaeE9K?=
 =?utf-8?B?bERReDlGZVQwd2R3TFNXMTYwaGdnTkNuV0xxUUtCT2t4ZDFrb2h6bE9mQ3dS?=
 =?utf-8?B?ckxPaDJGcldLRE5WK3FRMkRHcFVRQ2dEbldram0rUnJxdlN5QmZiTHpKQWlo?=
 =?utf-8?B?eHhoZWYralBKZGlaMWUzWUE3Qk83S0x2bUFsbi9NZW8xS0hPVys1QklwOXIz?=
 =?utf-8?B?WWlQWG03VkFJQ0o4bGE3Y0ZVNVFydmRyeFBCR29xMzRSMmN4SWVpaGo0VVJY?=
 =?utf-8?B?ajJrQS91NVlmbzZWOE02MmJUSWM2OC8rWldiaE93Ny90Nm8zMElCaXB4elN2?=
 =?utf-8?B?bHp3blVyYTVSVktveVV5VHlHYXNRazJpWmo3czdVRzBxVlR6ZDBscGRKNnpW?=
 =?utf-8?B?eDY2ajNVWUt2eHVBUFFXOC9lYmxMSHRjOEd5c0ZMbEJzTlU1K0VyS3lMbHUy?=
 =?utf-8?B?Si9GM3dLOXRCSmYwc0pMS2lRalBsSGxPVy9JUmZ6T1phbzBldUdpaXdSekg5?=
 =?utf-8?B?YVFCc1lzUnJlaGNLeDhIc05JM204NkJtMXdxSVhIUmdKUlBvR2ROUjlDZ29s?=
 =?utf-8?B?Y3lvY0w1QndITnl0NnYzeVNjb3c0Wnk3K1k5L1FaZHlDMGJmajg4QndxRHdG?=
 =?utf-8?B?R1FvKzVva0gxMzRuR24xSzFkOFBYbTZ0Vk1jMmU1MDMyUkRMRVFDT28xYXYz?=
 =?utf-8?B?emdQMDdQdldBYXNiTzlLQThhT0ptNlNWV1J6UDhkblV0bzRicjJhVFZmQUJy?=
 =?utf-8?B?cS94eERLck5JaEtnWTFIMWd2YTlWYmRRNTUrdG5OdFFnb1BHaERZNW5ObTRr?=
 =?utf-8?B?Unc2REtlOFRlbHV4QVV0eVpLbDR4b0hNOE5LUHduRTNabHFVZmUwMVQvWXRi?=
 =?utf-8?B?VWkrVnVVZm11dHgzTGxoR2tTdnhyNk5yQ0NMTHJIMUhYSkd1eHRrS09rWjNh?=
 =?utf-8?B?a2NERVYrNjBUTDhKQWFPY0pHWnZZVCtscTUzQWIvSW9XSVU1R1RJOStBRDVr?=
 =?utf-8?B?RjhqSHc4Qy9PN2hKRWRtSzRRUkF0R3FLaEZBOFRVRmxCVHpaTVY1L0x1WHZE?=
 =?utf-8?B?MFdiWlVubG10bEU1eFdVcjQ4UkhsRDdJMjNnTHFoM2hIYUkvY2dWRG5PdzNi?=
 =?utf-8?B?Ri9BR213SGt3OTE0QXZqSGUvcnQ0bWU5RkcyUzVMcVZUUHJLcWdrd1IyaTE5?=
 =?utf-8?B?UFoydFVMVCtjcHBpVnVONlZSR0NqejZuMWsycEtLdnI0b2NFd0xtSVNGTVNv?=
 =?utf-8?B?eHdHL1ZmbEh4aFppSmk2enkwN2xlRmtFa2phSGFWK0RjbDFPL0xIc3hWcFNo?=
 =?utf-8?B?VHJoMEQ5OTNldHlPaElrYkV3UGdvR3g4V1BBUzVFMjdWTjJXSnpNbVJBNlN2?=
 =?utf-8?B?MVArd1lxcGZQa1h1cDE3WDl1UTJzQ0VNc1FSRGJHVDFVU0w0dmNLYVV1WjBB?=
 =?utf-8?B?MUVPNXJEaW00akd6QlRhR2hmSW80b1UrL2JhcWhORFRGTnNpUkdKMGtQNFV6?=
 =?utf-8?B?aGtxRTQwN3VHS1A5VTJicVk2MTFEQmN3RWZBS2YrZ1RwZitCSDJPWUZFYkJO?=
 =?utf-8?B?V0tHU01VUVJpL2ZOd1YxeHNzNnVrZHE3U3NTQUhPYUZpTmFHUXh4SzhXdnhF?=
 =?utf-8?B?NVNjQU1LNGhYcWRkbGlyRVJjc04yNVdvTkRsaThuMDZ6OFo2dXlhY2NjVEdP?=
 =?utf-8?B?SWtoN2QrL0xHbnhTWW83bCtIWHMrRytoMm51MERjZzYyTWQ5aUhzTnc3V2o0?=
 =?utf-8?B?NTdjTmFQZTdSODczcStJQ3NoVnpTVndNd0ZkWUZWWjlHbnNqTTVtbGs5SWRu?=
 =?utf-8?B?Z04zVE9uVHdidWtoNGNUR1hwSmdLR3JpUHRSNEgyVjdaWS9CbC9mUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9148289e-a99e-4f99-a5b9-08df3381189b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:49:26.9491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4w+XwtjBvlzb+Dpdkya/4KOb+q/8o4qxRdAND7X1gHtxCxawv+lwRTou38/MMV5rbAZ/LqJkjP4kBIaKYlCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264


>> If their BIOS/EC is using one and reverse engineered software is using
>> the other, you will expect problems.
> 
> Correctly implemented ACPI should 1-1 match both modes, so we do not
> care what the manufacturer did. Caring means their boost values are
> not being properly set.
> 
The problem you need to keep in mind is that if the EC or BIOS is 
setting policy you are going to get into a situation of last one setting 
it wins.

BIOS/EC policy could change on anything: battery level, power adapter, 
sensors etc.

