Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9C1DF248;
	Mon, 23 Mar 2026 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308819; cv=fail; b=C/genfygsjLdWCS7L+zcT528dOlNDrcXO2WHRAnZ6FrbKs69Lo8veUuLcQbrCd+gGOlNCmYplbUwalGM8Dk79Ifq3oxh9gE7TByac+xnaawjFakEZ3SlOgmdLtFjpSyjv0SEdOQ5G1dJnKd/Omt0YPY5z0/by96PAWuaRugJLSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308819; c=relaxed/simple;
	bh=Yk312SpY4E65ZT6uKWZz2e0zP1g1rlkeggSq9Wfl3Ro=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=vGRuOqkJYORizwmNKBi2WOkV0nWLwJhlRBDL8Rlo4g9iNEU5IIfKWXy4H786HEh1EJ8k5G6+qPN0TzUwJg5efF2Mxxk+6fn2VbQ0ZbXNSzuz8bz7rBbMZ82r7ohGhmJmqIW8//Tldr/DvCVbQm3wSI5wZ4TdY73O+vYMUw21ZRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=BIy2tqt4; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="BIy2tqt4"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NKEUJO2865092;
	Mon, 23 Mar 2026 23:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=HsW6IQNbM6auc/R2lo4wjyL6
	eLraOQ0ABwMeONJVl/0=; b=BIy2tqt4PDxIiyrbjB8pGP0R95z+W4LBjhGsjoqR
	ve8DBrB3Bh5mHqSYuwQTR1dHcSeW/fJRDHjFZCOBXuM8ccaaDloipkMygm/5HNNb
	AAv9Aq+TQKZtN2W1BpMGYlvpR+/5I1TXdMs0Vj9BkVi03whIhn+M3kTmN3mLzju/
	iT625S3519ak0UYJqAXrl3ZrDRuYF8BmHLWBBFBElrWAq3eV5ovTplNAabzWMtJ7
	QYVCamGZmNZoZzo1yMshoDTzlALl3Mb1hmJML1YQGMu4XTC0bLRIPWPxT6Zyib+g
	wgfbVc3N9BuetC/DkPjmZg2IkPZLXHvbZhml8eLnlplHTg==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d34psqtt2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 23:33:23 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 1E1BB802BA4;
	Mon, 23 Mar 2026 23:33:22 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 23 Mar 2026 11:33:21 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 23 Mar 2026 11:33:21 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 11:33:21 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmUCp3rkll5vi4n2idPurZn50ApJauHky3qoFVHvZG0d9r3MnsR20R7RT/W5vYBzdfkBoiZCrBxm7e+1MYNB0OFXjwoAnfcKoX1XRsYk2oAkg/sEgH2/qPNP81JT5EdxFo0DmRhSI5oLVKOdFLj0ydSEat8KfZdX9FPppdHfmUfrraAamuCSDM+rYOVCAyT6zzEMp7bcREhkNAFtQMbL+JjPTZuti+5I+cZbuNrqikjtjgL/dTB/VD6les4N6Q/iaeJGBhTKgGja3odJDO60WC+Nkm3/JEinqh8Cuwf2Zac7TopdAg/atLhNwuN2hRUEZ3nYRMG5H5y53GMusnijCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsW6IQNbM6auc/R2lo4wjyL6eLraOQ0ABwMeONJVl/0=;
 b=qKpFIxvub92a2SFmaeL7cYlru6cmNKx5ScSxlwKqbtJjWdv+r+hcZ0TNuIUmWbdxft6Yj2FUPJ+gqhqKL3XPetB1wB/QJkUbEkuaVdTAExJNn1C6087OyfSXz+TUX5x5UsGliuUeD79eWEQ1nwIe+dY0J+sp1lhf/esCxxg0RvT8+F8E8k48YnPIf4azJhEJ+CXdwVvX5Ii9TfLZCWTqqpycZGtAABGW+/a0DCEy5Q7IvHh+WfLw/z1ohRCrQ6FDuXp55WLxWwVJYKCRolMJ7zmx46pNQr17NKb2HwP0SrrU/wMmLoUofgnRw8ngfYiTVMBK9+Ebmo+eHve7JOpP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by CH3PR84MB3989.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:253::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 23:33:19 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 23:33:19 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "wenswang@yeah.net"
	<wenswang@yeah.net>,
        "chou.cosmo@gmail.com" <chou.cosmo@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v2 0/5] hwmon: (pmbus) Fix bugs in MPS MP2869, MP29502,
 MP2925, and MP9945 drivers
