Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E17D48A2C7;
	Fri, 11 Sep 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134794; cv=fail; b=XYorGH4/InUgLGShGrlWOIWhpkfAUd+IKZ3VL4PAGkhxFQXxfuvIVjuMDz2/6ELbRxs9uGXzWpQtX8jhIF+m22PDadtLTLNeVl/FzDauS5ERPoo1Ryc2exs08hwjQLjerV1ohBExS+kU8HWiCyzlYr5kiSJg+y96NHpFyeytqT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134794; c=relaxed/simple;
	bh=5OrxfAy1nN4YLFEerIBK4C0KJWzjOtD1WxHfbBWIIWM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HkXJp4sHvI+2WLzDqb2AOTcn+2W+LNM/q9LtbTIAfP9ruGXFqItUgBnfY6p/CIyTTgkI3uDvHkjlkNI3cU+SkfWBwRkB4N5+QE99ie9K9AQXu8ibHlhydc96zVtA9jqIaAu1AT9Fi01RbHnUSEhaaQD+QdhyYFyRNWmyK1ZlI+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=bIYKv96+; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="bIYKv96+"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCj0iK458972;
	Fri, 11 Sep 2026 09:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=1SbDk
	O1gYbEPz9uBIow3V58F7qp0S8aW1yqV26Vmhgs=; b=bIYKv96+DK7kvUNhEZDKX
	b0+nAqCyNGqBnPmewf7sUq92sZ9Xn6fUnMdM95qpSOJ+JrZKwZE5pkGf/CqeX9Fb
	IahBi8jFB/PF5Z8pF4iGPI2a0RNjq9PwH1WkYhOPXF50NeOaOnGgZboESuQ8Ve6p
	3C1yOu08rhynhS93FG0eUb7hxL2NIcztoBF8H2ih/Ww78f7UVELtUzptx/SL6BX0
	Cs4ktmV1OVg3fqsXUWo/bLZPE6Ttdw0gFN8Xeeqsd5DG9J79cMAa3P9ezR4NqEsO
	VGayQTvUdEVIRBaDFz+SoWq/i/7nxWHB7GzA2mkBW1AVo2TAusDd3l14Uu77XcHH
	g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcx8qtme-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:52:43 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Orj0c45jIc8odK2q8uB89srrNAmQ/5owmaAiuTEu5d8SgLCcetQMpJlKhgtM30SsV5yV569U9rhi4pzrw4DC5Ej72qjOgNdupuEnn2SS2B/GUR/oCTER1yLwXiwrNM2wnfPvHSlQAGdUj7j7AbomASMr0TgKJfSxTTJJJhQTrO51dj5k8JsNTqA/ezANWYqvcNN/8xKtwfovPkfGo3e0BKBO7pigLgHVKYn/k4NwW/vqTvskrnD5F0xsRc379qH9lY8f89OSk/tAlwQwRzws45R5X7A0QWXL3JPVr6PakMJS0ovhxwu/uN2w3rnLIUWpw6xh33SmkVh9HPmsYgcxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SbDkO1gYbEPz9uBIow3V58F7qp0S8aW1yqV26Vmhgs=;
 b=EjNUsEmjtCQpmQR63PbSWpqitiCa5LxdcLq1l6Pg530CzAYbyy103+FwjBHthGC+vDQ8hVImuxziSid4wG0Nb4Q0K6S0IMxdIQIx5Eh8GaVbPLGfzclPTvrrxgTfyOQiYmV7XdQYgkTRdn4S54fSYWR/EKUw/5kOWoZOOuc0YZ8Rc1N1TqHWum42gry/gzEgnhWc3LBLEiIGKhZoLpH0ki24uT1jSM5tLdG3xgkYNkXwS1lV4tUv0jf9b4xx4XE5eMLscekJmq5sL98CCebtG85/hpvWx1Z6me0MAlLTQBanVu4GDYsBWybYD3WUeOesgJRedYGUbLE5ytx1LsEgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MWHPR03MB989357.namprd03.prod.outlook.com (2603:10b6:303:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 13:52:40 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:52:40 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Fri, 11 Sep 2026 14:53:40 +0100
Subject: [PATCH v2 4/4] hwmon: (pmbus) add support for MAX20826 and similar
 devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-hwmon-max20826-support-v2-4-5e30cbd97d84@analog.com>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
In-Reply-To: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134819; l=38497;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=5OrxfAy1nN4YLFEerIBK4C0KJWzjOtD1WxHfbBWIIWM=;
 b=+cqqphdeaFYPTHmsQfX7OR/GvWILCv+TrJRx5+U+0h6U/pS619EoozGte9Soa9BjWfd8vdf6k
 MMYrapFZ7TnAFm7xaq8kwQ3E9utb2PQbwcUYyYKc9g9SrT8ESjbPzT+
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::22) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MWHPR03MB989357:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe243ac-5822-453d-7153-08df100bf1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|6133799003|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QT7Rz5+PtNGxnBOqRuSxe4oO7fsUtbN7iGY9YzuNugnzJgrgu3LAvzK4xQ+gFArfG2ET3VAJWhLxzAHHANZ5imV+4hx5gWWu/dhNPiX9niHqU6LuRfKsF/q3IRrqJC8XB5brHQ9z7lpPj6P66kyxWDzSpbhS4hQpXYmI4xLlzqWP4DUxKM6EkAhkvRV3GC5Pmv5tX0fO/0yU00U1RYADyK3NsVbFgjQ3oRRBkUMm4m4Keb3vTjACun25E7YHd/ADo57X2Kq9WDiWjqSejUahbCVQy2NFPbMdNjccNyJI0ygv8DCiBT3CWNpmDoq8t5B0sULd8/Alw3uPlBr8kQLesrQj8jtHvOhjtPt/UaEKoopKJgSivT9vNJZRnyABo/TQHtXCPnkDB8Fy4/eF6cKDCPnTXrINiVTlMNMHuRXO+yl20jfsMST9DSyKwDBg0JhKnVtRxp4rhu9S/Xx5zMula/PWCqxduIZ9hqb2udULCEfTS/KM0le3cCY2qvdXyc8sq0zARaL5Lvcegm+cc382Ha8P5+tlB4Ibs/kMAM0kUX+w7WsUegiz/3EYJTpEqSMKe23mTp9LFL3lrZUN1zdSS2tpE1YkQlccx7a2AePYLaTV7m9fl+NKGF3cYn3WJjYS3Qujq8g7uyjNwi8RUCC7FAlbquUNYyACVF0qLoxTxhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(6133799003)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUVoUk9tYlVYY09oOC9IRmlueGV2MDVOV1FOMWhOUlB3TFQvVWRSenQxcW5V?=
 =?utf-8?B?NnFJbnJnaW1jUnk0MWJSRjFMaGVlNC9Gb3pMeDB0WEZvYlFxTUtVT25pRkdM?=
 =?utf-8?B?RE0rbUZTZlU4ZWtFdk5KTnVjcFl0d2FQeWkwNEtJcEM0alFsUFpDeFZzODRt?=
 =?utf-8?B?NlhmS3JuQzc3RzRzOCtKekNreGtkUFZKYjhLYktzcUFYL0NPelY3T1RtOFV5?=
 =?utf-8?B?VTNwcEVjWHB0NXdMcWF4WjhFL01FRU9Pa0ZpNjdpTVl2OVdEYnpmc2dXeTEr?=
 =?utf-8?B?blVvQTVUeVFQVzE1Mzk5a05vSVNOcUNHaC8xWTJTRFhPMFNKN2gzL2M5ajE3?=
 =?utf-8?B?ek5DZ25iVll6Y0xvbmZXeHJ3bUthQ0VadGY2SmdxUUlObG40VHo3NUQwUnA2?=
 =?utf-8?B?L2tqN2FWQjROdHJQSWRxNk1GN2NBWmd5WjF0SFJzdit6TUJvZ1BUVDhuTlVu?=
 =?utf-8?B?ODZBSTVoL09VRVpZSzZiak5tc0ZSSXdnWHpEbVIwNkc1Vmg0S2ZaeXh1Vkpa?=
 =?utf-8?B?WjQ2V3QxdzJDZHU3M3ExbEwzUDRNUFk2N2FZcjBFNXV6RExBZC9vZzJMUVd1?=
 =?utf-8?B?MW9idlB3SmwyWk1MUVREZjFSQ1JZU0ZRWGVTRmNJUEUzT20zRWJ2dkNVMUFN?=
 =?utf-8?B?bjdPRWJMaDh0LzkxYldWdWhvaXppRytESFZGd01ZSHRHUmNuUHJaTW9FVnlF?=
 =?utf-8?B?U3RGRC9uODdpY1d4Rnp6b2RZaVVEUlRtVjNheGhocjE0WWhLbStKU1RNWUdU?=
 =?utf-8?B?MEw1NWpVUUhwL0FsSk9meHBNbnBrc0puRkdqaGRFYmhSMWZkRUcwMXlsVUhM?=
 =?utf-8?B?eXB5czBXYWlpNXRGSGVrMzBabFErNlA1elVVRkJSWWVpOS9LQzZMZWl2aDBh?=
 =?utf-8?B?NWFQckdCbERQR2YrMTh2OHEvYXkzTmxXbVczcFRwdEJjY0dXZnI1UVRHU2hM?=
 =?utf-8?B?ZDFyUGl3aG91aUt1UlkvbDMrdXk0alJObWJ3YzFYZ0lFNTQyNmlhVnN4TnVW?=
 =?utf-8?B?b0FYa2JhSSsvclhLSXdCdEZTZDNiVUdMa0Q0enBDcThybGt4eW9lQUpqcnF1?=
 =?utf-8?B?Zll5VkFvV09raUF4SEJpRzF2Q21FT012azBacjN0RzhobDN0OXVhOG5RWFc5?=
 =?utf-8?B?OEpaYU5iVTlTWXJDc0pUcjlBbm0zbmV3MHlHcU9HZFlmUE5Eb1g0NE5HM2Ux?=
 =?utf-8?B?eDdhclJ1c2RKN2hGOVI0emJDTTJMRXMwckFYMytMNGVQdzhmSU9uUUtPTmpa?=
 =?utf-8?B?cUpiWVpUcGFwbThHK0FDenByNHZWVkphWThnaWdWTTlWZDNjeHh2cktUWkRw?=
 =?utf-8?B?Ky9HS1c1NE9lbUlCWmpVN3hteCtiWkRXVC9Mc1FFVERMSVU3aHUxNTdsSnZa?=
 =?utf-8?B?clU2VGpoK2ZXdlJFT3BTZVMvL3JIb2hlTHdWSmVtREZ4aG9EaitHNXZKYUJu?=
 =?utf-8?B?Q1BYTmlJKzdYMHhtSWFVcjJJbWNUTGFobkRlWm16WjZXeG0ybmNUUnlKMjMz?=
 =?utf-8?B?dlRsYlR1ZlVXR2xmYWpRelcrQXV2V0ZtanljR3c5b3M4Zk9RUVlOS0c4THI2?=
 =?utf-8?B?MTZ3RGlGQ0xBbW14UG5WNEhqV3lsUzNvWWVUMjZGOFo0ckZXNm0rc3pPTUUz?=
 =?utf-8?B?NmJDQXVOMWJ4OEZEWitwdXNzWWlscGtDNGRDbUlwQzlUMm5XRjZwNHBxNFNy?=
 =?utf-8?B?UVJhVGJMcit1VWpEYjZQMWE4NTEzYTV2cHFtR280b3NwSUxiTDBEOStIWGt3?=
 =?utf-8?B?RzlsSjBGUDRWb20vVzh6Tk8vaFV2QnBJTnVjSUNoQ1ZlcnhhTFRRYVZ3amZO?=
 =?utf-8?B?bCtvazR2TnNvWUttb21Td24xd0VVRVJ0dWM3dGU5Z1ozeXlPd0VFbHUvemRT?=
 =?utf-8?B?dFJQemNteDdmclA3Q0FqcnVsOEZabmZrekk3NUNrdkVkaEhkR1pqSUx4ekJa?=
 =?utf-8?B?YWNKTzBndlF5R3BsN25LM1RVQWVPSWM5UEdiR09jamVoaGMxQnNHcjJGL0F0?=
 =?utf-8?B?dWhPSUUzV0hFQjRQbUlBMGY3eWh6RkdvamhNN3QxMjZVUjRBYXBGODlwdktl?=
 =?utf-8?B?L3RGV1pONTRQNnpCTmZXOEtxVTVPRzdmSTNURWk3K2k1V3BkRDY1LzZ0UGJM?=
 =?utf-8?B?VmthTDRpbEF0U1pBeGhtR3JpTWx6aWYydHQzZUtYaUdFeUdPM1dUTVY1ZEp0?=
 =?utf-8?B?WTRxU1Z6dnowd0JWTFhsdVQyU0lOYVVoZU5xaStLNkJqVzQ5QWlBUW44dk5K?=
 =?utf-8?B?RjFERGZ4V1FsUHZmL2xMZmxKWGtsUUo4amUvOGhqQTc1cVdGRkRMWnRLWExX?=
 =?utf-8?B?OU5uQ0JrZEMwdkpidHhFOXNMeklDclFCb1BjT2Y5ZWZSaVkwYkhTdz09?=
