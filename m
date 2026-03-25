Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEC1318BA6;
	Wed, 25 Mar 2026 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465559; cv=fail; b=QUa9QKTgQbYPjyYTmK/5BhagKX5GX2qVVRNvTJ/e1cS++gkFBJsUhGSECJjiE904WzhTEFv8rKjHZMuXMXMD6FBKhGfHadl6zIZAvngZSMb8UyGvZK3KqTi/uBBGCc88IjEvnE+myC79JGzDUzXAZOIxq7e1pIqHvDVoaAjlS04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465559; c=relaxed/simple;
	bh=b6FaTzU+sfPnMaWjOhYCy/5NrJ2N+lc0jpQTqBgR8O0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YNNfmEKNt1gHa6kOAqBpgUzPJzC9zdn5LbS1Bk+0ETZdeQIFc8vMEH5DqEos6jA2yawLQ3BZ2nqIAMDGBhUiTsREiyhrve7Tm5+O0ewRwBbnAUbFMRp2o9YlMpKkZEgQxn16n/qlESWMjjWjhe7UKe3tqWl5htwesPBpVnTbo4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=FmmpnHIn; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="FmmpnHIn"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PJ2i2Y3586671;
	Wed, 25 Mar 2026 19:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=b6
	FaTzU+sfPnMaWjOhYCy/5NrJ2N+lc0jpQTqBgR8O0=; b=FmmpnHIn7xPq2rxc6E
	IrZ+l15N+oNtAp9HvhH43bZdJzeqiEPP65blfN/n+wwgVIcO53J5QoaMua8zr8Qq
	4aQyzyKAArAXJ88xakCjPdyg/xqswlk3AKOQTjkeVSs602kLT2FOV6V8XaBdKpO/
	d8ny6BY2eDFAXMR6K7vscXhIdP+sRA0V+0PzPjlTqi5xOrbEOykeCQiiTlPPQgQ7
	OaCOB5E/47RWue+7fFdPhH/EGfQ7uG53Iq627t5CPI2QEdudhPERWbTMeRXbqIun
	5vF5ONeY2nXQBamK41yUbC1nWfy6EY+G1HeOrNsf4oQKRc5aB+eNGabix+wmEguE
	uCaw==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d4hsvkamp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 19:05:36 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id D94E1802BAC;
	Wed, 25 Mar 2026 19:05:35 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 25 Mar 2026 07:05:22 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 25 Mar 2026 07:05:22 -1200
Received: from BL2PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Mar
 2026 07:05:18 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ll/H2P+XexWKlUr8RsFX8G9Elkf3yuyhrkLVTahrwoC+CwFYIeIX2uUwtPTZxEOnBHePUgEO1eb6Zhgy+F1nVmeBZGS3mE3AG7+NK57/ta1ou+aG0Os8Xv4fMjhqa2ldjLeupHi1bfXz0AUgroPuFSOVjf3Zd+NPaJ7KCURsOcvx/tDx92TG4tirENLxPo9oxVfgnZilSRry2/wu99hOJUH6Kl0lZoUJ6uZEvnz42LOWvynBfp2u/C/a3RPoQkAuaJ0NByox9/zuBeQE/KKzK4tqpggdyohKVcRFZoZ2Wcy9IBHOn77AV/Vbjf13l7Lk7vm6obp3p6Y0CLH7t+5jEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6FaTzU+sfPnMaWjOhYCy/5NrJ2N+lc0jpQTqBgR8O0=;
 b=fJwynDArn8fnnIwbLCM3z+/4YvDto9szNKykGfUNvEUvot01eEgw82DRNFW2ZjiMYMOIE3H8xz2+YdzLwa3Sm8JMH4dg7AA0pO9D5tG3OgF4VkIPM5b4Hw6No/kFAydPgWlIjY484GAOTa8LaI8qNALUmcbaLHRBbewDuHxTHLhgcPkL+ADQyF653qSdvyadRti8nUV0AVjov79vjcYCCoK0pkerdI6phx+XlzBJfwxSWQJDQuGqzljeoSsTqcn4E3uY8QmzcvklgaeNkjB+luO1UbYg4hhuyML4+cnWS7CKAF/v+Fyyp1Y1XVRNFrPFn2GcbixddPaT+6PqUjKXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW5PR84MB1793.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:05:16 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 19:05:16 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Protect regulator operations with
 mutex
