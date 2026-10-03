Received: from relay-r21-hz12.hornetsecurity.com (relay-r21-hz12.hornetsecurity.com [94.100.138.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC812192D8A
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Oct 2026 00:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=94.100.138.221
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986504; cv=fail; b=O4z5qCDHUmXRYTgwST5cqtCudJqlwGfWuUkEpBBjGG3BkMHklWrxS2mq/M2KX0RQiDWEkJMv9XgKhwwxoExuoPbnCHG7trW5jy6z8tGUna4v3qpzy6kUh6pDdi1UwPOgeX37iWqO7IHxoQ0pP4xrXM3scJiW0hLgQvWZD15BwWg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986504; c=relaxed/simple;
	bh=5rnoLQ3jdXUqBD980dPE0c5x9H8JrOWAmBSuDKmqEFE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gqzKvaxFQGT67T2uASZWIX18J6H4Uw2o6tM8xqALTLxhQiIrlW6YQJ4c0yocTtzBxBJtRNn5S7lCGqTlbzfo0VbWPdBQitpMQEEooIYl33xK6ixRLqKd0t1KlM1LBPdFd6Rrs7aXMKNdBC14F5KUgg6h8EKarEkNgjH/+CkXs7A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=witekio.com; spf=pass smtp.mailfrom=witekio.com; dkim=pass (2048-bit key) header.d=witekio.com header.i=@witekio.com header.b=CWJqSMKk; arc=fail smtp.client-ip=94.100.138.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=witekio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=witekio.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=witekio.com header.i=@witekio.com header.b="CWJqSMKk"
ARC-Authentication-Results: i=2; mx-gate101-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.105, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=XZLWHBGkp4i3Dcvh9DPzHAlKsX7K8QO6cp55S8r/UdQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1790986444;
 b=tggAzO6qfVKqzYHfFucnaCQeuRvQq9rOICox/sMZPWrpTHROaHj3d3vbVPBQN0NnAX+ZEUUl
 XT59JfIJyrX7dVqiXoYT2Lg/UvjI49OSXlbKhIw3gQgIAgLv4qoROLiWVoSqdYf6a8OBwAuHTzA
 qty7EK7P7tSM8kTuirKsOHdB9kPs55jsrmzSDs1PyBZPLnuzoBg4yGbErw6fwQIszVYNWDg2jAA
 01D4OowFCEl92PxgxzoHhDZ3xO2aZ1mptAHPtU8QiLtlp2yWTemG4YW2Wjl2W/dH1FmG73pTDQe
 5fSIPAl3RH8QhSqhX+fOhvZtY1L27VGVXCX1MEwBcwbnQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1790986444;
 b=mE1XVe1tZjN13tCvTOct/YEXrRLw0vV/EWpoLMhpJlqoIWNSyPKSyO2iVV3zeHIq6WuWihPT
 ahd4WM/rEpunmnmHtaXg8m4shrNGsyZ+BxHeahvB7P4Xbwvr1ROuXcQETLbEIhaXom1atlWtn0W
 iZu9p4BAXD9gkur6+1XKHwMJbceuoquSr5Ol1goSvlPY5CTTknX+u1Z8CW9ada0GRqTXf6+4TCM
 o981y4qgUkTB7EU30+Sct5Xk3TTWwhTkJJgZDTjqgNEYaR6MwwifYnxdTbo++dlI/h1in2a/OKo
 vxlMqL+XvKhHky5LmOlOVd+ZRmZlkrRops+iLWMZuCD4g==
Received: from mail-northeuropeazon11020105.outbound.protection.outlook.com ([52.101.84.105]) by mx-gate101-hz12.hornetsecurity.com;
 Sat, 03 Oct 2026 02:14:04 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxqYUqkLbRrutaexVxcbTw9bNi4MUtl3F1GNs2QPZG+eC8tGqtObFTrwFIRI/x7rtQPpo+pcSLBjmpmCmdda65eNQ70tEij63q7r3J3nXghmulEYYOvoKTcI0beIUhz9+gWAtFGQLhhAgmghA6vTs7NfT3PPbO2gg+B4R0erCyhCb+C9GQdvnMICSKLpt20iwBI8nLeJ5frYvM+IZiT+7mRY25o/Szb4s2OqULgZgrOuAeLfBgV0V/fvLv5F7XjO++Xo21KcW+UbhJC1S7ThtK1cOwLtcntiXJ1vRYfjCveYF22PHFpAVi9ELjHiMsj0aWvftahEQRnM6QYhcNQJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZLWHBGkp4i3Dcvh9DPzHAlKsX7K8QO6cp55S8r/UdQ=;
 b=zEVDFDSgX/5yCXf0kaBf6Huc/WeCElyVrVpC9mGJRIgZ+41kfoLH+S74naEjm3x11lHBD9U+BUZAjFOwJ5a9hhP14Smg1ANBjiBBSlTUPcVflrwFVrxoZ3U7y/o6Xkkb51ShGteKrFssRMO+SBb4cEWBghTvM2QttTnKuUDFpErGpZq3EiOybdg/jAbs475R8WWjSnZbUYBeRQ8eQBvhguI6wMPuJ72cJ6LeSJuKufwiPdhcMKa4ap3JpooyGbMZBtqMS9dJQNaVftzbkgxjRmwEFeEVWBfZQkVGuuWcd6vvZj5QsUzhf9wQ/eB6n9CUbGvxyCrTyfgHx5kkUE4Xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZLWHBGkp4i3Dcvh9DPzHAlKsX7K8QO6cp55S8r/UdQ=;
 b=CWJqSMKkK5pzSe5E0xadhSJnGvYPtyzMwIFlNgOPhRQ9NsPaI+oDyb61/yTRqmFN2PJ0NMAR5L1txwEcBv5pdZHlU1S/PKH3+pWSXVbY7rFlhzEmqJ1Afsd3pp62sdB5ijFcu7E2gcFs+3gvJQ5SDBiXr1bZz4b3w+Qb8NepUeY7lEdcbyOsXYRQKgP9BiaB3vXClmWe7yzd3qXD8AC+Vu98d8YkmLYNrBEnNw7OXyq2Lxqz1MtU7MWG7IIbXQNoB0JTKVP0hh8Tb2WuYzAyYbNm9qdIAYPl5Lchgs3E7lfMoDyouAhJMZhbGbnZn1WjNR1HcZMIyuif5yITWH3e/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from DB8P192MB0792.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:167::18)
 by GV1P192MB3050.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:284::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Sat, 3 Oct
 2026 00:13:48 +0000
Received: from DB8P192MB0792.EURP192.PROD.OUTLOOK.COM
 ([fe80::587b:a57b:3517:d13b]) by DB8P192MB0792.EURP192.PROD.OUTLOOK.COM
 ([fe80::587b:a57b:3517:d13b%7]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 00:13:48 +0000
Message-ID: <998a06e7-a4a7-40f0-9c99-21a7d2938a6f@witekio.com>
Date: Fri, 2 Oct 2026 17:13:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389004/TPS389006/TPS389008
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luna Hart <lhart.opensource@witekio.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Flaviu Nistor <flaviu.nistor@gmail.com>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>
 <20261001-judicious-oyster-from-atlantis-ec18aa@quoll>
Content-Language: en-US
From: Luna Hart <lhart.opensource@witekio.com>
In-Reply-To: <20261001-judicious-oyster-from-atlantis-ec18aa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::26) To DB8P192MB0792.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:167::18)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P192MB0792:EE_|GV1P192MB3050:EE_
X-MS-Office365-Filtering-Correlation-Id: e52543f2-a4c5-4420-d873-08df20e3321d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5cIr6PKFN7JqrRZpZRJ8KrRZO1cRl1BDai3jRZDd08B83/+Pf+wNAqWsSSJG0n8FrYICr/wA1hIdhWv3j+LNUyJcw+TV90a53FC9sJcQw1vXaJ0xOXiVklKFGYgZZ8C+NbSLK3aauH5CAiUT0jj9W67oBfHolv5FdySli42W96AMvf5GkrWr3b1z8jSs6AHf4o71KyqvBUeRk20qZtpcyHH5kaks2ocRAirwhKnIEsqLUU4XRQ0kjZI2G+OpGvPAUGrQQXPO5Zt96MVQyGLXc+XC44WMreL+EV9VnMAIsCdB6qc1PkjpC5R7aYY/xE4TrDfeB9H/FKDd4QlgyD825HdyObWdFUf46b5Yu81nrxy//vhyK4xYJTZHS5xwW+CUeZci7fa8S+2HQV9oTzPzYWeyWNZm2rTl07ipEucJR3iG6G+7nWxjsKwt47uGLhotz0oEdOI351t+08pjXgww9kkr8TN7Egv3KzcvNc0Fos94Mw5GScQ1VUCb8rbqHocNcfW0NRA8c4oga3yh8/P9joyuC+yueZDM5vvxOuf2xfqeOWgQykf8dHDJY/n1bkTqXNqeUALjAWcXvvdy7NKHl8pmki2tL+b0T7rRfp0jWcGHqh3XFn/h4fQBsdkaP7c1RoACT5rLteU7QvFzN6vfM3gDH9qIgtbmPjTeX0iTF+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P192MB0792.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajUzTGxhZVoyM043a285RENJZkV0VU5jWklJVlZseHZqR3JUMVFtblE2Wm9E?=
 =?utf-8?B?a1daUHJhMDdqZExXU05ubVEwVFVkZ1hEQlQveWdJVFJZaE9jeUtOcUVCQmk2?=
 =?utf-8?B?ajBLR2RhNWNaOTc0ejh4Y1FLSm5mYklDVFFwOVF4bk10VkxDRFVNM2lkemI3?=
 =?utf-8?B?VzltZVFBZnJmMHFrZHAxbG9pOGwxZlVsUU5lZnNZaXpQaHlDRko3WFVFWCtl?=
 =?utf-8?B?a01ZK3BKTE85NnM0cmxGazBvUVhjU0l3L2RlK1V4UkcvcGxUSXZrVENqNnJv?=
 =?utf-8?B?bTU4d2I0YWxZT3U2T1ZudWY0cHkwZkwvc3R0MGdKdHNKTDc3U3E2bFFWaHZi?=
 =?utf-8?B?TzdyOXFKR3pIdFZHN0RHcWVJdWR5RDUxcXdUYXZER2dqL3BWK251S2tWRkJ3?=
 =?utf-8?B?LzI5QjNvVmlFSTBLVlJrbXZseFRxWVA0NkVwVzQzWHZPeXM5WDFyNHdQVFY1?=
 =?utf-8?B?blJ3SklOMEVnT3Nzc3NuVDk3NzBSTkExc3d3OHJ2R2ZmL2txMmxjeWtMRzVq?=
 =?utf-8?B?U0NhTlF1bjY3bTFwbUh2bEFEbngyU09lSWxWckFSYkRsZEs2c2FBdS9uVTE0?=
 =?utf-8?B?NTJ5akhDVDJSUVg4aVpPbnNPUnY0MHRocWlqVVlQNlRLSEdES2pqdlhtTXBr?=
 =?utf-8?B?SEpVa1FhQlk0K0dNRkFkK1k5dVhkY1ZOZXBsUWc2c2tZNFZpTXJkK0Q0Mlk4?=
 =?utf-8?B?d3RMV0VpTHQ3MXhKZTdJeHZxeTg1K2R1RUlzekVET3hVWFhTY2hIa2hFUnJP?=
 =?utf-8?B?V3FWaWZKSXJ2Zit3RTNRV0o0MVRadGVVWjRyTmIySUNMR1hLQ3VuSk80WklO?=
 =?utf-8?B?UFk5b3p6Tk00MjlLQmRPeHVJOFZLVG5JWkhLSnhCS3J4QjBXZ0ZVZTEyOFBP?=
 =?utf-8?B?WThWMlorQ0dwQ2VFWmVBeEozUVJZZXVJc1E0VlRGTXZlU21xUG44TGpJbWZO?=
 =?utf-8?B?UXMzOU1tQUhMbkFUaDU1NlFDYy9pL2hFMUR6ZlFKUWh3WXFTSDhPSUFNUzBq?=
 =?utf-8?B?aTlaT0pGQWgwdEtpSUk1a0lNbkM5UzJLeTk5WlY5ZGh0V2hlVGJGbmU1aDNM?=
 =?utf-8?B?Q2Z1WWVJRXNucXlWQTJTZmIxRUo1b2xxYXpabVdieTBWWGJTL0xnYWU1R1Bp?=
 =?utf-8?B?emlyVVJWR2FXQUZjREsrSzJXQjJlOGNzTzNQbG03TDNGU0IxMkkxUGMvVE5m?=
 =?utf-8?B?R2NhTTBPSE1pWU5DL1BuT1c0OU1GVDZJUFJTWTJkdGxHN0E4SVk2RzRJQlNx?=
 =?utf-8?B?T1NkTzhrL1FvSFZHL3RnTjcwWXBXSlIyc1dGUFBwaHkvbmVXTmRDZmt3czlK?=
 =?utf-8?B?MDZ5VS9mdnYrdnJ3dGRJTUFQSElIZEtMNzNYamdsUmFFTkUxR29VakVJeTNH?=
 =?utf-8?B?UzQ0eHRPbHdXTmRsWW1ZckF5Q1djUzZpYzJKL1RIa25paVE4N2dkSU1BSm9j?=
 =?utf-8?B?RzF4VUF3cXg3ZkhpVGVEWGVNN3lVWVUzNEJ3bE12ZnlyOURCaWFzMkxibDVY?=
 =?utf-8?B?OURQcUdDNXExZ2lad1hwNnJkeGlUSjJLeHlwWXZHN1NTVHZ2a0s2cWtmSlBn?=
 =?utf-8?B?c29sS0hGdkRGU1ZEbGswZXNtd0Y1Z1oxUVBycmxRQlQydjgxZ29qK3p6RWpu?=
 =?utf-8?B?Si9WOUFQR0lOWi83Qm5haXlzUFUwM3dwQUIvb3FuRlVRWWVLYWRWM2xPV0JZ?=
 =?utf-8?B?NmQzWmwxMStIekFDNEFqZEZYUlAybjhiWEI4Vkx4ZjJ1MUNKb3I0ZTRzQTNt?=
 =?utf-8?B?ZnBDRmZaTEhXcE1UTDV5SXY4UmRhSmU3cFBxS2QxVHZHYkZyT081WGRQKzBP?=
 =?utf-8?B?VVREY3BBNHhXTXM1YVFQREpzclUwYUoxY3RIY2RzOUEvT2x2NjF0K2IzQ2Zp?=
 =?utf-8?B?WlF6eHEra1diaGh1TDVjNFNrd0YzakJTVDB3RVAyUHZ6Y3VWUFZwWDFweHI1?=
 =?utf-8?B?QWQwYXAxNE9FSjlKV2orNlUrWmtGM3VpMU5sZE4vYU1ZYmZ2c1hURkNHT1I5?=
 =?utf-8?B?eWxRZnQxSFpCblAxUUsxOWEvb2Ezcm50dEtTVXdMaWhZVWg1UHdvMm9QVGR2?=
 =?utf-8?B?TmRwZE9MSENlSUMrR2o4OSs2eUZFMk1LMFBNYkdtek9rQXBCa1Q0ckdxQU80?=
 =?utf-8?B?cUNvMENKcEllVU9SOTczQ0tDWEF3TXVkUDMxRFVPbHFVVXhnNXNNdVJnendm?=
 =?utf-8?B?WlJSWit3N3lqajd3amZSNFY4a0k4UVZQQVBNNjZFVEFSZWZKeExJK1ZsNmVu?=
 =?utf-8?B?QVZ0akZmTmZlR0taSzMxRHU1NlRvNjljV0VIK0wwcG1HSXF0ZDNocVM1V2dp?=
 =?utf-8?B?ek5nbjZtVDJQdHhyalZNT0tIZGhIUTRpeTE4SXNNR1V1bkZVRER1dz09?=
