Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2132.outbound.protection.outlook.com [40.107.215.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45382D51C
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Oct 2024 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730168546; cv=fail; b=GCqcxlmdtL9bKvrs3fJi9ifGc94JxDqnsU4Hfb22t4SEG8uPS5msp/7ogheBNSlJW3QMQ609H5Y02Kpn4alFpbbW7bebsTux5ksuUPhZLPC1dDVLghH0k7Xw91Fq1E/0c0Z2qFxhowvQI3nGs3g42VY3DMCYVvEBqq5unRlvItI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730168546; c=relaxed/simple;
	bh=kMdhtrzXix/Lx7fLUzusGzZlFrDqT8huXn2dGQMYQNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HrKoDoEmCYWgpNLCtfrDtHWQiNQVM9p5+R9vCHMvDHXwxf2eNFaX/bndMmRjnf/H7Gdj3fhA471BcCvSiv6loXbnBzCDbvJWQRmDeAkjW/PLaiC8KVeEfEBzV1PDVYUsIFWs5XgOcJoZtbXzhRk65lOi3whYuyQRvgLZ2rQOHVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=UD0+SUG+; arc=fail smtp.client-ip=40.107.215.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="UD0+SUG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTYD3H3FE6z/pz/Tl07qLFOhy4K8Rx26hSycJwkR+yAl8bUwnRkNPEzGq+CwvCYjlq0ezOmx0X23c/2I1wJd2Tt+rlElwFbrgGwwkGdFLK4BqW9D7DoegXKd/7lN5hAClrZnThF/y8/r27x+Rl3JKaV0RPkRCTeaA8+LqDpdSq/1YFM42wj8KLD1Ww+gkaJSkBnkqW99cVOCW++YBO/wD9URTo70sbvXOBrL0YV5+95ygSYDhIzTNl1l+7ApWSoODMj4XUKTASShh4CVSTd89FDRfhjt5rBkhbftkBmAEdpQ+8GZ+kcLVSFQsd0U2hHPI83ncltGKquX2KB35vZrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMdhtrzXix/Lx7fLUzusGzZlFrDqT8huXn2dGQMYQNk=;
 b=x9WI0TL3EwgvumMI8wqAi1tPFXQ/cCfKZ8PWyU3J4alqAE8NwEcWWCyZ42RPOkYvJdOJ6WDk4LXJ1SVbhIXJ5gRedi+RROIUaOBGqXTIt3a2WtQXGYximZJdkEdcIUL3kkOxTQisBzCoIKH29HofEnQX8RrGk4lT5PDKqdZFp1nNEocXfWMLf58c9B8e9VUxxDVBQYhuqYqYAFD4Z6Sw4LMeX8i9dBT2rm/iklx9FIm33Sf+pf+e/osY6ucnNJeCcP379Dxam1kaSom2unE3UpC1Zn+Gx4HX8sp1L5rquSH9aegrmUU7t/+wY1uEmSiiI2mHsYzPsHq7mILuyC4fTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMdhtrzXix/Lx7fLUzusGzZlFrDqT8huXn2dGQMYQNk=;
 b=UD0+SUG+N4N77wKPOnZVg6bK3NKvk/XLTw05ZzhnAma1t7AwU8TBQDWkPGRhXdYHWU2kdo/cYOFwKAyU87KbdMNnLrTtW77xHljHrvunG0opfd6r2QXJG1HVpMf0XM6QpeiGS7Zv0KJ/1csIFxpsiQSGfyU3F4/OvW2A1c/+zd6BhCTPBrkpPPO24VQKDdQOTDrQKCti9Dyd++TZiOkgpUm0mDg1BTrxXHGw535EZWl6UsX34kkXmXdAF+ThHl4FCXIod9LEf48bHNJFwgqjitv+jr1k9EOBfxbDlEb4zIc5z0V8pMItTc5WdUkScTeBppKfULN7Zk5cKqJlEcykpw==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by PUZPR06MB5953.apcprd06.prod.outlook.com (2603:1096:301:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.15; Tue, 29 Oct
 2024 02:22:17 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%7]) with mapi id 15.20.8093.014; Tue, 29 Oct 2024
 02:22:17 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
Thread-Topic: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
Thread-Index: AQHXsCOe2FNL8sJbDk+9evk0Fc7dCqvN+eGAgeQSdQCE6LbGbYAE2PuAgARWGXM=
Date: Tue, 29 Oct 2024 02:22:16 +0000
Message-ID:
 <OSQPR06MB7252361EE32447129E5E1EC48B4B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20210923023448.4190-1-akinobu.mita@gmail.com>
 <20211011143421.GA2374570@roeck-us.net>
 <D056E665-7386-42E0-8A16-383B66FA3179@aspeedtech.com>
 <OSQPR06MB7252105381A0A3E8E7B80F6F8B4D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAC5umyh8QXkUnqJFs4TK5YpvjSB7tJV3pFGv8ChsCbDfDS4zFA@mail.gmail.com>
