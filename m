Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4758927FD5B;
	Mon, 23 Mar 2026 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283676; cv=fail; b=WPj3C1uV4c2eEaFB3rc8K2F2pJhq/PhAkTyYeAo8qF5JUAQqc9YEedYUXJEPbyjVP0/5kM5AOYoLG2H7arUqV/zAcpIVUiBFWQvb+mVMI7YpDkQMDk0oxm5GC0vFAsVBLe8HjeLTkeruoBU3ouV+U06u5xWJqQr+aJ6tfOQJvwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283676; c=relaxed/simple;
	bh=JymjHGixDtts78j0RtT4PWrTYGVHdW768CiTT+1dd6g=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QbuM8H0lA8YEFI8r88uzD+geXrPkrvr4E+AmR6dkv6mchlEcvvl2Fxc6H1lQpmE+DXv2ljv3gYgiWe/9jydh4hdJEKyekigNVlPq3ZVIRvLz7inW3cDosSuAvUSycSuVQh0qr2VVYvLy299/dPHFsOF2NspK9C8oHV0UlsTpyjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=f2uwrUJ2; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="f2uwrUJ2"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBU8uP1421609;
	Mon, 23 Mar 2026 16:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=4P3oTOGnkZ1SUCtiAyQOL+mL
	I9lZyCBZrLoxMreA65s=; b=f2uwrUJ2QWPOUGwiYWqO8KA7R4NPH+tdiXqT/h5Q
	rgHZGUWO7mkxCfzrj5vKtdwCRmSusJlUXS69J0JAcETy/81S6tr2+jiYnk58efvC
	DDKnyO8CnN6f4Y2SJqfXU3Ux8fY9TzyxAKpvkTOvfLJqMfadI8pvFz9h84N2gUcW
	f6V3oV323nibgzmpwJNhG9AUUaFRxbWWi0KvealmTBR5CNbOYBKEb7qEjgZMwcVX
	Gm60vYIJgnaNf7bR4kRrBBAnd3ocJ4vFuKRU7vsiXEcqahw2+5U6xH7TxJD4Uuc/
	X0OFnI0mbebt0bWSKsRkXEBkeVjBUH1Z1ou3Kn7Mt+zUCQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d34pskptq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 16:34:19 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id DA25580171A;
	Mon, 23 Mar 2026 16:34:18 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 23 Mar 2026 04:34:11 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 23 Mar 2026 04:34:11 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 16:34:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3A0UlXmBuEz74Db2qQNXV9A/hsMBW3ob2RPqEGeT5kDcM/9H7GFK5qTF1DEAuGHlrQ6Au2On84CLPYy7nuxJJTW3IxYK7DuNtS0it0XenPpYxspsvZ5JKbokjU9+jFI4NCTCJRxkVJeb62btOGk+eG44VWE5/opjP5/YepSIX/BHFbDFQkQFH4lIyrTR2pxxmynnVwWkhJtCzH5NMqhqHA6d7mykjWIy/Q4Tr0y98IZezqDLH57Lloe5W1Hm4QGyiLIOCIaVwNDqmZsiWpAawUd1MjjTwzZNM1FEhva3HtsPRyCYV72mm49LviGNiyWYskfM0wIISVpopIIjUD9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4P3oTOGnkZ1SUCtiAyQOL+mLI9lZyCBZrLoxMreA65s=;
 b=yRNHoZLia1FXQHZhfeL8tO1b8NU+0zlqXOovn0kEcT0UwVJFaWPDfah8F7zFY5eeXEPY5vAXvn+rioL+oMLAMF2OwS9IhIq6SfLqnfO8+vtb5ZivODvE9a8jLfooIG2GX8PWrcPLF7H64f6MBxdOzyWO+Z0ueRWiFbtO+MdC5T3ZqfUJPgNJUH437kJH5zNC7QOmzsJXQ7RnDQM2jkKQce+NH6185MO1WN45WgqZZk0M1DErSCVi9tgqnqYeE+nTc/hKYzbJv4US0r48W01/LXr69l1Wy2WkhSqpBCyZYaK9AFBVfDDstWvIet+x38lC6snLf91o5KgloABdcwZYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW4PR84MB1899.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 16:34:06 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 16:34:06 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "wenswang@yeah.net"
	<wenswang@yeah.net>,
        "chou.cosmo@gmail.com" <chou.cosmo@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 0/5] hwmon: (pmbus) Fix bugs in MPS MP2869, MP29502, MP2925,
 and MP9945 drivers
