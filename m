Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C3372B23;
	Tue,  7 Apr 2026 17:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583470; cv=fail; b=uVIiCvdFYrMoVSqBz+toiy1+PGmMbl5mZ/M+v7U2D/VsH50HbSKQT5cee0EOiIwz590uckcd7SapatJEp4O6taDBIaRdD89+/qcP/OyxQps702E2+q9S5tAlWtJbAt0gx/fsx23OxgOAqnQRf6n6UW7urs2JvFlBLqJN5UcCFXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583470; c=relaxed/simple;
	bh=xSAHjASFfE0HAkZG+SIB1PHCQBtyzv86J9+QlhI4QaM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YICDYyNUujLZbfvCwsGfJ4UX3Eq48SBHlR0w8XrWFpSc+GA0y6OxqOB4PJNWyr2l6XrPPP7w23BlLLTrUMAPn3ANVEp3GMzVRSTARdfNMERofSWivwudUBucmPtyx5vaRh17byb6ZUUsBjkPI3mMEcZ8F0J6EBtMb3Zu/qrkFsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Rnq/ScXB; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Rnq/ScXB"
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637H28G5775896;
	Tue, 7 Apr 2026 17:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=HQbrxLqrwh+DnGhUsHnZ3sWD
	WAsV6R745FOE11lUumw=; b=Rnq/ScXB0bkB6mxwTluoSB2y+rgw3xBUVIId9GyP
	pGldMSWjF8AyZCKU/4HnkPbDG6WDPJms01rCfyBLztrJETuSZbkcMFb2yCyVcE6B
	G8+4G98ZmU2dAjfYuPbpCWZLQAe1UO6fEDi+2UUvQNELiz7tkz0t46aZO+CjswVV
	RvX1iX1xFrNZuJfoozqeWJD5yvIELAFok69NgnprTbSAMBnpwIjufEqJD6c+qGYa
	a7we9XeeUj3V5EaqPYkblNpxxOvkf1pUplKajuMRk5d5Z6mGWZZo/hffLoIo6JzI
	jQCeuOxdQtM1K/vHQScHmGaLYEs+Sc+SCyNACEtdEp6HmQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4dcy1kpfdk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 17:37:22 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 8E0A380173E;
	Tue,  7 Apr 2026 17:37:21 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 7 Apr 2026 05:37:15 -1200
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 7 Apr 2026 05:37:15 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 7 Apr 2026 05:37:15 -1200
Received: from DS2PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Apr
 2026 05:37:15 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNDkZySJUYtOJD8IIA55ur4lzzyTbEyKOdU1fIXSEtASCDkjqkKrY9e7ciQ3hmmjUxTx9sJNIPiTQrBLd0s3R1+s6I1+6bzyJZg4V5uej0SX4olLcx4ZYJ/V9BCihb4SiPZWuPcoLtErgZKnjvmuB8L5rkq9SXgS4/EAmZ55fj9OvJ6YpyQspTbM9Vba2GlAicjQzCqcfnFpTc9Sh0kDIeGFaWnNoryU+lPVjPsZB7RVb9UzTpo9SfWL+fMKGVkIDLZwMVE4cDts7xDbYZxbqod+Pk7MqY4yPOz9cPnLYLGtpQwffQ7MGkJNK6Di4gj5hJuodE/5M7GKS0AaeVPKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQbrxLqrwh+DnGhUsHnZ3sWDWAsV6R745FOE11lUumw=;
 b=Aj5SrOsJ3JjiPVvEVUn/ZNyjjz5tjhqb+TWon1JqWV+m875T/u2g5wT0F5pxKAIikr0WWF9OepBQocDps6D9L2dXkuki+4OXipPdFSS0beJBR4PnHSrQGOX1jSbAw4rDpfziUdZzCyrtsqwvAqhL+1xF76HISCsrk+mCuxvZOnt4zSRyqRYP2GdE3IQUn1TmkFGwlD7AICfp2Ztf2Lt/QXkpDGX2o0kUB3x7KpxahYuxIwG/fPlnGGdac+NCm/cyuLQf1bK541nbP5fV+9Do1GiVM1Vc2gcYyKVQikXd61230Lpuub3iKMLVCXObPG19oa/bAxz0fD+sRcX0tiEyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS4PR84MB4043.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:29d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 17:37:09 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 17:37:09 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux@weissschuh.net"
	<linux@weissschuh.net>,
        "cosmo.chou@quantatw.com" <cosmo.chou@quantatw.com>,
        "mail@carsten-spiess.de" <mail@carsten-spiess.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v2 0/3] hwmon: Fix bugs in pt5161l, isl28022, and powerz
