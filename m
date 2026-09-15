Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205654A1E09;
	Tue, 15 Sep 2026 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490942; cv=fail; b=uycJbSjyuZrrODqxjBI1VHG2M7yDE/PSbJKhNU3+z36aXb9Kj+kK64/wsw1uu5PNFW8dJGnEzDYOojnd1ZH1vx5j1xTvrHeSNVkWvYW9UH2qrflUICQ0BcyzkunKKQkrQ9pKeDvUndgT03QiXaiBSwBMyTwKT2HT07ACwTOs+Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490942; c=relaxed/simple;
	bh=xrHmsJF7H2mCj5HgsXWDb9sVxb6QfWLswtMePVJ5BHU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QG6GYgsmTpC45OT9cGGDDGx/eQCiUglc/HnKSyuD5NYlJjoUZ5u+t6VsM3WVoIM7kZAHMcpH76XjuqmKwEIBle7CkNXqxbyQuYePt2wOROI5jtbl5rk/jU6YKrVGJJRcI2rFd+oMUU9qyJxX/nZrYF2hqCNQJyw0Zkq0TZVIC8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=JFOqtafI; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="JFOqtafI"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FF8mid2711031;
	Tue, 15 Sep 2026 16:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=xr
	HmsJF7H2mCj5HgsXWDb9sVxb6QfWLswtMePVJ5BHU=; b=JFOqtafIbTpqapquDO
	6hiequdCTJolSMTTuMc6LaIM6lRjxDD1Gt0c7ExbY8aj696+PPW35gUeCmKNT+ot
	ttfhHIGAdIl43Df5A08+tYnoF+dlA8x7V0gDGYGjnZzgjbaC5BBa11HauoseQstd
	AjnU4g/RWWxf2rU/SXh2135bXcAtmXaYpkrgJgc0HqafXW8hn8Plj1TItBm73Alt
	d7Drcd9Tfx7ERB/7L6PNmfc8HCDxrmiQNSiCu1PyAxKU6zqcM6yzZUUsAqB62/q/
	XPjlAUwSyxH1TSSxR0ElTdFe4LMJlR+uKJFG1DH5WpaNN+V3SFniv2c+f7L1CFY2
	93dA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4gq7cvjvuv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 16:48:44 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id DA25512B4D;
	Tue, 15 Sep 2026 16:48:43 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 15 Sep 2026 04:48:43 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 15 Sep 2026 04:48:43 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 15 Sep
 2026 04:48:43 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnypwhwXYtY0rPKUEggcqkYCdKVBT0XKOOlx9sZSLpYZa/MPU7yR82eTyq8jFfYWlIZvwmAT71FYUyoZzzg6C3Z0X2KNo2UEDapo8R4WRXHll33Vp2hA9IOlLsICcbjwShYPlaW76qYJFpjUaBbK+EMF8s64IZBjHp07e4LoHEnMe94JyxVekhwrgAbk9jMax0GQ5NhnTwxsoYpDk8lHhjQxXKnRSNBgYXYrVSvWguXiR+yIu23QWMWbR1wvttsNC6MdMS/F2qFfB2FtPtLKCWrTgHbCXFqRmc9J55DtBdgQB8+tC0WhSYzloeLng/KDSZhyfDnFqTvwPLcNRUemBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrHmsJF7H2mCj5HgsXWDb9sVxb6QfWLswtMePVJ5BHU=;
 b=ILWFpdKPAkWANhND/uoTQGpknLDm1uzPJppY9u985NJPZ+D1CyXSOvgM7f/ytOCQgSHQFIra+wWScChRRaanRPbwCf/jgl6RDxFdA5aCzDhOAo2wao4hHayBPkzQGoca0Qa0yXsqNbJj3o7Pdo8vIcuKABGsTml+s0yiUeR0nhGN3fFOQ+jzj8jQYY/xII1PtBr7jvb0mIKTF/u5FHXzE3Dr9WLHT928thO8q8ayaW9Kfrg/2razni1GDVjxhUgMcrf0ogig78rYJR4xo1iTjGr1c/ycT/bFp+YKcEUC4bPxhvIq4dzYKp8wCEvYkw6glwk+l/JEi3od6Tnf9VKn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV3PR84MB3580.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:48:41 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 16:48:41 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Thread-Topic: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Thread-Index: AQHdRTIQpdBFGy0CNkCK2I5s04e/3Q==
