Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013053.outbound.protection.outlook.com [52.101.127.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1682DC35D
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Jul 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175791; cv=fail; b=BpgecDJiWf70hmL2s7GAnQzsKg1bXQ3hJ6iRKegtue7iw4WPgrLmolTGwHjKZYWSsrMNb3cW014HZT4snztLPLqHdX0GTAlY1corMBgrkNoOwm6JmEkD/TYOX/BENYY07clujKpIuYkzqoKHGIq4Vog/rPRvGFUXDBNUL0v8rko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175791; c=relaxed/simple;
	bh=okSeWtjnI00x5/ztaW19kFtULLSHS6+XuqN+vdaHbg8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=I6t5hqtd5cF7opIubWmV/l8EbDJgZJgdmzL3NLqGMUZ3WvkqCt9sRkLwuvaQxEABaDJLDbaZveZBWx1ruRs/VTYPBpaYVnG06hhjv9pLler9LFzY7olZDLGRziEsBOnzMBSm0oLzt3VdPch1BF0hJj03NprssWD1hMSsV2epWC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fii-foxconn.com; spf=pass smtp.mailfrom=fii-foxconn.com; dkim=pass (2048-bit key) header.d=fii-foxconn.com header.i=@fii-foxconn.com header.b=jI5tJPuy; arc=fail smtp.client-ip=52.101.127.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fii-foxconn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fii-foxconn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fii-foxconn.com header.i=@fii-foxconn.com header.b="jI5tJPuy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZisRlHHPtXAKCvSN7RDlIICP2z+uhUBQeUXTggwS0oVW2c8uI3hZAm3KBjpIPMerOIGVjhJyzKhPKZCfTQSDHGRYatWknT6w9McAhXjVDnJhp7RJtUueT0nytAmgx9F2qhe/hbFJW0sALl4/kSzVC9hbnUWm2OzliSrDP3HoE/M6Escif3BFC065DKMKzaFkn8PugiYLd93pXHZOwTTCpA5vde0MmB7A0Mpq28oTDqdkcJ5KVlv19QNJEg3oWIIbvhXK8geCFP9HwRKQ1dAGjwjFMUnGErVBAUSaS4dbg/MIMZW4jJfC0Yvu6j3VB5aV5bsUkXjbmCXwlj8p4ZUyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okSeWtjnI00x5/ztaW19kFtULLSHS6+XuqN+vdaHbg8=;
 b=hb524HWI6tfrcV7oaEp90bdlHBNvyEIeXtjYt+xqrs2VKckTkcDfibgwYouB39DsNaQ2Ycb2+E6uzgasIjbIPHMmTH7GIunmGNzfGrHloLTPDaB5anwpEOJYCL1lDp9mCKkVHDQg8SPPrk3QCtdTuZB6n86oMwb1kxgUd6I7UgzWuIwVKROxPKSL1eWiKhmGNy6EZf57a8z7OEvTRnUlyuGorXp4Ne8swj3KRYfsnOm6wAT8qrWJ22ODkgoJT+94J/WR9yEfz82DsIRHFWELJAzWxzvRHweZYrPyZURhZsvFvmWCO9+UFLmzH6HKP/cZZJbjTrbrNOjWi1C/6chnLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-foxconn.com; dmarc=pass action=none
 header.from=fii-foxconn.com; dkim=pass header.d=fii-foxconn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fii-foxconn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okSeWtjnI00x5/ztaW19kFtULLSHS6+XuqN+vdaHbg8=;
 b=jI5tJPuyyJfNJQ9RhcfC4oW972e7akmL56KU0CJvmVk4qmBpjsl5uLEu/7iif0vQsfPfJB93B74hT7fwr1UukL6zczLIgccXDUWuMLXBoa0qqyjVA94pT16aYw+B5D6MK/nMckggMD9f2delXO3+FJD/ea5dEWvceAajbA+BO4rTtTWN23D7PvJIyIi27koFkwMaHF4HRBJZ5Rx809p3PdeY5yiKANoCndZAZJJ9MlOfq5I4+QyxVoketbMfGenB2bCM8hYtUrz2P86ueTdehWDA3mswL56wr3urkjs34h6UGCzF191G2nCXM4+gF9RD231qGh+Ild+BYFWfW3fjPg==
Received: from TY0PR03MB6775.apcprd03.prod.outlook.com (2603:1096:400:218::13)
 by SEZPR03MB6989.apcprd03.prod.outlook.com (2603:1096:101:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 09:16:19 +0000
Received: from TY0PR03MB6775.apcprd03.prod.outlook.com
 ([fe80::8904:e89:71fd:c510]) by TY0PR03MB6775.apcprd03.prod.outlook.com
 ([fe80::8904:e89:71fd:c510%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 09:16:19 +0000
From: =?big5?B?QXZlcnkgWWFuZyC3qKl2wE0=?= <avery.zl.yang@fii-foxconn.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net"
	<linux@roeck-us.net>
Subject: [PATCH] hwmon: pmbus: Mask out bit 7 when checking VOUT_MODE format
Thread-Topic: [PATCH] hwmon: pmbus: Mask out bit 7 when checking VOUT_MODE
 format
Thread-Index: AQHb+ukbygxPVAv19kScoyfiib53eQ==
Date: Tue, 22 Jul 2025 09:16:19 +0000
Message-ID:
 <TY0PR03MB677559FBACFD35F0FB40DDC0FD5CA@TY0PR03MB6775.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?big5?B?TVNJUF9MYWJlbF80NGNjZjA1OS1hZjVkLTRiOTItOTMyZC0zNjkwYTEyMzFjNTVf?=
 =?big5?B?RW5hYmxlZD1UcnVlO01TSVBfTGFiZWxfNDRjY2YwNTktYWY1ZC00YjkyLTkzMmQt?=
 =?big5?B?MzY5MGExMjMxYzU1X1NpdGVJZD1jYjNkOGRjZC0yZWQyLTRiYWQtODlhNS1lMGE3?=
 =?big5?B?MTk1ZmI2NDM7TVNJUF9MYWJlbF80NGNjZjA1OS1hZjVkLTRiOTItOTMyZC0zNjkw?=
 =?big5?B?YTEyMzFjNTVfU2V0RGF0ZT0yMDI1LTA3LTIyVDA5OjE2OjE3LjgyM1o7TVNJUF9M?=
 =?big5?B?YWJlbF80NGNjZjA1OS1hZjVkLTRiOTItOTMyZC0zNjkwYTEyMzFjNTVfTmFtZT0=?=
 =?big5?B?pL2lzihHZW5lcmFsKTtNU0lQX0xhYmVsXzQ0Y2NmMDU5LWFmNWQtNGI5Mi05MzJk?=
 =?big5?B?LTM2OTBhMTIzMWM1NV9Db250ZW50Qml0cz0wO01TSVBfTGFiZWxfNDRjY2YwNTkt?=
 =?big5?B?YWY1ZC00YjkyLTkzMmQtMzY5MGExMjMxYzU1X01ldGhvZD1TdGFuZGFyZDs=?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fii-foxconn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6775:EE_|SEZPR03MB6989:EE_
x-ms-office365-filtering-correlation-id: f7eea44e-6dbc-41ae-6ba9-08ddc9006b2c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?big5?B?QktyVEFQdFJsMWZFQVgrWUhzc3B1cTJhMjVGTnVYWW9TMTBEVmZKV0Qra0ZoSnND?=
 =?big5?B?NitEUFdVZGpQRWdueC9pWmtUSCtvUHhwalN1TXRQbzNsWmN1NkJYaDJEV3hBejFo?=
 =?big5?B?WEZiN3psek05MDFSY3dieW1hNkwvQm5GY3R6SktHMFF6d0l4K3BtTW5CeVcxK21F?=
 =?big5?B?b0JqZWFIa0x6WTlEZ2hCOHgvVkRjVitONTNWWFJFZGRNZ2NpTHZrc0p3NGYyTXZz?=
 =?big5?B?Y3hRaU5LZUlFK1YvdEt5NzA3ZDQxalU0R3BneC9lZVNSbnlEa0ViMXJrQXcxdTJr?=
 =?big5?B?UjgxN3FINmNLWFYzUzFQY1VOczNqRjVKR0VsMDJvME5HU3RxZzhIaDRWUCtXallF?=
 =?big5?B?WExLUnNOb21rMmM3b0JLeERKQVZRQ0JLMVd3RGJWbXBqeTFUVkFUYTc1VUszQUdL?=
 =?big5?B?eXFRSUllbllTUnVBaWIyTGJNVmFqVm5YNkhNWEZBbHVMa3lycHRVSjE4QkpTSVpM?=
 =?big5?B?OUlpdkF6OWR4bTdZRVE1VEF0ZVVQZ2ZNVlRiMWswWlZBOTg4ZjNNR2JLY1dkTXZl?=
 =?big5?B?NHVsWHRtTzE1NjgvUWlOcVg5b2lDRW1VbDB4S0U1cExteUhBTENoVE9aTzZod08y?=
 =?big5?B?ak1XVkVnUDlPZ0dTSUdoODdaNXZSSFQ5eTFLcTg4UTB3YmdnYWVwZmxSN1I4WlpY?=
 =?big5?B?N2N2cTdybVoreXcvVGkzL3lub3Y1SWdpWG5CNGp0NElWaHhFVUh3bmFrb3JIQmMw?=
 =?big5?B?SHRyL0JKSUM2RUNTVndQSUZhanNzVFdrOFJnam03bGttZCtZWEFDRHBLcy95WUw3?=
 =?big5?B?ZUJibFcxNkluR3M2dDJyWE51bkZJSG5jVEVHZU0rNEhMRGJMbHhFRENaT3BZaE10?=
 =?big5?B?K1dqWDFxUXlIcUlnZDYwdFNBYWZJSHdGVGRmRGhSQmZIaUh2cVljemlRRTM3WllZ?=
 =?big5?B?YzVDM2NVa2JzbEwvSEgyZGU5bEZpakxLUzhiaWxwcXRiVDBhODdRbE5kY0xyVUVn?=
 =?big5?B?cEl6OThmS2kvRFdUVFljTTZxZi9FanVuTmRkV2g5bFdVQTRRVFVUNU1mR3VDcTcx?=
 =?big5?B?anFrcTlUdkp3TkxQcWtvWEhvOWhtK1dsaU9mNlRqRUZ4aWxBU3pNSThlLzkyK29l?=
 =?big5?B?ZE55RXFHKy82Q0s2VjZiTFZvam8vWXJCbzVJQndJd3hOQU4wNm85MzZNZHNwNEJj?=
 =?big5?B?RmZTbUpOeUg3OEpLTU15cHhxUVgrbElrYS95N0RvLzFiNE1ILzJrN2tUdmhWNFo5?=
 =?big5?B?aDFVNlFEYjV4SFQxOWFzTUVaRG1xTHgvUjl6SnA0ZU5wU0UxQUVuQTU1RkRYMk52?=
 =?big5?B?TkgwMVgzZkgxK3h2dTVMT3orSUh3UndPSnBIWFRJVDZTNnBqMFpvSHhMalRZT2xk?=
 =?big5?B?eXdrb1U5M3hFalcrLzJjWEVNUzJ0anhlZE1RK2V1WitDYWlJNjV1aCswUkZwOFFF?=
 =?big5?B?cWdmemxjalhsTEhFK0tXM1FjU2dmK25uYUZjY1lCKzBHSkVEbHZFcXNBbUo0QTZa?=
 =?big5?B?WVZTMmtQWHlFR1JkWEZON0YrbTREc3M5TDN5WFdJTjBqYldBVkV5YXpzTVljNlY1?=
 =?big5?B?VC9tZHQ4bXN0VFB5RlFTekFZTldSWGFMaXVUeGJodlJYSVJpM0p1aFFHRzZCZ1pG?=
 =?big5?B?ZkRQU3hsZk81MjlMb3BTdm95cGlOeEhyQW4zZVd4b1piQWNlK1lxZk42ZDFubHls?=
 =?big5?B?MXNVeDdOS2VOUnROeWpJeHovdUV6TVU1M25NanlyRGxZYUQ5NzJ4R01KcmN6Zmow?=
 =?big5?B?WTVkNDRPL3FGVkRFN3lFSWdyOWdPYTR3aDUwQkJCSTlid1pmdVdKOFppNGdTMURs?=
 =?big5?B?NzhSRUVCSVVac3RoK0dteFFjOVBIdnBBRjY5aVRZbmw4Z0dhRkpDQ0FkcTliaVRJ?=
 =?big5?B?V1F5KzU0cFJXWUQwOC9WeUMrWXplT0cvWElLb2R4Y3luSzNjUnljSGx4QXc5YTZR?=
 =?big5?B?VXBKd1Z3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6775.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?WTRBaHRWZFUvTHhqSzlDbE9NRmdyQTVUZm5pNTNIOFFVTzM5NVdLTU4zSkxXZ1Qw?=
 =?big5?B?N1pwMmx2cVAwaHp2UEUvZVR2MjluSkVhY2JRTlp2c0FNRjREa2xRRFBEQk9nWWxX?=
 =?big5?B?THAzOWZSL1NMenYwWGJ3L0E0eG50L1Nwa3Rhcmp3QlAwMlh0SkpzelpJSU41YXdK?=
 =?big5?B?akxGTmRlQ040eTZ2ZUtScTJzejNaVlJYaElkVlNmRzdkYnpKOThRWEcrSjlod0Z1?=
 =?big5?B?NzdsVWJlR1BuZlpqSU1wZkpFNTFZazc3VXpKUERTOUNLeU1yQVdDREZhY0lDVlpz?=
 =?big5?B?Uk1nSHhlcXdORitMTWNubllpMGNObCtlWHh4a3lBWFpldmplS01lYWxHRTdXMnRk?=
 =?big5?B?NGtsYVBLYU9ORm16eWxtNGVoSWt0Z2pJY0VaeDNicUg4Q0Foc2JtUmVMT3VBTmVC?=
 =?big5?B?dkRPdk5tbzU4OU9aK21SeGFZR2RBS2xmSHpTTFJ4SGtvM1FMbEJwaktWWTUxVmNC?=
 =?big5?B?NWxoSUg3RVZiSEtla2QxK29LalJjaGU5d3NwYkR5NnJFM2tPbWtKOU1JUWVMcHNJ?=
 =?big5?B?RDZmVGRpdG85VDdmQjUvYWVwT1pKTHE1NXZqVEhiaHpPYWswNDJtN1IydHBXc2xJ?=
 =?big5?B?RzAvaFp4NkwyVGRxSlB4L3NHVkRTcUMrMWpScDBYMVByZXFtSEtMNUhnU0lSa1hD?=
 =?big5?B?cnprckNZV3I1WlkwY1NIY1ZoNzBZYmw4NFZRNUhsaUxFaUswbnEzRFZWakk2WFF6?=
 =?big5?B?N01VMDZvN3ZNeGVDRXhDVHJKZ2I1dWk0UVRreSthWlNQc0NYcUdMN2VWdm9GaE9U?=
 =?big5?B?NElXeFR4OEhuSHBTOFRVV0dqRklscDBwR1AvcnJrWkptQmNrNCtESFhYRDJOUFBw?=
 =?big5?B?MTVzNC85dDBBdDJpZ08wSFpuOUlzc01aT2ljMEVrdjFRR3J0L1ZXemFWbTJKanov?=
 =?big5?B?d1d1OWxwNzllUFVTY1VERFhSTkdMZDVRekxhMDdEcHYxVFA5U2FtK0gzdmkyRmF2?=
 =?big5?B?R2c5Nk9uTkJycnd0R1FlSldYazh1K3lLcURFV004Z3h3WUJTMmNESnlGdjNSTEps?=
 =?big5?B?eHdRQ21Ed24vUGlibWpRL3kxb2lXR0tHYXZyejNNRlNtUUVYT0tYMW1ZWkhBR2Y3?=
 =?big5?B?aWc0TVRqSFJNNEJ0bWZTaS9XMEY5OWxhODlzTUJwUjNUT1Znb2lPakxHMlI2bGhH?=
 =?big5?B?WXp6ZkNuR2tYek1QeEtWMHJMcHJhR3R3V1FGNFBKanhTUUJSVktUQkZJblBLemlU?=
 =?big5?B?MjRMNERCa29DclkydlorcloxQldMZndJdFdBVnZsVThGQVFOZGptOVkrMS91cno2?=
 =?big5?B?UlhjV3dhK0kyaHFwRGltQnN5MWs2dUp3WUxnRkJJK0tsTUp1RXRDcjZhclFoeHVl?=
 =?big5?B?WnZZMTZkd3NKMXAwNk5pRVFUcjFEb0RnMWpqaUNnZXZscUFaODBack9PNjU3bVhP?=
 =?big5?B?eXpqUzBHZm12NWNvcFRQc0tmVXM5NitLR0toRGJhS0Nnb2FvWEY3cXBnNUVkSGJw?=
 =?big5?B?K0pCS2N0R3RFa0daY3QvOGlhZXorSEVncFlSZUsyZ2Nnd3E1VXV6ekNXeDU1eEFj?=
 =?big5?B?b2I3VVBSb2tDcGtvZjY4TEtDR2dCNDZlbXpIMUpSb0RtaFUxd1l3RmpqT1lEa0xa?=
 =?big5?B?QzNOQWVXSWpvSXBMQ2lYWC9RNnFDMmxOc1krVjBmZjdXM3BXa2tLRXlETVU2eU4x?=
 =?big5?B?NnJyd0tKUDdkb0RiWVkyQWZMWTExSWJlSElLc1VVemdUcCs3QUc1QnIwYjI0WkNF?=
 =?big5?B?b3ZpbVM5YmdqbFVhcysxSWFpKzg1TFJYSnZUVWoxa1V5S2tZTWpMWEpHZHo4ZjhX?=
 =?big5?B?d0dsQ2swbzE4UTVMM0p1SVJweWw0aCtCczh3N2V5NkRmSHhmVjk0eUFCbllKS1Y2?=
 =?big5?B?bTRPWVY4OEhWdjRQZUNaa21idzRKVmVxSWNQOEdRTVBmcU0wVThnU1gzOUJkSkRZ?=
 =?big5?B?bXFMK2UrN2U2dG1NM1dSbm9pd3l2VitJSTQ4aFZrL1NneWNreEFyVnpySVZmanBX?=
 =?big5?B?U0JUZTNKbXBaUzdtWE45QmZIRFpXN0Q1Qys3aDN0RWFDTjJBMzI0RE5pR3JBRUJV?=
 =?big5?B?UHZsNldrbWEyK3EyVW1nb1RxQUErcS9Ca2t4VlliNnBWSEVzSFd4UGgzU1puSWE1?=
 =?big5?B?VkpSYUZ1S1NrMmM1UEtVZERFWFdTQjNZaE1QakZpVUNPb09oSHQ3eU1sa3ZKeTFr?=
 =?big5?B?SnBqRlpBPT0=?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: fii-foxconn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6775.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7eea44e-6dbc-41ae-6ba9-08ddc9006b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 09:16:19.1444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cb3d8dcd-2ed2-4bad-89a5-e0a7195fb643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OXC1c/k1PG9pZsWS5QoKbShug3GHrMIM6u/5NMJfhANY863GvI8w75hU3AeC4BBid7QFVMSIWMWnWgrGN7dJGtCyWooaKtpgBkn58SmBG3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6989

RnJvbSAxNGFjZWQ4MGY0NjQ1ODU5ZTNiMTdlY2E3MjRkYjBlZGE4MTc4OTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQXZlcnkgWWFuZyA8YXZlcnkuemwueWFuZ0BmaWktZm94Y29u
bi5jb20+DQpEYXRlOiBUdWUsIDIyIEp1bCAyMDI1IDE2OjQ0OjQ3ICswODAwDQpTdWJqZWN0OiBb
UEFUQ0hdIGh3bW9uOiBwbWJ1czogTWFzayBvdXQgYml0IDcgd2hlbiBjaGVja2luZyBWT1VUX01P
REUgZm9ybWF0DQoNCkFjY29yZGluZyB0byBQTUJ1cyAxLjMuMSBTZWN0aW9uIDguMywgYml0cyA3
OjUgb2YgdGhlIFZPVVRfTU9ERQ0KcmVnaXN0ZXIgZGVmaW5lIHRoZSBvdXRwdXQgdm9sdGFnZSBm
b3JtYXQuIEhvd2V2ZXIsIG9ubHkgYml0cyA2OjUNCmFyZSB2YWxpZCBmb3IgaWRlbnRpZnlpbmcg
dGhlIGZvcm1hdC4gQml0IDcgaXMgcmVzZXJ2ZWQgb3IgdW51c2VkDQppbiBzb21lIGltcGxlbWVu
dGF0aW9ucyBhbmQgbWF5IGNhdXNlIGluY29ycmVjdCBpbnRlcnByZXRhdGlvbi4NCg0KVGhpcyBw
YXRjaCBtYXNrcyBvdXQgYml0IDcgd2hlbiBjaGVja2luZyB0aGUgZm9ybWF0IHZhbHVlIHRvIGlt
cHJvdmUNCmNvbXBhdGliaWxpdHkgd2l0aCBzdWNoIGRldmljZXMuDQoNClNpZ25lZC1vZmYtYnk6
IEF2ZXJ5IFlhbmcgPGF2ZXJ5LnpsLnlhbmdAZmlpLWZveGNvbm4uY29tPg0KLS0tDQogZHJpdmVy
cy9od21vbi9wbWJ1cy9wbWJ1cy5jICAgICAgfCAyICstDQogZHJpdmVycy9od21vbi9wbWJ1cy9w
bWJ1c19jb3JlLmMgfCA2ICsrKysrLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1
cy5jIGIvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1cy5jDQppbmRleCA5MjBjZDU0MDgxNDEuLjIy
Y2Q5ZGUzM2Y3YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXMuYw0KKysr
IGIvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1cy5jDQpAQCAtMTIzLDcgKzEyMyw3IEBAIHN0YXRp
YyBpbnQgcG1idXNfaWRlbnRpZnkoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCg0KICAgICAg
ICAgICAgICAgIHZvdXRfbW9kZSA9IHBtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgMCwgUE1C
VVNfVk9VVF9NT0RFKTsNCiAgICAgICAgICAgICAgICBpZiAodm91dF9tb2RlID49IDAgJiYgdm91
dF9tb2RlICE9IDB4ZmYpIHsNCi0gICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaCAodm91dF9t
b2RlID4+IDUpIHsNCisgICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaCAoKHZvdXRfbW9kZSA+
PiA1KSAmIDB4MDMpIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgMDoNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgICAgICAgICAgICAgICAgICBj
YXNlIDE6DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1c19jb3JlLmMgYi9k
cml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzX2NvcmUuYw0KaW5kZXggYmU2ZDA1ZGVmMTE1Li43ZGZk
ZGQ0ZDRlYmIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzX2NvcmUuYw0K
KysrIGIvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1c19jb3JlLmMNCkBAIC0yNTg5LDggKzI1ODks
MTIgQEAgc3RhdGljIGludCBwbWJ1c19pZGVudGlmeV9jb21tb24oc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCwNCiAgICAgICAgICAgICAgICAvKg0KICAgICAgICAgICAgICAgICAqIE5vdCBhbGwg
Y2hpcHMgc3VwcG9ydCB0aGUgVk9VVF9NT0RFIGNvbW1hbmQsDQogICAgICAgICAgICAgICAgICog
c28gYSBmYWlsdXJlIHRvIHJlYWQgaXQgaXMgbm90IGFuIGVycm9yLg0KKyAgICAgICAgICAgICAg
ICAqDQorICAgICAgICAgICAgICAgICogQWNjb3JkaW5nIHRvIFBNYnVzMS4zLjEgU2VjdGlvbiA4
LjMsDQorICAgICAgICAgICAgICAgICogSW4gdGhlIGZvbGxvd2luZyA0IGNhc2VzLCBWT1VUX01P
REUgYml0IDcgaXMgaW52YWxpZC4NCisgICAgICAgICAgICAgICAgKiBzbyB3ZSBza2lwIHRvIGNo
ZWNrIGJpdCA3Lg0KICAgICAgICAgICAgICAgICAqLw0KLSAgICAgICAgICAgICAgIHN3aXRjaCAo
dm91dF9tb2RlID4+IDUpIHsNCisgICAgICAgICAgICAgICBzd2l0Y2ggKCh2b3V0X21vZGUgPj4g
NSkgJiAweDAzKSB7DQogICAgICAgICAgICAgICAgY2FzZSAwOiAvKiBsaW5lYXIgbW9kZSAgICAg
ICovDQogICAgICAgICAgICAgICAgICAgICAgICBpZiAoZGF0YS0+aW5mby0+Zm9ybWF0W1BTQ19W
T0xUQUdFX09VVF0gIT0gbGluZWFyKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT0RFVjsNCi0tDQoyLjM0LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCg0KDQqmublxpGy2bKXzpM6o5KX0pvOq/qXzpWmv4KxPvvexS6q6oUGo5KS6rmW2yKjR
q/ypd6aspfOkSKjPpc6hQ6RXrXqrSK6nqu25Rqq6pfSm88ZbwkmpzrdOqKO2yKVOqu2t06RIt06o
o6FBqMOko6RAqXelTqrtpbukvaVxpKel37P1oUOtWbF6pl2ssLt+tsem06asqOylu7ZspfOhQb3Q
pd+nWaVItmyl87Nxqr6xSKXzpEihQajDsU6lu7ZspfOnUrCjoUO4VKTusU6lu7ZspfOpzqjkqv6l
873Gu3OhQsLgtW+hQrSyp0epzqVIpfSm86fOpqGsqsVTplal9KbzpEizesVTprmu+K6nqrqkuq5l
oUOlu7ZspfO4Z6XRIEludGVybmV0ILbHu7yhQbVMqmurT8PSuXGkbLZspfOquqe5vuOpyqlNpnel
/qnKoUG2bKXzprOlaa/gvkTCq6fvqc6vZqxypEqrSaFDrLC9VKtPuOqwVKSnpnel/qFBq9jEs6as
pfOkSL3QtE6lu7ZspfOkzqr+pfOkp62rrW6kuq5loUG7ULFIpfOkSLZppua9VLt7DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KDQpUaGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVu
dHMgdG8gaXQgbWF5IGJlIGNvbmZpZGVudGlhbCBhbmQgYXJlIGludGVuZGVkIHNvbGVseSBmb3Ig
dGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZC4gQW55IHZp
ZXdzIG9yIG9waW5pb25zIGV4cHJlc3NlZCBhcmUgc29sZWx5IHRob3NlIG9mIHRoZSBhdXRob3Ig
YW5kIGRvIG5vdCBuZWNlc3NhcmlseSByZXByZXNlbnQgdGhvc2Ugb2YgRklJLUZveGNvbm4gSW5k
dXN0cmlhbCBJbnRlcm5ldC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgaXQgYnkgbWlzdGFrZSwgcGxl
YXNlIGluZm9ybSB0aGUgc2VuZGVyIGJ5IGFuIGVtYWlsIHJlcGx5IGFuZCB0aGVuIGRlbGV0ZSB0
aGUgbWVzc2FnZS4gSXQgaXMgZm9yYmlkZGVuIHRvIGNvcHksIGZvcndhcmQsIG9yIGluIGFueSB3
YXkgcmV2ZWFsIHRoZSBjb250ZW50cyBvZiB0aGlzIG1lc3NhZ2UgdG8gYW55b25lLiBUaGUgaW50
ZWdyaXR5IGFuZCBzZWN1cml0eSBvZiB0aGlzIGVtYWlsIGNhbm5vdCBiZSBndWFyYW50ZWVkIG92
ZXIgdGhlIEludGVybmV0LiBUaGVyZWZvcmUsIGl0J3MgYWR2aXNlZCBmb3IgdGhlIHJlY2VpdmVy
IHRvIHZlcmlmeSB0aGUgdmFsaWRpdHkgb2YgdGhpcyBtZXNzYWdlIHdpdGggdGhlIHNlbmRlci4N
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg==
