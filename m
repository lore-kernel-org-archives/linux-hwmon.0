Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E3A2F6904;
	Tue, 24 Mar 2026 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376588; cv=fail; b=dNUeGD3t/9PulxaqzlZ3gasF9a+KnIc4Qr0a0EZyWx9CU0FNizFyMuqtbfjAi8Pmzs8BQUlI8pP4ogtBdel1N73a5YyvwpsBsh6a7uohWYZs5XmUMggTxEqmcUHdx31V7Wij6q/9F4eJyhwwYymuWLUyoPBjbKu+t4r1foM5H7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376588; c=relaxed/simple;
	bh=nHp99xuGB0pv/Jxlug9z7nYxUdbZz334mszpsYI3zkA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Jo7ufOzUiuTXke1AD1gFZAEslS+lSOwLHeYawrrVsumuD3GyZ21pUVhT796yTL0QhWyPMVbE6hI5rxZMdi6nYDbYF/NZuAIcJwnmxuno+M4RYrlPnsAHSlaxCvXydGQ4RQDjeHYBN6+Ujn3dstubRhDEEw11S/Eo5V6CzOM96ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=L9Pj8q6+; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="L9Pj8q6+"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OHcXtZ998229;
	Tue, 24 Mar 2026 18:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=zTePkNlyplKXHDGPuZjfrHs4
	JbZHMKybAG7ewyo6PtQ=; b=L9Pj8q6+jcSO1/Igs/ucq02HcS3L/i2s0ks4TwYU
	wg+gAaWtn8uRo8cUoKAsxgu5z1I7tNCBKlS5Hb4G5guQr1KU67ATo5c3Rs+CAOlG
	GD8m6/A8+e1f7CMy+r0qwJ+wpJOvQSGyJTlDcwNPfyOCIN373yis9S2R0nmWMZT0
	Q6ThytkKpEaNgJmhPHGp9Jc/qH5IcuQCtDFqzV9ApTPEVnTuwnLdw5QatOBvO6M0
	RuWafYOqJx0GYpcTzc7qhARClE8bat3zkd+i14zobOP6WTq+4kwqWAc0Ipw1nkh+
	dDk9FZzYI1wBrROFB/HhpaGm0EPRuKbN/w1F59jAIqDtgA==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d3tndcrka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 18:22:50 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id C3E0C802BB8;
	Tue, 24 Mar 2026 18:22:49 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 24 Mar 2026 06:22:49 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 24 Mar 2026 06:22:49 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Mar
 2026 06:22:49 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8cD7nqVCe7LC3J5a9Lnb6kHH3B8CUxyj83Y2q5McnkeRpKUhWiOnGln4pvqiUWergq9tgL0V/TdW0M1/8to/6TLm8s7AVRjGXI3TgrmkOLAOJsSIsfiAi+erbMBZp6to0nhRc8eC4koGtp1cFY4vsGIIl45zxIVa26U7H5FpGh/KCY3zrlFOHKdk8DNjNYXlj6onxk+DXwfwr+8GEZtxcZmvH8JxBhReIEdzaplej5+QkWVDZ2Ho5+3rWfbpRxgU/0KRjOacmWmGb1wPTH9CLgNEdQv4ig2XaNlkkGy5jgNJv9p0fAUUd5JTSmMMfeDNtnuWp458C2Yf8c/GiSX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTePkNlyplKXHDGPuZjfrHs4JbZHMKybAG7ewyo6PtQ=;
 b=F1R/Z9dEtxZ5nSNpepR6rn2CvLMvvEHaI5WRE14zy+GaNDSt/gHyOvUu/A1q1cLYCLz6JeU3LQYuxXN+vVvx1lfSFMd5QHtsDu1BF4C+blOleuWgEqVjkVq2HYFIPPjLsV+La795Sl2gGYqeKOvATip2OrzTWfSe7r82QvIGEV2+z3jrEzRNEVE+cYt7Jt71oUT/11MEwlVBrDrdt+W9ajPeAPorGxM+qI6p+agn2Yem/gSRh2XWCBfpz+3CHcTJJ1jrRyd4JHz6SflCGTn43q/msdGS1/kGt4sXVrq+BjQ9QdkRFwPcT4G3QFRzJphJ4iQiDPdJ9qzqUmMSAhZA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SJ1PR84MB3042.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:48b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 18:22:47 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 18:22:46 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "Michael.Hennerich@analog.com"
	<Michael.Hennerich@analog.com>,
        "beniamin.bia@analog.com"
	<beniamin.bia@analog.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH] hwmon: adm1177: fix sysfs ABI violation and current unit
 conversion
Thread-Topic: [PATCH] hwmon: adm1177: fix sysfs ABI violation and current unit
 conversion
