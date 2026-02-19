Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023121.outbound.protection.outlook.com [40.107.159.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6475E13957E;
	Thu, 19 Feb 2026 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771533920; cv=fail; b=Mnp5zXCrWOuQne8CWqqzI6eZxru0dmLbVXFtg4U7KWBwCoB8+RLKKip5iWkGmagy6hMUDgqTx47SOUydpHDN+nsDbZJ7motzKmX8ryk0ryotQ4gGsVKPJrwgp9Fl10KPEC5wYjhTRUIIM0701aPvXwpqsbU3om/6DsyB821/P3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771533920; c=relaxed/simple;
	bh=53DOokjO3R49p01igIG9Z49OUbaIPpjIVFqr+fMAbxg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cvm4MyoekBDTy/pDGVbmVGowQodtUO3Z/ANkzKWGYPuRgdpS9TmJY2HimtLnh6NxToTVqn+5a3FYVjMhrovozLlVOMV6RQLiLwXAOcSSSftBiSlm1QIonwZhWzARfkKbPHd3M+vQbOr7YnLbMm2+QKKjraZZ2J5UYt/SfQR0L3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=XAGAxrGx; arc=fail smtp.client-ip=40.107.159.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="XAGAxrGx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vM1alTqRGqgvVQ2skfWfAB3lPEYWqqLwz4IpXK2e77Iq8vH049tlQbdaOLQ9ZIU+7QfdtuMEgUgLgFlvAlaqQWkHCkF/IHIaGHxLmXeOrNnQxrrJtH5BXb5NvbTtRLkXCIYGuijxGY6sELN31w8c5CFHYYeIG96vWo2zzMjQM50S4JNdEyxH4AxfVDTzRn49Hv7WRViI1ueXcBZBud8qZ6lcFiAXBstaMsk88LVjQyF43xotmPd32w0y50HFIMVAGVP4tcLkGJQH/06g5y9SQJJa8S+aNMuHOrwyS9ZnRdX6ncMHkKlJis/ri8aasU/jSILn1Q6VBW65GZOngeT2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ4FDYFH830zYQn0i5BESJzqRQOdizmjxwOJ5EpLK5Y=;
 b=FAEWF/4+ubsN9IZzDQHXrdXvxtx21ky82Hlez4SIjKWeS+OuDgjq0kJjph7/uxdH44eQvgkKZFEe/60ghGl4/7upTDRD4kIJIIbXUQMmcBcD7wva/g7s6RACUmZcS3oDHUg1GEdATJmMt074ynk1qiApRiN1TosIbNfl3gd0cLHIftWkei+5CAkrzJ6iYb+31MAeEHjsA3jeecfkc1zH6Cu9vx/u1Phpw9oJCThhQiX23l1RITDih/vLOfYSEuCA83moj+M0XypvbXrcF/xOloTBkNLcByIarpWBcL70yYs/n3zGsII7SK0L8x3wkVfUzS+zMWTbpIea/j85vDEQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ4FDYFH830zYQn0i5BESJzqRQOdizmjxwOJ5EpLK5Y=;
 b=XAGAxrGxruEelaGeNMTXRfThzfz4t47ClCkTrNQldlhicaFCnXBqtkIUNsztGj0A2p7nR17vxuSU5SVgx1XFghZekCvS69toTq7S4ER/0H4jT7uiqjXoOoGTQME9s4isLhyN/TXbMi4at7Z5gB7AhrBwP7+xPJRfgDBdY/qis9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5)
 by AMBPR04MB11785.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 20:45:11 +0000
