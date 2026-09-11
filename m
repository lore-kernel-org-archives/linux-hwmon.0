Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADAE2E7366;
	Fri, 11 Sep 2026 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134789; cv=fail; b=oQpbf+bM1IQzBvo1CNFMYCZiJEe/Ov2YZvRVGFDik0l16/ToFpLm1yYoGWEfGGZpOycwoApqnQom1KxiqCML5zctOjcBbmwAziyl6+ZQMUvxkoMCQQ6y6r0JYzofHHA7ZIUwuv4YNGQdkiyZMAmXESJ0QEe7iVr4Bu7NgMKTxbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134789; c=relaxed/simple;
	bh=kp7jnPUKWeYnFIBx7h2DVTOSg6bNMd1kxhixBY/KuAM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hp5A6a6ZzXbJ7NcfHlfgnvU0HQ/JjQ1oTrhyLyS2sHCTJVX0nX6/oIISjl+2565xfn/UKxK6Dlxu+cu9fza3hKftzv9pktLPi5EY3IdpzzwDh1qzwkK3N2aZtvoCLzGIn188dOxzyIC0O/KCQjsB1hbK81n5V3ZW8dv62Fnedq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=f4l90O5F; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="f4l90O5F"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCkvVA2608756;
	Fri, 11 Sep 2026 09:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=lCb8R
	kJrXe/DYDxkI+iX4djeaE5u6L/qAg92AC7zTyw=; b=f4l90O5FInhgYg1LwqDV7
	i9/e+w39zagYwQdwfFKYn2jDLvE9WVpc779NNQyD2tF8sDMai/w+K6imcBS60QTu
	h0CP16i95T3vgDRMJUW3AiLBuchV86KXaHJzpDd/VlGTz21mD/nkgOMA0ikThFE9
	cpgfZpJTL1EayZ84pLJIiyiW/YPAy0kjMQR4ZwkpplA0vVv0yXLtvBeNAflfG2WT
	Km3uFP/MvWW+92gfKAnYCH4wsMu4CIeNS45kmjGDFxt849ZtPaRVe/7P1t1bNdhR
	UR+yrBS8Hb4QwWhs9By+3BMnFUWxuOd0/+6VHzi01S87xdyDsQTm3iRDIQMv29Ey
	Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxd1che-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:52:40 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi1d3wMsay7QTtNygRweEgtWXFCqoshSadaygVZql2gXC/ad3xrXoGLf3c5lmYSJbLIl2dHUT2tGBXKtkGGBiBUUDERVWIk2gyGsjmEVqxGZv7/cSqqUxr39Zr99ach/97qoncfYcWpfVeFAKOniuQwJVWgaKAz9JmrOgWTQ4yYkh2il5KAIVbwOmrMfUQEHD129UzgU5YMgQehTY8jqH80dDjLQoPIJFrqVs7jAufDBt8SHC+R/d3MWLAIOLbdZUyBcQPs6Se1svc0I0PXhoGxEboIT49CrNiYrkvqHWmQQggjnq5V734nsEaboMMwdyE30hRY/oySjEt6RE87sqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCb8RkJrXe/DYDxkI+iX4djeaE5u6L/qAg92AC7zTyw=;
 b=Zi/YfP3EdkrSEczFUEEy/oX812qBuYfEk2gUpE/TXYcXQ2FIwfACKDqJMA4hPRvrVhGGUBX4m/ZE+jSd4SKiCDXBBorE4iEz8unytGzG6J9OM7f0OOt4WrVfPqOtzwS1B05KnxsYDncd4VQyLZOg3jFQwSd40g9l4L7aU+93pyrZXp3wUCCjhwX5XdqVsIHTKPaqCEAP5nMRBt224H1Ju2fRKDaPh8+HZ+uBfC5xJgwkHfDxT32DeoZb7ZsoR+fk8UuG2pKdmNL8LsRgko8HKLJUUggtTEoTl5iqSe4LpdPY+pp/xbp5dZaQPwGmqf4JA6wcrFsSiTroIGg1zSO+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MWHPR03MB989357.namprd03.prod.outlook.com (2603:10b6:303:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 13:52:36 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:52:35 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Fri, 11 Sep 2026 14:53:39 +0100
Subject: [PATCH v2 3/4] dt-bindings: hwmon/pmbus: Document MAX20826 and
 similar devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134819; l=4881;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=kp7jnPUKWeYnFIBx7h2DVTOSg6bNMd1kxhixBY/KuAM=;
 b=6TxPAQPzplyxc/2Js/bV9jmzfnBnfmcgF7zWg3saK0THKgeSc1rYcmyoZ7I4wM69CUk61EiJP
 nLPyq4v+KVXDZdRv3jA2bG4xDy3+hTMuhwE0bkFSrmRvivCslKTaQ7c
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::27) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MWHPR03MB989357:EE_
X-MS-Office365-Filtering-Correlation-Id: d003f055-47a0-46ca-cfdf-08df100bef67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|6133799003|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i5vj2WeOCHvfn2YBC/clw+NiIQJPKux5wNFX9M3eSQCI5EjyuLF/0XiZ6ne9nOdKe3/ICn3Lh1rqw6RpaqKeDpMlgsYFliT/1D8aPDV140LZ6pMYnki+J5SaxMszmoLdRwtLt79fy7DFWpPM1fOO++XcXcTpRjQQAITlEuDPSFTAb10ypSSz9p7zobdsGN8GBlaXxG/OulUuAE89M0jE39ZBpogqlDbYL2cFiCikmoU36JaZ9FMuaMjIdMm9LsEqdq8V7cuQ5Bi4RTGTWPRpfbGr1mz+fx3orKF87TnSEUgzcm2grchc7dXpvhHPoZsc8CA5rZpA1tLyC+/wiv8wkpP0qp52AYcsTY2JtIVYLIt3X07Bpb96SRJ1tSXSkbl8OUQIPds4XV166eS78yT5hefPpDyLNkCjIgiE8eEBz7FHngHnMzxKdYkJXXmbWKeNS3CUW1biVPw/NaUfZ636FfqJm4nPp/Ll6sTD+bR55pgZq+yl0gH1r+prBhK0MqBni/dv2cJn38zp+ySwnwO1zCA/lip1AlT6eNlspXs5uPfykh9B/3NBF13y7jaUXlRYPLmM872IKAXNlAbz1dFHaO77KdlaoY0pscEqYkhvGAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(6133799003)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0g2NzVNZHc2SytWc0pqcWUyRDA5czhwWUQ1MmJJZ0pkdDBaMTE5RjVISm9D?=
 =?utf-8?B?VzZBQ3Q4RXJtYkxkRXNEVUZQMCszM016SExoYk5uZjhiNXlXNFo0Z2NheC9Q?=
 =?utf-8?B?NEwwWjBoOEdMWWhvams1a2d4aG54ajF6MS8xVXZqL29jQy9hUGY1dmtLdHNp?=
 =?utf-8?B?N2RTVUV4QUtNUTNtdllLUFFGb0d0TWp2WUdwUUR0YWYyRVpkbFNOR3hPejRZ?=
 =?utf-8?B?YVYzZFNZYTRZSi90TS8vbGxoc0VvUFlMNWtvcDNtRW5PTWhvN3NrcTE1VTMw?=
 =?utf-8?B?OE9jai9TMDZtZXVFbW9jdGJpTERQdURqNEZEZ3p5WG5naVlsTUxzSkdjaFgr?=
 =?utf-8?B?SFZQSkFGV2ZBUHNJZGNTWDlna3Jya2phZ09oMVZwZ0h3dFZrWGt6REhFZjdM?=
 =?utf-8?B?NlM2SlQ1U3FtL1RpWDB0UHM0SThOMlRoT1I1allWL2RKMnlkZ2pUUUhVcnZx?=
 =?utf-8?B?dm1wSUsra3pIMUdjMlVEbEhDeVFjaDlSYnczUkZHTk83TFZEMHRlOXFFek5n?=
 =?utf-8?B?SUc5L1dIT3ZkWnNLZEkrSEF0WGRqY1lacGJNY3FhbGNZOXhTOEdVMk92ODAy?=
 =?utf-8?B?VFVYOVZ2UWYzT0JQY2ZHeHNna0FtbVErSGhLeDltaW5jcWVhWGRrMld0NXdC?=
 =?utf-8?B?YldlT2hMV2N1aVNmNE50Q0dBcTVxQ1ZoZE5pbmlmQzlacW5WN0N4MGg5ZTdN?=
 =?utf-8?B?VW8yQ3IwcGFPM1hHR1AxVlRUT21mQjFQdlNUQWErZUNlTmxiMDRnVkhwclhk?=
 =?utf-8?B?RlpXNzhOYmJUeThZbU5PbjVDY2piUDZ5QmpiY3JObGdacDVyczRtZ1cyc0wx?=
 =?utf-8?B?enRkcU9xYU9qUFArYnQ4b0I4N3l6ZjIzSW9oazdSTnJDdHBjVXIyZmxNcjZF?=
 =?utf-8?B?Zm5kQXh1QXIxM1lWYWJiaDBYZGtnQTJDL2lyNUwzTHZhYVN3L20vQzVXYWJS?=
 =?utf-8?B?d2dhT3IyYzFGME0zb3RDeUNwcnVlQ0JmQ1MvUkdnVVVaVkUvRHlQTzVhYUNn?=
 =?utf-8?B?Q1JrTE56Vldjano0cTBub3hZOXhCUDUya0dBNklBcG52ZE5DN1Q0bW1OMjRo?=
 =?utf-8?B?NWV0b25Ya2hsRldMVVpLNFY4WklaVGp2SnZmTy8wMy9xNGw0enRYc09ka3BN?=
 =?utf-8?B?Y3diYS91N1RMSkwvLzVKeWZFekUvRG5OWXpHb3lhQVloYnJicnpjcTZpRHho?=
 =?utf-8?B?OWZJRGNVd1NYNmo1MVFMbEY0VFUrdlRnR3Z3WTVjem15UHFvM2hNT0xQSkQ2?=
 =?utf-8?B?SkxteHRDMkNPalRVejBnaW8wVnptNjZzTXZsRnJvMnRta3FGVGg4U2ZDTUdM?=
 =?utf-8?B?bEM5R3QrOXE5bkxuVXNTTFZKSlFocHVhWC9VcUZVeFd3VUdsdGxJT1ZwMkhh?=
 =?utf-8?B?aVV0Znk3b0lmbjdzclU2OS9FMXI0czEySk9xbjdneFBOY1huTC9rU2RpalE0?=
 =?utf-8?B?QW5XNEM2SHJDT3lZUnkzWVBPVitZaXQ4bG5pUyt4d0JvYUQ3NVRHKzRpcXdM?=
 =?utf-8?B?L1EveG8rWU9hc0Z4djc0ZVJyR2dtOWZrei8vWUxxQWt6dmdjYjdrSHQ1Y25m?=
 =?utf-8?B?cVoyajNYR1ZhVThmajNKOFZjNUNqL2xLTmM0WWtDMTY2Q0VGVjU4UjY3MFd0?=
 =?utf-8?B?YmF2aGFHaGJxSEZubWZlZUp2WC9Hd3FGY2hZSU9MY1JyOUVCNnJRWGRRbWgz?=
 =?utf-8?B?aEpNVFFTVnZjZWhkaU10ckRhUjdKOFBlNXJVVTUzY2EycjZqd0sxNGpQZ3dk?=
 =?utf-8?B?ZDdDVExqVVAwa2FkRVBySU1hd0UyYnlUS25uL3NnaGZzeng5YlZwNk96NWtx?=
 =?utf-8?B?WlJzazM3QXVxZnFlcDNoSXJqalFKTSs4cDMxVThXdXI5WEVDeU5xOHk5R3Ey?=
 =?utf-8?B?dllGdmdlQkxTUW9HdTlMRWRjbU45d2RmNXVHajlPalZ6NWYyWFdsWHV3TUpz?=
 =?utf-8?B?eS8ycXZBZm1PbTZtRlQzNWJjRVNMV0lmR1poUy83b25leGptck56V0dVaG9i?=
 =?utf-8?B?MHlHT2hXVXdVOWYxWWdpZThsSXpKQjB0NDhDUmY5MWd3dFg1MHpGVW9MUEJh?=
 =?utf-8?B?VVRQb3l0YlhqVnBOUThhUUtuRjV4MHMzNkVoZFlueVNRSGVKb3NSWHByNVU1?=
 =?utf-8?B?dkwzY0tGTVJLdXFIK0lkSVI2N3kyRzlYWldxMm9VOFI0K2liTm9JRS9QRUkx?=
 =?utf-8?B?NXYwTkVNUW4zM3dOU3h1UTJYd1pEK3dYblFIQVU1OUVZMVBFRFlOUlBjNklX?=
 =?utf-8?B?dXpxcEJUR09rbGdTYTZWcDJaSHlBekRiT3oxbHhLaDRnYjkrTEh5b25UenQw?=
 =?utf-8?B?R0o0QkYwYzF1bENNSloxOXRsNGlLaTN1WGpwQmI0SXZEcktIbzFmZz09?=
