Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE820E6E2;
	Thu,  5 Feb 2026 03:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770262373; cv=fail; b=grVgnS4JWf3BOE1yYsPgAQNQixPovzRmxmSNAtrt6TSHYm29I+mcxrqBLSkv2/NRTIwiqhdaQyxCx+7S1MidGgCjw5qzncsTMz+ZYVlNbREPUCwEmbUVaWsu+QgjXxddHgdexXpKQe9nRwOe3cy+ehxkD4EIBdwZPDMhMKCoAqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770262373; c=relaxed/simple;
	bh=TbUAunnD0OPKn2jqqUfY85lxYKMJu6sUb7sRVy+Gy5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EoZRQ4jqQ+TTpKCEmnrg4JUk+W5EHvTHGsI2OrzxkQl7i4N4ibtWGWNb+REfdEkLOgYdZjGyrfiSK6nSUeRLqmVAE2gv14HywMb7/2fFP993iYU3+GzBSYzCn3fEZlgoX+WFmzP9RXi0HlnwKf3XMY7aFYZKHHueoymNGxIaKyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N7jz6v5y; arc=fail smtp.client-ip=52.101.48.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N7jz6v5y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDIdMh+k0oi7mlkX+3qy4CpBYVYdoYFFL0Hb/limrpXJG7CX1M5KtMlI6WgtEizDxwaV0r1nD3X35sxc1EVrP4IsZgAvEZOs71DkClEBfG/jzIdlI7BHjXpJ2gXDS71ODz/scnJqwiKSXCOGByPcWAMHRrcVUyYDR+ESKmxGM/eV0V27LucJZmP43o5dW36Y6oJJ4WMvpWEkNuc37pvg/nOxcSYRUuzxjOYmot/tiJtcyP2sul7hs2AUigt8xIKFUxrqKHqccVV5CbmoYgARbA0ckpY/q8RNns45EPxbVy/cPZXz3pqvdRu3T5t3Nv7OXugWhH4ADJZTr7OPatZtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbUAunnD0OPKn2jqqUfY85lxYKMJu6sUb7sRVy+Gy5w=;
 b=URs1+9Mqfi6XL3xhWrOpYV7NlUmf54NmkGrlsGEuJOxM/P4KGzmQ+v87eIutQOdzYKWOB8gH6rfO3bWmsjM8wLkjcwwxmyUuKvBGIUxiR8NkkIa5taEmyQaeSBQPdPvm1fK4ry6pMg+AB1mwFgY/w9UpuzDmJOOYziDrg+REjqmx4mhNO0LqpfwEQZtCKuNactfmO6a1OPPMoxPIbaZriuUtMqmKPlYlvoKRutsE9JO7wjq2Osoibr4EIAaHXN0GplAcfOx7AAXowOdlI/2JGmeg7Ar6WW9Z8fC5JYXGAQrvyFf4KYH8tJzkXM4ZeVc8c2e/wEhb2Nbj0nag1y638Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbUAunnD0OPKn2jqqUfY85lxYKMJu6sUb7sRVy+Gy5w=;
 b=N7jz6v5yT4eB38pv84fNLzdZwlky6z0ys6tNOw5Tw27DSEIub1EzfSnsJBAWesuSGVZTnnIOUdYlHpCQKXVBW4K0fusyLxmfptIALUnQQxwi/FYy3vf+9swYUqpLorG/1CQBbn60RkreGzvOr5S+AVaOgfF8+EZVSMLCo5u1hYI=