Thread-Topic: [PATCH 0/5] hwmon: (pmbus) Fix bugs in MPS MP2869, MP29502,
 MP2925, and MP9945 drivers
Thread-Index: AQHcuuLeKH9gPfcJl0yfiBzE35J8dA==
Date: Mon, 23 Mar 2026 16:34:06 +0000
Message-ID: <20260323163343.183186-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW4PR84MB1899:EE_
x-ms-office365-filtering-correlation-id: 3cee77d7-6808-4ec4-5b98-08de88fa009b
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: f1GRkwv4VtjcgKecA+F2E0Z+HUj5U3Qmx6o/4qaYUJ6E9L3kT+ZeLRPZiVU7eebhF4Cv1znzv0l4LlxjVd1opmORw7nQhOJjc4XAsyUQL4Nd68tkX/A11DqDIsmxJlb+ZKI7/2h9geT5KyYip4eszjfNyh5wgXWbWnTSTI3TUhMO9O05tfM5PI72N/z6YGvURYvDljvRhh1tUXSp7mXfWbquhfn0ejTwERGRRru5wOlBcKIMgMZQxPZ9HKBhPpVux1xEzusbWBj3L/Ezxgbt6gNTu97hFCAQm80npmu6RIh99Hts9200Gi5bKCb/UVHHcSdPnuPhW0wz84iuspR1JLsGWpBb+IlViD88JDfhMk5oJf35JYKbswrfDxYprLX74tInR68tmyq6G1Eff6TLxijd/iRl91HdkhOHfImuRP/bq5RN5Z2GwFc36E3mA87hdHry61EeArv/yfBRvn32S9X/9CS4w7W8GHdOL4Jdk7f0rSzIAdOi6Etnu5nlfc/MijaO8qBItlKkQ9KfzK+9/IddKbOLfwv42C0AHI6oUBCKgaf29E1YaHrcBCNAonbnp44YWBEk0ntOn/dZcMLH4aiWOfbo+ZBnV9jM8pByNPWNE6tVe9wcoundvPJ5ygFRy+ORQy+WDsqJENTLvPj91aHiLYPtEt0ptmF8IlteX9iGoPt7lSFKbpL8hS17ddHi7cz+Rl+1KASnbSmd3Oc4rpaW1kvAP9q1LyRztJurMflaKZhmHmrfBjeupaFPRkfEhg2fSHn8POfJKfCPcvjnOl+6ZI5vbHxMZav7KBhNOK0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4GPo/OjNLlWWoVULOHEsfXdx88S/WVx5+ct1BcYGzZHcZ4Oo7DRDY+XJ7b?=
 =?iso-8859-1?Q?yr9O8ddQxccV9r1GUMjY/IKFPbSfGYyby9Ns+iSuINOeaN43iD0pskdDRn?=
 =?iso-8859-1?Q?VOsEyPfODVBl3R7sK+jHk2edaAyljbiQdFhaNQr6YB1KOqAxTAdBdd3i3+?=
 =?iso-8859-1?Q?vLili61WWZVCawge2yOc798TP/zumu3Rvu7hdXSgekyz4URcjiE/2x/0PT?=
 =?iso-8859-1?Q?udP+tUFDuNQmH4tOPg0zVA+m1STZ5S2uRu6cYibpV2yGKsGVfcuL8npcmf?=
 =?iso-8859-1?Q?ff5L134M7PLb3tbXaL0gfx/Cbrjew7GSxBr2OTaXFSP8vWA/CMGcXLYPUr?=
 =?iso-8859-1?Q?6Ipc9igp5ChGW9SK8sJa2+LoDZEm7ZVccevGToyDPDJz6GrD358SzxCUd0?=
 =?iso-8859-1?Q?jn/5sKNlTpiLq760ahlhlqBfJqv0WKNSb2cXygBS180nrv3qSnd7wqv4b3?=
 =?iso-8859-1?Q?MTQtvpZmepipXS1Wtvfz9zGH7aXVvtI6sPmjUijgefiok6c+K3R24rEnkp?=
 =?iso-8859-1?Q?tD0TNiuJu1GPUyfpK8Jm1Ty08VK0zSsQt/8qnBjmcOQO9XqjrFP83z6EKG?=
 =?iso-8859-1?Q?0p/ha6sxdgaZVKakz/ojiEVWCg0mvj3MsKEsZ1xU6DcbqHUyAJKIeSPHw8?=
 =?iso-8859-1?Q?9ikN/2opGEz3Nk3MCVeUKxwTMcwcbR0gO1gJycFa065tOVR1VFwQaqnJtS?=
 =?iso-8859-1?Q?zJkzHoD/MBb2sX501v5lCWY4LFq3LGZa8dbaiYHzZ2bflLKHwZeZo+9zfx?=
 =?iso-8859-1?Q?mjd5J1/0u40aHQRsqdeDkzcFpythoR+Xzj6u8J2XBK7s78q1QSI2y/C17J?=
 =?iso-8859-1?Q?IpbBnK/khHKMkcrZVGetR7ta9/8ObP9W2xDrFRP+hQl3KvUuf3ND4+5iY1?=
 =?iso-8859-1?Q?A66//XpGibXuGYlJcVAMOtT3BeQGWOheS8Ls1iT8ueg7jJEXnHE2I/Kb40?=
 =?iso-8859-1?Q?vCYwCKVt45vV63yAYPh8mDY3xJpsNVTrf+BIlT5uewqmTKJ+gYlRES9PqY?=
 =?iso-8859-1?Q?Fk7duoYpOpzTAXCg2U4N+N09eEBeywAIqhf7E3s5eV7f6QtQXi265HPb3+?=
 =?iso-8859-1?Q?OGLR3WS/WswqXKMTvue3YyMvI62iALtZ8OQJ1sC4I/VpRiNq+QR/bbfSpZ?=
 =?iso-8859-1?Q?bwQXKri1dCRC5H/Wynsi5M6bXfeiOb96Q+X1wcBldphtaL8QJ0dYaIX9kN?=
 =?iso-8859-1?Q?1qOavOL836DY4aG3ZssMeE3vAeEpwYZle0pOopboVu0ppk73vW4oZVMV1H?=
 =?iso-8859-1?Q?X5InY+64JBoHV6EjJAnfv/OtwQjIjRAd3AxmJNHQxXEIg4f2BV00TlDU5z?=
 =?iso-8859-1?Q?M5nf2ZY6OtWNRaHetnpq+wIrvLAMR54Lu6qv6eziEXSiOubL5BFfESTnV+?=
 =?iso-8859-1?Q?UdoBMSAtxcZSEKnvfRKdfXg8U1/vdEycWxCqRBujr689M7+9s0fNdmPncQ?=
 =?iso-8859-1?Q?Zxpza3tKMc+iZJUVGhmxtVlts+ngPBaIHOqpDLO3pqPNhomP8r73pnyZjh?=
 =?iso-8859-1?Q?QSPlFIaawpmQM9uk/staPhaHGjFqWwiJz0DdOMCJ7QR2+981CO8Ew5RG3r?=
 =?iso-8859-1?Q?3eH0VdRdFozEcUbxiFIFo4/AVcJtTedUCy/c2cs17xYpBEp0h9OQixpmWg?=
 =?iso-8859-1?Q?d7ehVLx3uMATDuo3TwpuuHrQE+lj9o9mOlOp+YhNk+7z2XotJw6GKvXHvy?=
 =?iso-8859-1?Q?MqKWMGvQ7zsPmmQz+JDqf982xcoiAfWHOvxrd1OPosYhTYgZRiObvLr66w?=
 =?iso-8859-1?Q?zwdMMs+5EgcxVMbHGwY5kSunc1imPFqXUt6R7O3iIhsZ0GP+1/ni94xq8Q?=
 =?iso-8859-1?Q?eB39KJPBZQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: syvRFAV/twpG1nIXk0NUz9ALfFGbXGNehF8GR45BD9QjobpwmXach3Nwu11J6+rba/r6kplRXttrrWhWDKfF4H2JV2fRM2xkgd6NTAFop3BLX1D0GSVoiu3pMgQlaCx21UEY0WOV0nCCrPBRug7BZCYbLHF+wFCoJr+mFKQdzzpQ1wFIHTgii+fJZJ15jSGOAHWxooNFX5bvkaWfq5HMzeWV+5zLyvyJvPnGq315cOEMJCVfyaeuCBqChGqWqu1yA6lt8POhMBJVJ0qwqc8tchyvXrZkEvaItgoOG4gSgzhOXodCb6xw58hl+hTfePP1h2yJGwnEDL/RPHwHDm5kLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cee77d7-6808-4ec4-5b98-08de88fa009b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 16:34:06.6095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6kXtevs9CSqsmvQG36p78YcUHEe9Vw1nz+Jmj8fjVvsVDfWZ8DfoRTOeGh5opYtlnBJQryxGr7+KCopQdlb4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB1899
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: CuFJh_G3do-hR-rSK_JcTZY8rtbXcKto
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNCBTYWx0ZWRfX9z+K5/oPWisC
 lQO6+RO6SdRClMXsoVr3ZpzZhehAtl7wI2hjc3mCqkgKmf/MvLF09ErOPTn3aGEOKFBDrurXsI8
 JWF8A+D2pVlY9UZhZZScFWBrMhvm+GGpMTqP0oqZ4gWGtZvwOR7CJ+8/2/XCd0lP5wfRQa0KlNN
 G3/E/1npuQIVrhfEsOiYC3O7VZIivPmVim9Yk8mMfbvntBwKlmJMOMXdhiYkwvouRDRoPpFTffI
 cqxzDikMh9MPpyZ1ghRapiZyODXh0pVsW9q5cjbiNFQbmF+ZRD4F8gp7fukJnl/aHyueD0AKvdu
 PF+XMiW58GNLB3w6Hhlp6xVOx56LTJAqhL2XpncnklzuHhbyvzdSkGDMINbMxqW7MXyzx+0FUDI
 AHyrRvi0NMyR0YX3iwSJqODXNS12L/ChPxW897xqoppCJ/bk4vgHFzi5PdaTCBv8/Us06BBve8x
 v9HZ7E8JRtvVSgk4y3A==
