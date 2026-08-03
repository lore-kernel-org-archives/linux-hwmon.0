Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012053.outbound.protection.outlook.com [40.107.75.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E01F32D0FC;
	Mon,  3 Aug 2026 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726277; cv=fail; b=g3MCd1YxirwGu7xA4KDLaHIpacd2AYeF7/7mgAOBzRXphN0iO8pm+54p+LbRYasANj3Dy9pa4wx8xUy6gKGV6Urc5/GLLAwiKdvB1ShBcArLw8uQD9HwLMTKjLZF9SKdXPYpdACBsKVZVQweBfEzvgDsQ5AAhoacAJvA2nN4jHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726277; c=relaxed/simple;
	bh=tyl6up39XRihCoAZVKwGUKGOx6RgBJk3eCAwuEdgPiU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tk1HzePU6ikjBkKrlRHnVBNVgNxxIXBB2tiEjaQNULX5PisIrrjtQCH/VEIJEZ20JfFr+HTDxMrxHvQNuXydMVBHRYFrTGn3whN2CXjGjdLzZKZH16FclEshXu/LLYA0INfnsQ5TChgzBVYqKgzFJAZ6M8l1KwhhFZmBtmfi1gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=fMial+Tp; arc=fail smtp.client-ip=40.107.75.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="fMial+Tp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCOimPltBNOf/nKvbbVBQ1PruBLsRzxm6aT4VqK0yfAnphxW6816imCS5DLFfUx6GkQCgO4tMHU0/9qQNVYRBWiWqyxAYC1EGVPCScZMnH9eQw6JuW2LM4c/0jne+NzwLGyZ/LqOHENDoa85SXdoUDUN/pgc34UAq4LUczMYG+e/0pR5ads955leMReBXESxf1uInfYwXbGIhk7tTvrzCmasvWWdI8iP1kJeJgVthNZkMSZjnKPFnJHjCMvq+4MW4Nbc76nLvJ+gfY9vFm8T3twTXXe4P7QzD1WmP4zbwCuhtOZ1B6nHpEWFk08q/D+vaGESCh0CDL44qzz4rse6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhczFUyseYXp/EDjr7DGRoljO6zEXKhjPUgTLGwVrsE=;
 b=uecl3wz5LoOToumDNN7pyDR3Ya2PxMLfKTopHCmFjG4/SRV6EvueMwkeJVVKBPOUBMKvckc3+dc2WegJoZrdzqGbejvuRS07fhazRh5pjPJl5lgLJMuw/+qAbRPu99I1Wax5AurP0MkLqgeEchrn/W5N051EPioFapmunhTLURTw0ywlU5U/FDgcwYyRpEYoGhJVxY8rrHEtGTinsnIJdlDPhA8O7/E6xpATf+sPvO+9psNLczdBw+sme6gs58gW4yrgVDheouOzQaQ33gqKGZgriDxrjTSzlvGJZhzidOybwOHO4g/ZFpm6Nrzkl95tURa5D573KpbDOp181/gfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhczFUyseYXp/EDjr7DGRoljO6zEXKhjPUgTLGwVrsE=;
 b=fMial+TppYjObkT1I7glTUZ39w3npSlg2YUFillJwZQInOGUmqC/CFP/KrjgZBjgTp20UftVJKi33kl77Oe2ZWQQXkTofijjRFFrYG0F83IXQe/3uelwujigoteL0wOorG6KIlXOvI3egmOaSYS6NGEYsOV/y4d44ZuzSTLRyd+Wb7SEV17VR2KCXwpERYRsQ0eqMRUTRy5Qc2UduIAzlh169qMX8velbXIiHcRHdPVSmFg0HBev7Wd97kLbnK66+qHDt4EQ14fWa/To46byCLvztQgSwxPwC9X7NeJDAr3E1R/EFBDVn79Up4Sk9IX4tb1yf4WFh3bMkO/qW+4Kpg==
Received: from TYZPR03MB6792.apcprd03.prod.outlook.com (2603:1096:400:202::12)
 by SEYPR03MB8380.apcprd03.prod.outlook.com (2603:1096:101:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 03:04:27 +0000
Received: from TYZPR03MB6792.apcprd03.prod.outlook.com
 ([fe80::d18a:7003:a210:ed34]) by TYZPR03MB6792.apcprd03.prod.outlook.com
 ([fe80::d18a:7003:a210:ed34%5]) with mapi id 15.21.0245.012; Mon, 3 Aug 2026
 03:04:27 +0000
From: "TMYU0@nuvoton.com" <TMYU0@nuvoton.com>
To: Ali Ahmet Memis <ali@iusegentoo.com>
CC: Ming Yu <a0282524688@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jean
 Delvare <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: nct6694-hwmon: temp17_enable and above write into the fan enable
 bitmap
Thread-Topic: nct6694-hwmon: temp17_enable and above write into the fan enable
 bitmap
Thread-Index: AQHdIn0rFh+UjJhTXEKxEhu/Q+9GwbaLo7Sg
Date: Mon, 3 Aug 2026 03:04:27 +0000
Message-ID:
 <TYZPR03MB6792D706A7C27E8AC068E33DE7D52@TYZPR03MB6792.apcprd03.prod.outlook.com>
References: <20260802124730.20387-1-ali@iusegentoo.com>
In-Reply-To: <20260802124730.20387-1-ali@iusegentoo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6792:EE_|SEYPR03MB8380:EE_
x-ms-office365-filtering-correlation-id: 1115e5c7-44f7-45bb-8ea3-08def10bee10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|38070700021|6133799003|3023799007|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info:
 dmmE/SXhEqQWef6DlX7XiLnyZCIHNLeEPvAV33/KktWeo3rsvEdz9W20Zj1VLBjzrgMOQ45w/2rOuVWKrBXhzm5QIrZF8Z79UqKTXPoAiquSzV+G7WbY+yP7+KfRA5c0V/TTVwcSfsIFmVuS1JO1YsqYnveJlRftcZFjdadih1xKTVEs+elVGqXUaTaMyu6yYgw1TvG1UeSskZD340kWpU+cKMsukXbU8JeZNYmuKc20DUMrglYfLfQxFhDPiwJ4hFS+E/beCPZbMwZuqHu3TbokuILLUAOVP2Axm8aQFi03/H6m9+GFuudnDKGY/5YZ4nJTqAOMsHrelg3PGQ1q/ahd5vAlnEuzHRwyfKJV9scIg8s8RYSJ4oahUB1kzwLLszpOweUt2e9KaBzv6+r1AM3TjPdbW3/PhcpEDNn7snc1vMlmnyRI/WH5v/ngg5rLJBpHpFoIV2j33YUjeRAakBK5PztnwtJl6SLOh8zrcwQaYKUQc5SU8ffpzUWb3byIh03oTLFsrQdtkCUgc7/CfqEmmFovG8MbrPf+ZSRJ4bN9oPM504gJ6uFZikJ5sS2N9duj/QpMc5qc8ByXyTaeaL6+R3UQVYHeB5VOaIL1RImTnnMi0n82KjZp9+mKHGkBp/ZQSgNswYxPYI3spElFS7y8M5m9BBv/LTgf5wKG+/7kxwVo/KpQbNWfH9MIAFVM9TLLvAFhDcOZEDI37Y2TnN6y8K5fGDaqCE1HdGf3mH0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6792.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(6133799003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Cbh4fWfC43eSqed6EZFa1oXkzm3+kZqXPpzWl52C7yiwlLqClLCUR2Ezpvt9?=
 =?us-ascii?Q?bpgpoKnCgR/GhMWqe4Mifl+bi5hWzAU1qieP19gEGuDdcGqDlMjLAPPqJKQK?=
 =?us-ascii?Q?TcUDSv9nYJ4u1crBUpjDNhf62Ym6MQR43ZCixf/14KzFGDthsc9aVJePoqB7?=
 =?us-ascii?Q?fMTfITc5k1DIfXWbydRuLQU00y/0QUXkwbUrmw3Jmd1syuNf/zbqm4/ADndP?=
 =?us-ascii?Q?NvdLzpMbGrCwXBgBe4/5mNXSFTB6oAeGqn7F6fkUygCNU9rnoAz4rCDu/ZtV?=
 =?us-ascii?Q?DSuDc5nG1c3zp7gaOQ37Ax2iDk2ZvsgSX0t5d9ozNF2pFFCIIm6l1VtJfpVb?=
 =?us-ascii?Q?ce6+ocCWq+kw0X2I1+hyXJsAPHRp8a6zIXLGSl26mOUeShyKkPfvTz1nkPHO?=
 =?us-ascii?Q?CV90cVmowZDKsqd9RbsnYTCKe1JOTX5yh5cM4dIBdwWhsn7D+5vbntF3/21e?=
 =?us-ascii?Q?t0PjHLztFeKB78kmC+nxWglcr7LuUn14rZVNySdtv5UqLLAlaNo/jLRwsgCN?=
 =?us-ascii?Q?ysnliZM7h+8RXQQ9LzKtFI0ndg2uzQAX/abEk9NkjEd8I6C0sZHOk9pilsXa?=
 =?us-ascii?Q?9kGKHo8PRa7ggLaNKlR8Mv74N+L0P1GLMIzYOGgSf12Hf7frVI/afmJ1/NQD?=
 =?us-ascii?Q?AIcmaqb0Q1sphEsPpC53Wd3sj7ob6X4rBwNqUB0DjPnpBTKNGKjP1rw65dUI?=
 =?us-ascii?Q?N8j6X7xSEe8SiDSNK07On6PnXQI/qyIpxKqhttK65LlmHf3cpXTUO5dbXFSe?=
 =?us-ascii?Q?fa0wasQ9YXQ4FnRfE16XMuVgxyduwxOamfghotOlwuguFJW7puQ/0CMtGTqc?=
 =?us-ascii?Q?471/ZQIKvBCvWJI+gpZjo5IBAR5mFKx3jDDSdBB6q6riifLt1XFZlYEIvu/c?=
 =?us-ascii?Q?ZwmiikRxqsqsd2TTeLW7i+oR/WkQslVl08Zehv0NZHcArE3u0esVoeMDmflt?=
 =?us-ascii?Q?mIaGw1RQEPlKP7ipET71Po0WbvHman96UCPubCGT8orjlab6MrVzOyXhPaBG?=
 =?us-ascii?Q?+h8RFXgOwM3kjztZ9GOr/weD0j2P/kVA6mYAOndQVuK/Hp9ehLgIcQ1vZgPO?=
 =?us-ascii?Q?GuVkue1PgdrTJBTdXWVmygbJ7J8rt1FnJK3oRPahSUY/hIQ0UXNWQ1ncqljO?=
 =?us-ascii?Q?IWZ0ioRUDqM34mnU8mkzuoxxf92cemItRzHK2OyQRE9TSSGREjLm3Zk3pud0?=
 =?us-ascii?Q?YBLNykxyabTCw+cLEr8X8w1d1V9/4Ngn6+E6Ay9WAn9noPLU6oC+T67s//5K?=
 =?us-ascii?Q?YnOyNxvLlTxHt2J5ot8W3g1QrpnwM8t1dIG/0UellaVy1HDfDwkeeo3QPhSo?=
 =?us-ascii?Q?TZrpsLVdPxugpAv97geYV+zwVJyY018WYMepL4vDrMwHAtuzMwW5qGCXFOHb?=
 =?us-ascii?Q?aha1RAkRHrFRSkXQQ8K/cCYzSdjXOzKGkSss9StoDFNP7UvzpT28KbLmuFJL?=
 =?us-ascii?Q?1pFh+dHApKlUzQNDXk9C6QvZzHl+KERdAwt62Ai+gZAIPuZ53zerZJVsBcP2?=
 =?us-ascii?Q?MGXKmI0bDFe6v5eXNEIhIOxqiGrqnrNXg5Xhglw0KMejrrA0eUF3uw5elGS1?=
 =?us-ascii?Q?10lEbqC1VP2elFEaaHWVUagXKo1LtXqq/aINAHFRnJ5oVHhLWT2+tq9QxXJe?=
 =?us-ascii?Q?C6cCI/dinKpVVPvprcQyKgTUjgy0NeWuR2QeMIN4MSD7fV/GmupDYRkaz5t9?=
 =?us-ascii?Q?9MNOAn5cpNdiyT4Yw8uc6G4QsPQ8bV7k5N94aljicfomBR54?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6792.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1115e5c7-44f7-45bb-8ea3-08def10bee10
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 03:04:27.2835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bckWlDkiuzgGW6pcfjux0sOGeA3u7uSqlFSgxoGNg8aXCyZ8KLKYxUPv5tkqvnb/cZJps5VuBM7PaAJ6Ky9gMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8380

Hi Ali,

Thanks for the careful analysis, and good catch.

It's actually a fourth case. On the device side, tin_en[2] only covers the =
first 10 temperature channels (5 THR + 5 TDP, index 0-9), which are indexed=
 correctly today. The 16 DTIN channels (index 10-25) are enabled by the fir=
mware, so the driver should only expose their temperature input and the max=
/hyst limits - never their enable. Indexing tin_en past channel 15 spilling=
 into fin_en is exactly that missing distinction.

So the fix is to not advertise HWMON_T_ENABLE on the DTIN channels. I'd spl=
it the temp config:

#define NCT6694_HWMON_TEMP_CONFIG (HWMON_T_INPUT | HWMON_T_ENABLE |     \
                                                HWMON_T_MAX | HWMON_T_MAX_H=
YST |        \
                                                HWMON_T_MAX_ALARM)
#define NCT6694_HWMON_DTIN_CONFIG (HWMON_T_INPUT |                      \
                                               HWMON_T_MAX | HWMON_T_MAX_HY=
ST | \
                                               HWMON_T_MAX_ALARM)

and use NCT6694_HWMON_DTIN_CONFIG for the 16 DTIN entries. The core then ne=
ver creates tempX_enable for them, and fin_en stops getting clobbered. The =
first 10 channels are unaffected.

Feel free to write the patch, and add a Fixes: tag. Thanks again for the re=
port.

Best regards,
Ming

-----Original Message-----
From: Ali Ahmet Memis <ali@iusegentoo.com>
Sent: Sunday, August 2, 2026 8:48 PM
To: CS10 TMYu0 <TMYU0@nuvoton.com>
Cc: Ming Yu <a0282524688@gmail.com>; Guenter Roeck <linux@roeck-us.net>; Je=
an Delvare <jdelvare@suse.com>; linux-hwmon@vger.kernel.org; linux-kernel@v=
ger.kernel.org
Subject: nct6694-hwmon: temp17_enable and above write into the fan enable b=
itmap

CAUTION - External Email: Do not click links or open attachments unless you=
 acknowledge the sender and content.


Hi,

While reading nct6694-hwmon.c I ran into something that looks wrong, but wh=
ich way to fix it depends on the device protocol, so I would rather ask tha=
n guess.

The driver registers 26 temperature channels, each with HWMON_T_ENABLE:

        HWMON_CHANNEL_INFO(temp,
                           NCT6694_HWMON_TEMP_CONFIG,   /* THR1 */
                           ...
                           NCT6694_HWMON_TEMP_CONFIG),  /* DTIN15 */

That is 5 THR plus 5 TDP plus 16 DTIN. The enable bitmap it indexes is two =
bytes:

        struct __packed nct6694_hwmon_control {
                u8 vin_en[2];
                u8 tin_en[2];
                u8 fin_en[2];
                u8 pwm_en[2];
                u8 reserved1[40];
                u8 pwm_freq[10];
                u8 reserved2[6];
        };

and both the read and the write path index it with the raw channel:

        temp_en =3D data->hwmon_en.tin_en[channel / 8];
        ...
        data->hwmon_en.tin_en[channel / 8] |=3D BIT(channel % 8);

nct6694_is_visible() returns 0644 for hwmon_temp_enable without looking at =
the channel number, so all 26 are writable. Since the structure is packed, =
channel 16 and above land past tin_en[]:

        channel  0-15 -> tin_en[0-1]
        channel 16-23 -> tin_en[2] =3D=3D fin_en[0]
        channel 24-25 -> tin_en[3] =3D=3D fin_en[1]

nct6694_hwmon_init() sends the whole control structure back to the device, =
so writing temp17_enable through temp26_enable ends up toggling the fan ena=
ble bits, and reading them reports fan state as temperature state. It stays=
 inside the structure, so this is not a memory safety problem, but on a boa=
rd using the fan channels it is not harmless.

What I cannot tell from here is which side is wrong, and the answers need d=
ifferent patches:

 1. If the control block really has two bytes of tin_en, then only 16
    temperature channels can be enabled and the last ten should not
    advertise HWMON_T_ENABLE.

 2. If the device has four bytes of tin_en, the structure is wrong, and
    fin_en and pwm_en are being read and written at the wrong offsets as
    well.

 3. If the bitmap only covers the digital inputs, the indexing is wrong
    in a third way: there are exactly 16 DTIN channels, which is exactly
    what tin_en[2] holds, and they sit at channel 10 and above.

The structure is 64 bytes as declared, and it would still be 64 bytes with =
tin_en[4] and reserved1[38], so the total size does not settle it.
Two things make me unsure rather than confident: the other three bitmaps ma=
tch their channel counts exactly, 16 in channels against vin_en[2] and
10 fan channels against fin_en[2], which argues for the first case; but the=
 16 DTIN channels also match tin_en[2] exactly, which is what made me think=
 of the third. I could not find a public datasheet to settle it.

Ming, could you say which one it is? I am happy to write the patch once I k=
now, I just do not want to guess at the device side.

I have no NCT6694 hardware, so this is from reading the driver against curr=
ent mainline rather than from an observed misbehaviour.

Thanks,
Ali
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
