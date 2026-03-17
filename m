Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11020107.outbound.protection.outlook.com [52.101.169.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F62F356A03;
	Tue, 17 Mar 2026 04:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721303; cv=fail; b=prA1AoROx0QBOmNbElK515M+b0IuX4ThgcZdnGvzU6OeKPjtqw8sH9EjqjxTUEfsIYk1jZWrEWNNkBw7NmDsvLGwNvhSXle18e6EFaQOgzGF46GNgv+s/hCFQWeXMa9x2JPv+KBAWcy0HZC19KhAiDDBdZ5SHamX3T+NuaQmAvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721303; c=relaxed/simple;
	bh=Fgs2ouUWkNbpkoL87eGl9gVn1bNk/HFlfmCiLGSAAXU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XdS9mXTtQpUwH4L6IHzRvseIu3medgMkYwuo76ySixW8hgl/jdL80InHsEaG9FEih9a9yUNJfLKseUwRzoxNPkzmwac+p/e7x+Nmw4w5ChzjgTz1kUIaX2ZYAHJFr4jx7yO8dUKOFaaiUB9NhJwIlRNULolCTOP6TI3Yw1+6gMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=e26tLUok; arc=fail smtp.client-ip=52.101.169.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="e26tLUok"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQz0JGXUoeWvV20zaZIbwqO/QyYuKoZmr0SO/yBxZMX4HjjfQl3JBsO4lMfOCcSIlE7qoA8JNiWXyd7mEiXg89MC1FdaCoMDE7YJ+LajjpsN8xtmK+tR4mgRLuja2Q6idww+buBrZoJ1c20z1dnLq6xNWdnOtsj3X/cX1P2F7aUTxrtel/6Rcd/LsuqhoPWc9IqMfL8gldfuBtlw7V4JivbPa2hpikuyXqqUoh1r2zdOaibvl6O9PdQQ0P6twLwwdu4OACh6xom0un8DWP1tcd5ueuZNyfeHr6GIZrs0Rua9urMOKM2dJRvIjmnG1nWsNlfiKMNqUeNlBPjn2eeYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la95DVZZ+swxFONTSaixNQw8O0TF0RkD6xMTqWG88Yc=;
 b=yo2mDW9fDYhSiayBIsAI1vCY2a3UswEGOeeiMfqYYQMxId3trCIy9+GkzKgjKxpvgP0GH8mq3TjVNKsyVm8JIXHUeeoixFDaoOfkEInLf0YqjwawjA4fKNLn8oLvhyh3NWfMm6diIN+aAKxvPy1EqV5rtPmLqeDXun2LgOg/CXKIeFnZ1eZVNTalGsQUsgS41BcM3enuXWUfNXMMWMQrgyvYUPgTktRsqETKBTuPCtUYqe4I8uk+yhGMnbaE5vaEIsyxQudulf1VfWznWNCznM3R21PPMGhYGE41G4AxjHrofKtGzjSfYHYttJdiZ86wnFRWU3ojjqj5Qamg4yvt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la95DVZZ+swxFONTSaixNQw8O0TF0RkD6xMTqWG88Yc=;
 b=e26tLUokqI3S8ao/pYIJY+yiAditTsczTG05OVkV3CiDg/rQkOBr+SxRceHgXrdqVebu6ZfqfxtgI2vsK8oTYVFP62xRzCoSXjnvaOlhVsoTmXdocNgWpLkIfA3Pu+VI2L22fzc95qSASXqqQCpZ2oDmRj4eQDfdl2HZpmVVDQSTnl8I4qTFOfUdmWWPkThui78wi7lpaSMBJoff8nUeoCYdITyUUcIta52gSWl4OxQppcHqRt0jxPl4110NxS63Hl/e2GBfMw7lh8U6w41kQQGBPbEmfaROE3JcdULSke6OSutHt7LGmZocq049cstF+i2xLLeeNbmq0N4ThRxYCQ==
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
 by FR3P281MB1758.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 04:21:37 +0000
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c]) by FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c%5]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 04:21:37 +0000
From: Aureo Serrano <aureo.serrano@arctic.de>
To: =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
CC: Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Thread-Topic: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Thread-Index: AQHcsturmfE4I1kpGEmwRyayOo/BcLWsu5IAgAVpgQw=
Date: Tue, 17 Mar 2026 04:21:37 +0000
Message-ID:
 <FR6P281MB59004A7AB7FC97402E5897A8EF41A@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
References: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
 <20260313111955.36811-1-aureo.serrano@arctic.de>
 <a3c4d461-c2b7-451d-b140-6d759da6f30c@t-8ch.de>