X-Proofpoint-GUID: CuFJh_G3do-hR-rSK_JcTZY8rtbXcKto
X-Authority-Analysis: v=2.4 cv=ELYLElZC c=1 sm=1 tr=0 ts=69c16b8b cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22
 a=OUXY8nFuAAAA:8 a=2mk5uhB5GJFkJaPD_D8A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230124

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series fixes several bugs in the MPS PMBus drivers (mp2869,=0A=
mp29502, mp2925, mp9945) recently added to hwmon-next.=0A=
=0A=
Patch 1 fixes the default return value in read_word_data/write_word_data=0A=
callbacks. These callbacks return -EINVAL for unhandled registers, but=0A=
the PMBus core interprets any negative value other than -ENODATA as=0A=
"register does not exist", silently hiding valid standard PMBus=0A=
registers. Affects mp2869, mp29502, and mp2925.=0A=
=0A=
Patch 2 fixes a return type truncation bug in the reg2data_linear11()=0A=
helper used by mp2869 and mp29502. The function computes a signed 64-bit=0A=
intermediate but returns u16, silently truncating negative or large=0A=
values. The fix changes the return type to int and clamps to [0, 0xFFFF],=
=0A=
keeping the conversion semantics local to the helper so all callers get=0A=
the same bounded result.=0A=
=0A=
Patches 3-4 replace raw i2c_smbus_*() calls with their corresponding=0A=
PMBus core API helpers in mp9945 and mp29502. The raw writes to=0A=
PMBUS_PAGE desynchronize the core's internal page cache, causing=0A=
subsequent pmbus_read_word_data() calls to skip the page-select and=0A=
potentially read from the wrong page. As a secondary benefit, the=0A=
switch also routes post-probe accesses through the update_lock mutex.=0A=
=0A=
Patch 5 adds zero-value guards for hardware-derived divisors in mp29502.=0A=
These divisors feed DIV_ROUND_CLOSEST() calculations in the=0A=
PMBUS_READ_VOUT, PMBUS_READ_POUT, and PMBUS_VOUT_UV_FAULT_LIMIT=0A=
handlers as well as the OV-limit helpers. If the hardware returns zero,=0A=
a division-by-zero exception occurs at runtime.=0A=
=0A=
Sanman Pradhan (5):=0A=
  hwmon: (pmbus) Use -ENODATA for unhandled registers in MPS drivers=0A=
  hwmon: (pmbus) Fix return type truncation in MPS reg2data_linear11()=0A=
  hwmon: (pmbus/mp9945) Replace raw I2C calls with PMBus core API=0A=
  hwmon: (pmbus/mp29502) Replace raw I2C calls with PMBus core API=0A=
  hwmon: (pmbus/mp29502) Prevent division by zero from hardware register=0A=
=0A=
 drivers/hwmon/pmbus/mp2869.c  |  8 ++--=0A=
 drivers/hwmon/pmbus/mp2925.c  |  4 +-=0A=
 drivers/hwmon/pmbus/mp29502.c | 80 +++++++++++------------------------=0A=
 drivers/hwmon/pmbus/mp9945.c  | 21 +++------=0A=
 4 files changed, 37 insertions(+), 76 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
