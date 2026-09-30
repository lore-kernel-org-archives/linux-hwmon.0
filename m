Received: from relay-r14-hz12.hornetsecurity.com (relay-r14-hz12.hornetsecurity.com [94.100.138.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE8F49B5C7
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 23:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=94.100.138.214
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810945; cv=fail; b=hf1lWfsZed3oD3IauzKHxmj8ybNI+v7KRtygC2Ppq+tbBuaP+iQZUARvKEFf8Eco8ChsHAFHDqtN5BuYzjjMlaBCbWmhT3L8b6O8fguOaAZUu2N7nq5f276I+yyH/YMqoXfioci4/FQoutpFCgvfNtzd86AqDTrGiaYMAyiSAuQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810945; c=relaxed/simple;
	bh=e1fHqjCFO8yo6gJj/uBriTvUhW82PaEwdBIk9ho9Z6k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QvU3K6q0+CyMllQvZK3EJ1w317mAefMRppN8+y8Tcl8aB9NTRpbiwvNj8Er/4KrvBvPb8ceHxK6/WKJVUz6Bw3mn+jDaaVLGj1+yLUw+G2v+X/bXVjJ/6wcOlWirJeIrvJ1QhQyupq91WbfUpQHiNu2Mo2zCC3oboD8NNGDXxU8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=witekio.com; spf=pass smtp.mailfrom=witekio.com; dkim=pass (2048-bit key) header.d=witekio.com header.i=@witekio.com header.b=KaszvwC1; arc=fail smtp.client-ip=94.100.138.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=witekio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=witekio.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=witekio.com header.i=@witekio.com header.b="KaszvwC1"
ARC-Authentication-Results: i=2; mx-gate67-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.109, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qPCVbx0EE8MnE1uUqRT46QH9bLXjbEVMHIidSIgJDKg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1790810898;
 b=S0RANEQ6pvgAS0XCilq68P/ON2eXaWqUUkZ5XODE5VvxU9cPxKdmAvqoJ4YYItYj62CmCfSk
 4XK9zJ0VpCrfkzy8gj6fnNcecBSoafixBsGmogAJTWu6FHVAXlxdCufs3HjxZj+dZI4bsMGjiNL
 4u7njPHRWSZEienljnFFLhuLuRl72viDCtkZMBNGgnHK+ltsyfTmCFZCcGmVvxZx1gau4IOIaz2
 BkLayOXVFHsJ04JiOGKfxFfWuna3FeZZi2rLzMLfwFhaerfXYCINqieI0aL80gKqiKOVP4RSdE5
 c5JUudiRGZYrasdPK/hh20vh82QYQNTJpGBIox+e2LDRQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1790810898;
 b=DyJDoo8zQsuzMNMK8+cKQQnwQPOCySDiV3UVVrJQdfWsrdghAZZt69EWIh1x/G8tPgLXw8Br
 9szx4lVr3gNxwIbOp+pPnZrUXBp3N8WKoFLJPfvlIrs7a+ct6D4TxcD6SfG/9GQ+RM06FY72cd3
 mv81/p0/nBhS1EDHX5RtXGPvq+6JraqZriz8ndxnZ7ZPxDLby6paJCekgDtKqlR2EkdKShbMJve
 2YbAhLSrSLhP7m5/BkV2SJUd8BVIOT4cWY2gfp2YG3Q5f2Ml8G50MJosBbiOu21IPYJYahWS4sU
 PsY30hs+gqw1P6xFP3DhN8bSAfWMqGF4vj34Wdi+MqqAA==
Received: from mail-norwayeastazon11023109.outbound.protection.outlook.com ([40.107.159.109]) by mx-gate67-hz12.hornetsecurity.com;
 Thu, 01 Oct 2026 01:28:18 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1xI4P1CZBmqwyl3LSFiGy04yY+gSTWiu9zsuq1Wg6wRKoVCnARuxRtvy6kcJD4L2oQX6Y5Cx29LRl6+8P31Dn75kDb21JrOK0Cj5JVvwEa6QYtS3uWINYmEYPq/pYcNLVFoNaSlrRGiXP8AbvR0F2HhcEwD5HBRmTW1mEDoqi7+S3QtfFlRhnQv5+TT9SQtAVLGyW0zUij/RqpeQ7x4/NVyj4lqqHtZJdxghcg0DBeL7CnJ+3vr0m+uXmsXUbsZqeOppyTzTpUOAD27AG5/Lvk7eRS8B+9ABdVPDcDMQwMFRmCO/gGlnzgxRQBORDpPSBmV/24ujgZFk28xvjeP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPCVbx0EE8MnE1uUqRT46QH9bLXjbEVMHIidSIgJDKg=;
 b=IcFxad77nhWkdAAHX7FpbDIaGQtPUP55QsNVPrTw+DPos31Yexh0DduBsmKQFQgyUPrUBt1Y9maGFiI1TifsjzqKgjcSrqIPcRv0kb/zKYkJpUo00F1uIeqlGQCwfuEhT6Zi9avJXBIehZKM7m6sE2069u5qktiLsXw0yWrPyJ9jBUWY+LPx/mzYp/Z8SvZj1412BVziJn6d4nvVREzT3cbJGXJQTcU6Ye5bsoufXt49os4LvyTg/lp+lXBfU7XuyfjYg6ycOFtDLlvURsAwjMKOTSGnFA52Nx5Gtu6qIXbZWWIAco5eZzCMnCv8ZoIzE3dfY68dM4jpv4TWulZWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPCVbx0EE8MnE1uUqRT46QH9bLXjbEVMHIidSIgJDKg=;
 b=KaszvwC1a8Xmh5l8CxG5jUgho9zlJdmi3XoXwa8L4VD95ugNMViZNUUlyXiljHD2ZLqHFGDuC9kA1WbMuaaQy74QODQrX9tbBTGimcR2YA9xFj43ZbdKyYAqBhtdGVkhev2OJSWCUW/L9TUbxhpbTfsD1swTTEyhytpXZvhnecgK6GLDi43OoF4HqoAIBSgxtEBMj4vnJ3xAvVJwGs8s+x064V1mZVQVSlFiP1A4M+IfhINAZYkcGkpawUQiegFa3bEXEutvcwqmfQLxdjnZfcqB+rEujRNA+uaS4Di/fz5LAVr3AQawlgcxPaGLmA/I6BTsUTi5oeko0Qm4OHffPg==
Received: from AM7P192MB0785.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:172::18)
 by VE1P192MB0575.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:14b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 23:28:08 +0000
Received: from AM7P192MB0785.EURP192.PROD.OUTLOOK.COM
 ([fe80::71c1:8961:df69:a8db]) by AM7P192MB0785.EURP192.PROD.OUTLOOK.COM
 ([fe80::71c1:8961:df69:a8db%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 23:28:08 +0000
From: Luna HART <lhart.opensource@witekio.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add TI
 TPS389004/TPS389006/TPS389008
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: Add TI
 TPS389004/TPS389006/TPS389008
Thread-Index: AQHdUGcbdG2Wd1jI7Uilmn7uIVYgRLbmMLYAgAGPZ4Y=
Date: Wed, 30 Sep 2026 23:28:08 +0000
Message-ID:
 <AM7P192MB07852B4444A165F85EE74B14B48B2@AM7P192MB0785.EURP192.PROD.OUTLOOK.COM>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-1-7045c5894152@witekio.com>
 <20260929231757.5B97D1F000FF@smtp.kernel.org>
In-Reply-To: <20260929231757.5B97D1F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P192MB0785:EE_|VE1P192MB0575:EE_
x-ms-office365-filtering-correlation-id: 5f9471a4-87e8-4d39-6d8e-08df1f4a7c4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|20052099010|13003099007|38070700021|3023799007|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 3Jx4WwoiN3DZtX4nWhcZ0BJHwv9QzgXthjXudllx05UlQfiXEW48TGkoej3gHfD49kCEHIHaywBfUTgoNJ7dCp3FbrrP0tISCh6lmYQjf3Pn9q5AvuW/ck3jEkJqUOeO2ebpI/E4N+QiR52kTxgZWunCliyB/em8YvFWh+JgeMdBusrh4btHryuSL9FlCI70EpcLH7rIEAWiAxpxZczDBsu9/CR9bYkIDCqwF5uxVzgxtPl1NGtQtOmwgUbbFM3kD6pSsn9zEVdCHIhYjdt5rQHF8x8IBVxfqogZnAqi00WFDU1REmbfdzAGbKsuuKebjDL+fT0EPW4DCsLqsWvbJAWtrefTc7LnkbNHLXHRMXx9mL66HeSp/MxraycW1TWpuOY90ry879haGrNMg4956ndlRxoGjtvWq8UpIHsbtERQfx9JiGccERb0TMXnOVA+/mDvg1W1byLcpajW+87ZlRtSvZ3XWj8WLonAetAA18NntP79NvkIb7QcZbJQJV3pU2d5ZZzkhPJBBls7j/KppGAsmmxCT5tu29gRWp64pQHmAFCFO+bDnPrRpS9gvhhd5R08gngaL2TbNAlYIu02Pes8LgGhiW+8DyMTr0E3sbKYnMimw4YUsHqG3i8XmGUlzXC2g2VlAP8Lp0O3uLrqDDxLiBZMyLUTNXd/ibaavbU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0785.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(20052099010)(13003099007)(38070700021)(3023799007)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FcKvg5LDu6M9ZgLhKIaPLORes+p+EVeDQSBUuogC7Gz/xAVHv0K4kFRZ4X?=
 =?iso-8859-1?Q?RzJBv0Fn1zcoNBg8tbPBuy3m9uEE9Yd3pxUbjyOqGBWDPb9+YRalER4gdg?=
 =?iso-8859-1?Q?CecqRrNhw4H1r6kPafgG1ZVnMhlP4DxFg1cFwdv6nFwtsvE/wYEaltH357?=
 =?iso-8859-1?Q?2t862jdVhXwyx5NCX4IWS/lpwK0cF9xeFBoifru/1vtzwm5E3uKl7WhOGQ?=
 =?iso-8859-1?Q?F+ZNFTYtAtMSTVmtWr3JY+h7j/PQXG4XTquy2FOZDDLrSXxrUKGt+csui5?=
 =?iso-8859-1?Q?6ItWlbjEdx05EOfNB3NTzoFR9bqzhTfBXFdPHgQVr10kVJHRhv/F3oTCU8?=
 =?iso-8859-1?Q?zgSFkJT75T+bpEWMlv65IuDNqMqF7Ikqfzm0Z2Na5Vjztu2N7tLhnRdB+S?=
 =?iso-8859-1?Q?hPD5pytUDIyoE260xVFvogP9PYgoDhBkyu2o7EDeIPZdP3gY7VJN4YlC1T?=
 =?iso-8859-1?Q?vCihYc6pbjH+CTXmGgGnLkgtmDUPpWw6PZfkN5ExU3y7J8UB8J61jJ4yEa?=
 =?iso-8859-1?Q?C88wPyLc50JGJCIjoM1YbaUBdTamleXc99ZBdnQwyT5c3kQT9lYXG+CbfT?=
 =?iso-8859-1?Q?aGJ6qyVTJuS0ZCKHbKqr8qnm7PvNW4mQC7gdROUkPm45EvJYOayaakyJ7H?=
 =?iso-8859-1?Q?2P/kwqh4xcXsh2iqZfxNruMmzYFUiYsK5PE4JM91T5agcO2nxnti3n6ObH?=
 =?iso-8859-1?Q?mVImZvPzcc7OAGDirtglfQNX+opLWHJe8RG75mZzAB+2xJSYynJrGQoH79?=
 =?iso-8859-1?Q?uzik4B68f+lbLQOUNmZ6VtZmdfaFTb5AwgTeteYLC+WgGROU0RCJLObl/Q?=
 =?iso-8859-1?Q?9fUZ0CexZLoV0WD+w0uNgqANPqCBMb5e7y6Dw0byt5eT2OyDOoGnnhnAZA?=
 =?iso-8859-1?Q?543cHd9rQC/I0XlrhSktAT+ctcl7beYav57MCa0liEtR+/b7GqGYx8gpGQ?=
 =?iso-8859-1?Q?CipKQhLeu5WOKc3KqgIuDJoNZMjthWn5XqnAFpB7AQ22vBz8AFGOpIdqFX?=
 =?iso-8859-1?Q?N+E3wwNriWK7x9ISwIWqS9VUndA2fE3UssWo5I6537t7sTfX0suUjeBEwP?=
 =?iso-8859-1?Q?fvsxuypc6ezx0AQIYsIJ3uv8P+q4dt21+WP1Zag3Sk5X42zBeo/qsW1TIK?=
 =?iso-8859-1?Q?/vcF56Vu3J8Jaiz1GpBkyQpt94FW/nIvKakJb/igd+nSYWRd4YSDw47fe3?=
 =?iso-8859-1?Q?5jC7+mfsaPBrp+vJBvdZS7fRxfWOOqlkbj2d7hlsckNIVDGui8MzdDgssx?=
 =?iso-8859-1?Q?BXldLdG1+p5xT0RRr00kQa8l0HmrSMJWpo73Huxxb83N7oN/idamtnh7mv?=
 =?iso-8859-1?Q?vqVZ7EQbZ8Vsbbc6dnnI0fvJqPLKqA1C+KntEkbEV4Qzp3GvnlORC2AlwA?=
 =?iso-8859-1?Q?R1nX6axmA4d2opE0u7MXTSnLXwkMpL/i1MNLfirdIl+gZ8UElL7nJEmqmZ?=
 =?iso-8859-1?Q?mkBWnFpATGLoVMK6cI4P93FfbyF8VJxhXVtAk29fHSdaTrSsDrTmbgKeNC?=
 =?iso-8859-1?Q?BTQrJlC7nFYlTLoKUp1pskXUy+dSUfNqPhqmgzrAUHbD1Hh9KaxcJ8igha?=
 =?iso-8859-1?Q?Pd8hUGdjhAE8rD73ljL46Ar4bnl/erMlR406448lbr5kqoYNOJP6Yb7eW4?=
 =?iso-8859-1?Q?a20Bi/eB3nJxdUZxvW9hROIJjm6KcJyp8axZBCJy+Q+5LCcIFYS1NwaVoU?=
 =?iso-8859-1?Q?PUh42ligLDy26aCbIv6joWxuTJDc73MgWb18qyeZ+6H6p+4FpCINFm9cSf?=
 =?iso-8859-1?Q?JpzLbg1nPfvYJ4xFp/KLFFRsqPGdaRYnYlCyFc5n+fsfV7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Bq63kCyko+iqdXCvnL2WXz/+Ecv7stTwA+tNj4bLW2SKC9iZnj+2r336Ui9Dvaqav3nTDrGN9DIrvx3WLlW9fU0vc0KeO434UODD7Rqe26XHVzGIwN0mvL8yLNL/sWlxkyG8sKBKeAzSgd1GUuqNKYohlt8KCUIK/a53uZVF33oVZ5CqybUCVEFrGstGY+P57tsbQ+5WnW6jkDVVyfn9bGZEd9lzfPOGy67AtJzytMQyh/7EQGQZalRbVReMz2DBtXFLuHRJatB4Fh8l5J90xoLCMN9KC+rpXLx2o7T4hfxPeYyI1KWE818a700I7lZjQXsYW4t6iTu8swBMB88WIg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i/BZnSLTcLbgBFtIpxeLC0jjIW8sK3lLZHbX56Nfhi5No3jwZ5FRuwq+jp64oK4UV60HCroOCkP/sAhb6Jc6M6ZF6UcXq1fEnKBHmrBckueYqLC0cgug0Yz5bPud/deibGVitU0Xolx1Gp16fg1RD11n8fMf9av9ZLnwUb2+XsgI0ufBsexQwHwFIRarZXpQcBN7B5js3EqvnrC8wyvbIYcbxoZQwRHlmqxTnrbc8wzlnVxP8J5lI3gnu8EY0t+zw93cIhLYGhcQ5raj5Ce5RlS62xRjjzu4sLm1gh3Rws31/7hs/PyQvLgIjKIS9I/q04i7VWJh7L6NCEOphuhCgrtqkX573egApUOLa5UD7zjGYlFwCAcXf/zoOEDCuVbez/WPdsZX6zhlghECn2A2NqjK3dROuDuODewd18vHrw4B4rnDEhUpGfH+8iCWL7fOhBwOmKG/KR/Ipc20lmqGD8jZ2oga74+TBloflPhVjwJvxkzRICeU+HCj0aWiL4+bhj7VFZMQXZp7cRULfnGa53Zj0Yxay6aBo5VdZo3PCJjT0m5QPpN8dPKyQQLqr/eQm1hFgenfMQ1Ce/3FA37BYYTrx9yj7I+UVm1jFgklyL/gOITSRBdvMYnTvyVif5+A
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0785.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9471a4-87e8-4d39-6d8e-08df1f4a7c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 23:28:08.3045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHDJ/fcIjOHH76jq0uVGlXWHbWzzO4oH/St5ju3ABqPHOCpUJY+RiOCtLisPTTx/8JaRhKtGuKoWsjfHGX5VxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0575
X-cloud-security-sender:lhart.opensource@witekio.com
X-cloud-security-recipient:linux-hwmon@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: lhart.opensource@witekio.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate67-hz12.hornetsecurity.com with 4hwB701Yfnz7RPVG
X-cloud-security-connect: mail-norwayeastazon11023109.outbound.protection.outlook.com[40.107.159.109], TLS=1, IP=40.107.159.109
X-cloud-security-Digest:68f060c4ab9180d9a3ace36d536280f8
X-cloud-security:scantime:2.391

On Tue, 29 Sep 2026 at 16:17, sashiko-bot@kernel.org wrote:=0A=
> > +allOf:=0A=
> > +  - if:=0A=
> > +      properties:=0A=
> > +        compatible:=0A=
> > +          const: ti,tps389004=0A=
>=0A=
> [Severity: Medium]=0A=
> Will this properly evaluate the compatible property?=0A=
[...]=0A=
> Should this use contains: const: ti,tps389004 instead?=0A=
=0A=
I believe this is a non issue. This pattern is also used in an existing sch=
ema file:=0A=
Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml=0A=
=0A=
Additionally, I have tested on my own machine that the schema rejects=0A=
correctly. I replaced the compatible line on ti,tps38900x.yaml:97 with=0A=
"ti,tps389006". When running `make dt_binding_check` on this file, it=0A=
generates an error, as expected, about the channel 6 and 7 definitions. =0A=
=0A=
Documentation/devicetree/bindings/hwmon/ti,tps38900x.example.dtb: voltage-m=
onitor@30 (ti,tps389006): False schema does not allow {'reg': [[6]], 'label=
': ['input6']}=0A=
	from schema $id: http://devicetree.org/schemas/hwmon/ti,tps38900x.yaml=0A=
Documentation/devicetree/bindings/hwmon/ti,tps38900x.example.dtb: voltage-m=
onitor@30 (ti,tps389006): False schema does not allow {'reg': [[7]], 'label=
': ['input7']}=0A=
	from schema $id: http://devicetree.org/schemas/hwmon/ti,tps38900x.yaml=0A=
=0A=
That said, this is my first attempt at up-streaming a patch, and I could be=
=0A=
missing something here.=
