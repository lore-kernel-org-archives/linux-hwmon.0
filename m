Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A0B2F2910;
	Wed, 11 Feb 2026 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807069; cv=fail; b=NWwK3IU0GU6Id6QJ5ney0f53mqovle2yeKAeDXMoXcL7XkFK7m1VFX/8xohKN6xLyHTO1tLfKqsCSdKLlrEHhnlywmFoq57D2d0ZMtO14Damk2VZCsrGgJzMqcIxd9wIwi8DVyxLw3sGVCNsyjWj95TsI9FwmRhb73lKrYMyC0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807069; c=relaxed/simple;
	bh=9KIs/jfQWLq41lLUsowByzCJk6mvGZsQlDyHghv+bik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VfiD7kKxD1upK14TjEMbF7Yf+ElEevJ5wLH+vOqAc5KpcCO2foOK0DFR/RdNX8pPWuN2coY+bV7FpQFjnN5UAIuude6ng5yJJQaiHtO6JGTgMkmx/di0v7OF4dJRQZKq8x3qA3nGRB7/HSz8tcwR7E2jOLWxSLL5Te/z/c7Yw64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=LX70nHjk; arc=fail smtp.client-ip=52.101.61.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LX70nHjk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLzgpUoAYDXNcCnYf/TQvY/5aOxLMYA06USX+/KG5AfkXbBZWONR1euxNAY14GWnjJEkHOEdYMCCxzGPc28zlm7zr+bTO9Jd3LLpTOs+OwGncwJV8VanyHowdb5wRXusqDreWm5TN7APyqWP3ozt9p5Fk86TrCBk6rMhWG/0t/l3p3KXfRCpWGD4Rs6nj6U1Ab36mISrOpip30wlVk6RgBVZTlNIxzU/LPZ/tbQ0ZFcA3UzlAfbvt55mikCYfOAiPzbKtBCcJqa4SYRkrpjYIzjlTjPVcWtaY6kTSOjbOGIAxtvsEwSGOHiHrz3WdD69P2aMgJOc36Nsl1jZyuGj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KIs/jfQWLq41lLUsowByzCJk6mvGZsQlDyHghv+bik=;
 b=skK4MIRFp5ObgVa+XDb//uZyvXwgRLEJ6lDMzAImzNFHoO4vqjPTMd7P3eV932GwWbzboqUGnCDmFf/0qMeXeq40kFI4esW0rlkHz8jWOySF3MDNIgASsFgtgkspxobEKI8e/f+6yMhyi8l4ftcqKx041mLt0z1ibfV9MfPIn9rw1R3GeGWa7KQU/L1is67j1dSlZhKA5cj1olR+slWWpvQxC7bhWynz0pSQbaP+BIdle8zxxVkWOFlLewLommGWr3Ae6ZTMiMuJRMBHnz6Bk/L6We82IWqL8TRjUa/Ibrh6SyJ5NMGuAI29Yb2tP6YMtJpvisoMJmlzLVOYl75lpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KIs/jfQWLq41lLUsowByzCJk6mvGZsQlDyHghv+bik=;
 b=LX70nHjkJznxiL+sI/5am/QF/apG7MvQh5RzDtMto/Ri/vXkhC09s/XeHjAA0VtdPQmjkC7ikmaDQQxfBH3PKWaU2rMhQn60SE0p/1eoCV7LYCL7qGGsIn4dUuECayXaSIhbr59I8XO7FrpYakx+7c/3bHlGfuszVcAQftdEcsSFkVW0yC/bTTEGhlJQkfQd4zrxbk0jMM2tebJrooL4EPko7K5t9DQU0bqfzN1/hCl7xEAoH7LYvWMHdCkJlxIEavz8f+0t1NVxdQivT/x+FRqXq+SJP0QllSRfZUASYtiOwCRajtNsVh4mtcdIggKNbnLsxoQGpFQwLEjrrKwKQA==
Received: from PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19)
 by SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:51:05 +0000
Received: from PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae]) by PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 10:51:04 +0000
From: <Marius.Cristea@microchip.com>
To: <linux@roeck-us.net>
CC: <corbet@lwn.net>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <robh@kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-doc@vger.kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v5 2/2] hwmon: temperature: add support for EMC1812
Thread-Topic: [PATCH v5 2/2] hwmon: temperature: add support for EMC1812
Thread-Index: AQHclm5bxdKKVniJ+EWxGEM2KkA0lLV03bKAgAh+F4A=
Date: Wed, 11 Feb 2026 10:51:04 +0000
Message-ID: <ad09b199f64336b7c5c07b2253b2c3f4bfef95d3.camel@microchip.com>
References: <20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com>
	 <20260205-hw_mon-emc1812-v5-2-232835aefe8f@microchip.com>
	 <402ba937-226d-44be-8411-428a8842a35c@roeck-us.net>
