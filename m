Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11020117.outbound.protection.outlook.com [52.101.169.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6567135BDDB;
	Tue, 26 May 2026 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786504; cv=fail; b=nEg1drpCw9jgsJlb4lD8JU5Bm+tN+Hm0aKhOk3DiPtjTDTlGol6BA6CC2y+FGtZiJxND0sJsexD+TYiCQBo77XcZJk/ux5kyRDoh4kI4+2KIQD67IyQ7vGu3ji2GqEDlN3sYF7TPQb8kx8bRZWXsJidbEyeMf73Ecku//Tg+B5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786504; c=relaxed/simple;
	bh=kMqmTD+J13U2WAu/+QNkSapJYCUgA28L9LVKWH6X8Qs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LQZ9nEOYvgMeKq3T1w0oWH1OD69dpdlL7w0k1ZBiUugTyNCjxWLCoCFbLXdJ8FYdzqbYBOOa0qxMKV36yh9FWLKd91j8f3cIsXFzMcUkMzcYPhNdMLntmnE0bCySVsfVJ/yS3AeG6TQ+3vdumpdmq+Nn7tfpCfxT7fV+TZZHu3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=advastore.com; spf=pass smtp.mailfrom=advastore.com; dkim=pass (2048-bit key) header.d=advastore.com header.i=@advastore.com header.b=NX9nXQRp; arc=fail smtp.client-ip=52.101.169.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=advastore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advastore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advastore.com header.i=@advastore.com header.b="NX9nXQRp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ss+2PlHv7SN4TztscuuZvq+XQ6MVqZV28gD9P3ZZJm1zKZIeTqAQeJID54Bi3QFb5TstDxTtYzB5CljXzH/0uvNEoaVKdMheextUncy387UJNzhg7an5Z0VkxsEVPVrFuYe4XIW0kMTRbjSffl502VEqcTM7aNtILYfokZz0pNc+UHJr27Xv0IRJWbjmv9NXSKiztjHMB0kkAkJqGHLNUtHPtFy4ga7MTDo0wYLb4HzPUUiZaDml0KhOLKjQAs85DuSaNlLOXjo7wuj5PQs9EEJCb4oyEtT611rbG6lJmTuajzU6FioTDOCwwO7cZUZ4aGGj73NOKGpTc9Rgb/byzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMqmTD+J13U2WAu/+QNkSapJYCUgA28L9LVKWH6X8Qs=;
 b=RKGlC7yI8aD7bAxNIoPM7G2ps5qQnp4LK/ck7oOfBDAwg5Gpy72/Ea3nNpAJHFnqp58qFrRyafkNFj3fnNKbMZ59uqRYYZWkg1J6B2BzIwTtWu6Dl+c387T5/RT58t4NmRN9lfJjswjNNCeXk65STzR9ixtWR7crX5/EelwyEmJ2dKYi/koexAGCYmNoHGKLLwpEppOi5i0ievOKbi2PoJpjoI/fKIYiAQe42XDXkP/QakEXH3IwfEPpcL2Kq3TPbmxutplRo0e+tAo2cFLYOiNcXT/I6Qv29MvofffOibp8rWXTXZBOt5W10kAWReTJZFkt/r2LhsfMUMY6FkyO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advastore.com; dmarc=pass action=none
 header.from=advastore.com; dkim=pass header.d=advastore.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advastore.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMqmTD+J13U2WAu/+QNkSapJYCUgA28L9LVKWH6X8Qs=;
 b=NX9nXQRpubKNptOEgQOPw9Ku05G8PyFvDJeMkcIIZnfjKBO2lrOulHz135XZVVkbxQqyUFyNGqJPFwFeYmN5SSpfMjBNCXq+NfjolfXplc2r694XEIk3li46QneEV6LNb6HKZJkCEzl6YuzNPlYkwDWkbLvAVk6NE6Mf2RpsdMP601kA3J5LPT9QfSntCwsfIOozyfHvPYLSy8+gBGXuxCdZ+qhp9Ed31wpo5IY9xFYhHJzJm6bH4xbMUDTFmf/WMVSSELmWQkSWIE+PFBDDrNl6x8OQOc88UWGQvczA16s5tW3tD1kqDdHhYTjsP2y6JZVYWW2XP1G1cTwiRwdLCA==
Received: from FR0P281MB2861.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:55::8) by
 FR2PPF3C0AD2B6E.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.18; Tue, 26 May 2026 09:08:18 +0000
