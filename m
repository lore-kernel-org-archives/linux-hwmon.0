Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023076.outbound.protection.outlook.com [40.107.162.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F51B042E;
	Wed, 18 Feb 2026 22:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771453764; cv=fail; b=aheW4GQJKt0XYPqvm0pqJvPo7fj4CQtwMYvJ6q+WLIWx1wN3lMNjuMax5LVS0whFsRzZikSTbBRCogac7T/tMYCFEaE7RviKZvvv90evokiwANfn5g2ckz2Y4l0WV06vExvxUuPLIjlFoePIaAbuNbKiGG0m2gdwkrnlSyBSnnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771453764; c=relaxed/simple;
	bh=erDWg/ROnOyse4jq4Yey+Ycm4/NRhjvsCKCTBJNVQNo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OUpxZJDdB4MhttCwofn8bQiw7PiG7B801WfAngNRS9JTGXAFgPRAU9kG237h93drj5cIxNlxWZi3za/z6AFRIlprFNdmHXtULrU4/w/6wsjqk5FHFUVXYOy/C9sNmluBB16tf0O5Z00AEMlSMSrFIjMQdFFNmGC65QKo9ZmIIW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=pnebdEkJ; arc=fail smtp.client-ip=40.107.162.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="pnebdEkJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otmL8COvbK6VBLrdBQaC6C1EORtRSaIFFSSlSU3LbEGN6dlbW2MJOxPvV4byTIY6J+eyFmWeR2dZxZ4kqbVJaKsu3ThSRsZ3/XafzNSm6jXaBmzwbHfLeTWhg1YCUKhhujpPA8ryWSBUPrJnVqhKqM9nI98FZQ7fva0PRoLBnEqQDFkuCdXSsDS0K4sgQwnWpzVokYPEQnEdWuCW28Jk0YecRhK4R8q63Gk5T7jpiavJ7DX+Cpo/sb08Ftger6F4ltoK2RnzttlYuocvJTL6fThpTCdco4TLhukelwAiqHmgbhFemezK2vFJQ4ThzPi0d/turXiLNDMdK59vOLSGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIlghaJqkS2Hv1RIHvP1epgwlaABSZSemZtgZr3rgOY=;
 b=qjYz9HPi3xNj1j/xbkfmNtZDv2kEkVNqHfWA1yqdyvTL2oTRgBQYcGY6eiJf57bSyfJsu816xf4uIUiZ5pgjhlknTWnLF/3JT/FNDVHDBJYJGiBHPOjxTxA4VO1H9RUK+DaPB0RApBUiuMjxp7eBXKQT9ANwnIyxPYUUYqAKdvkVdnBYv7lHmcPg2G0Unve5PbuZelr31u2FWzjtvjSvusByTx9/d9HPVz69a3eQui0rDHslWy/PXdZI3XJ6kdOo1Hhskd8wx2d5xsIR3J9Co8m/DhKEIS5Juw80rckgGicYoQaEcwUOP23HuC4BZ+EM5eEOcfKk7PrXqvKg/WpE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIlghaJqkS2Hv1RIHvP1epgwlaABSZSemZtgZr3rgOY=;
 b=pnebdEkJlV8DnSSuCKry+BVFpyM5PuYvcI2stFg6RWEYUty3FHdp9aQvyM6eTdqzjjFpovSq9tmDJyiy8aQbvKi6++ufBw/HyufhagH7IjLfVKAANULuVsxLZOTt6o7l9nX6dz2b88G8VdaI20Q3ppJw9XmV4WFgl+i62NHLuGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com (2603:10a6:102:8c::15)
 by AMDPR04MB11556.eurprd04.prod.outlook.com (2603:10a6:20b:71f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 22:29:15 +0000
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8]) by PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8%3]) with mapi id 15.20.9587.013; Wed, 18 Feb 2026
 22:29:14 +0000
Message-ID: <8ab8622a-5920-4561-bef2-ef1de3108685@sch.bme.hu>
Date: Wed, 18 Feb 2026 23:28:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (ina2xx) Add support for INA234
To: Ian Ray <ian.ray@gehealthcare.com>, Tomaz Zaman <tomaz@mono.si>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260217092325.15867-1-ian.ray@gehealthcare.com>
 <20260217092325.15867-2-ian.ray@gehealthcare.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