In-Reply-To: <402ba937-226d-44be-8411-428a8842a35c@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6005:EE_|SJ0PR11MB5102:EE_
x-ms-office365-filtering-correlation-id: 6ee55bc9-dd22-41c2-9153-08de695b744b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vy81anQrRTRMNTJMOVUrSERqVmwzRDhFRklBaHE2anh2WXRFMHVGNE9SbWZY?=
 =?utf-8?B?Um5SOHM3VUJMcG14djB3SEtnajRCQytTWkovenBKWno1dng3SVBiUU16Y0ls?=
 =?utf-8?B?aUxXWDBkR3hDbXhWSFFoY2kzbjhlMW1YOFBqNFRYWEd1UUpXV0xVbTBxMWlZ?=
 =?utf-8?B?cGhYMUVxYVpEbUNROVRRN0pRL1RiR1pEbFJrRktqS2grMGNKaDFJaDZ1cmlX?=
 =?utf-8?B?ZG8vaUprWTFtY0ZVbFp3bkZBQTNaV0dROUFycGVtamgwYWczWkg2SlplYWhW?=
 =?utf-8?B?aFdvT0o2eHVPMTVKVk8xM01zb2c5UjU5ZUtMNE9xSzFDZ2dGSzkrNCsrRnVq?=
 =?utf-8?B?TEhVeEhEMDJQakFucXhDMERWMm96MU8zY2VqM0hzQUdZdXU2WVpvQWtabEl5?=
 =?utf-8?B?MjhqTVN6VW1keDE5engxTUYyZGJrdUlPYmFtRS9XdHEwanI5TzU5K1I5TWwy?=
 =?utf-8?B?b1hNc3ExNWZ6MnBWQ3pNemVDeURNVlVtQmRkczhMellYdTNFdFJvVTdBY0h3?=
 =?utf-8?B?M3pVQWhub3ZjRStGTVY1QjFnZHkya3BUcTU0QU9UempWNEN5enQ4K2dzbG56?=
 =?utf-8?B?LzF3QzVsWHNaUXJRWnBpZXdjZWJ1S2R5M0JCVVRnTWNnS2p0cDlwYkNKTjVx?=
 =?utf-8?B?VndWSzlhcUhzLzRMeTdpK2M1d2FTMEFxSVBMaGlUaVNhTGpZVmVJM09FUFdG?=
 =?utf-8?B?THpUQi9TYjluRFRKc2NCdUgyeDhFcEtjdjhKbStzVEFpajg4MEFGazVFcDdq?=
 =?utf-8?B?ZVA0RTZ2aFFaelZFL1owSVkveUZxdEdna2RpcWVrNXRuYU1uQmo0K2Fna1Fs?=
 =?utf-8?B?QUZkUmQ5VVQyTFBVR1RrU016eGRZZng4Y0RPSGM4akVVemVDNHZMcjBwcitx?=
 =?utf-8?B?YWxwdWU0THQ4bG9PcldtczdsVnFHaGdUYUZLYjVHa2hTanhXc2Z6bFVpTkhH?=
 =?utf-8?B?UURGMVRqNEUvTjBlZDNzRVRqcEt1a1RNODBnYjhyRFQwR3BIckxBUExtRVA3?=
 =?utf-8?B?cXhpUFFsU0szRnIvSzFTZkhFREErVnNRMGpGVWZHdklDUk1FOFU2dTlHcEVV?=
 =?utf-8?B?VnhidDFaVitTUCtzWnVYb3kyb1ZaZkpLbHB3RmZXalhIUGk4d3k0cllLaWJR?=
 =?utf-8?B?dHhyVHk4UnRHbFp0bFN1MHdGaUpWdXZSS2RLSGFVTUUzenRXWHBiYnAycm01?=
 =?utf-8?B?RERnRTdDcVZHUUNNcEd0WlNOTVRRRHIrdk5vNFIrWVBGUS9xTGc5SmZsSUk2?=
 =?utf-8?B?MnM2aHdUWTN3N2pXeHZnZkxKbE9ZdnVIOVpGamJvY3BQRzlqYVB1bUtXRzFU?=
 =?utf-8?B?ZTMzOXdjOVhIbE9Udk1ZZDRBR1FKRzhnOXB5d1BoVjEzdm5GbUZTSHcxd0x2?=
 =?utf-8?B?WndzUW0yMm5qeU96VmY2Zk00dzZiN2NhYUJVaWQvRGp5M251K2FpOWlPVzJo?=
 =?utf-8?B?V0RJWSt2NGtyNVNRckN0Mm4wS3pZTU5XaVFBbFVvY0xuMnJSNjAzZUQ4YmlH?=
 =?utf-8?B?Mld0ZW4zcUlrR0VpaXpRT2ViSk5VQmVsKzQyRGhNc0RSL2VFb2JWeSs4cFR2?=
 =?utf-8?B?SHBEdUw1UzJGNEwxVnNyNHhoNkhMTGpZeUtad2pJNjJ5ZFhXR3lnaXEzaVVM?=
 =?utf-8?B?RWVUUGo3VG9COURyallQR0R5S0VTVXpqeE45aGoycVFPUmRnK0VhM0xSYitE?=
 =?utf-8?B?Y1VtQmkyd0RSOUhVU2RoNHEvd2RKY2hYMUZMRzVFdGdDNkJHQzhxMkpFVlJy?=
 =?utf-8?B?VGdaVHcxSGhzbFlJZTE1YXZvcVhpQnNjTUxKa0IzQmpZTzJHaWxPYmdzc2Qz?=
 =?utf-8?B?a3ZqejZRc3RtUkdReGJrdFV3SllZa1hhczVBNEZQa2RTSUpYcFdyVDR0ZFVN?=
 =?utf-8?B?QlNweEtvcWdiZkJSN3M4aUNHc0VsRC83VndmcytpWnozWmhJVHc2QXZRb0VT?=
 =?utf-8?B?R0RmNUVzTWIyZmJ6ZTJlK1lWb254ZFV1bUExQ2xXa0J5TXIvNXRYakhBbnpn?=
 =?utf-8?B?WmZ1ZTYyNEprSjBrdGtOS1oxYm5ySkwxZWNpWk5JeXJ4WEJsY20zV0s2d3E1?=
 =?utf-8?B?bGxXM2w4N0N5TndCK3B3NldFSFR3ZVA2V3daK0FhVGp5KzBoTCtNcFpteERK?=
 =?utf-8?B?cHEzU0Q5QWFKUjRqTXlkUnltZ2Q4aExsMVVTbkVNYzdlTXZ1NlFzMDA2U1Q3?=
 =?utf-8?Q?C0g1NLNFOTho6s7XJg8/cv8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3hFekUrSC9SOFh1SysrZmxGWnFSUkFGakJJeFBUNnFlSk1lVTZ5YmtFTFRz?=
 =?utf-8?B?L2FWbGdyR3NTWW5yZENnR0VCOHNzd2Noc0ZwQ3hLM1V5bzlKWkdpUzBsdHk4?=
 =?utf-8?B?d0VNQXBaYzhsQnRKN2hwRTBNS2d6OGk3TzRQZWs4MFAwMmttcURkdjJiSCtC?=
 =?utf-8?B?dk1Hb3hRb2ZxeEViTWpyVUk2OTZTN3R6SnlidlJBT2hXRkJYZU5rVjM1QzI0?=
 =?utf-8?B?UkhrcURlYkZYdXNwSkp2Nlg0NVZZMkVPT3JUc2pkSUFpRG1LZnk0WEwwdmFW?=
 =?utf-8?B?ZUxIbG1ocmhSKzBWQ3ZSWUk2QW1qeTBNbStYR3B2SnRGRXBGaDQxNDdkS1I4?=
 =?utf-8?B?UmxDd3Rpc1FQcGNVN3V2QlRVWWhud2FPemxxUmNvbU1SN0JURVo0dFdBU0dB?=
 =?utf-8?B?dGE5cmdvOXd0WmVuQkx5RTdnUzczcUMzbUFFTEs2SlpEM2FjeENVeExHNmdC?=
 =?utf-8?B?MnpnVlZBZ0I1UEFJQVdoamJuaWJMOVRjT09MSjIxSk0yS0N3Y0VYNnVJWDZ4?=
 =?utf-8?B?aWpvWUZxS0dNZDZqMUVrM3ppc0ZBOGE4UEw3dmpVb2FDQlhwSlc2SXhlVTBY?=
 =?utf-8?B?dThOODRUa0VXRVVvWmVScDFOM0NNZU13cVZvQkhGSkp0VlgxbERkWldsNmU1?=
 =?utf-8?B?dHZrYXFuWVlwTWNaWVhKME02ZlpuMngzVGpOOHJKa2g4T1hMWW1pL0g4TllZ?=
 =?utf-8?B?N0JrQmJ2MGc0L0EzcnpPa29qNGc4U1k3UzBYYWdwdTM1NHIyUS8xbno0RThF?=
 =?utf-8?B?WFNnSFg0NVhOQW1sZHRzM2RyZHhHd1VheWVxemNIcUZPUEltZ25oZC9zYXdt?=
 =?utf-8?B?R01UYmR5US84SEsvZjk0ekxXWlZPaXRLOXRtRE5NMGdqRSs0Y0RTcWdkblNK?=
 =?utf-8?B?cWdTSmwyN3BUUGlSSEFTVE5pL09Cd3prM25tai9PRjNPa2NFRXg1MFBPOFZX?=
 =?utf-8?B?N21kdWV6YnJicE1BenZvMEt6anBVNmdON3FwVy9rdEZhTFNpak9Xb3VmdXkw?=
 =?utf-8?B?eFZzQ0kzY3BDbERiN1h0Mkg2T0ZjQXVJZ3Q0d2EvOEUyTUNnZ0czdjh0V3U4?=
 =?utf-8?B?YS9zNzBvUFhrMmtMT1ZUbTFycXhRSEpBd3VXeTUvUTRUd1hkd29kTTd3Qis2?=
 =?utf-8?B?b0V4RzRQSDFUaGtjV2FWd1FxWmxFSFVGSGlZTW5Icy9oMjZSL1NYOUd1Ukhp?=
 =?utf-8?B?UmVuL2xGMHpnTWNvTFF2MGlNODhCdXBYV0RMNTBKYlRJQ0JjaldxeHM3aTF0?=
 =?utf-8?B?eTZVWitMQ2o1US9QUzlCeVllU3k5d1BXUHB0YWE1b2JOcjNMZElnYitjUEEy?=
 =?utf-8?B?Ny9VYmJNYVp4Tm9hck9aak5WSTFPNDZDcmg3YkZPQUZnd2EybE5mQk5Oenh0?=
 =?utf-8?B?aE52ZnZhTEtxMFNCNjJPbUZuVUNzZFVnOUsvMHZXR1Z3T01QSlJpaTQ5VGdz?=
 =?utf-8?B?MnpmVnZnbTZVK3g5ekp0NjBGV3lGL2FuZFR6aVBpMnFFNW1uaElOSlY0TzJH?=
 =?utf-8?B?Mm9pN3FjdzRHYzE0NTllMDVPejVlRWw5L2Jjc1d5bnFmUGVweittTUZkaVJ0?=
 =?utf-8?B?QlF3N0V2QTMxN0JZcXRkaE1NZHJQV1p6NENZS2d4YzZpcktVUFQ2YWZOVEtJ?=
 =?utf-8?B?NWpHeHJGRURoVTJiYlQzRUNBN25FQnJZRE9hS0t6TXo1QXdQR2tVNXUyendN?=
 =?utf-8?B?RnpIQlJxVjdlUnpTQTZUQmJPWCtjQ2x3cG1sbnl1WWs3bnl2RlQ4L2VBeEtO?=
 =?utf-8?B?TUxleUcvTE5veXpJclkydDkvTHZ2dUhVR2J0ZFJCczJSc2RRZ0ZYNVpLUWVo?=
 =?utf-8?B?Z3hiczc5MTZhdWRnNi9tU2FmQytvdVJSN051QmRNYmFTNjlXQ29GcEJRQUtl?=
 =?utf-8?B?THJ0MHJSWHF4SnJQcTR6UHBneEwzVkZCNTQ0RDYya2ZMMWhUdGRZTlpxL0lN?=
 =?utf-8?B?eTBnN01MVGE2TUVWT2NKQkp0bTlLUUVrTHIyQkh4am02b1c5aFNtdXoyTVJt?=
 =?utf-8?B?YnE5YkNuTGpJemtLZm9jK1lLS29wcFF2RVdDWDZBMXg2RHB0aTNidmk4bk02?=
 =?utf-8?B?UkFTVHgrNjlCZWIwdTJUVGVrTE40WXRCc2o4cXlNNEFoZTAxQ2VLaFBObEVJ?=
 =?utf-8?B?ZitDZS9DbzJnbW14eTMzZE1pTWdjSGRCM2IzeFZLdWdmWXpCMUdiYWtzaXNK?=
 =?utf-8?B?WHFsUndkOEw3ekFZMHozRGIxUDlFVk1wWmV5Z01zcFZUb1I0VGQrNVNwN2Fm?=
 =?utf-8?B?ZzAyZitobFUwbzFvMlNmWUFUdGp2NERzT0d6aENvOWc0eEszU3crTHRSY3Vy?=
 =?utf-8?B?Qmp5NE4weHFCd0cvbHdrZDdrL2dKd0dlSldSUzYwU00zbGFCTFdNRlR6L1dF?=
 =?utf-8?Q?n7SvqjLGPwoBZN4Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <239329744F080C4E9716E156F847E88F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee55bc9-dd22-41c2-9153-08de695b744b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 10:51:04.6700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCy07vmXqabZjTyoMVVG6Fsu0shGiXDmooaqB/PvyajkUogY4Rgs8nLi4XyWxKczuOXx6kOIoci/J5EVt3FSv46S9utEASpMQPnMfm4I978=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102

