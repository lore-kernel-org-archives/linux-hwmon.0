Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19011029.outbound.protection.outlook.com [52.103.13.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A683859CE;
	Mon, 24 Aug 2026 18:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597088; cv=fail; b=eqI5+86JaaDeaZkKt5BaEq7i/gbbbY7Q20NQBigHqomZNNUXntw8/HCdJoogcx5obXoAHkIqU2YwCkbtlMf7H+sj/ssjdT39y6qK8wbWqt1zH9o6HcGGmXjbRpJsLWcT2eGk5TaPjCgKI08DdpmTPSAtHPcl1ky3tSdJY3SsfkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597088; c=relaxed/simple;
	bh=dwQIzIkM/SrMrPYD/ipp3hdq8ohmvQTB+uNFrl9YFkQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=isbyM2No05QN74cVC2G7cPWB1k0F3Bibv258PDFZMTMtFUU9kszwxMSJoUkXBo1fQfEL2vVrLru0xS3FyiiRfPgG3H1prW+JQi2g+adWjLkVU6LiA7TDU0ivNd/DuAIFPK3JgNYVmmUFjWiesBx2rZeqfYGdbRdbmQAeVutyK+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=PHrfHt/k; arc=fail smtp.client-ip=52.103.13.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="PHrfHt/k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhkbFV3NXxliyLzy9h4L86Vkm/ayuANm0JwEWdaEguRJbkD99QkFA6JrGoMxsSWKKriJRHZQvkFqXZmNZcTbtl8OlntD9Hmb7N3Z+BNlK0U/wpNKRYkjEZ6zcbDg39/36M9Jq0SNB+qaDHTd3+jZTF67YoD/FPMZG99W35J63gwY8d7zX9RKny0raS6Z0EjNNRy98Ti1+Fdxp4XIkIzHp7+ka2R1h2LCCT7lfvDCrAbsNIPp91h7FKpon5gCW7eegTzuU7xtYe9iXlvfLDmYTfd57d6zRWuGbdM8RB9NWuY7G0zh30sFZaaPI+qTa27dCtOYE7rOrdBZKeZGqIwi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLnmEGHlr2q+jIj57dctCE6UzEea+9bSwpTmNVX/kwM=;
 b=HIlARvqdY7YeBRRkmZUMv9u+3QYTuh5ARCOy7Wq1ZoL7o6J1iDBt+dMzR8myGXCvfVbkTql8d0X5jMv21ORzY+G/rh/8lNUr10u+X7mMX0BXJMwyTARpO74hhJ6+5aspuTgJdnc5obz68t6S9wi1IwzoM15sX/TZfTUtaICUdPzDerwqr7yNcJ17QbsZG5hL7jP/ixK9O9/3R2wVyeva6xB3N7/43QUhfXFfkX7AMnzR9FPN90OE2/9wj+rmOlNYxarnVCLqqmf2TIWE9ICHCO0UcFTMq7P2uaI20LGif1ZZd2tpKP2vYK57fF0DBE+zVUB3n0l5rFOHKKYy1Q70Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLnmEGHlr2q+jIj57dctCE6UzEea+9bSwpTmNVX/kwM=;
 b=PHrfHt/kPQiHZIHqkSpy/kJbxxwtoMleffe+1k23sXzEk/2ec93fn/yrzvqcZazklZ1rSEUiPzJ5RyzXJ+fMeovZds5Bzh8lMMduW0neaeSsgztKUTZ8z0JWB+H5/+8rYl/UxgMzTxMXU5kehgmd2ETrQU0+HP2tLH4k+LTJy0ndRjY4gWivQP08tgj/4nNTlp50+butdLAL/xQZB7EwcECEtDKSS3mc6BaWbFWwBHYDi/zDao1CLVtVDd+lyacC2NVdg+5TBz7SokebvDSQLsSBbLe7EmkkbZNTq+BCGnLl2lz+PRPbC598+b0iRCPHEb/HNhxQ6wEyACuNYWR+Ew==
Received: from PH0PR04MB7350.namprd04.prod.outlook.com (2603:10b6:510:b::8) by
 DM6PR04MB6762.namprd04.prod.outlook.com (2603:10b6:5:24f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.12; Mon, 24 Aug 2026 18:44:44 +0000
Received: from PH0PR04MB7350.namprd04.prod.outlook.com
 ([fe80::ba3d:e00f:6a0c:4134]) by PH0PR04MB7350.namprd04.prod.outlook.com
 ([fe80::ba3d:e00f:6a0c:4134%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:44:44 +0000
From: =?iso-2022-jp?B?GyRCaHEbKEIgGyRCeX5XMxsoQg==?=
	<Spector.Tsai@outlook.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Zev Weiss <zev@bewilderbeest.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] hwmon: (nct6775) Ignore 0xffff TSI temperature readings
Thread-Topic: [RFC PATCH] hwmon: (nct6775) Ignore 0xffff TSI temperature
 readings
Thread-Index: AQHdM/ihyKK3ixFam0iIE0xIMysS8A==
Date: Mon, 24 Aug 2026 18:44:43 +0000
Message-ID: <20260824184443.81887-1-Spector.Tsai@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7350:EE_|DM6PR04MB6762:EE_
x-ms-office365-filtering-correlation-id: 4e0e7c73-7b5e-4d95-498d-08df020fc3a3
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|19110799012|31061999003|39105399006|8060799015|8062599012|4140399003|25010399006|1474299035|38102599003|24021099003|37011999003|41001999006|20031999006|440099028|3412199025|102099032|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?c1hvZjZUc2trcEFqMGJaR1V5blNub1ZrVTFmdlJJcmh5aTJ0dDVjVGVW?=
 =?iso-2022-jp?B?eERuL2E1VS95dlhTc1MvOThTUVZabnpaQnJiOU1PTWpScjNxQlJWckJI?=
 =?iso-2022-jp?B?WEd5UitObjRRalRMbzl6cmNFMktOeGxHV1paTXQ4TC92amxMb2FNZVpR?=
 =?iso-2022-jp?B?eEJzbmxDQVVnN21CTUlIbGttQ0N4WUcxbm5RVWt1QnlvZnlxL0htVU5m?=
 =?iso-2022-jp?B?eWZxWGpweTByTEI1WVdmdnVhbk9xUmx3djJtbktSRkRnVEQ2MEZOSnlT?=
 =?iso-2022-jp?B?T3libERucldOMmxuOThpRXRiWWdJVjNBaXdmVWVhWU5XNHVBMmlJdWtY?=
 =?iso-2022-jp?B?UUo3UUVzSS9wRDJ6M2dsTWxpek55eWVMNCtNSVpJZHJsVWNSZ1VyRXhr?=
 =?iso-2022-jp?B?aXNCOC9NdWRkeHQ0b2trMVFhTk42OGphVmhPZmJKUGR6WFdKcm9GYWJW?=
 =?iso-2022-jp?B?Slp4Lzl0b2d4c1U2UWhmdzE2ZDZBMks1SzNQU0RIRUozOHZGOFFKclM4?=
 =?iso-2022-jp?B?TXFWejNNNEZ6Z0huTldveFhDOUtDZ1pvb002NVlRa096cVFsMi90WVRs?=
 =?iso-2022-jp?B?Lyt4UENHK2MrVGl6c0p6OVhmbTZHYjk5OVlNOXJVK2l6WXBuQ21TNllQ?=
 =?iso-2022-jp?B?MkxVcXAyb3hVUVlKL2tqZU5iS1NVUVpNejNkd1dydnF1b3k2SFg3RTBv?=
 =?iso-2022-jp?B?eXk0TTE5dmc0cDBveVpiWmlLZEhlRWVMaWFUN3loUDJNN2FQRWxMTm5O?=
 =?iso-2022-jp?B?RmN6cG9wNnhBRzZDenpZMFhCcmR6SStpYTBFdXIyY2NndWw1bnRDVHQw?=
 =?iso-2022-jp?B?YVBMcTNBQkRlZkx1cmNTQ1pmOFc1d2ozMERpcytjUEpUNnBvMU80dVlJ?=
 =?iso-2022-jp?B?aTJTUTV6QlcwYUlReU8reU4yRldGOStLN2dHYnIxTjRvUldieG5zYk9L?=
 =?iso-2022-jp?B?d0l2MU5UdnpIUDFvV0xLY09zd080QkFoRHVKbEhKNklDY25DU2hqbVhx?=
 =?iso-2022-jp?B?NndmOEw3THlBR3M2MjhlMDR5Tml6ZlhEaUVTa3VNZlhMbEZMM2hjbzRR?=
 =?iso-2022-jp?B?YTNjYVBsRlRZT1VaZ2FEU2x2YXZtcStyTnJMemNwVlNtSklSTXczd2lt?=
 =?iso-2022-jp?B?MnJEdTJjdTRBaktieEd4elUvMngxQTE3OTd5dkp3UE0xdnk3TEZSUUlR?=
 =?iso-2022-jp?B?aDBSZWdkMVlsK1BVOXRTRnorWHNVUlVDeDF6cDZOcHlLNmF0MWZxSnV5?=
 =?iso-2022-jp?B?N2xzdWpMNmErcjRiZUhzZ044cXp6ZmpZREhmeEtwTkNXQ3dDdno5ZEVY?=
 =?iso-2022-jp?B?VFgvUjYvOWJEMVFKcEQvVytwbmp6cVBmbTFBanhVQTBEcmJqVGtqenJ2?=
 =?iso-2022-jp?B?ZTkrN09xMDU3V1NHM1g5bW5lUWlHQ3FKWnlBOEp3SlZpczN0czlmQk4y?=
 =?iso-2022-jp?B?VnQ2UFduTmdzeWM3VXNHUXlyZ3ZWaWxlenA3cGdQeHpFeWNsaUdYajJU?=
 =?iso-2022-jp?B?Wk5EaldBeFVsNG9tVUtjMk9ZYjNIL0FRbFk4YXFTV0VKUEdNZ2VWNUhM?=
 =?iso-2022-jp?B?U1pwOWxPa3lQUXZWV3hobjMxQkVlMlBtTUQxZ2FERVZ0YUhKWDEwPQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?WUVuSENneHdzVWkxODZ3aVpkWXMyNm1DazFiQkZNMm4vc3Uwa1Z1WDlt?=
 =?iso-2022-jp?B?NDVPZVFXOU9IQVAvVTlSNEVuUzY3eG9FdjRJd05VMXdQZHpIcDZuTTAv?=
 =?iso-2022-jp?B?Uk0zMjk3dWNEL0ZxZkkwUnFvUmIzMG0vV1NpWWpCYlVCRFZadlhXSnFH?=
 =?iso-2022-jp?B?U1dIdTcvVW4wWm41cTBpLzIzUUVXSCtmWWtNbnltYmxHM1FCOXdnejds?=
 =?iso-2022-jp?B?eW1Md3FQUnZNMS9mRFYycUNhYkhRZEs1QlVRVHlidS9oSVV5TUVlZ0hZ?=
 =?iso-2022-jp?B?OTBZSExWbUhLdlJ2dS9EdVFTZzJOSzhYVkFYaDNNOFNZVFlWMm9YSkRt?=
 =?iso-2022-jp?B?SVBmcTBJS3Q2QjNpaE5GSVhDRDAzdi9nUjY5eTZsN2lsRU54RjVJbnNE?=
 =?iso-2022-jp?B?WlRpaCtKRlVPUk41UkFwWS8vdVhJdUdwNmNFS0IxQU0xemxJUGV6dk9I?=
 =?iso-2022-jp?B?dVhiNTdTdUh0bmVTNWh3cVRMUTltT2F0aE5jWW04VnZuVUVyb1FIMFZn?=
 =?iso-2022-jp?B?ak0yUXIwTDFEYzJERkxFREFTb1BtMExkTERNMU1KZE1UaGtkazVubkpn?=
 =?iso-2022-jp?B?dFNISzk3YVJuTUJlUkxqTzlMakwzU25hZHJOS0g0Sk5kSllOWXFhMXpG?=
 =?iso-2022-jp?B?ajhLMXhudmZGS3YwTWY4OWlEUE1tRk43UDM0T09iOE0rZ0toemg5cG9t?=
 =?iso-2022-jp?B?Qzk4TGJxbE96dlloYlBhRVpadE9uYTF0VEV5N25kcDdTZDJvT2lOK3du?=
 =?iso-2022-jp?B?c0YzRkdETlU3bFJGVWdxb0E5UDZPWlJuQ2w1aWxwcHhSUnV0NTNYVDFz?=
 =?iso-2022-jp?B?WVRGb3RSNUZucGJsUHVtWjM4MUZzUXBvd2RhNXFlQ3h2ZXo4V2tUdTc3?=
 =?iso-2022-jp?B?bEV1anNGblBEODYyWnJlUkh3L2JTaDVHVkl1VlV0elc4d3F1aWxJaTg0?=
 =?iso-2022-jp?B?UTgyMjFKaUFnekRLWS9kb2hiNEtDUGx2TzlXWjhsemI4N2d5NEFTQmhZ?=
 =?iso-2022-jp?B?SjM5WTBQYVJwU1V6c1hIY2szZEppSUl6VlowOFFRVzR5VkVKUzFhTVBT?=
 =?iso-2022-jp?B?dHR6SjB4UVpvdnZRY1dCUFRrMjJIZ2tpVDZ4cno4VjNuRXZLNWYxQy9I?=
 =?iso-2022-jp?B?OHVEVC9YZjJKV09KdHJRTWR6ajYwd0YvTXRPdTFYR3lORW9rUmdDS0xK?=
 =?iso-2022-jp?B?eS9tdDdPTDNvN3dyUlpTbjdVZFI4aG45R1RhdHBtUytRY3poQU5NTEda?=
 =?iso-2022-jp?B?OGdHL1lDWlpDRnRKNU1KTEoyR1NUWjRDbncwM0M4T0NqRy9sQTgyZzhw?=
 =?iso-2022-jp?B?Wjgya2xjNVUxMFhVTHFmOHBodHpFSVBSWTRNSkdxa0IwaUFkOVJ5U00z?=
 =?iso-2022-jp?B?ZFJHSmJpUnJjY1l6dFV5T1NMQXkzanQxeHVLelZOTEV3V0ZyYlpURUhv?=
 =?iso-2022-jp?B?ZDZGRVhJY3o0bTM5RFdjSXM5M0wyTkQwTXA3dFREenR3eDRWTjlyY1Fy?=
 =?iso-2022-jp?B?NzlqdEhKNmt4U2JtazB0M0JVNmhUWnJnejZYZ2Q0dzVZa3hPbU1OQXZQ?=
 =?iso-2022-jp?B?UG1PWjhxUDdqeEhBYTVXT0NSL2h3SVE0TXcvcGw5N3NtTEFXY1RaZi9F?=
 =?iso-2022-jp?B?Z1hhdU02NHJJMG5BNTNVMFh4cFVZY1UyaTB1OUpYWHBIM2FZUWI0N2FN?=
 =?iso-2022-jp?B?elVnaHIvQlQ0MjBDcHRrWWhOZ3g0ZGVNNnErRERHQlRKS3RTekNMeHJl?=
 =?iso-2022-jp?B?Y3R1MnBaRHpMbzJvZDFvOWswdnJmRG0rRUFqNm1FME1JdEYxRkhVSCtB?=
 =?iso-2022-jp?B?Z3BOUVlScXZBY1RyR1djWHhDS1pKQXlCMkx6NnZuTzF1djZkN1U3U0E0?=
 =?iso-2022-jp?B?bDV6bVRwdlJXZ2FzdkxiOFVSaVlJNUdzeTUzNlUvdTdlS3Nzd1llQlNn?=
 =?iso-2022-jp?B?MjkxbWYyU2NlWGprTU5pcTJZeXNyY0pEcVlIMkVNdUdHbWhDQjBINS9r?=
 =?iso-2022-jp?B?TjVDWkxNSE9nT2FXVlhVSE9YSlVHSQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7350.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0e7c73-7b5e-4d95-498d-08df020fc3a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 18:44:43.9322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6762

On an NCT6793D, unused TSI temperature channels can return 0xffff.=0A=
=0A=
The driver currently treats every non-zero TSI register value as an=0A=
active channel. This causes unused TSI channels to be exposed through=0A=
hwmon and results in bogus temperature readings of 3892313987=0A=
millidegrees Celsius.=0A=
=0A=
Treat 0xffff as an inactive TSI channel.=0A=
=0A=
With this change, the unused TSI channels are no longer exposed, while=0A=
TSI0 continues to report normally.=0A=
=0A=
Tested on an ASRock A320M-HDV R4.0 with an NCT6793D.=0A=
=0A=
Fixes: b68437ace4b8 ("hwmon: (nct6775) add support for TSI temperature regi=
sters")=0A=
Assisted-by: ChatGPT:GPT-5.6-Sol=0A=
Signed-off-by: Spector Tsai <Spector.Tsai@outlook.com>=0A=
---=0A=
 drivers/hwmon/nct6775-core.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c=0A=
index 759ea3d1286e..34e6a01aa4e4 100644=0A=
--- a/drivers/hwmon/nct6775-core.c=0A=
+++ b/drivers/hwmon/nct6775-core.c=0A=
@@ -4339,7 +4339,7 @@ int nct6775_probe(struct device *dev, struct nct6775_=
data *data,=0A=
 		err =3D nct6775_read_value(data, data->REG_TSI_TEMP[i], &tmp);=0A=
 		if (err)=0A=
 			return err;=0A=
-		if (tmp)=0A=
+		if (tmp && tmp !=3D 0xffff)=0A=
 			data->have_tsi_temp |=3D BIT(i);=0A=
 	}=0A=
 =0A=
-- =0A=
2.43.0=0A=
=0A=
