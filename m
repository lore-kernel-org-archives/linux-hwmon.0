Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021124.outbound.protection.outlook.com [40.107.130.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FADE26D4F9;
	Thu, 19 Feb 2026 20:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771533973; cv=fail; b=AlhCDlKjwAzEmOUIJRbGP06NEpR51CGhdZE1wex/KKa/ajZYwlkyI2pyF2yohs0eK7X8NDZwbYrDFY+Dvi3/z4HLHLaxutjs0/LIdi1tDY1CIhHlo8HfgJq7Bp4HXFqnm78+iH/fJ1pTdxn6pi3/JPcc8WbatDKshFWTpKAjI2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771533973; c=relaxed/simple;
	bh=Joe68pXFHXIHLT79b9HyoAXV52h8IlT6K3yMwp0MZpU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DAP5CmIY9oqPwLgIP6mVd6RvyiBnpK3l113cc6pe7e5WpbSP63fv88XLc+ARlGT8NwYClaFPIrDGYUoEuoBEu6YF6Z/h6b5c8MVc4DZmUfthbQYFSbMMXA4mK5BPUgVlTRVVxKolyjLu/fPxGQTL7gC3iImwM+nbhyt+E0/ffYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=sbBm6Tlq; arc=fail smtp.client-ip=40.107.130.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="sbBm6Tlq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmjY3kSzwn+OWnsxMALU6pbwcVSTZZJU4AyM7ToRkk08zH8ebbtW+Xkm7aD5hRIv5ZkFAs/5+VoC1muWXZdUqUooXqwj9QgOOAIIA+HidzcRnpcbxyLc/rrk1znelFTx1trD+vHKC5PSXxrXnhAcYTd/Ql44Qt2Nm33QjGtjEmHGlteGdYY3rYcrwpS5+c3sAHLf7Ki5pP8v4ijJf9M4yR/vuxMoZ7axVMGRCc9OvW8VFF2DuH2Xy4pc2jOCdzpEznA8WsiwSxeG4PN2NZWgbLX32XRq9SxxKbELIQsLikWaWuLsi3t6NHoGzc6/4uA6PW6rDUC40OTN2PeXRg2P0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P37RXhBAO5C5tBsirbdm0eRyuMPAum4jB138+2fTrAM=;
 b=vUenIWlWWA8nHka4ZbHqkOseKiX+BxcqnCo2pu9adZUryAtugCad9EwTY2EsP6TupCIW0FfI/2WRjHNDKedcoLnvk9DTQFUpvN47luVl91Y1hSRYk7ir9WY7WYzjugZxYsJa2pdVylwYhiFaaMH4V4hi9t+oQbONhhfoT4z9yjR4mZCP7LTmfyovFkzjGwUrxQS56Wten/HImLTvHeEg+q/Gmeke4yAHJHNRSwVTotVGG+X5bjq5d0mzg0p2J3CGEf/hh0zaisxhIJepZDjuEYLdGRcqjvLPI0VKpz/ECKd6RqksEteExlWIf7tPV0/w70GZSErqwW3ojT7W8jXDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P37RXhBAO5C5tBsirbdm0eRyuMPAum4jB138+2fTrAM=;
 b=sbBm6TlqmQu+OsjYwwAT28BaS3utNIDv1BhbYF1R0x6dBou5Jt46OWi6QgyVulE0Bvr7FJfdPOZ2HE3m7kEzegpoWpxl7Z0JoaP8J7mQGHfn3SmQVb8IsoV4kEG/sAjyoWgBEX6oeqr97k3bL6HcfbcAF35uZ2Cw2+QPdgOyKcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5)
 by AMBPR04MB11785.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 20:46:08 +0000
