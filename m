Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E59A1A239A;
	Tue, 21 Jul 2026 01:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596464; cv=fail; b=Uyw+lLKFmIQuQUWn5sErvNHzHgucFNcUHyr+fCOX0dgk68v3KJgF7neDJJwbDbaA+mY4v6DOPWW98WTi0gbp5Q7FDywB+BsmMiSMi5YqfXckhTEANY8MdjsEubyle+lqqHE096DzAChSmPedjdDtTcOowodOp/ZdDU6xVx7BEec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596464; c=relaxed/simple;
	bh=ZpPzARPJh+Vb4Ab82rcj2om2fnXUbyyzw0cdBQgUyFY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jCpqHcrQI7uHgO2ZvvmN1AQ0eChw5KYGWPGvK9qtfMdxJOxF+UfcRJZS7r+PHtMXmhIwI6c8SlgSarJWpAK1PsMOBCOSKymMIYVeJlFxEwFRkzy9bqNZWzW342Suw/NBcPPNhNKfKkX5CFAzIS3RbN6CuU9d2PMtWGDzANwOQ+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mDJBhKNN; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="mDJBhKNN"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNBX0q1937403;
	Mon, 20 Jul 2026 21:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZpPzA
	RPJh+Vb4Ab82rcj2om2fnXUbyyzw0cdBQgUyFY=; b=mDJBhKNN57+eQaVdECdin
	acHYNBY3v/faAnux5foTT3tWxKKlbdi+Y9bPHmGLfJ6u/u3JPL1kIDwzeyEuDZm3
	ZXC6TZ0QqJ6aRdr+JRafwHBEUD2ZkmDtQ7wjo8B7bacJxERPXFxE123IMlaSVURp
	DHCVFP9KDa8y/aJJYaD0cGP9yyaw0fOjFNCb3KnxFsEwT1Fdgj6NwHaq16Fw2Y56
	J6ffRpLr3DgXgZA1jIpX1u3zmSd+MDTm59hZzmy07X6wRW6HskqjpdDE9cQTn9+R
	QQ2UrNu6c9nj80A8F0EQsJUegSKZ/oJwyK+lWQymu4dMd0WskAQPzJCN7ERaIRlW
	w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fgt3j5uxp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:14:05 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv9R7nL6t5uC9QjoC/40JHFpQzV1m9anzncHos/lMbsz85oO/0qKdfgK0VKb9HPXek1k6vKldnhTYDo6n640+mGyQq6UqBc8PuNfBOS62uG10R9BRQdfzYnvnibDfZt6t/Bmwe0TihfMDWwcgpnOkZms6lltZe35hB3UzaPEa2spdUPhfGjPQaOeed0T8V8Qpm606+iaAi2WhZboy534ISK7/Qg3HekszaHAUtpDVlcLpgykJC26YIluhC3N8uyA62rw7R8Ob8QlEXyNLsIWMqZS8gbM6EnmQKMM6llm9VvkA/fGGmhPeuN4wOx9NQW3Zeg4bRr2QDursLXTeEEPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpPzARPJh+Vb4Ab82rcj2om2fnXUbyyzw0cdBQgUyFY=;
 b=lvLBDttm1QS9Fwmn5X5YMTvpTdCSCPlAmgiYm/5mZZfg4sdkSv6ODVuTy6C2CWg0Jtue2yCxSJpW7loaJtpftPFHhg+VcdLsOzJdXb9KLFqW+x1Fl/wolZ0MO2gPuFB4QLbTxTqtkwBJ8WEINLJ0SGUL8xAxMdVm+5ryFJNRRk2m8TJ9WQz0nAqjp9JQssjm5JW7pd0YhyFUxgoORhnEovmlRv6iXnUYwotFd43LtJr4/7x6Ul06SdjQKQvoeJPEhU9RCbqaM4sdLp/5vCRHC3mU0x66HNzgw8Xe8MV9FkhzcD8Rs18P/nSaBa+USLf9D21SdSE2Q6dofRJkoV7hJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7948.namprd03.prod.outlook.com (2603:10b6:a03:5b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:13:59 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:13:59 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Topic: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Index: AQHdF/YCzJ3w82nZi0u4PK0Z06eq07Z1vwAAgAFW6nCAABRLAIAAAVgQ
Date: Tue, 21 Jul 2026 01:13:59 +0000
Message-ID:
 <PH0PR03MB6351B6C4964CBF90198DF736F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-2-9d06d27d6da3@analog.com>
 <20260720032550.A4F891F000E9@smtp.kernel.org>
 <PH0PR03MB635109584F166EBD4A5510B4F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
 <b0442a31-deda-413a-955e-1ab8c99b2033@roeck-us.net>
In-Reply-To: <b0442a31-deda-413a-955e-1ab8c99b2033@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7948:EE_
x-ms-office365-filtering-correlation-id: 6567208d-8cd4-425b-7298-08dee6c55836
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 bUYkSkag1ubzwb+I2aLhm5cXfwzNT+Otg7eoJt1jpWJ2IswsVJh/JxUvEMc74GGUSfQRcpnLkvMEh1U1RvQlZHfBve1cHo8ZWbEXo98Psn09PcwRpbPe0T3de41sdiQPZPiz+h+Fm34vNfRwWr4/dMwiUG9UOXdL5dw1rZa5CX9+FYBkPuI1YttXwzpIT1k8cPAQZ1C6FhMgN7nrOwbJ+qvAV7Xf9E8ahkLR7YM3w41yN1GVsCl4suqg9Kqv6MOA/IdYOQVYEe39RRgMJ9N47c09dRJBhgo48wSU91yge8Jb5aTK491wI1WazWe1ntrTTaDxgQEMiLU2DhbpZsgQ79oCaEI0kUvgelYb10osqQkb+AD9htdCF05uYRfWNxg1j/eCHaIw5n8pBoYIlVd8ohKXr78PRemY+Zbumy+zH0G01mbd/44L1e6IMLVMXO/YksJoLVIOc5WFnpD+Oua7SbcegEjng5zMDnc4+jN5TzQ/cfxLr7csm9Rxlz67sYOdaVI3h0pCBpYreROW4vF4EBgO9lqYMZFsFxN9P2IexGF5b9tbFZ9xmPvMwiMISt2tatpZudeRbsx/JUxMC4NFbbMK4phUIqr0OaQ5ebwvo6ZXLEU+pbG9wPyYj5pLHxp8j2pKq1m8gFz+p6FTmVNslbp1ijA4jGSwk1geVPxs7ATv0SnIgNuwK0G/KCMYe802QsKZK+TqpkfD+8RCT6g0cNzZU0wlSrWkD76F55ySWoE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXJaR005bVRjVkVKM3YrdjdGY2llL3MvWjE2bEpscU1LL0REekYrZGxtRTNk?=
 =?utf-8?B?dHdpTk1FODFWaVByMTA4SG9FcXZDMDVMTU9qTGlNQnhjcGZhblFKNldjM25B?=
 =?utf-8?B?Y0xvT2ZrZU1ZbUdTcDZkelU1SHVTa29PaHduQVEvRUpldHNiOGJtYTBBWWd4?=
 =?utf-8?B?cXU3bXNwSlVWMXZ1c3FvMzFpVnlkc2Q0RVdhNjJIV21OYnJHL3c3RWQvMm9U?=
 =?utf-8?B?UldDMW0vUnBtVVo4dWlwWmMzLy82STRBbWkvMG83blNwVk0wVk83dEpJZStG?=
 =?utf-8?B?Vld5dWxEUG1UZEdSL283cGZuYVhHREpGN0phanQyMjQ3Y1I0ZDBhZ29YcnFj?=
 =?utf-8?B?YUsyRUZkdmpDdmQyY09OaG9QdVE1ZVBlZkd3Vk9tNzI0ajFjNXVWMlBtTGlP?=
 =?utf-8?B?ZUhhMW1EQzFXUUQrV0djQm9qaysxVDgzT2VGSENlNHJqU3o0TGt5b1pldnVC?=
 =?utf-8?B?dVdaZnBIbVY5cGphNk44NURHSmVRdmZQL2IzRTJKaE5Mb2RRMEVqbHlmbzNP?=
 =?utf-8?B?K1RDbDBUbERTcDVQVUcxRXpwVW41NUtkZDF1VVBMQTZuOGxmM1NzdGJjdDZV?=
 =?utf-8?B?dHREeFhVb29HNERLamRNOXpjTldLWDh5R3htWHVCSUZTSDRJODcvbHdZaWZ3?=
 =?utf-8?B?b1VubEU5a05USEt1d2l2RjBtSmlpanlNaXUzZW9QYWVkWW9tenpIRVM0Yklp?=
 =?utf-8?B?STNYYVNQcW9BZmpQNDlhTDJGNE91K29wNWxnVC9kR0VGaXFjbmxDYnAwVTVX?=
 =?utf-8?B?L0FtUnpPOVdNV3VMeSt3VkNuRTBXN1d3NEdEY2JFcjdncytrMWhWWDFObG1X?=
 =?utf-8?B?S0w0ZDh0bER3VVN5aE9aVTlwRk5GclV1cVlpdndrNHlPa3I4S2pxK09ZSnEv?=
 =?utf-8?B?RHBrVERPeEJ3dEdlcUpYN21laHZsZ25oWnRkZVBldmRDTWNBclJZZm1zd1dI?=
 =?utf-8?B?WG9icE10WlVFZkZidVBtVTlZRFZUN3dpSFVBc3ZEckFBSVNvYnhlLzkvdEpB?=
 =?utf-8?B?RnBubGowZGRQVER4MjZRNkF4dVltY3ZzcnFKQ2NEYldOc2lRUkVCRDNKMnVI?=
 =?utf-8?B?ZEo1K2xPRzQzaElacDNib1FlQ3kxdStjd0JTUjExcE9rY0w0VTV2d2xUZUdC?=
 =?utf-8?B?ZHZDR0s3d0U3bmlJSEoxMUNnMFo5ZUJPRU5FRW9hWlB4SHpYQk1HbVA5NlJw?=
 =?utf-8?B?VENrU3N1ZDJGYnpnYU0ranZJcCtWQXk4aWdzZWo3YU9TcmpFcHhvMm1aTkdy?=
 =?utf-8?B?WHVUbkhDc2gvUlBsYUhYZHA4OWhYM3NnUnlVMjQyNjNkdG5OdW9PaXVGODlX?=
 =?utf-8?B?dVRCWkVYWlpRVnNyQVdicmx0NXQzdVc0OUFQaGZic1Y5MldZY0t0UWJNdVdM?=
 =?utf-8?B?Q0FoZ3IzSWE4YmlacFh6T1NFYVlUZDVmQkM1ZkhFYmtXWGRQVUVnd0tmc3U1?=
 =?utf-8?B?ZXd5dUJad3ZFWFJadU1KNHVJQnQ4RlhkTWJrS2tzempRWUNQcFJoMTk0V29Z?=
 =?utf-8?B?MDlXUkZhdTIydVNnRXVsaEN3NXJaU3RVZ3VBajRwQWF0cDB4NlBtWXlpVG1s?=
 =?utf-8?B?cGs2SHRpeFExYVVnSGoxTFViSDQ1NWl6QXhiL2ZKa0sxTWlSUzgyTjQ3WHZ6?=
 =?utf-8?B?R2VLdHRoS3BpN1UwRlpsMVEzc0FYREhDVERoeVhqeEtjbjRqbDFyOUZnRXNs?=
 =?utf-8?B?bnFUamNyaHAyRzZmcUdnNHlwZGVFY0E0SXFYZi9ldkx4WEI1eTVhYmtjdzBQ?=
 =?utf-8?B?aENobEJnV0xzc2I2bUJIakRVV3lXWXdvZXNRMlU4UWZjVlZJUVRyTGNUNG83?=
 =?utf-8?B?V2hFT3R4Nzc2cVRmSlZDakZWV1NVeDA2QjFaYUcrSDR0Nm52QVd4ejlUd1pS?=
 =?utf-8?B?b2l6V0RPSERSSzRSYVRwNklicUdpNXN1L1dNNjF2akcyOThwaHNMc3VHMXFL?=
 =?utf-8?B?akJWeVhwU3VSbEZqOSt4QkREU3RMUkE3NEdGN3UzNUpqZ3ZxVm5qNEFId3hD?=
 =?utf-8?B?cWRiNWQvVFdYRkpwZ3BxSXBleEhZVjlGS0dXY2NURjBtWms0Qm81dk15TC91?=
 =?utf-8?B?Qi9QWUNMNmx3VnpoVGZDNXQ1S2tpWXdtWU1ZeXA3Q2NhSW1yVml0NExKMjJo?=
 =?utf-8?B?TXJCaEZIWDZxemJtbXl6WDVNZDJJcVE1bTN1bis2TlNhUHlmMWE2dmpsRHhi?=
 =?utf-8?B?WDl2MFNJcVFhblNvK3NEc0tTMWRVSTUxc2g4SEtPTW96djNwSnNMaWhCR2RX?=
 =?utf-8?B?ZENuNmhaenNDRWFyNlF0U2txL2ZMSkIxcisyaVdvdTRDV2ZQaHJ2SS8zWHgv?=
 =?utf-8?B?UkhEYklQMkJTd3RHVThGQUZuTmpLREp2Rm9TYmp4SDhUdWtlR1c1U2xpL00v?=
 =?utf-8?Q?1D9dLBRUu8Pbb/bo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	r4La4qNFfKVHMP4NTxssCBwafdiXQW5V0McdWw2LwSkuLfrIu43LuMOVvWLb1RkhNjsrVgUv6jSMEb43n8xFPgGbOWXLqIGdbtg5zJiYJzRvB+4yIXNo64dLgElZWJ/zuz2i4b1oTfCwFhdZwNiu9v3CzCfZCHHKB5HHWcDBIaHMad0gSnlC1joNgpEaGiQVS3stC3KgfKeX4oMuL0kPs/Gm6ovhZgTZdIJTvlxeq4tuebffxP2NLgcfP40Do4yUqs4tbUBmLtN97qFestAhC5dDWD6MgTIndRPWWBehXGNfoasCQuMZnV+F8p1tC7uI2VWIrrUqoM6re2TwsekJuA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6567208d-8cd4-425b-7298-08dee6c55836
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 01:13:59.5323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wFaNyZ1QASYSNvRArVApja04mZKNobe1j34QvzbWXsmma8PlUGHIezrsRQBZtYThAv/UAD6PqPi+XSiam0PjvZJ5OkI2SohR1O0kSshbzHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7948
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAwOSBTYWx0ZWRfXzgJ6p3elRipr
 L33q+yv99RyND+LrmZ1zhiI8ASLIdNc4zzeAHIcHBT8wXsNosdJ7aMKFO+q8tCqmX/yS7/DxwwL
 vqm8IfPqL4K3Aqtq7ECu0QWGhp5VoQNWPxKVubWry6VS3n0u4Flv
X-Proofpoint-ORIG-GUID: fWD23a_Fg6WkLYtfMSRPv54G0ok7hcNB
X-Authority-Analysis: v=2.4 cv=SMtykuvH c=1 sm=1 tr=0 ts=6a5ec7dd cx=c_pps
 a=hwAR686YzpmZ7aH69gEPcA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ZQxX5BWu6Z8IJBb2zLX7:22 a=gAnH3GRIAAAA:8 a=1Ce2bVN6W5rYORDs8u0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fWD23a_Fg6WkLYtfMSRPv54G0ok7hcNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAwOSBTYWx0ZWRfX7jUqur67n7hM
 I6ZwJ0iq+4LWBU72wphBdDcDn6fdWPqdpON9hV+0EUeoJJNUWR9PglOaQrJIdMtFQX89RkytlMw
 /mQq0gRvKTLA4hhWZloJMXSPyGzBy+CO60dsXZLdtf5FPI/8OumPJiECvAkZtfTHgcV403aHT7X
 StZUiHXh+tXkY+yiilcHL7a3YSZbx5XJkWQ9HJfV17GdFbih4t1lcaiThbuDEw8D31799fKmNRU
 tut0CFqr4JT8J/dRauDjLI0sMiYqEhveTedlFcdmPcnCJ2k8UUo8FbWpww5H186OOJRr1rpQhIF
 tU15eHRIYYMjWYy5+aibfVYtpn8S2Kp6ypm4KYwd12RMlqDcInwRdamBovHp/6/Eo7XdcigrC1P
 9MzjYcCngRJ8hSo96YoU/HOWGQu6l6Gr6TphclVkOIbGNAn566qrRsX1ln7TwqlECmCeHjGPfSv
 CHv+VuSCfV2qqWd9ZdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210009

PiA+PiBbRXh0ZXJuYWxdDQo+ID4+DQo+ID4+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRp
b24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsDQo+ID4+IGlzc3VlKHMpIHRv
DQo+ID4+IGNvbnNpZGVyOg0KPiA+PiAtIFtNZWRpdW1dIFRoZSB2b2x0YWdlIGRpdmlkZXIgc2Nh
bGluZyBjYWxjdWxhdGlvbiBzdWZmZXJzIGZyb20gYQ0KPiA+PiAzMi1iaXQgYWRkaXRpb24gb3Zl
cmZsb3cgYW5kIGFuIHVuc2FmZSA2NC1iaXQgdG8gMzItYml0IHNpZ25lZA0KPiA+PiBpbnRlZ2Vy
IHRydW5jYXRpb24gYmVmb3JlIGNsYW1waW5nLg0KPiA+PiAtLQ0KPiA+Pg0KPiA+PiAtLS0gUGF0
Y2ggWzJdOiBbUEFUQ0ggdjMgMi80XSBod21vbjogKHBtYnVzL21heDIwODMwKTogYWRkIFZPVVQN
Cj4gPj4gZmVlZGJhY2sgcmVzaXN0b3Igc2NhbGluZyBzdXBwb3J0IC0tLSBjb21taXQNCj4gPj4g
YWM4ODg5MzI4NjI4NmM2MzNmMTE3MzY5ZGI5MWMyY2ZmZDE2M2FmZA0KPiA+PiBBdXRob3I6IEFs
ZXhpcyBDemV6YXIgVG9ycmVubyA8YWxleGlzY3plemFyLnRvcnJlbm9AYW5hbG9nLmNvbT4NCj4g
Pj4NCj4gPj4gaHdtb246IChwbWJ1cy9tYXgyMDgzMCk6IGFkZCBWT1VUIGZlZWRiYWNrIHJlc2lz
dG9yIHNjYWxpbmcgc3VwcG9ydA0KPiA+Pg0KPiA+PiBUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIHN1
cHBvcnQgZm9yIGV4dGVybmFsIHZvbHRhZ2UgZGl2aWRlciBzY2FsaW5nDQo+ID4+IHVzaW5nIHRo
ZSBhZGksdm91dC1yZmIxLW9obXMgYW5kIGFkaSx2b3V0LXJmYjItb2htcyBkZXZpY2UgdHJlZQ0K
PiA+PiBwcm9wZXJ0aWVzLiBUaGUgZHJpdmVyIHJlYWRzIHRoZXNlIHZhbHVlcyBhbmQgYXBwbGll
cyB0aGUgc2NhbGluZyBmb3JtdWxhIHRvDQo+IHRoZSByYXcgVk9VVCByZWFkaW5nLg0KPiA+Pg0K
PiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcG1idXMvbWF4MjA4MzAuYw0KPiA+Pj4g
Yi9kcml2ZXJzL2h3bW9uL3BtYnVzL21heDIwODMwLmMgaW5kZXgNCj4gY2IyYzIzNjcyMTY2ZC4u
N2E1ZTY3YmQzM2MwYQ0KPiA+Pj4gMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2h3bW9uL3Bt
YnVzL21heDIwODMwLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvbWF4MjA4MzAu
Yw0KPiA+Pg0KPiA+PiBbIC4uLiBdDQo+ID4+DQo+ID4+PiArc3RhdGljIGludCBtYXgyMDgzMF9y
ZWFkX3dvcmRfZGF0YShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LCBpbnQgcGFnZSwNCj4gPj4+
ICsJCQkJICAgaW50IHBoYXNlLCBpbnQgcmVnKQ0KPiA+Pj4gK3sNCj4gPj4+ICsJY29uc3Qgc3Ry
dWN0IHBtYnVzX2RyaXZlcl9pbmZvICppbmZvID0gcG1idXNfZ2V0X2RyaXZlcl9pbmZvKGNsaWVu
dCk7DQo+ID4+PiArCWNvbnN0IHN0cnVjdCBtYXgyMDgzMF9kYXRhICpkYXRhID0gY29udGFpbmVy
X29mKGluZm8sIHN0cnVjdA0KPiA+PiBtYXgyMDgzMF9kYXRhLCBpbmZvKTsNCj4gPj4+ICsJaW50
IHJldDsNCj4gPj4+ICsNCj4gPj4+ICsJc3dpdGNoIChyZWcpIHsNCj4gPj4+ICsJY2FzZSBQTUJV
U19SRUFEX1ZPVVQ6DQo+ID4+PiArCQlyZXQgPSBwbWJ1c19yZWFkX3dvcmRfZGF0YShjbGllbnQs
IHBhZ2UsIHBoYXNlLCByZWcpOw0KPiA+Pj4gKwkJaWYgKHJldCA8IDApDQo+ID4+PiArCQkJcmV0
dXJuIHJldDsNCj4gPj4+ICsNCj4gPj4+ICsJCS8qIEFwcGx5IHZvbHRhZ2UgZGl2aWRlciBzY2Fs
aW5nIGlmIHJlc2lzdG9ycyBhcmUgbm9uLXplcm8gKi8NCj4gPj4+ICsJCWlmIChkYXRhLT52b3V0
X3JmYjEgJiYgZGF0YS0+dm91dF9yZmIyKSB7DQo+ID4+PiArCQkJcmV0ID0gRElWX1JPVU5EX0NM
T1NFU1RfVUxMKCh1NjQpcmV0ICogKGRhdGEtDQo+ID4+PiB2b3V0X3JmYjEgKw0KPiA+Pj4gKwkJ
CQkJCSAgICBkYXRhLT52b3V0X3JmYjIpLCBkYXRhLQ0KPiA+Pj4gdm91dF9yZmIyKTsNCj4gPj4+
ICsJCQlyZXQgPSBjbGFtcF92YWwocmV0LCAwLCAweEZGRkYpOw0KPiA+Pg0KPiA+PiBbU2V2ZXJp
dHk6IE1lZGl1bV0NCj4gPj4gQ2FuIHRoaXMgY2FsY3VsYXRpb24gc3VmZmVyIGZyb20gYSAzMi1i
aXQgYWRkaXRpb24gb3ZlcmZsb3cgYW5kIGFuDQo+ID4+IHVuc2FmZSA2NC1iaXQgdG8gMzItYml0
IHNpZ25lZCBpbnRlZ2VyIHRydW5jYXRpb24/DQo+ID4+DQo+ID4+IElmIGRhdGEtPnZvdXRfcmZi
MSBhbmQgZGF0YS0+dm91dF9yZmIyIHN1bSB0byBtb3JlIHRoYW4gMl4zMiAtIDEsIHRoZQ0KPiA+
PiAzMi1iaXQgYWRkaXRpb24gd2lsbCB3cmFwIGFyb3VuZCBiZWZvcmUgdGhlIDY0LWJpdCBtdWx0
aXBsaWNhdGlvbi4NCj4gPj4NCj4gPj4gQWRkaXRpb25hbGx5LCBzaW5jZSByZXQgaXMgYSBzaWdu
ZWQgMzItYml0IGludGVnZXIsIGlmIHRoZSA2NC1iaXQNCj4gPj4gcmVzdWx0IHJldHVybmVkIGZy
b20gRElWX1JPVU5EX0NMT1NFU1RfVUxMIGV4Y2VlZHMgMl4zMSAtIDEsIHRoZQ0KPiA+PiBhc3Np
Z25tZW50IHRvIHJldCB3aWxsIG92ZXJmbG93IGludG8gYSBuZWdhdGl2ZSBpbnRlZ2VyLiBUaGUN
Cj4gPj4gY2xhbXBfdmFsKCkgbWFjcm8gd2lsbCB0aGVuIGV2YWx1YXRlIHRoaXMgbmVnYXRpdmUg
bnVtYmVyIGFuZCBpbmNvcnJlY3RseQ0KPiBjbGFtcCBpdCB0byAwIGluc3RlYWQgb2YgMHhGRkZG
Lg0KPiA+Pg0KPiA+DQo+ID4gQWx0aG91Z2ggdGVjaG5pY2FsbHkgY29ycmVjdCwgaXMgc2FzaGlr
byBhIGJpdCBwYXJhbm9pZD8NCj4gPiBGZWVkYmFjayByZXNpc3RvcnMgd29uJ3QgdHlwaWNhbGx5
IHJlYWNoIHRob3NlIHZhbHVlcy4NCj4gPg0KPiANCj4gSXQgZG9lcyB3aGF0IGl0IGlzIGFza2Vk
IHRvIGRvLCB3aGljaCBmb3IgaHdtb24gZHJpdmVycyBpcyB0byBleHBsaWNpdGx5IGNoZWNrIGZv
cg0KPiBvdmVyLSBhbmQgdW5kZXJmbG93cyBiZWNhdXNlIHRob3NlIGhhcHBlbiBzdXJwcmlzaW5n
bHkgb2Z0ZW4gaW4gaHdtb24NCj4gZHJpdmVycy4gVGhlcmUgaXMgYSByZWFzb24gd2h5IG1vcmUg
dGhhbiA1MCBwYXRjaGVzIGluIGRyaXZlcnMvaHdtb24gaGF2ZQ0KPiBlaXRoZXIgIm92ZXJmbG93
IiBvciAidW5kZXJmbG93IiBpbiB0aGUgc3ViamVjdCBsaW5lLg0KPiANCg0KSSBzZWUsIHdpbGwg
aW1wcm92ZSB0aGlzIHBhcnQuIEknbGwgYmUgbW9yZSBtaW5kZnVsIG9mIHRoaXMuDQoNClRoYW5r
cywNCkFsZXhpcw0K
