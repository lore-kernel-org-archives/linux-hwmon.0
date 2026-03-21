Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657052E92BA;
	Sat, 21 Mar 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054458; cv=fail; b=On9MepkWgryU8+WNsWT/F04emVPZhstIiuexyQxswG/rTAUugZISOlZq47bx/xHPTdlZcM+w05kmR/72smUswecRqcNXGFN37FdLs9KqgxajVV/CCiXDtK9LC0Y1M6GooHxMHlvYOXZkgk2uIFrqTcull2EgxpEHVa9iYACbpk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054458; c=relaxed/simple;
	bh=Iv/niL89rOYmMNWDQn9uSRlgSLWLpcB1eI6P2l1l0Z4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gqfsEeBwvyjQutq5DmhJBA+gY/JgyDgUEu4TLDeJB4jQu9Ucrda6NUWjxfeUxHULiP3/UtywqOpAqc5ZXNKmgh7lMnheZVHzHJKsVIJ8yZZ3wyQRY8kUVsXNa0qa3dLR4DPCDV1aHagEbunV4TFPghnsSxwc3ePLtBcGhh8WRf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=OMDmHwyy; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="OMDmHwyy"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L0p0sv1801161;
	Sat, 21 Mar 2026 00:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=FY
	WI9f8+DwHYOii+EoCnQC48vC5G7SKRIYvfHZa6M0M=; b=OMDmHwyySWerke++xH
	6uhP4SDWasKyAOyPtaBJwTz4EfLgSkf43cEKzuBSls/qo3xACpMRF0eXns5ipV2h
	ajaENnNNdrjG+WdAd2H5ptUko11nVMGCVgcau7yW1JfqwejxfyLxGdsupwcn3GAj
	6WGRwF35AhnXO342SxIWKRDNLst9+fZ9zCD7mptzEtVwaUE6uZXH+vo3gFzIgOq0
	O3XVH+pjGFZc3MK1Ni5SiE8PTbwO1r7Ox7e/HmQZ7FAHeyoPi8p3a8CvUx8lCHUt
	fXb8cf0wA2WZHUDcitLtr7Sla2zIQdAhHuZsh6Mb3BAR/g+z3sJkf23uLPcC8sFJ
	chng==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d1h5br0fk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 00:54:02 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 9D852295D1;
	Sat, 21 Mar 2026 00:54:01 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 20 Mar 2026 12:53:44 -1200
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 20 Mar 2026 12:53:43 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 20 Mar 2026 12:53:43 -1200
Received: from CH4PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 12:53:43 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujq8U/KEdEh1qls9bukELdRmIuslcXlcZZT/WXkd2OxCUD5CdVBq/Eg8xVG/2Azze+lWz5rqSWkhIBzLdoXh2hDJ6Ur4UAddcpJCVHwm1ClsN1BPkUB3SdDWce80cydRsVKMigWIseZbcmck3EtmYxeLOT1viF2WWjLESHYIrYKhmgwJthTi58a+yXrRivavWZkViZyhBkKwKPtZc9xV680UDyLV9HXMoW6tnWf7NYuMwTF43rWSSNxpiqe+m/8eq5uZE9cvb1r/mW41z8/wHLh82NUgyhOxE3iK2/tdcHRd1xrN4RVbI82Eykz/gjVL9YpPzH0w0PwgvsI1a3B26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYWI9f8+DwHYOii+EoCnQC48vC5G7SKRIYvfHZa6M0M=;
 b=rH4kX7NCguQIxySsPxIgJkdEYrHF88L44nIwyeTzhwbW1LLGLVQVZRxWbpLAru2+c4WDbM6+UnyihLbYbPz/ZhKbRsuGk0enUnGw8CAq3ao/XZUB5i0F3UzuwQ7tuQXtMmroU9FLtsz7SvGQ/9hOFv1tAV2bt+iOlKV6ZCBKRpdi5z/eHWv9FZWc0e1cmKhpB3Ux/m0/q3/kxu5MGKl6NXUXTQhRIUTJ31EyEYzX0gsSYyqi+vsQt4poTD2F22Y35yCIcdlr2CX+LWJHMnlXG90AYUtiFQq0nTL9tl4h34hVYa2AZ7y+Ov5LWiZRc2XQ5zIEQnLcqb2ZC3UVQo9BQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV8PR84MB3772.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Sat, 21 Mar
 2026 00:53:42 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 00:53:42 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v5 4/4] hwmon: (pmbus/max31785) check for partial i2c_transfer
 in read_long_data
