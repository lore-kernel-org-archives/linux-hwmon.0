Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEEA351C34;
	Mon,  1 Jun 2026 18:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339562; cv=fail; b=LFoDys30F+6N54UlpqAnmFLZ/gt6amAMlVXy4n6e1bo9aRa686/7sjk7/bw3pt/ImXfnUzpCxv+xTKXSDc4Mzx+/aFB2sQpXA5CWExJaY72XKUX+4U+XtpLPsX+abZJhxq6ijUN6qQ3ZuIfTkhmRK2bm4xRQShskjtl8Q8K5bqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339562; c=relaxed/simple;
	bh=tXpAdLhF0x1yMVzWCk28MT8cHEV4dgNR86+awqz94EI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GIxmGiV8AWzUdiZDSglnFH7FCfQcaBUhLkNE9jDqSnTRFr0CZzGhj2eaATHQzhk9jE7W0NTjDZf8EmH9/ecUFzb2Wr9CjecKMg0gZVQjZplIVE01st4P2m1+ZPSNBQ5F5Mw81N9+CDPnIMT5pgkW6JjB6tx5x3NINVwX6d1YckU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=d8xbQ4zj; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="d8xbQ4zj"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651HFGki134164;
	Mon, 1 Jun 2026 18:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=FX
	2Ow6/OECAX3Pb8Md8AXEq8OQyqdB3GUwyHsCcWNXg=; b=d8xbQ4zj+i/h9BILEB
	d8SjSDvnLYzF2iijUedolZgDDdwisgSBqZL8lsffSuqD7ozOQwEGEvxDq5Xb0tlH
	YIb5ZZQkQuz2uNZF0QMqLdq5mclSPelhTjhuPCimtEk0Pw2WNsxcXknlZPAEbfwc
	OEKWpQSuImJATNlrSnzK2OmJA0mC2vVyGt9Xd8wGnpsW8Yf+qjv71v+Mr1jYP9CC
	zpOVHBFwfcsNyoGS65/vlFZNuvaOG0tSFAII2FJZ8zR0R4ADGza3jTM4tLU6Ea/m
	bXzLUzwYv4TKzEyTv6MUiLOWjimwv62pm0C9YHwehoyo2UpjV+R1FPv9h6wG+knh
	ulZg==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eh977we0k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 18:45:42 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 45894132C6;
	Mon,  1 Jun 2026 18:45:41 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Jun 2026 06:45:33 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Jun 2026 06:45:32 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Jun 2026 06:45:32 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Jun
 2026 06:45:32 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnvSahZolO6Q5gSStN3bd3SIOJPZjc7s2xPrhcIHrj1Vdh1XbDmJwmOFD6taPLH6Wx+SZ5Iru0HKflXtR8IG6bHgSjXj8Si2W0StG7Sv0GPAef9T+NAngT4I8cDXsFGpxgeal2OOV/u8OVWKNcPQO4JHGB9uPWbGvhAxVenLf2CgnBON9YH6R4Gz2zIUpAAu+3hUj3mLxXyup2TvYctxKP7F9KHMY+0+TTeHTD4afPwSL0Jm60O8okRcG36/GUO6xf+YtM4nuI5sYdGE/3/mz4X0VpSBc5oyq0PXT+IL6Y+tWm5P3T7mD5hlBmf1AC1Qm82Lbg4hPU88Kz3GsyHouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX2Ow6/OECAX3Pb8Md8AXEq8OQyqdB3GUwyHsCcWNXg=;
 b=FPV/0WSak9OG/CEYhyx92uPZ2EtCDyROZjrnMlf3LJzwDk8ugiqlZouEJY538GDv09GyvTva2xyoJoGJtoS22Z+ZGzxZjU1K44kU+GtnmS918XhiOEuMChMLfWMHLS/WceIMJE3RH9ytqEv2+3u7oTnyqUJwMukAS/dO1lcT1Plhr4QMktrLvimHN6TFo1aboptf8mcoAHv047b9AJeRFYSBMzmHmlwcKCRao/KIDCSmiR5cdkKzwaKr46lb6CN4CDc4O7MoqvZIFHkpRle2tkRZcSPsFDQZ3snJvg/RbjYgPZ3FPgptuJ28KT2acRIxux8kXa/i0JsL+h+CNam/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB2095.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 18:45:30 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:45:30 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "noname.nuno@gmail.com" <noname.nuno@gmail.com>,
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Topic: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Index: AQHc8fbSU1c/+Lm7gUucrwUlkyOeGA==
Date: Mon, 1 Jun 2026 18:45:30 +0000
Message-ID: <20260601184516.919488-2-sanman.pradhan@hpe.com>
References: <20260601184516.919488-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260601184516.919488-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB2095:EE_
x-ms-office365-filtering-correlation-id: 34ceb5c6-45d4-4c5a-1b63-08dec00df4a5
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099006|38070700021|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: vnuloOzzmBjyKeQuu6FOsX1j8wxsDzEqzBj5SdEomfx7GBD1kjqdjN8G5DBX769Bh0Ig5efBtv+aUpeRIh0nofuUG1OV9P86YXVZUiMQzRD/MPgzNsXj+Owbr+qRE7ti57M1zSHfdo8QqTB9bowc9DKxqrH19YGkgQw7sXQs9bfn/WMK+M2nbeDzBiMc1tbiRB55e1dazFwSt+Y4XGKkGtirejEYHMwZUC7fgArJu5Pyxr06e32yBSfH7j9SbTOLsBzPhFCo003LMYZtPxFXr4+aXp3Uo6D2gFTtuJswnM6tONJ7w6ZhonUJ0TqUeI9J+Ys2Bnh9DbtLGWFlxHPni+RV737k9UV5ehXiEkJQCG4gncaRIYd/ecC7m8h2/wuhhiAOW8y//jQUu2W3N7tcIepZIn2nKjFV/V0XP8prc4jx0VG4cyoYWRn0m3rVfItGy4kRqgn8yko40JthoCbH24/eGbSM1V4/Li+81HRsn9S3S/3jH8n8TIJ5npSO2+GSgiH0+YxXjWRyKgW/6B7yh3MZNnWdC1KuyP9FmydCC/d3KzRtIhgRyXYbLsPQWcijnT+W1MR1QA1gVm2OeSvAz114eT1JgMH5qvBGBtv+VYkEjdhNd0Nkt9L2YTnr4IDJ4/kDQarjzVYnwpVfCxYknZ9AwWd9YtzZBlZfUbN+JJC3KBBxZkoGP+18SE61+ahUPlc43NNPFVuglHLbIx1hAw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099006)(38070700021)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7j2+f3cqRoC37S2OG5pW59cgjSH0VVN5Ne3BWaPcnMLgWLo3LxEvT4tmmx?=
 =?iso-8859-1?Q?MajsOjxWAWdD1T7h2M+FNF3yizqxfgwzy9jQQKoIhsftI9MpJE66AkUYP5?=
 =?iso-8859-1?Q?w9//LD1T7Pl2fEmxFBHdjJLXQ1LMUhAUDp50J3hnm62MbqQsdmH47LnqbW?=
 =?iso-8859-1?Q?M6qJOgh/beTJcVBCq7tixt7vSKRy+4u6Dvcsw4JVw5j8SOkaPA5fuuSbsq?=
 =?iso-8859-1?Q?O5ur5Tr0I+VD703WrOwoRLqGfhVDo56meJULpVAhMYxsu0SL8FmPB40Aso?=
 =?iso-8859-1?Q?NH8kEGgjT9Ihm4oN1nNX93m2UEGrdjICQJKR1Xmk1+WNbgJ7mItp492HlM?=
 =?iso-8859-1?Q?zLyrVVDEhMXABAGLXqLgPMO8r9Ky/0hcTqs+5JIq6ra2nTtwfpRnDlgqQq?=
 =?iso-8859-1?Q?n+ACIyFXIPXwrLssY0DHQpArNdNSmQbVZrU/7KrQpcg9/6eZhjI2JPSALH?=
 =?iso-8859-1?Q?NwFde89vluunFxq1BDVzn4wHcVQa6NKNO6FNRJqfkjM6mqM+XKAyUF9XlQ?=
 =?iso-8859-1?Q?EMOa5V67WqUfhgnqgua2QBusWqOYlIJE6n3HJxPj8ltpZzgUic/XuAEp5R?=
 =?iso-8859-1?Q?iZXfqEkzZeBqdT6t/zG0g2FOwkvt42bnbJJqa+lOJZ2CKJFvySMysjTqMa?=
 =?iso-8859-1?Q?FtEkS2xWCUeFq06Qcfxlr/ZAZrCJn7AgAyfmhjwAKOB6U8PC1TqdeCTiyh?=
 =?iso-8859-1?Q?mJ/d8nhSwy8yGbEQA+R9hOOH2u/ttAF62IdweCv20D7tMaGp9OQwAO8Zmq?=
 =?iso-8859-1?Q?SDMBt2S+T8+TLskk7nZPPjhNeFvrkUIggIfJg+EgtJ3Xdm4sG5r+sPVeIV?=
 =?iso-8859-1?Q?gLoS6Ff95S3+JCuoPoM8OjE5sUw+Q5D3ABjzSskWg3oHMbtp5BrbiD/6iT?=
 =?iso-8859-1?Q?E1d976AbW8w7wqHV81UVR/pabUS9Bpuofxj+u07q7k/Tje0+X36DbGevPG?=
 =?iso-8859-1?Q?lIsniQQGrPooEvg9Bv+xUOT+QusIYctxX8azA14Yta7tGWjMIS5ZtanLSx?=
 =?iso-8859-1?Q?XMeXNVb47uboG6qu4fPdX2Mf/6bgfAeUaQdMpCvcjdmDSdePoxn4C3C2tE?=
 =?iso-8859-1?Q?Gi3uqIsWroYXQlEt5HR7O+n4aFPXn1PNlTQnWbBhVm1o37kQRpAXbHQBzF?=
 =?iso-8859-1?Q?bsRFRR1tCdNbW9Kbbacj9uOe/5yZRsmUPUqC98CiC/UfQKAHb8kcMdCxkp?=
 =?iso-8859-1?Q?v0QywDN3tUy1HiWmzJ1VBWq5rtnKOUbQqCwajygL0hx8Ne0zfHslvkM481?=
 =?iso-8859-1?Q?CA6B+wnbTemHqkPaX+zUsqSVagUCr09B51akzQQ7HJGEqvFurS0gMk3ZJ8?=
 =?iso-8859-1?Q?f9TtIcRSMcNi2Gv5bi3KKFMDXhHkoD7G9BLr4vlbWtKzsMLBss1Mr+DTwQ?=
 =?iso-8859-1?Q?xKeKBdHVjmx36QGfo4zplW70ULmQUH8xrLJ0MehHm7EtrJddvoVnFoVR8f?=
 =?iso-8859-1?Q?2OJ+qOds9SPpZtjR5j2Ik9CvlOuwNIuQIcBvJ7+7QQBzO4wIiojmiBGukD?=
 =?iso-8859-1?Q?xU8rDKAAUXpzoYpU29GBVUtDRp72O8z93h57UVWSotnaopBSDw3n17Jj5e?=
 =?iso-8859-1?Q?N1v5JHiyrJF/j0YlW/ZRNicfXfxc8D7jpsbtcLTqSO1Ndkdq3cHMpQ1nkH?=
 =?iso-8859-1?Q?t/Yj04gceQVFO2PCjBtb3fg55bGPoP4Gxsv69e+WHs6oSRjr5h97euTDj9?=
 =?iso-8859-1?Q?fWl58hoIoqhCMED980P4bKrYLosLmuuw5eQcf1npvTe4IuxwoBVrS8iw2S?=
 =?iso-8859-1?Q?wOgQ7Xd0L6SllmH+rYBq1FrF172+IJSi83hBho15PYAdaD8W1rrKEhNI4y?=
 =?iso-8859-1?Q?o1rn2UogWA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QxUMqdFK2OAXw0gcjUshcvT2kZP44p9u2f1/XLcxzd6IRVSdqxkzsTmZnr9lWbiEKsYGM/BgvFTUmR+PvBg2Y+sj6RkbBSJEFrpXuiCHiBy6fT4rYASE3VR9vNgNxqnvDdrcpsa5IL+BetglTyN8d3rlFOIJNYwYuKKXZ8jifChIRROV/5HgcIUusJlTVMXZ4/DgJU+KkHyXkXVbRe/W9kpxMbJLdAt2XAPlhA8T9dMndtTK2zQrGEztCtQATXSZdCfy/Vq3Fk7Qd6EI9OZV2wfpa9yJ9l2uF/ERpzNgk4pjSVg5UZpxbZirAePI5bU/U5DFWG5XeKy3+bh0Uzmxbg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ceb5c6-45d4-4c5a-1b63-08dec00df4a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 18:45:30.4498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5VSy1Iy4V9GkXfFA65wU3G0UGYlV1dlWTrZUKm7Z9bJAijhhreNlzlb0lfNcQtxZSnV3t7eAplZAIe8HXviY3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB2095
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a1dd356 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=XYAwZIGsAAAA:8
 a=HxtRfhFi30CcAKtSzY8A:9 a=wPNLvfGTeEIA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=cAcMbU7R10T-QSRYIcO_:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: HryfjkMfG48PX0qt0CBQ8Nzc-m558nsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4NCBTYWx0ZWRfX2+NTiv7rB60B
 IxURtXoTzbCQlqiwiJaWJcz2CoelYWe+AOHh424dp9iaHfQFi3maUhbSw+T5a7fX7t4lcChfHbA
 SZnXmQhWAmbelBXqTkwEmGhsr2VMr6CuwkwuHtJ6YqCAgw8JT+9o5KGKNeJTAy51ltciUHV6bur
 GPqQ0PF/qFxJi0YC8ZMnKjaSf+GvLnMeAVSjxVlqrHKeGUs7ev9XpxMz76yFcpROLCWuesPscJC
 Ecb1Wbr3SCMVIgQPwcCpFYra/fBYP49TPzrkpxIKATXSVJu6FsAGWzxch7VxajIoqsyn9JqrZhA
 XMUsMC/NsoR9bhD7DsoaObz2e0e33Ha9idkfGay25IGaC9Ie+Ah6cnPTeTmjeKp+Q0wZDTgefvL
 S6upWnGfER4RvVsQVEtBqlLHv2O3DjECYcUsSLBzO+4Az5jfbqyYFm8MAi0uPLr+V41An9kDeA1
 bC2fAh9aPEQa6Kl+NWQ==
