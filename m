Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC361EA7DB;
	Thu, 19 Feb 2026 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500696; cv=fail; b=CBoUqI6vl1vH+ykrLiSw9SDenJ/KfAKCq3EJP1gV3srCF1lASZ1EkHdlpmGqUs6Vn9+D6j6R9i7GYdIBtyiGJiLUcJ1cq45rU1rlLa1STIPMCxQ9htU23iywe43Ge7Jbq0qpYCtTMECRqjB9Yl+XTo4fywrntP+Avxgj9FhiswE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500696; c=relaxed/simple;
	bh=QmDmkLMCpWBb55dBZ9ByufpR4Q0X1EJgoljOGeS3/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p38vjeo8nTizmz0fUeexIpyJsAx6vBbY9nK/XDbYd3hp/CLIIQNwMeAeO00lZsw2GSk9dgshaYhiIT1kx4etdfgfkkPgNOH/g3E24dS7mvziEJ6Lzx71Et9kY3UXAyeJUSe/9ENVUa/5DM6A2sVDOj3buB7Fd6WVwfYbFCb5vSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=wTaTn6pF; arc=fail smtp.client-ip=52.101.56.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="wTaTn6pF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpwdYpB6wh3FP7ZAKetzPkukYlZSPjboMguvqIdneJ6N9Cd52Bb0m/3deitOiC0TJy59wMcmi+Uo2+l2O5mlYJkJqFvck0ITKYBSIoSFQ50mECi9oyycZhzLN5wZtVLXN+fU0GClL4YeZCR0nyFuLfYUWtaAdcLB44BhJE72F+OAUXaA7MyZu+sIFhlcioTz4FI7s9ftYp+ciIBrmUxlP49ka9iYA1SWFkDexXfTL/eUoKmSST3V4L53fAJdpYXoav4IPi6TIaSrNPqKU28N9r6PkcDALf3RwVoAiP7VVEgSYRTffruyXxyRQGvJqjFTFSIAY1/XFWt8RsoXCFCvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkyAJyY+idjrfq0HP/L/7zkTa1cYdws2IssPBB9DnwQ=;
 b=iqsnlKQ+z8ePP4r6my3M+BGV00Ci85pU0HgZIxPyiM651+CU/gCMxr/Ydp3Uky5MiZC5MhjXbOVUnYVdlZNwwDHPPjMu1HFlkaW7OEGFndZO+xfuryh3VBbEW84Vtp0x/0wA8ILh1Ls9lZ3saaD6Y05UjuaCTZhleg5DKQxYBDt0WO4bWawvriXoFV5C2LJ+elnqyhgKZ304mHifHBtlAGqjPYfdP17oy08eRta1FVD/bKmtT+2X8S+aReulDEG5tpQGFJf8erHxxEPZPcU4m8OLfS4zpgp4uqL/Eb0ztlRiQeTEcJmqWJsky3r+pXuYJ5/OiKPskASTPRf3x6GiYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkyAJyY+idjrfq0HP/L/7zkTa1cYdws2IssPBB9DnwQ=;
 b=wTaTn6pFM9R0pe8F2PGx94TeWbLqdpJFACEni+ST/avF6EUo3fU5Tlu+bCCOG9yV3vjAGvq8yKycfNl/xly+XD8tcR4OtaGGrsVmWaANAIBTsJpKIfA8shAYEhqB4VAkBzedLHZ/9boZ00lm+tTrao2BMZO1Vtnrq1UaODsDC1JdlYI/G/RIIKPMaS4bq+JCSM5lN1K8D++iTqzYSeSgsFZmuPWLYnIJdaoTL5lURCEYfXDewJprLgzOs1iceera+M5V2PzUw6Q4uBbMSCqSu7OHo1fHIrzTGt++cD3JHCo9iqAANycYSjnBKgnn6F9Zz6BoH5bZM7ATLgAbYn92Ig==