Thread-Topic: [PATCH v2 0/3] hwmon: Fix bugs in pt5161l, isl28022, and powerz
Thread-Index: AQHcxrUo2OhT0Vlhw0uZSErJxrZLCw==
Date: Tue, 7 Apr 2026 17:37:08 +0000
Message-ID: <20260407173624.247803-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS4PR84MB4043:EE_
x-ms-office365-filtering-correlation-id: 8f686684-999c-4390-2904-08de94cc4b40
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 1bHeXXmbFaqd2Dzi3F2ZZElgYbND1Sq9OevZrWxwIC/UOxRGtyqNNzL+id5KRE1YMLpb1s0bFfcl44SxijmZPKp5sCTghsLhzyUL1DuuyjC8seSCIDIoN1ACB0JP82U5GFXvnHTrAdCo7kSB07Xd5nDE1jrOWty1+LG0dtsLVfkNtjn5N81/MxIg5DRmhsmiLdtD+mnJKLXeLY8bl78EHWlCAy7oJDQJHBvwQQRrHZSX1EaQyPMaa2sL7lw/WjgHWT/kikdygeL4bJ0JDhmnVhAmc6krdzDzBIPg1Pc2UsVwJDLdfn5WWq/STkrpwQ8SoeushdhWXO0w08Ju0qZsTBQqEXjSL/vyg60kTC+i4xVeIZuuL2jV14lLpFFvHPF49LTcYpg2YCxW7yDXsDPNTrQcs2a4FrwYyXaSKZ/vtLnAz1D4LkNTKNIPOqcsvJSjuMJly3x/N6XlBjVe+MId8t5gjpzUCNlThNLpLqFkWZI8/2IpBilx/hQutwJbHtUVuZQElMkC0S8aM7ONMMEeCYjqbN8WnnIU+cbpjC6So+HhrSbiliXJ+2TItWolS4b6A+f98VCLx0R5tS3V6DnMRmhXA03kqHXd9I6/mFczkQIocHJ0X2tCTiBdnaGjRL5/hTvh+QQz57+9vcwdayPDBDgZOrAVqK/hGbBg39k9j55NNs5nbyu0MdAJ83jegeFjKieS4Z5RuAM/wuMtloA9r7tFr7qPJ13lNcowMtH84MQ1/t/kAwYUXhhy6lxDrkImB3b5xDcZiiRBWp21uabH9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zDS3/nhufNJ21B7/ySzXKefF6zXWanhFZHa/dmOwxr7QhNcYI2BKh+jX6I?=
 =?iso-8859-1?Q?8+cIRsvh8qXIM22ChIQpDKJYP+ms4uG1KigX4caGNA6tXBpitpCqrgXEzf?=
 =?iso-8859-1?Q?wdJ/UD60mYDIr3demtOEA7UG/H2svpK5zpukKujOz9kWIyz0EjxgVZ7eZ2?=
 =?iso-8859-1?Q?lJGFQrMy1BG/nnBAKuSqpNq6A1IeINYqVJOM4gmtrDSXnCUNbOmo8uDJMR?=
 =?iso-8859-1?Q?ycl+q/V0hsOy9OriSnGXTF/xcMOZygMztXO2f9tjUcoVcbpJ0cszV0zkRv?=
 =?iso-8859-1?Q?8wiG3SI7/0XbpI+GsK5xpewQHnXMZq/wG3L2OpXDio3FhR3HjBzN1QmIsF?=
 =?iso-8859-1?Q?K7rM/a1AkUXCtJW4I5kR8PiuER89Cmc2X658yV6oOsPMctVLB1TKufFsra?=
 =?iso-8859-1?Q?fCni3ua5eKznkd60HFOdBrmfYVj2oFnPEcmfdLf3Qea2KeEmZE4mcmmYw9?=
 =?iso-8859-1?Q?I4X7d3kFCKm612/DR5MrLUKATKeljNYuS5SSMFeB/0qBERwRIzbF7ie/JC?=
 =?iso-8859-1?Q?2KGzBj48FkBZagws/VQSi3e06pOrcN85veAkwqZ8NkOZxQgUZUUL0767b6?=
 =?iso-8859-1?Q?nifBLMzSfhDh9yybi5PsFgHw1Sskl7pBSUL4uf9WJLZBJaDDcslCwrfMgF?=
 =?iso-8859-1?Q?W1Ca2LnNH/Dro84s61H2XJ6Hk6svTUvoqhSDitVtQxFcQrB713CA9htNs8?=
 =?iso-8859-1?Q?vFB+fQMOOZE4C7cL/Ep3yXJtdd4XRYC0/RdSryl/LHudv1cX4VuTmfcAjO?=
 =?iso-8859-1?Q?PVQZuXyn2UK0bmeB3xU2TkTHG0mPZrNpT0rlnJRWubZfNdzLCXggD37kvF?=
 =?iso-8859-1?Q?TtxVFLlo0q/CQJbuOfo9Etq8AAJEo3o+hTU90k+00/pMWtzNxKCQcPVuSP?=
 =?iso-8859-1?Q?6EMMQoHhISuErzoaaowFJz0I4v/GDwQvgDL63QbSaj8gKxzwfTAARwCS3m?=
 =?iso-8859-1?Q?HMFeIs6BmwQ90qMrHu+mNOKBAcB0h8fZ2/HdzFXNcUjubdaNVdKP9i/7k3?=
 =?iso-8859-1?Q?AodYEVa/QbMjplzkmHb+r47bX+BVHjX1zSKlfTgkfMvuwt89MZJBmyNXQ9?=
 =?iso-8859-1?Q?UNgoAIW50klEgplSajYChG0msUFYwfyxZ9G39h9yHReYdBVsmHpsXEgLl1?=
 =?iso-8859-1?Q?FTJ6R4Uu1PIU702rGF7g+QTl1neaLweL1hAAN/4pH7pjbJUPNwfhaYal/u?=
 =?iso-8859-1?Q?mwHisfcNebGe+c93C/T6f7alx9N0nKC711+914spEaV8wsiFZD1c8SKIUg?=
 =?iso-8859-1?Q?XWGw2uclEc8anY13dY8fr9tWyQc6iO6MDmLIakKKB5qP3MohttrYW+K13s?=
 =?iso-8859-1?Q?hWcHhPQbCbQgwju1SNol2ftxTsRRcl4SSUs2j+MGnQ7Olju74yNVa/cNCJ?=
 =?iso-8859-1?Q?rac7YeqaDwibs5NUjiqs6Bnp0ia0QE0rFHACm6E8nRVAK+CTX3Mjf0Fir5?=
 =?iso-8859-1?Q?mToGc/0Zv5iT2NNHE7ZnkzkP7ALqEX5OLB3Vq1ncReorIag9LeIqQ6kKYL?=
 =?iso-8859-1?Q?9Gkq6jl1btCr0XY46G346+LDlMXOa5oboHkGq8GEgIeF9JHRrLlz+PaQEi?=
 =?iso-8859-1?Q?Y4bKD1XSDOKet4eqmtTvY1oLTuiRACnAxrm/Bt08WWhCqp7PaUyFeYXtWb?=
 =?iso-8859-1?Q?BG2iHMebS34jFOwGgipqK0X9vBQNbpzfHrKMFzRHsLSwWow3lBkK9ZARQN?=
 =?iso-8859-1?Q?28qhWh5IJmPkWV9ExV9xugyw+4AGWCvY0M2rEZEKdDOzWq9aUT7gHO9K2G?=
 =?iso-8859-1?Q?gjWh0zrrE0nlIbXOBgm1s/jYjUxFdjHh2ZchyyKV+VtVC5r4h62z6W8RWg?=
 =?iso-8859-1?Q?saF6HxRvKw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SEoRcdCRs9d4OuFkFJTczc0EHvkyvAgV11Zfa78MuIyDAbJyPvgdr8RCz3wZDBIVrKX8B5KtHO62VBK/TIMLyU8CjUU1Gy+DnZ52bo3fVj6xygGgWduce7cRhViBQbWsRj/jxAQMdw8zmK3LYmvQquz2TYhPLwknolEbIw/bFlhDlZ0qdR6KD33R5NU9w3s7O0doY28r0vfGwllk9VTS45hDNBEns4XP+hFD56LaCyB6vkHtcee5tdHGRBCebZ1SUzNQzQlZDB6+b334vBKQgU4l69Xm9mgWJgXVDGZKM4guER73DB6kJLEh0FlqirVj1dTzzrlqaOa4Lkk4YmvtUg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f686684-999c-4390-2904-08de94cc4b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 17:37:08.8859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELQpWWnrTx5H1mNjBk6jj2UI05XDGxUJzy0x2j74Pk9ldiHNI9EOkKTHx/YLd0NYUwR2K8x4MfVF2R8ah7RxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR84MB4043
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE1NiBTYWx0ZWRfX9SqhAgp212rB
 OtpVML3aQY5EGP/UTw3ZEIyAuz6WkzaediohPJBMH2rgbOLlParFQw3vtdkhd89aa84dzymUP16
 djdyNR2pGPR8a2PzSUv1N0uTrmani4cAymjEz+pse6KFOS35xgd5iNz8FBgrpZXldjvDabpi12e
 nrYRHz7LHN0dv5Zvkms6t5sWrLuzr6hJvGce9edETbxst/c2BhD539G8jwgc3spKXFvg3SdOrg5
 qXu+RZBkzppgNg6gFT33K3h2SrM06pab0TKa76HCKOe/N8soeqCwio0c9av1SQfQLYeKZuxBNc5
 jcGN7QQyzWCGsHWjZeHlFh6uHC47iS2AKmsvhvbKYIKsaoETjDz7tUU8GyNGA205wjHVgUxwELv
 E8jcG2ynHOVvidmjC2wkWFHpKQyE1ibxi5Jxhl+06ItRbMdVfqVP5ZcBFczR7Yw+FSwyYkFThrS
 cspFweKmhCJl7N+xnKw==