Thread-Index: AQHcu7s21NfthT95ik+24NpnAYar7w==
Date: Tue, 24 Mar 2026 18:22:46 +0000
Message-ID: <20260324182231.228195-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SJ1PR84MB3042:EE_
x-ms-office365-filtering-correlation-id: a499c31a-aa01-4143-c57e-08de89d2593d
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: xVhWaD6jA2dX9QhmwKh/XJNyjwmvtWse7FeEkBAFE5mBU/REjLvfWv8bGm0oZq0nOl2f+1XzcRdh+N+6yGkkiFhVZab4R/8hbG7d380sN5mEXaZJWk8xwbYu0C5aMKeL8MHZ1/TeMa205TOGd/6la4WkNQcGpheFDY+RcHf3AWQybgPLJDbiedhxXDQBPiaVDVXo3ciJ53uFYiMPP3GwFJyUomyYzAyVmHE7oLMDHDaRmddgeZJO0FekNHkZAM3pYbfYPp2UP16PmKhZ8xVYQgy7AzqICR5lrWtQtM88ZwhxWmcsFrlJ0Kyw/RaHpaRMfxRJVmlXb9uAXxZv0G1UsVZyBWTwe1HFKWwuqw2697fXFIMxoFEsDfmkayzoRnxvCV98NMtDXGBCN9qjn0PhL6n3a8gaNXylfP/Jf6GXCUvqlVrRtSd3/uc8xjwEBMe6GvFg7gBeJR8UTbmygDNQGtISWi9WNU2eq1lc7QT9e1QqsWEYR674xWJIdpHDs4AvSS+Lwn5RaEzeirofLBTbQMQj8SavXPcgQSVQrSNzLiu3fS0WzfvB+xvsGWpYNj8Ty4UcUvPd5mkB9CWSaEVPxXnBIP3kWKnTy8yFNsllS9Kzui+dwFZDgQ/CGYa3GPCZy2CepFD1QQumbw9kuhPaurTTNWB6TrkyMRxrqKdB/s/niwHT/by1s2Fnx8CZ6oj44EngonDA0PXvCNybyU3TxxouC/EDsj36qnkYgjTxFk8aO8oQ9j/CJqF9nAy/BVulh8eqpIuuJPbVzUwFsxPxIXhFL0fZSQ/8adDGX8ngdX8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Vt/YJtS7oB5KCeWATIy3HAzNu1jsml8QQl2Q0anEjoYiFoFwacnMiWJk/5?=
 =?iso-8859-1?Q?22CMv0y94ECdNWleF7mcXOOzIaMXLJL+fZAW+nrHdUfRT+D9WwowM26QU3?=
 =?iso-8859-1?Q?eDPfzsEXimajIeEENKRN1k5C8+yCjcqpDJKHaJ4WPL1VJiau/utfMnCxin?=
 =?iso-8859-1?Q?klbSGaTiZiITMZCUIeMiCw5iDmTPMA4pgrIHwwzBasQ3bGTea7tiv3fo7H?=
 =?iso-8859-1?Q?/6b/srvGJvJJMtHpCJzcDw/DA8povmEMLmk0py66os9DEO+JNJAgHDmGaR?=
 =?iso-8859-1?Q?cKo412vzMsXMCYsbhi7aTBopC6JWeR+XDMZ391Knszp9d2OIlts/0nKQQl?=
 =?iso-8859-1?Q?wQ0NuBNHfdb6nuNp5/9npKK+DLsUN5qkfcPPCwveXXdlx5QxugRhxhQuag?=
 =?iso-8859-1?Q?Kci3IX3kPi6yqQHXIX5q+NL5otctiw3xV7L/Owxo01+r00LeSkepulGa4d?=
 =?iso-8859-1?Q?CzPFqhuR0MKvhdPli/BP2aDSzhx1l23L5H/Dq/yXugIbdu86gzv/PC8v2I?=
 =?iso-8859-1?Q?k8Ni391ItpmAnZezLU3EjRVnxAwlGubblUAKptNegnIyp8H0LhE7U069aR?=
 =?iso-8859-1?Q?NvDJW4j2ikkvqDtVc929YiH4hL9yM5d8Ki7c2ZXNywfqcfOpMkEUQlrB6V?=
 =?iso-8859-1?Q?xHow3i6frciOWU5lprl60TuoCdscfnXHJoSpYl/vmNV7Yk1vKtXCFU86rA?=
 =?iso-8859-1?Q?z7p3Gd2hEX5wAPJRbIZav3g0Ex+QkfjOzV2LmDQ9MgPA1YvCBwtfWbT7qS?=
 =?iso-8859-1?Q?5rKncK7XJPR7hDCeMhxmveqfaD2c7uLtQp7kFJmSRh9UEAOeydDkOLUGsV?=
 =?iso-8859-1?Q?jK5M4n1DkF4hy1cRmabtTxD/CSrNTuHWNuQSeABQENr435OCVxvh680XMo?=
 =?iso-8859-1?Q?DR6HxJNRPNgFdOvVUoQ9g68KKCm/9SX7Jr+/lHFoPtqUR2bDgGCdQl0QQJ?=
 =?iso-8859-1?Q?kp9dpNNs5zSXGa7AgUesoZBxqC1oxeRxqXmEeVSjBSn3ZZzBtUFllaLJO8?=
 =?iso-8859-1?Q?Gc6ng3xN348VHeoaZlqe6Z+1IPDe8GJfjnSjoi4CANhtUEBwfkATGjH3Hy?=
 =?iso-8859-1?Q?Sa+o2SLTvDHLAN0ZPILfNPpBlz8VhYKuyikBy1/+d/hnbhIPB0wvIVR1d5?=
 =?iso-8859-1?Q?r9mTAJGjfKYDnUKRk9/08B4JRob/M846iCMUSNBil4uIMnCTOKSptYxPs8?=
 =?iso-8859-1?Q?1CscTucAEYngSq+YQwOala50jiu9tSoFNh96vJUzRxisFstw4lY+oIB0HT?=
 =?iso-8859-1?Q?ZgsRBSxrnITaaG+GfHWm/kLl66/8oCbdevegS7YUBvLPg466U5hZnn4QsA?=
 =?iso-8859-1?Q?gydBuAiOwbNWHeCrpvn48kMH++bSrJuoEVOV6Z97RjV3mi11kxU2Kn7/M/?=
 =?iso-8859-1?Q?kaJcFKUTWiwjwZ6IvGF8eK8R6/6t59eQ9i/UGGxeHIn3BD+4veAb+9SsuS?=
 =?iso-8859-1?Q?MIdh8Ihk8J1ZlL0Q1rxNw1OwGtHoWBqLZqBcdhQYK442VGgdYIoUnxK7Lh?=
 =?iso-8859-1?Q?ZmzIojXbhgwOyDUN7aiq1n7O+byibJ688/nAvfXWyDuv9fy2QZZssQCuxf?=
 =?iso-8859-1?Q?WS2K8oj1JqBvwaEEqw5jjw6q0yCJeGyQZqCU1ezUkizAQ1ZFVnHlM5oNxe?=
 =?iso-8859-1?Q?2gmXLWPO+3unTVE7/nGsEBQ9BX00MWQut9fqi9hFovonlCf/SJHPJK5RTF?=
 =?iso-8859-1?Q?PaZeLnG9Mbj1YUsnrtRYFIgX5ckqFJTkOSToUCfR+n4q+2nCrXBvlTU+sd?=
 =?iso-8859-1?Q?AtBm7M/Ccd31lRDk+us02pPRpWSjygiJIzfm9EotQqXFgDeC7eEWRpEjX7?=
 =?iso-8859-1?Q?VGmLDvxQrA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G5i801KyUVIaQKSuE/WlrXOChTFQY18gkRFVy4eIDwuTpycxJ1FIIOYIH4pMYCx54ufpyfyedLN7uQmWLinngbprTDpdMA8T4YjwBRp0REU7LH3seQZdpBQlCZH8MwaoBqlGUiL+EC3xz6JE9SpJ58QiMhw0xZfglwRRm8vUy2+szCu5uRihYtIjEKA4NJUA0m4yTy5bJ785xLZlOcjJaGPIJZl9Ao18bh23wTEW5eFhe19e6/lKFHfn30dDSRgzQiWTuNzzf4mp476tYqcd+Q4EZtk6G1VXcxKb3Q9mtA4vpeO+GUhEzITsD2ayk2DzvAz/ouErBUWeVXB1UpWZXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a499c31a-aa01-4143-c57e-08de89d2593d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 18:22:46.5927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mnr6zzkMmBSsWjEMeJydvGIeeehGpQ2QJlGrSnz3Tny03e3a5LxVaF3TSefmj4sI9NHiWibd3Zf0Uk9arC2eig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR84MB3042
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: Wtibvdadjx2unWzijrHHRMy5cTgAwF-C
X-Proofpoint-ORIG-GUID: Wtibvdadjx2unWzijrHHRMy5cTgAwF-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE0MiBTYWx0ZWRfXyqqdlnU9saOM
 51s2Zuv7HMtjV/ftpovIpxhSYd3U4K7usxrLZJACX1p9/bLGbA24kUn3RcsTX65+ZxuWoZzRGq6
 6Kk0haMotVTB1vWhK/YoXKAUDyY9rwdDgd4yOz8OBSZoSKjDgOnxD1zuOXWLuizTky+L2J1LJxX
 6UDK+btbaNVgYlEz14i9pTPNNQKtnQ8u4Bt1FPDUOdKIZRBIAadjicSRl3xG6YvAp9mxvJ78/W8
 SnIA+BtxhWBi5wPtrn6iCEu93hHH6gvNlgmoT/TbnMjU3YycDsM4sOKPHMQAuOfuowRIoxCPAUM
 tJpNmzGXybTN6w7N+QTyzIf5C1DbsteTNJQt8Z3jPUQwAxNepw9Vj6vt9Izhrx+Ru3NSSYDU5CQ
 HLHlVW6A6qiVv0pys80DEqBqCkJPZVlSktdLIake+jh6YMT6abU76tXlrbBH7gKk6Ubkbq09kE0
 BcHmj9wJKorAGkGcJaA==