In-Reply-To: <20260217092325.15867-2-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::18) To PR3PR04MB7260.eurprd04.prod.outlook.com
 (2603:10a6:102:8c::15)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7260:EE_|AMDPR04MB11556:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a04bd96-bc87-4b7a-554b-08de6f3d2541
X-LD-Processed: 79f0ae63-ef51-49f5-9f51-78a3346e1507,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|786006|10070799003|41320700013|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejRjUnI2ZUVPSnVDQ3VXOFhwa0dsOW5sZjlEOWtqY3Jub0FlK0xNOFVEejZp?=
 =?utf-8?B?RVk0OE5ybVk3Q3A5eEtQYUFPajM3d01FU3lDZEZlSGV1djBObHVScTVCYWtw?=
 =?utf-8?B?WXE3UmkvK1J4WEF6MVltZnZZVGtRM1VLc055Q3k5RGE2a05QNytvSGRtcER0?=
 =?utf-8?B?dERMQUR2aDdGN2NoYXpvdmNWbCtvQzNvNUFWTEcvVkFGZW5YUmFObGVaeHVi?=
 =?utf-8?B?YjU2Tkh3SEg1Vm9oNkZZYXdnc1BHdW9CdDZ4QnA1MWdvK0hHUEY0UUI1bE5m?=
 =?utf-8?B?RHRIM0V0SUNhWmwzZFpYRFBid2FrNkpFb0pnZE91SXdKSldBZVNxdG13VGRI?=
 =?utf-8?B?M2Vua3pSRkVYTFpEWkVUUUZCYlZ1SHUxT0QvUEloUmFGMXF6Y1ZKOUN5akFn?=
 =?utf-8?B?bVNNT1lMUHhCZFo3bkdwTWZGYW83WWZHM3lpRStUZ3Zmdmw2cENyTGVhNkZj?=
 =?utf-8?B?bnZTUE1Bb1Y4WWJwUVBtU1R5R0ZaYkNYMmFLd1NndUZNUVNXbnBaUGJUMENy?=
 =?utf-8?B?KzdHU3Y0WWdRc1NBMGRyZW1tS3pVUTFaYy9vQ0ZldGo3WFpKT1lXekxPQm1P?=
 =?utf-8?B?N2Z4WWtMMzFhR3N3bFNxWEE1QnhodmdVdyt0ckpmOTdkSlNjWVZyTjk5d0pF?=
 =?utf-8?B?bXpxTmZEVzBqSmgzMWxjZ0J1K29ndDg4SUNiVDZ6ZGo5UW1ua0xTSmRaZzJM?=
 =?utf-8?B?bUZRb2I2bDZGV2d4SmZ6YjdEODE1TWhHWU5ZQ01iUHJHRkxndlI3bmtqa3Z2?=
 =?utf-8?B?Y1I0NUh1Sk1MTXM5WUJTM0lEWFJwZ0c5blBITXRhbk0rT0c5My9xdEFrc1Ba?=
 =?utf-8?B?ZzN3YmpaR0VieUQyaktOMXNYY2lEZllVQWdXa1o2TU5tdWpzS3NJZkNjL0Fj?=
 =?utf-8?B?djJmNnZPRHBDajVHSXRSRGtKQm5LenZoOEdGZ25sQ2kvbVFySzZhMCtaYy95?=
 =?utf-8?B?K0V0eEVic1pQNlFGRDJVQ1NmT3Y2TjFEV0t5eklxTDlxU2kwYTlUcG56VFRI?=
 =?utf-8?B?Q2pvKzBNMHB3VnFsTC9EWmowb01UU20rQkovZU50dkdUSzVvR2c1dGxXMlJV?=
 =?utf-8?B?T2JKaFMyWkdHcDV6d2g3eXo2MUttUHA0bHA0QXNabjJJOGliU3I3OHdjK3Vv?=
 =?utf-8?B?WWJkcnl2Y3gvU3dUTkZZeGVtQnRic2JXTk80RFpVOXBlN3kyVnhLcTJPNkxM?=
 =?utf-8?B?ZzErOFdzLzRWTmJmaEg4ZHd5Y09yNDFKUWg4cEhsNDZjVy9sc2RYQjBoRmRk?=
 =?utf-8?B?cFQ1a2V2djVyaDZhTVZaaTdQUGhIYmt0YnFOTlg4Q1lFZ00vUHpxREg3b0Fr?=
 =?utf-8?B?Y1EvMzNzWENVWU9BbnhqaWFqd0JUcnBBNlp4MzBTajFnOWQ0L1NjOUJJY2VE?=
 =?utf-8?B?WkxzejZ4MnJYOWt4Y1VlN2doM0NRUVVQdkd0aXJlQmNFV0dRL1d5Wlc0Sm0w?=
 =?utf-8?B?cFQraW4rQnpxZjczQWZvbjhST3FyMVoyTjA2K1hEcm9iaUptV21jOHM4Wnp1?=
 =?utf-8?B?VVBUbzlwbEVCc0hoVGtCM1hVYnBaQjFZYktnem9GVVQ4bE85YVhRbkZPSmJC?=
 =?utf-8?B?NmFlOEpTSlN4L0UvRnYxWmpUNCtsVFBYZS9ibVNPUmRwbEU5V2tJQ2JPS0ky?=
 =?utf-8?B?aTcxOGFENThLTDZINzhaRkU5aklBZlJIeEMvRkRVMU5BVlc2Y2lHV0dTZFQw?=
 =?utf-8?B?R2VMN2pTZVNNMXpUbFlnb1BjamUzSk94SVVFRlN2MnRwSnZNRzNBOTIvVXJB?=
 =?utf-8?B?WUQwKzdvMkoxSnpielY1SG1rQnB1L25raWd6R0Z5Tm1jQWJ2RzVvcnBxZ1Y2?=
 =?utf-8?B?NGI0b01jYU4vVjdhYjJKZjdjcHpiZURqYTRibWdFSzhBSDE4cDQwK2k5M2NK?=
 =?utf-8?B?bG5sWVB6Z1k4U2lZamYvajVQc3BJWk5QaWtkTzJORklmNDZjV3ZYdFpxR1Q0?=
 =?utf-8?B?cDNsMmxuZW9DRjRBL1hlSWh3YVlTdFZkc25HV1MweGl0SFRrdERrTE5mVFFU?=
 =?utf-8?Q?Bi5RMI499aEW9cLxlZ4XOGw1CKtI5Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7260.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(786006)(10070799003)(41320700013)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTVZMWsxNXBCNTBJRUVHQVczdDA2dGpGNksyUlhkMHprT0hGOHprbGp1T2k3?=
 =?utf-8?B?WHZ2bk1DYjJzUmRxbnhQU29PSG9od0pJMHliNlhVZ3ViZnlPeis5cmdIMXJa?=
 =?utf-8?B?Z1pmRXFZSzhBdTNEeXpLbXpocHMzaUVZa3RnN0FUVXgrVXRUbUhyOHh6aUc4?=
 =?utf-8?B?SnFsdkhOMG1QTnFST3pHamxScE85Y2xUR0lNeTJmTVl0Rms1VVFGS0pXNi9N?=
 =?utf-8?B?QUR5UHhsOFNLYUt4R1ZSTVk0cFgvWWI0TnlKTHBPN2U4VzYxZElYT2l4Q2ZE?=
 =?utf-8?B?T3VCUTRJcVQ2ZmFFL3VmWm1CVE80SjNEWHdDS21LTlBQQituL29Pd2VjU09E?=
 =?utf-8?B?UzhkNWYxOUswREg1ZzJHRjFveng5My9MQ1h5cUhuOHM4L1A0ZFFMcjRjbjc4?=
 =?utf-8?B?Lzd5TUNkRldEeG81NmtZaENCZWI0emFLdWdCOFlFbzN0cEFlWTJOWGhvSEsz?=
 =?utf-8?B?THVNZndmdGJIN2RSMEhsL0pYTlMvMkpPaGJ5SW9oMzZsQ2lqSi96ODJmZ2lP?=
 =?utf-8?B?MjZqR09ycmREdkN4TWppUEpIeE1zVVkramo4UmhxQnZpL3k0U05aYVFaL1JB?=
 =?utf-8?B?cWZ5WXNCME5Zb2N0dHBTYlE3VjdabTJmZldPTkR3L3hJcHFLYmxwblczdlds?=
 =?utf-8?B?WGVTRzF3bzBZa2hMbTdmZmk5RzdyWUxVYXd5SXNOZDNGTHFGdGVibFozcEpy?=
 =?utf-8?B?SmNYYkpFSkJnekVxZ1NoSjhLYnlPdFNtM2NOWVhFa05MY2JMRksza3I2djlU?=
 =?utf-8?B?bkZjZDZzUi9MUW5maGlQUHh4QTRqMzQzTmJYNmdJcGk3VzlJMlhwQjE1MlZj?=
 =?utf-8?B?K1NiNW93WlpmN004TkF6eVhTWmV3emdiQTJOUUlIWDZjYW95cEJDOElFMzZC?=
 =?utf-8?B?NXdDb2Y5TWcxREtrNTdVSmZqdHR6MkQwM3dQWW5JbWY3ZTZmWVN4UnZCdStK?=
 =?utf-8?B?cTAxYTZ5MlNHc2k1elFHKzY4ZndUY1pJd2I5U3lwbjBIRjdzWktrMkd4T2hq?=
 =?utf-8?B?aWVqc3lxMmo2Z2FQM2svdGNlcU9tU3Ntb0tXVC9WVzd6bEZFNlE2RXRnR2RD?=
 =?utf-8?B?bnJ3Z3ltYXUvY00zMHI5U3ZTa2lncDhET25rR3kzMTc1eExLbGhBMWp6MG5t?=
 =?utf-8?B?bTFGbHc5ZUR4UFdLVFdLcGdQd0kxaUdCUW5WOTBRMjlpd2lFd3RzQW9tOVUx?=
 =?utf-8?B?YzFUVnFYUndPMm15dzh2bUx5SkRNbWI1MEJ3L1FRMjd0VnA4cm9kRmNXWElQ?=
 =?utf-8?B?M3EzK0p6M1FIQ25IOFphaTcyQzZLcnJKKzlWTXhUeEF1QVoxOE8wdFNmNjQr?=
 =?utf-8?B?UkdvQndtK0VoTWNKTFNURklJSmRydXk1czFXbWhQSjlXMkFKMEs1TUsxNllp?=
 =?utf-8?B?SCswYkZEenB4dk1HSnJ2OXVycGIrU3B1S1BHWThnVk81RGFHNEtnT2gwMXM5?=
 =?utf-8?B?M3l1YUhtMHBMNiswYUF3YVhEQkJrUFJvdS9MbjVQZ0lZZ0NxRlNKeE1jOHg0?=
 =?utf-8?B?QmhNMmE1ajFnSjJ6Y0RWWFYyKzRQOU8vUTBQNlNKS2src1p4UWhWWG5nTjA4?=
 =?utf-8?B?WGJWVDczSmNUNElBdDI3UVQ3WmJpM2E0SThVbjdUc0V3aEE0Sk0ySWF5ZzVY?=
 =?utf-8?B?NXVueHdGci95RGtRRm01MVRsaFVOTE9kUVBjRllvL3JKMG5qQThoT0hGc0pF?=
 =?utf-8?B?Y2dHNnlIenliRmNGVDF0bXBibTBCV0I5dEpXVVRLcGJCTzkvNFlzakZ1Y1Zo?=
 =?utf-8?B?ZlJNTXR3WHZnb21aS1JPQkFQbmg5VHpERnJwVGtjSlVoYWJVUExQb0llNnQr?=
 =?utf-8?B?VWZidkQydWQ5NE1pNkJ2a2dteG5BUG5qc0FDYUxQOEJ5VEdpUk4vQzlCcHdz?=
 =?utf-8?B?QTlrK0pOL2FxVFV1V3R1ZkJteG4xY3J2a2ZaWEk0ZTlkNDVVWmZmY296SGUr?=
 =?utf-8?B?cFJYeXE0eUh4N0xtRGd6MGhyZnY3WkFyc0lZQXUvUUp1NHFsdzFXdDVKUlZx?=
 =?utf-8?B?Y2hMQUpqUHRFSjE1TnRzS1dFSVRCU3loUkJZblZQWG9LZ2F3ejVad1FFNm4x?=
 =?utf-8?B?QkM5TlpQUWNEc1dzOEs4a0ZXYnhPTjc3RDhZSXBreWZLT1YwUEN0TE5maUVx?=
 =?utf-8?B?YWtFQzZvREVIelVoQVA3STNHQTM4YVc0aDhMem81YlFucFlhK0NvSTArS1Qr?=
 =?utf-8?B?Z01xSEl5L05QNC9rTjcvWUVOTlFJSnBuVUlreUJtWGFOUFFNYTNCWXZ5K2Np?=
 =?utf-8?B?QWo3OHp3TkRRK3kyS2t5RzVIMkRFRkdWeWlhMVhWandjTGFsRXROUnBwMWJI?=
 =?utf-8?B?MnphQlFwTDdIcGd1S1V6NURwU2xsYW9uK3BXNDJrNFVZa3NNcm1JeDZRRVh5?=
 =?utf-8?Q?rsw6D4+APyRfglkTC8JTBL1mEGAQvKsbZSXg3FRA4Z/EY?=
