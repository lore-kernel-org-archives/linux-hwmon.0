Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91F1390CBF;
	Tue, 21 Jul 2026 00:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784594687; cv=fail; b=EimMHeO651fFWZNeFJzWNOjr91GjdqXO0p88mvTV8c3BVc6HvG1bxw9Dj/HIO28mYO1np2htIYaOVzTuLws2sK7Lzijd0Rj9Y0b9F0vwLqRBFKMvzpgQ2hztRy2lQdqKbGYW6yUdA0vO/MSQjnFgILlgma2Bg95ZhuNrBF5cZ04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784594687; c=relaxed/simple;
	bh=tOJXn4ESubTgG5IGhcVRFjL4CpOKJ3Ru8PHMxotFhNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EJ8Bnx9DhrCTJk5xzTGeN8XE+WNVHPYDugKWU6rbiZ532pb/2U+SM7C0bPiSRXCT9Z8BIWmHRM+ymTYVwbVfgsTIsfb+dkNbQ0Pl1B6akgRZ8qJ88brAmtoJQc0Iflb947+U8sGthpZxCgEUdowB7NAyDqjQMgbTMeS5DMr+rHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Sg9E3orW; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Sg9E3orW"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCdJD3189968;
	Mon, 20 Jul 2026 20:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=qLl/i
	01H6N3vSjzYJYwc1gvDghaFRQDM/OMYMejH4wk=; b=Sg9E3orWHEQrKLOsre3PJ
	z6FJg83GQjQYfSxWgqszSoRnosVU0hOZawHK3KKeVW5NJYLnn0yScV+8+WSH3bCl
	vXNDkbiN6fQYmKNQrv+5psKgdTmo9eVPHCKXuVv9AylYGv70AFEmMJqR3MCydFuy
	YmBHHX+yhmjsn4C5KcoKDSKJiKDed16YgGcJt5R+A3Ey3VXnhAfctV+bAs5mjc6N
	/r8T5/sYa/0dCnm0SwDtsrPiPMEBthglv+8/TUPrTTsnQ0aFh3odUq6lKqdLowcD
	oAmzM61TkKR3q3ooSakvdsQCg996BLe7DXFcmQZCV1yg0VMF2OeEowpt4LExDO+9
	A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fgttgef12-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 20:44:37 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKm+h2cUJ41H+RmX3R4dIuRv9b0f7VypH8zLkYknoWP3H+uW3I3DQci0PwICuFzJZ9rAzaGOrPLXrW9+fr/x8tVky4GLV4H4DjpCkFvVE8t8c4bOA7tTY3tkLXRUgrO6x8u2ny6ISZZvQ11tDDoROBbDdvoKHOadtL7CnKJjzX0+rAtmkmvC80VFvG+vHtzAOIqGimuPvPRKywPsUIf0/J1h4N4IXt3oNiLtP6T6mc4qM18o9MSETBKgLq72oZgXdZ0F3A6hAqd6DOXc6GNuWyZMh+5fC8GM/a6mMEepsnLm9OQqaBqrYaclscIr3lVmwZlnh6hg3b4BXhD+xvDGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLl/i01H6N3vSjzYJYwc1gvDghaFRQDM/OMYMejH4wk=;
 b=OcUh10n/NNO5LnC3A2yG66arDGgyK+IUmjXimXY0Bz+EBjbJNvb++WSs0r5pspXsgnTW2GjvaCUsrIK5N6Vp/7X0i8rsRKR7KsXp2b5+sQSF8h/epFRo5wCJW3I23syRMjsFbHPoFgy8ZgPwSu4bWqC50kH8GCQhq3gWQLPhFIAmIkGUV8A8u4cfFGjOu88NiDdwMX28qEC1v0xFDLcf7Q29DIiYk+d3L5RZK0jlaNIG5NTWff+FqHgFPYufoctuazOUOz3EZ/qyNNsLQ+Cv4PGmtRscIzvLgc+IHUgsY0ORYRvUA49yy4cfI9ZnkDR09Fbtrgsk1AZFq/iaAB4lgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SJ0PR03MB6951.namprd03.prod.outlook.com (2603:10b6:a03:419::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 00:44:35 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 00:44:35 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Topic: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Index: AQHdF/YCzJ3w82nZi0u4PK0Z06eq07Z1vwAAgAFW6nA=
Date: Tue, 21 Jul 2026 00:44:35 +0000
Message-ID:
 <PH0PR03MB635109584F166EBD4A5510B4F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-2-9d06d27d6da3@analog.com>
 <20260720032550.A4F891F000E9@smtp.kernel.org>
In-Reply-To: <20260720032550.A4F891F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SJ0PR03MB6951:EE_
x-ms-office365-filtering-correlation-id: 903f1ced-f882-4ef1-a0f8-08dee6c13cd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4133799003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 vKFupTy429spdyuQPzr8jcYiN/o/TE3d/WJ8n7SiVjmtN/BIH6BO8DxT2VZfepsI8GDSOce7RbbmKSPh29FcfGJL2QMgBSDxIKbhlWCth7eY/KCzqR9ogZ1X7VlJ/A9HNyJ6kx3K/tZr74IpsAu1JUJbmrsMjv12BSMMrYcyfBfVGwPHrqnZ6X0yiuOpvlpOklj2uPHL+SkGhDxZbkZfc4RJ/BstUwYxyYAT6BQMIsAvxAxnqt5Rdd+Kq98ifJrMKRy2yf/5I5Ggpk+4TT+HBGqUlFTpFBI8niE/OvBxZ87X1iBD4L5wZVo4Uti/oUVk/FNF0kga/M6jZjTV3aEz3FNOEiz7qCza+Uiy7QFQs8F9Ae5jk7dr1LISZGLe65Oku2RjIaQFg+PlaHla/yQh+qaZmUanUcYEuMA05i2i9K4BAX7RYd866nMXkDPBPnlpGth81SoCSQSIbAWwyi4IBwhuYvC0W5EKHpqY1OdBTRqL96hki5x5VS3hE26y70Gjhh6OZqV1eCI9RFFvGJt948ec7zO501xrdgPTXSaSSqAzK/AffUpNgWxm3i65WIdsUgLvDnD5Le4qgd5H8Jk3Y8a/G4zJrz10GWqc2aXz3AWQepsObX2z1nhoYU+pF1zpm3R/g7GXAwyYuEiIP/wBo61NIywnNJe6sDnF8ObiAQs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4133799003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8IDrI0vA5zvmUtvBxupPRZdz/FpM1Q4wjK2ZjW/zJ0VDdEtALTLSKz0qdfTh?=
 =?us-ascii?Q?9o75bXR9kaXKfA1imvPhRpx2o8Xkli92ZLipg+LNaf0RIjfWzxdWsy7CANYn?=
 =?us-ascii?Q?2viNghCdI7E4c5HO+KWPnqC6hxiNqubgEJEkrnTTlG53sFW1wbnESXob6ZUu?=
 =?us-ascii?Q?y7ajp4c0Yy2OoLiCVyNd0h2mbFBnD1hONweez6mhzKZYm5RAnTlGPKgBc3DD?=
 =?us-ascii?Q?Pb1oXJVkebqSjLksuKwRCzGZ3Cqw2CrFeb2bUCZPRZ/ykreBAX98nrJjwnP4?=
 =?us-ascii?Q?SqW+yJpDQ9/yPNJp4PMVCuKPcnrGS+jjGvhz7KsXkACo67Lm5rbpU11Wst0e?=
 =?us-ascii?Q?/O3AuLe6Tzv8ChZlUADm/97/YcY+uL7u4UXNwvPN3mcq9Dusf27XKvxgO97T?=
 =?us-ascii?Q?TtDVWbg1jad3ieYGwDZa50uAIJX2bOhDkSvTsdAnbL2RTFqURn01LNAK3ud2?=
 =?us-ascii?Q?HcL9axJ5gb+5txFJD8B3drlj3TWXpa0c6TTXUfuw/b4WYk9nqRhkV3sHm1Ne?=
 =?us-ascii?Q?qOstTBR+FCDJvqdj+ELQB/hWD9cYte04hgJ3kRtJIZlz20ochriOjtwfGngy?=
 =?us-ascii?Q?dn7hOJ4OqafoeAvWSrQ4v81qCv5fesZ/Q5L2dsTUpUPiqXek66wMEqFB2CSq?=
 =?us-ascii?Q?RvG3NLSZfKEMLFdOCC0BKSRgTyjrCWwqulyQN4DakH2tNQ/M/vhLgcPCF4Fk?=
 =?us-ascii?Q?1MH1vhng+9P4ada+cqBx5awcZTez7zfKSbbnfh2gtItRsxYdu1AbAQbujSE9?=
 =?us-ascii?Q?eLiP6a/BoBoJrLE2WuP9Szff5Xbf/C3ssHaR0L6Eb2hRmhNt3CSDG+Bml1d2?=
 =?us-ascii?Q?hsupz+vlrMaIJm5HeWJfwQdzSe3wtCu5Df3T4Y9U6WNxw8rGZeKNYhh6YWmZ?=
 =?us-ascii?Q?EWot6LmTGWIHptFe5RYi7SMGY+o9CULlOwS5OjU8RYxfsHK5L6yd/YhBoLOS?=
 =?us-ascii?Q?X5BxtWZzElqU/GVrOwXgcmMFVDXBkOkRD0N16awfc4HZxqVX0hilfFJqYEpz?=
 =?us-ascii?Q?EyI//K/60pXD1crRev+sHtviYxYyBRpdlFgQYSId7M0gJQsN8Q2NOyzNg+9L?=
 =?us-ascii?Q?v20XXyXDc2zzyDDyCn2YjlpR/ZpU+w0XDuSfLPYlQaeMx4OQequU04X6q7Uv?=
 =?us-ascii?Q?vvsc6yMasrcY7Ppc5ldM0tA7oB+xACzYIJYbYJPKeXI6lKasBzdBjLCGfmbF?=
 =?us-ascii?Q?UECW0xqLKLn8lBR5M2IIoT6M9MBXmKPqC2RWvWMSu7dcHSf3y0yIzfixmCRk?=
 =?us-ascii?Q?do/YFshRT1jiVebCZ8mXxeceVIHOF/975KInWAmol90xiMGnuPXkmvgVp1cK?=
 =?us-ascii?Q?PKsN+ZiERXDARzXtcbjhTTuTXOaJK7hcD56CR96SONbCfVTI1ap2o+u/K3wA?=
 =?us-ascii?Q?qA/NtylpAF7s2TwlVu++UjEmFUOW46o5UnqvJdUAwDo5TcTmA/I3h30q4OYT?=
 =?us-ascii?Q?bBE0cLizdAcY0p8b85sQu6RFH6Qzim0yDDyGDkI/EjDYZb2O1E5Jzo+57k1L?=
 =?us-ascii?Q?Lo9LGUixHWY3VSkCMDicDWzOJGZP0hmAQ3MVkdMYU4QIxDVyJLdA6oNeDtnq?=
 =?us-ascii?Q?QAbz6IRYTtKceo0HGNxKRUsy7bP3uA28ZGnj+gOW7BEfc17wfrZiLxtG4r0b?=
 =?us-ascii?Q?/0ThWqqyFErilYiz2aK1SgBEC2LUsr71PFaOKwSVB+sdWNAcYyPSDuXPpfNX?=
 =?us-ascii?Q?KoSeH2aCxPpiEkPqQiuX106MXZgqkjdxq2UfS86X5SlgFZ63KmxNfyC41npz?=
 =?us-ascii?Q?7cwZP0lSy8geQ5tRevpxRtsMqlhxMXA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	rt9hFPvnOF8QI3oX5XQz3N0ZWWllZd6bwOgMGhGDAVhu5Qsl0hGUMlt0cfwoCCBOc4/64qocMLcQw6H5JcuckhKe0thLJx/kSgKStnB/751qRpUFZx+NsR2Y/uG7MBpasnoOarudHBrir9eAnXHAAr8sIqcRdKNJVSEBW23kCnmcoJP3LaUFTOFikIWc0n75Sp24rh6QLw7JZPP0zDK1mGVXkssLfMRHhVsYfNIIYw9fScj8W09qmza3FiNCV/uiw/oOuOm+CA9D4EjMY2IjDOAGbG3ZuI54S2xguQC/Y9V3Zk9IatAp7c4J8hBEFQEy2w/MqI7VWjNGGFrcUtJc1Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903f1ced-f882-4ef1-a0f8-08dee6c13cd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 00:44:35.6223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQD18JbliE0YiFqwOfX2+SoHDGEIcFMaCAsaLY8hrquKi0PLGZBsuSyC2koayRHPTmyoVScfjZDjTD62e8DmioLBOz6iPOfa/Rbz5WzGc50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6951
X-Proofpoint-ORIG-GUID: hz86YpPWxSTpzIzB-LXZpEq60wHrAuav
X-Authority-Analysis: v=2.4 cv=DagnbPtW c=1 sm=1 tr=0 ts=6a5ec0f5 cx=c_pps
 a=Et1EcG/LeKhR1br1BBFfMA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=6qIfmrQ-uDjTnqxQwCAA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAwNCBTYWx0ZWRfX8fc4g0zae2yD
 LitHCkVQSfDqxgdUESiXXot79xS87Jxao4nf+BaYug0M2+yIYkjEW1t+at5rIJ+Oy0A+4dwrvtF
 N8uDCdklbZO4wZY4n8+e/Uzw8WqWJxtHnlw7cSEBt7j1IBM0rWUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAwNCBTYWx0ZWRfXwV1c2NzwGwaF
 y8DsuP3i5+UIkG1e22Ok7KtSxbDWaB5atttl6XJnupjs1pS037SRy1JNrR5W3F36eFlehimFLFt
 Eg2SUMf/6eqIvXA2Dk2DLX08hxWmq8BzI85l3NbkfzObdN0GoTN2mdsRw0nvE4AZlt95a5kyRoG
 LMtaZQa/4baS1CdChJ1AUQlyLU2LX0/lmA+xC55aysl+lOSDhaaweFD4CyxDijyXGcXyE35iTuQ
 e/FCrrZzpbspRiSrdIYc9NJ5CPJHwuiTJGXVEJG4OvX0FAZyo2yxAyjgVYvV5LmhCrVSs67mfom
 +xeThs0dAu5Q7u57MbyAGHQd1WzZt3RxdwpAkAV/BOreJ2P5EBmFMWMY1Dtk3v10apkqQw4HKa5
 4ufBELMeDynC1Cx0x5ld4xGymf7MUgihNWoLLY28DdDdAV6gc6I200Vukrs3ZZqTGogBf1U2iCa
 8QPtihL8vRSGZSU0eow==
X-Proofpoint-GUID: hz86YpPWxSTpzIzB-LXZpEq60wHrAuav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210004



> -----Original Message-----
> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> Sent: Monday, July 20, 2026 11:26 AM
> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
> Cc: linux-hwmon@vger.kernel.org; conor+dt@kernel.org;
> devicetree@vger.kernel.org; robh@kernel.org
> Subject: Re: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
> resistor scaling support
>=20
> [External]
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to
> consider:
> - [Medium] The voltage divider scaling calculation suffers from a 32-bit =
addition
> overflow and an unsafe 64-bit to 32-bit signed integer truncation before
> clamping.
> --
>=20
> --- Patch [2]: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
> resistor scaling support --- commit
> ac88893286286c633f117369db91c2cffd163afd
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>=20
> hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
>=20
> This commit implements support for external voltage divider scaling using=
 the
> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties. The dri=
ver
> reads these values and applies the scaling formula to the raw VOUT readin=
g.
>=20
> > diff --git a/drivers/hwmon/pmbus/max20830.c
> > b/drivers/hwmon/pmbus/max20830.c index cb2c23672166d..7a5e67bd33c0a
> > 100644
> > --- a/drivers/hwmon/pmbus/max20830.c
> > +++ b/drivers/hwmon/pmbus/max20830.c
>=20
> [ ... ]
>=20
> > +static int max20830_read_word_data(struct i2c_client *client, int page=
,
> > +				   int phase, int reg)
> > +{
> > +	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client=
);
> > +	const struct max20830_data *data =3D container_of(info, struct
> max20830_data, info);
> > +	int ret;
> > +
> > +	switch (reg) {
> > +	case PMBUS_READ_VOUT:
> > +		ret =3D pmbus_read_word_data(client, page, phase, reg);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		/* Apply voltage divider scaling if resistors are non-zero */
> > +		if (data->vout_rfb1 && data->vout_rfb2) {
> > +			ret =3D DIV_ROUND_CLOSEST_ULL((u64)ret * (data-
> >vout_rfb1 +
> > +						    data->vout_rfb2), data-
> >vout_rfb2);
> > +			ret =3D clamp_val(ret, 0, 0xFFFF);
>=20
> [Severity: Medium]
> Can this calculation suffer from a 32-bit addition overflow and an unsafe=
 64-bit
> to 32-bit signed integer truncation?
>=20
> If data->vout_rfb1 and data->vout_rfb2 sum to more than 2^32 - 1, the 32-=
bit
> addition will wrap around before the 64-bit multiplication.
>=20
> Additionally, since ret is a signed 32-bit integer, if the 64-bit result =
returned
> from DIV_ROUND_CLOSEST_ULL exceeds 2^31 - 1, the assignment to ret will
> overflow into a negative integer. The clamp_val() macro will then evaluat=
e this
> negative number and incorrectly clamp it to 0 instead of 0xFFFF.
>=20

Although technically correct, is sashiko a bit paranoid?
Feedback resistors won't typically reach those values.

> > +		}
> > +		return ret;
>=20
> --
> Sashiko AI review *
> https://urldefense.com/v3/__https://sashiko.dev/*/patchset/20260720-dev-
> max20830c-v3-0-9d06d27d6da3@analog.com?part=3D2__;Iw!!A3Ni8CS0y2Y!-
> Nb04qCcfItlq4xUQf1LOznoGLxKoSEsno7xJWN0eYkdUVeuxpbLDHOwPO7BxUuG
> Ay8TA8LSvrg2p2pTJxd3gvxozfIGEIg$
