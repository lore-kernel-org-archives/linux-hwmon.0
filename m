Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD81EA7DF;
	Wed, 25 Mar 2026 20:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774470356; cv=fail; b=mgso577WC5GYoAYFUSKwPtrhR04V6ovgv3I1/jqYptQ/KVVtecJe3aY7KA1CMx/z4GGtJa5FPBETtb1Hmt/RCrbZcFTKMLQDrUiiF5AhWaRgAjYVEoRs4H/P8zK5YOQSmvNci4QEsQAH672RvKtYewqAw8u8fEcpxZJJMYAzMa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774470356; c=relaxed/simple;
	bh=1/DcisYmqMfThrPGK4PqftQEKzEJXSaKuWpfQ9WTDOo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qnWvVABo/ue6nI4w/NjNy6Ki9/o1bI8Mc6qU+T4sGWvve7RgHv5xo4YKP1ASolhjNE1mnTi/5pLMqvnXos7c+E+BeEMT2YmGVd707zGF/UE5YjgDC/EC8Mez4smanDC/kJZ2D6qoxqHIGxsAfjgfOFCR+lqdcfh2pMqjCQmGc3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=AHnYso6l; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="AHnYso6l"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PHKr9n3313459;
	Wed, 25 Mar 2026 20:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=1/
	DcisYmqMfThrPGK4PqftQEKzEJXSaKuWpfQ9WTDOo=; b=AHnYso6l+AwtazWSc+
	aKmvKCC9rUXpUdMQZeqqZsHVPGZ5qshEJSHUty+uKeN8PxcNZXpClwm1yvE2BeY0
	5qvnYsiFH+1Zr4TtO4hzCKdRSvI03R9Xj2+xkN/QYag/wZQU3DB5Gjq5bckwqn1K
	IeDXuZLA+4i2ST0riBIyJx77ZPjZHD3O1Oa9g7mEOHCCGULfLsNKWU9mpG0kRrkG
	mbtDchzK2njdTGFOFsO2AeFJy176Gphqz4LkhYv+u/JGOEfKxs7DUxT04PL8uMv/
	7ecXRfNIew60QO6nJc4VUxiP2omAKcqo3PvOPpqKEUrdwZv6ACrN7utLL5ucfdCx
	o1ow==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d4hsvm7dh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 20:25:40 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 17494D1F6;
	Wed, 25 Mar 2026 20:25:39 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 25 Mar 2026 08:25:36 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 25 Mar 2026 08:25:36 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Mar
 2026 08:25:36 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOm0xd70rW+10sbMFBpPIDEL+4zQ4E0ZEOUw0RrHjkN1w8Tg1LbqItOBzeC6lxWLeYgAhPZnhcz/hlmDFHSpb8SJD3PB5Xl3Vd2unw9exvCD7lsBlqUnFfDbhGsom0YxRBbPIV6SLsdVp8WmTQ/uvI/uOc1BkcZeiZYGOTWRrpuRTTKTusP+MYDIqLSRKKRwZDg9T9dCIymzWh9OPEi1cR4C61X5KksEkEDUmCr3lQ8Mo5a8TnvPgmCtkW/F+wacvZhLz2sqAzj9o0n5FUerpBS4NCfk4Msmvcde46l+ryL1+43EVtywohEfhBW2lO8LnsjRpOBikYbCDSoDd6S5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/DcisYmqMfThrPGK4PqftQEKzEJXSaKuWpfQ9WTDOo=;
 b=WnQGE2u+U8GzK8jCdJtG9BerfMLdwzMZo0vv7sJ5bs8gGx0Z3JwVEmCQxUwsJjRdBJ4AdqSLC4GWsGvNhU+fzhjaTNiXAvsMPSgTLDFqgtyaaE5v97IS610HI0L/KvP29gyUqT1whg4018GLbGYsBYmnQ/Lezr9XTYRlCEw0iLFdtdBTqqLGknKgJe5uiNIzUByBbBuYuRT8i9ogs8rUQWRObpbS1czYE0t8hHVUhhuG3OVN8IlC/AJn5q08vBkceLaXVkuRKWmxT3Pzndfk0ubUod8nLBYQJg4Ll7QLvi0Q5B0iRGFZg42hDNtVwTVq3MXmnNGvPRQVXXgKRbuk5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV8PR84MB3831.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1c3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 20:25:35 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 20:25:34 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH 0/5] hwmon: (pmbus) PMBus fixes and improvements