Thread-Topic: [PATCH v2 0/5] hwmon: (pmbus) Fix bugs in MPS MP2869, MP29502,
 MP2925, and MP9945 drivers
Thread-Index: AQHcux1uqC8alSQFB0aGwXV7Pr3dig==
Date: Mon, 23 Mar 2026 23:33:19 +0000
Message-ID: <20260323233244.201294-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|CH3PR84MB3989:EE_
x-ms-office365-filtering-correlation-id: 48657c58-95f3-48ea-ca57-08de893490fa
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: NUpQCbrNANyziG4NGGIsMwzc7+jjrsItQRRuOu/gjewIR1XilQ8EJnScANv+IiIOIr3TsYNim9R8lB8ls5nzkUHohBewa7rxJxnEp3NYeGrkKLyCPXLtLBt9XsgefGvvl8N+XVKEogK6w7BYRv5fI1zsU7S91IeCI4YZrPxUvmiDUkL506dMWyZXQ1gdnADpsYxEO5TozYPvxMaeENPfPf/7F9uSTmRMT2vqiSPkzMqQb0LfzBUlP5jIyN6P4UXDtTpIdOMvN+L4KiQtdfHNuOYgPkuzMClkNEFyraoJL046LLDcNDEa5TCOX0CL8zoPr5hnN9tQXtK0rDnpq6RpWWMprVxHlsSNFm2guJTN0clAGxYSQD1BNliUK6F9W1lMWs2i4hoCftgSsPXkM/njvKGEJvf7brAIE10PnUmL5fqQoVL9QmRMye383+DgAqj6ryVhflGmtYENj6IF41wSQJbsCcAGrU74I99uY5WnXfyQpEeGRQ1VjgKCS5dYiOB3GdqqhGO6izMcxSQ0QlclzHt7jHoE6zSt9HUxKCYD41JhYgLfAqs6dj+BdI78K50Uh3fwEIVP2r+CqviDB7N4DumpPHWdZGUYCmvBvVg+wUruPpSST1ZMgmNFoL9iUN21Ttv89DMpfFIVkkKet6EzxFqmQqU6rWM1MVeLpHvLF5irZil69BWQ48whwlAApyyFZK8Wwtp3iXQSK5u+MHtASm64axiRSO4QiLJ8oUOBkQGzNXg6QPBikHxOd+JQrc7GzdyGfNR9v+AFjmjEKMBuqcE3qK8aR3ZfTRrOR0KVPLU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BjmRbt+U3ahFZXYUJ+fpDHFQM45lnB+roTh72X/dzHMpBUzaD53g6dRp5J?=
 =?iso-8859-1?Q?6UBeJ/2RcK+/7KhrbKg2Ul2ObIVN/3OXbVPVwJeIISnwfZT5djTu1qPfBt?=
 =?iso-8859-1?Q?DQsjlFtS0kXRNyHjTQiYbP2brqBfqED6nckN5NDtrUewRpKK8kZGa6bJNr?=
 =?iso-8859-1?Q?ZmrVhONU2YjIDRlRlZDHU2Bq+iUU+mE8CCqB9n2eXNCH2Ao1u5jZ9JwPDj?=
 =?iso-8859-1?Q?wbqKWAayTuqfZRob01/y3z1EERhZ1P8CwDIowMKwZuBglhBYORrI7hsgmQ?=
 =?iso-8859-1?Q?pR3PbXDJU8S2Qbcbt884H49x1RdNggawLelr/bMOws4yGb5l9YA9UG368q?=
 =?iso-8859-1?Q?e3Arznb+2CAaob05jDmUAktQBWJGl6/353tvJP7u16bE3IyqA+LhR95+Hl?=
 =?iso-8859-1?Q?MyF7q4IRNNxmbL1CndRuHcuqOPU1DJwTOAxbPK5XcJ4MGT72tbR25bUeZ0?=
 =?iso-8859-1?Q?m9FRYSw1qNJ+PQ0j2jPek4jnxKExnyeLzNzApV+Ig0bNT7GSBZMapMLvxz?=
 =?iso-8859-1?Q?GRiY3gPcZg8LiE0tliiq72/bmOSeIsjlyEzCta2ZChkq4FIEBImZjVmwq5?=
 =?iso-8859-1?Q?BcH16lunHmQSemhe0cf9aXSGAFAAiKK7mjbQmEhyTZ/9r53A2g79FL31sU?=
 =?iso-8859-1?Q?BMX2bAOyesr63jc8iunhJU07FEPMcZvhe53RbGC39x0pU/SOwaAykUYi9r?=
 =?iso-8859-1?Q?gPdB1WPfnZyLqa6a5vJqRw5wJ0rxwz7Awc7XMXV44MPz1urtgjU96ADB31?=
 =?iso-8859-1?Q?FH/RFfGOOxnpBXPr8Hvm5ZNxEh/+QHAW8qgpkgW1eczxeLuW6hew75pTL3?=
 =?iso-8859-1?Q?NKA9V7tqpcIobIQuyuwXWhAwkp/y/5ig6Qj0pbYC4bMOhEp9FMQkCShLvh?=
 =?iso-8859-1?Q?rRDA4+geVzYb+iiz8laGhLaavGo/ETFV3SlN0pBI52ev+p4TcV7g/u+t64?=
 =?iso-8859-1?Q?W3bSMUMnG5N4oc/+1i7AVYPafOAd1jLPzbr5pcBhKJ54DucZE+9PQtoKEY?=
 =?iso-8859-1?Q?DOMLT0x5S6KzhAGR58K56tT0ZrzHTnDqHl3f/ia690VhJdCSaY2Qv1lgbV?=
 =?iso-8859-1?Q?gfPo2DreXwuQzbijValLEvqkTSzxxD+pP9BdWOKHFSyyL8Hi97qO9DoMRW?=
 =?iso-8859-1?Q?TW59c1DbLELy8XsxaD34RWJ6kcfEz9bxGJGjEBLrAxClS6ITEj42veBKel?=
 =?iso-8859-1?Q?H3V1O1OfDi1gLgOFKkXFXs5HlFRUjtHC+pw6WL7sQOc+1KGHkNTUs+ap8n?=
 =?iso-8859-1?Q?EmxWpu6kqtGSl/n/tyRl5Wzjriz6ICnuqvyVo0woAiDtwG/ryrwCm7n1FH?=
 =?iso-8859-1?Q?2+70y0LEabldaWY6JsDvvMOwda6HgEX0zIzCsqOFSvUY7UVnOY6YP1syvN?=
 =?iso-8859-1?Q?7ZBHMvwaVhRPCPACzDTqdZQ67cJuSzN+Tce5ioBv0XCnKBGR+ZMajm41sI?=
 =?iso-8859-1?Q?EJwYNkMUMPTbcvIYdE7AtAACB3swkvjGVmKZ6O44q14AgYp6b3cWBM9hn3?=
 =?iso-8859-1?Q?h1p6CFeLq/gJOkkCdRkwlPm1pDSNdA8pZOPuP4PJxmrgmakLmKFi/5/Ryw?=
 =?iso-8859-1?Q?mPfr6KgLE++H66rhM8pO40LE8IaRSrqFIZNH/mVguI/V30cqN3c8J3Zu04?=
 =?iso-8859-1?Q?brga5Cejbaq+ZlPCTZcju78pDY2ujjqT81UXwWVA0YkZ8peIEQtVm4TNhL?=
 =?iso-8859-1?Q?zW1xsFIIts1IkhR1jO6WJcBpaWv1amadRgCKGTsR/+1B06qJTTJOqUs9Hi?=
 =?iso-8859-1?Q?Nl+kHnBBeIC37EVQyVnjrzO32bq1/aMz+kuGgUezGr0jzQCDW6QqYxBSsp?=
 =?iso-8859-1?Q?RkR/aP3Teg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sRLLPNW6SWMg/Blo+uR8/Gty0dHMvif6RhySRJWEB7fEOW2Hu3yUxt/fDW+nlQ+i6cZXJOn+KIKaBzVPBpmD7G4fPaZ65UM3vnWM76EqRNHfEKikCsESp9QnjCFnaGgF0U6Uxixa3swYVK5Wvz2JbE3T3YKYsptfPlUtMJSr3z/lAUnvMPoymyz/4X/FSJl1Fks5uxhrD/r16m+VyEDFTioHaSebQuXeSlC9eaccfC6hO80ePZoEh3BVAYvjfp2xJ4W7tcBkOLnsyckv25KVOZABUA2nBA85H1xjRbILGmndfx20pAYP448pid7ZuvVLrFPfzZh8FPkxBfROHEcRIQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 48657c58-95f3-48ea-ca57-08de893490fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 23:33:19.6496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MxbZ8OPLDBbrSY0REPRNfxei0Dxr66RrUrUorhscEvX98pJT289XphInaF9a9imjiazRNoaCVQ5tH7AK+XCcXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR84MB3989
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: 1thhcVZ7bicOAklNLwylvNa0qdips-NE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MyBTYWx0ZWRfX+y46fEy1WuuP
 ftPCmSCCbHhaiQo+de2IMEu4mVQlM35XkEyI0PtxdNIiAwUo8UUxrZEZyd5I8RI2LVjQciEfGE5
 2RuLC/4KeCHvX3W0IcD3OTVahaBEyikihm/KrYgqI6KmOP9J1LlT5sbInAz2rF0gpEx8M+Brw3h
 Ido6Vzregoi+QYak3p89/0fLlPYvIfcdVK+IuPA9IoRU6rMSDJ1n4CJjkJn0lAMA3+dB++bLzUX
 vYW47diBFZL5J8vwNJ6bS1r0sDQsGlflqgBsO8linGup4vj3i8ekdHExtQ7jMKr/ECraZVU7N2F
 oEeVQAt4M3snaBMHt7vR4ncdCOPIZw5vTIm22DsIsEbUsRWsBF8HycfzXNGxbtV/S+MaebnbHz9
 CqzafZcxOl1LGOF6uQWILoDob23qeJkZXplErb/oBuHWi89nPKLsooxDBd3HObQDSUdpAtRrplH
 3kfxKxYnWSo0vbTbn0w==