X-Exchange-RoutingPolicyChecked:
	PrK5qIhvfdQN2wA4k24b8HlPqX9OTVeAc8vwiq5MRFuZMaP/2Dco44qejOkKvuYsahGYvdaZE2r/ynbg9iRqLYsbieB+sm5OtU2LlBF2KRX/wvCVOaBQA2UVReQhjsvzlROmMS80458hAy3Z6Heu6zhhwCkbPLyovIlha1iYNAZrwgj4E+/WMCsKPniOzuyCOnGc0l49dEfZ7jNCSIMBUW3P3qlyitmySDeu2uoOJ0WdN1vW/zF4seAICl43TagRDk9lkxwdmHbNLc6Vn7maU6w7WHtnOcN9JzZxFJ9YUpFQqrLsGX99hctcD80EUfFGrDYpjn7nhNrliujBALeICQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ezf+5Zg2hs1f/QKw+RBK9ISMOulqqUoF8Cpw6cu/NeN1daT3i3K4Wc1zgOQSVrsFTz9ylH5MJGVKPyz/g5+pAgLvPFdWrvJgGv7+bTueSGQ4Ijx0joTurRlbyFUM3pStUvnQSTHpp9B6twFZZb7XTYet/ylYONrUzZWG3mfjZUUW2WpH4M+HRRGlszcYPsn8Hb2fY8/d68a6WC+a/1QnnU1OmltePg2nKUM4e1rYeX/mi47MTIZUiEzvjEKo7gTC410j/rekyFeiTdZh4IyZwBRY2eXerXTDS2KnPm2S4fR5OILkLXt7vZ1/ETkdR09K2eOIzdA0+/I8s4YMCqduc94Hxgpt4Lav5DUArqntBEUP6nRzD0gNeVQdDx8ZTNF7yUZtJwdrhDKYf48yFpIsB3o1VqRrTMAEF67YKgb5CWK91w4amNLmrKnXMUY/PgOsckWkwaypMEVS0+issGAECjqd3dXDstm3ZhFt3GvsgRZbCI7K0Z8k9fU61+wVt1gEy2TD3OtZDRdX6NsKt7eXwMSDrpTRxAWfENBrR/ceMiB3XCyBJRyLktFfxGvTiJLsXYUT1Z3zFCSo+4tEmfxkhn9+o6uOcdWQkBLEkI6oFS+6oUp426dv6GM7OX5N41xm
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52543f2-a4c5-4420-d873-08df20e3321d
X-MS-Exchange-CrossTenant-AuthSource: DB8P192MB0792.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 00:13:48.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuzLSKa0ulSbLKReH0mWgKH8ftymir9i64fCRtyT3SxctEwtR11IwrlV666zkGWzxugMVV+vQo80ZZaCOMtdwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB3050
X-cloud-security-sender:lhart@witekio.com
X-cloud-security-recipient:linux-hwmon@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: lhart.opensource@witekio.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate101-hz12.hornetsecurity.com with 4hxR2m1JJmz1dxnF
X-cloud-security-connect: mail-northeuropeazon11020105.outbound.protection.outlook.com[52.101.84.105], TLS=1, IP=52.101.84.105
X-cloud-security-Digest:27236412db9cfd462628b0cd40b06c92
X-cloud-security:scantime:2.255