Received: from BL0PR02CA0084.namprd02.prod.outlook.com (2603:10b6:208:51::25)
 by SJ4PPFCC6375747.namprd22.prod.outlook.com (2603:10b6:a0f:fc02::fcf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 11:31:29 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:51:cafe::5f) by BL0PR02CA0084.outlook.office365.com
 (2603:10b6:208:51::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 11:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 11:31:28 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 0971EE8F23;
	Thu, 19 Feb 2026 13:31:25 +0200 (EET)
Date: Thu, 19 Feb 2026 13:31:25 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: =?utf-8?B?VG9tYcW+?= Zaman <tomaz@mono.si>,
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc: Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] hwmon: (ina2xx) Add support for INA234
Message-ID: <aZb0jWSdSazw99O2@zeus>
References: <20260217092325.15867-1-ian.ray@gehealthcare.com>
 <20260217092325.15867-2-ian.ray@gehealthcare.com>
 <8ab8622a-5920-4561-bef2-ef1de3108685@sch.bme.hu>
 <ac1ec18e-1e50-4f66-92ef-728ed3855538@Spark>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac1ec18e-1e50-4f66-92ef-728ed3855538@Spark>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|SJ4PPFCC6375747:EE_
X-MS-Office365-Filtering-Correlation-Id: 780a54b4-b102-40a0-491c-08de6faa6ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzB0dzBrRFJneldBaG4remR5MmxUSzlKS2pmbjcxeE9kc2h1VGNYNDNpZmFv?=
 =?utf-8?B?bzg1bXB4cTJwbWorRXZrZzE0ZWJoVTdQQVlHTzRVTXhSeW51cHg1Z0VtRDZk?=
 =?utf-8?B?WWE3OFNJY09ZLzdpNGxvSjVEa2pQcDl1bzdYRXhZbjVrQzhSckF1OUpvVHdY?=
 =?utf-8?B?bUdjTnh3VkwzL3NOZ0JZMFJEdGphWjZ1Z2kycVFkbVo3Ym5leTh3RktRZk91?=
 =?utf-8?B?bFFtU3k2R0JsejR4bTJEWC9yZ0lWME1RbXBIekRPdklHUjdUbFc5MklhcXFO?=
 =?utf-8?B?U2JNM0Q0UlhBVFpOTE16T044VERsaXlMZ2JYQTBMVGYrZ1VSNjBYOWVoT2Zj?=
 =?utf-8?B?UndEcThBcE1aTVN0Q29hcFhuQjJsbTZkbmswMG5wZ3N2dWdzY0JCMmFiSEww?=
 =?utf-8?B?YkpWQzlQN0dtQWI2MVJnMVVOd1pIOEppK21GRWVkdmNkSnJ0TllINS9NQytv?=
 =?utf-8?B?dDlBakNIZ3pEK0xxZXgvT1JKMTFKbmhFQjZhNWRRQlJkU3lud0hXb1FOMGNu?=
 =?utf-8?B?ajhxRXJUcXlVeGRJN3Bwa2JVSm5yRXpSOEJXN1UxbFBQVUhRVFByTjlXd25R?=
 =?utf-8?B?VnN4R2tkcVFjZ3JGOEw0WC9ob3BGckNnd25VbnpCNm5VbEtUbkxmYndPWkda?=
 =?utf-8?B?VFVWN29PeG12U3RrUFpWdDBrZjM2UFJSWFY1QWJQSkNTM21ZLzRyejhzRXRR?=
 =?utf-8?B?Mkd2NWNpdnpvWUNweGZ2SFRsc2xqbE55ZHlpenBqTFQ4d0wxZ044ZjNwNkV1?=
 =?utf-8?B?aHNWVHNoVThSTVE1aVBGdWhaYkFLS0IzdVUrQy9vMmJoMjlENitWRnJMcHRR?=
 =?utf-8?B?b3EyYjhCYnRUYThSUUpRL05qOXpva3BtWHBXaW5WNmRDSVVzM045ZkUrcTNK?=
 =?utf-8?B?cE9jT1NiY1FiY3UwSHBhTjhkdU14d2VHWWxyOGdhYUVFNHkzeW5CTnoxWXV1?=
 =?utf-8?B?cW9BRTdLRnNnbDcvZUk5V0prRWhqK0h1WGRMRWhMcVVHK1plMHNPOUhmN1hI?=
 =?utf-8?B?K1VBUHNIT2NpeWJGOVRxb0VoR2tCSXFKRmQ1V0JyVWJDdVRMQzRMcVdRcjJC?=
 =?utf-8?B?bWRjVE5EWFFuelhKWXNrd3FxVnBOV3FHRUprT0RQbitCZVp0bnd2SExvaU50?=
 =?utf-8?B?MUVHVlp6bCtEck9zcWVFQ2N5aitUbnI2eExReEE2Z3ZNczRDcEVZMnVtdFRZ?=
 =?utf-8?B?VzRVSlJKZXAzVEFxMjdGaWxoRzhldUUyTXRRYUFIcXBuT3pqdks2YW9YUjRh?=
 =?utf-8?B?K3ZFT09RVjNlRFZBRTNSWkdKOGtEcGhENDF6S1grTHRPVWVxMGl3UmVyM1cv?=
 =?utf-8?B?L05xNm9GV0Jmb1g1cldtTGhmNjhXaTk5MGsreVVjWlpYTVU2ajk5MXZJVEtL?=
 =?utf-8?B?YUNpSldaSHJSSmg1SXE0Ym00U0tqc055OWV2R0VXTnFvNk52UVBUUUdPci9G?=
 =?utf-8?B?NCt2S2drK09FZkFmK2tBNGJScEVOQjVSY3VvN1RYWGE1RjBjODU2VzQva1h1?=
 =?utf-8?B?OHB0TnpjbHk4eU9FbjdrQzl5R0plV0VkMXAyTmR1aTluNE1uYTF6eEx1U1Jw?=
 =?utf-8?B?REgrcjNkMXd1dC9HN1Zwbms5R0liamVBVG9JZlZnRWNCSDZ2SkpoQnJpY2Zy?=
 =?utf-8?B?TmJzL1AxOXhGTXVvbXlOdlJ0SlkyQXRpNml0dkp4TVZTZmNESlFyQVkxc2JY?=
 =?utf-8?B?ZXVPR1VnS3NKaWhTcWQ2UXVOZzk4K0hia3NYUkYvT09vS0MrNGp1Qk83TzIw?=
 =?utf-8?B?YlVESG93L2tEbGtBV2NEd0phd2xWTEU1UHptTHVqNFgzWXJ5cGFtamo0bHNC?=
 =?utf-8?B?MnVMM3QyUGk4QVlaYUJ6ZFZIcjZyaE9CVHU0MnB3dXBmSklKQUQwSGRaVUpW?=
 =?utf-8?B?ck1sNUpGYm1nTFA2RGNvRzlReStWNEVOSUdNdWk3SGNnZVI5NE9CeXFDMERz?=
 =?utf-8?B?S012eDNTR0lSd0k3czF0bk9yNkZHQ1hwa2xkZU5hVDA0UzZSbGVkNlZhRXNk?=
 =?utf-8?B?eXZHY1JDQ2VOdDNNd3dsRDI0aEhudTRDa1Z1Ri9UbGxhZDAxWTZtR3k2dEtB?=
 =?utf-8?B?VmdHbm5CUkJoa2VveWNscXFGUnVaZWdmU1NsWmxacXB1TjAxb0lDaTFZSWV4?=
 =?utf-8?B?SVpTUW13WXZNWTF4WTlteGI0Qi9uK0lKRUgwY245b1Blakg2bzl1UW9xYWdt?=
 =?utf-8?B?eHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dtCjNVknjl0Vs9SxZpgVFNxYiG8pEV+BucYNUHJSs4RcBqc5JZkECkUStjgd5HgFRcvTkDTKUO310yY3HMA/7oJSyg6XtvHVQ82Bfr99cqTyEWeeYrX8SMtjb5HrBQdQaj4AgEQNjuAgixN3w24W/IJmkQ1KowRJ2L0lJ9NCsKiGVsLFnky1MGs8TMjLUuZz8x8NX4dWyK7Wu8/njUUOWO/p9Ivl6Y5W4NoJNqmCLUVpkllEjAbDGH/A2G8PgzkWOJPhNAn7h5ewfQBusfWnmUsaSlKVJanDv7+DHhoLBEc3pIUqu5j1X9ydE2UKr7CRLDjE1Zi/04UZUrfDCMUDKI3t7UZRmAMblV7GUhsYfAkl/gLX4LqrxIMgmhyrsYeMIhN8W8rgqozzMjjtxSvK+ZDuH6DlpyG3RhlnhEc7SXmrwWj8S72v1oIZlDw+q/Ex
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 11:31:28.7044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780a54b4-b102-40a0-491c-08de6faa6ca0
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFCC6375747