X-MS-Exchange-AntiSpam-MessageData-1: DfSFSciVwooynA==
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a04bd96-bc87-4b7a-554b-08de6f3d2541
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7260.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 22:29:14.3080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gc4Jfe7UWZc0aUcZInc9dq5vvM33P889usZfS0iw9OpIqoLmqaRits5pZWsLKm1RS2fA9eITJOJlp24KDAyaXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11556

Hi Ian,

thanks for this patch!

CC'ing Tomaz who has a downstream patch for this part as well.

On 2/17/26 10:23, Ian Ray wrote:
> INA234 is register compatible to INA226 (excepting manufacturer and die
> or device id registers) but has different scaling.
> 
> While the manufacturer and die/device id registers are different, these
> are currently unused.  Comment INA226_DIE_ID to aid future maintenance.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>   Documentation/hwmon/ina2xx.rst | 14 ++++++++++++--
>   drivers/hwmon/Kconfig          |  2 +-
>   drivers/hwmon/ina2xx.c         | 21 +++++++++++++++++++--
>   3 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
> index a3860aae444c..4c05bd5e24fb 100644
> --- a/Documentation/hwmon/ina2xx.rst
> +++ b/Documentation/hwmon/ina2xx.rst
> @@ -74,6 +74,16 @@ Supported chips:
>   	       https://us1.silergy.com/
>   
>   
> +  * Texas Instruments INA234
> +
> +    Prefix: 'ina234'
> +
> +    Addresses: I2C 0x40 - 0x43
> +
> +    Datasheet: Publicly available at the Texas Instruments website
> +
> +	       https://www.ti.com/
> +
>   Author: Lothar Felten <lothar.felten@gmail.com>
>   
>   Description
> @@ -89,7 +99,7 @@ interface. The INA220 monitors both shunt drop and supply voltage.
>   The INA226 is a current shunt and power monitor with an I2C interface.
>   The INA226 monitors both a shunt voltage drop and bus supply voltage.
>   
> -INA230 and INA231 are high or low side current shunt and power monitors
> +INA230, INA231, and INA234 are high or low side current shunt and power monitors
>   with an I2C interface. The chips monitor both a shunt voltage drop and
>   bus supply voltage.
>   
> @@ -124,7 +134,7 @@ power1_input		Power(uW) measurement channel
>   shunt_resistor		Shunt resistance(uOhm) channel (not for ina260)
>   ======================= ===============================================
>   
> -Additional sysfs entries for ina226, ina230, ina231, ina260, and sy24655
> +Additional sysfs entries for ina226, ina230, ina231, ina234, ina260, and sy24655
>   ------------------------------------------------------------------------