SGkgR3VlbnRlciwNCg0KICBUaGFua3MgeW91IGZvciB0aGUgZmVlZGJhY2suIFBsZWFzZSBzZWUg
bXkgY29tbWVudHMgYmVsbG93Lg0KDQpUaGFua3MsDQpNYXJpdXMNCg0KT24gVGh1LCAyMDI2LTAy
LTA1IGF0IDE3OjA5IC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQ0KPiBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFRodSwgRmViIDA1LCAyMDI2IGF0IDA5
OjA5OjA0QU0gKzAyMDAsIE1hcml1cyBDcmlzdGVhIHdyb3RlOg0KPiA+IFRoaXMgaXMgdGhlIGh3
bW9uIGRyaXZlciBmb3IgTWljcm9jaGlwIEVNQzE4MTIvMTMvMTQvMTUvMzMNCj4gPiBNdWx0aWNo
YW5uZWwgTG93LVZvbHRhZ2UgUmVtb3RlIERpb2RlIFNlbnNvciBGYW1pbHkuDQo+ID4gDQo+ID4g
RU1DMTgxMiBoYXMgb25lIGV4dGVybmFsIHJlbW90ZSB0ZW1wZXJhdHVyZSBtb25pdG9yaW5nIGNo
YW5uZWwuDQo+ID4gRU1DMTgxMyBoYXMgdHdvIGV4dGVybmFsIHJlbW90ZSB0ZW1wZXJhdHVyZSBt
b25pdG9yaW5nIGNoYW5uZWxzLg0KPiA+IEVNQzE4MTQgaGFzIHRocmVlIGV4dGVybmFsIHJlbW90
ZSB0ZW1wZXJhdHVyZSBtb25pdG9yaW5nIGNoYW5uZWxzDQo+ID4gYW5kDQo+ID4gY2hhbm5lbHMg
MiBhbmQgMyBzdXBwb3J0cyBhbnRpIHBhcmFsbGVsIGRpb2RlLg0KPiA+IEVNQzE4MTUgaGFzIGZv
dXIgZXh0ZXJuYWwgcmVtb3RlIHRlbXBlcmF0dXJlIG1vbml0b3JpbmcgY2hhbm5lbHMNCj4gPiBh
bmQNCj4gPiBjaGFubmVscyAxLzLCoCBhbmQgMy80IHN1cHBvcnRzIGFudGkgcGFyYWxsZWwgZGlv
ZGUuDQo+ID4gRU1DMTgzMyBoYXMgdHdvIGV4dGVybmFsIHJlbW90ZSB0ZW1wZXJhdHVyZSBtb25p
dG9yaW5nIGNoYW5uZWxzIGFuZA0KPiA+IGNoYW5uZWxzIDEgYW5kIDIgc3VwcG9ydHMgYW50aSBw
YXJhbGxlbCBkaW9kZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJpdXMgQ3Jpc3RlYSA8
bWFyaXVzLmNyaXN0ZWFAbWljcm9jaGlwLmNvbT4NCj4gPiAtLS0NCj4gDQo+IEFkZGl0aW9uYWwg
QUkgZ2VuZXJhdGVkIHJldmlldyBmZWVkYmFjayBiZWxvdy4gUGxlYXNlIGFkZHJlc3MuDQo+IA0K
PiBUaGFua3MsDQo+IEd1ZW50ZXINCj4gDQo+IC0tLQ0KPiANCj4gIyBUYXNrDQo+IERhdGU6IDIw
MjYtMDItMDUgMTY6MDA6MDgNCj4gTW9kZWw6IGdlbWluaS0zLWZsYXNoLXByZXZpZXcNCj4gUHJv
bXB0cyBTSEE6IDUyZTVkZjYgKCJ2YXJpb3VzIGNoYW5nZXMiKQ0KPiBDb21taXRzIHRvIHJldmll
dzoNCj4gLSAwZjYzMDNjZmZhYWIgKCJkdC1iaW5kaW5nczogaHdtb246IHRlbXBlcmF0dXJlOiBh
ZGQgc3VwcG9ydCBmb3INCj4gRU1DMTgxMiIpDQo+IC0gYzVhNWIwZjM3MGYwICgiaHdtb246IHRl
bXBlcmF0dXJlOiBhZGQgc3VwcG9ydCBmb3IgRU1DMTgxMiIpDQo+IA0KPiANCj4gDQouLi4NCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaHdtb24vbWljcm9jaGlwLGVtYzE4MTIueWFtbA0KPiBbIC4uLiBdDQo+ID4gK8Kg
IGludGVycnVwdHM6DQo+ID4gK8KgwqDCoCBpdGVtczoNCj4gPiArwqDCoMKgwqDCoCAtIGRlc2Ny
aXB0aW9uOiBhbGVydC10aGVybTIgYXNzZXJ0cyB3aGVuIHRoZSBBTEVSVCBsaW1pdCBpcw0KPiA+
IGV4Y2VlZGVkLg0KPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IHRoZXJtLWFkZHIgYXNz
ZXJ0cyB3aGVuIHRoZSBUSEVSTSBsaW1pdCBpcw0KPiA+IGV4Y2VlZGVkLg0KPiA+ICvCoMKgwqAg
bWluSXRlbXM6IDENCj4gPiArDQo+ID4gK8KgIGludGVycnVwdC1uYW1lczoNCj4gPiArwqDCoMKg
IGl0ZW1zOg0KPiA+ICvCoMKgwqDCoMKgIC0gZW51bTogW2FsZXJ0LXRoZXJtMiwgdGhlcm0tYWRk
cl0NCj4gDQo+IElzIHRoZSBpbnRlcnJ1cHQtbmFtZXMgc2NoZW1hIGludGVuZGVkIHRvIGJlIHRo
aXMgZmxleGlibGU/DQo+IA0KDQpZZXMsIG15IGludGVudGlvbiB3YXMgdG8gYWxsb3cgdGhlIHVz
ZXIgdG8gdXNlIG9ubHkgdGhlIGZpcnN0LCBvbmx5IHRoZQ0Kc2Vjb25kIG9yIGJvdGggaW50ZXJy
dXB0cy4NCkkgd2lsbCBmaXggaXQuDQoNCg0KPiBUaGUgY3VycmVudCBpdGVtcyBkZWZpbml0aW9u
IG9ubHkgY29uc3RyYWlucyB0aGUgZmlyc3QgZWxlbWVudCBvZiB0aGUNCj4gbGlzdC4NCj4gSWYg
YSBzZWNvbmQgaW50ZXJydXB0IGlzIHByb3ZpZGVkLCBpdCByZW1haW5zIHVuY29uc3RyYWluZWQu
DQo+IA0KPiBBZGRpdGlvbmFsbHksIGlmIG9ubHkgb25lIGludGVycnVwdCBpcyBwcm92aWRlZCwg
dGhlIGludGVycnVwdHMNCj4gcHJvcGVydHkNCj4gZW5mb3JjZXMgaXQgdG8gYmUgYWxlcnQtdGhl
cm0yICh0aGUgZmlyc3QgcG9zaXRpb25hbCBpdGVtKSwgYnV0IHRoZQ0KPiBpbnRlcnJ1cHQtbmFt
ZXMgZW51bSBhbGxvd3MgaXQgdG8gYmUgbmFtZWQgdGhlcm0tYWRkci4NCj4gDQo+IFNob3VsZCBp
dCBiZSBkZWZpbmVkIGFzOg0KPiDCoCBpbnRlcnJ1cHQtbmFtZXM6DQo+IMKgwqDCoCBpdGVtczoN
Cj4gwqDCoMKgwqDCoCAtIGNvbnN0OiBhbGVydC10aGVybTINCj4gwqDCoMKgwqDCoCAtIGNvbnN0
OiB0aGVybS1hZGRyDQo+IMKgwqDCoCBtaW5JdGVtczogMQ0KPiANCj4gWyAuLi4gXQ0KPiA+ICvC
oCBtaWNyb2NoaXAscGFyYXNpdGljLXJlcy1vbi1jaGFubmVsMS0yOg0KPiA+ICvCoMKgwqAgZGVz
Y3JpcHRpb246DQo+ID4gK8KgwqDCoMKgwqAgSW5kaWNhdGVzIHRoYXQgdGhlIGNoaXAgYW5kIHRo
ZSBkaW9kZXMvdHJhbnNpc3RvcnMgYXJlDQo+ID4gc3VmZmljaWVudGx5DQo+ID4gK8KgwqDCoMKg
wqAgZmFyIGFwYXJ0IHRoYXQgYSBwYXJhc2l0aWMgcmVzaXN0YW5jZSBpcyBhZGRlZCB0byB0aGUg
d2lyZXMsDQo+ID4gd2hpY2ggY2FuDQo+ID4gK8KgwqDCoMKgwqAgYWZmZWN0IHRoZSBtZWFzdXJl
bWVudHMuIER1ZSB0byB0aGUgYW50aS1wYXJhbGxlbCBkaW9kZQ0KPiA+IGNvbm5lY3Rpb25zLA0K
PiA+ICvCoMKgwqDCoMKgIGNoYW5uZWxzIDEgYW5kIDIgYXJlIGFmZmVjdGVkIHRvZ2V0aGVyLg0K
PiA+ICvCoMKgwqAgdHlwZTogYm9vbGVhbg0KPiANCj4gSXMgdGhpcyBkZXNjcmlwdGlvbiBhY2N1
cmF0ZSBmb3IgYWxsIHN1cHBvcnRlZCBtb2RlbHM/DQo+IA0KPiBGb3IgdGhlIEVNQzE4MTIsIHRo
ZXJlIGlzIG9ubHkgb25lIGV4dGVybmFsIGNoYW5uZWwsIHNvIGl0IHNlZW1zDQo+IHVubGlrZWx5
IHRoYXQgImNoYW5uZWxzIDEgYW5kIDIgYXJlIGFmZmVjdGVkIHRvZ2V0aGVyIi4NCg0KSGVyZSB0
aGVyZSBpcyBvbmx5IG9uZSBiaXQgdGhhdCB3aWxsIGVuYWJsZS9kaXNhYmxlIHRoZSBwYXJhc2l0
aWMNCnJlc2lzdGFuY2UgZm9yIG9uZSBvciBhIHBhaXIgb2YgMiBjaGFubmVscyBsaWtlICJjaGFu
bmVsIDEiIG9yICJjaGFubmVsDQoxIGFuZCAyIi4NCg0KSW4gY2FzZSBvZiBFTUMxODEyIHdpdGgg
b25seSBvbmUgZXh0ZXJuYWwgY2hhbm5lbCwgdGhpcyBpcyB0aGUgYml0IHRoYXQNCndpbGwgY29u
dHJvbCB0aGUgcmVzaXN0YW5jZSBlcnJvciBjb3JyZWN0aW9uIChSRUMpLg0KDQpJZiB0aGUgcGFy
dCBzdXBwb3J0cyB0d28gZXh0ZXJuYWwgY2hhbm5lbHMgSSdtIG5vdCBhYmxlIHRvIGNvbnRyb2wg
dGhpcw0Kc2V0dGluZyBmb3IgZWFjaCBjaGFubmVsLg0KDQpUaGUgbmFtaW5nIGNhbWUgZnJvbSB0
aGUgZGF0YXNoZWV0IHdoZXJlICJSRUNEMS8yIGJpdCBkaXNhYmxlcyB0aGUNCnJlc2lzdGFuY2Ug
ZXJyb3IgY29ycmVjdGlvbiBmb3IgdGhlIERQMS9ETjEgYW5kIERQMi9ETjIgcGlucyIgc28gZm9y
DQpib3RoIGNoYW5uZWxzIGF0IG9uY2UgaW5kZXBlbmRlbnQgb2YgdGhlIGFudGktcGFyYWxsZWwg
Y29uZmlndXJhdGlvbi4NCg0KDQo+IEFsc28sIHRoZSBFTUMxODEzIGRvZXMgbm90IGFwcGVhciB0
byBzdXBwb3J0IGFudGktcGFyYWxsZWwgZGlvZGVzDQo+IGFjY29yZGluZyB0byB0aGUgY29tbWl0
IG1lc3NhZ2UgYW5kIGRyaXZlciBkb2N1bWVudGF0aW9uLCB5ZXQgdGhpcw0KPiBkZXNjcmlwdGlv
biBhdHRyaWJ1dGVzIHRoZSBwcm9wZXJ0eSB0byBhbnRpLXBhcmFsbGVsIGRpb2RlDQo+IGNvbm5l
Y3Rpb25zLg0KDQpZZXMsIHRoZSBFTUMxODEzIGRvZXNuJ3Qgc3VwcG9ydCBhbnRpLXBhcmFsbGVs
IGRpb2RlcyBidXQgaXQgc3VwcG9ydHMNCnRoZSBSRUMgb24gYm90aCBjaGFubmVscyBhdCBvbmNl
IGFuZCBjYW4ndCBiZSBjb250cm9sbGVkIGluZGl2aWR1YWxseS4NCg0KLi4uDQoNCg0KPiBbIC4u
LiBdDQo+ID4gK2FsbE9mOg0KPiA+ICvCoCAtIGlmOg0KPiA+ICvCoMKgwqDCoMKgIHByb3BlcnRp
ZXM6DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6DQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoCBjb250YWluczoNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOg0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1pY3JvY2hpcCxlbWMxODEyDQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWljcm9jaGlwLGVtYzE4MTMNCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLSBtaWNyb2NoaXAsZW1jMTgzMw0KPiA+ICvCoMKgwqAgdGhlbjoN
Cj4gPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOg0KPiA+ICvCoMKgwqDCoMKgwqDCoCBtaWNyb2No
aXAscGFyYXNpdGljLXJlcy1vbi1jaGFubmVsMy00OiBmYWxzZQ0KPiANCj4gVGhlIEVNQzE4MTQg
c3VwcG9ydHMgYW50aS1wYXJhbGxlbCBkaW9kZXMgb24gY2hhbm5lbHMgMiBhbmQgMywgYnV0DQo+
IG9ubHkNCj4gaGFzIHRocmVlIGV4dGVybmFsIGNoYW5uZWxzIGluIHRvdGFsLg0KPiANCj4gU2hv
dWxkIG1pY3JvY2hpcCxwYXJhc2l0aWMtcmVzLW9uLWNoYW5uZWwzLTQgYWxzbyBiZSBkaXNhYmxl
ZCBmb3IgdGhlDQo+IEVNQzE4MTQsIHNpbmNlIGl0IGRvZXNuJ3QgaGF2ZSBhIGZvdXJ0aCBjaGFu
bmVsPw0KDQoibWljcm9jaGlwLHBhcmFzaXRpYy1yZXMtb24tY2hhbm5lbDMtNCIgc2hvdWxkIG5v
dCBiZSBmYWxzZSBmb3INCkVNQzE4MTQsIGJlY2F1c2UgdGhlIHBhcnQgaGFzIDMgZXh0ZXJuYWwg
Y2hhbm5lbHMuDQpSRUMgZm9yIHRoZSBjaGFubmVsIDEgYW5kIDIgd2lsbCBiZSBjb250cm9sbGVk
IGJ5IHRoZQ0KIm1pY3JvY2hpcCxwYXJhc2l0aWMtcmVzLW9uLWNoYW5uZWwxLTIiIGFuZCBmb3Ig
dGhlIHRoaXJkIGNoYW5uZWwgaXQNCndpbGwgYmUgY29udHJvbGxlZCBieSB0aGUgIm1pY3JvY2hp
cCxwYXJhc2l0aWMtcmVzLW9uLWNoYW5uZWwzLTQiDQoNCg0KPiANCj4gSWYgdGhlIEVNQzE4MTQg
dXNlcyB0aGlzIHByb3BlcnR5IGZvciBpdHMgYW50aS1wYXJhbGxlbCBwYWlyICgyIGFuZA0KPiAz
KSwNCj4gdGhlIHByb3BlcnR5IG5hbWUgYXBwZWFycyB0byBiZSBhIG1pc21hdGNoLg0KDQphbnRp
LXBhcmFsbGVsIGlzIGEgc2VwYXJhdGUgcHJvcGVydHkgKHRoZXJlIGlzIG9ubHkgb25lIGJpdCBw
ZXIgY2hpcA0KdGhhdCB3aWxsIGNvbnRyb2wgdGhpcyBmdW5jdGlvbmFsaXR5IG5vIG1hdHRlciBo
b3cgbWFueSBleHRlcm5hbA0KY2hhbm5lbHMgYXJlIGF2YWlsYWJsZSkNCg0KDQoNCg==