Note that an earlier version of the datasheet (rev C) said:
"Power [W] = 32 x CURRENT_LSB x POWER" (equation 4).

On Thu, Feb 19, 2026 at 11:15:14AM +0000, Tomaž Zaman wrote:
> 32 is the correct value, mine (25) is wrong. 
>

As Bence noted, in datasheet rev D this has now been changed (and IIUC,
the changed values are for example purposes).


> I’m curious about 25600, though, I believe it should be 1600 for bus_voltage_lsb (12 bit ADC on 16 bit regiters means 4 bit shift = 25600/16).
> 

I took this from table 7-1 of the INA234 datasheet (25.6 mV/LSB).

The voltage and current error between INA234 and the result from
multimeter is less than 3%.  So, the numbers seem to be empirically
correct (on my hardware).

> 
> 
> Tomaž Zaman, CEO 
> Mono Technologies Inc.
> 
> 
> 
> > On 18 Feb 2026 at 23:29 +0100, Bence Csókás <bence98@sch.bme.hu>, wrote:
> > Hi Ian,
> > 
> > thanks for this patch!
> > 
> > CC'ing Tomaz who has a downstream patch for this part as well.
> > 
> > On 2/17/26 10:23, Ian Ray wrote:
> > INA234 is register compatible to INA226 (excepting manufacturer and die
> > or device id registers) but has different scaling.
> > 
> > While the manufacturer and die/device id registers are different, these
> > are currently unused. Comment INA226_DIE_ID to aid future maintenance.
> > 
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> > Documentation/hwmon/ina2xx.rst | 14 ++++++++++++--
> > drivers/hwmon/Kconfig | 2 +-
> > drivers/hwmon/ina2xx.c | 21 +++++++++++++++++++--
> > 3 files changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
> > index a3860aae444c..4c05bd5e24fb 100644
> > --- a/Documentation/hwmon/ina2xx.rst
> > +++ b/Documentation/hwmon/ina2xx.rst
> > @@ -74,6 +74,16 @@ Supported chips:
> > https://us1.silergy.com/
> > 
> > 
> > + * Texas Instruments INA234
> > +
> > + Prefix: 'ina234'
> > +
> > + Addresses: I2C 0x40 - 0x43
> > +
> > + Datasheet: Publicly available at the Texas Instruments website
> > +
> > + https://www.ti.com/
> > +
> > Author: Lothar Felten <lothar.felten@gmail.com>
> > 
> > Description
> > @@ -89,7 +99,7 @@ interface. The INA220 monitors both shunt drop and supply voltage.
> > The INA226 is a current shunt and power monitor with an I2C interface.
> > The INA226 monitors both a shunt voltage drop and bus supply voltage.
> > 
> > -INA230 and INA231 are high or low side current shunt and power monitors
> > +INA230, INA231, and INA234 are high or low side current shunt and power monitors
> > with an I2C interface. The chips monitor both a shunt voltage drop and
> > bus supply voltage.
> > 
> > @@ -124,7 +134,7 @@ power1_input Power(uW) measurement channel
> > shunt_resistor Shunt resistance(uOhm) channel (not for ina260)
> > ======================= ===============================================
> > 
> > -Additional sysfs entries for ina226, ina230, ina231, ina260, and sy24655
> > +Additional sysfs entries for ina226, ina230, ina231, ina234, ina260, and sy24655
> > ------------------------------------------------------------------------
> > 
> > As buildbot already complained: you need to match the dashes' length to
> > the text. Besides, I'm not sure that listing everything here is the best
> > approach. I would change it to something like
> > 
> > Additional sysfs entries for some supported parts
> > 
> > And then maybe list those parts in a bullet list or something. That way,
> > we only need to add lines going forward.
> > 