X-Proofpoint-GUID: 1thhcVZ7bicOAklNLwylvNa0qdips-NE
X-Authority-Analysis: v=2.4 cv=ELYLElZC c=1 sm=1 tr=0 ts=69c1cdc3 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22
 a=OUXY8nFuAAAA:8 a=2mk5uhB5GJFkJaPD_D8A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230173

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series fixes several bugs in the MPS PMBus drivers (mp2869,=0A=
mp29502, mp2925, mp9945) recently added to hwmon-next.=0A=
=0A=
Patch 1 fixes the default return value in read_word_data/write_word_data=0A=
callbacks. These callbacks return -EINVAL for unhandled registers, but=0A=
the PMBus core interprets any negative value other than -ENODATA as=0A=
"register does not exist", silently hiding valid standard PMBus=0A=
registers. Affects mp2869, mp29502, and mp2925. =0A=
=0A=
Note: While I do not have physical access to every variant in this series,=
=0A=
the safety justification for the -ENODATA fallback is based on the PMBus =
=0A=
interface of these MPS families and the existing driver constraints=0A=
(func[] flags).=0A=
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
v2:=0A=
- Patch 1: Folded explicit per-register -ENODATA cases into the=0A=
  default case per review feedback. Added paragraph explaining why=0A=
  returning -ENODATA is safe for these chips.=0A=
- Patches 2-5: No changes.=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