Received: from AM8PR04MB7249.eurprd04.prod.outlook.com
 ([fe80::d3b3:b4e7:6b28:d052]) by AM8PR04MB7249.eurprd04.prod.outlook.com
 ([fe80::d3b3:b4e7:6b28:d052%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 20:45:11 +0000
Message-ID: <4becb671-1d2f-438d-ba69-64372f7ef010@sch.bme.hu>
Date: Thu, 19 Feb 2026 21:44:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] hwmon: (ina2xx) Make it easier to add more devices
To: Guenter Roeck <linux@roeck-us.net>, Ian Ray <ian.ray@gehealthcare.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Toma=C5=BE_Zaman?= <tomaz@mono.si>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 devicetree@vger.kernel.org
References: <20260219130127.87901-1-ian.ray@gehealthcare.com>
 <20260219130127.87901-3-ian.ray@gehealthcare.com>
 <d18824f8-6b54-4732-95f4-24f70eb02e37@roeck-us.net>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
In-Reply-To: <d18824f8-6b54-4732-95f4-24f70eb02e37@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To AM8PR04MB7249.eurprd04.prod.outlook.com
 (2603:10a6:20b:1d0::5)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7249:EE_|AMBPR04MB11785:EE_
X-MS-Office365-Filtering-Correlation-Id: eb01cf9e-0bd8-4497-5168-08de6ff7c689
X-LD-Processed: 79f0ae63-ef51-49f5-9f51-78a3346e1507,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|19092799006|376014|7416014|41320700013|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3QzSXdFbTJBZUtPUmI4cWE4WHFkclROOWVVYk5xeWROREpBSDJzM1dDNVlj?=
 =?utf-8?B?ZExvZy95KzFIRmc3bDVOU1pEelJ5bHA1UlU3MUd5ZkE2U1l6cXczTlF0LzJN?=
 =?utf-8?B?N2c4N01rbUtUdTlia1BQREhSVXFUZE5mWXg3UmI1Y2Y5OHdRbFhkN0xxVDA3?=
 =?utf-8?B?czJZQlY5M3JUamlxelFkQjR5VXBrNUp3VkVNbFZBRkxOTUptT2ZqZStwMGY4?=
 =?utf-8?B?aklUYnVsaXhtL1lwWTdTM2h2SXBMWVE1bDdDUjRXR2hKTnlLZ3hBS0VHT1dT?=
 =?utf-8?B?UnlzSVpXbXIzOEV4VlpuVzk2dWc4MzZ6dUYwZmdXdGRmZkpBTGExaytMRWhR?=
 =?utf-8?B?UDAyV3Y0dHRMZDNDYk1qd0lUam4yVHV1d0VZb1BTaCthQitFM3UvZFJvbmVK?=
 =?utf-8?B?YThwTVRTWlEwNXVtQjQreThUbUhpL0wwOHB5OXdTQnp2OXYzRXpPTlp4dXlN?=
 =?utf-8?B?QUNoa1AycHBDa3B5Vk9HSGh2VW50Y1F3NmhyMDRDVVNyQnJHS1VLTEx2WGU4?=
 =?utf-8?B?eUlVd2U3ampmUWpoc2o2SGdjOERVckpRbGQ2UlhlTVhEalJNN0QyZXVqbG13?=
 =?utf-8?B?Y0Q2Nm5OYkxwNkJROCtsOEFzR1ZBaGRNVCtwQy8remViLy8xSHBxbmt0NHhW?=
 =?utf-8?B?VnRGbUtWRThndyt5UzZNcnF3NkIzNTVudGswM3gvdkVpc3BuUHFIbnJMamx6?=
 =?utf-8?B?MTc4TG01VEcxZUJWTnUvcWF0M1BoV3EvUndZQjRsbUJoOFdUcTI3MkFmdTQ0?=
 =?utf-8?B?KzA5TExldW5uK1JvNEh4SU13UDVRdlpsTVdYTkVYbGdZS2JUTmptS3U5WGIv?=
 =?utf-8?B?Y1JOVGZIajFELzIvd1BrT0VnQ0FWVW95c1JNM1E5ckZ4MXBNaCsra1JSanRw?=
 =?utf-8?B?dng0dU5vQ3JxYm1WRzFWWTZiMmdzOUpRRGFySkdCeUhoVlJjSStjckdwZ0Ny?=
 =?utf-8?B?OExzM3kzV3dtTkdZZ0pENHZNbUhpSldaVmNRSHNYZG85aEdlOTBKdVZkbnMx?=
 =?utf-8?B?MjV0Tk82M1E0YjZ6WE1HbkNCMElNdXU4bzJLc0d4UEFjR0kxUTVyV2tmWHI3?=
 =?utf-8?B?QjUxYVFDc2U5L0ZUMy9oZTZ2eE1vZGlsTlBYeWhlSld2dWg5TFlBT3RjeXBY?=
 =?utf-8?B?Ny9KaFJlMkFKZnNJT0FrYkhYKzZwSGFhN3g4a2VmZmpWOWlHd2VzbGorcWZh?=
 =?utf-8?B?M1d5Tk83SjFaYU5ON2NEWUt3blVKcnFDNzhhY0w1U0hxdWdKek9WMHRhQWxV?=
 =?utf-8?B?Y21kRVpTbFFiRjAyQVZLQVllNVJsaGk1UVlJTjZUYU82SStobVBlbE5YSEg3?=
 =?utf-8?B?eFF2emV0WHhQdVlhaGQzNXl2QnpPelVmM0x6UUhrSjZOUk9INGpPSDU1TlQ1?=
 =?utf-8?B?TTd5OFFBSkNzVkxHSno0YlM4ejNPajJPUldremo3UUFvcjhZZWF4cHdhRzVq?=
 =?utf-8?B?WGxHaDY4Q01oeGN1MDlpYTliQjQwTUZ6Mnd2am5lbDF2b1o5NUxhSU5aS0N1?=
 =?utf-8?B?Tk1PcWxJZDRaMmZ5Njl1bitNWlN0dEdEUnNqS0pSSlpUVFQraGdQTXRhSVd4?=
 =?utf-8?B?ZDN1N3NEMndzM3Z4K0FROUlLU3Z1aFhaS1NudStJYy91bTdWOTJSVy80KzhH?=
 =?utf-8?B?a0YvREtvNm9meWk5cjVBUFUrMitpRWxvNmlSWU9MUFN3ZmwrNzg0OHVNYWpi?=
 =?utf-8?B?MUZieFB1MFFmcGhyZUhMRWxZSTl1SDN5VW9CY2p4L3pBTUZkV3J0cDU1M1B4?=
 =?utf-8?B?OTBBR0padVBQbFl5VVgwYzJJNklWdmk2eThQdUVwN011aVBkOTd5T1pMUzhT?=
 =?utf-8?B?UWVpY3kyM2h1YjN0Z3VRMy9oVDFSanoyL0ordVFTTlF1L09wY0hvQ3JGV3ZV?=
 =?utf-8?B?ZHk2SnA2SkdydTN2NVdpczNJbDNpZmxYL29JU0U0UGxLQk9lT3BNejdKdWhv?=
 =?utf-8?B?aGkyUlIvdCsyc2p2dDBNVktsQmVDQkR0TnlGN1lkNmpoaVgrV3pYT2gzWXpW?=
 =?utf-8?B?M0Z3VjNUdGJSQU5wcEtGVURJOTJMbUJSWE9hTzhpRmdzaHJxRnVQVTJBK1Zq?=
 =?utf-8?B?TGZUaENSMm9RL3I5bHB6RXFTL0hSenpKUjVhN1dWQTVlRWNtcU5qc0loZlJk?=
 =?utf-8?Q?t4fM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7249.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(786006)(19092799006)(376014)(7416014)(41320700013)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWIvcmZ3WG0zUVo3VVAybWx1UGFaNVY0Z1VSOFQ4OFU4TUY1TUJySk1CcTV0?=
 =?utf-8?B?emVYWHlkcVJGcm5CNEcrd3NVeDlLMDU5bVQrd1FrZXVNYXRWakNPd1NzNXp3?=
 =?utf-8?B?N0wwdi8weTdtaHVoR2l3Rjh3VzB0b2FFOWd5RDFJdlJrSmRHL0daUnIvMDZx?=
 =?utf-8?B?ZldhZHBhNGY5ek01VXRiZ3N3T1RSNklyUFZrdm9NNi9HZXVZTnlnODJKdEJF?=
 =?utf-8?B?cEFlY2ZpUlhOUWlaNStBalF1ODdhVWRJMkxsWWR4Nk4vZ1BqcVp6Tmd6VHAz?=
 =?utf-8?B?bHY5Y2NyaFRIZERpVVZXbzFySUNqZ3NidUpoOS9Jb2ZHS0lyeTJZK2EyNWZF?=
 =?utf-8?B?a3JvUUZtUDVOMVNxVFVLU3pvd3paNE1qQ3FJSWJIMDhSZWhxeDJITmxHTmZ0?=
 =?utf-8?B?anJJa2xHWkpGRWI0UWR6UmFycUlsMis2NTAzRlhsTVlzOHlZSExSU3VYVnpR?=
 =?utf-8?B?NzRvM2g2ekthMnBJU3h3WURpTXVGNi9SOUc0T3hjeWFxMWF6Nkh2bFRrbTNt?=
 =?utf-8?B?Q0FsUkdpK1c0WjE1RVE3bU9vSSt6cTVhSm1oZENITGNYbXBpa3hieE94d2gw?=
 =?utf-8?B?WXlRTmw2OHEzQ3hlcU5MbGN6Mzh3RVo3aUpxemIvREt2UVZheGdvb0NUMVlI?=
 =?utf-8?B?dUV5TGVFMlNlTUgzSWRobjZaUStwVGJEQjFkckZ4OTE1Mll4eHcvQVYxK3BL?=
 =?utf-8?B?WWx0czNtUmVEWHNFbzl2M1Z2QXo4ZTZ5MG5LNEY2RFA2QXhIZ3ZjNStxNzVJ?=
 =?utf-8?B?KytEZ1ByejRkY2ZIcXJMOFlhelA3S0NyVEhRL3FYZzIvZkVoSk9tb3o3Y0F4?=
 =?utf-8?B?anFjOW5BTkdkNGhLY1ErU0NERnJJTzQwTmMwZG0wL2JtUXlSeXAxN1R2MmRL?=
 =?utf-8?B?SFRPRE9rdithQk1UdUNhU3E4b0lDVGF1TlNYSjNsOWc2NlFOYzNpWG9kZHk3?=
 =?utf-8?B?WVRPUnBDb3NNblNobHhkMUVXNk0rSktUR2RJeTJwRGN3SEJmeGkzL3FlRS9r?=
 =?utf-8?B?Wk1vR1RuZ0xNOTc0MVhleFlYMzc4RXJ3ZUY5eDk2THdIZ1hWRjRwcWlNMGRU?=
 =?utf-8?B?N2dUSGxNWEtJZW9hYi93QVlsK0NkbnQrUnJuOTJzangwTzluaTB6MDBobE45?=
 =?utf-8?B?bmdQMXpMQkZoSEpDaUREKzUyOUsrRDlzbnRBL3dIRERxM21TTzBibDZRbVRx?=
 =?utf-8?B?NkdocEMyWFYyQ3RPTktkVjY2bzZ2TCt6UU5HZ1dLd1ZyMGlGTnpBOWprdTV4?=
 =?utf-8?B?dURFYVZwUGhCSFFHRkpjYkFzQ1d4QkVkWmZFNms4TUdLOTFtZVNxaGZqYi9Y?=
 =?utf-8?B?UnpxUGlmNWp0c1lVa24xK2YweGFyYWdVMFVEMzQvc0lTaC9WR3hYWjI4aGQw?=
 =?utf-8?B?TnFHczZXdkNVVXZXWlFaMmFmcDJLSFZEOG1PZ0pDb1Nmb1NwbmNxbTZLQWFE?=
 =?utf-8?B?Y08zbFVsajVzOTZXdmJsanZQeDdGU3U5L2tNVVdldGovLzJPVjdMZGI3MGNE?=
 =?utf-8?B?NGZWTDFvdUptWHFPUnRTK2NSeGd0aU5nNEhGZEhHL3ZydUJIbnZmMGp0MUha?=
 =?utf-8?B?Kys1M0VFOVNzSnEwZlY0T3dhdFRYU0V6NmMvL1BUMGlsMVRLTkd4VUlHQXcv?=
 =?utf-8?B?ZGxydzRpdjB2SnhJNHFWZnVPcElnOFZ5Tm56M3dneS9rVXlhT3VzUkpzTnY2?=
 =?utf-8?B?akxvQ3pEL29Xc1JXLzVrRXhMT1lkYTQ4UzZjREpsdEtKWXFQVXZKbEFEcGJk?=
 =?utf-8?B?a3Fhb3dkd0tsbk56RitUTjg1dHozeEdSWkFVY3dmNVRUQllDYmlhQlh3UnNU?=
 =?utf-8?B?d1JKS3RRZGhDcU1zUGRCQUtBSlFxeEpIazgyMnhLbE5lM1dCQllyK3k4Wko4?=
 =?utf-8?B?dXdBODlVUDdDL0wxUlZDRGg4ZzlXbVAxcGtmUEZlVlN1b3BZeUxNNTR3RXI4?=
 =?utf-8?B?U0VKMFN4eFdKVSt5aXFBMnhmN0V1TVlFNWpNSTZ3QmpFSGxiTGkyWnlOOGpH?=
 =?utf-8?B?YnE1YWtENEJiQUtSeU1rWXhpQlFoYjNXeEY4UGZlMmlFT1YxT1Q4SEc1UzNH?=
 =?utf-8?B?R3RGQ0FVTmU5cThKZEp3MWttRkJGRS9GUGNNcm5OQzQ0Wm5seHFHL2pqV3pv?=
 =?utf-8?B?NUNoVnZBS0JHOGtXdHpLZ1NxMlFHQ01HMGhtR3A5eEtFZFpUeHdQdEdMUzAr?=
 =?utf-8?B?aFY5QmtaMWFxZVNMSUtjeEtlcHdFRHNEc3NYUGdTUFFYVEV3OHRvK0tSN0Mx?=
 =?utf-8?B?bEdoMUJKU05lM1Vocm5NZitlMGRiL2Q1U1ZHKzJnU2FranNIOE44TzZKc3dn?=
 =?utf-8?B?UDFlMnJ2cm9MemVjdDI0ZlBBNUZHUVRDKzRJcFJDdHFVNnlNR2l2Q1A0WUJG?=
 =?utf-8?Q?YJtOPyQFJrvur2D77Rb9rup471snC+wLcqDKjC5oB9NyC?=
X-MS-Exchange-AntiSpam-MessageData-1: dBAvzBDdP2Cnyg==
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: eb01cf9e-0bd8-4497-5168-08de6ff7c689
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7249.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:45:11.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpHaXr3Wx//eI4NmSznXs4xA/rdXtuL5yKRBrb9Gcuy1ESyIRKhYjrOkaynY3LLVV2XUvFhbuYmm0KmkgFqWpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11785

Hi,

On 2/19/26 16:59, Guenter Roeck wrote:
> On 2/19/26 05:01, Ian Ray wrote:
>> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
>> index 69ac0468dee4..4bf609e25f8a 100644
>> --- a/drivers/hwmon/ina2xx.c
>> +++ b/drivers/hwmon/ina2xx.c
>> @@ -46,9 +46,11 @@
>>   #define INA2XX_CURRENT            0x04 /* readonly */
>>   #define INA2XX_CALIBRATION        0x05
>> -/* INA226 register definitions */
>> +/* INA2xx register definitions */
> 
> There was a reason for this. INA219 does not support those registers
> or, more generically, they are only supported on chips supporting
> alert limits.
> 
>>   #define INA226_MASK_ENABLE        0x06
>>   #define INA226_ALERT_LIMIT        0x07
>> +
>> +/* INA226 register definitions */
>>   #define INA226_DIE_ID            0xFF
> 
> That isn't even used, and the comment is wrong (at least INA230 and INA260
> also support it). Might as well drop it.
> 
> Either case, is that bike shedding really necessary ? The only really 
> valuable
> change in this patch is the introduction of has_update_interval. Please 
> keep that
> and drop the rest.
> 
> Thanks,
> Guenter

I agree _this one_ hunk could be dropped. For the rest:

Reviewed-by: Bence Csókás <bence98@sch.bme.hu>

Bence