Yes, makes sense.

> > 
> > ======================= ====================================================
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 41c381764c2b..6aa8a89f4747 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -2284,7 +2284,7 @@ config SENSORS_INA2XX
> > select REGMAP_I2C
> > help
> > If you say yes here you get support for INA219, INA220, INA226,
> > - INA230, INA231, INA260, and SY24655 power monitor chips.
> > + INA230, INA231, INA234, INA260, and SY24655 power monitor chips.
> > 
> > The INA2xx driver is configured for the default configuration of
> > the part as described in the datasheet.
> > diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> > index 69ac0468dee4..923f8c953e8f 100644
> > --- a/drivers/hwmon/ina2xx.c
> > +++ b/drivers/hwmon/ina2xx.c
> > @@ -49,6 +49,8 @@
> > /* INA226 register definitions */
> > #define INA226_MASK_ENABLE 0x06
> > #define INA226_ALERT_LIMIT 0x07
> > +
> > +/* INA226-specific register definitions */
> > 
> > Isn't this comment redundant? Almost the same comment is already there 3
> > lines above.

INA226_DIE_ID is applicable for INA226, whereas the first 8 registers
are applicable to a wider set of chips (incuding INA234).  Perhaps I
should change the earlier comment to "INA2xx register definitions"?

> > 
> > #define INA226_DIE_ID 0xFF
> > 
> > /* SY24655 register definitions */
> > @@ -59,6 +61,7 @@
> > /* settings - depend on use case */
> > #define INA219_CONFIG_DEFAULT 0x399F /* PGA=8 */
> > #define INA226_CONFIG_DEFAULT 0x4527 /* averages=16 */
> > +#define INA234_CONFIG_DEFAULT 0x4527 /* averages=16 */
> > 
> > Do we need a new macro? Wouldn't it make sense to just use
> > `INA226_CONFIG_DEFAULT`?

