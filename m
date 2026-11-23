Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434135;
	b=hNAp6SETfK0EbsyF9J2kzgH1aFQXvfIrC+83vxkARhq1L8Qt0tSl/EZ7Z1hGTWZih5WD
	 8HQ8TUJ+nhruSKlkojVgMrCYBl3/ZuoRqt+oLLqeJ50UoG++IomdG/k7WQeCo+s4KyKJy
	 eYcODX8UvlLUP1REPwrPrPXJgUxMkfQ9WAeWAdZ36nP0Y90t3lrEqX9JvULoI68GGYcDf
	 CTdM2N5veXEMYa2lz4I6obvKGzYOpl3PyOlba0jg0W+gZxuVYOuj11V+HtBQuXPwLSEoA
	 9uSKLPqjfdxhiVBf09QryyuvJkPK99uy9yxX+Yo3664ZgzDt1Q3FI6pzO925X24yAhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434135;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qflCw6MLcC6/TPQ9uGOeHSFaR8cQduednA4IY9mtf8w=;
	b=Iro/dhmlspEHEBXNP2Ggxe2u2jwwKS7xvvw/w4YHxZlaDD0wp5CnL7gorCWGx+XKIOmS
	 ZeLwgZNgKN5lJu0ndqtyrmnVfAgB8p2M0BUUNNwNm08gHmup3w3ASEy376oHRb1Mm1+NN
	 aloJTH8kbSarNVHIHoefnuwLU/B1wqRVaCKKJTZnQ50IPuxCl6s7phXxrvc+dUUdy14ls
	 IfvUSYZ9Ck2C6h9UdO8j7VWYuwu8MIJubo0A5WwUAb6FfVrqRSCJVpjN/5GatC65aGL29
	 RurBQej+HmoDxxekRzmDH9+ZNQnSnWFN1OAtuA691J1RacqiSiMSF499BDBxOk/w4eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.121
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2121.outbound.protection.partner.outlook.cn [139.219.17.121])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB619606A31A;
	Mon, 23 Nov 2026 11:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB619606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9XzFm0Guf64dy7oY6lTx17+UUzhSKI+6BGW191e/wAUnQD2U456MVmS/ckRP5lEBo3bByFu6YXC2XDiS5kYuhoZrxfs9dNRPnoTyYx40unk3KTY8fgKbfH5mTg47WohjsgSu3WLdedWU8lOl7Ru81ktzNmNrjJzrCwyJN3U3JBdWj8MkCEIAxaE8xq8OdhyRP+gqskDnInZlugoJmVvzvOOBDGDcZjOKKOlYNPvUkk8eAzBbPxFAgqm2LHyJadSs9k4WQquXvgwm/IKaD2l4hcsl2tTxdGzCMGPzUPM0xiU8SRsbpf9QK+hdNHhA7zyUJ7oKIz9qvYlxin6NMY+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qflCw6MLcC6/TPQ9uGOeHSFaR8cQduednA4IY9mtf8w=;
 b=TMww3eqBjQf7Q8kLOv1a4vZFch215ybPtt2AL60vkGyOVlgHzwi85kcdIU2hpryE6uEH7KCstJWqMUSWGNIV2geumnPfNrKLp1ozU8j/eX78aXaOA+So2ZyJza33m6XDJPWu0bZ/awLBnQT8OeS4pV/PKdk9c3Ti8tv4UTTzGoTrVIuV4lWFM2/zOzAjic+hPTaYjd9xibqtS79H6krPWat68+upE1aJhx0D9bnECthQksNISKY/lThrlrYCUNIN38Bzl7ffZHCQgEleS6AD/RhVvtF+M5Xiyo1P3Xb7Y2t3ur79YgSkfcGkDDVsrmFz4nrzGMYCaArML6mHtdD1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:42:03 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:42:03 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 0/6] Add StarFive JHB100 PECI support
Thread-Topic: [PATCH v4 0/6] Add StarFive JHB100 PECI support
Thread-Index: AQHdX79MgESjguh3uE+6JouDVISisLc7v9Cg
Date: Mon, 23 Nov 2026 11:42:03 +0000
Message-ID:
 <ZQ4PR01MB120241AD34E2D3685954FF17F2452@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1265:EE_