X-Proofpoint-ORIG-GUID: HryfjkMfG48PX0qt0CBQ8Nzc-m558nsq
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010184

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add devicetree binding documentation for the Analog Devices MAX20860A=0A=
step-down DC-DC switching regulator with PMBus interface.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
Acked-by: Conor Dooley <conor.dooley@microchip.com>=0A=
---=0A=
Changes since v3:=0A=
  - No change=0A=
Changes since v2:=0A=
  - Drop "maxim,max20860a"; use const: adi,max20860a=0A=
Changes since v1:=0A=
  - Added allOf regulator.yaml reference and unevaluatedProperties=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 45 +++++++++++++++++++=0A=
 1 file changed, 45 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20=
860a.yaml=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
new file mode 100644=0A=
index 000000000000..dd238265d462=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
@@ -0,0 +1,45 @@=0A=
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0A=
+%YAML 1.2=0A=
+---=0A=
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20860a.yaml#=0A=
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
+=0A=
+title: Analog Devices MAX20860A Step-Down Converter=0A=
+=0A=
+maintainers:=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+description: |=0A=
+  The MAX20860A is a fully integrated step-down DC-DC switching regulator=
=0A=
+  with PMBus interface for monitoring input/output voltage, output current=
=0A=
+  and temperature.=0A=
+=0A=
+  Datasheet: https://www.analog.com/en/products/max20860a.html=0A=
+=0A=
+allOf:=0A=
+  - $ref: /schemas/regulator/regulator.yaml#=0A=
+=0A=
+properties:=0A=
+  compatible:=0A=
+    const: adi,max20860a=0A=
+=0A=
+  reg:=0A=
+    maxItems: 1=0A=
+=0A=
+required:=0A=
+  - compatible=0A=
+  - reg=0A=
+=0A=
+unevaluatedProperties: false=0A=
+=0A=
+examples:=0A=
+  - |=0A=
+    i2c {=0A=
+        #address-cells =3D <1>;=0A=
+        #size-cells =3D <0>;=0A=
+=0A=
+        regulator@40 {=0A=
+            compatible =3D "adi,max20860a";=0A=
+            reg =3D <0x40>;=0A=
+        };=0A=
+    };=0A=
-- =0A=
2.34.1=0A=
=0A=