Sure, we can re-use that.

> > 
> > #define INA260_CONFIG_DEFAULT 0x6527 /* averages=16 */
> > #define SY24655_CONFIG_DEFAULT 0x4527 /* averages=16 */
> > 
> > @@ -135,7 +138,7 @@ static const struct regmap_config ina2xx_regmap_config = {
> > .writeable_reg = ina2xx_writeable_reg,
> > };
> > 
> > -enum ina2xx_ids { ina219, ina226, ina260, sy24655 };
> > +enum ina2xx_ids { ina219, ina226, ina234, ina260, sy24655 };
> > 
> > Maybe it is time to break this into a multi-line enum?

Agreed!

> > 
> > 
> > struct ina2xx_config {
> > u16 config_default;
> > @@ -204,6 +207,15 @@ static const struct ina2xx_config ina2xx_config[] = {
> > .has_ishunt = false,
> > .has_power_average = true,
> > },
> > + [ina234] = {
> > + .config_default = INA234_CONFIG_DEFAULT,
> > + .calibration_value = 2048,
> > + .shunt_div = 400, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
> > + .bus_voltage_shift = 4,
> > + .bus_voltage_lsb = 25600,
> > + .power_lsb_factor = 32,
> > 
> > How did you derive this? According to "7.1.2 Current and Power
> > Calculations" [1] in the datasheet, `POWER_LSB = 2 * CURRENT_LSB`, so
> > I'd think this should be `= 2`, although I'll say I'm not familiar with
> > the IC itself. Tomaz, I do believe you had `25` here, was that just a
> > placeholder?

(See earlier discussion.)

> > 
> > [1]
> > https://www.ti.com/lit/ds/symlink/ina234.pdf#%5B%7B%22num%22%3A421%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2Cnull%2C316.653%2Cnull%5D
> > 
> > + .has_alerts = true,
> > + },
> > };
> > 
> > /*
> > @@ -768,7 +780,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
> > case hwmon_chip:
> > switch (attr) {
> > case hwmon_chip_update_interval:
> > - if (chip == ina226 || chip == ina260)
> > + if (chip == ina226 || chip == ina234 || chip == ina260)
> > 
> > I'd say this deserves a new `has_*` member.

Agreed.

> > 
> > return 0644;
> > break;
> > default:
> > @@ -982,6 +994,7 @@ static const struct i2c_device_id ina2xx_id[] = {
> > { "ina226", ina226 },
> > { "ina230", ina226 },
> > { "ina231", ina226 },
> > + { "ina234", ina234 },
> > { "ina260", ina260 },
> > { "sy24655", sy24655 },
> > { }
> > @@ -1013,6 +1026,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
> > .compatible = "ti,ina231",
> > .data = (void *)ina226
> > },
> > + {
> > + .compatible = "ti,ina234",
> > + .data = (void *)ina234
> > + },
> > {
> > .compatible = "ti,ina260",
> > .data = (void *)ina260
> > 
> > Bence

Many thanks for the reviews.

I will prepare a V2.

Regards,
Ian