Received: from IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 03:32:49 +0000
Received: from IA1PR12MB7591.namprd12.prod.outlook.com
 ([fe80::b648:d651:3b5a:89b4]) by IA1PR12MB7591.namprd12.prod.outlook.com
 ([fe80::b648:d651:3b5a:89b4%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 03:32:49 +0000
From: "Lee, Carl" <Carl.Lee@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shen, Peter"
	<Peter.Shen@amd.com>, "Huang, Colin" <Colin.Huang2@amd.com>
Subject: RE: [PATCH] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786 support
Thread-Topic: [PATCH] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786 support
Thread-Index: AQHclOVHdlV9WOd2d0e3Vz6IeKyMw7Vy1E8AgAAFcYCAAJVqUA==
Date: Thu, 5 Feb 2026 03:32:49 +0000
Message-ID:
 <IA1PR12MB759127AAA1EEF4DC6C1904018399A@IA1PR12MB7591.namprd12.prod.outlook.com>
References:
 <20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v1-1-67b041e2f762@amd.com>
 <20260204-sanction-lunacy-903e96c447e4@spud>
 <ec538467-9068-4ad5-b788-e60f593253be@roeck-us.net>
In-Reply-To: <ec538467-9068-4ad5-b788-e60f593253be@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_32ba012a-f724-4553-9003-9b4cf14d62ff_Enabled=True;MSIP_Label_32ba012a-f724-4553-9003-9b4cf14d62ff_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_32ba012a-f724-4553-9003-9b4cf14d62ff_SetDate=2026-02-05T03:24:30.0000000Z;MSIP_Label_32ba012a-f724-4553-9003-9b4cf14d62ff_Name=AMD
 Proprietary_New;MSIP_Label_32ba012a-f724-4553-9003-9b4cf14d62ff_ContentBits=3;MSIP_Label_32ba012a-f724-4553-9003-9b4cf14d62ff_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB7591:EE_|SJ1PR12MB6123:EE_
x-ms-office365-filtering-correlation-id: a8c1cd3a-78fa-4b89-f1f4-08de64673cbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0o2cjE5ZmlqRC9ITVdMLzJ2dHNwcjF0OHRvd1pHWm5GNjZwWEVQZ0s1TE9y?=
 =?utf-8?B?N2E3NElobEdrdXdTaGl0NUhaTHY4aGIvcDlGWEJxTEVlNGJEWFRaZTZSWmYw?=
 =?utf-8?B?dmJIeGZ5aXlveWhQKzQ2R3dDOUMxUjQydkxnWXVnekhIdkdzdnBEdmNKc2pS?=
 =?utf-8?B?Q1ZDNXNsOERudkQ3NFZjTDcxRW1JalB3d1lSQnc4UjJ0M0FDQk8rZ3JLRXV0?=
 =?utf-8?B?OGNDOGticnpkdlJFUVRsVjZsYTF2RXArYXNoWEs4Y21kNkxMUHNyTlhKZjZL?=
 =?utf-8?B?NXFZNkZ3bGdhdTFXblNPUlduOTlGNUk2RDdwMWtkNzBycFRnOTZoZEtwQTRU?=
 =?utf-8?B?NHVxSUNrd0liU3g1eEo2UStVTzJaVGVRRXdwc3RIbEJpNERucWhwL1p2NzlP?=
 =?utf-8?B?SDFZRk5CN0xBSXhkQlkweXYxT0xNeFVUV2Fia2RMdlUrb1hXNHVpWVNPZzVt?=
 =?utf-8?B?Q0VMR1BoY3doUDcvU3lQbjV1S0EvbUJSY0pEaUNMeCtwbkVXZ2lZQmRuMWlk?=
 =?utf-8?B?WUp4OHkxTmprTGp1c2hhY1pYZzZza0FrOVhVS25sTGEyWkNCRk9mYzB5enJl?=
 =?utf-8?B?UGVTMEFBTjk3WTNidUF4SjkycW1sai83eGN1SU1nZjNoMjIrbUdFdnh6WTd0?=
 =?utf-8?B?U0djRTEvdi9GOXFIakVneS9VbzJobWNDSU5iUkM3M0RsVWlkdGVuTi9rZyta?=
 =?utf-8?B?SkFQV1AwQW11YnFJNUtEeWVZcVo0VkMzY0VFTm9HcUpDNzBuSlk2L2FJL0pS?=
 =?utf-8?B?Z29GL2NVUDVCWTR0Kzhsb2FTcCtoQmNLVHA0K01MZC9LbDNSRWtDY2RmKzVG?=
 =?utf-8?B?QmRpMUtNZDljYTZDZzdjR1hGREZjWlp3WGFPS2ExUnc1SEFNWnA4QnBHOUFV?=
 =?utf-8?B?dWhaNTdvVS9rcXptbGpxSURyaEM3YzRjMWMrRTAzSm5odU9VSnZYUlBreFN5?=
 =?utf-8?B?aXdPUFd3ZGc2UkNLWUdPcm9XMnFEcVl0WGZCQnJPQmNYTFN0cFRHV09qR3pJ?=
 =?utf-8?B?em94bjYvZTZJZ0ZVWGNCSktnQUFQaThTVkxOWmV4eDl0bXZmY0J4WVEwR0hI?=
 =?utf-8?B?ODc3VHhjaHpSV2taV0pGc0JoOW1EVml3N25PYmpnVDBZK0JCWDZwV0xmeEtu?=
 =?utf-8?B?YlRIWUhEOHF4TTBlNE8zK1BEYmc5Zk0vU3lTVVZTTTByY3ZGM1A0ZExOdDBK?=
 =?utf-8?B?aXo2c29vUlNDWkV3WjVab1RiWUk5dVhzdjlWaEtYUmhXWDlWVld2MkZjZlR0?=
 =?utf-8?B?ZXFxdzU2cEJSZXZ4OEtvb0dDSGl5YmtEUmR5bGJ4KzNHM1lEUUYxdmo2d2Rn?=
 =?utf-8?B?THgwUmp6Tk94cUtRNFZoMWU4T2MxdE5KdUk2aTIvQVRocG9RRzBnRmE3Zmor?=
 =?utf-8?B?Z3ZiTDNVS25KcXJ3L2xRbWNzb0U2QTF3UnpobHF3SGgwcFVkak1odTVLYWho?=
 =?utf-8?B?SzJKT1k4S2dTbEozcVQxTU5PNFlQL2d2QnVlT2lJeDV5dVQvUThWVmtmUU5G?=
 =?utf-8?B?K1YwOFRkd21JUkRDcldsRFhpWWNzK0JDc0crQkROdDJLN0tkRysrZXVsSHht?=
 =?utf-8?B?NEpCZm5UeDJDZWhmWGYvTnhySkRpNzlrMko0ckJxK081SnNXZGk3bjNPdEVE?=
 =?utf-8?B?R2dZUGpEOGNEVXAyOVJ4R2FEblRvakpHYW56aW5odGJTdEtjK2xSejFUdzc3?=
 =?utf-8?B?bDBUWE5UYW1Ya0R3UDdsc2YybHZiL21heUlneDZjd0E5cWpqdEJ3d21ra08v?=
 =?utf-8?B?T1Z0Z0JYQjZXbTNzWVgra2I3K1dFL2lkencxSEJlMEpleUNFUFhSZnhxZ0Vv?=
 =?utf-8?B?QjVKT05zdE5XZXVkTnd2K3NkSnk1V2hFYk12Zi8waW9WbkRZTHZmZkxoRUZE?=
 =?utf-8?B?TGxSaFJjTitBYmxJRFBHeUJYWDlJQS9DcHVUWVNVa3JwVm9PNjExTWpVVE9k?=
 =?utf-8?B?UEkyZ0t3d0tzVEdBUTV0M0NzT2JHczBHVEU3RmxHTktvU1B1cGVxQUNPVzNa?=
 =?utf-8?B?YVdjeENaaU16ODhwb2dwd1ZVTjBjVi9XMUlwNncwWFhha2N1d2ZpMFdBU1or?=
 =?utf-8?B?ZVVDV1VycTZvb21YLzl1dXFnby9MWGdTa0hndHdCN2lnckpUM0dGeExaYytH?=
 =?utf-8?B?MEh3SGljNUx4WlRBTExEcm1laGFYNThJY2xEd3FweXFQZVdscW04ZXVBTlpX?=
 =?utf-8?Q?JYm0+y9z1Y2hlXYuPO9ua7g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB7591.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGtaK0k0SzlIVzY5eFhxYW9Ib3JQWVpNcnpKRXhaZ0pHaDRZVHpNenB5Zzlj?=
 =?utf-8?B?MWRFMkZxclhDOEg0SmtEMHFQL1pOQld2dnA1SlIzVUZxSk5xdjBqTlhrZitw?=
 =?utf-8?B?bXVCR3ZQcnRsbWtRK1JRL2cxdGp3R3IyS1NSczJBbXZVbWxqWEo3V0lTaENp?=
 =?utf-8?B?RzQzRzVNVERid2pnenNJQkNjcUVpZlQ3Y3lIYVM0eFg4WXVwaHM0b1dCVkZ5?=
 =?utf-8?B?dXVWVWlWZktPR3pmNkxkUVpJVWlvM2xmbEM4aWRPZFdabEdqb3pKSDl3V3U4?=
 =?utf-8?B?MDRTTFZ6WjNIV3hMc1hPNkNmdUFkVHU4L05lTlZYREd3TGFac3oxWlBVQm05?=
 =?utf-8?B?NDVtYnp2TXFLeEtIM2pOQXgvM1FKejQ0cEFVTWFQUWMveFhzK2FRWkpJYVhy?=
 =?utf-8?B?UUxrWW9EbTNOQXlWWEE1M1ZCSmZCK3FwaW52U0V5ejlhUXdycTdMNzJwS241?=
 =?utf-8?B?amZNdXM1K0Z3UmxHeU1QMUpRUzVRbzk1MlhFSXNRdnI4VncyekliQzN5azdv?=
 =?utf-8?B?S2xLYUlWbTlvMTdSY1dTeW5TRVJuZHhyT0txZ2RMVllsZ2NRaXJ6UzN2blhS?=
 =?utf-8?B?M3lEeXg5Wmc3Ni8vNmFUMkFVN09CTlRLQnBFdVVCM0lHSWdISTJlLy9vQmhF?=
 =?utf-8?B?OGI4NTI4dUhCWWRlT3FxSU1kQWhpSGRFT1R6NnJJNFE1U09kQ2dveVZlUnlD?=
 =?utf-8?B?ZWVUclZPYy9EV2QxaTNuLzcrcmpWdDNJUGlIdVpuaUlQbmZIUVpNSGR1YjEv?=
 =?utf-8?B?MkhpeWJuUWx1cUhyUDV1RlFudVRhcEpVbkVHazZCc042ZFo1NFpnQzlwL05K?=
 =?utf-8?B?SFJHM0l0TXp2blF5T3JFek1rSjJhWnNzanM0UG5kRGhlNnlZRWpmbTBOODF3?=
 =?utf-8?B?cW1aTnVuQnN4ek5PMmRoOTAycVBYRG1Ob1lhWUd0TDMrMmRsVmpBM0psU3Jj?=
 =?utf-8?B?dDFFaVBncDRCdFFZWHhwMDZXeHB6SWdxQnZKSWo1eTI1aUgrc0tZY2tveDZT?=
 =?utf-8?B?cXFhb0FaV09lKy9aU3g4Ukd2SVpCaUxSbThCZUROSmZBR0o4cXRNaTVTMU5E?=
 =?utf-8?B?WndpWDNnZEdkZHZIcjRHYklpSjF6bW5la0VveFkzcDdDSlBpdFJiQTh4cVNY?=
 =?utf-8?B?RTFQVWpyeHlybzZSNzBUY3FlcFZlWE5OaEp5NVpIUU9QRytZQ0h3K1RuTGRl?=
 =?utf-8?B?ZThzUE1MNkQ2YW5YL3RKb2VDZDBkcDVlSmYwM09qRFdPcTNWRExZUVc1blZS?=
 =?utf-8?B?aTAza2pwMUNMNyt5emc3SFM5S05DZ2V6blFDUHRTbEsxKzlrZEUyV2l5d0c0?=
 =?utf-8?B?bDNObnFPZW5jL2hmNlpKRW9DMm1sWVFXQ2hEelgxbVRtOW1FN3dudXpuNjE5?=
 =?utf-8?B?T3FKQ1M5OWkySnpwVlBlc2hOSVJJc2wwMWNFY0pkY3laUFZVVDMxOVg2eE1E?=
 =?utf-8?B?YmoxS0h1QVBROEFsbGExU2JmcEVveVp3aTB3RG9IeXBLRUVrdWhWa0UrUFJ1?=
 =?utf-8?B?RkZ6NHd6VnFoMEZ2VjRLK1RoZ0NCWmZxUGwzZW0xNE5RRy9OVnBmS1RCdDN4?=
 =?utf-8?B?Q2VrWFFSd3U5dW90ZHVMbzN1d2hDemR4TzR0Qi9CV0Z1QVRhdmZSbXNaT3Mx?=
 =?utf-8?B?Y0psNnI0bFVkZ1k5UnI1cndTSWxOZWVSZkhmTjdZNm05eWdGWDVEd2djVGF1?=
 =?utf-8?B?RjBwczVidGhlUmdGMTR3TFZwczBMdVFhRHova2tsSXduNU9WTE43ZEZCMmRW?=
 =?utf-8?B?QitmUTVtQW1TOTI2MitwQlpxUDQwTWdZR3BLMy9acVdleFBlRjdRa3RJK3gx?=
 =?utf-8?B?NVNXMnpyT3BjYWd5NWU3SjVmOEN2R2dMMHZpNEdiSVJGdEh2b0haU1lWZVIr?=
 =?utf-8?B?UG1jVERhSjRDSUI2N3lPT3dBOU1VcEkzT0hueWIrQVp5T3UweWpxVFFrTkln?=
 =?utf-8?B?dkczUU5jc0c3M0hiTWJKYld1VVhtNmhIUWUzdURzU0RaZGMrN3hSNjdrVzdE?=
 =?utf-8?B?WHBuTGNwVzVlUHNDc1NHVlFFSHRvVXJEbGdldjJhRlAwVGJEZjZOOEJTK3N3?=
 =?utf-8?B?SjNwNklya2JYWld0bmRZbDc2anRjaGVwL3p5dkh6dUMzRTF4Zmo5ZmZGZEt6?=
 =?utf-8?B?TVAvelYvVGxjQ29KVHY2RzJ1T28wTHlaOVNtY0NXdGtJRHR3SDFhYklQcTg5?=
 =?utf-8?B?VzRRVGFjQ1JJRFpKUmwrYnRJYWt4TWNzdHQwL0J3Rm9RVi82bmViWWZqSkZw?=
 =?utf-8?B?SEhBRXpib2FQN0V5aGxtbmRlQTRsQzZCTjFodWZ3MHZWTFBvVitpcXJnN0dV?=
 =?utf-8?Q?909JoCM/vvLzbhrB7v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7591.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c1cd3a-78fa-4b89-f1f4-08de64673cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 03:32:49.5974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIRbrzHigGKRtlXABwbekS+AKrK8siLvqJ1aRbU/VW/5O6wWuDyYLQkj99Z7aK64cd0wXsimhmSwnX9F9wCi8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123

W0FNRCBQcm9wcmlldGFyeV0NCg0Kc29ycnkgZm9yIHRoZSBjb25mdXNpb24uDQoNCkkgZGlkbid0
IHJlYWxpemUgYmVmb3JlIHRoYXQgZHJpdmVyIHBhdGNoZXMgc2hvdWxkIGJlIHNlbnQgYXMgcGFy
dCBvZiB0aGUgc2FtZSBzZXJpZXMsDQp3aGlsZSBEVCBiaW5kaW5nIHVwZGF0ZXMgc2hvdWxkIGJl
IHN1Ym1pdHRlZCBsYXRlci4NClRoZSBjb3JyZXNwb25kaW5nIGRyaXZlciBwYXRjaCBpcyBhdmFp
bGFibGUgaGVyZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIwMy1od21vbi1w
bWJ1cy1tcHE4Nzg1LWFkZC1zdXBwb3J0LWZvci1tcHE4Nzg2LXYxLTEtOWZmOGM3YzUwMjQyQGFt
ZC5jb20vDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugd291bGQgcHJlZmVyIHRoaXMgdG8g
YmUgcmVzZW50IHByb3Blcmx5IGFzIGEgc2VyaWVzLg0K