Thread-Topic: [PATCH v5 4/4] hwmon: (pmbus/max31785) check for partial
 i2c_transfer in read_long_data
Thread-Index: AQHcuM0p8iuZzkY/1EGBa9BYO+QdeA==
Date: Sat, 21 Mar 2026 00:53:41 +0000
Message-ID: <20260321005206.6350-5-sanman.pradhan@hpe.com>
References: <20260321005206.6350-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260321005206.6350-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV8PR84MB3772:EE_
x-ms-office365-filtering-correlation-id: 41deee31-d278-40ac-96e4-08de86e44c14
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: egnNcvCZm7reKmKLTzjuJlpOytJLbS0SnzY9YPQIkZD82JeWIlFaoFuBfFWNzmJm0Xbex41cd+xe7Bogm+Yy3HUTz3sIuVNnZKDnpITYYhWIypW+bpKkkw8u0YfFWN2kRethFMTwv8QFfBKhWTJscZqoymCUVtGmYrasWGjFKNfGlDPem4jZ1kWvQ67AVj8q7Ss0RmWKJJUOUuGNmjqiOfJZ6gQw7t1XOSjNCsNLEGs8wB8SMwKOk5vglpqaAbwF5Pp4nxjjZjVEN+uuqMycKya4+pMo8RMpimwpE27ytLSOx19vX9LgReze2T/3MaxO96aAQ+WFGyrD3pR2Gb+OzBkEkh77xfbNEFg3xww/+8Qm0aQRTe2jvHogpu+5r12hmlW9OiQNv+EOJvWCR1ObTXNbRqY9KZYX2nins58Wjk89xwiYPPenIX7Qb6hC6Ojuox85n0poi+U2UDWLt8qK3bQwg0S/ndy+dV2bgQ7iOOzzUvcjUxShneTFC1mlRoT/+8z6WwWC/fvmyONx++vSJe6hqc0qkwrOODGF8PuaLmvG25uQd/TsbsrWJTmZFY5uNuMXTH+HGV8OY3rKdFSgZkY/n6p/OcUnnG8/JMo7jp5TYMnRc6UrybuwT1d2VXieQZD0bctX0G51lJgbUbXruw7XPInb4wuaHh8jlRs4/DlF6L85yEiWUFJUa8dKmWVU/ni2D0J1VkV90lpSYbJQrKepR2nYsNRj/jfwznTxe+E6hp1YwaJdHow8bR8WrnRMqBMxMMX+izOL+D38CLYCV0g/zSlUTd6A5PxA4rj44XU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GDiyd4P2g//OVaBK1N7NK9BU0I9uw87hp7ZrnF7G/qAZunGtW3k1nNRVCI?=
 =?iso-8859-1?Q?EYfMa03VyH4w4J11G8taoOYzZU3LM038GC7Kl2nIcWBmyVFOanzyMEQywM?=
 =?iso-8859-1?Q?uYttiYX1dw/45d+mHAE33sOY0xT3L2F6IqmZieF0Bi1Xbw5+PlZY9MRxzF?=
 =?iso-8859-1?Q?UJDdETbIZFCJnzb+9uFe/RpC6/0Nd5d/n09mHGStXxz4BhJ9c7SEq7bSTD?=
 =?iso-8859-1?Q?1imjifrbGW7Phkh0NInWeE40fcqDC+FcvyYkkb6QKrvx7Tr9e6ZRaKoIuc?=
 =?iso-8859-1?Q?YgIdT5TwDsZSRimxfZB0w7ZnQVOvUAXD83YufU5C1/DPW6KusynemLS9CI?=
 =?iso-8859-1?Q?el5+8bohVhwqWbmfLmgZhFXpgTLExVs4szpGEmEtmMjgmij9TT/zwDcmWS?=
 =?iso-8859-1?Q?OvjNyhzCVMzcGwawU2RwIa7M/oDgJMvFHUJxqjZwbDp3oVnN1ytPDxGXUE?=
 =?iso-8859-1?Q?kxN3ic6eLhXzVMccMeKbKsOPdRe9/+Re0Sb7j/FjEZ2czKen1kG7KKiOCi?=
 =?iso-8859-1?Q?XhWBymlElbfIVVegrVNv4YbKIvwRN4jWfbjNtggRP4/l/J0l/j7THj0aQS?=
 =?iso-8859-1?Q?8apvU5oY0DVxd0f6mf1vQYKuBAocGEpTADvEmKoXfQQaUYYEJeGIPnXymO?=
 =?iso-8859-1?Q?2MnTNUMML6RuOHa2iNi2+qO40mVP+LqRdiAiXci9U1HxXuFwcZOkrNCWoG?=
 =?iso-8859-1?Q?SEuvW3DMO/0lD+Ul3JzapQoMOj1O9Bgz/AwQ9/m77uwp9eCEzylouxrD4R?=
 =?iso-8859-1?Q?kylLiO1i7UwFGjdW8mHULc3Tb9n2N0jUkshGcKEPn5SCPreJgXx5z7OlN9?=
 =?iso-8859-1?Q?qrbGSHWOfaJ37v13CqFIEU/2X9/HnsrSD0dI3IZyaMfTVdEcuUoypPKdlQ?=
 =?iso-8859-1?Q?3H6cqIKe82GrT9wWOSflAJbyrsgE4PE7naAJHH8GLi6ei73vSQvxsCV0We?=
 =?iso-8859-1?Q?7lsUzmq7ctbYWKiyfAM0BSypJd+GXezf2lyGQmVSuo01AoLr8oacAdx/nY?=
 =?iso-8859-1?Q?aPbMv05SL4+i9SJyvT4YptjgRJlSWcwyhk0ZmoR9hBHFi6GO7/odpNc7do?=
 =?iso-8859-1?Q?2NuUTewtohLRSbTluhqE8SIorWxSJ+daxwNcSgD86t0ktiDMlcF/4bInP0?=
 =?iso-8859-1?Q?5A2RiOZMztyAylWe9UOJUVefbjrYy1JSDZ2fHz6KovDAoMP4zyWgdflZm/?=
 =?iso-8859-1?Q?4vj5vB16AqY5CHlDIZAKyURjgX9BFKh5fQ3ru03j82El4PoyHd7ZmYfpnj?=
 =?iso-8859-1?Q?ekALDulSoJpuuCy8a4d0t68H48Kz8pWKS7Un59zQSZ5hEp+AVcLyGJjK91?=
 =?iso-8859-1?Q?ntPqBuSfCGCMtyI8Wmi8dKTvmODUx7qsd+CFjsqPbZIRX+3NzfnbjLbANH?=
 =?iso-8859-1?Q?p1bvxwcXJ0QSa9tchw8EC/k4VKCuMuvhKTHEXsk13emG9YoR1sbhnNyFP0?=
 =?iso-8859-1?Q?dJk14GK7Rir2alkvM5bJJn8cK5+oRhMscTOKr9bnu2FvLqdALE6A8CeKbL?=
 =?iso-8859-1?Q?ljn4Y4v+dsmzmdHJEM7/vwGyktr4IPNZPXAxm+PIsmNuZyidUK0ovFb3E2?=
 =?iso-8859-1?Q?Mgs1vUrbZyL4iopgNqLI4lPptvYFzJpdJgSZF9pT0XLvRO4PgQJryPRyiI?=
 =?iso-8859-1?Q?sOSECMbhTNgwSZ9aEY1sFviEJF1WiwlKub66K829NCt2hBrR5a2Ea34m0R?=
 =?iso-8859-1?Q?NgZpW3AIDcnAUZfrYWhvTbaleUd1d3ALIZNtbT//VZfdCf28OGabTeAum4?=
 =?iso-8859-1?Q?ITmSX6CqrC40rVlS7l98ASZ2elfiuOy2yIEaChOZ3yU9c3uWqfE7PQk83r?=
 =?iso-8859-1?Q?L/DWNFIaqg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dbPHJsMyYB/qZCOhxeScflZ6SHTSDk+KeRz/jJ7l4RBpKhskRgUrb/u+Av9l6wDe+u7LwiETqsi/cupfMuF/ju3So7l/ejA1t0yAfDhVi4hyAV1Fui+QkD7NZzH4L1nDEJWAZNY7XJNeYfydiWIuePsUWz6hMjJI6jEF9RIF/lKBbceTpgouUMPrPwoGY0qNNKiZKDUI9SbQ6l2eW0K+PadIMX7oiVUl6dRlEa/KOnHj2hkqkLhAZEGBDefIe+M3xTA+rph6rqkyd3dIiB8DLQtM/+9dbWayPiH+jtUjYB64suS7C36ZOhy61Dicw1xMkyr+K4T8j66UF4wGMijedw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 41deee31-d278-40ac-96e4-08de86e44c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 00:53:41.9814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+VVGE7VL8GJ/j0R//Yp6rf8NlZRze27pophgukN6z+/j93d5iz7o4a1TU0qIhm0zDhmKHSAKgB4K+nzUSzVmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3772
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: Ez4e1w34PjIKPdDpIu-wiuCugxrSnRiP
X-Proofpoint-ORIG-GUID: Ez4e1w34PjIKPdDpIu-wiuCugxrSnRiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAwNSBTYWx0ZWRfXxQCilA52NnX+
 rAwb+saGpKwuPsrmbgmXmjFwuroLPYZ/do2fSMfdVWrLCDt86vM2c8JULsv6FYDyvLz3x3HKdC2
 Wd/XaXnXuHQ6n/ZDqFzYfP8P7Y9bFztWNeVVd9CMbLktFUrbsuZ03hNowFjL6Bo3WqQBTKVaDYQ
 CWmxvaC+tQRP6WyUbvsGG+HZCle4oE+6geKGKmq2yEoJHW5wpeIYICEqRRiUwzq1G2HVy1s7Zrn
 OvwwLFADgB60U8jQlkXtbYsKuLP8d1yyi4VX6jg4HswsEZbawNLcf2pj/wWKzWpR5xsNMBdH/jC
 X33T8hIvFzumGQmZINKsLsCZUSB0j6fGlAT8j0uHCgqmic1NVWqxzZHcQ7Dic0cBtw0/m+K+mM4
 4m3FjCgTJdqiAB219lriJtsH+eKY1IjSRoyvdZNqw0KWdxJc+SJ9za+cgMfga9SjY80YZ5BPJBC
 Efcqqu2ZfiOh5+sAVdA==