X-Authority-Analysis: v=2.4 cv=N+Yk1m9B c=1 sm=1 tr=0 ts=69c2d67a cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=OUXY8nFuAAAA:8 a=Hh-mfpfqh2xkjozPCsUA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240142

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
The adm1177 driver exposes the current alert threshold using=0A=
hwmon_curr_max_alarm. Per the hwmon sysfs ABI, *_alarm attributes=0A=
are read-only status flags; the writable threshold should use=0A=
hwmon_curr_max instead.=0A=
=0A=
Additionally, the threshold is stored internally in microamps=0A=
(alert_threshold_ua) but the ABI requires milliamps for currN_max.=0A=
Convert appropriately on both the read and write paths, and=0A=
propagate the return value of adm1177_write_alert_thr() which was=0A=
previously discarded.=0A=
=0A=
Clamp write values to the range the hardware can represent rather=0A=
than rejecting out-of-range input, and use DIV_ROUND_CLOSEST on the=0A=
read path to minimise rounding error during the uA-to-mA conversion.=0A=
=0A=
Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and =
Digital Power Monitor driver")=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 drivers/hwmon/adm1177.c | 16 +++++++++-------=0A=
 1 file changed, 9 insertions(+), 7 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c=0A=
index 8b2c965480e3f..8742b8b5314b6 100644=0A=
--- a/drivers/hwmon/adm1177.c=0A=
+++ b/drivers/hwmon/adm1177.c=0A=
@@ -10,6 +10,7 @@=0A=
 #include <linux/hwmon.h>=0A=
 #include <linux/i2c.h>=0A=
 #include <linux/init.h>=0A=