X-Exchange-RoutingPolicyChecked:
	q5JXNWFbWc0z8JSWlRUyUDasHvoOC6PMuw2DZjy6WMml6Nsz30Ts3qnQX+inK3khyHzA3fC8BR7pn4LYy89D7H+TUCZKwojqm8lCGmHkEd6nLOA8kKpq9D7R60JEuz2bnD2z2eJy9aB6136A8cpxCZJD0Crh44pcmSO4XyYzJL7yntjlLKjNEN9mgVKieGut9bW4/djAxqZIrkAnHPfHoV3IIKodStRh5A5tvEZNo3g1+oLR+IPGWtLKGUuna8IOm06AORl0h1dENuRPqPMwGziQuQbVdtdSNl5aTsrEXQ6vN9hX/UBj3r3LzJisUdksLunmY8pRODo66qPZAiwnDg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe243ac-5822-453d-7153-08df100bf1db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:52:40.1514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsBzNSmlefXSmVcM8I2/Dfwz5hoMf0srbg84d8Q0OqLWZTbK3XjSdq8xLfCzx9IstksHQwZ7HnDpZnH0f24WYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989357
X-Proofpoint-GUID: 8JcFrqVZuRNgW2KsVAKow2jl4vqUnHvE
X-Authority-Analysis: v=2.4 cv=JaApPkKV c=1 sm=1 tr=0 ts=6aa407ac cx=c_pps
 a=utdtqqQbqC3rwi1NYZt6Rw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pdorWlH7UUdCa_9Y6wQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 8JcFrqVZuRNgW2KsVAKow2jl4vqUnHvE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfX31j1BPY9bOV5
 c2NejtgjxqyJjvnOQRAfQrC+rGkO6RMZ9ce41F0cgDBYDpgfb1ZyiI8znyo7M6Hi2wUEm3JHbp3
 m+LqdDs5KhqwSgUwXLzScm2AmWae92AWQ9DmUcEifBdHfvTH4AM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfXwgWzCWhXEau7
 3bIu7HKxyc6NPyXh28SLjQD1GEMAIElAD1gjkCHkmEQGGiWrppoE1aJMp+3zZrJJrlRSGpNQOkS
 vWZfrjYT3kn/aMVRN+gLIc0Zbu5sgY5qI1ojOfzr5K/KAcjwt7vyLPqmEnHHXIWQjMDZ4/tNRmA
 XRmDthfx8znLdnvofEoDfpOuLZ2ZiEsfKEPqKWKtphfY4QcAW2+ZFNu7VNt+FOP7X2HRedVEwmK
 RcYi67v23cb6h67xOdr29OH7GP7zfE0wfiJQ5RKnYYk9m4sBRwkXkOFagtAlrc05AFlTzgY6+RT
 DdV54FiOTzPIWylHx50GwEJAx+ecE86KwHsGMvqnzftAfWZaejjYLrLXDC02vIgJ303kndMBqBZ
 0lvVL0OznqIEI0tpl4/vjdkMrB30Z0MSLLtG+yl/d8G1jbNQJ96NKG4rghsaThGWDsPusAfz8fl
 f9Admo58rg1zuQmXchQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110193

