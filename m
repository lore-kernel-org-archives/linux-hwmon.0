Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF542314A86;
	Thu, 26 Mar 2026 23:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566964; cv=fail; b=RnQgxbSVg8Gapg6VcsWEeyyCtmz4Hs5evqSgzY3xoDfQtj3KazPLRsq4VQOKfVINuaLwGCprAIULIqZApOzb6dMorZlYCeVwxB0zNvF1lEFjdRkHQO8+CW1P7UtRxD91aDIDzaaIljoq0GbFUPuKmFngvhFUZ68qZRw+oRZIYkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566964; c=relaxed/simple;
	bh=mAngRJY0PauoFVSMf78g0zbSN0f263xSFMYdOFcI7+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pry4pnm/WXSoL3BcGk+avhB1yH98id7uHX87SZrY0+B1X6J/u1WhiBZu9LJncjGaQknLEWNSqZhR2KJTZ5J+BfyLrV3dWtpdlC02a1OpfBDBnYkoKZ+23TUSH6RwATcD0FxNWScr3Hurz4v/bcUT9wQPEt/PCOYH4qIf0uh4vaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=AbDxZBD2; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="AbDxZBD2"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QJTFO51854940;
	Thu, 26 Mar 2026 23:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=mA
	ngRJY0PauoFVSMf78g0zbSN0f263xSFMYdOFcI7+Q=; b=AbDxZBD2U/ilxE+2gs
	SzxGYyM60TY3v+7nKs9x7s4R84kMM8WpfrfO2C0ES54A5L5iOy2jx55eTFSaZts8
	aI7xssaI2mq6nf+RNOvsKVF7p1Ud5OJYb+9Zrf+D4NUWtoNZcYcB4qHR5Jr+tlbP
	xS4EMvL+OvFc4VT7F1+MzZCDiFBH3xm1NyjnT5t+IGfBHOuH+LgNUlDLjXLObZc8
	hgKy1XQh0ZWGO0J7Pzzqq15cGBBYIvY6IG6aW60eCuBiEIae/yjnzK1E9SryaToA
	mIvpOFiFGHUmCKbFw6S2Z3Y+A2aH698mCrVEmXYdEXCZkpWYln/TRwfTLIRkd2CV
	VagA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d56uhp1bq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 23:15:48 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 9E382D1E9;
	Thu, 26 Mar 2026 23:15:47 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Mar 2026 11:15:21 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Mar 2026 11:15:20 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 26 Mar 2026 11:15:20 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 23:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czV8+LSo07MhmSAQ8lUK5Rv+ukhDIUlVSlHRbOciylghOh3OJpjF3vDb2xWgdfsx4NMccL4rBYGNoBqJ6ku3h206HLORflKmM53jKbiNRE5nLFx0GAaSFlOcXRE3dj0CP3qir/mNuDISV7owVt+zLvSIdXXO1FvzccKi102C0zIrQVaxTkY1E22xJPr/1z82JUx7a4GInf9K1/EE5foYnczoCv6gCwUJDfQdk0MBn+3XdijcO8P95ORNU1eRNH9vJuuN4s3ckcyjonVSctgoLhsHe+2+bi+tPB57+U9kryPkWvD9ZKn5gIo4MTTiolQcdCFtXyXRP0A30B3gvYqddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAngRJY0PauoFVSMf78g0zbSN0f263xSFMYdOFcI7+Q=;
 b=SvRjWYFhxR+F3P05lt4v/5swmus+e4v8tSvBobP6FQJbc0Ks7adAIHAq+y5Fw6jGhLkN03Pgi6GUurFc7kuOXNs8ntaXRwhffpsNX8GVXl8mw/labeWk/nc+1bMAEQSNLyhG9CRsDCf9aPh7/rEa0QX5fDciqLm4JzzvFIx0lHPUDprbevEWYCY+VvAD+W2ljrNP5dntr8gqAZYfwmrbfZvzlxyYpWeLEkMFsQiWoFx2xJuFBuzETDjQ7slFWqjabw2KZ2uCpM1PinNNZi1NHMqMILSV2bdBmQ73ZgYH1TTeLOzHlAmP28iQxcNBZzYekc2jtA2wwqSxK/AM4AfQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by PH7PR84MB2246.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:158::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Thu, 26 Mar
 2026 23:15:18 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 23:15:18 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
