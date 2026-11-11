Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390812;
	b=hu9F22RAqBtl4fdRV3tqPbnBFJHCBJXrwwkzHZGzc/57RoiRIFccwNE94GPadtkMkzYN
	 5DfijbMoLKYuhzwL86J4Tf0IghKOpy+tnW6aU42VsLg3ckLXvmkvIGVihB2w8AQ1j0C1F
	 Jc+KIwZUy32nXZNaXZdeHbC7zJ2yRiBtwcF9S+6G44wn1J3iFUAkleKtYSLSV8eS+f1wi
	 AAvivIlgrcoeXm2F7On4oUjuXAoWZoMtP1PYnrE4EXQTixv8rwPfbXJ7RjN1eXnppwvDs
	 +jHb2nbYEUmycCF72IVgQvrAnxo3bDy3ouyxIWu1a1EhkIkBSYGgQTxQErXV1T7ke1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390812;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0MA9icXwMiPBbC+DeJGo7gEt72DsncwhOXQCu+pUWOU=;
	b=hxyHvdqZNvZujIcD3+jS4UrXUSQ5Vnym4K7n/BNN0hPY7EcotnlYRTNUNngkN3iY++CC
	 jvyWLGsGVmEcaQv8LgTkvob907FAOkEoTAMfcOxUEOhmrYZ7GNUwAYxE37dpB+2wZgCzd
	 XsMzNF2XYdCjT2DfY6mJ6N+jv/eNXl0p6hCifztfBh+PDpw8RCDDbYSa22E0vCCZxeOlP
	 s3VTUPTVIp7yUT5RY8zE+33TpAedezIv7J0wpWpAQAmFaCuEIvrAn1ktFW2zmmmGE2XD0
	 BJ27mvUiYlwn/1rnIZZN1JjcI4H5tjgea1TunbnIW5vfkmMwSweElWEm9pCcwDvpncQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=pTPGjthj;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=YXZdJnKn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7785606A32A
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 09:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7785606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=pTPGjthj;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=YXZdJnKn
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB9A5rv3545826;
	Wed, 11 Nov 2026 04:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=0MA9icXwMiPBbC+DeJGo7gEt72DsncwhOXQCu+pUWOU=; b=pTPGjth
	j7olVbW3GI6dWlY0McWCjTuwyzgOBFuDtEEUv0Z8xTYVx1Us8HPmgI1fiKitPFAs
	rQgFNNzTfUObKY9+r1edlr0iZXhHftbpgkXR8/FVylerw0flBqDdaCDhdtpxuYR+
	hHhStt/MbavyOXHoYkdi8OMphsGmyRtmMZEdKkm9iL6rpGrSkLJJnvZQDWBzT0sz
	Q4Q2sFOzygvAlXAWP0quq5m1jJ45Qlr6shGsPeQ4DQ76TZqJ15DS69OeeIjqUT5h
	fvZDd0fXsjBKxZsoksC4ZqEAKBY0iOe7+m3qGG+8sJudwAIgbpTsvEXPEykyiNSG
	87oqKOHepICbmpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=0MA9i
	cXwMiPBbC+DeJGo7gEt72DsncwhOXQCu+pUWOU=; b=YXZdJnKnaFbpVPBObxBc+
	WdgL2wkugQHbGPR2z1DDFByKAsxpWMtgse2tOF2OSOkKPeqQKkzimlIkwoKYSsOh
	sc+i3G8eYDxLi2UoNpTt2/PiKBZKyNXUMbTgvVT2ejHeHMOPTM3uj6Ya5XxIPFe5
	Re5KUhof3lJ9zf4uMZ8ksxnhJy0R4pTSsg9sc7iWO053DYV6IIUoHNVaXkMhQIQ/
	3YLZDI+u8vy6nSBxpfICzPtR0qn1qZ3xopDjNnw2/8k0hvPqvgnIq483Dnm2LrK4
	d/eo3zYmIEacyeoW6o0G6/sd7a+NEf5FVRJ8Ba1JwAxyS8V+5qRpZY/Cc5qxjqrE
	g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010051.outbound.protection.outlook.com [52.101.193.51])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvhw39800-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:53:10 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtY2wHxfLpFj2AYC+1N5Ksm4kKDyyvIZe/WEu12dKkadAdIJTXDd54SkJM7EB3L3pp0J7IA1Wn2qR8o82ijtxkaAOACGCA6WVvGRUwkQ/hHyGoLaCbnEfPfV0TaSIkAxMh2WjZ2KN+tWeQzruBsg2Z/ydTuozRDSda3qRs4OnLFh/GNHd1B8FTjfQa9HRGba8WXCd+Hxmdm4gyZ9w+OM6O21RNe2IzmUvkgruz9Vy+Y9tJ3oh8p7Eera0Ro6COBEO8qTlr4NSj3fHbGqsRxeNo0U7uaXU1f//fgMgreSXMmZkmPDdH8j6JJ3NyAnsZk5wvHrC9S7QXWdqrHNy1pGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MA9icXwMiPBbC+DeJGo7gEt72DsncwhOXQCu+pUWOU=;
 b=wkh0iIICEiPI8TTo1qLQarG8djhJVB4R/irJoOJKtboKsbjSv+6xOKNK/YRgs0FVqLftDSmtr/zcbfdTV4F3TP79xE/ypSYQ2wcVMt1eTv3t3bTI+qnnJUJEhqFIzNO1Z1vbRc1J2Aa+MeR/XYihnh+/N8aeCiFIP1jnrEfoAy7mUTPAN1ruqYpw5KJ1Rrc4hMMtbltoC1XZ5X8ur7CJhDsy2R7+JZSyskkkreHXPI3pYdwSRmIGFGcckIeDNiNpQn98Bcn8e9HEztl3nfl++L3mQ5j/EsfS9Wm7B4iX/r/+Gx/sLxGGvYgPhG+j7mmSFMPscbn20bU6MOvdYWjLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by BY5PR03MB5154.namprd03.prod.outlook.com (2603:10b6:a03:22f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:53:08 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 09:53:08 +0000
Date: Wed, 11 Nov 2026 09:54:36 +0000
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/10] hwmon: (ltc4245) Drop platform data support
Message-ID: <avQ7PdXKmabocxPj@nsa>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-6-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110183434.181711-6-linux@roeck-us.net>
X-ClientProxiedBy: MA3P292CA0006.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::14) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|BY5PR03MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b65d274-3bba-437b-6040-08df3fd9971d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|4143699003|56012099006|261022075727099003|261021123027099003|261021121427099003|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	EanYtfdAI159vIAXAdifoyPNjUxkVxBvfif7JlUKBD1+Mtx0+QhMqICts/ApFyZALxZKp2bJrOta/x5v+E0kIyKAKz0sO/+w5Sr9O4yPVZ9GZHLATaZ8RBDh9xHM1EBmq1g9tJTwzOa8u09VS6Vi9Oaqhtj45mVq+s63EPFMpcTRaae9VF8RFXWzmX1oGE84+att9ULJIKmmmfutWAJMRiJxMlkPQlz1iHhHeE57dVBHyF65qAXvvcl64afYbZZ+kB2deBS2Cj8EEq+84HGBM2p6XfHfLtZNLVbWCfWYqtoNeZvZ343bGuaMZd/Mfpas0plA2FnZoqtwxbbmqUtp0TCNveJEqUz1JMuTEY6jKCybWHgUF1EJ1KFTpVvae46F9J9tKN6zpItGBh0//e9ZFP1RsJYkCxVrwfbsXxZLFM4X3lpSV2I1UIxqQbqFasSUe6ytkDk4wfY+n1liEP6Ft0DqOeW7S8iPSa7dSeG4eveMEMDDu/pGhjzLythZFM93nPvq+BBUhklb3I4nNAKlIa5EcHplyrF7Vn7bxiaZwxYFvefrCl8GD1rD4Yy78WBOtHXM6euEvqyNzMNersk1C3Yf5ZviwJUdqzNFqygc47G2ESOaRhVwlSSdCrI04DMJbow8V5aXW4J89viJZXr28upoycJdBGdealk8n5bGhD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3RYU0JtOTZDcHUya3BIS3VjaWZ3ajFFUjgybUlyc3pyaGNKR2JZaDV5WG1S?=
 =?utf-8?B?Vy96alQ5c1FhK1ZWUW5NVzJtZ0Z2ODY0emZSdHNQUTl5c1A1UmxHQ2U2Qzkr?=
 =?utf-8?B?Y282T3NOYy9BdFhRZi9BUnZRZVl0cEppTHVqbG5tQWpveVprQXlpYmFaNlNF?=
 =?utf-8?B?RjcrMzNkc2JWcCt0NjJvMXNMMlg1eXdET0JmYmlZVXRRZEd2Mkx1RUdiNlQ3?=
 =?utf-8?B?ZndLaU9GWm1TT01SOHIxcllHdXFnOWVNZXJYWkZUbmFaREUrb09PbzZWTzRn?=
 =?utf-8?B?bXRpWDVGbWRFa3hFaXQ1bkJ6RmxERDZWTzFqVEthRVdsN0pWcmVNcGQ5SlFR?=
 =?utf-8?B?TW1zNzZ3NGxDL2hJK1hIWWEwcXVjbzN5RVoyWFBWNDJpNkk4a2trWGtCcWNR?=
 =?utf-8?B?VnF2N1dhYndIYnRiM0EyclVtaXBabmVzcFhjWEg0UnFNbHIxUC9udnBzYVpJ?=
 =?utf-8?B?RXh2YkQ4VzUrUjJ0WDQraXphWmY2SVVKYVFXTjczejh2MndFTUozc0ZmZ0wv?=
 =?utf-8?B?M3NjcTh3MU9KYW4wdEFsZXllQUJrdmE4a2NwdmlVb1c3ZGdmejB4aEE0VERm?=
 =?utf-8?B?ZE1VN0lYM04xN1k5VEswa1hPbWlyR1JyVGFZWWVGMkV4REpMNVIxb3k4SDhm?=
 =?utf-8?B?azNubytQSFgzZzdpUEg5REF0RE92Nkd1dDRMMitQQUdJRjMyd3IvMVVtWXh3?=
 =?utf-8?B?UUNUSjdmbWZWNWtTS0U5STNQNnYxQ21uOHc4azU3MXNySXpnSlVsWlV1T1lH?=
 =?utf-8?B?UTNmQWp2cG1DeHJ6R1VlZlpianBnSytYak1kNmxBalhWd1laZUFwaGVrWFVJ?=
 =?utf-8?B?MmF3K0htN1o2WHE2WUpZWlhDSTl5KzdiMDJESXVpTTFLdDBSeDh1Y1ZVZGhN?=
 =?utf-8?B?RVkzaUFxY0tjZG15cUExUE5tcWUvNDA3Y0g4YTk2bHlDYUozZVBURGJWNXk3?=
 =?utf-8?B?WUZrVmZJcjR2aG9May8wM0JNQVFjNWNpNVdpMjdWc2xmN2lONWZWdlVrQ1dD?=
 =?utf-8?B?cVlHY0l6NTdIZzZIVVhNeUthUUZjK29QeWNUZWx0MmZHaWFxaXZTWngvMW5S?=
 =?utf-8?B?Uy9iWHN2UHF0dVI1TkNydVNlTWZIZnh0SmVtTm95Yjl3dGR4dzZsazV4R0xZ?=
 =?utf-8?B?Z3l2dUx3TzFhMUw0YUR5Z1BId1NGSklxM1N3NFVLM1VEczNEUTl5WjFkaytm?=
 =?utf-8?B?Rit6UFp1NTN6QkhOSEFkc0pZNnlxSFFuWFg0djdNTm03RGpHQVVySVBHYVNW?=
 =?utf-8?B?bm1iYW5RZmRwUWNhcmJHOW05THpwMmQ5am5WdGxEL0FiWjZKMWRWN3M5TnJY?=
 =?utf-8?B?aTZLYmxKbHNUc1ZyVDk4eVdKUG5mREx6azJvWTF6YXFkQWovZCsvNzhmRUNh?=
 =?utf-8?B?eUZCekdwRFAzY0o2Nkx3WEh1RlkwTWV1WFZRa1AwbVhPNzlWcnlwWUdaU0tN?=
 =?utf-8?B?Y09FbGhHNzBlTjQ2citQVFhJc3NMeXNJTXpSTlMvTC9aSWxwNzhNQ1JPNXo1?=
 =?utf-8?B?TE1Ga1RnTEJhM1ltRWtoeGhSSGhLdzFtZXFJMDZUSFhKYW9nN1Jla1FtOVNR?=
 =?utf-8?B?aFlPaWVQbmFKQWRDMHJIUnN1R3hKSEJkR0V3b3p5b0NyakNOcy9jclBvMmls?=
 =?utf-8?B?V1RKWkgra3pSd0xuNVorMk5qTG0vek15SlI4bGp6QU1FOWI0czRONTR2MWFM?=
 =?utf-8?B?M2Z0WDh4Ri9XOG5lSGpONE9MYnQ2U1NPVnZtZFMxTGYvaUlwd2RZODN0b29i?=
 =?utf-8?B?bVZkNVlzZXhRMVIrN3VhK3NNaU1BMHJheEkwU0QwVWRNajZEVm9HOWR1Nldp?=
 =?utf-8?B?b0Q3bi9qQkFBK1cwcGZDMU9rSy84bmNUNENYTE1nSFI3V2NPMXQzSU9zWmFo?=
 =?utf-8?B?RWhsQlpBQzVpYXpiOEFSeWZNR1NuZzhIejFuSWNURkRkYThrR2lGdVNkdEwr?=
 =?utf-8?B?K3V0YTFiM25FYnJYcTJ3Slc0TWpjSU5XUDJjQ3prbnlRbVFmaWR4N1JBdWJx?=
 =?utf-8?B?aVY5RFZDdXBCdUx2NXE0NlJDUnJzTTdnYmNHVlJxeHZrTm9Gb2tCdEFaa1pj?=
 =?utf-8?B?SzRHUGdDNldZbXBLZnBnU1pUbkYyVG51RC8wNGRFNG5WSXpKaGdNa0hmb2N5?=
 =?utf-8?B?UmQxKzJoTDl2R3EyeGtiT3NFOUR5bC9Yb0VpQU1kL1hnUnVOOE9ocnFJOHRS?=
 =?utf-8?B?K0NZb1Vwd3pjd0FpelpSR3VabjM0MXlMeXovaE9lRGFtNUkxcWlvbGR5Zitk?=
 =?utf-8?B?Q3l3b2NlNHlrVElQQml6WVhtdXFJSjR6SmthKzRGOWVkU3pZcFJSNlM0cnps?=
 =?utf-8?B?RWZGR1QyTVdteDhqdFdubkd2NkZxSDZmeU1ta3AvejUyaWpHYmZ1UT09?=