Thread-Topic: [PATCH 0/5] hwmon: (pmbus) PMBus fixes and improvements
Thread-Index: AQHcvIOQKKSPDo1gT0mr6iTGw5hi+7W/sfsA
Date: Wed, 25 Mar 2026 20:25:34 +0000
Message-ID: <20260325202522.119591-1-sanman.pradhan@hpe.com>
References: <20260325181631.17259-1-linux@roeck-us.net>
In-Reply-To: <20260325181631.17259-1-linux@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV8PR84MB3831:EE_
x-ms-office365-filtering-correlation-id: aadc7d55-76f1-417a-9e01-08de8aacab72
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: Uajhf55Z0wXd1aWY5yj0DmC3SooS3sr3vTZwv6QilTe6mHS44QbsmmOEdmbwNsUCpp96/5nPHgZDpl1fwnvC1Q+t0j0O2TRCmwmRFGIDiT/J74/huXC11GcPJyAy+8pjdEMJ50mBOmY/IwSBkpBnMa5MZUmk3qEoIScFXqfC7vLRbIuDwyn1wI2LE4cRAd6ui8PCxfiPF0wQolPAaAyHFR/3n4J2aw1L9fUo74NGTvjjq4vebhgqZeDhAsfWvw04MYgEEHkj2qS/moF14vaNNTQcmNDZQnC1FWd9yd9MmHkrGcfyl+NUpfNXqPTC0+qfwUuVZ8Ais3PqnYdjR+skVNhkXy6CuXuJtYpMcQQAWrpPEoQdZqrlj4DZ6lm+V97/EHDquY3GwMnotcBiSA1ziPzkTqXxcUlTMkkdmrgxRZVwSUvUKADLSlwmVOodHie4MRj5Glutlt+HQtthdMZzx5BWpZ9IAAu5b7W69W8rLdBgGKalYrG1PChxEtjCamSAFjQtoQYxzLIb2trtd1lui8S/yo7bpdPdd+HJaWB6YqdhyEydsGrn1Kf/qt6oBvYKgghLB62xddToLYe3TTsdZoNuXZbQ5w8ZP15OJ0Pn4zx4Yomg95OBfHyKuy1IH9Q28GOQkj60bLxF4kPE6ZV7U77KKf5+WEu+k++QjziPsfnfWH8LdEv81+2fYtW2+ABemE3+FPG0kB6bppu2qA0wAil6ZzRZN4BRs2VWbQSKnSLeE4Vgnp94r75DHRUD+7dWityYrTnaonlcHXzp6ixDt6dh7F3BvpT15nVAjb8vMQM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PPm2kfLfmllEMoCQXQH+ORS6IJiz853rGS/MyyRAOZAkRdvW+KI2JCQPNB?=
 =?iso-8859-1?Q?oQ/P/mwpYxE+o5d5sT31YLmGJZ35imUlAGJBdLVKge9xzesTlqQSdFir++?=
 =?iso-8859-1?Q?Ru6pifjNPSquA/uDO08mzxEc0BS/nHnLR4+1MMM5qwvCpC8WLlnR7SWrMu?=
 =?iso-8859-1?Q?rpICfqvBEH5KPwaUAqpOS7q5NnsA24p18UBL/nRaH+EY6sI/kklKi2clmq?=
 =?iso-8859-1?Q?tGTI+DMabc+1QtXs9524S0ZWasHpSt86xOEkqJ/aisT6l8CRb1vGvePx9X?=
 =?iso-8859-1?Q?BwCrhsadugCa8lpo+ce5WFsEeNQJ3u6ZDnIhbaX+Sj1Dyah9Q5YxZ70hk5?=
 =?iso-8859-1?Q?D17MYZ9fityu6oytx23eonetE6Ux8+45KWMPHNQ+hH9ah/od/VCYKi9Jjb?=
 =?iso-8859-1?Q?DUo+LtU6JjAJaCJfFlso73mGzckZI869fE0r2EYi37ylv5bQHv03RQOu1j?=
 =?iso-8859-1?Q?ahouxpuyfCMHny+OdETN1BqGHQyGoioZClRvfuYCFrUbPMb3O/jW5zQ8BR?=
 =?iso-8859-1?Q?hKQAmTgbgxDd0ymINwkdcv3zhlPCmRe4moeeUGFBERMjl1SxiSPy8fcSYw?=
 =?iso-8859-1?Q?YZr9SgpZHhBXKoxa2J4dTVvdAa1udYSsn0McLKU6TH3g0CEpxWNS8IHsfc?=
 =?iso-8859-1?Q?ph0PD3XpB2ejGYvkco/8EJWp3UPQhEOrpRBnZV7OWN+m6rp2R9gcEgzvUv?=
 =?iso-8859-1?Q?Qwj/fulkhuOI9P0Y4GcmpeoThuRrpf9pXqhJq7rR8vl/S7vyPZ2+tABUlb?=
 =?iso-8859-1?Q?+CQnkQ7jcop9KDUqFRH6ZQnIMDH4rertO+w9DZSK1TBusuhKzfaaQiVdrW?=
 =?iso-8859-1?Q?g55nrY63R9ZlsBWj54cAaJaSxiJDhcxuv7agQxnBwVT0WJKxG7rJ4glOLs?=
 =?iso-8859-1?Q?5A+JM4SYXkIb8UqIp9+jriicOe7by8wsgfS7g31K6AE4+CsY1njV57qiIA?=
 =?iso-8859-1?Q?SFYNQIvzUXMTgcwrZWMuGnVrXiog2emmpx2PQxnqRRrzt+2Upkn90p547p?=
 =?iso-8859-1?Q?WaCZtGu9cB5vdfSq/nQ1OviphHOv/xo8AoAQrZ1VbLsOWmjR/N+yUEd8Qb?=
 =?iso-8859-1?Q?53/FSjd/4q2BVbBIsev85vvoQ1LURrIFulq34eKy/psWWnx+DYWiuVrcZe?=
 =?iso-8859-1?Q?tidJVcUNQcQT45Uf4lf66lsEtl4z5QgZpy+/1WSWKuCEf0OqivuLFkrWQo?=
 =?iso-8859-1?Q?CKMvyuSMdXztBW914MFNtdbdFfDCPGyF/PicapajaMscHQ/vkFz+lRqLUZ?=
 =?iso-8859-1?Q?rRLX3eCRzKklwEJx1ySoPb7+aKMrzOuV2CiaZ/kctILmQGy+4SmWZf8Ie0?=
 =?iso-8859-1?Q?U+tBBw+YKA3qO6VV6PpZlMoybPso2L6Y+AjotuZJvf5THjPCmxL4umsfwM?=
 =?iso-8859-1?Q?Q+yKUIIo3HREYWwwIvGGPxwahHBnXslYvuAlIgFTBRXF72HQ8d+0eZkHKR?=
 =?iso-8859-1?Q?pwovAMteMYiIiN9R6XjENoKtWA4go40+x8goi5eggQxeigmzzWk5WSKYqq?=
 =?iso-8859-1?Q?uBWHgeIfMCEKHw4fz2WHt0k9p2mNM2fSV0eGLft68FLuuyeex2wMxEYCGv?=
 =?iso-8859-1?Q?qA8G3kF+dTXzu4U8hX9bER+WGXRaZpV0YHCKhw6xNDuKcW7l0Bj4xxpzSx?=
 =?iso-8859-1?Q?nxLFyS91U5VHdw/eHQy/+NXfq471R0LWwpHLhPXdoD1vZesuEzfcotaDKm?=
 =?iso-8859-1?Q?jBTWY5USSP4dU40X4kQp+PRCYdGJeLbZcHdUmscParBCHLcKNXzZl8rI9j?=
 =?iso-8859-1?Q?9w8h1hR2RF8ZmPN6Ei+gzYTCx0n8oV3Qw2A2AST2IkwjvaJw0Fim1m4EiY?=
 =?iso-8859-1?Q?1ZZuiLfYzw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YkktVzRM5iCQfEAZ6S1W5/+5nC07Ib3VEDp5VhFCVlSWrczrhOGW/v24d3dFhKz7datHhZWbW/QTxkIRgfds5aSgzsRxUtMRD+qVq2FeoyAYV9iSN1r2dBoNZsTaYmFM4uGzQFkZcjyM1ypO+C8BKIol9T2lrgYzlCDImOQ+TeZw7/5p71NvT6R7mK/tPiQPqOzfhKCoBqrFxPL8gB79GSVfaj4W4lfxt33ZPl0Qd31kGOdbIlKakvj3ihlBoEuevOLTJ6JckC0nVGNqfJSUmk0j6nrSaAKeBv7GMZUDaimbEwl5XYVO+vFRQw+YSyk7cv2HVt8/IKOOyc+07RaBOA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aadc7d55-76f1-417a-9e01-08de8aacab72
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 20:25:34.8061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iCUfao29bGDLAXOyaHcUqADyHLx8fL5CmMeqGOdv86l85o3sZQW57PrPIkBRI4i5/JF8m4tr/4MPSR05wwQXsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3831
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=UZBciaSN c=1 sm=1 tr=0 ts=69c444c4 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=OUXY8nFuAAAA:8 a=f-XALl6PdwrtiFnP6QsA:9 a=wPNLvfGTeEIA:10 a=q5mp2vxMLvQA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: T4gK3OmZoFAi16QkUZr99JocfFOgCzWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE1MCBTYWx0ZWRfX/HdKKtuqUWJ/
 xHwZ6nGr5aB4RnG7OJdwAF9uTD5RAZ03wM9Wh53i+ZA96Y2NiSdv6OIPjPVWFdvyoD3cNvGRuEo
 4D+2r30dWXu4pUpZy7hcAngkhCd2VN60+nwQSZGjQjUXbnss52aoiJBpImFg19qcNNcd0SL/mTy
 MdG6tcDisXLU34buAzLxKObYKaigahmdd8upliQinSUaos8jONEglTSek+rNGr0V5KMvCfXbbfz
 Q8cQVJQ9DCi0d3KFY0OSCAcRNdfe/7OaZxu8q9ByqKapxIW8s+Iz4HJfsViCgV8/NjAV2dgrIFo
 hLp5dinUVPTyyU71jjVbE2hwJ3tHHhu9JhOYfzlEHoXecSMEnkYM6uArm+hHUAykk14XUlWz29c
 OSrGFvO78u5Q/W5KF1Da6w27/3FpBOmkgaNPIpOLCHpYKJt/yqRkTKqyU4sJ9R2eDJy72f95xfk
 b1q7pPgXPMwbkInjjxw==
X-Proofpoint-ORIG-GUID: T4gK3OmZoFAi16QkUZr99JocfFOgCzWa
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250150

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Thanks for the clarification on patch 3/5.=0A=
=0A=
Reviewed the series and happy to add my tag.=0A=
=0A=
Reviewed-by: Sanman Pradhan <psanman@juniper.net>=0A=