X-Exchange-RoutingPolicyChecked:
	PpAMOYGKSQDjG2nVhWAdgdhBglkuf7uSSaUpO8Y5YZ6xJ+0e5cwmNWQ3GhlfN+idrJqG5fpkNvWM+QRYEwRLh95PCcgsNxrYb4QNWV3hZgxAVBFJQ1FYX9lVNUJxV+K3tccW3R1soSV066+O94tUr77PqHIg+PNPlTnHaZcC7fUq/Y6M7CUszcCcm+Q9BIyiFyutfYcP1ajO5l5x+ZOGvJa5we5/RrwPLM1hnt6S1fd0nEjneWB/WIJn/6mJUzOCAdCUualpbniKjg3Af9NFVrge22Y8qLxWzzqPQh+m7qpp4GNd7M7kD1fF2sS9BuufOJuG/QibJyW+xl9VGt1eDQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d003f055-47a0-46ca-cfdf-08df100bef67
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:52:35.8510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXX/K9kJjfRjhG7lR3BCSvRx1/n328ycUWA1jvefmgpEW7etCKsv5Tlz+bnYCQ7MRKRazggkqv48DeErVQSzhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989357
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfX7iie5e3MkY8Q
 NRWvxxWtWgYkslzQTFVGQboO7i62Z2axBiE3pop2B2v2FHYxdoqlRSNOqqqPxdGvk6+mLUHkKHQ
 M6M8/ZlxuorbiV0LboNSv19mV/jOF9Qz2znGJwx0lFw+6EZJBzfy0IfmdQp0OEq07P/aPrn6nYQ
 NuxRSWa8oHUZvAzEBwAs9ySkn93/EcnGomAPqLjaR2Jyx/FaH+Uj47cWUbpmDRNfibp30dn5gRj
 bVhsemT0C9o6lUZBwYCB6Cd9RFMYcFPEJoGQ2Jfkw0uuntn96a1fPGyoMuqfIejRwL3rlV0MaaT
 Fdkcumblqd8cOvaCOD39sBwZC6Kye5Y3qiK+HBBesKFJtzWQBmK4O/Y7GTqPANw7EYrfio+8Fka
 mJbWdA1V3KVnUCMOzzWlH+dpqwhrfiQC/s0gveekOzx90ZyLViY0xSuRmsjWBmTGim4NADALCRS
 LurmKgPuJAtlv8U5eQw==