Received: from FR0P281MB2861.DEUP281.PROD.OUTLOOK.COM
 ([fe80::9cae:8b61:aef7:bfc8]) by FR0P281MB2861.DEUP281.PROD.OUTLOOK.COM
 ([fe80::9cae:8b61:aef7:bfc8%3]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 09:08:18 +0000
From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"richard.leitner@linux.dev" <richard.leitner@linux.dev>
Subject: AW: [PATCH 0/2] hwmon: ina238: Add samples and update_interval
 support
Thread-Topic: [PATCH 0/2] hwmon: ina238: Add samples and update_interval
 support
Thread-Index: AQHc6bkNZ4m46LfT00e8oo4RwaPJaLYaB5SAgAYDNiU=
Date: Tue, 26 May 2026 09:08:18 +0000
Message-ID:
 <FR0P281MB28617450903B76C97BF62011E00B2@FR0P281MB2861.DEUP281.PROD.OUTLOOK.COM>
References:
 <20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com>
 <7af1292b-e61a-4cbc-8353-dcbc6dfce3b6@roeck-us.net>
In-Reply-To: <7af1292b-e61a-4cbc-8353-dcbc6dfce3b6@roeck-us.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advastore.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR0P281MB2861:EE_|FR2PPF3C0AD2B6E:EE_
x-ms-office365-filtering-correlation-id: 737a0efc-7b35-4e89-b2bb-08debb0653f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003|6133799003|4143699003;
x-microsoft-antispam-message-info:
 N0kKVe3O4UKZaMYpImfuWLQyokpeFb0jYXantPwR54Yq31/kTwio15cQLMChKRF6QCHVQ70Z6jeafPey8JKt61jwE2qDvDzmMa8/NtyNVjLzeeAaQ/Z2pCljcvj88PwvlmpfpPX3N+yeLOcsZY03DVoYC4YaTgd61P7D9/UbuaB0rVzOhZtMOUXJYQwnrA81+Tl1nlqz2jVUcnjhjH3r/6EDGxJFALwIP5Ff7b59s6JRQIAh3ebSl7ChsH48kjkccaLXy9vsYR3KkjkPMA5bJ1sdF/qaG7HOzpQIDGMOjY9w/80H6xU3omLKbO6mlQNz4STMHFRb5W7uhWi+zRSbddYugXVr+clEaA8AFyPSvt+Hazuuvp5dhVwG2NMI7OvqGcLApcl3vorou0rXQZwh0DApFCqYzGvpPx7FbIWWmAuIF5cIA61x0aj1nsUVdxruwSPC7dLfKOYTdU3Y/wojsc9daoFW/iw7jbbXvBhW4jwcUWwmI5cDNRjc21TkM1c6ZIOlQOHIntpbBddO/nXKgUrI1OxRCNHm1lLX8IOM1DqKB74ROSkosZbgIMVxRCUq5MjL+dov93FGz7k3i08CwP31SH+PQWTlUjOx6/VcPfZDLAdCR4oebyKdv8qPvXeDoM6sOaRJC53TCb7lHoSmKlv1B7W6hqQu87NULN0oe2ASraYHotEZURcsLmJqzNsD+DTErs1j/xfc8dBOG891VQDB0IXlj0yQGEyYeQNl4gWwcsH1nYbQ+I1ulNWNf3kQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR0P281MB2861.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003)(6133799003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?trQpwMIAXCAhrBPUD2D8URKz8ewkyg032fChg7Ob4KPBDs0Qawve23jC?=
 =?Windows-1252?Q?wFalEMbhKDkofq2vorTPrjHQk758eW4jbxiQMU7QUIBa75tT0HSm4v1H?=
 =?Windows-1252?Q?95PHdamDBY0Boi07vpA8f5ZYYQgC64uc2lnZtzgrMKXLCkAWWiGrhRwS?=
 =?Windows-1252?Q?BDDWlIIegEb/FURGOTFkXZASW7KUb3rrjVKL7QXTFGrMYpEQk1q2A52a?=
 =?Windows-1252?Q?NvcS6iJJQrzeTppklxDZYzEQlmsT52tw8mo4LUqL+uVM79xzickZWjtE?=
 =?Windows-1252?Q?LM/th2sxTkh9ooxPAYtMfa92EjZJwcFXQUAnT7XmpE+rx2q5QaeMNrN3?=
 =?Windows-1252?Q?Bxa8Vj/zyfimRXM8/unjY63yLzSPtFOtyQel/hhEUftmT/a8wNlnp6Fi?=
 =?Windows-1252?Q?otMQ0znopefT8XipJ28wss+YdVebBf5+BlE50jgGWlL4wNMFWPM6CWBx?=
 =?Windows-1252?Q?K3aeWVtbye2ygc7/DXmTPNbBgqqjj84gv2H7Bh0dsjX69qKyV4YyCyfv?=
 =?Windows-1252?Q?V/stAFqzPecfICTzcJ6NSmvLloIzhjj3uvKKQfBmQ24NkgPKAxlWkkB8?=
 =?Windows-1252?Q?+Rtaypn88Id+J69xarrSSA+QNmW7IEPD4INl+xQKDGZBiL5oljz/Lf+A?=
 =?Windows-1252?Q?oAamJDlvtQOAP2b+PLlRwGU9Yp5KIs4topzJy9H7pvQYYL9Dm+zWMFB3?=
 =?Windows-1252?Q?xyp0ABPqBkUv/wa299CYFIEHLfjMpyCgmS4QXxtDqr5RLF2WRGiIcJsj?=
 =?Windows-1252?Q?2dzkD9+OJGZvumnq8qFZWPY70zVIeZS2njJ4jY+bZYnDv1F2rCqKBYH2?=
 =?Windows-1252?Q?DdMn+qTu2cYiR0pIcEERMBfN99dqhhSVre5YmYijYEUWGpoE1eOq9oNJ?=
 =?Windows-1252?Q?cruygo6h0HUOED4itPTMMEVRtDyXJxTL6rimAXWq/ot/rR3Gr/de1WTW?=
 =?Windows-1252?Q?83vbfZNb8qqZ1p6dIlP6pfkpfJ/r+LS+OyysnZAFMxtZbhqizANYGBjn?=
 =?Windows-1252?Q?e58LTnrVk//7h0niqWVaB6WI41Ivn9MhDOIE8itJTcpRVf1QCGOTGSrN?=
 =?Windows-1252?Q?yvbnwV8oKV1KAB8/715xwF+A/XLD09zSKhsqnvaxpAXhGI3dvYYzVaMy?=
 =?Windows-1252?Q?uad0Wes3NocsDCleuGq7iDOtCWBVef5Z/8Wy7pyunZfubdCT8i0ysTAS?=
 =?Windows-1252?Q?7ipyXcQnd5aA2rROhkC4snm+lJArg2oQALZ82FUyzvkaMLY8QPF1lkVU?=
 =?Windows-1252?Q?WSxUfEr1uFgMqU1bI3HaEec3Smci4RDrSbXmQYR0X4tNT5tgdjMLpO+z?=
 =?Windows-1252?Q?b7jd/q43nQslrO88v7A/SEJv3OxQkG5MgThTsd0J+U/BWZXjKlAMOcQZ?=
 =?Windows-1252?Q?30g00T9DRGjsWbri0g+BCCNX79Qo+66qqnEbzsA4543gyNU4+dD3A0wo?=
 =?Windows-1252?Q?UIBl1OQ6KHd8jofJ8PzZZaFO4rGGQ70Kxg1SFnlsM/AhXGUjoeXplltH?=
 =?Windows-1252?Q?kfih0pWfdPn20Ap2T0K4xsFHnIFUi282Omxf4W7VifBU7M02JLEELWsF?=
 =?Windows-1252?Q?U3rqebqo4GhpyXz4JHYa9PuWvdawghGSyGNlB/a++rVWkj4SRRlvu5RD?=
 =?Windows-1252?Q?oJ9AmqKDtfKRMl486fsb7neyPKY4P/exNDFZgk2pXI5HApPbE7/3iSuk?=
 =?Windows-1252?Q?4Vbu0Ri15F5R5VQaQlzU2PKaWKdY6puCCimPB+Rf8tX0SFjLmyk13+Ng?=
 =?Windows-1252?Q?9oP2FaxNC6ievHif+Fr+fwBNHCprp+lvDVI1CPHoQDckPYLbV+JFYGKr?=
 =?Windows-1252?Q?yVL1GjZGAHJ4kgElQxf0Mk6G7gm9HDsm8fFb9UHdA8qeKdm9qDDd50d6?=
 =?Windows-1252?Q?5DFyHo8ZOA6jaQ=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: advastore.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR0P281MB2861.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 737a0efc-7b35-4e89-b2bb-08debb0653f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 09:08:18.5099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7deee330-2915-4d2c-846c-7ef7b561bbb2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uSHYydwwpsFr/Jeh3xWT9ALvfBDoSAn2CTgwW0xk0LRxA6jsfuOgKPmCsvS6MSqSo25b+4J3O8O8MgfPqebagucRmtAb7snQ+UdP1KdWSyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2PPF3C0AD2B6E

On 5/22/26 13:18, Guenter Roeck wrote:=0A=
> On 5/22/26 00:03, Ferdinand Schwenk via B4 Relay wrote:=0A=
> > This series exposes the INA238 ADC_CONFIG register's averaging count=0A=
> > (AVG) and conversion time fields (VBUSCT, VSHCT, VTCT) through the=0A=
> > standard hwmon chip-level attributes chip/samples and=0A=
> > chip/update_interval.=0A=
> >=0A=
> > The first patch adds read/write support for both attributes using a=0A=
> > per-chip conversion-time lookup table to correctly handle all=0A=
> > supported variants: INA228, INA237, INA238, INA700, INA780 (sharing=0A=
> > ina238_conv_time[]) and the Silergy SQ52206 (sq52206_conv_time[]).=0A=
> >=0A=
> > The second patch uses microseconds as the unit for update_interval=0A=
> > instead of milliseconds.=A0 The INA238 supports conversion times as=0A=
> > short as 50 us; millisecond precision would make the four shortest=0A=
> > steps (50, 84, 150, 280 us) indistinguishable and inaccessible.=0A=
> > Since chip/update_interval is introduced in this same series, no=0A=
> > existing ABI is broken.=0A=
> >=0A=
> =0A=
> Are you serious ? The hwmon ABI says clearly that the unit is millisecond=
s.=0A=
> =0A=
> What:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /sys/class/hwmon/hwmonX/update_interv=
al=0A=
> Description:=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 The interval at which th=
e chip will update readings.=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Unit: millisecond=0A=
> =0A=
> It doesn't matter if attribute support is introduced with the series=0A=
> or not. It is still an ABI violation.=0A=
> =0A=
> Guenter=0A=
=0A=
Thanks for the clarification. I understand and accept that update_interval =
must=0A=
be in milliseconds.=0A=
=0A=
This raises the question of how to handle hardware whose native resolution=
=0A=
falls below one millisecond. The INA238 has eight conversion steps from 50 =
=B5s=0A=
to 4120 =B5s =97 atmillisecond resolution the four shortest steps (50, 84, =
150,=0A=
280 =B5s) collapse to 1 ms and become indistinguishable from userspace. The=
 same=0A=
issue already affects the ina3221 driver in mainline, whose conversion time=
=0A=
table starts at 140, 204, 332 =B5s.=0A=
=0A=
Would adding a `update_interval_us` attribute alongside `update_interval` b=
e an=0A=
acceptable path for hwmon? This pattern has precedent in the kernel: the 1-=
Wire=0A=
subsystem added `w1_master_timeout_us` alongside the existing=0A=
`w1_master_timeout` when hardware required finer resolution (commit c309835=
69272).=0A=
=0A=
Ferdinand=