As buildbot already complained: you need to match the dashes' length to 
the text. Besides, I'm not sure that listing everything here is the best 
approach. I would change it to something like

	Additional sysfs entries for some supported parts

And then maybe list those parts in a bullet list or something. That way, 
we only need to add lines going forward.

>   
>   ======================= ====================================================
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 41c381764c2b..6aa8a89f4747 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2284,7 +2284,7 @@ config SENSORS_INA2XX
>   	select REGMAP_I2C
>   	help
>   	  If you say yes here you get support for INA219, INA220, INA226,
> -	  INA230, INA231, INA260, and SY24655 power monitor chips.
> +	  INA230, INA231, INA234, INA260, and SY24655 power monitor chips.
>   
>   	  The INA2xx driver is configured for the default configuration of
>   	  the part as described in the datasheet.
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 69ac0468dee4..923f8c953e8f 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -49,6 +49,8 @@
>   /* INA226 register definitions */
>   #define INA226_MASK_ENABLE		0x06
>   #define INA226_ALERT_LIMIT		0x07
> +
> +/* INA226-specific register definitions */

Isn't this comment redundant? Almost the same comment is already there 3 
lines above.

>   #define INA226_DIE_ID			0xFF
>   
>   /* SY24655 register definitions */
> @@ -59,6 +61,7 @@
>   /* settings - depend on use case */
>   #define INA219_CONFIG_DEFAULT		0x399F	/* PGA=8 */
>   #define INA226_CONFIG_DEFAULT		0x4527	/* averages=16 */
> +#define INA234_CONFIG_DEFAULT		0x4527	/* averages=16 */

