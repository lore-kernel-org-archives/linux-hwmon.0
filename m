Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B421FD4
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 00:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784508188; cv=fail; b=N4RiuQCG5T4gRcXBqyshfJmg6x/wegDVP7J0z1MUja7RFZ6V2bG3L8jp3A+sKfcSgGg1n1KuQBj1KViXxO5vuYEKLw2+EvIitywPvMXpNifPlCBFGEN4SFofbjHeE4eW1tJ9VjCzXc4t95BQwNqwi36BwM8nJ/M1PmmpHTyKyYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784508188; c=relaxed/simple;
	bh=IaVOVMUW/jlh95izNGqYxcss8Vvjo2l5lRLjZio+/W8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dyq4STmpmQ6STrvJVVUQ4QqfB0SFe6QoODiXLgIgR6dRytnowyZ/zEoh2VOniN+pw/5qRxWTgFKPnBF7i0kp1rKTTR3OEm2kbr0ADoSXw/WpiVJdcGHez0EXfocWMVe3bav0mIixw4cyXZy4TjgTZwMjFrBxXxEZmp2zW0zR3yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=LbdvlU0+; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="LbdvlU0+"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNu50A170607;
	Sun, 19 Jul 2026 20:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=IaVOV
	MUW/jlh95izNGqYxcss8Vvjo2l5lRLjZio+/W8=; b=LbdvlU0+D3lvTe+fRaPO2
	8S3I36GGl4kX8Sz8h04qjM+mH1mUOWx0WyzE6Yh2jC+THt16/ys6tZEX2jdRngPO
	PaRzVXgFCZRzxXiN9MenMdhkjUS2ifJksaJxMe5D81DfYHusVhFLE2C7UNAZczWC
	CcibMKiDZg3gQUIYAfqQC6Giy2jXxdzTCrGatmD3QAjtuWZjvp1v8/O3XbSO8VDe
	L6Yw6OEm/hWV+kj/fVihRnZYLsQQhvGxpxvKmZcWPHcIXd1OT3DaBxpQd99IAN27
	i28og9W7csK9s4KQhct95oRjRzIYC6SUAMzBg9LKSuYq2OofYKnpJVvKxU/9hgLm
	g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010067.outbound.protection.outlook.com [52.101.193.67])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fgqte209x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 20:42:53 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpChuPG47fkjhMuk7cjlq3PMWqnz9KKlDwcVtsQneykgSvTtpkn2q+nCEPzKD6Q1515u2j3zaqth5eTYm+o3JV4+q9uYUV/2qhyK13A3jRJbD5IfNWePKyv8e0Q4HXSa4mMvF+Arj6kMVSQicUTliWpOndfLU2CerVz8IzoLSEprVJr91DCaiFrHOh0kRX8CHRwjWXXRUBOO7ElWx31hBNBqOKAaxP31Gg6A3obXVj31U2+d4nqGptzYyiAvhUvWUKoqPlZWyoEt1UBad2xyq6UDP+cmC7IsUkSdXV8p6LXwbllajt8NOO5TF5K0O683A/xNtBgVf02XQgOeBZGTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaVOVMUW/jlh95izNGqYxcss8Vvjo2l5lRLjZio+/W8=;
 b=dFSScrsdXqO7heSt27PWM+XXsBuMT3aTDaa6xSx86btpj4zUePjztHXH8bbXBoSDR789DqWoLh6s6NXMt0jPxl7bcZjInP0QkayveqQOSehCQH9d+BK3tEYYg37udY7AB1Dt24tcvpEehW0cbwtEd+c7TA3BOB286IEAUPJqrSTQJSQrMfseGHzQQde1uVpWEO0yYYG9MJHhLKhDadjJXAN6/ixszhtkr4j2wBSFedH+H7tKQU/ZpfvBOHOU/O5GRNNog5/NL2+AhX2j4QPrykBBOwU7xDN73GE/WeWN31aw+455oeqbA9TPiRYzMq+zX4N4ueexMkYSlZ5QndnvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by EAYPR03MB989252.namprd03.prod.outlook.com (2603:10b6:303:2c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 00:42:50 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 00:42:50 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Thread-Topic: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Thread-Index: AQHdFP0KHG1nLTwPxUSiOhrbWS5u6bZv0jOAgAUR3gCAALLXIA==
Date: Mon, 20 Jul 2026 00:42:50 +0000
Message-ID:
 <PH0PR03MB6351C0B2AFC4CDD92F67AACBF1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
 <20260716083544.1B5B91F000E9@smtp.kernel.org>
 <eecfb767-972a-4b21-a088-d7c7b68c29c5@roeck-us.net>
In-Reply-To: <eecfb767-972a-4b21-a088-d7c7b68c29c5@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|EAYPR03MB989252:EE_
x-ms-office365-filtering-correlation-id: bcf59fd3-7f86-462e-dd20-08dee5f7d3ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 +zIrPeOmPUADW/HXzGYc2YYYj9T47RQBftdGggSV2gEHCUz71iKQWMdv3I7jxPZuXH1SiBKQwAeJuwoKi6YSg9p6kiizwDg+ygQtlgf0HatWMH2SqbrFt1vNHi3uJoPRtZPD1mTdOyQv3P35MtmKO0tUDn63t3odud6IpqWAjVMpepgfvB1W5qHtNRe2Dts7BZSYlJyVKl+NeE6qAYqlK3oaqX9wQIV6auYvzDSiSDnuFOqmadjdgd9DfabAZR+H/8N7miBj1o+NuF8vNAHykQMn8T76r0W9PTvxs8WmmXtSpwRLIk6vGvk7ia2/nPstWT3f91TINfZlLIku4U1gUbeIdStCbK079d8ypRpBLi+2GwohI5XCirK+gR95ejf1pIq00n4TQ6LaAQjF5IgfbS0i1p2kEF05WCgdvnn2Iro0E/+M1gsfIWGviIR5qRPCVf4s/Wm91KXV5lbU6rkQfbbrsr9hZgnIJxvtPWEDEKggq1hMq9Omf9f3rp2AfN4AcnL65JmHYAY7sSqE5dXUk9/pPk+k1PWUwIp4B/lGEySU67h2sEUF51Rra2Prqkag9DJoGzb9J9vB0Ueuj2SeZHlyax+dXaNit8rYJMy8QwGo3Rey6s02csb0S4NFccp+bfSyTwygo5XwxOEjeFxdzVZBwy0gq1iouwjfPAi9V/eFByr6zeBodISElnI07bobmoBvUI/ZQAKzSRB7E0mnWE/FkATm8pc5WyCdYUGEE1w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmVoVmNCTnR0cWNSSGlYSzRZajRlbmYrbFFoTHJSZjU3Y0M5QWxKeWx5aFZj?=
 =?utf-8?B?SnFBM3RucFJoNVRYNTJ3TFlIZ1k3eVlERU9YY3poNGRSQjNsL2wrRC9sNTls?=
 =?utf-8?B?MVMzYU9vRC9RN3dIZjZXeGUzZkhLWCtWMGZvOUxsZy9zWTR6SkZJTEhBaUJr?=
 =?utf-8?B?cjNPWVFwNGNFaDZlZEtrU3lvUTVRRnJCYVRhRm0vYnlqY0txTHgvSG9UYzJP?=
 =?utf-8?B?MWZzV1NmMWdHbGpSMGhZc1Y4a1VVd2xvdjNtRW9SUzlGazh3Z09WN0tnamVv?=
 =?utf-8?B?OThWNXZpQjRQNGxldVF6SDRsMEpSaXpiQUZHeEd3eE55Y1hpVlpZNVgzL1BI?=
 =?utf-8?B?eGlMU1ZEYWUzZDV0cWtGbWtSNWlLcnV3YVFrdVlMS3JYcWxvd20yVWwwMDJy?=
 =?utf-8?B?T3h4b3VYdTVzOXEyTWp2elRndEFLd0Y0bHFRY3lWRXFhSVNMaEVHQ05GMWhw?=
 =?utf-8?B?YWkybkFJUktZWk1sWGxJOUlpRnpQaTFkRUNUaDFpS3B1RXZmTTBEc3JWRGo5?=
 =?utf-8?B?c2FXN2YrTm4rNVYvS0xUand4UFpaQTA4Z21hV3Y2ZjR1UFZVNW9HMnBpcGsx?=
 =?utf-8?B?Y0V5RmRNaTl6WU1LSVR1Q2dBZTRGeE10WlBDVEJUUWVRektSV0FzQjBwalpk?=
 =?utf-8?B?NU5qUkVOZHFBTE41YUtKQ3N6cVBob1N5M2ZsTC9HenU4VldTYlBHS2M3c1pF?=
 =?utf-8?B?K3J3ekdMeXMwS0ZDbVhrUTZrTk5ZRmtya09oQUFPcWEwTVR1Z2NSTHk4MnJ4?=
 =?utf-8?B?U21sdDFYWExWNHF3czFTUUtIVFdFVEFIbkNrSlBxSkRmNldhMUR1OWhBVEZP?=
 =?utf-8?B?aUZKNzV6VGVIVnoyRlNqRzdpeldhenpyU0JQaTcrdmx4YlNkc0hPNnZLZVRa?=
 =?utf-8?B?cExJNGFDQWpUTFE2SlBSWElvc1lWaTlkbHpHQlFvYjhSWkFpamtFVWNNeld0?=
 =?utf-8?B?NlEvZ0ZCS1FSRmlEU1NYMy9NVUh2c2o5L2JiMVlkZjBoampCcEFpaERxR0tZ?=
 =?utf-8?B?TUo5NmkybFpISlJHRDZoMkZHdUpqOU1GS09QM0E4SU00K2hVRFZSUnZMcWlK?=
 =?utf-8?B?Mmx3ZjlmcGdOSFF2WXJYT2NLNUVLZ2FQMVliaHVxQzd2R08vdzhrMkhiZmFr?=
 =?utf-8?B?WXYvbVpVRUNyNDNJWFdaK1N0OWxKajVGYS9RRE5PUG11aXVobThWUWkzTkRV?=
 =?utf-8?B?VHN0WXJVdDVSc0d0akdCZ1dWUTFPdHVQRzZ5WWs4dG8zNDRMRWlYOTFUVGFR?=
 =?utf-8?B?aEh5aTdyeTFvK0FnMk44MjJiRjRJSU1JdUdlV3c4R0dQSXlReTF6N01RZEcy?=
 =?utf-8?B?M2N6QnI2emNNQlZFangyTlgvaDFPOForTEcwMDVacmpNVS9NMEszMTYxS1hM?=
 =?utf-8?B?S0dEd3dSc2xhNzA3UXF2UXM4R2QzZXpuWi9RUnd3bFJyWlFmb1lMS29tS0lI?=
 =?utf-8?B?YW1zZlliU29MS0kwb2x4eEpvVUNKUmxCekgvUDlUVUNya0FTS25Uc1NIem9h?=
 =?utf-8?B?RjNoKzJWRkRZSEF5VFVDRnl5a3ZCRGhESE1RVWpCeEg2OHJHWTQ3eU9pa3pJ?=
 =?utf-8?B?MkJLaDdyN081Wlk1Kzd6VHU3MmxXMENEVmVrNjNlMEl4NkFTWHJodyt4bkZv?=
 =?utf-8?B?bElFRVJsSkNlcVlEUGtsK29lQ24xWWFsQi8yY1lxUmlCMDNKdEM2UnUvMHFI?=
 =?utf-8?B?ODgzRmZqbTFocVhWVWVqaTNBa2NFQm5HdFU3cUZaUVZOOTRWRmtwTzAyclAz?=
 =?utf-8?B?a0lCdWhMRmFBc3lYcXZZUkFORzcrd2gxYis5T1ZlWmQrZ3BFV29ubWQ2a0pN?=
 =?utf-8?B?d0xmajNpR2dWa3NtYmdpb25ubTk5ems5UE9qbjRIbDJKcTBGcU1NTHhkSVY3?=
 =?utf-8?B?MGZiQThkZTZkUFNXNzdkYjEzTGJqVXFiWkVuU2xxcFl6NnRoS0Q3YWRLUnhi?=
 =?utf-8?B?d2ppa2tMTDFKaFk2b1VnbkdWWmdFblRDdHg2b3VLb0tsem9wemNUMHNDaWJC?=
 =?utf-8?B?QWZMQUVpUklpZitzaVNJLzVEWDNPOUhKa25kOFIrdXhBdGtMbW9BR1BHd256?=
 =?utf-8?B?bWZWejlsSHZ5S1V5SnlBcVZ2ZEowMmlNV1Y2amppdjlEM0srNWF0MVhEakVC?=
 =?utf-8?B?TFJhaGxaVnJjakw2NW5LYzN5S1dWRXZHb0toWEZtRXIzd3ZWZklDLzNpTkNQ?=
 =?utf-8?B?OVBxby9PZGE2eFp2b1djT1pzdTJxNWw4aDY2MEd1cFRJVUhGVDFuam9uTHRH?=
 =?utf-8?B?RHdPanMrYXVrU1pUUytETnZZdElsUXo2cERHYUJ5ZnhkT29JTFZFWnY3TTRH?=
 =?utf-8?B?bjJIUGJkc3ZjaG1tcHlMQVBaUHV3eVZIam5wemlNOXV4cUZ4aEVObkFQUktu?=
 =?utf-8?Q?EXHQiyDGU5RLtttY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TYlhonqfkgAY5kFV6r8AF1FnSP1H8pTPFA+JCROehrRkSEtm5nAUaTBNAiqhrI2p+TpqRYFz+oVt/cwghMjExrOd3ye2uYkwYuOnlfN5iLFZW5e0ydirxaINVV5l/f+4Q+Cd9xSkFhe9+vXXpqUg3iP5yy3/O3tJNR7XMDkwvimwkkhtvCoklnsTUoPTSlf2Vu4fUq9a7oRL3if7Q5mB6yR8nnER6zyxaA5BGWjEua7c+xYwsIclCFpHwBkhPBzVQGpGLuJePyyHVW6Qx47Pq8SFDNzQ3+Q3mWDSMTsWvKVoEX/TidTE8DyglQ7rWflReGLddtJk0l/FLfMxCK2Seg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf59fd3-7f86-462e-dd20-08dee5f7d3ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 00:42:50.8037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: REAntvL6gJLS5VVdgFiJNO6YGvz9oc2qoYXPmRLN/3BQCe9MgMExX8LeMYAHqtSGOh9eVVVP3ybtgcIPb2DfkAyiRTq52XADEYk7hdzKTPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989252
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAwMyBTYWx0ZWRfX45kVsQUxBgno
 AJT0NGxnxHoKXKoclDapRuw33vPrbGg/OUxGWA0Kgay88tottAeWqRqP/a4BBS1SDDiOLHWusRi
 NY4F4hU8fSPxcM8lW7P7G4Zzlnrr2z+olN7NAEksJGsKv4nsxXkwvY7xCViMaGAfaDbrBOW7k4t
 HIzn1jwQRfSSHQZy2iXzGGiQM0S523xtrH1rOPct/2bfAGKgyKSahlpS86njQREGLzDXfe78TtD
 K5WZu4s+uFiOJpvfwr3XlMfepFZuai6esTxWu5ETqzet5rrO1hGsBohanPi4kAEuXe2ehPimC+h
 QzoJmtSrOr7MeqAEj+vEd2t7Khsyf0liy26Nw1oIlBeyhz8QFwI2lNvoeV/teVYhlKMsyThzgVo
 GLyjIdOSJ4AuPnHNqLeaO6UPahT8CLRgU1kzNO+ROPQtUDrySTKcptvT0Mc4Z5KWwMGPHak54Hy
 hPC0WGGETZsl+wk9nJQ==
X-Proofpoint-GUID: ThmzIQCJ_fSBEKObLSX3NyDlieZpCcKx
X-Authority-Analysis: v=2.4 cv=Ed/4hvmC c=1 sm=1 tr=0 ts=6a5d6f0d cx=c_pps
 a=4Gx/Bq66bxzCWlClXrtOjA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=l4zSKm0TA7i-FhUrIPYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ThmzIQCJ_fSBEKObLSX3NyDlieZpCcKx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAwMyBTYWx0ZWRfX7/Q4MRexCQtZ
 5Hsiu8QfYNNOpAtWgDYzckKj/p6y74ifsgnrQDbOis4I6rdvUGL+lRtJVcNTWJM9UnEPS5I9eX7
 2eMojkqgfwJHo0Z+3ACuKtmHvdNACRteE3VaCxxw7Bh+O6RK4/XJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200003

PiA+DQo+ID4gW1NldmVyaXR5OiBNZWRpdW1dDQo+ID4gV2lsbCB0aGlzIHN0cmljdCBlcXVhbGl0
eSBjaGVjayBjYXVzZSBpc3N1ZXMgd2l0aCBmdXR1cmUgaGFyZHdhcmUgcmV2aXNpb25zPw0KPiA+
DQo+ID4gVGhlIGNvbW1pdCBtZXNzYWdlIG1lbnRpb25zIGFkZGluZyBzdXBwb3J0IGZvciB0aGUg
RVROQTgrIHZlcnNpb24sIGJ1dA0KPiA+IGlmIGEgc3Vic2VxdWVudCBoYXJkd2FyZSByZXZpc2lv
biBwcm9iZXMgd2l0aCBhIG1hbnVmYWN0dXJlciByZXZpc2lvbg0KPiA+IGdyZWF0ZXIgdGhhbiBN
QVgzNDQ1MUVUTkE4X01GUl9SRVYgKGUuZy4sIDB4MDAxNSksIHRoZSBvdXRlciBjaGVjayBydg0K
PiA+ID49IE1BWDM0NDUxRVROQTZfTUZSX1JFViB3aWxsIGV2YWx1YXRlIHRvIHRydWUsIGJ1dCB0
aGlzIGlubmVyIGNoZWNrDQo+ID4gd2lsbCBmYWlsLg0KPiA+DQo+ID4gVGhpcyBjYXVzZXMgdGhl
IGNvZGUgdG8gc2lsZW50bHkgZmFsbCB0aHJvdWdoIHRvIHRoZSBlbHNlIGJsb2NrLA0KPiA+IHJl
Z3Jlc3NpbmcgdG8gdGhlIG9sZGVyIEVUTkE2IGNvZWZmaWNpZW50cyByYXRoZXIgdGhhbiByZXRh
aW5pbmcgdGhlIG5ld2VyDQo+IEVUTkE4IG9uZXMuDQo+ID4NCj4gPiBDb3VsZCB0aGlzIHVzZSA+
PSBpbnN0ZWFkIG9mID09IHRvIG1haW50YWluIGZvcndhcmQgY29tcGF0aWJpbGl0eSwNCj4gPiBz
aW1pbGFyIHRvIGhvdyBFVE5BNiBpcyBjaGVja2VkIG9uIGxpbmUgMzI4Pw0KPiA+DQo+IA0KPiBQ
bGVhc2UgY29tbWVudCBvbiBTYXNoaWtvJ3MgZmVlZGJhY2sgZm9yIHRoaXMgYW5kIHRoZSBuZXh0
IHBhdGNoIG9mIHRoZSBzZXJpZXMuDQo+IA0KDQpSZXBsaWVkIHRvIFNhc2hpa28gb24gYm90aCBw
YXRjaGVzLiBBcyBwYXRjaCAxIGdvdCBhcHBsaWVkLCB3aWxsIHdhaXQgZm9yIGl0IHRvIGFwcGVh
cg0KaW4gaHdtb24tbmV4dCBiZWZvcmUgc2VuZGluZyB0aGUgZml4ZXMuIFRoYW5rIHlvdSENCg==