Received: from AM8PR04MB7249.eurprd04.prod.outlook.com
 ([fe80::d3b3:b4e7:6b28:d052]) by AM8PR04MB7249.eurprd04.prod.outlook.com
 ([fe80::d3b3:b4e7:6b28:d052%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 20:46:07 +0000
Message-ID: <b3af6bd4-0a8a-47c2-90c8-b5b65f9b4701@sch.bme.hu>
Date: Thu, 19 Feb 2026 21:45:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] hwmon: (ina2xx) Add support for INA234
To: Ian Ray <ian.ray@gehealthcare.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Toma=C5=BE_Zaman?= <tomaz@mono.si>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 devicetree@vger.kernel.org
References: <20260219130127.87901-1-ian.ray@gehealthcare.com>
 <20260219130127.87901-4-ian.ray@gehealthcare.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
In-Reply-To: <20260219130127.87901-4-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To AM8PR04MB7249.eurprd04.prod.outlook.com
 (2603:10a6:20b:1d0::5)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7249:EE_|AMBPR04MB11785:EE_
X-MS-Office365-Filtering-Correlation-Id: bd163a20-0d74-4817-955d-08de6ff7e850
X-LD-Processed: 79f0ae63-ef51-49f5-9f51-78a3346e1507,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|19092799006|376014|7416014|41320700013|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTFQc2RLN0VBa2JJTEVnamNXM3U0NU9JY1EvRVdaV0pDK3V6dXJaeXhZUS9U?=
 =?utf-8?B?VEVSYllYZ2MySjRIem9HTVlGc2ZGa0R5YUdDTGkvTnRCU0NQQWhNVTNqYnRh?=
 =?utf-8?B?WjZPUE5kelRwREVvL1RidzkyMTY3L2hvR1pHOGdscEJxVHUyemVUUmJ4cjAx?=
 =?utf-8?B?bkFzRUtKd3lsM2xEYjIzdHdTa09pdHhGSU16ZGlVRmVGSHNLZlpvWXFGNU9P?=
 =?utf-8?B?cGc3YTZ3MHlCSmRQeFI5ZjVGUGI4UGhYL3NUbFdCelo1MDZFRm9FaXRrS1ll?=
 =?utf-8?B?S1hxUTZGSk5DLzM5MVRnUm9McTl0V1RQSUpUemoxTnFndDQ0bXF1YjVjbmRj?=
 =?utf-8?B?MFhoMmZjak9sVU9TR253MC9YZlBkTDQzOUZvdzhrQysyVkhQb3pYajlSdXN5?=
 =?utf-8?B?N0hsQlFtV0o1NFFqUHlJcFZUWTVkK0daQlR6a0xObkd6TkZ3QjlxNFUwTFVk?=
 =?utf-8?B?S3Q4TFpJVzhIeHR0K29yblpZUUFOclNGNXhZaTdxeHJyaDdHZ2FsamdsWGt3?=
 =?utf-8?B?bE9tV1dTdy9lWHU2ZmtUQUZIU0V1ZzZCMzh4VUdEd21YR1ZGTGxlT3dLMXNN?=
 =?utf-8?B?VWtzbUlua0tUbXptVWYwQ1ZadnJicS85MkJYYVppL3dYSWE1aDYwWnJ4VnpU?=
 =?utf-8?B?UWRnUnpwNUIyRnNBOG8rTlN0L0dnT2I0NFFmUnYwaml2dWFBUmViazFuY25C?=
 =?utf-8?B?bGdrZW44STFSa0VnazYyT01nU3ZwdHBKY0FzUVpBMGJUU0drdEFNSkg0ZVpB?=
 =?utf-8?B?VHM5dThNQWxFZVNzL1FGU2Z2dWJqSW90Z00zc2hiZW00dG1kd3ArelpMMncy?=
 =?utf-8?B?MWRZWUY5Z3R2T0FxN0hGaUV3U0p3em92SUd0cnF4NWFYOTE4ZGJ4dVhxeU1V?=
 =?utf-8?B?aVh4UG9uVFZESGkrN0pWZkVKdWc5cXQvT3RaZ0NhckxGamt4RVk5c0pnNnFr?=
 =?utf-8?B?SDZsRTV0YjVNaEF0S0VKc2hsdU1Vc21maFdDNUIzalBpZXhtNUx3bWxlQlo3?=
 =?utf-8?B?MHhGSmV2Mm5SWjJzTnFpekRoS1ZlOTdaWVNIS05GNjY4VHdreGoxeUZGNWtO?=
 =?utf-8?B?Rk9mNDhXd1EwaVpTbDVrM1kwNWlZME42R1RoZjdXZlQ2UkY3VzUxcmMyRDlH?=
 =?utf-8?B?M2poNTJpL3dSSUJRRUdIMmp4SFh0Z29TbkU1N3JVSnZ3bThteUpPWHNUTWc0?=
 =?utf-8?B?bDU3dXVYR2ZFSWh1djY2elEzaUlHVCs2UU1IY1lPQlBhRERmRHlEOUhTYnRJ?=
 =?utf-8?B?a2FaL2JKUmxHY2QydlVSMkxpV0J2dyszWmhkZVJxcnFSWE5hQTZNR1NnVktq?=
 =?utf-8?B?WlZWR3RWcE9DdUJvbGs0bEs3b0lGdzVoUmltdHJFc1l0eDBXKzBFVnhReEVp?=
 =?utf-8?B?d0lWT29sRGJVSkQwMUJDeVZUY0p1VmI4RExVbmY2N1BCSjdwUDN3OXR0TGJ0?=
 =?utf-8?B?UExUcGFydlAzZXU3aUdPbGUwZFBQTFFGSlRsM2Vtek1tQ0VTOFdyRnVMeHRM?=
 =?utf-8?B?NFNlUzZrS3ZIN3JWVmwyUXRWdGNjcWJXOXVIV1NnQ25MTUxhSzFoSmVQNXJ6?=
 =?utf-8?B?angyYk1SRVNIbUtKaUtvWW5JVDNncHp0d0lBRnVZUm9JK2ZsYVVDYytrUjZI?=
 =?utf-8?B?ajFYM2l5dGhIbXVmMTQ0YURuaVVtMktteUpFVXhDaThLTnI4YUlzMWxsb2hJ?=
 =?utf-8?B?UjU5YXZ5bTRaam02NlhEZ3BRSlVENVJTV2kwWjdtL2lQZUVnODd1MHVGVnVW?=
 =?utf-8?B?bDc0eDlTRkNmZk9VRTRhUXpjYXNyYWNxMEhtM2g0THJTTlI1dkgzTG0rZERm?=
 =?utf-8?B?bVhTdm50MllWNU9Fb2lUU2U2bVFiZDhuSFdmUFVEQ0NvU3lETEs5Z0QxOHAy?=
 =?utf-8?B?cEJ5dTNGa2pFTWJSeituQ3dYSGx3SzBLRlI1SEZ3ck1LcS9QSzliTWtzWW96?=
 =?utf-8?B?ZnJxZGV1aGxDWkVGMm1ycnUxRmRxeDVNTHV4SGsrWE94YjhqWVp6Zm83RzlF?=
 =?utf-8?B?ZHUwMEJHdE1kcFh0QzJjaHdzblNseDZVVkYzWXZkSzlWUVE0MGRIdkU4REtr?=
 =?utf-8?B?dXBIbHhkUmt5K2I3QTBpaVNoODUrV2hjUzRmTG4wNUFTSUhFRUx5R2RrOHRB?=
 =?utf-8?Q?7hZY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7249.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(786006)(19092799006)(376014)(7416014)(41320700013)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWQyNWhsTkpLMytqcWJGYlZNVlRnUnhJdUVacEV0S2FibnJmUmRqWXl3bnlI?=
 =?utf-8?B?bWZONUNXS0dSV1U3TjR1ZkgwUzllbHVhNzNQQkRidnd6TnBtanZ6S1pjV1lM?=
 =?utf-8?B?ZXZCU1JDeFlhZ2wyeXFYNUdQMUJXL3lzS2VKbGhPU0V0WjhmVkllY1hGSlQ5?=
 =?utf-8?B?N3d2QVFyNjlCK1NJb0t6RHNkSlMrdWRwNGZhNEFTQWVadC9UcHZldG5ac2tU?=
 =?utf-8?B?c01vdmNabkUxb3Y1TGtaMG1XNmxyQzFRSEJzV2s5aitOTk4rc2hUZ1hUK3Fm?=
 =?utf-8?B?NUZzSHNFUjBqOGZoVWNTZXhURUFMWUhmaHROdm04OHRzY1oxWHQwcWlVTkFp?=
 =?utf-8?B?Mmp5MCt5VkFpUFh0dHJkNGQxK25vRnRSWEpmUHNOTHlDZzFkV2hoTTdXdHdl?=
 =?utf-8?B?K2R0SUJMTTlDeldHSXFBUUpuKy8rb1VLVFZVQlU1RnZaVDRMcVdLeG0wRUhs?=
 =?utf-8?B?L1NnY1ZONnZpU1ZiSW50Q3hvS0JQVTl3cGtLRVNjOXdKdTd4MFBtYlRjUkRq?=
 =?utf-8?B?Vit1RUo5V2g2bm5GSjZVRU1pOEEwY1VqM3pYa05WUmZ4Ykc5elN4N01jY01V?=
 =?utf-8?B?dVlOeS9mcllVV285Q09IcXAyNUN3UVY1dUdPRXQ2ZEF6Ukt3NFBXZzJ4R28x?=
 =?utf-8?B?VHdWSGpYODRXOHNiQVY4bmh4YTMyVCtaWkVjQ0g4c0haRVZPNVZ5ajl5VW1M?=
 =?utf-8?B?VEVrbXlxZ0xvRGIxYnQzQUtlcGg0TC9nYnByN2JGMlpjTXJxMXR4NTNMYVZw?=
 =?utf-8?B?dFNLTG1TN3FTM1Z3eTV5dGRHdHlocWRmbVpmU0krcHRlUzBrUlBlaFcxb0I4?=
 =?utf-8?B?bm5iaEllbjVMU21leURZa1cwMSt2V2laM0tEdlc1N3pXWFRmUDJoUzh2eWs5?=
 =?utf-8?B?K0ROYzdmbjNWYUxjSC9mbWpmQTQ2a0ZSUjBib3BOSUY4N3JRb0JSeGRtV1JF?=
 =?utf-8?B?YTRmbHhTcDRMRVpyMTJDYVBmS2lvQ2pGbUZKNE1WUTljbnNPdlZEa3N0ZThl?=
 =?utf-8?B?bVFxaDN4NFNlckhDb3ZSOXl6M25YbGlMbHJYNFNHVEFQU0w1elZkVlJyQUlv?=
 =?utf-8?B?dndlbWIwaFV2Z2FpU3JscllYVXZOQjZnOFZmWkZjMlF1ajIrVm8zZmxzMThR?=
 =?utf-8?B?WElPSEV6MFdDcGVBeXhSTzhPQ3dzSm42TWhJR0NmbzUyczNQRGdaNzNsaENh?=
 =?utf-8?B?c3Fxb2ZMSjhYVlpNdTV1Q1FucFhJU2NYaTJDZjFoU05tcy9yMkNSMlgzNFVq?=
 =?utf-8?B?Vmg3WFN4bUVmeURua2hBR2x6MHB3WjVYMkdSTzd4QWtWc1AxWEI0OW45SGZQ?=
 =?utf-8?B?R040RnNCU2V6elBWZVdtL3lubHoybzk2S2xKOVo1emNuaXZLQit6aEFPTXM4?=
 =?utf-8?B?eGJzd1VqTFpBWG1zL3JUcVgyUE85dURvMVo5S0JUMmYyeHZ5QnUvQVF6MG1s?=
 =?utf-8?B?TmJpT24vWDEvaXFjeFJ0OHBoYW5IMkJzd3UxY3lBZUg4RUloTWZHQnZjd3ZF?=
 =?utf-8?B?RjdDL1I4a00xOWo1MktCSVVManhDTTZncFFLQk5NT015cjdFbjBWZEtab1NT?=
 =?utf-8?B?WEZmZ2NuWEdkOGNPR2pQMGhRdHlTNDI1MEltTmVabXEvbE8vMWxJVDl3aEM2?=
 =?utf-8?B?a29YOWpoSm9ZbG12bk9vSGxVMTEzUGFpTkZrVVF1TFp0R3VZUEQ4dDhYYTZw?=
 =?utf-8?B?UzJncnRpRUVGdkQ4ZDlXZFlYdWdBT3VhZmQxSFE0RXBLQ3VlQVJDbkxkOVJw?=
 =?utf-8?B?Qm5UbTcvNHllcVZVSmJiUDRZdXN6ODRieSs4TmtQMFlmTnpwalk4RGRTbGRm?=
 =?utf-8?B?MUtxaEswZnF4Y3BsUi9HdXltMUhSTkpRcFUwVUU5bk1JQ1Y3ZERSaXZ2RTRs?=
 =?utf-8?B?ekphNVl1RjZ4a0pIU2VZYndtWE1GcXlmUks3RFpLUlJPZFF4dXVsRm9LMm5s?=
 =?utf-8?B?azJxSm5hSDJObmlQQWtLeFZkRmZPa0Q2UEs5bHBld2piejRwZ2tXYnZKZk0y?=
 =?utf-8?B?ZXlBMEtUUVd0b0kzN2NVQ2cyUmFWbERxR2daRmNYT3IyeEkvblJsTjZtVlQz?=
 =?utf-8?B?ZE8xcnB2OVYyK3hham50RXZuQ1JHeTVNdmhGVDFTOTUrMjNmM3JwcTJNR2ZY?=
 =?utf-8?B?UDIyMjljNnQ5b0VQSUNjL1ZSeVhNWXA4UWxPWU1WQW45M1BLRUJ0NzNHcVFN?=
 =?utf-8?B?ckxDWG9Rb2xvclhZUitkeGtzTW1qdWVzWER6dGhkT2dYTVd4SHc3N0lIajY4?=
 =?utf-8?B?U0xsRFlrR25sTXRjOExzTmJQT0RvNDRsYVBrNmhBSGNVQzhnS25vajVmZjRw?=
 =?utf-8?B?ZzVUMm1hcm5qZGQrZDdwUU9kWDQrMXZiUjdldmJKOWV3QWJkVkZPdElidCtY?=
 =?utf-8?Q?MHfParZJtK0VVuXqg4sGfUsgWP7/9ATNtH8RKj2tNNwJw?=
X-MS-Exchange-AntiSpam-MessageData-1: Yeh75duadBzh+A==
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: bd163a20-0d74-4817-955d-08de6ff7e850
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7249.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:46:07.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPnMh1cuopXC+kAbobg1Nn0D/AWt6B8WELCsyVOV2ZrxT8MYwifsVMeRhLVRP+qRO1pHtjterLjyO7EJSLw/tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11785

Hi,

On 2/19/26 14:01, Ian Ray wrote:
> INA234 is register compatible to INA226 (excepting manufacturer and die
> or device id registers) but has different scaling.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>

I can indeed find `power_lsb_factor = 32` in an earlier datasheet, dated 
2021... Perhaps the TI folks also got confused about the whole "shift 
down the lower 4 bits" thing... Well, with the caveat that I don't have 
the part, so I can't test it myself:

Reviewed-by: Bence Csókás <bence98@sch.bme.hu>

Bence