Do we need a new macro? Wouldn't it make sense to just use 
`INA226_CONFIG_DEFAULT`?

>   #define INA260_CONFIG_DEFAULT		0x6527	/* averages=16 */
>   #define SY24655_CONFIG_DEFAULT		0x4527	/* averages=16 */
>   
> @@ -135,7 +138,7 @@ static const struct regmap_config ina2xx_regmap_config = {
>   	.writeable_reg = ina2xx_writeable_reg,
>   };
>   
> -enum ina2xx_ids { ina219, ina226, ina260, sy24655 };
> +enum ina2xx_ids { ina219, ina226, ina234, ina260, sy24655 };

Maybe it is time to break this into a multi-line enum?

>   
>   struct ina2xx_config {
>   	u16 config_default;
> @@ -204,6 +207,15 @@ static const struct ina2xx_config ina2xx_config[] = {
>   		.has_ishunt = false,
>   		.has_power_average = true,
>   	},
> +	[ina234] = {
> +		.config_default = INA234_CONFIG_DEFAULT,
> +		.calibration_value = 2048,
> +		.shunt_div = 400, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
> +		.bus_voltage_shift = 4,
> +		.bus_voltage_lsb = 25600,
> +		.power_lsb_factor = 32,

How did you derive this? According to "7.1.2 Current and Power 
Calculations" [1] in the datasheet, `POWER_LSB = 2 * CURRENT_LSB`, so 
I'd think this should be `= 2`, although I'll say I'm not familiar with 
the IC itself. Tomaz, I do believe you had `25` here, was that just a 
placeholder?

[1] 
https://www.ti.com/lit/ds/symlink/ina234.pdf#%5B%7B%22num%22%3A421%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2Cnull%2C316.653%2Cnull%5D

> +		.has_alerts = true,
> +	},
>   };
>   
>   /*
> @@ -768,7 +780,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
>   	case hwmon_chip:
>   		switch (attr) {
>   		case hwmon_chip_update_interval:
> -			if (chip == ina226 || chip == ina260)
> +			if (chip == ina226 || chip == ina234 || chip == ina260)

I'd say this deserves a new `has_*` member.

>   				return 0644;
>   			break;
>   		default:
> @@ -982,6 +994,7 @@ static const struct i2c_device_id ina2xx_id[] = {
>   	{ "ina226", ina226 },
>   	{ "ina230", ina226 },
>   	{ "ina231", ina226 },
> +	{ "ina234", ina234 },
>   	{ "ina260", ina260 },
>   	{ "sy24655", sy24655 },
>   	{ }
> @@ -1013,6 +1026,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
>   		.compatible = "ti,ina231",
>   		.data = (void *)ina226
>   	},
> +	{
> +		.compatible = "ti,ina234",
> +		.data = (void *)ina234
> +	},
>   	{
>   		.compatible = "ti,ina260",
>   		.data = (void *)ina260

Bence
