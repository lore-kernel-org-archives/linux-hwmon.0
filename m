Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A331EB5FD
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776308668; cv=fail; b=a+UgRFGU96xnov7vRoXKBFbgVDorHLPXNdpSMp02Rw62SIjb+9LkiMb+xf8/J7v58VLliTLazYFnNeM/RC8/BwQSNcd4TNNLhdv+HfZ9tSQZTkUTPRvKJK+d06BGQNmBoue0EM0DYxGbcw6SEkt+ADln2M9RdvIkg6D+MIONLuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776308668; c=relaxed/simple;
	bh=VIzud0uLgqH/YQklackg88u8L477GsZyvox69BdG3Lk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mpi4pmQwCTAm4slXgGVFfjeQNVR7c9K7jrMxTk1KYRpaeURkqrSHw8ZDbRDhv/ZxlNBwP7Lk6Q0MfqUo8MT/0Vajrw5HeRsQihoVD/FPD0DshQOusqwz0rjA5yp3dxG1osypl9vSgZWek7jiban2yhzA6bbJ1bEAyWXh4f5lYvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fWhxAXzL; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fWhxAXzL"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G1lmCk1736681;
	Wed, 15 Apr 2026 23:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=oggxb
	bUsJRIPC6HQ9OLjQY3yv2StJipyDeu0zuCgTIk=; b=fWhxAXzLB8qr1StpBQBMl
	gh1QEDqciv0qprzp8dFpRbosHxXI2HjIAFy1ubW0tWIBVKlWJhHtXhHKQxIMNAhf
	erBWL0mUN5Er30CEXD05F1xHHbYfBYAu97PeXCiUZaQ63MlbBLhpmrA+ZGY3/P8s
	Me4CiVs73KWY5aLe9n1bp939JRvXSvqu5ZwK8/V8P6/twU7H9bHV1bCHbUmMbN20
	uIoUbSTId3BdYcCCUvjFZOYYQD7lCzme9DhBLXbhCYIKhw/n8zEVELDous1/v9E4
	CM7tVw1WG3Wb3GTL+pe7N1tkhUufKRpcKPs8wwp/gLEMBFof8ZGTXIZbqjBmMelz
	w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4dh84nhmkk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 23:04:12 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kY8Ui5fE4IAkAfOklJjpM9qBcwth6ol3Ig8Ny9sK1NZOvXdWsxNB0hQ+ox+ApKnHzJ/EzGgIqq+zsQ2fabE0JZeUAlXR1L8nToh2gHE0zwKoF2ULfEtR+lGuymQA3aVzy+lCc2cjtEJ4uwPddnAsLXJ/DEjXbqO1bCEKUGLP3wCWyxT/L7TFIYo8lSX426VjdayQ/CpIardje4yFA48fKKCxObFcvgBvDb//MFFA05iMESMs/s9NgsgAS4g7RE52QpCBvGzc0Idsz2cfDirnP09l7YLR4GliXpR2uO5vcWt+9jNOgCzmt3ni3kGBOLBwXVgt0rA/ZdrnpfgSpve4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oggxbbUsJRIPC6HQ9OLjQY3yv2StJipyDeu0zuCgTIk=;
 b=tBYC4RgvSXL6g9TKgTQXDRdJCEnoiUhzQOHsntI1yE4lfJJd+bLG/w6Qt5VLRxNP1LuqKkaOSyXDFx+DDT7vzAPPbL+Y7jwEgkxpc+lHbvXpvt0xA0BXDZCT4VZ5AhNyMWUHJuxYnPjxg/DF/DMmo6n983d5kX8QyjrESbOjkU4kmJrZOYXGIPPKn9Ow1p8Mxj9IV+XIxYKGBpoyUn0m8+gfxj2dcgGIaMRFOLt6Dja7p/zPFJtU1ScH3Oi2oJ6fzLAr+qyZVSoyxH1NV/vcBIwNP/KtHaHDKdWndFjO991si6kIkrdUbD9dhB9n8aQIJ7aJsv0nuPWqbkTYzZPCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SJ0PR03MB5645.namprd03.prod.outlook.com (2603:10b6:a03:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 03:04:10 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 03:04:10 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko@lists.linux.dev"
	<sashiko@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Topic: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Index: AQHcy8dEUgafwxoXDUyLmPRX7RRvmrXd/qEAgACm9YCAAL46cIAADT4AgAGMzwA=
Date: Thu, 16 Apr 2026 03:04:10 +0000
Message-ID:
 <PH0PR03MB6351026955AFF2D037BF0266F1232@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
 <20260414045647.4AACCC19425@smtp.kernel.org>
 <69f893bd-bb38-439c-b7e3-30d17c6b8cd3@roeck-us.net>
 <PH0PR03MB635179B8E59E60DB994415A7F1222@PH0PR03MB6351.namprd03.prod.outlook.com>
 <e4a4c2a6-e757-49f8-8fbc-215a74c7a9b5@roeck-us.net>
In-Reply-To: <e4a4c2a6-e757-49f8-8fbc-215a74c7a9b5@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SJ0PR03MB5645:EE_
x-ms-office365-filtering-correlation-id: 3ec11db0-a85e-4120-5139-08de9b64d4c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 b5xZMWM6fPo/RCP9x2HU89DBuCeG6IUvoVtJbs1RrmhduaYYMOJGLI6XPJTR55ZN8pi/yuQt5IQmRU2tX+cHkOUN1ycDqJc83LhaFF0bu5RlCT729UC693i5tTT8cRdTFKQehWnc2zpbqsl3MuGqtx6nGoA43EFxz6cOiBIi7+qnc/0rB5PEN6tIsyZ0xYcSRgo8U9NW3yatf1Hni+il4NsFUuVXE5cagouKqgA1UQgF+/Ru2KJfzs/ioLB3hTyxXO7pWdJ6B9PLwuXuRxkYYUokwyUtCtKkpxsqjbQcz/+T6gunId53h9BSTUntP1qH0YI/CwGHTkTUhVNTuHc94XI8vjGrRrCw81KBm0PbIgiT8zTnZ6w7BYamQm4XtfU9S88RdNy5lun+y+Tg45xhQuKbiXsogqM2rAVqssWpg+a6FnFn0ZT9OX68bAlBxEheLVv+bQnSKEQU6PhzPjCB9F0YCyRd9+YisAkjbsRY/wgr7jnY2wv/zo7n0gaLP5Hac375JziahcIDBct/sOIgamA6RKWYn1btPrUv+SjAi8NbEqKmFISA14S3TtZZtgZvcX9t/cTRRUog/Z9Oqil/4og6VfLayImEEmSHo1DPHbW5ypaQDenEuAwd7VTobJ78KuViaie58a4HxcGNvp6bxWj72/Z7VvQsYonnczVsxQDBrcOYoGc4N9T/0sz1m++B8tDpUJaN7vtrEJSPDLzbeERzYvTm3LdQmRRkzfN2FZbZSrzgfFNzQNSlA70fgicCYAn2TUP+Bu1Vv5ejOVet7tmwSZosakd+Dl0ElSYf9Og=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NMazSZDBHBTVk4N+VxJ+NUg1/YFxLq9/gj774j9jmqCkhYBDW2SZA6ZR6pdr?=
 =?us-ascii?Q?RWJC8rKsBNv35c3L0NtFMh06iG4d+vjqdRtENAXtn7/SiMht3LAlZCJxciK/?=
 =?us-ascii?Q?sx9WFOMsI06v8Jj6zqWXICGKtPWCrWUjA5I1wS9Sih4vxhEf6x6OZD1sWJco?=
 =?us-ascii?Q?FECj/y2SA1EFtitWWUrVuXjd9eLsS8U34xSJuOy/oSLEnl3eom0BboMM4tWW?=
 =?us-ascii?Q?0ySLyT4bAS3bmA5nAcjW5pK5fzp6C4t+jmdgcuFa3IG0Iez0Rgj/11lDGbDd?=
 =?us-ascii?Q?KftYP6/uAtPBUTFVZ34hbQ/ngJNlfGQMQ7aTXxcjZ3LAlNPt7CwRePS2T4yX?=
 =?us-ascii?Q?zLNLGKWjl966Ya41hcW34hK0TkheLrTUUNgymHc+DHLQtedP7dfT0jDFxR04?=
 =?us-ascii?Q?NupZBlB18/Zmx9Pq2mJP0QAR8qkcapS1ihYlMrgqTL5oNK5ysmGDeCb5xsec?=
 =?us-ascii?Q?kr3Gnac2lQ/rY9XniS+S/bJC8W/n+cJOCJ5nDJ1j6MjvpScoYPYLkJP8VYmo?=
 =?us-ascii?Q?5g9W7fhV5i4l2WXD+7lYqeKOgPmVQjrayOHth4nnEiPoobWCInrjRBfHo3Wk?=
 =?us-ascii?Q?FROlBfDnHjhypknASNZ506eSMe58AkepCixGudtcg6/zOqaUWkxOcG5kGxQT?=
 =?us-ascii?Q?enDZX/5rgMEZbOZ7isapdLKBT0KFEZJz30kVtwTgUKIGGgxdPFeyIt8Teq+2?=
 =?us-ascii?Q?4aTgOvFUe3OiTiBP+6oDQs/8t0WscyaMPtvLIT+1bOfSt9q92e9hgkyt/2mm?=
 =?us-ascii?Q?olG6xHJCx3An5ur0alGPQSh/W7Ph27lAq1qclLaVFo8OpTN7+/e6TILNHsc5?=
 =?us-ascii?Q?UFPzZ7F6/tI5sW9IhJhLA/wmVTfNw4djd7MIlRds1ZFewKIFHk5wXneesA+U?=
 =?us-ascii?Q?jEQLIFsJYhtrvLF2j6sS8gKoYi7fm7A7lX0sQtLTV6Odl2hmEOUKnmO6Bkmo?=
 =?us-ascii?Q?IT1n4D81aRmVfQpCIzn6Y6bQDNDcSOoMvMIH/BQinYDtx+6zWMPQZV24YCyz?=
 =?us-ascii?Q?poWkpmmLM0C2Td+BAA63Is+cBzTafA2qtlH7iT+mCHARfI6qJOzyUAs66GA3?=
 =?us-ascii?Q?xa7jE2vCQBGRQVTAOcDNfwaGwyQKAJjzWkqCwRPESloXobY85UkzWlZkwCgC?=
 =?us-ascii?Q?dincdoEYKHknuhUemOe81nQSdA3/nxOrXw2y9tIC5X1W8LdnK5pZ0nG/H6rR?=
 =?us-ascii?Q?asg6ESJAtAOEeD0P7PvJD4oXy+wyeNi2x38FMRda+y+CSj33N1R36W1+OQ/Q?=
 =?us-ascii?Q?CHkptMA5zhNTDShhP/PZLDvbId1NmRFkMlQAPn/qyj8ryLDpyngRH9KAjqo2?=
 =?us-ascii?Q?5PfCYlOe7k5AAESfycU06MBa3A6UxNhIhxZJF5Rvnab7zcBEJb3jXHmJCyU7?=
 =?us-ascii?Q?1c0TbC5TIEgqR4dlca7dONBt0XvWVPHQdHvIm+VyfO7a3Ivo+37r+0ahsO/o?=
 =?us-ascii?Q?zDYMWDlaeNcIN5LqTxN64n112IQyj9nKUrMsmOxgnL1Rbl09IGtQB7awglBS?=
 =?us-ascii?Q?ce17lxc9RWTR8BSVCAHRJQTLZIsMM5PpMXN3TidwyIgC9oOmgeF2brzRlSV4?=
 =?us-ascii?Q?Yz+kzQVsehjKpX1y1HeJSCHP59Rl3NrZQou/52vxp78UJIcG2q3EeEVA3AOO?=
 =?us-ascii?Q?9OAXPLaJ67ZHfmLjl2YFdVCCI06a38X8D5grgo/3jKaaOSwzX4OlCM9cnPYv?=
 =?us-ascii?Q?Tij60CiZ55naxNoN+P/Fcjd69bh6CbMkXJ6m/rDvS4vFAKA1G0+yqkH9r8vo?=
 =?us-ascii?Q?HUVWnTkwAeKZQ6Od1zKuODx7ebwKa6Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	bS86BDeZATQ9S+kWYUYMAXxSL4YkTjUC3Kosp/S2T+QqbaycGCcugh0IU8PAL6WXibfh6cC7HegwCcTGy5uBaLWJpoxECuEHDlxATBtA8BKQzPT77H/YRK4bft7PILizxDymDgR+raK3/8oZPavVUukooZl9vBwl2ZGbGXo49oU0leH/dnTTP8cXda+CzI6XYi30UlHv3vqb+posrZ/Jfg/v1oho5sm+q68vyTfyRDmLoOjqqF1LY5+iTiUMz/gs40aEN5EcBKaSu2iNwsqCl2CD+mIfn3NdRbfZH7H/HvpGid1L7SCxrft6Wy/XPig8sCE+Hz4oC8blACkdFpn+Mw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec11db0-a85e-4120-5139-08de9b64d4c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 03:04:10.1272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4vVvLn3LVLXENWVivAHxIkuxw1NRxKknUM3HJ/va6iYOp/NxQWzK86LcaDwsexRuYd1a2NEI8Qj0Z0hCz4x4r+ILW7jcxje8+I+EmUdSlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5645
X-Authority-Analysis: v=2.4 cv=IMQyzAvG c=1 sm=1 tr=0 ts=69e051ac cx=c_pps
 a=l+Dg58WJtlZLJwH7BKFLvw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ZQxX5BWu6Z8IJBb2zLX7:22 a=NCTkoKkEeFucyI6JJS8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 2faVrVDe4fOa_xi1NL4viLmDYPRqIWO0
X-Proofpoint-GUID: 2faVrVDe4fOa_xi1NL4viLmDYPRqIWO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyNiBTYWx0ZWRfX1/bgiy4mLgdT
 hB0CFOuznXK1s+3xr0bFC/MSp3kjcjo9BrP3p1dcqojmkV8070XmS2aq9lS/z6lmOCi9RSA+DfZ
 iHM9zwjDtFp0dJouCS3bvFVrzTa4442VWYsdxywBPjHrIR9+1rqjzSD87CpBk6zaQpbo6Gsienp
 X2pWx6HKTWYpde3fT0NotyMbgacxQv4bVZ9xYoqAtA23FcCt3hL8+Gh5yoMt6G9PwVf/HHqHsRG
 F6SGv5Ryp4jbhg+ZhwYUF/jTVDCGVykvYg3ucagXrruCtFfnCAN3Yp708bxbPWT3TDkesrCuQh+
 1Gw+ARa3TUnhenR6l3mMPeioffGxt19ThIURaWJHDfNC3L3c3vufBpHN/dioPV726Yt1bYs5ZZ8
 S3sqevyHBPn7KRVBqadQvaslFZ8PeT/Ke017MBsIZIOWBy1lBi9F1G+rPUK5Lv4uvReqgi5m8dL
 GuXV734xaEK2UWGsURQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160026

> >
> > I may need to keep i2c_smbus_read_i2c_block_data. I'm testing this on
> > an rpi4 and it seems i2c_smbus_read_block_data isn't supported by the
> adapter.
> >
>=20
> Odd. I can see that the bcm2835 controller driver sets
> I2C_FUNC_SMBUS_EMUL but not I2C_FUNC_SMBUS_BLOCK_DATA. That
> makes me wonder if the controller really does not support block reads. An=
y
> chance you can try setting that flag in ./drivers/i2c/busses/i2c-bcm2835.=
c and
> see what happens ?
>=20

I tried using i2c_smbus_read_block_data, and here's some log messages=20

[ 6857.261998] max20830: adapter does NOT support I2C_FUNC_SMBUS_BLOCK_DATA
[ 6857.262006] max20830: adapter supports I2C_FUNC_SMBUS_READ_I2C_BLOCK
[ 6857.265228] max20830: i2c_block_data read 32 bytes: '        MAX20830'
[ 6857.265648] max20830: smbus_block_data read 9 bytes: ''

i2c_smbus_read_i2c_block_data returns 32 for 32 bytes read
and the buffer content is expected "MAX20830"

i2c_smbus_read_block_data returned 9 so I think it read the payload length =
of 1byte
but no data beyond it, hence buffer =3D ''