X-Exchange-RoutingPolicyChecked:
	fpHtls+dIVPc281pFnsDk+WmGGHsapX/qWjukWmgLuOYzf0DCwHV9t5oPGPy5lIsz7+EOB7elBa+SvUnjJdlD5zD/NblMspTRj9V+2p11YlTd8qxF9Ys8YwQhYOTBB7DAV3wkjV+hlwtzwqJyWsiMP/dRYy/G/9sETSykOTqLNlbdSFibPWqIsQ8o82OFGkLEu2+CQAB2EkhOsqYrpauSBG/uVocMUwbEGDJ5IkRQ525Jrnr+8qfBKq314uzkNvGwPcuqm2PsF3SX8S+Hb5X9e4dxV40ji5CVzRgb+Geq5cya8FQ1Cb1FAa2pgHj4naZdmaO/eA7qIPwWvFWjrmRRQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b65d274-3bba-437b-6040-08df3fd9971d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:53:08.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjmmyVl/FylVJT2QabBqV05S0fEjiQrZdxajekYZrSo5yyJ3EYeRbx4pyhnyBilErNSYSri4UuHaqWeOMIgq6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5154
X-Authority-Analysis: v=2.4 cv=VJhIDNPX c=1 sm=1 tr=0 ts=6af43b06 cx=c_pps
 a=kgXPJ/cF3Xw5T7/w5pCavQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=WY9D7bdRHXOIaAv6frgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: 9u17g0mfhBvTYDbj5bq5kqV8axpuKMa1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX5/Ryjhg6/HBD
 fFi1+mtq4SXFpIO/wzDkD1qh6824fEsLyjFYm10XMs2yoFVgoXSNmzmH0+JOm3T+cjQUjxoJqL7
 8IlI/1nUZ8a90l4Y5KUsId8kj41QNqDLxtidTN+V3yi6mqVktfMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX6HGEoAd2d+4L
 EaqbK/yqhbX9NrsQCHq4SuvXHdc5RcOjPRwAXbdMPtgoLDAICaMtpTJF+HYu6dSWjhwStMG0k8u
 zAjPIwerxK+As4D2i8pawG0T9nfd7Tcap8vR5+co8b62apidoRz4FTbX6C5YP7YFvheD+HakRhg
 6q6ubYOyQH2BGB63ltuCD9rhbSyQgscLIAagrDSwB+E8v02CewrOLNWttZ7kanLlWFmd6AP/DR+
 mcybswd4DxMXIwzM2bXFdCnbPQSQsJ+gYFfieCI0W8afy8Tk/M7GF23b9WXaK53LbVcoVJ3GHbl
 ta9QrUIuPfIAH1FNi52tcNlsAcq+QZeNLtRmtNQBQHf1TTZ59txc2DHOKlueuLrvRFDGYUto0mF
 oBhlv5RaJ2uttD9ZGbLPvioaVcDtlxQRFlOIP5s4a9gRkSaZ+bnZ0w6Hc4cvQjyi+z6e6+4+aIQ
 6jHf7broVuK7qnuEZ6A==