Thread-Topic: [PATCH 3/5] hwmon: (pmbus/core) Protect regulator operations
 with mutex
Thread-Index: AQHcvIOb/2RtsmzYyUeXV1YK91XvR7W/m4kA
Date: Wed, 25 Mar 2026 19:05:16 +0000
Message-ID: <20260325190502.109001-1-sanman.pradhan@hpe.com>
References: <20260325181631.17259-4-linux@roeck-us.net>
In-Reply-To: <20260325181631.17259-4-linux@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW5PR84MB1793:EE_
x-ms-office365-filtering-correlation-id: a0c7a13b-dd57-4d93-37a5-08de8aa17378
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: Sl+x4mckuAFwnAsjrjsqgbWqjs1hcQKpb1hOL3O0i8dborHEVKtEXVcowayfyso7v1ZCMTna6NxnTdmOWDYwDQJU3dMy0qY5tVRWwu9nGsAgYLXsMdvC2ciS2eyjKnj2WEUopGiHS/p6guIuxI8meGE9Xsi4cwHbdzo2E4hQK6OaHUvannvP27YU6drD+o2EeC27R3OhtyHRGs4CuCQ+jnXI2l7b3npqRUTa7FrUjbdB4K/jPmvjj4LMp1i6mC3VhzuJ4FNYdHZX8dFlTZa3xwry3VYYsMpImRlh2vVUSF2SFDv9uKJS559dm5kLNoGelSTKixCHJA8QBYPnhXEowFlPFjkcvk5FyBgU4c5I63h/omkVj8NzqZxwOiN1x7nHypRlv1HCtuY2vyMak7SLojoVkQLaFkT6gyZlPYEVCKADKIhXAy9RohWCibUROq3s6a59bcNmEoQL2wkVIKz0fb/BS8tMw4xHDj8rnvF/SY824Pnu/VfLlrtbLTagImm4EhnjvOt0J+cLk8p+3TXqr61tMMRcH6FoFMqEfbTVSvrZzQ2qrZTjcPd6fXkHmFcd/mGcab5k9KMuszoaaQP17J0TTy4Cwfr469duqKZc2d63Z0XV77svhzqBupOjd4WKI+naZ0FJrlsVhj+0ZEoGae3IVNbkXy106hor0uHhl27OPoU4zuZD54FzVn/tcZbM/GW+GxpaSqRDqHDG61bZgfmiVdJch2oSOMUa5btjb0kbyRe9jFsh27rAbm/xxyYPxGuPu7I2pFBcZHgYvy7UBg5j4OsCwYWDzJEh/RTI5LA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uLJ2lzO7mq6A6m/Judhih8yiMGGMUwY8CuBxR0Fbm+lMfiXXzMF+KlTF1R?=
 =?iso-8859-1?Q?bFbTtkTrQkC4bW9Ro30tjJegdkKeiyYIFhksvapBvtuXLuN5OI4P0EfYNj?=
 =?iso-8859-1?Q?J+HI5ciHH+p0YaN67wW5GkXFKiZi6qACje0zH+CDL5L3hVOC709fmKB58f?=
 =?iso-8859-1?Q?YrGiRokni9q2r0qouVGZz+3vX1KgGz7QHc+x5MmJkYPu0029VT66ThQ5Bq?=
 =?iso-8859-1?Q?OOgrYVkRLbKUlK1vQ2TxoUMLd0d0vg7C2d4dgrO2hYhh7u5ErccT+xrU6+?=
 =?iso-8859-1?Q?vzgrnQsUkfunuL+X1oq1vHe+bpqN6r9G1FEPz+cxikpNeenYs3HP8tbQpi?=
 =?iso-8859-1?Q?9zpbNF4gQY/KuB87Fk5o02W+RRihuY5kdy70dhQJRpbcdHEAELBE//MOeM?=
 =?iso-8859-1?Q?YWCNPpb+vVHdGZ/YlMuQDwwpOBTO30/dXUkRK+aca0cUgQ5O0d37zL3r+e?=
 =?iso-8859-1?Q?pqSJTQ/lv7twYmIelQiwzBDqr4oMGUBisaxPbCbgZkWFX/TNTPXERJg86b?=
 =?iso-8859-1?Q?yKD+SFHWmpPzKzGQ2m0FYzBIHK5uJkGJM7CdFvDGKgBU35dS7Wp4qahYS+?=
 =?iso-8859-1?Q?z8nMytjEQj4viB2e5PWXPunt1n6rauOXsBDIcwcFV77wkEW5SunlFEh+pw?=
 =?iso-8859-1?Q?qpB8rEHZHtYbhHpmqdF7a3XnrbcD0ewdthYHT3GIdO/1TGcUwOWjdoM4Yq?=
 =?iso-8859-1?Q?kaIrxk8COTh9i8jBvXdazq8mJN4jn1sSEYiJWzNA7QSnvLiTuWDjXZUgxs?=
 =?iso-8859-1?Q?GusC/jHV73OEojWO5/5lslqh9fj1OyzFe29XKthQm8ljDLF+HBEww9sH/Z?=
 =?iso-8859-1?Q?Agxs+a3cEnpOFqdEqtFm9upCMSbBwo0snrthLmUxU/KcD2GgAYTHPZLTGP?=
 =?iso-8859-1?Q?SrEUg7l2zgiPe3IGQBf1NDPcdNlkQk1s0ARHrHvIUHL07krdjEw/3h502g?=
 =?iso-8859-1?Q?ylUDyBPlAsEeZbS18b0adYELy2dyPJcW9pyAAjFZ5lDFrDtvc18/oG8Ju5?=
 =?iso-8859-1?Q?ZkBRragc7ljx4jeuVjVpve3UXXS9EtEQs0269zjelhTFjgjiYKppGiKyPq?=
 =?iso-8859-1?Q?VJ+shWREES1Sdl4rFYcLtZNb2G0lJ3+2jIEeyAxwEzgOeontnpHNBkmCp0?=
 =?iso-8859-1?Q?jOIQmxD2BbATbHLAYvq+vF6kKY5yylMXmulGaHhnvRa3QosZaegDwy2G9C?=
 =?iso-8859-1?Q?95NyWtEZLg8N+3Cx4XBUhM+py9OpPfq8en4I4C3/LQ46ZgW+oYuMLI5taU?=
 =?iso-8859-1?Q?2TzKcHcuanAhdrMLwCvhHo2fgN1YBrUInvqppnkA4d8wF+z+MzoZND695p?=
 =?iso-8859-1?Q?sSteMZbx9eRYMtqDOFHPKmyyPFfX1U+hy3xtTuj5HvLmWCRBSajpsmd7vj?=
 =?iso-8859-1?Q?zm00781ufmTJQMNYksVOybSRVvjiF4cO6jAxxPLR+5A0VjvHBtXhcxPS0S?=
 =?iso-8859-1?Q?OePXpudgfUHCSKmOf8V17WWHoQz03lrEX8idrB6mqGG1wekOAoVMwhd1xM?=
 =?iso-8859-1?Q?rxsLOG20M61sMi8sINjoqgIG8X0jex3amkI8mrSgn3dcH9b+m2LCJRpE+P?=
 =?iso-8859-1?Q?bI+JpBXMHqKeV7coSd4IVnzrjWe1KgjP9HJXA3hc09OeUZVGcUokML2yWu?=
 =?iso-8859-1?Q?HxO7eNcGomDg0AqobGcAxbREEs/es9Ye0jMYSDlCT1Uu+N2UTPDTjmK384?=
 =?iso-8859-1?Q?817L418XWvYeCHondXSIhjw8ccm7IWuP6ywNHzJCL2No+41K1gEF7yEJR/?=
 =?iso-8859-1?Q?BbiVmaa1YiiXcpI/4S0KKd9HChOJ1Li1nEmug96t/rxcrrffMpykFbGJzx?=
 =?iso-8859-1?Q?qo2yYb/lWg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q6qCTEmrjEfKrmV0C03q+yQmQHEAhUR/dAPM7tf/n4DyKCKH3P2Uqrghm/VdH/LxI4+xHkIJ/igAJVxGJv0/aOhULlaMFZ/no1vYq61xEpSGkmUMZLrMizRruOZD12S7OegagO4fTs/nkmFT7lHT/oxm9tT1JZP+4AgAsDiMBkjr++am2UPTWAk8ovmM+/uQhz2wp23zrrrxi6a2X3kvrtKC3ay0Dp8kslo2xqPP/WDNdqAY1nGN8/b+IvjNzm1ahJzQJeoJ6O5na4rUpvPOsphLQPXU3istpi9C4AeyMwMcuknLiLTXwiXwAFM11cosxlwxoAcBU/d7ELHHMMXfdQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c7a13b-dd57-4d93-37a5-08de8aa17378
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 19:05:16.4303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 38LFKFUsSZH1DbQZWlOn9G5hT0apYnu2t46GGg4YMGl1nOVVdXr5xSVEDKqf2Lf9HIuiJXn7/LmvxVIZa1AWoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1793
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=UZBciaSN c=1 sm=1 tr=0 ts=69c43200 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=OUXY8nFuAAAA:8 a=CZNRzCG6HDbw7n875mwA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: 1rgufMZY8yZ7Q4tWEb8fEIQdc_U_tHMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzOSBTYWx0ZWRfXyY8PkoyoJwlW
 MS1lbX5bvWcc2bKBLGNigd7TZtuVLPr8Ymt3vA7tWxnvBHoegtNadjLCCDlCvOaKyUxMRygPdPD
 4sbZ49Dt2T1IXyq3xUy1jbQMoTXZ1MqgJvlW5dAykvP56hiAwKtCQhxm9Gr56OKUCRiHZnVyulY
 Q5dhOF1uS4cPo+WPQ+SmF7kI88n0nzMN1AzuWQ4uEJPLxUwBL/1Ja/9XKndTSGuJRcHMR7qCsnl
 1g46dFKVTwQUM6DI/E3raLcpBqFw3tpNWwRb1FXFtclNowKMp7lJkiSu6rvknqm+Cp7fovstJp/
 CsAPYVSGknhzqb9VqCD+jh8fS+NedxkOl7Gl3YtBD/XxPd504DnKB8YcN8j3fiWJb+ivDoSQxBG
 jXmUCithPtdU8AucHyhPzfcnEclsgR5SvhrlerYPgfqj0osy5Q0Q2NrDbbaMokPA9SKeEOD75Sg
 L03PSDGIu7Zdq9FFyXA==
X-Proofpoint-ORIG-GUID: 1rgufMZY8yZ7Q4tWEb8fEIQdc_U_tHMj
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250139

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Reviewed the series.=0A=
=0A=
Very minor hardening thought: the notifier worker is=0A=
initialized after the devm_regulator_register() loop.=0A=
=0A=
The current probe ordering makes that fine, so I don't=0A=
think this is a bug, but would it be cleaner to initialize=0A=
the notifier state a bit earlier just to keep that=0A=
setup self-contained?=0A=
=0A=
Don't see any blocking issues in the rest of the series.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