The MAX20826 IC and similar provide a high-density, flexible and scalable
dual-loop solution for high current cores for AI applications. These are
dual loop solutions multiphase voltage regulators. Between Rails A and B,
MAX20855B and MAX20908 supports up to 8 phases total configurable from
8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.

Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 Documentation/hwmon/index.rst    |    1 +
 Documentation/hwmon/max20826.rst |  139 +++++
 MAINTAINERS                      |    2 +
 drivers/hwmon/pmbus/Kconfig      |   19 +
 drivers/hwmon/pmbus/Makefile     |    1 +
 drivers/hwmon/pmbus/max20826.c   | 1044 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 1206 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 7ab9cfe71cee..21ad419fcbf1 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -167,6 +167,7 @@ Hardware Monitoring Kernel Drivers
    max197
    max20730
    max20751
+   max20826
    max20830
    max20860a
    max31722
diff --git a/Documentation/hwmon/max20826.rst b/Documentation/hwmon/max20826.rst
new file mode 100644
index 000000000000..bcabbc64c039
--- /dev/null
+++ b/Documentation/hwmon/max20826.rst
@@ -0,0 +1,139 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver max20826
+======================
+
+Supported chips:
+
+  * Analog Devices MAX20826
+
+    Prefix: 'max20826'
+
+    Addresses scanned: -
+
+    Datasheet: Datasheet is not publicly available.
+
+  * Analog Devices MAX20855B
+
+    Prefix: 'max20855b'
+
+    Addresses scanned: -
+
+    Datasheet: Datasheet is not publicly available.
+
+  * Analog Devices MAX20908
+
+    Prefix: 'max20908'
+
+    Addresses scanned: -
+
+    Datasheet: Datasheet is not publicly available.
+
+  * Analog Devices MAX20912
+
+    Prefix: 'max20912'
+
+    Addresses scanned: -
+
+    Datasheet: Datasheet is not publicly available.
+
+  * Analog Devices MAX20916
+
+    Prefix: 'max20916'
+
+    Addresses scanned: -
+
+    Datasheet: Datasheet is not publicly available.
+
+Author:
+
+  - Nuno Sá <nuno.sa@analog.com>
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for Analog Devices MAX20826,
+MAX20855B, MAX20908, MAX20912, and MAX20916 multiphase voltage regulator
+controllers with PMBus interface.
+
+The devices are dual-loop, multiphase controllers. Depending on the device and
+configuration, the high-speed processor voltage-control interface can be
+Nvidia PWMVID, Intel SVID, AMD SVI3, or AVSBus. PMBus is used for monitoring,
+configuration, status, and fault reporting.
+
+The driver detects whether the device uses PMBus page mode or direct address
+mode. In direct address mode, rail B is accessed at the rail A I2C address plus
+one. If rail B is present, the driver exposes a second PMBus page.
+
+The driver detects the active number of phases and exposes per-phase input and
+output current attributes through the PMBus virtual phase support.
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+The optional ``avren`` and ``bvren`` GPIOs may be provided to control the rail A
+and rail B hardware enable pins. If regulator support is enabled, the rails are
+also registered through the PMBus regulator framework.
+
+The source of the output voltage of each rail, i.e. either the high-speed
+processor voltage-control interface or PMBus, is normally selected once, before
+the processor boots. Hence it is described in firmware with the
+``adi,rail-a-high-speed`` and ``adi,rail-b-high-speed`` properties. If the
+property is not given for a rail, PMBus controls its output voltage.
+
+Sysfs entries
+-------------
+
+The following attributes are supported. Limits, alarms, and per-phase entries
+are exposed depending on device capabilities, rail configuration, and detected
+phase count.
+
+=========================== ================================================
+in1_label                   "vin"
+in1_input                   Measured input voltage
+in1_alarm                   Input voltage alarm
+in[2-3]_label               "vout[1-2]"
+in[2-3]_input               Measured output voltage
+in[2-3]_alarm               Output voltage alarm
+currX_label                 "iinN", "iinN.P", "ioutN", or "ioutN.P"
+currX_input                 Measured input/output current
+currX_alarm                 Current alarm
+powerX_label                "pinN" or "poutN"
+powerX_input                Measured input/output power
+temp[1-2]_input             Measured temperature
+temp[1-2]_alarm             Temperature alarm
+=========================== ================================================
+
+Notes
+-----
+
+``N`` is the rail number, starting at 1. ``P`` is the phase number, starting at
+0. The exact ``currX`` indices depend on the number of present rails and on the
+detected phase count.
+
+Debugfs entries
+---------------
+
+In addition to the entries provided by the PMBus core, the following entries are
+available for debug purposes only. They are not part of any ABI and may change
+or go away at any time.
+
+=========================== ================================================
+in[2-3]_high_speed_en       Enable high-speed voltage-control interface
+in_high_speed_bus           Active high-speed voltage-control interface
+=========================== ================================================
+
+``in[2-3]_high_speed_en`` is a per-rail read/write entry matching the standard
+hwmon voltage channels for the output rails. ``in2_high_speed_en`` controls rail
+A / ``vout1``. ``in3_high_speed_en`` controls rail B / ``vout2`` and is only
+present if rail B is detected. Writing 1 selects the high-speed voltage-control
+interface for that rail; writing 0 selects PMBus voltage control.
+
+``in_high_speed_bus`` is a read-only entry reporting the high-speed interface
+used by the device, for example ``Nvidia PWMVID``, ``Intel SVID``, ``AMD SVI3``,
+or ``AVSBus``.
diff --git a/MAINTAINERS b/MAINTAINERS
index a8ae7af72099..f64401e56e88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16010,6 +16010,8 @@ L:	linux-hwmon@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
+F:	Documentation/hwmon/max20826.rst
+F:	drivers/hwmon/pmbus/max20826.c
 
 MAX20830 HARDWARE MONITOR DRIVER
 M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index bcfdc4ce4c10..3289ab50a028 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -393,6 +393,25 @@ config SENSORS_MAX20751
 	  This driver can also be built as a module. If so, the module will
 	  be called max20751.
 