X-Authority-Analysis: v=2.4 cv=GoTXaU1C c=1 sm=1 tr=0 ts=6aa407a8 cx=c_pps
 a=rpDl8c4QES63uqz6MGSAyg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=lhhGCT_j3gHGGyJPvV0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfX2LDi+odRupq2
 JLMAuSsuGEW0u50y+YBCtZ7p623DY8NlpXUu4wNs4qCNXos+pzpdITtYHMUADXjRYhhVbzCb1nM
 CbPnTexwbmNIhaY9P49rWcRBTmowsrm1THQAYAyjiqupbT0e2jid
X-Proofpoint-GUID: v73KWG5M5USAOY5h5rz73v0rBayxCNXm
X-Proofpoint-ORIG-GUID: v73KWG5M5USAOY5h5rz73v0rBayxCNXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110193

The MAX20826 IC and similar provide a high-density, flexible and scalable
dual-loop solution for high current cores for AI applications. These are
dual loop solutions multiphase voltage regulators. Between Rails A and B,
MAX20855B and MAX20908 supports up to 8 phases total configurable from
8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.

The output voltage of each rail is controlled either through PMBus or
through the high-speed processor voltage-control interface (Intel SVID,
AMD SVI3, Nvidia PWMVID or AVSBus, depending on the device). Which one is
in use is part of the configuration the device powers up with and is read
back from it, hence adi,rail-a-high-speed and adi,rail-b-high-speed only
tell whether the high-speed interface or PMBus controls the output voltage
of the respective rail.

Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../bindings/hwmon/pmbus/adi,max20826.yaml         | 102 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
new file mode 100644
index 000000000000..e3bb51d6d1d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20826.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX20826 PMBus Voltage Regulator
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description:
+  Analog Devices MAX20826 and similar devices are Dual-Output Multiphase
+  High-Current Controller.
+
+properties:
+  compatible:
+    enum:
+      - adi,max20826
+      - adi,max20855b
+      - adi,max20908
+      - adi,max20912
+      - adi,max20916
+
+  reg:
+    maxItems: 1
+
+  vdd3p3-supply:
+    description:
+      3.3V bias supply. It is the input of the internal 1.8V linear regulator
+      which supplies the controller.
+
+  avren-gpios:
+    description: GPIO pin to enable/disable the output voltage on Rail A.
+    maxItems: 1
+
+  bvren-gpios:
+    description: GPIO pin to enable/disable the output voltage on Rail B.
+    maxItems: 1
+
+  adi,rail-a-high-speed:
+    type: boolean
+    description:
+      The output voltage of Rail A is controlled by the high-speed processor
+      voltage-control interface the device powered up in (PWMVID, SVID, SVI3 or
+      AVSBus). If not given, PMBus controls the output voltage of Rail A.
+
+  adi,rail-b-high-speed:
+    type: boolean
+    description:
+      Same as adi,rail-a-high-speed but for Rail B.
+
+  regulators:
+    type: object
+    description:
+      List of regulators provided by this controller. vout0 is Rail A and
+      vout1 is Rail B.
+
+    patternProperties:
+      "^vout[0-1]$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd3p3-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@64 {
+            compatible = "adi,max20826";
+            reg = <0x64>;
+
+            vdd3p3-supply = <&vdd3p3>;
+
+            avren-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+            bvren-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+
+            adi,rail-a-high-speed;
+
+            regulators {
+                vout0 {
+                    regulator-name = "vcore_a";
+                };
+
+                vout1 {
+                    regulator-name = "vcore_b";
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1fb5efb513f0..a8ae7af72099 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16004,6 +16004,13 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max17616.yaml
 F:	Documentation/hwmon/max17616.rst
 F:	drivers/hwmon/pmbus/max17616.c
 
+MAX20826 HARDWARE MONITOR CONTROLLER DRIVER
+M:	Nuno Sá <nuno.sa@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
+
 MAX20830 HARDWARE MONITOR DRIVER
 M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.55.0