Date: Tue, 15 Sep 2026 16:48:41 +0000
Message-ID: <20260915164823.160977-3-sanman.pradhan@hpe.com>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260915164823.160977-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV3PR84MB3580:EE_
x-ms-office365-filtering-correlation-id: 3c7f96d4-83f0-42fe-90bc-08df1349329c
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|38070700021|56012099006|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info: xFiSNKkqSu8lpkMxrXAA4CnewV29LrQ5Fx2synULCJPwR+Gs4bGtYEQZtssOD6fjhQjXZuoHKW7kXlfmq7VYsHvB4Pk2/KprD7ZqiLNNpOdde6E2LynKpkfzSNI7jGbahXFKH6dLr5FQhvuhkJLH7Q9NynRpZIvKJWFkFUiwIT5UIAQzB7yiUnzyLL9SvDmVgOhz01+2PcVHa23GTIijejBJD6+3cxpTQOXA5yI591UocDrxwsVq2t+8pifz6RecKRVMyMkMk5lsPwOLAlH+XPVrfgLJPYFQbeKgwZ1+xqvGYCm/iTcFpFrjy2iz7JG0ThO7Y9L1yllHiJjKNVwFngyKPCuVsVpnEuNedyyY+EoBeBb2cub8pljBNtvXJi4lgbqIiOoc6GY6KoNxZDdZvjk1UNknZA+F5+VhjLOwQjrRlMRNZPjkaDxHUkd8IK36ZRDKBMyjpZFy+2llgQ08ANUt1jsU/Gyqpi792DfwNLRZmeFcjMUF09bHPlS6KvU7V/4js+Q21PlEftCj6DYEZpO+lPmBah/SjM8CFh74519aJHEwXHi0hrY8ESblEIleOGtupy8u1c+HAP6K1/AJHjZJfR6X9NRVZTsoEupy1Xi6MmUbdXDxpJbUkCRVj6QfMBv4P1THLQ+6KdVLFbYutLawRlWFVl8Ty5kvX4kiV0FJeXrB77JbC8yMjKv3N8aliY3Nyj77h2st25bhVh2GQS0q7IVhBNqyfd5aaJtb+iE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(38070700021)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnlsNUJucU1aaXpISnVlbGx1SUhzbDA1ZU5sNlBjSHdaQTVvRjBsZ2ViYkZI?=
 =?utf-8?B?b0d2bmNZMGdRbVRKM2R1cEtNczk5MlRLSXAvZWs0Nk9jdS9qQ2VmU2xTcFBX?=
 =?utf-8?B?VGtleWNXN3poY2FQYUhpblRYR29TQ3U1Wk9mOGdYMVJCbStHRWRvSnAyb24w?=
 =?utf-8?B?WWlLRVpWV2VpMHp2TEVMdGx2cWlKSUNkZFR4L3FDMTd2SGhCeGx5ZTFtQ0pq?=
 =?utf-8?B?bmp3N0VoNWp2dGxKWGNqNGZiUDZFL0xpNGJXQ1BBcmVZSy9LdTR5RWdCZGVk?=
 =?utf-8?B?UXphL1l6RjNaaGJNVG5SaWJaSUtqSFFyelhEZWltSzlya2dDWXVmY3lxQ2pt?=
 =?utf-8?B?R0N2RG5kY0tKNk9jM2N2OFZhRXdwZTRGNTVrRHNWeFBrNU9yclNReGNTUi9t?=
 =?utf-8?B?SUpVVUJvaElnUkZmSWFJWmdCbnFxYXQ4bVRCTXN3RVFtM2RKTC90dGY4MkVZ?=
 =?utf-8?B?WjdtNDVEcm9hL3JNTWVvSFRBaWQ2VEZieUZuNkx2NWNSUzNObTJ0ZGxLWHYz?=
 =?utf-8?B?WmtzQSs4RnBmRkVYZlZ1WlhEYncyN1hZall0VjhlUW1UeWVtQjBneHJRS0FC?=
 =?utf-8?B?K1VaQ1lMMW0xOWJSOG1odHhnUDhCa0lNQ2xKOFpJN2tTNHVZcEVmZnhxSzQy?=
 =?utf-8?B?OE5tZDVITHRodE5kRDQwaExiNFNUMTFuOENjS0FEcXg5T20rRTViOFdBMFVE?=
 =?utf-8?B?Nkt6T0MxeHg0MDFsYkRYWEdtMGw0TW1VY0pVb2F0aDZyRGNTbzNtZjU3M25v?=
 =?utf-8?B?UU0xOHA0N242SlE4RE1jQ3psNkQwOVFnYS81MU5lVGxHbWRZWHl1RlE1ZTBO?=
 =?utf-8?B?QWQ2QVhzVDhTMDlmN1lXMENlWHFtMVlSTEU1cDNCaEhxbnUrNDNUeHFvREd3?=
 =?utf-8?B?NlBxOFR0MFl2czQyTlc3RWk2SXN0c2k2UThLSUNadXNpc2UyUk81R29mVEZl?=
 =?utf-8?B?U2RCZWFGUlpnUVN2UlNOTm03Z2FTS3U1c01SakM5cXFib2pXbVNiVFVGeklR?=
 =?utf-8?B?a0o1cUhTSy9vRk1taGNOZFlyUWRGK0VvcUs3Nkl0SXM3anZOUHc0V0lNK3Yx?=
 =?utf-8?B?cmRIZjFBZHBXQ2Q4LzdRNUZXdlg5TTlvKytZU3RMWUdPTUJDeTlMM0JvQlhy?=
 =?utf-8?B?c0c2Z0QrdGRISittN2hFMzBaOGlYaTBTZFYyL1BtQWxzTWljcXllVC9LRC9P?=
 =?utf-8?B?bFUxRmhhVW9ZOFQ0SWprU21zMWlXZldaUmx5UUJmVW55SHI4c01qNHpwUVNx?=
 =?utf-8?B?dEgwK2NycUMycWgrUTQxTWNlc3BoREZ2YXUxY1Q1MFBXNVd6bWxrT1BmVUNx?=
 =?utf-8?B?eEZsUDRuSzBrWXZBWVN3aXdQNFFLVWN4SHlBd1VTT2VlakdhTitIelVMSXFN?=
 =?utf-8?B?RlpHSmFQQ3NVNWJpSEVjWUVsVTh5N0Nxc2s2ZjBjcUJVMUxQTXkvQzFUT0Jt?=
 =?utf-8?B?OTVJbjlBTkhtZFJLTWQreHluUzg2RDR2UC9LU2dGWjlFRDV2UURyRVhZUVYw?=
 =?utf-8?B?VWZoblVORVRRNHNKc2JvUEFIN2w3QVdvQkp4YXdIelRRV2dPcDh5NEs1WWsw?=
 =?utf-8?B?WXNpejlMNzNHZFlFY3NXZzVmL2lYUlh6d3I1eUg0anhBWkN2WlRVSkxQZ0pO?=
 =?utf-8?B?YTlPenZSOWpieDZjYkJVRjNQOFJpK3laanU5QlUwd0tDN2JYNDR1d0gxYzEz?=
 =?utf-8?B?YjNVRUQwRlhURUZzS2xZbFdGMVZYbEpnR0RMeWhxUG5JN3pvTTkwMVNZdnhE?=
 =?utf-8?B?T0ZqN2FmTDE1V2c2MUF6TFBxZWlSa1VDaE1TcHBwMHJFU0RYNE5qbUs2d3J6?=
 =?utf-8?B?bHVTTHhoYkp4Zk9jemVVNkk4OGtWWUxuVWIxWDFkeEtjd095WTQ5WnF1V20w?=
 =?utf-8?B?dWppTklHczNZWXY0Uk51SVU2dGQ0UEwxdGpMR0Eva3ROQnltUm5jUFRFWUVw?=
 =?utf-8?B?SlJVRnlnc2ZxcE83VnJ0MlhZSVc1ZFRVUGVQUFFRU3dvZW80ZG5uRmg0c0cz?=
 =?utf-8?B?ZERrMGE0cEV5OFA3NlFxWWd3Q1U5MW5BczIvUWlxc0RZcEc2aGZ3VTJXeDZX?=
 =?utf-8?B?dUZUSlovWXZucHROd3BNQndWNzUvOHpqWGxOb1FVM2tndk5IQkgwVEs2Ujk3?=
 =?utf-8?B?TjNDc24yVjBwZ1J1ZXZvRHRrMWw0alBDbDhScjFod2xYYWtrZHdmUnpQZ0xs?=
 =?utf-8?B?R1ZrZDhNWkpoa2xzQisydTFHZE5lbThDbVZ2TThDUFpEYVpyOTBIL08rT2RO?=
 =?utf-8?B?OHdzZGM1dzA5T2ErNG80MDZrcTBpV3lENi9yMGwydDNqNDVDK2Q3eTZEdzNk?=
 =?utf-8?B?S2tsd251eU8vU2wrb016MmZncDBQNXpTVmRtL1JkOWIrMU9YeEM3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uwMkeiSnTWBUkx2FN+SR/LHOzjuXN/M7s+SpuF3d9SZZxqdYko/1wv5vr+0RwMvbRexFlxgWJKs77UbXs0k5ot5VjuiIBWaIMbWQ3kohVYyv+1IWgpTk3Hi74OD9KJlcAutPoCHabd/JAbUesy29p+xl25HJSH2MORgPWMuI4hkHvB2B2jI42Z8Bxdwz/bQDXoKClz8mkXpg3VTJgwXQVUqWu5Y+PLUVKDXv7VVacF4gy9reUI8BzUaaAvG2hzRKnBEbpsSDJs9qSmv9m7HsevHfS/KrqyEmJxITezZPxiFax1DVqs064mGlRybtylaJKJ9EBZSVELqfqZuOnOUZOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7f96d4-83f0-42fe-90bc-08df1349329c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 16:48:41.2292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lz8OAGAdUlvC7ny8LW/zoaXFThgfjFj+Z8OXBoywvypYHbZ1wAGM+Fo4oo5XkBPeJTtwqLpL5ZDNpBQVNzAXUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3580
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: _0OJPnAwqAhSdlnOC4DnWnIOnwkJPg01
X-Authority-Analysis: v=2.4 cv=Cqgq4X4D c=1 sm=1 tr=0 ts=6aa976ec cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=OUXY8nFuAAAA:8 a=XYAwZIGsAAAA:8 a=jfe4B9wozX6hrU8P5YcA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: _RfCbu_GYx-Ib_MOT12qTdU7fLXpRlgZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NSBTYWx0ZWRfX7glZRyxgZz/i
 0qppIZZuLv4XIA/4CFewScLLid3X0OqwM/THGknfGlfxi37c2klB1g/umvqT+REqk8fC8mcocwJ
 yHuvi47DQXD+sQ8JtQH3XipL/tWug3g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NSBTYWx0ZWRfX3dbliAD7VhpM
 oZPhm8EX8QCiZyWNmNnxcJTyIYUzSrltKfCWyft7zELshbV2mvq1omJdPuBsYIC5Jr9A54DBoji
 qW6loYDygb1/KzZb+MMOnHcZYPP2Lgn+J6fGYXjkSpEJXYpLjrc8PVvoSlxX7Od3oe1X1s31Y5q
 QX+JBiISZV//kMQU2HQj5pVr5HtS2F8A0epS3cKr0co01VZ00Y3z4sbHYMnlj29Lvj7i/zHoKyx
 6RoFnx9REL12CG6UUZSJ2EV6xdCufRqtnzu5QJ/3557QwYTS3hDKkMsGho5Qw5fgVyKNGM5+p5e
 qP6oJsVUZHRQM6HZgU0kiEdRvHOoGpGKuEFz88dr+IhGhsU2U3VAOc3mHXq6F9FZ6Z4y/Hr3zld
 bGSB/jdga0Fp0cRq4bvGSGgywfpJMCzIz27E/GemMH7bglgVDRK71tCzyw1zh7ISyXgyvmEWymg
 wkpIWahMAHq+6WgLlEg==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150245

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpUUFM1MzZDNyBpcyBh
IFBNQnVzLWNvbXBsaWFudCBkdWFsLWNoYW5uZWwgRC1DQVArIG11bHRpcGhhc2Ugc3RlcC1kb3du
CmNvbnRyb2xsZXIuIEFkZCBpdHMgY29tcGF0aWJsZSBzdHJpbmcuCgpTaWduZWQtb2ZmLWJ5OiBT
YW5tYW4gUHJhZGhhbiA8cHNhbm1hbkBqdW5pcGVyLm5ldD4KQWNrZWQtYnk6IENvbm9yIERvb2xl
eSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RyaXZpYWwtZGV2aWNlcy55YW1sIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy90cml2aWFsLWRldmljZXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy90cml2aWFsLWRldmljZXMueWFtbAppbmRleCA3NTE0MDI1MjM0ZmJlLi41ZGQ2YTFh
Y2E0NDA5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdHJp
dmlhbC1kZXZpY2VzLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RyaXZpYWwtZGV2aWNlcy55YW1sCkBAIC01MjQsNiArNTI0LDggQEAgcHJvcGVydGllczoKICAg
ICAgICAgICAtIHRpLHRwczUzNjg1CiAgICAgICAgICAgICAjIFRJIER1YWwgY2hhbm5lbCBEQ0FQ
KyBtdWx0aXBoYXNlIGNvbnRyb2xsZXIgVFBTNTM2ODgKICAgICAgICAgICAtIHRpLHRwczUzNjg4
CisgICAgICAgICAgICAjIFRJIER1YWwgY2hhbm5lbCBEQ0FQKyBtdWx0aXBoYXNlIGNvbnRyb2xs
ZXIgVFBTNTM2QzcKKyAgICAgICAgICAtIHRpLHRwczUzNmM3CiAgICAgICAgICAgICAjIFRJIERD
LURDIGNvbnZlcnRlcnMgb24gUE1CdXMKICAgICAgICAgICAtIHRpLHRwczU0NGIyMAogICAgICAg
ICAgIC0gdGksdHBzNTQ0YjI1Ci0tIAoyLjM0LjEKCg==