In-Reply-To: <a3c4d461-c2b7-451d-b140-6d759da6f30c@t-8ch.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB5900:EE_|FR3P281MB1758:EE_
x-ms-office365-filtering-correlation-id: ad7b4fa6-fe9d-4c23-423f-08de83dcae87
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021|55112099003;
x-microsoft-antispam-message-info:
 xRx90JQCQGmOLa3N9LtQdPP/dtVuikLccIB1VJwuO/DACDVWiMiXzHU89bbwsTE/KqKZen6MSGex0tOvGqPpYaQ2Meq7e0vrq7bYhiZIvNJYGl5HBto9KKOhfhulgWhGAfC5/6Az+eYgz21eIkiLnTv5gbqG9+f8ajaXNfQJ0tdWYFZ0srdUJxaRrNVbqbkiuMdbW6P72RJvggVTMcPzCr4kMJA9vnfgWYlLze7EvIZTHJwiEofQuiXLFxDbZjtaDHLMvS9p2/Tg45vY05A8SxOkTebHNIH+mlKQWrQHhi0z4Lijz+5gfJeNSM3P5zERG5VZSnjYP+Ew0G9a8v5XKAOaMBNqNGtXEInuEUAX5eXL2OGyBIS8/h7nh0xpwaxkUrl0aRmnuacZCALjvJzhb6kW1C0l7D6efKPYRq/PlVPI+0WMgxb+S7rAAi3rGIXsrjjN+gU6A5g5XvoANb5700bZdQyAaIHuR6+AzZVt9dHb5XPC8tcv6MJ+uy9k/IXDimBjjBwqE6fGe0dPNtiX/1UI8Il30BNSRAz2eVOCftDjagAKDhuqNX0cjtDcfKtgRPwJiEI93J5Z0tB1OYwtZMWRMcfcWhDB6YX+lPDAHrszCABnpudXL2yubEBA83E8gRKmjSUSezpULs50KhBa7OKV9ULg2GedPdWq9usvZaJ6u6aQaQAyxvL03ptlr9l5svmhk3OglWTRHxXq/menb9kDVlkPff8VZ4jSVM0yjYa/PCeLczHMtgpzZSwTtsHWa1sd2TaCdkf+FJ5L9wo8OAAeI99m//wxt+NXMO0Sc1E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021)(55112099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zJtbeNjSEAGMXMEZp2iwmzaSnHD240NcMkljD2dp+tFwbeBeQOVD0IMYQo?=
 =?iso-8859-1?Q?jBqX/YXMPZRy77tUfMKpZXBM0LCr2Mz4rsSN9ho6Ku2uH2yLSDjmdkttlh?=
 =?iso-8859-1?Q?frlquT88gZ9IEueJld4aEP/9K/Tlm9re2vAxA0nGVymT1MeSSxYHtvss1B?=
 =?iso-8859-1?Q?XVuTvWYaK/knjQCSv3WEsQehU18NUmos/97uhnD/kAlx6ez2kWSEwOJc3Q?=
 =?iso-8859-1?Q?ZNsP4X74CN9McAeEVQH9fPXk6W5xdTrX/ZxaaosbOiDujbWItGqdXatpHY?=
 =?iso-8859-1?Q?DEW9ljgfEpBrQ1UCW6jsbKn2rNXyNdD6MdyOQy2gB0+MqEOYw9gS8u3dCI?=
 =?iso-8859-1?Q?GonAEUcokiP+QrpBwxcYcXCP6H5HhnrHphaEKjqR0nSQiAaFreoLUz/hn/?=
 =?iso-8859-1?Q?/EapfvKAbpjnv22HYZTJej3bJWvarF88ay4xcpmIfk53BwU4gi7B2w6gvs?=
 =?iso-8859-1?Q?mXQG83Sn5CfofVw44gYp7DZSt0EVpCE3XN9eORra82MDqkZpPQIoh27aKu?=
 =?iso-8859-1?Q?6fe6KbeI9nE5NbyjmhRQXcwjDOQi2k9lMwHZ+ZlKIHCSuDVyRLLVr4uQJD?=
 =?iso-8859-1?Q?n75j9pxazqN7A7VINxTfwgqlKfhsWhcRulagLeCk981HsX2zrEr9qRHuES?=
 =?iso-8859-1?Q?lSIl2x4Zh1oqy0URK+K68+IjkV65h4DoGHqH6U7K1ginZ2DUrw66kYU/hI?=
 =?iso-8859-1?Q?oAM7amiekdU0KVonmEZQ4Fip34Mj336v66QyYDKCXo/7ag9Lj72yQV1Czq?=
 =?iso-8859-1?Q?dL3GgCmSJDf5HWfPI1ULszgnRNqa5sKhlIH47/ix7YyGS58gzDfLp6vuz6?=
 =?iso-8859-1?Q?A6O+iDT3Za8I1hdVahpC2jdtXBWmcNjyzBJtcuvlwj0qo9d0A/jCrRifke?=
 =?iso-8859-1?Q?RvC4tbWOg5Xua7fDVzSZ/ehrQSwoGRix8xtbgRAeq1RKUibR/4FoiiJY2z?=
 =?iso-8859-1?Q?6wvPbmTfD9DOvE5j3Vad4ynuq35d+KinbP3CrYUMU7SAUZ1s/pT3r57C5s?=
 =?iso-8859-1?Q?jo2R+qTe2QyAQJilgcuPV0ByusHxUjkuuIzl6HcrZNFlR1KeHv97SqOnaD?=
 =?iso-8859-1?Q?E7VSthj02LAAETuRnbHBPqU5ceLS8K43Sb+nfwHHe6uyNCnkJHzHqdAemq?=
 =?iso-8859-1?Q?5iMS7n2kt06/QdsyPIuaalnGYJSIx163RtQoXt/d/7U+nMNKaozMVhgVyb?=
 =?iso-8859-1?Q?St+nDjLwk9yzmEBJnG20JiUVw+J9HCBoYNwV1vNwsneK1FXCmmLegCiDkn?=
 =?iso-8859-1?Q?UYQVYFzZptY/WlKeU1Gr/QjSussP9QP0jzVX4sroaCafDKjiUsxvlJr3cH?=
 =?iso-8859-1?Q?7GCvDnJBVsHk8mAfQha+2WXmsF+sVuaByrjl0vdkQ8n7JdMR96p01x/qSs?=
 =?iso-8859-1?Q?73Flw1ZcIbfJ4OIdNuUk7nObGPvSvchFRHonTZCNzFd/QMlHuQ1xb1y+f8?=
 =?iso-8859-1?Q?gRJsxK9F4WKOj00Pjcdx0qPWa7YYMsPklsrWjWgDZQvh3WrkXDDwlw4Jl1?=
 =?iso-8859-1?Q?vkmT1gDwhV7Yj0Mg416CHgmzhvvMischeo/ed/7vjHK1U5EYhohex0ZiRY?=
 =?iso-8859-1?Q?IwrOqssRkrvRVHV/lSBmKu5NzjDvxxAnprkUnZk6xClROVTAKXuqQlpqK8?=
 =?iso-8859-1?Q?2jMcyZi05kSw7zcbbF1JqfSS0tLUbfUfpAN3ntJ28/grfnctCtccmZmIdj?=
 =?iso-8859-1?Q?GGmaxlbTgQx87Cci6BGqzLl+RWNwkAmRUomjAWcC5JzFcrOIRz/TUB5dQ8?=
 =?iso-8859-1?Q?6Ef+rs6SV1t8gjzL9iICz9xOaLpIACnWSCDLlNc/l77ZL75ao1qqk0TNG/?=
 =?iso-8859-1?Q?rXH2B8hC6Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7b4fa6-fe9d-4c23-423f-08de83dcae87
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 04:21:37.6744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2PwTmB27RU0p9TCfXva5sfzBLptfofwdAdzj/q5opRki312C23mIcbn+fC+q9/QzEFEU3Wr2RRFV6oJZSroouA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB1758

On 2026-03-13 18:41:38+0100, Thomas Wei=DFschuh wrote:=0A=
> > +#define ARCTIC_ACK_TIMEOUT_MS	1000=0A=
>=0A=
> One second is a very long time. How long does the device take in=0A=
> practice?=0A=
=0A=
Measured over 500 iterations: min ~32 ms, average ~100 ms, max ~563 ms.=0A=
The latency is a characteristic of the device firmware and cannot be=0A=
changed at this stage. I can change ARCTIC_ACK_TIMEOUT_MS from 1000 to 700.=
=0A=
Does it work for you?=0A=
=0A=
> > +	memset(buf + 11, 0, ARCTIC_REPORT_LEN - 11);=0A=
>=0A=
> The magic '11' should be '1 + ARCTIC_NUM_FANS'.=0A=
> Or even easier, use kzalloc() above.=0A=
=0A=
Since the buffer is now struct-embedded and devm_kzalloc zeroes the struct=
=0A=
at allocation, bytes 11-31 are always zero and the memset is not needed at=
=0A=
all. This also addresses the suggestion from another reviewer to use a=0A=
single once-allocated buffer rather than allocating per write. Hope that is=
=0A=
acceptable.=