x-ms-office365-filtering-correlation-id: d7963fd0-a399-43ff-a2d6-08df4956cb08
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|38070700021|10067099003|56012099006|261028144727099003|261022105027099003|261021135927099003|261026121527099003|261026140227099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 wXL9JO3l9I70JqUyZERIQcfNMSelvO3Q8H0rgfJ9SIw4pGxNX85TmtuI4Mkq3fRSd4sxva+XKqXHKl6q5lWSwNZMa/dtoVd4GoT6A6I6YWNSGTS+YOVlIV2x4s2WuJERsdmTmtQ3Z0TN2WAhOQP+GOnKK4pX0hf+aSRmxOdDDfPfKH2R9YlS4PKOEaH2AWeWIIpJ3qO4VQro6Blsfu783TZz9T8drnJn/Xyhl2FP4+OQYLjVuxaKR8mrg98rp9BuXj9z+U4iOe1zlBa47+z7sEfzRBMG0Y64xJ8ukV5mR9kBUzY+agwVenK0yMX+/eYPd7Z2HVrg/HHe6xUDPxBEGwoRtxAxMXNVM3LF+z8cD2wJC0ivdJzyWX+c1zcW8gnjF8FW59Yq+drfntnczWWqrpuZ+Sxki28rmYwihJ3+YliTNDSDrHDbQboLXeyHoYL/99m3emGU8MU4GMwApkMZKDxDU1BEstyv0XKdyz1cm3j8x0vkOGgKARQrGscbFWMMwz8+RuQ7vIvBBwvBzGpVuKmb7WGs50shcMlY1O3oZiB7w5RQs7IThQD+fz5BBbrs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(38070700021)(10067099003)(56012099006)(261028144727099003)(261022105027099003)(261021135927099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6C8sACFObz1+axDm/b2l3QW9El5jbsX5KNSSD8eUcAnYGBJ+kL7n1OVP0mPi?=
 =?us-ascii?Q?qcut5iKBJOAxZ4M/AZzZqEf1rNjT9I9mEfnHZn1xYlT2E9CZW5Ugah5wAHNP?=
 =?us-ascii?Q?f2bt7S6l9HqfdTcJO6/G6bs2v/SdDGMpU7op210Qmu1CEXATKlUBm1JMuGCh?=
 =?us-ascii?Q?zelA3TnNMEU/FfGVFSe+FoLhcnabW/+AvUPRsfAXzuMWmBAPmbc8ugAnWDl5?=
 =?us-ascii?Q?epUkCe3QTeYdFjnrsciWrD/lnhP7cJ3DJbBlXvsUlbyYndbC4TJWcwUpQNdi?=
 =?us-ascii?Q?NrcIZI1ExjacCVHsXjqFtnPe1s5u//I1Orx+CtHtjBw1yHxyEUWrqyV9DBXp?=
 =?us-ascii?Q?OTD4k6uxTs0lRVqQ1v1z8ZhaN0xEgjBuQueDj35R3vZahzpgdUOByKkcuXef?=
 =?us-ascii?Q?hIxUkUVkaLT5pbwpZZDD/91VpmF1TfyhKKEAIG/cBgH85CrOkLqDWI/ARvu9?=
 =?us-ascii?Q?qfCCj9kmVi0thsiFQ/3DSl5t+OZqFu7mlvYoptK8oyLWIWl1n78BvLkRTugC?=
 =?us-ascii?Q?rQgPUsnhh/zOrIRoXzNNeTjj6JvpKk2vgeoW/Aq1qjdGwvjSxsa5b+RJ7wQ0?=
 =?us-ascii?Q?njqe8WzkVWRQ2tdwp45Pzpd8RELR5vVg5WtUgAQnPk/Sl7eCcVgfFDBByGv7?=
 =?us-ascii?Q?iIivksOzGoQfgfTlLF2XYMxJp40TzLpry1Jgp+Ist+lOMj0AtCzn64qDOvk9?=
 =?us-ascii?Q?Ib3flkUPWoxwaHkKF0pQc1UFapNVFNz/mAsIhnlnh1UfvDLVa4Zdks2eMIjt?=
 =?us-ascii?Q?VDYZpi+N3XsQQT3dVwjOg4jeaib4DvXH85qHXiixFgm2gag1lk2QwYcYUWA1?=
 =?us-ascii?Q?7FYNpCiAVLsSLtH4+I2aZr9ZErNhUUxZ43+Nc3dzD7BfO/UjBLJa/8wlFvkn?=
 =?us-ascii?Q?02IeADyndOcHe2YYIQEUi+wpMLB9ZHSdQjP7GW7GdrLTFUPaUgFr6c3XAFRY?=
 =?us-ascii?Q?IBzza5k5uyziVBK1wzv5rgVOqQXwRn55OmE0yUrOjalsSGPNQfHv3uBRGF+K?=
 =?us-ascii?Q?O5LdhWHEFvr1FDgBCl0s1N36FJjjgBzLE50iY4iF9VckjQsycpnja6VuT0Jn?=
 =?us-ascii?Q?CZZewnOfelVLM9pN/o7Kf0LOyfXxeO5N7wedRNUqurogtLGmoFDCtB2WWVXI?=
 =?us-ascii?Q?SHL0MLVQS5W/ltP08QVg7DA+9G8d6RSkActqqIRfxqjdHngTjjk1Xhg56U0Y?=
 =?us-ascii?Q?VsrzdDNnzWSAN10EVNowVht3fYK2RzKe4SB4S3q5O/ypi3sQoqVGE1Pjeqxb?=
 =?us-ascii?Q?5OJQRe4t/Cap6tzFFm2M+EIyUuq+0LYznPPChsEATB8nQQtPgExtrNrPHWt/?=
 =?us-ascii?Q?w162A4tIvbcnCtSd8oVEJva390CW3RIdADqV2Uv8GzF35GGKIXGjc7DoXYNe?=
 =?us-ascii?Q?7Wc/xdS3FKcsNk3taSq+uOvu4wMWe1fKZNktrUJ1i8bL6w4Bu3yXwcyOXoiG?=
 =?us-ascii?Q?XNqwxDKn3UJzxO3aOFK6NLTzDAuwqCtKpWsUw7C/J0C90t2hF19PAgduAmqx?=
 =?us-ascii?Q?DK3idOn6k9VtZ7r6LUxjrvNpSCdPASqMxiotVrxNy9aiyis87H2xJw2EHq8M?=
 =?us-ascii?Q?1epimkGTzga9wQf2VSFrJxdSoGpURg60EAg5xpIEdEqEXnBXYhrRBKh7EyjJ?=
 =?us-ascii?Q?GZx6Kkwmj09b6fGzNvocHwmnBefm+SEmoZpVLPpU9xy+4n2aJzGF4TghomqP?=
 =?us-ascii?Q?m8H88m4S+D6qxzj5HIVgHSGp8FUnuXbqI5ANsNNwlJoECCaTiMRwlrWhIP5F?=
 =?us-ascii?Q?zf1Gpg8PbNLWswnXvWfA6Kq1dCaVzPg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d7963fd0-a399-43ff-a2d6-08df4956cb08
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 11:42:03.1668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRDQIXlVTpT2e013SWVDkC9Yu6YfW4q1bbIayHVaZU2MvmJUWtz5/0uQJOJmQS37JNjRe3Tsns2sWxPDJDLCMbjNnd6craOttXHwDj+wArmDhAD2QkbCFj/0w21r4kq9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265

Hi, Iwona

> Add PECI controller driver for StarFive JHB100 SoC. The driver supports P=
ECI
> protocol communication for CPU thermal management.
>=20
> This series has been tested on the JHB100 EVB1 board.
>=20
> Changes since v3:
> PATCH 1/3/4/5/6:
> - Add Iwona's "Reviewed-by" tag.
>=20
> PATCH 2:
> - Reorder the linux/unaligned.h include.
> - Clear pending interrupts before starting a transfer.
> - Narrow the spinlock critical section.
>=20
> v3:
> https://lore.kernel.org/all/20261008100623.7085-1-changhuang.liang@star
> fivetech.com/
> v2:
> https://lore.kernel.org/all/20260928075956.62298-1-changhuang.liang@star
> fivetech.com/
> v1:
> https://lore.kernel.org/all/20260903133408.110847-1-changhuang.liang@st
> arfivetech.com/
>=20
> Changhuang Liang (6):
>   dt-bindings: peci: Add StarFive JHB100 PECI controller
>   peci: controller: Add StarFive JHB100 PECI driver
>   peci: Add support for PECI CC 0x83 retry condition
>   peci: cpu: Add Intel Granite Rapids support

A gentle ping on this series. All patches have now received your Reviewed-b=
y tags.=20
Do you plan to apply it soon, or would you prefer that I resend the series?

Best Regards,
Changhuang