X-Proofpoint-ORIG-GUID: 9u17g0mfhBvTYDbj5bq5kqV8axpuKMa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110039

On Tue, Nov 10, 2026 at 10:34:28AM -0800, Guenter Roeck wrote:
> There are no in-tree users of ltc4245_platform_data. Sampling all GPIO
> pins as analog voltages is already configurable via the
> "ltc4245,use-extra-gpios" devicetree property.
> 
> Drop platform data support from the driver, remove the unused
> platform_data header file, and update the driver documentation.
> 
> Cc: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Thanks!

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  Documentation/hwmon/ltc4245.rst       |  6 ++----
>  drivers/hwmon/ltc4245.c               | 21 +++------------------
>  include/linux/platform_data/ltc4245.h | 17 -----------------
>  3 files changed, 5 insertions(+), 39 deletions(-)
>  delete mode 100644 include/linux/platform_data/ltc4245.h
> 
> diff --git a/Documentation/hwmon/ltc4245.rst b/Documentation/hwmon/ltc4245.rst
> index 3dafd08a4e87..0c3b823169b9 100644
> --- a/Documentation/hwmon/ltc4245.rst
> +++ b/Documentation/hwmon/ltc4245.rst
> @@ -103,9 +103,7 @@ then they will be sampled in round-robin fashion. If userspace reads too
>  slowly, -EAGAIN will be returned when you read the sysfs attribute containing
>  the sensor reading.
>  
> -The LTC4245 chip can be configured to sample all GPIO pins with two methods:
> -
> -1) platform data -- see include/linux/platform_data/ltc4245.h
> -2) OF device tree -- add the "ltc4245,use-extra-gpios" property to each chip
> +The LTC4245 chip can be configured to sample all GPIO pins by adding the
> +"ltc4245,use-extra-gpios" OF device tree property to each chip.
>  
>  The default mode of operation is to sample a single GPIO pin.
> diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
> index e7fcf607a05e..7425c801cfe5 100644
> --- a/drivers/hwmon/ltc4245.c
> +++ b/drivers/hwmon/ltc4245.c
> @@ -19,7 +19,7 @@
>  #include <linux/i2c.h>
>  #include <linux/hwmon.h>
>  #include <linux/jiffies.h>
> -#include <linux/platform_data/ltc4245.h>
> +#include <linux/of.h>
>  
>  /* Here are names of the chip's registers (a.k.a. commands) */
>  enum ltc4245_cmd {
> @@ -418,22 +418,6 @@ static const struct hwmon_chip_info ltc4245_chip_info = {
>  	.info = ltc4245_info,
>  };
>  
> -static bool ltc4245_use_extra_gpios(struct i2c_client *client)
> -{
> -	struct ltc4245_platform_data *pdata = dev_get_platdata(&client->dev);
> -	struct device_node *np = client->dev.of_node;
> -
> -	/* prefer platform data */
> -	if (pdata)
> -		return pdata->use_extra_gpios;
> -
> -	/* fallback on OF */
> -	if (of_property_read_bool(np, "ltc4245,use-extra-gpios"))
> -		return true;
> -
> -	return false;
> -}
> -
>  static int ltc4245_probe(struct i2c_client *client)
>  {
>  	struct i2c_adapter *adapter = client->adapter;
> @@ -448,7 +432,8 @@ static int ltc4245_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	data->client = client;
> -	data->use_extra_gpios = ltc4245_use_extra_gpios(client);
> +	data->use_extra_gpios = of_property_read_bool(client->dev.of_node,
> +						      "ltc4245,use-extra-gpios");
>  
>  	/* Initialize the LTC4245 chip */
>  	i2c_smbus_write_byte_data(client, LTC4245_FAULT1, 0x00);
> diff --git a/include/linux/platform_data/ltc4245.h b/include/linux/platform_data/ltc4245.h
> deleted file mode 100644
> index f07fa05ea6c4..000000000000
> --- a/include/linux/platform_data/ltc4245.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Platform Data for LTC4245 hardware monitor chip
> - *
> - * Copyright (c) 2010 Ira W. Snyder <iws@ovro.caltech.edu>
> - */
> -
> -#ifndef LINUX_LTC4245_H
> -#define LINUX_LTC4245_H
> -
> -#include <linux/types.h>
> -
> -struct ltc4245_platform_data {
> -	bool use_extra_gpios;
> -};
> -
> -#endif /* LINUX_LTC4245_H */
> -- 
> 2.45.2
> 