+config SENSORS_MAX20826
+	tristate "Analog Devices MAX20826 and similar devices"
+	help
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices MAX20826 and similar devices.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called max20826.
+
+config SENSORS_MAX20826_REGULATOR
+	bool "Regulator support for Analog Devices MAX20826 and similar devices"
+	depends on SENSORS_MAX20826 && REGULATOR
+	help
+	  If you say yes here you get regulator support for Analog Devices
+	  MAX20826 and similar sensors.
+
+	  This enables the MAX20826 to be used as a regulator device,
+	  providing voltage control through the regulator framework.
+
 config SENSORS_MAX20830
 	tristate "Analog Devices MAX20830 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index e288fe72a437..e3fc23f88401 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
 obj-$(CONFIG_SENSORS_MAX17616)	+= max17616.o
 obj-$(CONFIG_SENSORS_MAX20730)	+= max20730.o
 obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
+obj-$(CONFIG_SENSORS_MAX20826)	+= max20826.o
 obj-$(CONFIG_SENSORS_MAX20830)	+= max20830.o
 obj-$(CONFIG_SENSORS_MAX20860A)	+= max20860a.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
diff --git a/drivers/hwmon/pmbus/max20826.c b/drivers/hwmon/pmbus/max20826.c
new file mode 100644
index 000000000000..013a97189fde
--- /dev/null
+++ b/drivers/hwmon/pmbus/max20826.c
@@ -0,0 +1,1044 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Hardware monitoring driver for Analog Devices MAX20826 PMBus device
+ *
+ * Copyright 2026 Analog Devices Inc.
+ */
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+#include <linux/property.h>
+#include <linux/regulator/driver.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "pmbus.h"
+
+#define MAX20826_REG_RAIL_PHASE_CFG	0xB1
+#define MAX20826_REG_CTRL_MISC		0xCB
+#define MAX20826_OPL_EN_MSK		BIT(7)
+
+#define MAX20826_REG_VOUT_RES		0xDB
+#define MAX20826_VOUT_RES_MSK		BIT(7)
+
+#define MAX20855B_REG_VOUT_VRM		0xD1
+#define MAX20855B_REG_VOUT_VRM_MASK	BIT(4)
+
+#define MAX20826_REG_C_MODEAB		0xDC
+/* Byte 1 bits 7 and 6*/
+#define MAX20826_C_MODEAB_MASK		GENMASK(15, 14)
+
+#define MAX20826_REG_ADDR_MODE		0xEC
+#define MAX20826_PAGE_MODE_MSK		BIT(7)
+#define MAX20826_DIRECT_ADDR_MSK	GENMASK(6, 0)
+
+#define MAX20826_REG_OVERRIDE		0xED
+#define MAX20826_OVERRIDE_MASK		BIT(7)
+
+#define MAX20826_REG_PHASE_DETECT	0xF3
+#define MAX20826_REG_PHASE_READ		0xF4
+
+#define MAX20826_REG_STATUS_MON		0xF9
+#define MAX20826_PHASES_NUM_MASK	GENMASK(7, 3)
+
+#define MAX20826_MAX_PAGES		2
+#define MAX20826_MAX_PHASES		16
+#define MAX20826_PHASES_PER_PAGE	8
+#define MAX20826_INTF_PWMVID		1
+#define MAX20826_INTF_AVSBUS		3
+
+#define MAX20855B_PHASES_NUM_MASK	GENMASK(7, 4)
+#define MAX20855B_MAX_PHASES		8
+#define MAX20908_MAX_PHASES		8
+#define MAX20912_MAX_PHASES		12
+#define MAX20916_MAX_PHASES		16
+
+struct max20826_chip_info {
+	const char *vendor_bus_name;
+	u8 max_phases;
+	unsigned int phase_num_mask;
+	u8 start_index_iin;
+	u8 start_index_iout;
+	bool is_reg_addr_mode_block;
+	bool is_vout_direct;
+	bool select_vrm;
+	bool has_avsbus;
+	bool has_opl;
+	u8 (*count_phases)(const u8 *config, int page);
+};
+
+struct max20826 {
+	const struct max20826_chip_info *chip_info;
+	struct pmbus_driver_info info;
+	struct i2c_client *client;
+	/* RAIL-B direct mode */
+	struct i2c_client *client_b;
+	struct i2c_client *curr_client;
+	struct gpio_desc *avren;
+	struct gpio_desc *bvren;
+	bool vendor_bus;
+	bool high_speed[MAX20826_MAX_PAGES];
+	bool on_off_ctrl[MAX20826_MAX_PAGES];
+	bool opl_enabled[MAX20826_MAX_PAGES];
+};
+
+struct max20826_debugfs_entry {
+	struct max20826 *st;
+	u8 page;
+};
+
+static u8 __max20826_count_phases(const u8 *config, int page)
+{
+	if (page)
+		return hweight8(config[4]);
+
+	return hweight8(config[0]) + hweight8(config[1]) -
+	       hweight8(config[4]);
+}
+
+static u8 __max20855b_count_phases(const u8 *config, int page)
+{
+	if (page)
+		return hweight8(config[3] & 0x3F);
+
+	return hweight8(config[0]) + hweight8(config[1] & 0x0F) -
+	       hweight8(config[3] & 0x3F);
+}
+
+static u8 __max20908_count_phases(const u8 *config, int page)
+{
+	if (page)
+		return hweight8(config[4]);
+
+	return hweight8(config[0]) + hweight8(config[1] & 0xF0) -
+	       hweight8(config[4]);
+}
+
+static u8 __max20912_count_phases(const u8 *config, int page)
+{
+	if (page)
+		return hweight8(config[4]);
+
+	return hweight8(config[0]) + hweight8(config[1] & 0xFC) -
+	       hweight8(config[4]);
+}
+
+#define to_max20826(p)	container_of(p, struct max20826, info)
+
+enum {
+	RAIL_A,
+	RAIL_B,
+};
+
+static const struct regulator_desc __maybe_unused max20826_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+	PMBUS_REGULATOR("vout", 1),
+};
+
+static struct i2c_client *max20826_select_rail(struct max20826 *st,
+					       int page, bool probing)
+{
+	int ret;
+
+	/*
+	 * If in direct mode and we want RAIL_B (page 1) just return client_b.
+	 * Otherwise, set the proper page (if page mode) and return RAIL_A.
+	 */
+	if (st->client_b) {
+		/* if 0xff just return the last client */
+		if (page < 0)
+			return st->curr_client;
+		if (page)
+			st->curr_client = st->client_b;
+		else
+			st->curr_client = st->client;
+
+		return st->curr_client;
+	}
+
+	if (!probing)
+		ret = pmbus_set_page(st->client, page, 0xff);
+	else
+		ret = i2c_smbus_write_byte_data(st->client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return st->client;
+}
+
+static int max20826_rail_read_block_data(struct i2c_client *rail, u8 reg,
+					 u8 *block, u8 min_len)
+{
+	int ret;
+
+	ret = pmbus_read_smbus_i2c_block_data(rail, reg, block);
+	if (ret < 0)
+		return ret;
+	if (ret < min_len)
+		return -EIO;
+
+	return ret;
+}
+
+static int __max20826_read_block_data(struct max20826 *st, int page, u8 reg,
+				      u8 *block, u8 min_len)
+{
+	struct i2c_client *rail;
+
+	rail = max20826_select_rail(st, page, false);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	return max20826_rail_read_block_data(rail, reg, block, min_len);
+}
+
+static int __max20826_read_byte_data(struct max20826 *st, int page, int reg)
+{
+	struct i2c_client *rail;
+
+	rail = max20826_select_rail(st, page, false);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	return i2c_smbus_read_byte_data(rail, reg);
+}
+
+static int __max20826_write_byte_data(struct max20826 *st, int page, int reg,
+				      u8 value)
+{
+	struct i2c_client *rail;
+
+	rail = max20826_select_rail(st, page, false);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	return i2c_smbus_write_byte_data(rail, reg, value);
+}
+
+static int __max20826_read_word_data(struct max20826 *st, int page, int reg)
+{
+	struct i2c_client *rail;
+
+	rail = max20826_select_rail(st, page, false);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	return i2c_smbus_read_word_data(rail, reg);
+}
+
+/*
+ * @rail is the already selected rail client and is only given during probe,
+ * where the PMBus core cannot be used yet. Otherwise, pass NULL and let the
+ * core dispatch through our own read_byte_data()/write_byte_data() callbacks,
+ * which take care of selecting the rail.
+ */
+static int max20826_set_high_speed(struct max20826 *st, struct i2c_client *rail,
+				   u8 page, bool high_speed)
+{
+	u8 reg, mask, val;
+	int ret;
+
+	if (st->vendor_bus) {
+		reg = MAX20826_REG_OVERRIDE;
+		mask = MAX20826_OVERRIDE_MASK;
+		val = high_speed ? 0 : FIELD_PREP(MAX20826_OVERRIDE_MASK, 1);
+	} else {
+		reg = PMBUS_OPERATION;
+		mask = PB_OPERATION_CONTROL_V_SRC;
+		val = high_speed ? FIELD_PREP(PB_OPERATION_CONTROL_V_SRC, MAX20826_INTF_AVSBUS) : 0;
+	}
+
+	if (!rail) {
+		ret = pmbus_update_byte_data(st->client, page, reg, mask, val);
+	} else {
+		ret = i2c_smbus_read_byte_data(rail, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = i2c_smbus_write_byte_data(rail, reg, (ret & ~mask) | val);
+	}
+
+	if (ret)
+		return ret;
+
+	st->high_speed[page] = high_speed;
+
+	return 0;
+}
+
+static int max20826_read_curr(struct max20826 *st, int page, int phase, int reg)
+{
+	u8 val_out[I2C_SMBUS_BLOCK_MAX], start_byte;
+	struct i2c_client *rail;
+	int ret;
+
+	if (phase == 0xff)
+		return __max20826_read_word_data(st, page, reg);
+
+	/*
+	 * On Rail_A phases are ascending (from 1) while on RAIL_B they
+	 * are descending (from 16).
+	 */
+	if (!page)
+		phase += 1;
+	else
+		phase = st->chip_info->max_phases - phase;
+
+	/* phase detect and read are only available on RAIL_A */
+	rail = max20826_select_rail(st, RAIL_A, false);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	ret = i2c_smbus_write_byte_data(rail, MAX20826_REG_PHASE_DETECT, phase);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * For MAX20826: Byte 2:3 is for phase IOUT 4:5 is for phase IIN.
+	 * For other chips: Byte 0:1 is for phase IOUT 2:3 is for phase IIN.
+	 */
+	if (reg == PMBUS_READ_IIN)
+		start_byte = st->chip_info->start_index_iin;
+	else
+		start_byte = st->chip_info->start_index_iout;
+
+	ret = max20826_rail_read_block_data(rail, MAX20826_REG_PHASE_READ,
+					    val_out, start_byte + 2);
+	if (ret < 0)
+		return ret;
+
+	return get_unaligned_le16(&val_out[start_byte]);
+}
+
+static int max20826_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max20826 *st = to_max20826(info);
+
+	switch (reg) {
+	case PMBUS_READ_IIN:
+	case PMBUS_READ_IOUT:
+		return max20826_read_curr(st, page, phase, reg);
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		if (!st->chip_info->has_opl || !st->opl_enabled[page])
+			return __max20826_read_word_data(st, page, reg);
+		return -EIO;
+	case PMBUS_POUT_OP_FAULT_LIMIT:
+		/*
+		 * If Over Power Limit is enabled, PMBUS_IOUT_OC_FAULT_LIMIT
+		 * shows the power limit and hence we need to report it
+		 * properly in Watts.
+		 */
+		if (!st->chip_info->has_opl)
+			return __max20826_read_word_data(st, page, reg);
+
+		if (st->opl_enabled[page])
+			return __max20826_read_word_data(st, page,
+							 PMBUS_IOUT_OC_FAULT_LIMIT);
+		return -EIO;
+	default:
+		if (reg >= PMBUS_VIRT_BASE)
+			return -EOPNOTSUPP;
+		return __max20826_read_word_data(st, page, reg);
+	}
+}
+
+static int max20826_write_word_data(struct i2c_client *client, int page,
+				    int reg, u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max20826 *st = to_max20826(info);
+	struct i2c_client *rail;
+
+	rail = max20826_select_rail(st, page, false);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	return i2c_smbus_write_word_data(rail, reg, word);
+}
+
+static int max20826_regulator_do_enable(struct max20826 *st,
+					struct i2c_client *rail, u8 page,
+					u8 byte)
+{
+	/*
+	 * If AVSBus is enabled (bits 5 and 4 set) the device refuses to set bit
+	 * 7 of the OPERATION register. Hence, to workaround this, we first
+	 * clear the bits and then set them all together.
+	 */
+	if (st->chip_info->has_avsbus && !st->vendor_bus && st->high_speed[page] &&
+	    PB_OPERATION_CONTROL_ON & byte) {
+		u8 __byte = byte & ~(PB_OPERATION_CONTROL_V_SRC | PB_OPERATION_CONTROL_ON);
+		int ret;
+
+		ret = i2c_smbus_write_byte_data(rail, PMBUS_OPERATION, __byte);
+		if (ret < 0)
+			return ret;
+	}
+
+	return i2c_smbus_write_byte_data(rail, PMBUS_OPERATION, byte);
+}
+
+static int max20826_regulator_enable(struct max20826 *st, int page, u8 byte)
+{
+	struct i2c_client *rail;
+
+	rail = max20826_select_rail(st, page, false);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	if (page)
+		gpiod_set_value_cansleep(st->bvren, !!(PB_OPERATION_CONTROL_ON & byte));
+	else
+		gpiod_set_value_cansleep(st->avren, !!(PB_OPERATION_CONTROL_ON & byte));
+
+	return max20826_regulator_do_enable(st, rail, page, byte);
+}
+
+static int max20826_write_byte_data(struct i2c_client *client, int page,
+				    int reg, u8 byte)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max20826 *st = to_max20826(info);
+
+	switch (reg) {
+	case PMBUS_OPERATION:
+		return max20826_regulator_enable(st, page, byte);
+	default:
+		return __max20826_write_byte_data(st, page, reg, byte);
+	}
+}
+
+static int max20826_write_byte(struct i2c_client *client, int page, u8 byte)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max20826 *st = to_max20826(info);
+	struct i2c_client *rail;
+
+	rail = max20826_select_rail(st, page, false);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	return i2c_smbus_write_byte(rail, byte);
+}
+
+static int max20826_regulator_enabled(struct max20826 *st, int page)
+{
+	struct gpio_desc *gpio = page ? st->bvren : st->avren;
+	int on, ret;
+
+	if (gpio) {
+		on = gpiod_get_value_cansleep(gpio);
+		if (on < 0)
+			return on;
+	} else {
+		/* If the gpios are not given, just assume it's on */
+		on = 1;
+	}
+
+	ret = __max20826_read_byte_data(st, page, PMBUS_OPERATION);
+	if (ret < 0)
+		return ret;
+
+	if (st->on_off_ctrl[page])
+		on = (PB_OPERATION_CONTROL_ON & ret) && on;
+
+	ret &= ~PB_OPERATION_CONTROL_ON;
+	return ret | FIELD_PREP(PB_OPERATION_CONTROL_ON, on);
+}
+
+static int max20826_iout_status(struct max20826 *st, int page)
+{
+	int status;
+
+	status = __max20826_read_byte_data(st, page, PMBUS_STATUS_IOUT);
+	if (status < 0 || !st->chip_info->has_opl)
+		return status;
+
+	/*
+	 * If Over power limit is on, the fault condition is still set on the OC
+	 * bit
+	 */
+	if (st->opl_enabled[page] && (status & PB_IOUT_OC_FAULT))
+		return status | PB_POUT_OP_FAULT;
+
+	return status;
+}
+
+static int max20826_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max20826 *st = to_max20826(info);
+
+	switch (reg) {
+	case PMBUS_OPERATION:
+		return max20826_regulator_enabled(st, page);
+	case PMBUS_STATUS_IOUT:
+		return max20826_iout_status(st, page);
+	default:
+		return __max20826_read_byte_data(st, page, reg);
+	}
+}
+
+static int max20826_read_block_data(struct i2c_client *client, int page, u8 reg,
+				    char *data_buf)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max20826 *st = to_max20826(info);
+
+	switch (reg) {
+	case PMBUS_MFR_ID:
+	case PMBUS_MFR_MODEL:
+		return __max20826_read_block_data(st, page, reg, data_buf, 16);
+	case PMBUS_MFR_REVISION:
+		return __max20826_read_block_data(st, page, reg, data_buf, 2);
+	case PMBUS_MFR_DATE:
+		return __max20826_read_block_data(st, page, reg, data_buf, 8);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static struct pmbus_driver_info max20826_default_info = {
+	.pages = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		   PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+		   PMBUS_PHASE_VIRTUAL,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.m[PSC_VOLTAGE_OUT] = 2,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.write_byte_data = max20826_write_byte_data,
+	.write_byte = max20826_write_byte,
+	.read_byte_data = max20826_read_byte_data,
+	.read_word_data = max20826_read_word_data,
+	.write_word_data = max20826_write_word_data,
+	.read_block_data = max20826_read_block_data,
+#if IS_ENABLED(CONFIG_SENSORS_MAX20826_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = max20826_reg_desc,
+#endif
+};
+
+static int max20826_detect_addr_mode(struct max20826 *st)
+{
+	u8 val_buf[I2C_SMBUS_BLOCK_MAX];
+	struct device *dev = &st->client->dev;
+	int ret, val;
+
+	/*
+	 * The idea is that after a POR, we are in page0 in which case we can
+	 * read MAX20826_REG_ADDR_MODE. If we fail to read
+	 * MAX20826_REG_ADDR_MODE, it might be due to a soft reset or unbinding
+	 * the device in which case the device could be left in page 1. Hence,
+	 * let's just try to change to page 0 and error out if we can't.
+	 *
+	 * OTOH, if the addressing mode is direct, we should be able to
+	 * read MAX20826_REG_ADDR_MODE. If not, we'll fail setting the page.
+	 *
+	 * REG_ADDR_MODE, MAX20855B has 6 bytes, other devices have 1. Byte 3 is
+	 * the equivalent of the single byte of the others.
+	 */
+	if (st->chip_info->is_reg_addr_mode_block)
+		val = max20826_rail_read_block_data(st->client,
+						    MAX20826_REG_ADDR_MODE,
+						    val_buf, 3);
+	else
+		val = i2c_smbus_read_byte_data(st->client, MAX20826_REG_ADDR_MODE);
+
+	if (val < 0) {
+		ret = i2c_smbus_write_byte_data(st->client, PMBUS_PAGE, 0);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to change to page 0\n");
+
+		/* try again! */
+		if (st->chip_info->is_reg_addr_mode_block)
+			val = max20826_rail_read_block_data(st->client,
+							    MAX20826_REG_ADDR_MODE,
+							    val_buf, 3);
+		else
+			val = i2c_smbus_read_byte_data(st->client,
+						       MAX20826_REG_ADDR_MODE);
+		if (val < 0)
+			return dev_err_probe(dev, val,
+					     "Failed to read MAX20826_REG_ADDR_MODE\n");
+	}
+
+	if (st->chip_info->is_reg_addr_mode_block)
+		val = val_buf[2];
+
+	if (val & MAX20826_PAGE_MODE_MSK)
+		return 0;
+
+	/*
+	 * If in direct mode, rail b will be accessible from the addr of RAIL_A
+	 * +1
+	 */
+	st->client_b = devm_i2c_new_dummy_device(dev, st->client->adapter,
+						 st->client->addr + 1);
+	if (IS_ERR(st->client_b))
+		return PTR_ERR(st->client_b);
+
+	return 0;
+}
+
+static int max20826_set_vout_interface(struct max20826 *st,
+				       struct i2c_client *rail, u8 page)
+{
+	static const char * const props[MAX20826_MAX_PAGES] = {
+		"adi,rail-a-high-speed",
+		"adi,rail-b-high-speed",
+	};
+	bool high_speed;
+	int ret;
+
+	/*
+	 * Rail A 0xDC_1[7:6] sets the operating mode for both rails, so only look
+	 * at it once.
+	 */
+	if (page == RAIL_A) {
+		if (st->chip_info->has_avsbus) {
+			ret = i2c_smbus_read_word_data(st->client,
+						       MAX20826_REG_C_MODEAB);
+			if (ret < 0)
+				return ret;
+
+			if (FIELD_GET(MAX20826_C_MODEAB_MASK, ret) == MAX20826_INTF_PWMVID)
+				st->vendor_bus = true;
+		} else {
+			st->vendor_bus = true;
+		}
+	}
+
+	high_speed = device_property_read_bool(&st->client->dev, props[page]);
+
+	return max20826_set_high_speed(st, rail, page, high_speed);
+}
+
+static int max20826_detect_phases(struct max20826 *st, struct i2c_client *rail,
+				  struct pmbus_driver_info *info, u8 page,
+				  u8 expected)
+{
+	u8 status_mon[I2C_SMBUS_BLOCK_MAX];
+	int ret, ret2 = 0, oper_save = -1;
+	u8 n_phases;
+
+	/*
+	 * In order to detect the number of phases, we need to be regulating.
+	 * It is also assumed we're already in the page we want to detect the
+	 * phases.
+	 *
+	 * If the vendor high speed interface controls the output voltage, the
+	 * enable state is not ours to control (it is given by that interface
+	 * together with the AVREN/BVREN pins) and writing PMBUS_OPERATION is a
+	 * no-op, so just assume the rail is already regulating.
+	 */
+	if (!st->vendor_bus || !st->high_speed[page]) {
+		ret = i2c_smbus_read_byte_data(rail, PMBUS_OPERATION);
+		if (ret < 0)
+			return ret;
+
+		if (!(ret & PB_OPERATION_CONTROL_ON)) {
+			oper_save = ret;
+			ret = max20826_regulator_do_enable(st, rail, page,
+							   ret | PB_OPERATION_CONTROL_ON);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	ret = max20826_rail_read_block_data(rail, MAX20826_REG_STATUS_MON,
+					    status_mon, 2);
+	if (ret < 0)
+		goto out_restore_oper;
+
+	n_phases = field_get(st->chip_info->phase_num_mask, status_mon[1]);
+	if (n_phases != expected) {
+		ret = dev_err_probe(&st->client->dev, -EIO,
+				    "Number of phases mismatch: expected=%u, detected=%u\n",
+				    expected, n_phases);
+		goto out_restore_oper;
+	}
+
+	info->phases[page] = n_phases;
+	for (unsigned int phase = 0; phase < n_phases; phase++)
+		info->pfunc[phase] = PMBUS_HAVE_IOUT | PMBUS_HAVE_IIN;
+
+out_restore_oper:
+	if (oper_save >= 0)
+		ret2 = max20826_regulator_do_enable(st, rail, page, oper_save);
+
+	return ret < 0 ? ret : ret2;
+}
+
+static int max20826_get_rail_config(struct max20826 *st,
+				    struct i2c_client *rail, u8 page)
+{
+	u8 ctrl_misc[I2C_SMBUS_BLOCK_MAX];
+	int ret;
+
+	/*
+	 * Check if we need to control PMBUS_OPERATION in addition to the
+	 * CONTROL pin.
+	 */
+	ret = i2c_smbus_read_byte_data(rail, PMBUS_ON_OFF_CONFIG);
+	if (ret < 0)
+		return ret;
+
+	st->on_off_ctrl[page] = !!(ret & PB_ON_OFF_CONFIG_OPERATION_REQ);
+
+	/*
+	 * See if Over Power Limit is enabled. This will impact how
+	 * OC_FAULT_LIMIT is handled.
+	 */
+	if (st->chip_info->has_opl) {
+		ret = max20826_rail_read_block_data(rail, MAX20826_REG_CTRL_MISC,
+						    ctrl_misc, 1);
+		if (ret < 0)
+			return ret;
+
+		st->opl_enabled[page] = !!(ctrl_misc[0] & MAX20826_OPL_EN_MSK);
+	}
+
+	return 0;
+}
+
+static int max20826_setup_vout_format(struct max20826 *st)
+{
+	struct pmbus_driver_info *info = &st->info;
+	struct i2c_client *rail;
+	int ret;
+
+	if (st->chip_info->is_vout_direct) {
+		u8 vout_res[I2C_SMBUS_BLOCK_MAX];
+
+		rail = max20826_select_rail(st, RAIL_A, true);
+		if (IS_ERR(rail))
+			return PTR_ERR(rail);
+
+		ret = max20826_rail_read_block_data(rail, MAX20826_REG_VOUT_RES,
+						    vout_res, 2);
+		if (ret < 0)
+			return ret;
+
+		/* check for 1 mv/LSB */
+		if (MAX20826_VOUT_RES_MSK & vout_res[1])
+			info->m[PSC_VOLTAGE_OUT] = 1;
+
+		return 0;
+	}
+
+	st->info.format[PSC_VOLTAGE_OUT] = vid;
+	for (unsigned int page = 0; page < info->pages; page++) {
+		if (!st->chip_info->select_vrm) {
+			/* only vr12 in this case */
+			st->info.vrm_version[page] = vr12;
+			continue;
+		}
+
+		rail = max20826_select_rail(st, page, true);
+		if (IS_ERR(rail))
+			return PTR_ERR(rail);
+
+		ret = i2c_smbus_read_byte_data(rail, MAX20855B_REG_VOUT_VRM);
+		if (ret < 0)
+			return ret;
+
+		if (ret & MAX20855B_REG_VOUT_VRM_MASK)
+			st->info.vrm_version[page] = vr13;
+		else
+			st->info.vrm_version[page] = vr12;
+	}
+
+	return 0;
+}
+
+static int max20826_setup(struct max20826 *st)
+{
+	struct pmbus_driver_info *info = &st->info;
+	u8 config[I2C_SMBUS_BLOCK_MAX], expected_phases;
+	struct device *dev = &st->client->dev;
+	struct i2c_client *rail;
+	int ret;
+
+	ret = max20826_detect_addr_mode(st);
+	if (ret < 0)
+		return ret;
+
+	ret = max20826_set_vout_interface(st, st->client, RAIL_A);
+	if (ret < 0)
+		return ret;
+
+	ret = max20826_rail_read_block_data(st->client,
+					    MAX20826_REG_RAIL_PHASE_CFG,
+					    config, 5);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * If we have phases in RAIL_B, we need to subtract them on config[1] as
+	 * those bits are also set in case RAIL_B has phases.
+	 */
+	expected_phases = st->chip_info->count_phases(config, RAIL_A);
+	ret = max20826_detect_phases(st, st->client, info, RAIL_A,
+				     expected_phases);
+	if (ret < 0)
+		return ret;
+
+	ret = max20826_get_rail_config(st, st->client, RAIL_A);
+	if (ret < 0)
+		return ret;
+
+	/* Let's see if RAIL_B is present */
+	rail = max20826_select_rail(st, RAIL_B, true);
+	if (IS_ERR(rail))
+		return PTR_ERR(rail);
+
+	/* Let's see if there's something on RAIL_B */
+	st->bvren = devm_gpiod_get_optional(dev, "bvren", GPIOD_OUT_HIGH);
+	if (IS_ERR(st->bvren))
+		return PTR_ERR(st->bvren);
+
+	ret = max20826_set_vout_interface(st, rail, RAIL_B);
+	if (ret < 0)
+		return ret;
+
+	expected_phases = st->chip_info->count_phases(config, RAIL_B);
+	ret = max20826_detect_phases(st, rail, info, RAIL_B, expected_phases);
+	if (ret < 0)
+		return ret;
+
+	if (info->phases[RAIL_B]) {
+		info->pages = MAX20826_MAX_PAGES;
+		info->func[RAIL_B] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+				     PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+				     PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+				     PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+				     PMBUS_PHASE_VIRTUAL;
+
+		if (IS_ENABLED(CONFIG_SENSORS_MAX20826_REGULATOR))
+			info->num_regulators = 2;
+
+		ret = max20826_get_rail_config(st, rail, RAIL_B);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = max20826_setup_vout_format(st);
+	if (ret < 0)
+		return ret;
+
+	if (info->pages == 1) {
+		/*
+		 * In this case we can be left in RAIL_B and given that we on
+		 * only have one page, pmbus_set_page() will refuse to comeback
+		 * to RAIL_A which is obviously problematic. Hence, let's just
+		 * select RAIL_A here.
+		 */
+		rail = max20826_select_rail(st, RAIL_A, true);
+		if (IS_ERR(rail))
+			return PTR_ERR(rail);
+	}
+
+	return 0;
+}
+
+static int max20826_high_speed_en_get(void *arg, u64 *val)
+{
+	const struct max20826_debugfs_entry *entry = arg;
+
+	*val = entry->st->high_speed[entry->page];
+
+	return 0;
+}
+
+static int max20826_high_speed_en_set(void *arg, u64 val)
+{
+	const struct max20826_debugfs_entry *entry = arg;
+	struct max20826 *st = entry->st;
+
+	guard(pmbus_lock)(st->client);
+
+	return max20826_set_high_speed(st, NULL, entry->page, !!val);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(max20826_high_speed_en_fops,
+			 max20826_high_speed_en_get,
+			 max20826_high_speed_en_set, "%llu\n");
+
+static int max20826_high_speed_bus_show(struct seq_file *s, void *data)
+{
+	struct device *dev = s->private;
+	struct i2c_client *client = to_i2c_client(dev);
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max20826 *st = to_max20826(info);
+
+	seq_printf(s, "%s\n", st->vendor_bus ? st->chip_info->vendor_bus_name : "AVSBus");
+
+	return 0;
+}
+
+static void max20826_init_debugfs(struct max20826 *st)
+{
+	struct device *dev = &st->client->dev;
+	struct dentry *dir;
+
+	dir = pmbus_get_debugfs_dir(st->client);
+	if (!dir)
+		return;
+
+	for (unsigned int page = 0; page < st->info.pages; page++) {
+		struct max20826_debugfs_entry *entry;
+		char name[32];
+
+		entry = devm_kzalloc(dev, sizeof(*entry), GFP_KERNEL);
+		if (!entry)
+			return;
+
+		entry->st = st;
+		entry->page = page;
+
+		scnprintf(name, sizeof(name), "in%u_high_speed_en", page + 2);
+		debugfs_create_file_unsafe(name, 0644, dir, entry,
+					   &max20826_high_speed_en_fops);
+	}
+
+	debugfs_create_devm_seqfile(dev, "in_high_speed_bus", dir,
+				    max20826_high_speed_bus_show);
+}
+
+static int max20826_probe(struct i2c_client *client)
+{
+	struct max20826 *st;
+	int ret;
+
+	st = devm_kzalloc(&client->dev, sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	st->client = client;
+	memcpy(&st->info, &max20826_default_info, sizeof(st->info));
+
+	st->chip_info = i2c_get_match_data(client);
+	if (!st->chip_info)
+		return -EINVAL;
+
+	st->avren = devm_gpiod_get_optional(&client->dev, "avren", GPIOD_OUT_HIGH);
+	if (IS_ERR(st->avren))
+		return PTR_ERR(st->avren);
+
+	ret = max20826_setup(st);
+	if (ret)
+		return ret;
+
+	ret = pmbus_do_probe(client, &st->info);
+	if (ret)
+		return ret;
+
+	max20826_init_debugfs(st);
+
+	return 0;
+}
+
+static const struct max20826_chip_info chip_info_max20826 = {
+	.vendor_bus_name = "Nvidia PWMVID",
+	.max_phases = MAX20826_MAX_PHASES,
+	.phase_num_mask = MAX20826_PHASES_NUM_MASK,
+	.start_index_iin = 4,
+	.start_index_iout = 2,
+	.is_vout_direct = true,
+	.has_avsbus = true,
+	.has_opl = true,
+	.count_phases = __max20826_count_phases,
+};
+
+static const struct max20826_chip_info chip_info_max20855b = {
+	.vendor_bus_name = "Intel SVID",
+	.max_phases = MAX20855B_MAX_PHASES,
+	.phase_num_mask = MAX20855B_PHASES_NUM_MASK,
+	.start_index_iin = 2,
+	.start_index_iout = 0,
+	.is_reg_addr_mode_block = true,
+	.select_vrm = true,
+	.count_phases = __max20855b_count_phases,
+};
+
+static const struct max20826_chip_info chip_info_max20908 = {
+	.vendor_bus_name = "AMD SVI3",
+	.max_phases = MAX20908_MAX_PHASES,
+	.phase_num_mask = MAX20826_PHASES_NUM_MASK,
+	.start_index_iin = 2,
+	.start_index_iout = 0,
+	.count_phases = __max20908_count_phases,
+};
+
+static const struct max20826_chip_info chip_info_max20912 = {
+	.vendor_bus_name = "AMD SVI3",
+	.max_phases = MAX20912_MAX_PHASES,
+	.phase_num_mask = MAX20826_PHASES_NUM_MASK,
+	.start_index_iin = 2,
+	.start_index_iout = 0,
+	.count_phases = __max20912_count_phases,
+};
+
+static const struct max20826_chip_info chip_info_max20916 = {
+	.vendor_bus_name = "AMD SVI3",
+	.max_phases = MAX20916_MAX_PHASES,
+	.phase_num_mask = MAX20826_PHASES_NUM_MASK,
+	.start_index_iin = 2,
+	.start_index_iout = 0,
+	.count_phases = __max20826_count_phases,
+};
+
+static const struct i2c_device_id max20826_id[] = {
+	{ "max20826", (kernel_ulong_t)&chip_info_max20826 },
+	{ "max20855b", (kernel_ulong_t)&chip_info_max20855b },
+	{ "max20908", (kernel_ulong_t)&chip_info_max20908 },
+	{ "max20912", (kernel_ulong_t)&chip_info_max20912 },
+	{ "max20916", (kernel_ulong_t)&chip_info_max20916 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max20826_id);
+
+static const struct of_device_id max20826_of_match[] = {
+	{ .compatible = "adi,max20826", .data = &chip_info_max20826 },
+	{ .compatible = "adi,max20855b", .data = &chip_info_max20855b },
+	{ .compatible = "adi,max20908", .data = &chip_info_max20908 },
+	{ .compatible = "adi,max20912", .data = &chip_info_max20912 },
+	{ .compatible = "adi,max20916", .data = &chip_info_max20916 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max20826_of_match);
+
+static struct i2c_driver max20826_driver = {
+	.driver = {
+		.name = "max20826",
+		.of_match_table = max20826_of_match,
+	},
+	.probe = max20826_probe,
+	.id_table = max20826_id,
+};
+module_i2c_driver(max20826_driver);
+
+MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
+MODULE_DESCRIPTION("PMBus driver for MAX20826");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.55.0