+#include <linux/minmax.h>=0A=
 #include <linux/module.h>=0A=
 #include <linux/regulator/consumer.h>=0A=
 =0A=
@@ -91,8 +92,8 @@ static int adm1177_read(struct device *dev, enum hwmon_se=
nsor_types type,=0A=
 			*val =3D div_u64((105840000ull * dummy),=0A=
 				       4096 * st->r_sense_uohm);=0A=
 			return 0;=0A=
-		case hwmon_curr_max_alarm:=0A=
-			*val =3D st->alert_threshold_ua;=0A=
+		case hwmon_curr_max:=0A=
+			*val =3D DIV_ROUND_CLOSEST(st->alert_threshold_ua, 1000);=0A=
 			return 0;=0A=
 		default:=0A=
 			return -EOPNOTSUPP;=0A=
@@ -126,9 +127,10 @@ static int adm1177_write(struct device *dev, enum hwmo=
n_sensor_types type,=0A=
 	switch (type) {=0A=
 	case hwmon_curr:=0A=
 		switch (attr) {=0A=
-		case hwmon_curr_max_alarm:=0A=
-			adm1177_write_alert_thr(st, val);=0A=
-			return 0;=0A=
+		case hwmon_curr_max:=0A=
+			val =3D clamp_val(val, 0,=0A=
+					div_u64(105840000ULL, st->r_sense_uohm));=0A=
+			return adm1177_write_alert_thr(st, val * 1000);=0A=
 		default:=0A=
 			return -EOPNOTSUPP;=0A=
 		}=0A=
@@ -156,7 +158,7 @@ static umode_t adm1177_is_visible(const void *data,=0A=
 			if (st->r_sense_uohm)=0A=
 				return 0444;=0A=
 			return 0;=0A=
-		case hwmon_curr_max_alarm:=0A=
+		case hwmon_curr_max:=0A=
 			if (st->r_sense_uohm)=0A=
 				return 0644;=0A=
 			return 0;=0A=
@@ -170,7 +172,7 @@ static umode_t adm1177_is_visible(const void *data,=0A=
 =0A=
 static const struct hwmon_channel_info * const adm1177_info[] =3D {=0A=
 	HWMON_CHANNEL_INFO(curr,=0A=
-			   HWMON_C_INPUT | HWMON_C_MAX_ALARM),=0A=
+			   HWMON_C_INPUT | HWMON_C_MAX),=0A=
 	HWMON_CHANNEL_INFO(in,=0A=
 			   HWMON_I_INPUT),=0A=
 	NULL=0A=
-- =0A=
2.34.1=0A=
=0A=