Thread-Topic: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
Thread-Index: AQHcvXI4vvjQBfqWwkiz6FB1AZzrTrXBceWA
Date: Thu, 26 Mar 2026 23:15:18 +0000
Message-ID: <20260326231511.297658-1-sanman.pradhan@hpe.com>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260326224510.294619-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|PH7PR84MB2246:EE_
x-ms-office365-filtering-correlation-id: a5eec4a7-7e31-4732-da21-08de8b8d8bae
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: c8kpMYCCj+dI7VfeZLDUsDqxPjLbogBpQAMgzh8gDq1hCdIMPDIPE0kopaMD1CpWPYNTICLcl+lzitIgQy5MBKiKBctxl3AtGJbiecQacf6T2tIMBI90juPK3SX/sRqmeaor7to9LLJ1aD+TjUSf+TK275lZ/dolMA8c6SvDGn+ofuxECVUNmO1Yeo1+ZrYVd9n2QjyNnFfTEulyTyq2yORhITNCARkMI9n9kelhW4xJdNpfZD5ILXxfU+wGuNuaRj6wgpeevcaIVeO5OMDc2pW+BYN1JXtEAIicsqE8qTM9YSqp9WWXcyJ5kg1U1q9PgyqO0uEgHYwtcMBvSsSLcVuJnqaa1xtibyy33L0Nfk/cB+1OdFbih3j8aH351vCG69TDfm/x/eS222okTt8HXG/Qy1JKsX9UDlW38EZxEOviyaxjPZsvxipNhbvRo83Rl8SKaxE2eGdfPXr3WzLHOnbJ0zMxjweJItnWlBr+yeULsmTgzo64kyeZdKpvrKXNl4QwwffRh2aQ32B8bY67ch5Bg4VZlQDfle4TRbe2l30Mk/yYKNHKw38KgUwVKT8422MlV+KFRULh4s2aRsJglbu06osbft5ypw4BHRVbbLLuodlENbPJFJK3ti8E+ZEVzQtVA3NJX2NQsaHcZRErqklGbwC9MbDjOlbRLtL14lpO6EGcc21CNu8yDfPLmaX3X5QE55gspGZPNiSciMSgv76+LDpULONYS63/rq9xIWP/Eqd5E/Bo0M8BgKcj5xPm+UVneS25M+KOSx9eUlCxF6qNxuZKjg/o/6e85geQ7vY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XM/Q43UJEYc0xvUyam5RS4eHhJ0hFnc1DHdjzdie6Fy/flES/VocoP01vC?=
 =?iso-8859-1?Q?ePDldkDa+fC9Y0AGJ4rtFmErtNT3PAjIFFC64xGfow0117tSDntCcKvake?=
 =?iso-8859-1?Q?80naIpmfg43YNQJSN25B49AXfkEuBcE8o7V8u/ZesQ6aSo1I8wo5vhPjs8?=
 =?iso-8859-1?Q?f7wV2f1OHDHguaWkg5UnvM74/fU03W6IDqIb13VG6X36Ve1MzPaw3dTyTT?=
 =?iso-8859-1?Q?ogMY9mEQGobyYpzvSfZ42X6Aynz8KGxSZe7ZnGowlXAoacklELKejr5tFc?=
 =?iso-8859-1?Q?0bae4phdc70DagnFadBW94eBg3qdE8vBocRa9cnL29os0leRBUrqrAvUtd?=
 =?iso-8859-1?Q?s21RNIv87LbtR2IpzwtZiVnGzkazKaD5Iqqj82RDRyP3u2TrNP3rNDq0OF?=
 =?iso-8859-1?Q?n+Hv9eAcHBxhlluDW0euNBrFlEHKgIERj1LbSku671LfpLxOnNGL2scEFR?=
 =?iso-8859-1?Q?CRVuE+qmRoBn7atbiGLoSy8Q2B4VHvvFzlIWCkB0BvcKUCTKWrHnKfyFsl?=
 =?iso-8859-1?Q?6NINF1Ud9obX/ei3szXBrIY6L3esHLDHvI9jG3zg7Yox6hjT2stOvi0tQH?=
 =?iso-8859-1?Q?X+fmifFRJ8q6AsvWIm/f7Qlt/27fpM3XOt4OYfYWTTzf5traKVHnqBkUXv?=
 =?iso-8859-1?Q?T883oAbqNo4JiofHrPhbr412ptu33vvrgkH5Db3d1sAWs8u4vj0+HOFHET?=
 =?iso-8859-1?Q?9b8QuJrZ64/EEzQG74w/YmBkvAkTl9TKzwjWZDCPJGfHhwMcfbRdE3FT0g?=
 =?iso-8859-1?Q?Zwtn8/S+BjN7UM9J77ipK8PYkchcThOFHJlp2+xSB6grPEYQkmRpYS4QB0?=
 =?iso-8859-1?Q?ke48A6MrB8z8U28PI3pwtuUJ4DJ/76bQGoaHfqkaxXlg3zBG0SFOE3OmQx?=
 =?iso-8859-1?Q?XZqLjCQn2TSgFzEK6vKA1+OqTELh/AUG041FwuAU0ubzPUFx/TsCu1Dli8?=
 =?iso-8859-1?Q?zYR6IYD2aMobxinhdSrZHj8hCg4vmoMsEbM0V4AYq3AHkSEPts8VGixZI+?=
 =?iso-8859-1?Q?YOFlxD3/KHo3jB6BamxKt8GwZl8kmI3Zp/etUgG9cpOjJLHRM0zTE5bk5V?=
 =?iso-8859-1?Q?c1bApzh8IsRYIbhAE680dIgzW7TuTg7esXNNs8OMFbuHmcLhUN7BAouoW3?=
 =?iso-8859-1?Q?g3XIvprFgju8MKqQp3IjxW84caY2tPRfUIcab+0hrvkbFOlsL72fri57AC?=
 =?iso-8859-1?Q?tIXrU17qHugnBVXPOveAoVIlQnRrytTAp9imUTmk+iQsZ9+8PzR5AuB5Yz?=
 =?iso-8859-1?Q?yMpzYVZvwfoDaZcZG6Tn3j6env2oQht6whnz8UYZlJfjhRq9q1Va5edI5S?=
 =?iso-8859-1?Q?MAOuh1+pyaatgMSlg9da+FTVGLFwHeVtSE6vbf5QV3KccAXj32J1f30ebc?=
 =?iso-8859-1?Q?r57AGyIVibmXQxAK4fQWCfzbL7Kj37T2gbtQqe8I5SyNXLQXQZTW16FXFv?=
 =?iso-8859-1?Q?h+7GVzh5SHIKd8XnDqIUVl7PCI5Hhd6cjyOlB5yqAOAzgu166Bm6dGbeRx?=
 =?iso-8859-1?Q?ZT4CBfc2MJNz0asMK3U9N7gkXzSB2PNubJajqgbKWTdmFX9hBCn09gHcbu?=
 =?iso-8859-1?Q?3iNsPeiyLjqN9jqiA4YP6Mc6VhTFm4B7jB+0xC1BeRxRGdXIAa3WEy/dIy?=
 =?iso-8859-1?Q?C9AfyejbhFqTZ8IiKtHbVc0sWSK3kfC7hskHqs+JfrCygwB5YyOUu6QyZq?=
 =?iso-8859-1?Q?6c2VQLa0NqGW/DRO2RLOAQ7LPb5numaX8NprL/5hnLbxdY/KZSFQXuZawx?=
 =?iso-8859-1?Q?sch/t98xKlCJLwVK55q+VBaQEkbDbM7cfA2P2VNyj9pesd4yp24TG+AmmK?=
 =?iso-8859-1?Q?HTTkV4gtdQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GLsnD4A7RsCdNHGnz68JJQ8+7nY53sgAZHqGi8TrE5+Mh4ZdwA6Y2KsUkIjipCcfrWLYul6qQPRppJxWB6+Txj1J/qAQiPplj2dzhkhFZ2Y/zXlk//Ym1LSa2iGFQl46a7RlFU30YLgRBOUn7FbMmwtnO0c6O3viTKk+Un3v5VIIZz852U0s0Ata0ftsT6/c12ruhwDaff/8F6KwZzEFl+CDZwmKN/WzMmNkxQ+oav0lntNFYgufK/s0ZAc7kej/b9DZA4QOmRiPeI8Fx56bDlnBEc9afTnJumxUfgBBp0Abed08ogmmtO0T9phoR1tMmFXeBYpZV9bay+ZUH/wTAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eec4a7-7e31-4732-da21-08de8b8d8bae
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 23:15:18.3205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydVWYdUJFUzlp5dLZljy+rWjZLZBpFspSCMP0i0XMOB622HflUtI14m4+GfsSniXX7t+5O0YL25HKRzzKsLZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB2246
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: b2cE3--0rQfb1HFrwzQ8MrNnb4hQG14o
X-Proofpoint-ORIG-GUID: b2cE3--0rQfb1HFrwzQ8MrNnb4hQG14o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2NiBTYWx0ZWRfX1iUmbsIQoNYq
 /Y2BwLHOis2f/oe+Mu5HveVtxmzAyl93TQqYwQACw4PPOZ1AnNumfLhPstTdgXxgcutetxxmD4P
 DfkreXBVFqtkKqw6ucgkdYC+UeUy45g8OFroxO48pM7hqw06nF/YElDDoxjJ30vCoMJkbe8qt22
 pbhm8tDSsRHiPIPLrEs314ctG5AHGRJeurBIIC0+JHSYEjRMl9Ux2V68oL/O7O1xvek4WsEWDwr
 egUjerEk68Tk3AvaB1mTf/KPbAh8m6+pOp+vBX3uKgrBXsFsbgnfjI9XTGXB5yjIpvEHzgOuNYX
 r6JgWTkEefbERToIaHWWoUmZNgOxChEZLqU0RSiH5dmNtYHJT1CM+yc14DHevQIef5Jy+pox4O2
 ymsIE4fbEUUvT4FQLI5fdN0jhaW5IQwIhWRetoJLsPsOQsUvDaKpPi7RwfCp9UmVExbg/99Ma6a
 hrPGCdMxTj5b64efc9A==
X-Authority-Analysis: v=2.4 cv=TPxIilla c=1 sm=1 tr=0 ts=69c5be24 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=OUXY8nFuAAAA:8 a=rgUYCfA6b7hufdvuex0A:9 a=wPNLvfGTeEIA:10 a=q5mp2vxMLvQA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260166

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
ApPlease ignore the previous message about the cover letter.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
