Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010022.outbound.protection.outlook.com [52.103.72.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E561F94F
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771570325; cv=fail; b=s9ht9TKjovcl39mKmbf1Wl4qYCnSd60YGOypFneEX5apLShmVT0NV5IfWLjN3mYO7QyG/HO/NPb9D63VX3uHwspkGHWtxPnKyYRJzKbVOPYvLTeoFLRHOFhYz80pDs7mxsvguaozyucHQMryXpF3lLeo0J38zAKQByuu8O5RBD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771570325; c=relaxed/simple;
	bh=jsG3IPbBtvRhB2Sv0fLy1K6PALh28V6BClLxsWVpy+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X5YN2428wiVn2LiasPtIhEAZGzaX4k71ucwiqO45azptyqiTEC1TMMEie6z3hPzIwLlccnA+QiyXtFbKDw3ARoLtLZE4fpwFtH+lH05qWTCLiODHgqOg/hNU0ImVc9Vc7Tyqe+sr7dKhytDaUywWGfqp/vyael59LNj0zg6jyK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Z+CEuozA; arc=fail smtp.client-ip=52.103.72.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Z+CEuozA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGApqF/gTTcAWRvmB30Zuhh4BSzMGBt6CAh5XkbOk7DjjuxCUr3VYx07p5P3g1oyBF6k9B6cnFxwVGALS6kHk7jKS2MS6GKEEEO1eQsNE8wjwQ/vuQCW0b6ucyGu2gpBsGtSIiVFpexYA4TFAOwAE00rPPrmE0tr4RqFfrKL8zgGEUQqJarifgC9FZXaXP8gL3Y7FSTRCXwhEDg/ZqYfoVXYOzlgvCVZj6xEe33F+crNY8BFjwnDl0xVf8eYqAT+lPzM1zAYSMEjdmk2CpuHxD+6FTYxFkdfutSM1laAel1+P9xSjEI7YGIZ+z3+tDp7+Whf6BviIRep0irLIPflBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsG3IPbBtvRhB2Sv0fLy1K6PALh28V6BClLxsWVpy+U=;
 b=uD3F69c+EUUW8vJfkoyOMnRDvJKXg34iN2I1UJFd1UBcfzfA1HCD2B7mGAzxiywz5iNOve2Mg+8vUtIZL2k1ozD4eAH64tfJSV7XDzA22NIV3R9npzf6gJk+vf1hdl80k0wb0dDRlwuExF452j6W2QeFmdFlbQYh9TndGwkUwCzH6xCFyBEvxvBgKawf8xh6v8tcZvd0W2aUBxmSZpvYlT8FtiCnQQs0tpSvL3UxbwdBhofTEn4Lsy1u7nqwzeJMHOZrDIBOABcpsSNvdivfjOniTJCATCY+zOSJk7PzH2WduLYrhwBwHtWjwzohER6l8MhYnkESv4Pd/HRXPj0PVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsG3IPbBtvRhB2Sv0fLy1K6PALh28V6BClLxsWVpy+U=;
 b=Z+CEuozAA+SD5Lm3E7ri8FQHw9uO2NT1O0v0YNlgxcVplJJaEff2OwYTFeAgbzBlsJxXzDJRZjRyQi5C3Ahz3hTMGr985xVK9RvnlEveRxs8jBG/SG2Rf87J47B0CiskUQz6fyJdqOsACGCt7ZMhByj1kCGU7gJq3g20qRAG/k9HwbHf8b6eE1zH/jqPo09YIzPhr5xjL5GduOFhktPKIhNVb4hWSyth2wKzmk7gHMzrRxGLaD2c2a8t3E6JNt6JjhykyZUQ5fJATfnDOFLA28SJxfzmLIJa063EpaOmMyddCMV5jhUnQwGQ8lNnmjOxq6hAYr3YPKJb8mAeyn8HYA==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by ME2PR01MB5668.ausprd01.prod.outlook.com (2603:10c6:220:d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 06:52:00 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:52:00 +0000
From: Junrui Luo <moonafterrain@outlook.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (ibmpex) fix use-after-free in high/low store
Thread-Topic: [PATCH] hwmon: (ibmpex) fix use-after-free in high/low store
Thread-Index: AQHci0CnBPO2bvK230iKXqaBX4fHLLV3gnWAgBPFMJs=
Date: Fri, 20 Feb 2026 06:52:00 +0000
Message-ID:
 <SYBPR01MB78811AF8731CF875C416C0F2AF68A@SYBPR01MB7881.ausprd01.prod.outlook.com>
References:
 <MEYPR01MB7886BE2F51BFE41875B74B60AFA0AMEYPR01MB7886!ausprd01!prod!outlook!com>
 <20260121095342.73e723cb@endymion>
 <112b794a-a735-4cfd-bb96-b251a4da733c@roeck-us.net>
In-Reply-To: <112b794a-a735-4cfd-bb96-b251a4da733c@roeck-us.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB7881:EE_|ME2PR01MB5668:EE_
x-ms-office365-filtering-correlation-id: cab9f34f-bcf6-4fa1-0625-08de704c8c02
x-ms-exchange-slblob-mailprops:
 02NmSoc12Dc6c3c4/rztiZGf6bH6e/ZCx3kq9i9JSbyXdvrlDt3SIJO+rtYgEcaqfA1hMYn0WcAoZhZHnYf/umyKxj5VUGRdaxmalOkvN2/5caHP3MDA66hr4OTsj8fwj0Qzyn1FNAszaZuCh4S+WRWkFKied7cQc3k1L1uC1F7ibHgG4hhGQgj4r7jrjs90wOJxA8CrPoM4w0bgZKVjy3qIkZuiNdReVpMf+pRUgC2ipNf5Z2scu4hlxQWnfMwQFpG/PcBceQo0KjTy7h+cryDmD//i7dvZjgrBorxyEiycjIKlDCjDaRSyImDWMBa/Ssb4sQZ9saVH+3aldjqakmHi7IX9fZcXss1GuyEvTsjwmAxTYuTvwI/X+Y4f93BBkwaXv4b93Kh2w095HBQsqq27p1GIDHb/eH9qhD6RA9+u3G/7oI7Cfq3kcWWTVD5etE5u06n5oqqMtnqTz1HesZSUy9LmcqP14spqN6L5UltNB24DyKuZs3tf0h+GzBtvK+dSRRfInJDrJCq6nmHHJ0oI8epF9Q18mpgzxG14ufYLhbCElMEd2r2vE9974/0oRFugas3fBeF61AKMsNfamAOkdErF61wqkJiVs6aJoIesYP10/mgS09po0AvQMbM0RZF5GWRHW3JGqn2SFbHdhsWCsoMcQKXBy1782ktVw4u0+r5lsljAbu7n7KI78yZ+5LqtSvKI9v9ZaIRSC/zLftCEq+ELryBehmFerAc1mv5gY9znbMGyU2WvnAbsz+1c
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|461199028|31061999003|19110799012|8060799015|15030799006|15080799012|8062599012|40105399003|440099028|3412199025|102099032|12091999003|11031999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BXuJusmI03bXao3mYu4MwUQuquqVMQ8H/HH4QCFJ3XK4vjFLZFyECf/pPN?=
 =?iso-8859-1?Q?LcWtCU29wizRo7yOT6bjeAM/mNI5V77I9em4SCQ7oDKROAfvm2iD9uaHsv?=
 =?iso-8859-1?Q?BxIsbfwCgGQwGiPyoNp2anOLoCc4U3kIGhXFAICAHg+28Qx3P5pwLjsOfZ?=
 =?iso-8859-1?Q?Ngc/MMJ2cwvXSvHqhCW6IA+SDWRuWnLUSJdb3rYQonm0lgVFChl16M8TFW?=
 =?iso-8859-1?Q?tNSMDxuZ0AATRUZNjxM7uzwhkjMQRhyx2WTccSRAX7oJVxcfp0Bxegj4Ho?=
 =?iso-8859-1?Q?Sg6RaLrYXe84/5Y9M4Zi7pvXHFhnEESNYHERF347cHLsX55Q3qRvKIKCF6?=
 =?iso-8859-1?Q?kZuIgTKIBgUnu8GwoMneICEZYsKABMqe8tukXOkptPk+FIy9ydBcF0HHNW?=
 =?iso-8859-1?Q?vKr5hEtXQ9NVUeqV6/N+ydQ+k8ar2T1R/P55R1YC1m3hSJV5m9AQ0cV0Wn?=
 =?iso-8859-1?Q?0PTF9x51R5el07IWhe+OGZWK8bAmTQep5IqNvNBPDY9zSeuGCNazTD+TVx?=
 =?iso-8859-1?Q?4/BJImLJNuwmLZPjxDbKqAe49XKvBi3Sx02PMFR6nudAIlh4zNWsBWKleX?=
 =?iso-8859-1?Q?e8GwUKn/K6CI3Q3nvrakTkjo8Z9mnOs8O3MghdmYUdbhk3Icps0yKRzszx?=
 =?iso-8859-1?Q?o3Hdy56929Xwbld4IuNhF54Uc475wtIh7jnRpcZ4OxQNj+3HfavWuX4LWW?=
 =?iso-8859-1?Q?QvjCjcrACKq6+Q0uEltS9GEELBxeZxTM9Ve8Z26A9hpEskjamcxr+7ge1R?=
 =?iso-8859-1?Q?Flm1qyhkBgXZBDHe5V8DFrvONHzRWxtT4v1INTStsmRn/1EMdg053JjH5h?=
 =?iso-8859-1?Q?SYM9x1QGssi4oQC49yOd8p+g8xzpyZV4rd4YlftIFIh1V0mVO7YBpEp05j?=
 =?iso-8859-1?Q?EjPS5AN4btzjP/PTBhUVmUXB2D4THfteOr4HrvzODJt2PJ0F4YkXp7Plpl?=
 =?iso-8859-1?Q?gMj4n2XE6wg65aS8xBL3s5+EfawGjpOtVDUUaMu8aeSqL6WXGqhUwiZCaw?=
 =?iso-8859-1?Q?6Nes4e9Vj7nVuIeQWpehE50G9RDvQoNv6uJ/NdT5Dd7cijz8A/ntnFuFAO?=
 =?iso-8859-1?Q?dnH7ficVZU+gultuHv3xvXMQT+ktQXZKn0DPPQ9H+oL4qmTmOZz6eNenbZ?=
 =?iso-8859-1?Q?+MQAZOBVmfGQMP8fCCZUSf05mlRVjRjdjchK13QRh91CWAAFHYUALGLGOA?=
 =?iso-8859-1?Q?4kkHQrmj6QshD1CJ3lAZ8X6j4DnXEoUtzVWkPpr9QQLDnPlYKuoe2a1ejL?=
 =?iso-8859-1?Q?wt6Hboz/SdVuq4Fwhid4XrDVIZYlDhMSnJJOvbZrxrxAiHIFGM5sW7jhHg?=
 =?iso-8859-1?Q?r/gBOmenLEuhsQBhVw4TGHrJ0Q=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KbZCDox/z8XUsmwU4stoUM/PFP7ggwmVZWZWNu+s1M2ICQr0Q2iZXwc+Sp?=
 =?iso-8859-1?Q?m5wKQuIwrmetSi+V+wJMI4j5LwIe20aQNoQDAgJTgBfueURKmYBBLC59f7?=
 =?iso-8859-1?Q?UlV5Ti4ceTwlB9+gDGGduE/0dUJnES+hf/ADXDxcRlvY87zHxzrLvXIfY4?=
 =?iso-8859-1?Q?g+fSHxd+rlNPxHxxcrUXfcGl9HoPNdz7HwNZjf8kc2/AsbfV54AerrxVbo?=
 =?iso-8859-1?Q?EycQooK33DzG/Z4KTQCFicpUoVuF15PB2DFE1t4nDNV0NdvF6xUX+jLfX6?=
 =?iso-8859-1?Q?dCjtywPPwaTD/m4ZILeI2TU0BTenHzZ6uZ+ASimJeGqx3lNBfkvGup8Lce?=
 =?iso-8859-1?Q?F2HFmFaPlMD4uMbuAbdCYKuGUGDCp4lH8MkYR/w6FM+gdgPN2UHhzsPffW?=
 =?iso-8859-1?Q?0zqxakcyAO4kvy2cjtccyD8hfA5ePexw4592+T7jywk9A2JkXtttm5g4HL?=
 =?iso-8859-1?Q?bUAHvsJsnIAfBHTyIpVWRY8PHqVuWYMoe0Z/R4LdHAIDyqoP3Nbi1k3mHr?=
 =?iso-8859-1?Q?mcpUzoWpIfdkkaZgYXAakTSd62IVlOWDYxWV8GGWtD1eZAXwDilOFC5+Mh?=
 =?iso-8859-1?Q?wPr+dKLSY90VcBdOxGPHU9L5eI7Xbtv34u6pmBfpMoEUUEVRbsnlU8ld5a?=
 =?iso-8859-1?Q?sDap+29i7BlTCa6Q/qbcMgEQWPM4jSOgNuaRBoiY6QkQjQj/oVvySEYyzh?=
 =?iso-8859-1?Q?+jmqx7Hsb7fDwaA8VXotHBHkmEW5QZWNuKZNfM7lby9Pfti9EcOXnRhjHX?=
 =?iso-8859-1?Q?fO9icLC42JemHY3echnhf3AM5sL4qp9oC03zp3IiWyrOi/ApnKXgkkmwc+?=
 =?iso-8859-1?Q?wYjw0uFfffbbR8v9eobGjfcNToBNieFXKLyzrFMRQe8e+QDhgPbL1dFJNV?=
 =?iso-8859-1?Q?2ZwV+sY9tHc6l4CkTAoHR5OH2G8xSwNyKNXb6GArX3t0jvC1edoxii2W4D?=
 =?iso-8859-1?Q?lmEpHfBbN+IZCIRfzRI6uZLcVVZnZgMCM6x7EgoI7A5jHO/zpX2xCaquGw?=
 =?iso-8859-1?Q?6F+cEtRt2AeVEVD6W6HimlAZsbq8vv58syd84Zx6U0jtVsIX0GfbV4gyXy?=
 =?iso-8859-1?Q?6R72URXrTy+DBuJoE0Tr/Ocdus2sdk9dSOSyz4Fl67ozi4NzGyeGJrFH/y?=
 =?iso-8859-1?Q?aW1Ydi7f0//j3yIpobmhulwNRIntMJ1Q1lHsI5W1ZI9AWM3PpQ1GzNdNHK?=
 =?iso-8859-1?Q?8fH3B5gUt7NQyDFFAnFrdPIskDxEz5g8QpU+Ch1EKk4DXll9SoTn9+0voc?=
 =?iso-8859-1?Q?RSHJlbVeEoGmxoBDCiDTRQWUmR8I2V+Hsj2XsqHS7As3VAf376RbnDpxCT?=
 =?iso-8859-1?Q?71oLuyWiAZQ4nBjUfwpGNKrtobplCzyeepOq3AOBVwqBVmucT6h+vj/Jce?=
 =?iso-8859-1?Q?yQqgQuBpktk+6RTFLqpSV8fls1j8i/57o5TLs4RMFBz/qz4AL98xK+Htfg?=
 =?iso-8859-1?Q?kHjE+V/Op+uitnYd?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cab9f34f-bcf6-4fa1-0625-08de704c8c02
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 06:52:00.1770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB5668

On Sat, 7 Feb 2026 at 08:11:57 -0800, Guenter Roeck wrote:=0A=
> Based on that, I am going to revert the patch. Feel free to resubmit with=
 a=0A=
> complete fix but show that the fix is both needed and complete.=0A=
=0A=
Thank you Jean and Guenter for the thorough review.=0A=
=0A=
After digging into the sysfs/kernfs internals, I now understand that=0A=
the original code was already safe. device_remove_file() calls into=0A=
kernfs_drain(), which does a blocking wait_event() until all active=0A=
sysfs callbacks (show/store) have completed.=0A=
=0A=
My patch was unnecessary and actively harmful by moving dev_set_drvdata()=
=0A=
before device_remove_file(), it introduced a window where ibmpex_show_senso=
r()=0A=
could get a NULL pointer from dev_get_drvdata().=0A=
=0A=
I agree with the revert.=0A=
=0A=
Sorry for the noise, and thank you both for catching this.=0A=
=0A=
Thanks,=0A=
Junrui Luo=0A=