In-Reply-To:
 <CAC5umyh8QXkUnqJFs4TK5YpvjSB7tJV3pFGv8ChsCbDfDS4zFA@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|PUZPR06MB5953:EE_
x-ms-office365-filtering-correlation-id: b4aea41e-5a65-45e5-6434-08dcf7c08230
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?z0kUPPGEUs9k98A3JD3rYH9x+wM5YPif7nJEBZIiMUHLBwXhBZSlYskspJ?=
 =?iso-8859-1?Q?03zwVWCwlYCLFtfmUAvXW/0IE6U6DVUXG2by7ptbFQAwspnGf9QEN0eGrY?=
 =?iso-8859-1?Q?OE5k4EerQtlPyTGSJP6AvnuZsYzjzz+tMKef2Ldr9vkrytojryrP2mzeV7?=
 =?iso-8859-1?Q?RIXlK3kaZGfPb2BQEsxSlKUJcEBGd2oHccplqRs4zE5+QoaUSnHR+8817B?=
 =?iso-8859-1?Q?HKxtUdu2Jq04wbSY4mntIsqGLrnKRY95NnPVIxQSVZ3OBbqWhUzKVOxXOo?=
 =?iso-8859-1?Q?TX4Fw+8bcdlMhUCSwteO+IKomocirWXEMbP/AMZyast8MAZ/8nd1JBV0qD?=
 =?iso-8859-1?Q?GtB4Qp/NC4HWijWcMS2zXHZldE++0HcL6a82g7THxIKHoLzmXg3Iibfwtg?=
 =?iso-8859-1?Q?IEFjQSdPMnEpkPzT8EjDgM2qgp3wEVsdwbGUIHMH0SgrOwrKx+rMGEUr6n?=
 =?iso-8859-1?Q?Exng2K3yaKLvDcX7NRNiLHpe8tcOaVEIiZue6Q/RGaxUJtGhppAgqgMm2R?=
 =?iso-8859-1?Q?3kGi/my24YlBVhkI6x491Z9n1fazuCadYKp3E2mY1cfawqmgrCbgfRSYoh?=
 =?iso-8859-1?Q?6lzOHebn22HpJGyt9KCkk6DzBYBW/y9Gma93FeyxTX1Dt5mQrZE7rcPlSm?=
 =?iso-8859-1?Q?JTJ7oPLM1ePXu32DBLIt7jmUfSxPs/NMnsmLfOLz8+g/E8VyLw2gmaxo99?=
 =?iso-8859-1?Q?4p3WBZc7mjOQKMZLhCNWYC8aDgXgtkcW4ZsIrGXakrEdliFI8TSb4RC+9P?=
 =?iso-8859-1?Q?LG2UNYYd+83OicdSG7+4+wWhgcmXuUyz1y3LiqtopSomTWsqViVytoRiYl?=
 =?iso-8859-1?Q?MPXTjD9aU46vPhv0gNnm+VPnEuzCqAqoai83uAlWaf+hDWIBstagNwBIor?=
 =?iso-8859-1?Q?tMsp/o1GoUCawA0Kpvg/xFBNohIweXk/y9EM1QkCtFYzhdyVylpIrBMGaP?=
 =?iso-8859-1?Q?al+mF0WNfH5e99p6AiGxf9JrXvMMJifzcW3M+PwOE8iPl0EbMecXplulEe?=
 =?iso-8859-1?Q?jSLmJk8K6EpDy1rdueAzSAg0uZVz74ND1nbqVPYwqfSZnUwYaIProEyLeJ?=
 =?iso-8859-1?Q?v9u4Vh0wF4uClKBlLavx2GmW+D1yZ8D5Yd0wn+ye7T8FgiiiZDMhOQLA3s?=
 =?iso-8859-1?Q?VhbS9yD6O72sHOyNGqS5oU1lpW7G6rin6Ff2adFcbq2dNAcFnoqhIiSSJc?=
 =?iso-8859-1?Q?KlJNoqNx7oQ4AGvQWT4b7QKujO9viHH+R2fdncZ2Gz+rpnsO0qlxvRyuvb?=
 =?iso-8859-1?Q?ekl9UnnxxWkg2D0Fm89pa4lPuJpQO2t0llMUBqeYuQEZ6xcw7bWDZExMaa?=
 =?iso-8859-1?Q?OpxTg+yfoQCbNPcxUEvgAauRoMU+p0qfNopor4h2FzAGjb+qywCUheBW9X?=
 =?iso-8859-1?Q?PVGSd0IdmeOo+3mhNr/u9XpEailYT0DOkFqXcQAyNBXVkiW37gHak=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yFXhKbscBWrjOSc3tUaR/2tUHqNAgAcupPreJ9BSghRGOHkLgpxjtsZxGn?=
 =?iso-8859-1?Q?N5iUIGzzUxPAmZ3vVRerFj0jPyXqXV9YP4TZhO3r0ZmUsv7mcJwRZrJsaK?=
 =?iso-8859-1?Q?thjsinRyj60T+zF6jShyAPQKRKGxEIqHJCwpUV+bqw/dyb93SvpB94X55H?=
 =?iso-8859-1?Q?wtTs7x3TN8++dtYrDIFl2Cn0l3G7dEL5HA0A+zdcb5Fb7BSk2Ltfb3fGHN?=
 =?iso-8859-1?Q?ik17mDx7mNw8WgaF/W4NHjITjRueSNHB/23tOrMNzuIGlC6rxLEqPMsVMr?=
 =?iso-8859-1?Q?8iUaPB/IyGR8BmjSH8jACVA992mZoOfxD4vN6r4KHRSEloVxwNETL9Rkl3?=
 =?iso-8859-1?Q?GjJcbIRQCtxigB4mmmSWBxdjbHrUIHWjmRzxwAp94JHhEUTwz1krtJ0qkn?=
 =?iso-8859-1?Q?b8FhaEx7TKBta5mnSwRiotNwS4WBWQD0bCd+/IKHsfuqr1ItKf//KH30EF?=
 =?iso-8859-1?Q?6iYh+tIsSIHe4AexZjFoVaFsvTqBWSjW+jfdyw4HBkMSfdyvZDVnD/n0XO?=
 =?iso-8859-1?Q?mDtQBOasYhaUSjGl2kcc6JXU9uR+vLNbMxwQgZEzaWt+pu0RvoW8rOZ7qF?=
 =?iso-8859-1?Q?XtKwYrwH1GYDjT/Q8vy9RjIt332Nbrll6F5LiNi7JgFWjM4n0E+KUGq0q1?=
 =?iso-8859-1?Q?NS9ti9axQh/BdZGTR/hcrGa4hAf3MlQ5eKcEXhSXrASju93fbCweAOzXzd?=
 =?iso-8859-1?Q?05u+GZ/8tHGWNCdFt9z7zneQnsI+GcJo83IoOcnSHV+K1twFqdDdEHfceH?=
 =?iso-8859-1?Q?SXmuxinTpRzJR6m9CjgXlKAmUk9rtEvp7v+ja10zVFWcpxtJbi3TGCdXNM?=
 =?iso-8859-1?Q?VGLCQXSqMpfPovlDnQDgBV4SmYU+RTyMik7kKjEKDqI80h+v5D7H2P8hUW?=
 =?iso-8859-1?Q?xFadJHbkSYHJiBgcvquDcTqGsvEoxe6YGzzf12mkh8A2WPZpB7lGm7Xt8Y?=
 =?iso-8859-1?Q?pLCKDENG3OuuyswgBEjU59EmEPyk+vNDKiw5GlGrTLqObA5ZK4PoNGz6yp?=
 =?iso-8859-1?Q?0eRF5Pkvl86hy56BqnTV59b8TlCE+ab+cRcQHPhGXTPouvEBGvJ5AVqTQn?=
 =?iso-8859-1?Q?L+75LCFTEEbPZMv7H/FHarycJnAf6guz508tvTI8yGVlpA33jdiO9bGTgj?=
 =?iso-8859-1?Q?2QIZKp/7gY8cI6YvGt1uchZCMfSwmIwDLUl5du19jcVufZ1N1ByORinQ+x?=
 =?iso-8859-1?Q?ejPXB1G2B7oiBgcCUDOJH6YEMrccjxT+CdTzUpb4wfmbk17352tsYAV9e5?=
 =?iso-8859-1?Q?Q+ODgdkYgq++/MiaLkAHPp6kPF+F28MRjIhPg4GYKXZwy90FzlHgi2AQKY?=
 =?iso-8859-1?Q?ur9E9Vag7N/uGfZ8IH/QQiat23s5a/xnHpclhb7YB1g2dvel6eCK5BuimY?=
 =?iso-8859-1?Q?jMRj19LZWUQCc+jFLjXh1pkNxRiNQj18cpx00grD9h5oCZiE6PgHk6NNoc?=
 =?iso-8859-1?Q?xrPi3+jSW6U6hRl6y/+Y4vCe0u+KicrDHItFYapfmRqirpU76AjMoXx//i?=
 =?iso-8859-1?Q?WjQx3aWoiRC1R7AwZwQ9nfaV72T5NCIteEgUw0uHmTWJJfKvxGGkC1caZN?=
 =?iso-8859-1?Q?opmUr9B4qSPcBkdYcC/Y5kfgmrg9Ltx4EXnxfwrg03+yj6AQQccZZXpHBf?=
 =?iso-8859-1?Q?PhH9Eo0TUbva5vH5ZtPJkGoy09LXyS9gas?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4aea41e-5a65-45e5-6434-08dcf7c08230
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 02:22:16.9424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYFbnrhRnMh9BZaqUtmu8BnlCfXqHcOLoXvdyKBkH4d1BOo8wl6O7kSOfew1bK07OW+kLla0HayrPyoRlTp9w/3WCYzVoVBWgfn+9WQckbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5953

> I have updated and resubmitted these patches. I don't have the hardware t=
o test=0A=
> at the moment, so is it possible for you to test it?=0A=
=0A=
Okay, I will try the v2 patch and add the Tested-by.=0A=
=0A=
Thanks=0A=