On 10/1/26 1:19 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 29, 2026 at 04:04:05PM -0700, Luna Hart wrote:
>> +static const struct i2c_device_id tps38900x_id[] = {
>> +	{ .name = "tps389004", .driver_data = 4 },
>> +	{ .name = "tps389006", .driver_data = 6 },
>> +	{ .name = "tps389008", .driver_data = 8 },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tps38900x_id);
>> +
>> +static const struct of_device_id tps38900x_of_match[] = {
>> +	{ .compatible = "ti,tps389004", .data = (void *)4 },
>> +	{ .compatible = "ti,tps389006", .data = (void *)6 },
>> +	{ .compatible = "ti,tps389008", .data = (void *)8 },
> 
> Does this mean programming model is exactly the same for all of them,
> just additional channels?
> 
> If so, then these could be made compatible in the binding - use
> fallback, to the ti,tps389004. I don't insist, though.
> 
> Best regards,
> Krzysztof
> 

This is correct. The programming is the same across these parts,
they are differentiated just by number of channels. The tps389006
datasheet also applies to the tps389004.

That said, while double checking this, I could not find any
substantial reference for the tps389004. I could not find a
datasheet or any listing of parts with that name. The closest
I found was a mention about a nameless 4 channel version of this
part in some developer documentation. Expectation of a tps389004
came from the previous driver.

As such, I have dropped the tps389004. Leaving only the *006 and
*008, which share a datasheet.

For the fallback: I'm unsure if it would be helpful in practice here.
What does a fallback look like for the bindings? Could you point me
at an example?

Regards,
Luna Hart


