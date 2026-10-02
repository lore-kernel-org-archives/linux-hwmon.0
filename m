Received: from mx-relay97-hz1-if1.hornetsecurity.com (mx-relay97-hz1-if1.hornetsecurity.com [94.100.128.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90B146E017
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Oct 2026 23:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=94.100.128.107
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985486; cv=fail; b=Kpq09U3fV4l/YsBGcgAe1PAJAyPSqyZcdxJ1Z3/+IZwAB9cBe2hB4ZJRuG7WE3bpyiDo6wK/0qjGVoCh00MN70b2rPpytDo+45aPlIo9mTUJGhZA+mkGKsv/w4PZY3BHu+dkKmbOOU18XHAXZKj7LNm8n+5bFGGRH/+++SCC9LU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985486; c=relaxed/simple;
	bh=o/H5exfJ6LcZZEYOiYI+/D42PwXaEEC3zv6l+TDlZFc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h8ZAVNaySqSEMJkcb0otwwMI7IhKvKg5Y/9ar6rgvl65+HPqp3NJEyzpbBcxmDYuEJC1aUHUI9u8KvzUpBP4Gz5HNTrxfvp3y2q2y7Xg1BgcvlUWlkFOE6sv+oiOF2fEsHYv1JBQQYFGl8TvFYRtBOOnqm+EtTdbpYdiRrw9RcI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=witekio.com; spf=pass smtp.mailfrom=witekio.com; dkim=pass (2048-bit key) header.d=witekio.com header.i=@witekio.com header.b=WdyMvsck; arc=fail smtp.client-ip=94.100.128.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=witekio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=witekio.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=witekio.com header.i=@witekio.com header.b="WdyMvsck"
ARC-Authentication-Results: i=2; mx-gate97-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.65.105, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PZ7PqQW5Yp4KhLzIFoCSRPPKDmOWjDszj+NfMhWGniE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1790985467;
 b=liLaU7pvld5ulhvoExL1Jr1XRKGpuzKWFBJVG6m6PBdd/8z/2O4Ay0SRaEEyYTqVwe1FSLeK
 aHMUIsQ+A+M4djy9fSHu5fp04ZNa7y1+dmzIlVafwQvusDGeADtuK9jQTVBNSU6jwQYLv/R9ZTX
 HuLjsUQ5OE/UF6Dr4bGKvw6a/JNaXNUO0pW/xNBjY0/WfBhDra8Jfksfi2Wo91Ehz8yhxDC3djR
 G4zbn2wDzLHzrhIqyuNWbb9C3pIv4Cxkusx8FB6sT4MAFu7JcSAWqk+8JBi1AHQOOlnRoWLsZsV
 hHR9FHr7HKSDi6B5MqhqQifTyk31c4I1e8iC6/a1vPrEg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1790985467;
 b=hTY8vkoMfh20hsROBatyZgdqQAeTPgem49nEbM2dmtKeEYLQUpWSBTXQ+7vgNHH1VSkPY9a4
 bkmhNqfNKDDZGq3yozaVPJyfTuDISDG3tOx1qRv0AyrB72FAfdHVz9bYgR+rp0HjnehgIuWqsmf
 R5t3uJUOD6dR1NA274dTpKnxFI8X/cjYv+TiAVJbQqRqDgA+DJaYN0zJy2DIRe93q/2nN/blCN7
 XwfMzZWpxUIOEyrmT9Ypm2PZ2wrkXeu5ogiUeMeD9q2E8nuC090ldAcLqkmfjuoFZn/2575iWYH
 hsY39XB9N8hxY6LHARxJ7TygZ0gdIx0qjpIu/3nOdONLA==
Received: from mail-northeuropeazon11021105.outbound.protection.outlook.com ([52.101.65.105]) by mx-gate97-hz1;
 Sat, 03 Oct 2026 01:57:47 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWxh58ATwszfXDAwNven81D4p7f81hj/n68cOkq5QSUlCXojrwK2ixcW3ICTZuLHdNb2de+huYN2x5FR8NszCLppw4qMD+IvPtGmBZdpkx4enkQamHCs8y/GcIcN7LHkDPKgJ5B4p5DAh+iv4TSzVV3ehymAWjwOcdNohk7a8wIIchwzUT6vxHhDasi5boVzMr58ro9Cyyey1sN06xD+/IBp0xQMrE7LZrDmeZCkcLLwA8bLb+ziywW2X+Pu9XQCNvshxwrJwUEMv1PB0gV5MyYP4kCUspB8i8bR7B3lHcGhIHlHmK89U0+B0dh8rtOfksV6czUvqoxkjHFaTb04fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ7PqQW5Yp4KhLzIFoCSRPPKDmOWjDszj+NfMhWGniE=;
 b=EmXxpqng88PXQYwgQt83veIGsL6uDxgX4vr8H3zZ2cFCDbFz696rjCCdBP6GScYvjd/vE2uOsSQf53t6BV7/Z1/j5Id55E3KV17W/vTAjqcaIkAI+yLNNA6htr9ftvsRYDyUE96jztHhCKHzQDFx+MeahqAqLhBrcFnmV235SiCPiVnsWkSlSR1sWTvyIXXQCF4OCV2D5nC0pjMtGRXjwL5uJIsRp04rZ0fNi34cTWrKYtS5/y7ozZlRlXBS1+n2THGdJ1JmW10B65Ju6j4LjMo/9cWcDPz89tkyPwkE7+QGhpJ+/KywZGznt2ri2PXAjRFx106V4vtT0z13zGlGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ7PqQW5Yp4KhLzIFoCSRPPKDmOWjDszj+NfMhWGniE=;
 b=WdyMvsckbyFOrDLH3TrlkYDlAaJO5CYhUpn2LWS9ubm3gxXptK71IEtxOLwqaVT2jtyyec6WGqg2ryXIbfyZCy8bQD2jCUbSBGDK8GOtCY+vrzn6rTifU6QNqwCW3FnOHiT0POirua/SGZqk4iRvPPiqD2baCyMUwmsY6dMSabBXzybu91lkvSm4QhIbxHKjP4nEbQzbkuL6hF9Beh/Eyu5MhlPId/Z/7M1YNk5quuiPzQrVziaK9GFPgWj1ZSgnBMIE5R+yXBF09QYZtCQqN3vJR8BxT+193ieYJW4ecyhqOQhODdzP0INDY8cfyB9e2rghvwZWvP6fQ/MCN0MUpA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from DB8P192MB0792.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:167::18)
 by VE1P192MB0543.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:165::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 23:57:30 +0000
Received: from DB8P192MB0792.EURP192.PROD.OUTLOOK.COM
 ([fe80::587b:a57b:3517:d13b]) by DB8P192MB0792.EURP192.PROD.OUTLOOK.COM
 ([fe80::587b:a57b:3517:d13b%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 23:57:30 +0000
Message-ID: <191be387-b7d0-44c4-9f7b-ae820b8e7162@witekio.com>
Date: Fri, 2 Oct 2026 16:57:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add TI
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
 <20260929-lhart-dev-tps38900x-v1-1-7045c5894152@witekio.com>
 <20261001-greedy-skink-from-sirius-b13f9e@quoll>
Content-Language: en-US
From: Luna Hart <lhart.opensource@witekio.com>
In-Reply-To: <20261001-greedy-skink-from-sirius-b13f9e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To DB8P192MB0792.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:167::18)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P192MB0792:EE_|VE1P192MB0543:EE_
X-MS-Office365-Filtering-Correlation-Id: 863278bf-8778-42fc-adf7-08df20e0eb24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|18002099003|22082099003|56012099006|4143699003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	75GvoKKkz84rGVHUvYpbEUvJR3PPZmSHXFGC14IEyimOa/thLjDSxV2LMC1nUpyEfNDlNmGygOkV10rbYahNd8bAMShoZacKvP5aQNvJvxaztmqMulK6ZBltTWTroPatQaxifpxjRAl8HNQg4P+8lMx+zuCvE1VsQWGGM4jtnncw4jsKlVDvGMcH+owul3avWjZg9ArrQ7a1m6de7ysVL2lvirUCmGveSItEjAk9F2+X2Dn/eKZijCR8H5lHS3Lh4DI4ejyaIdbNccZx0lJpPUq2tkR5Xrp2bTgbnslMLfs33NjbfTspiJTcoAx+mhlCiX8G+VICuMu6To1kfHTdmZj2IHaNrKbON8Yyahenqd8TNt2+fLMW/qDiDwgFPcyEB8nZ0xXpiJnoxRNZQg/5lSMevCxvngNCk1jNzIfr58l4Gn1HsaxuGIB7bOz39JMUMJAwrrV9MDstIty7vxv0vh7TFbxOYka8TxR+1bx6xc52ykqMZPK5c5dFZPx5mwFtorEvbfynddc7K4DJIhxAkBuzx9mFDdqrD9FOxiOGpCj61qViUsaefiAY1igmbR+WMU05Xt9B5yfN5aKhj0Si0sFPxAmMBF0S1ln0ZPQfAB5Jo+6l/Og/Ncm7nXUWT5NTIzdY7zHymNgqsWBaT9bmU4WOTQxGIO3X4luvtydGw8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P192MB0792.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm9GaTJyd3hsNUd4Q1hjS25XVTFXNnU0YkRMYVhEYjRWaGxDWnBWd0JFTGFK?=
 =?utf-8?B?V3NDbFlacVpZVDBDWGtSYTVBWWtaZWx1ZTlDWVBWUjdjczU5MFZnWkxxT0JC?=
 =?utf-8?B?RmFZOStIYSsycVJjTFc0aHBwaWdKTWs0WjkvUzd4Wk9YemR5a1k4TWd5TEgv?=
 =?utf-8?B?YU1hVlJxbUhmYlFpeTh4S1dJMmU5ZHZXRTEzMEpCektvV21teDFBMjB6Mlo4?=
 =?utf-8?B?V1J6V04rY0IwOUV3aVFTYWZ2Z1JJaXNuR3ZqWDBEQVJhRzM0RXFLNHN0ODdz?=
 =?utf-8?B?cEJkZU1NaTl3dlVsVm0vKzJNWjUyK25KQUJXd2h0dUIxMkJlbzg0dWxCRFEw?=
 =?utf-8?B?MHBocVBoQko1NG0yK0NZRXBWWlVycm9xNklORHFDa1BmWFJRZm1PbWFvSk1W?=
 =?utf-8?B?cHhnZGNmUm5hUWtSQ3hvSXlMUnRnZllUdk5pZUpjbE96MktVSGdvV3ZTbUFs?=
 =?utf-8?B?QlZGekt2Z0RsMitHQ0VIWmllVzZTVlNFdHVxT2s1QnlsajBLY0ZMYmdDTktW?=
 =?utf-8?B?VXp4NGgwcjg1eTlDVWdydG56Rk40VDZ6QWt5YWRrVkliOUpYdXJ0ajlqMTNM?=
 =?utf-8?B?NXBBTGY4ZDYxK1NMV0VWeUlVSE4wbi9zbzhnTXF6TkR6L0M2QzhZTUU0R094?=
 =?utf-8?B?Z25LOCt3eEVUQ1hHUU5EcWNTZW14UjBEeTcydHUyZ25rbG82cDl6cGo2QTJD?=
 =?utf-8?B?ZzNKMDVJM0tKaVE0NnQxUEtZQ0VBYys5MElDM3FBVkdkUWZYa2NOZkVpTWtP?=
 =?utf-8?B?QnM1Y3MrVHRSSHVxNitwckU2OXVnUzNoWlRrc2JWNko1cnViK3Brb0FuWXVT?=
 =?utf-8?B?eG91VlJhN0RveXAybjJVVEVCWmFZaHZuMXZwSVRRVGdLdHJaN2h5dExHOHl4?=
 =?utf-8?B?ZnRMSXVuVjBLUFU4d1I3aFduaWZwTUtqT2xOVjZRdkJTcWM2YWh2cUNBNXhC?=
 =?utf-8?B?QkcvVXdBR3ljR2M2Z1VDcmlDME93L1BESFl6Mjg5NjBwVFJGQlc1VjJ4OFZs?=
 =?utf-8?B?WHB0eXR2OWtQdWxuWEJKYmFZZnJuRWFvL21BUk5ndmhzeG80T1NNR09rZXd1?=
 =?utf-8?B?b1hUUlA4RE44MGFhRjUwK2hnTXpNR2RqbHRwSGt4dzRwcTEwV0hOUWtDS3ls?=
 =?utf-8?B?RWcyMXZFR3I5c1NMc205alVFR1BvOE9VdzVLOWhlUmtYclZxTDc0YlRhWVJW?=
 =?utf-8?B?MGV3OU1YVU9HWUhUQU1pakFuQzk1eVRxbGZNQVd3SFV0Yi95eHJZOUY4aDNC?=
 =?utf-8?B?dXZRYnhtdVBXSW9vUEdWTnRmY0tWOW5tNFVHVkFmTkpJQ2JPdHo3OUVUakpB?=
 =?utf-8?B?TGxiaHk5NHdpdXQ3c05BL3M1WEhCbXNiaTIwMEVXd3NHcXZtNnU2RzBiTmF6?=
 =?utf-8?B?Z2hRcDlFNzkzbDV0Zllqa0oxTEJGdUt3OVAxNWRDWUtRSUpJa2FQM0c5NmRR?=
 =?utf-8?B?OWVBL0czZnlmSUgrUXNFVXFCMDNMSDVKOFdYQWR1djhBTlJkSnlLRFBuRGxZ?=
 =?utf-8?B?OXhIS202aVc0VjM0aXJQVklaVFBIZjEwODVqa21SamhVbnRMbHpyUmFpWitO?=
 =?utf-8?B?WG8ybWlHYkQzc2lzRGp1cDNhZkNOMEpsWkJCTVN0OVFnWXJPblJhcEhqS2Ev?=
 =?utf-8?B?N01reXJhWkdFdldScmhJSmtuUExnZ3FML1VrYkh5eC9MNlVHUXg5S0lieXVI?=
 =?utf-8?B?V0ptQ0FkYVNtTnJ3M1VJcWI2SGQ2ZkRzcDV3dmoxWWNOdUx6YVIvRUJHcUpz?=
 =?utf-8?B?MEU5UE1oYVJXcWRZclRkUXdVYklHVHN3SS82aXZ2eGR1VyttbVZwaC9jWDhh?=
 =?utf-8?B?T290Vmtjek1RbFF6a0EvK0w4MWxWNjZTdHJobmk0dlJISlg5MDlJRlVoNUt2?=
 =?utf-8?B?Y2pSM2ZLbkN1cmVwUnBJTGFtUy82S2tpWmI3SzRCOUtoTkVGeG90ZEhxRndK?=
 =?utf-8?B?dDc2dUFneEtnQXNnUDhWNnZhZHo3M0VyOVI0OVoxNWtHcGRhVEpLSUtacE8v?=
 =?utf-8?B?b1J5QUloUER5dFFCbjRmUkRHeURNdXdiUlgxOUlLVkpsTGlHN3hrZUJUR0ho?=
 =?utf-8?B?MFNGa0tCdStRNURSR3pJZEpJZlVuYlQ2bHJqdmREdnh6bTRRaXkrNmVrNVI4?=
 =?utf-8?B?b1dWQ1RKMVVxY01sQ0svYUZpN2xwY2laSzQrdW4rWVZmVHVqZ0J2cVJ3YUVU?=
 =?utf-8?B?Z1RrbVhWRHhJbnRKNE51WGtOSVdmeHVSeTBwU3BUVWRrMW41NEpMbXRrNHVF?=
 =?utf-8?B?dlJ5NUVzVFNzZnQ2bXQwdDlpWEVzaWNsZzVscXlGd1BqZ3lkMXc2andFVGlO?=
 =?utf-8?B?aWNVVCtSdXZWeTI4QkFUNGJGRHhySW5aNUdFZ2FUUUxuVkhVQWdudz09?=
X-Exchange-RoutingPolicyChecked:
	PrJwiKlnKs+wskvIsMrP59OCYKHJlJ4DHNAoHf0b0ZbAVzp9iral61iD5wH5nEaWGeiWADMMwiPQn9m5RW5CFxvDA5RVQja7YvP+Dd938Dv/+DV+zP1p66AEuSzQLaHf7Q8jVaCn4EYYA6BqoBpGoWWXPxHFModALVmBxxLDp9/4rKect27Yioll81puexOxjW/l5XEeavTKteyKaaKlhNBQavDmcRkkvRArbu/c4xZFQRpJQ9luFEut2AWysLvE1q4UjEZgRHV0Vuyf7ygMObyi2hTcON/VnEZCLzOqs4b5IxAGHGpnXitqYh4V63VKrgsRy5+XIwpPcM1k1GnsVg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OVkahA81CW3KMACuOU702GHNMOaGv9GePGBtrUmp1GE2sT5hF/3iAdhmn2UYzYV1ud+653DWOstMD0S686RLyW5vKZlFoUi9gRA1tmzS4aCefyhJavgtp2uVwvoeh3XwDdU18/4lNl3+UzfE6Gd1ATzP2gVpONtn6sHhD6GIlELvziW4d9UR0XON1NfU1/GpYkQgo1Ep3ItFL4/EeyEFESFfiUXt5rO3IrWO/BIRhxD+SC/PHQ4GbrsCMNwuXOBlRVO9Iwq/6UkwVPzaKRnvZNqnup6PDRphRG6ZBALFrhq8pU+cjjRct8TXi7i9cRufspULVmpDhcj6E1v43TMRdizUHb3uIOgMB6vd7/yV+rt+dO5fjIpyUJbGTPSZ5J8jqHG6SS2Tn5iqrYqC+Mgqo849yiX+PFRRKihypd1BSQ93zy8sUHYfsjA9m8eW/XFLK1f2Cf+8EGVhUMSMPgsHVyYXi8eqkT68f3LSvJCsUznqZA6Urg3k4DO+3jm16fPvrnY1gYiEax/xxW9phrR/VzlolNN6UWjlAGoctGEqyQO3PCOGuChxkGYnp9esMCunORRUryhetLnesHWH3y36faQWO6creDcfUR6MXZ+DQa6jOsjB6DbkAdyycefcq6V8
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863278bf-8778-42fc-adf7-08df20e0eb24
X-MS-Exchange-CrossTenant-AuthSource: DB8P192MB0792.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 23:57:30.4787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VMjllgd2IGfwiNC1Rk+4e++KOmnD8jFVlgo/85+tQNNxZIiXQq2eP5MMQr74UI6UiwfRtpQcNqygMWzU3kgNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0543
X-cloud-security-sender:lhart@witekio.com
X-cloud-security-recipient:linux-hwmon@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: lhart.opensource@witekio.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate97-hz1 with 4hxQgy41Hxz27fdZ
X-cloud-security-connect: mail-northeuropeazon11021105.outbound.protection.outlook.com[52.101.65.105], TLS=1, IP=52.101.65.105
X-cloud-security-Digest:229734f868ea88646ed6b6cac12cba01
X-cloud-security:scantime:2.560

On 10/1/26 1:17 AM, Krzysztof Kozlowski wrote:
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^vmon@[0-7]$":
> 
> How is this called for other devices? "channel"?

It looks like "channel" is most common (perhaps "input" would be valid
too, from the ti,ina3221).

The V2 patch set changes this to "channel".


>> +      If no child nodes are present, all channels will be exposed for>> +      monitoring. Otherwise, only the provided nodes will be created.
> 
> That's a bit odd behavior. Is it expected for hwmon?

It seems not. Changing this in V2 to enable all channels by default.
Disabling channels by using the status prop explicitly instead.

--

Thank you for the quick response and review of these changes.

All other comments will be addressed in the V2 patch set, which I will
share as soon as possible.


Regards,

Luna Hart