X-Proofpoint-ORIG-GUID: YNUj_-ujO-wZn5BeMCXEW2viLRflPT15
X-Authority-Analysis: v=2.4 cv=DOm/JSNb c=1 sm=1 tr=0 ts=69d540d2 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=J0OTuHAx6l5K1fCpvPfz:22
 a=OUXY8nFuAAAA:8 a=O9v7OKnEnwpci12v7GsA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: YNUj_-ujO-wZn5BeMCXEW2viLRflPT15
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070156

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series fixes bugs in drivers/hwmon/=0A=
=0A=
1. pt5161l: Undersized stack buffer for SMBus block read, and=0A=
   unexpected positive return when retries are exhausted=0A=
2. isl28022: Integer overflow in power calculation on 32-bit=0A=
3. powerz: Use-after-free race on USB disconnect, and signal=0A=
   handling bug in completion wait=0A=
=0A=
Changes since v1:=0A=
- Patch 1/3 (pt5161l): Also fix the case where=0A=
  i2c_smbus_read_block_data() returns a positive byte count on=0A=
  length mismatch after all retries are exhausted. Callers treated=0A=
  this as success. Return -EIO instead.=0A=
- Patch 2/3 (isl28022): Switch from s64/div_s64() to u64/div_u64()=0A=
  since power is inherently non-negative. This avoids implicit=0A=
  narrowing of the u32 shunt divisor to s32.=0A=
- Patch 3/3 (powerz): Also fix signal handling in=0A=
  wait_for_completion_interruptible_timeout(). The original code=0A=
  only handles timeout (ret=3D=3D0) but not signals (ret=3D=3D-ERESTARTSYS)=
,=0A=
  which skips usb_kill_urb() and falls through to access stale URB=0A=
  data. Return -ENODEV instead of -EIO on disconnected device for=0A=
  clearer semantics.=0A=
=0A=
Sanman Pradhan (3):=0A=
  hwmon: (pt5161l) Fix bugs in pt5161l_read_block_data()=0A=
  hwmon: (isl28022) Fix integer overflow in power calculation on 32-bit=0A=
  hwmon: (powerz) Fix use-after-free and signal handling on USB=0A=
    disconnect=0A=
=0A=
 drivers/hwmon/isl28022.c |  7 +++++--=0A=
 drivers/hwmon/powerz.c   | 18 +++++++++++++-----=0A=
 drivers/hwmon/pt5161l.c  |  4 ++--=0A=
 3 files changed, 20 insertions(+), 9 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