X-Authority-Analysis: v=2.4 cv=I5Fohdgg c=1 sm=1 tr=0 ts=69bdec2a cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=OUXY8nFuAAAA:8 a=pxZigRnF54JOt-8cZC8A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210005

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
i2c_transfer() returns the number of messages successfully=0A=
transferred, not only a negative errno on failure. When called with=0A=
two messages (write command byte followed by a read of the 4-byte=0A=
response), a return value of 1 means the command write succeeded but=0A=
the read did not complete. In that case, rspbuf remains uninitialized=0A=
and must not be interpreted as valid data.=0A=
=0A=
Treat any return value other than ARRAY_SIZE(msg) as an error, and=0A=
return -EIO for partial completion. Also return 0 on success instead=0A=
of the message count, since the caller only needs to distinguish=0A=
success from failure.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v5:=0A=
- New patch in the series. Fixes a pre-existing bug where partial=0A=
  i2c_transfer() returns left rspbuf uninitialized.=0A=
---=0A=
 drivers/hwmon/pmbus/max31785.c | 6 +++---=0A=
 1 file changed, 3 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.=
c=0A=
index 260aa8fb50f13..3caa76bcbeb5e 100644=0A=
--- a/drivers/hwmon/pmbus/max31785.c=0A=
+++ b/drivers/hwmon/pmbus/max31785.c=0A=
@@ -141,13 +141,13 @@ static int max31785_read_long_data(struct i2c_client =
*client, int page,=0A=
 	 */=0A=
 	pmbus_update_ts(client, 0);=0A=
 =0A=
-	if (rc < 0)=0A=
-		return rc;=0A=
+	if (rc !=3D ARRAY_SIZE(msg))=0A=
+		return rc < 0 ? rc : -EIO;=0A=
 =0A=
 	*data =3D (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |=0A=
 		(rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));=0A=
 =0A=
-	return rc;=0A=
+	return 0;=0A=
 }=0A=
 =0A=
 static int max31785_get_pwm(struct i2c_client *client, int page)=0A=
-- =0A=
2.34.1=0A=
=0A=
