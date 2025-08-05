Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B795524F
	for <linux-hwmon@vger.kernel.org>; Tue,  5 Aug 2025 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754429664; cv=fail; b=tMjmfDrd4R/QRJ8D5RBoTDAvAi7ofA3aSK0GWpzoZBrp9zNp7/MYnhbOZsHV53yRjIKm5Kg/hLQFcat01bAUf4i9Xm31IS7zTtnIZZUqGFpYL33BxjTWtsnVCRvKGpFPC8MsHLFbAeiR+r2Qlgln8rJRCa5qNIk1mziz/p4x9RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754429664; c=relaxed/simple;
	bh=jjCRy/gnO1J8Dy2CRdtXRTmBsK2viwfKHNJO0rOS/Ug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cRn3oY4r5I0MsOd5GExD0pVSPeENHtpbstTL4sgGeBCuFpscS8TD9tVm7mTL7Zzu9ElGmUMQ/19eNf7uldjIPr2khP7wM6tdNSeub47/z3ZSb23UYvaL65KzJGxzTjKBtwGvnJFYB9yM/1H1WGDucnCvs1DiBS/buH8tdrUeELE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=LX88FhV3; arc=fail smtp.client-ip=52.101.72.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="LX88FhV3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORlwsNdPtBj4tAnZSJq+DGD5I7MBmzE+Hcq91tQxKzPK4emjvMehLAMI90OcYn1Zg/aU401H9+02nQJkK/+5uCvzl3ebmg5M4Ft2icCjcqifQxq2AvyAuvVfUlRpRuM+z8zdO0VCd1Bq/KcxwyQjLl94udlYr487OBBgNRFpsOpvl2sDPfgErornaear4xtvqCb0GJ6I565B53QP0H0c4LcUbnDtWZLMJi4bRlNOQZo9ewnXf9h4KEHusAqtm0B9qvrXJy0i9seIKy5wKy7sNTOxnRp56RWROV3FRwtLO2XSYkGlPpdWV+m05qBo+VZV21K6YKxLhanIye0koW1/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjCRy/gnO1J8Dy2CRdtXRTmBsK2viwfKHNJO0rOS/Ug=;
 b=m7NLsGXpnv+6nnFpIvnTzHySE/8wgsV/ep2L6nx19ijyLKQmR7FjYcJb3lOjD7+8Fp8B0swqhcWs/RtusZcIxe2Mm9ab/8Vpz13mfzPxzYn/y2xLkSRKmvx1yz+yhDT6d1ufpuuASkeFTd7qCYF2c7H+1sUmXJ4513qnEy56xbf7G+uIuzF+gzhR/03tuAHuOtBnlUyYKFxd1Ms34d1h8Oq2fw0hcL48fGulE6DkDUw+lqSntlNaV3BLQhfVlGuhPAZovRTkgXAAeyTiDokFRkJToVPPLORGyFAv8W6l953yc3Gv+S1TSTe2KaB3cXaZBQn0Z60wXeLfGkNeZgfzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjCRy/gnO1J8Dy2CRdtXRTmBsK2viwfKHNJO0rOS/Ug=;
 b=LX88FhV3TxLDPpD7Xgt81cPIarwjyzPVt2ICkXpWtNIw8EBWdn0cJ5yKTpHw09GrHYX9/S8HA1w6qvVjZLv0amkb8Ki/CSh4K64k8gOTdxZwQpll5pbRAj6qPXTCHfFDRrol9jmJIGWo9n4CNrqlsZmFzXjpZc9rbKcgGxFEGuLTTDo+KEeXa71INSK5LgffumxdF+6FRtSlqJDzHAc03AMbSp7Ja/how3B9A1ajwAspURWlJF4wvsynvXiend2PSc8lCKBGtw8Ckq44umpjKB/xDffPXNxLmLwiCf4iuavWL782sxjT54qwtYc9j6U7WngvwtG0MzlRGdC9QTGnFQ==
Received: from GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:113::17)
 by AS4PR10MB5221.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 5 Aug
 2025 21:34:15 +0000
Received: from GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f098:49ca:6828:c1f1]) by GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f098:49ca:6828:c1f1%6]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 21:34:15 +0000
From: "Soloninov, Alexander" <alexander.soloninov@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>, "peterz@infradead.org"
	<peterz@infradead.org>, "titusr@google.com" <titusr@google.com>
CC: "Busch, Martin" <martin.busch@siemens.com>, "Niedermayr, BENEDIKT"
	<benedikt.niedermayr@siemens.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>,
	"Dabek, Florian" <florian.dabek@siemens.com>
Subject: RE: Clarification regarding handling of PMBUS_STATUS_WORD in generic
 PMBus driver
Thread-Topic: Clarification regarding handling of PMBUS_STATUS_WORD in generic
 PMBus driver
Thread-Index: AdwGEXz/mG5Gpe2/RQWgNvByKUZquwAE35tgAADx+wAACcrSoA==
Date: Tue, 5 Aug 2025 21:34:15 +0000
Message-ID:
 <GVXPR10MB8177CD027751FAA6EABF7FD3F222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
References:
 <GVXPR10MB817781435A2F2955D0D5A58CF222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
 <GVXPR10MB8177AEDA5EC62CFD7BFAB40DF222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
 <aaa21aa2-70ad-4646-8020-73945e273922@roeck-us.net>
In-Reply-To: <aaa21aa2-70ad-4646-8020-73945e273922@roeck-us.net>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b0c7b859-ed6b-451a-9432-b05e5ecc03e0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-05T21:28:49Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR10MB8177:EE_|AS4PR10MB5221:EE_
x-ms-office365-filtering-correlation-id: c1929eb7-d27d-4e59-7db4-08ddd467d38d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NFMvbFJINE9nSFZnY2R3R0MrTEV2N2dlVmZmK05Fb09yN2tWeUJraVFvcFhi?=
 =?utf-8?B?a2p3KzhZTVpHV3BmR2xHakdrVjJqd1J5ckh1cUsvRlNhVmdvZ2t1NlVQZzk1?=
 =?utf-8?B?L1VKcC9Xd1ZjTWliWGRUR3hKNThOWlUreFJwQ0p1L2p6ckVkNGNEU1F5eEg5?=
 =?utf-8?B?dU9FRXBqYk11ZkhzeC94a0ZKUjJlNUc0Z0dXOWtUd0JETXdFcVV2T3cyUHVK?=
 =?utf-8?B?bFp4K1c3TTIvSm0vUksyN2txbG1NRFhiU2ZZZVBzekw5dXJVVlRKQXlSMDRP?=
 =?utf-8?B?dlR5SUNRQmp0SW85Vklla2hvVUF4QWF0djJVY0ZqUWdjWkxsU0NpK1JFYXJ3?=
 =?utf-8?B?T0pCMjBqNGhmOEcvdXU0ZGQ5OTFzWEdqQ3k1RVhVbTZpWlhtTGNzcElzR1py?=
 =?utf-8?B?NkJQdG5yTjgwR2lzRFFkWHRjeEI4MGJmWVdsZ0VkemtZMVl6Q0lxd2xmVDZr?=
 =?utf-8?B?YnQ5QlB0YzZqNUpmWDJjc0Y3VTBJRko3RDFGMTRvQjd4TFF0SjVWT1B1dTdZ?=
 =?utf-8?B?WjMyNnZaZTJodzcwOFUvTlNMbmlFbytvVXR5QTdRdDFHb2hkeTBBVmlhME9t?=
 =?utf-8?B?dTkzRTk2Wm1hTW1IVTdwL1ZqUnprZEwzR284S3A5UlQwOVpEOThveHFJU0JE?=
 =?utf-8?B?bno1eXJVT3duZmVreGxIWHduSHZFamtRcTJ6cWhIN2c5U3VmdXBQUElKdkFr?=
 =?utf-8?B?aUtPYk9oWEdoZGx4eEVUenlXVGx3cEZGZ1YxQkRqclI1ZUpXbU85dVRMaHpm?=
 =?utf-8?B?aG1ISmhSLzh3bHpUcWpTMjNUbE9Ebk9ZbWpzWjZOczZlbG9OYnFGSnFDTDZH?=
 =?utf-8?B?Wm83Q3gvQmFUUGZXamRpeElKeVB3Ly9sb0JRd3FTL2s3YWlidzNYckZpUXY1?=
 =?utf-8?B?LzYxWHU2T3lnaUtUWmVneEp1TzhwWnFtengxMi9wL2dhYUEyZFF0RkxwZXpJ?=
 =?utf-8?B?RXJVME4zYTM3VHppMkZOVkZTN25UdW5LcjNQTGw2OVVNQ2d6cTdORmNHRXhV?=
 =?utf-8?B?cUJXanpYeEJlUVFoa01kRVI1eC8wYXk3T2xiei96T0JVcVhLMVd2MTBNVnFu?=
 =?utf-8?B?VnJCNll3U1lrM3FBOVJKZ2p6ZTZGdEpkb1BnZlRZOVJRc2JjdUxjN2R3M1JI?=
 =?utf-8?B?NkVNb1FodmFwQ244YjlGdFhzSmJHdGNPMTJEUzBaWE1zZzJyY3NQbWZpbUxU?=
 =?utf-8?B?RkhuZzN4RGowUUVuTUZSMTRKQm5INFQzeG1iaXNlWXgzUGxmbU5HUzlYK2Ez?=
 =?utf-8?B?QVB2UDluU1N1YzQvS1BQelhtaisvUDJEd3BzaHp2d3FaRGhkSVlteFQ3aE1u?=
 =?utf-8?B?ZFhYNExpNGtXWVlLRE45SnRHTmZtb1BjUFk1YnRNVy93OG15K21HMW1IQml4?=
 =?utf-8?B?ZDh0aDcwclhsZTJ1b1BmUWsxVUVzMHNJMTNiNXZ1ZTNrWnVqMk4wcGtjazZn?=
 =?utf-8?B?VXp2MUNQaG4xNjMwZWI1ckx1d3QrM0tCYk9ydTFKVDZaWENjVHRJTjh5YVZO?=
 =?utf-8?B?V3NQeVBZZHMwTHB0TlZzUVVKeElpY20xZm81RmxUa2VFR1A0bFhFZm8rYkRP?=
 =?utf-8?B?WDl4cml4N20vUitGeEF1S2wxL0lLVEdyS01WUWRQTDMxUW5ZZVpWMkw2NXZp?=
 =?utf-8?B?T1VjcGw3WG94cVlsdVFwa2ZPc1JPZ0hxMjkweGRNZ1ZoZVZYZWlBZXhOYUZt?=
 =?utf-8?B?ek5lR2lGTEtjZDlSMnlySFlFV1NWVmJJZnFLVzV2aDFVMFpwZHY5T2ZMK1VI?=
 =?utf-8?B?VmdjRHQ5cXVKaVVoV3RCL3VBaGE1bWwxakNmSWxpbkZveDFWSVA3b25yaDN0?=
 =?utf-8?B?Rm9VTFMwSk1HSUJ4bU5kMzJ6MlZ1Qk4vWm5BZCtTaXgraWkremZWcnNNZVVn?=
 =?utf-8?B?MG8yR3MwaGJacjJLVXFsbEQzVGJzREQ1VGZ5T3hFeS9OTWFOaDF0SGJSK3JS?=
 =?utf-8?B?U2VSR1pBV2Q0NFFIb1E3SENIMVNLMDVDTTc0OE1JOVI4bHFFUmRtMjFpL0oy?=
 =?utf-8?B?dVVJclNTVllnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFJ5aklDcmI4MzE5UmdwM0pUTTl0Wk5Vd1NKdlg1TTZxS1lMN3Rybkl6VlFS?=
 =?utf-8?B?MnByR28wWnEremdFdzV1azY5MHNYY2pJRVNJNUpKaFI3ZDZFYXJiQ1IxSE1o?=
 =?utf-8?B?Yk45dWdvZFBQemk3UFhzWlc1cklHckZ3TC9Sak44dmVBei9JWEtrbnl5eVFw?=
 =?utf-8?B?RDQ0L1oyaWk2TWREVWpPN2hpeDNkSFJYNDRkbWUzNElpVTZOS09HakdZd2RS?=
 =?utf-8?B?TlpQaVRwaGlncldNOGxTQWFvRStFYnViWDg4bVFJMmxLL2hEVThrZWVmSy93?=
 =?utf-8?B?Zyt4L0xGZk04MkZTc3VadkVld0ZPU3kwS3NMM3VOQ0tQdVZCSHJySXptZXpZ?=
 =?utf-8?B?T0NQS05KRkRYZ0JCdE1FUTJaUTVTOGJSNHRTaHVzMEd4SUExbUF5M0pncUcw?=
 =?utf-8?B?N1hSSE0vWitLd1FLWHdra1VuOXFlQjFmMTdtLzgvbW9FQVQzVi9MZysxYkxK?=
 =?utf-8?B?U0VWYVU5REoyK2VXSTRLL3ppRGFPdkRGN2t3RHpXaU94dUpxWSs0K281TEdu?=
 =?utf-8?B?TlE5S2NiSXZpcUl5czNiSVUydXZhMUl3N1hxd2kzdFlWVG9iWTBNL1F1Y0tU?=
 =?utf-8?B?a3FLc2dGMWY4cW8yaXBrVFFzeUNUc0wvQ0dSZDJjU3JFSTJCQjZzdzdValgv?=
 =?utf-8?B?SU1WNi8yc3VsQXJPTlhicmd5Q0FCOFRNSXF5bklzS01tODZYQ0hGeWZnV0tH?=
 =?utf-8?B?SlFONm96WUVSc0xZWUFSL2o3M2VWTHFES3VQMHZMbGFuWGlNUGQxcHRUMW91?=
 =?utf-8?B?dWFsYm1tZkdCZTJVbzlOL0g3RHlUa3JXdEhjbEp0SUdUd0xtOS9ndXlld3hh?=
 =?utf-8?B?N3RDeXFlZEk4ZTRXTjVmT3E2dCtxT2MrOXJYd2NWcXMxeTNkWGJ0WEFuTzFM?=
 =?utf-8?B?M2E5V0hqeU9yanlWblBrWkx5NFNzY2xiRmo0QnVVNE9lN1NIbHdhYVhrZTE2?=
 =?utf-8?B?dElKdTNOUmFEcHZJSnVrNGNpOUprc0ZMZDZGanJTZStpTmtlU016VlZvdTdH?=
 =?utf-8?B?MXUybkZRdFhHdytnc0pDZzRXUk1QSUpOM3doRjJwTDUrbEIzVVVVRk01V0sr?=
 =?utf-8?B?REVOOGVvaTBwNXA4Ny9EVXE5S0tjNjkwcWFJQ1luemVrNm9iV1M2V3lQSVla?=
 =?utf-8?B?MlFJaVgvNkpkUUlZK0hZTlY4bGxhSE9Qenl5RmZxT1NKMSs5MktwT2ZBeFRi?=
 =?utf-8?B?ejNZamVFcDVsTEFabG9vL05CWTNHRkhkN1lLUEdTcWJjT2dBeTFkZ1Y0SE9p?=
 =?utf-8?B?Nk95aTJWeUNMWjVDZHZxSm53ZjFtT1JyNm5mR0Nhem1renFway8xQ24zMlFl?=
 =?utf-8?B?ZGZtNlJmaHRBUzhkaUhWb2pVSkd2TTIrMzhPeldRYUpWazhxUDFhTVJNTmV6?=
 =?utf-8?B?RGxSQmUybVgxSGhpZ1ZRZ2YvSW9lSGFVcU1EWFlheDV0Z2ZRejk0cVVySWk0?=
 =?utf-8?B?YmRaVlFnT2xMNWlheDN5VzhSeThGNGEyUmR5akZKUHdEQ2p0VEd2T1Jkek5t?=
 =?utf-8?B?TVZyTjg1UVZ4ZWdQWXhYL2xqR3ZjYkJ5Wkl1UW93MkMzUnNqaFNxeE1MTnha?=
 =?utf-8?B?NVpWVU5SbmppeGVldWNLTWt5U1ZSN3dNeXdwcFY1ZU1xUjJOMFZuRzhTUDY5?=
 =?utf-8?B?cks3dysxZHR0MXp0YjNSdlNNb3FXb0t1eUZkQXdGK0thdDFxZUpqU25qUUh0?=
 =?utf-8?B?MVkyckI2WDNDcCs0T1BMV0xqdm50a0RMZSt3Y1B5OTNHZThGVVRLMWhCMjdD?=
 =?utf-8?B?UTV4Mndwc1Y0MTh6MjZZR0FVdVgyUkxVa2d4LytkN2ZoZ2ZPY2t4RnA4Qkt2?=
 =?utf-8?B?V3NDS1hUUE4zVnB4RitGMWNHMzJ2bVdVNjJ1ZWVFdTllQVdWcnVEMk9TaWh6?=
 =?utf-8?B?RjMwaVQ0dzU1UzE2TE1VVndUZmJaRDFMQVBxalYxeWZ3NWlwMklKT29Qak1V?=
 =?utf-8?B?Q1lqQi9GZTFVVm9LUVRPc2R2NDMrR2VWTjQ3alRIWkNNeHo2bWt1RlNHZXZo?=
 =?utf-8?B?cHZvUTdCck5tRHdlU0liSFFSbXVROW9ZQVdYeURYYmZXaU1TWnljRnM1NWRU?=
 =?utf-8?B?KzV3QUl1eWVyQzNZRE5nTXdvbk5WOHRkU1lxU1FJTUVIRjRBSC9CMnNDekNt?=
 =?utf-8?B?U056WEd2cHVzRlBzOE83cmNrWGliL01ST3BJa3NoWDdCQlRyWEZXdytkSFA3?=
 =?utf-8?B?K2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1929eb7-d27d-4e59-7db4-08ddd467d38d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 21:34:15.1893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ols+kupU3XxhpsPSp8YergNtJFhPFg86SrzoEcVLvvb3MuYyIuhKrwNXsKfbS7NvS0fyraiG0BW2RKGw9ZodESCjczdPfXCESV261yLLml8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5221

SGkgR3VlbnRlciwNCg0KVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNhdGlvbiBhbmQgdGhlIGdy
ZXAgb3V0cHV0IC0geW91J3JlIGFic29sdXRlbHkgcmlnaHQhIA0KDQpJIGFwb2xvZ2l6ZSBmb3Ig
dGhlIGNvbmZ1c2lvbiBpbiBteSBpbml0aWFsIG1lc3NhZ2UuIA0KSSBoYWQgaW5jb3JyZWN0bHkg
c3RhdGVkIHRoYXQgUE1CVVNfU1RBVFVTX1dPUkQgd2Fzbid0IGJlaW5nIHByb2Nlc3NlZCBhdCBh
bGwgYnkgdGhlIGdlbmVyaWMgZHJpdmVyLiANCkFmdGVyIHJldmlld2luZyB0aGUgY29kZSBtb3Jl
IGNhcmVmdWxseSBmb2xsb3dpbmcgeW91ciByZXNwb25zZSwgSSBjYW4gY2xlYXJseSBzZWUgdGhh
dCBQTUJVU19TVEFUVVNfV09SRCBpcyBpbmRlZWQgdXNlZCBleHRlbnNpdmVseSB0aHJvdWdob3V0
IHRoZSBQTUJ1cyBzdWJzeXN0ZW0gLSBmb3IgaW5pdGlhbGl6YXRpb24sIGludGVybmFsIHN0YXR1
cyBtb25pdG9yaW5nLCBlcnJvciBoYW5kbGluZywgYW5kIHJlZ3VsYXRvciBpbnRlZ3JhdGlvbi4N
Cg0KTXkgYWN0dWFsIHF1ZXN0aW9uIHNob3VsZCBoYXZlIGJlZW4gYWJvdXQgZGlyZWN0IGh3bW9u
IHN5c2ZzIGF0dHJpYnV0ZSBleHBvc3VyZSBvZiB0aGUgY29tcGxldGUgU1RBVFVTX1dPUkQgcmVn
aXN0ZXIgKGxpa2UgL3N5cy9jbGFzcy9od21vbi9od21vblgvc3RhdHVzX3dvcmQpLCB3aGljaCB0
aGUgUE1CdXMgY29yZSBjb3JyZWN0bHkgZG9lc24ndCBwcm92aWRlIHNpbmNlIGl0IHByb2Nlc3Nl
cyBTVEFUVVNfV09SRCBpbnRlcm5hbGx5IGFuZCBicmVha3MgaXQgZG93biBpbnRvIGluZGl2aWR1
YWwgc3RhdHVzIHNlbnNvcnMgYXMgaW50ZW5kZWQuDQoNClRoYW5rIHlvdSBmb3IgbWFpbnRhaW5p
bmcgdGhlIFBNQnVzIHN1YnN5c3RlbSBhbmQgZm9yIHRha2luZyB0aGUgdGltZSB0byBjb3JyZWN0
IG15IG1pc3VuZGVyc3RhbmRpbmchDQoNCkJlc3QgcmVnYXJkcywNCkFsZXhhbmRlcg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFp
bC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQpTZW50OiBUdWVzZGF5LCBBdWd1c3Qg
NSwgMjAyNSA2OjQ4IFBNDQpUbzogU29sb25pbm92LCBBbGV4YW5kZXIgKERJIEZBIENUUiBJUEMg
UFJDMikgPGFsZXhhbmRlci5zb2xvbmlub3ZAc2llbWVucy5jb20+OyBwZXRlcnpAaW5mcmFkZWFk
Lm9yZzsgdGl0dXNyQGdvb2dsZS5jb20NCkNjOiBCdXNjaCwgTWFydGluIChESSBGQSBDVFIgSVBD
IFBSQzIpIDxtYXJ0aW4uYnVzY2hAc2llbWVucy5jb20+OyBOaWVkZXJtYXlyLCBCZW5lZGlrdCAo
RlQgUlBEIENFRCBPRVMtREUpIDxiZW5lZGlrdC5uaWVkZXJtYXlyQHNpZW1lbnMuY29tPjsgbGlu
dXgtaHdtb25Admdlci5rZXJuZWwub3JnOyBqZGVsdmFyZUBzdXNlLmNvbTsgRGFiZWssIEZsb3Jp
YW4gKERJIEZBIENUUiBJUEMgUE8yKSA8Zmxvcmlhbi5kYWJla0BzaWVtZW5zLmNvbT4NClN1Ympl
Y3Q6IFJlOiBDbGFyaWZpY2F0aW9uIHJlZ2FyZGluZyBoYW5kbGluZyBvZiBQTUJVU19TVEFUVVNf
V09SRCBpbiBnZW5lcmljIFBNQnVzIGRyaXZlcg0KDQpPbiA4LzUvMjUgMDk6MjMsIFNvbG9uaW5v
diwgQWxleGFuZGVyIHdyb3RlOg0KPiBEZWFyIFBNQnVzIG1haW50YWluZXJzLA0KPiANCj4gSeKA
mW0gYSBMaW51eCBrZXJuZWwgZHJpdmVyIGRldmVsb3BlciBhdCBTaWVtZW5zLCBjdXJyZW50bHkg
d29ya2luZyBvbiBQTUJ1cyBpbnRlZ3JhdGlvbiBmb3Igb25lIG9mIG91ciBwb3dlciBzdXBwbHkg
dW5pdHMgKFBTVSksIHdoaWNoIGNvbW11bmljYXRlcyB2aWEgScKyQyB1c2luZyB0aGUgZ2VuZXJp
YyBwbWJ1cy5jIGRyaXZlci4NCj4gDQo+IE91ciBQU1UgY29ycmVjdGx5IHN1cHBvcnRzIGFuZCBy
ZXBvcnRzIFBNQlVTX1NUQVRVU19XT1JEICgweDc5KSwgYW5kIEnigJltIGFibGUgdG8gcmVhZCBp
dCBzdWNjZXNzZnVsbHkgdmlhIHRoZSBnZW5lcmljIFBNQnVzIGRyaXZlciB1c2luZyBwbWJ1c19y
ZWFkX3dvcmRfZGF0YSgpLiBIb3dldmVyLCBJIG5vdGljZWQgdGhhdCB3aGlsZSBQTUJVU19TVEFU
VVNfV09SRCBpcyBkZWZpbmVkIGluIHBtYnVzLmgsIEkgY291bGRu4oCZdCBmaW5kIGFueSBsb2dp
YyBpbiBwbWJ1cy5jIHRoYXQgYWN0aXZlbHkgcHJvY2Vzc2VzIG9yIGV4cG9ydHMgaXQg4oCUIGVp
dGhlciB0byBod21vbiBvciB0aHJvdWdoIG90aGVyIHN0YW5kYXJkIGludGVyZmFjZXMuDQo+IA0K
PiBJdCBzZWVtcyB0aGF0IG9ubHkgc3Vic3RhdHVzIHJlZ2lzdGVycyBsaWtlIFNUQVRVU19WT1VU
LCBTVEFUVVNfSU9VVCwgU1RBVFVTX0lOUFVULCBldGMuLCBhcmUgY29uZGl0aW9uYWxseSBldmFs
dWF0ZWQgaW4gZnVuY3Rpb25zIGxpa2UgcG1idXNfZmluZF9zZW5zb3JfZ3JvdXBzKCksIGJ1dCBu
b3QgdGhlIGNvbWJpbmVkIFNUQVRVU19XT1JELg0KPiANCj4gTXkgcXVlc3Rpb25zOg0KPiANCj4g
MS7CoMKgwqDCoMKgwqDCoMKgwqDCoCBJcyB0aGUgb21pc3Npb24gb2YgUE1CVVNfU1RBVFVTX1dP
UkQgaGFuZGxpbmcgaW4gdGhlIGdlbmVyaWMgZHJpdmVyIGludGVudGlvbmFsPw0KPiANCj4gMi7C
oMKgwqDCoMKgwqDCoMKgwqDCoCBXb3VsZCBpdCBiZSBhY2NlcHRhYmxlIHRvIGFkZCBmYWxsYmFj
ayBvciBzdXBwbGVtZW50YXJ5IGxvZ2ljIHRvIHByb2Nlc3MgYW5kIGV4cG9zZSBiaXRzIGZyb20g
U1RBVFVTX1dPUkQsIGVzcGVjaWFsbHkgZm9yIGRldmljZXMgdGhhdCBkbyBub3QgaW1wbGVtZW50
IGluZGl2aWR1YWwgU1RBVFVTXyogcmVnaXN0ZXJzPw0KPiANCj4gMy7CoMKgwqDCoMKgwqDCoMKg
wqDCoCBPciBpcyBpdCBleHBlY3RlZCB0aGF0IFNUQVRVU19XT1JEIHNob3VsZCBvbmx5IGJlIHVz
ZWQgaW50ZXJuYWxseSBvciBpbiBkZXZpY2Utc3BlY2lmaWMgZHJpdmVycywgYW5kIG5vdCBleHBv
c2VkIGRpcmVjdGx5IHZpYSBod21vbj8NCj4gDQo+IElmIGhlbHBmdWwsIEnigJlkIGJlIGhhcHB5
IHRvIHByb3Bvc2UgYSBwYXRjaCBvciBoZWxwIHRlc3Qgb25lLg0KPiANCj4gSWYgSSBtaXN1bmRl
cnN0b29kIHRoZSBpbnRlbmRlZCByb2xlIG9yIGV4cGVjdGVkIGhhbmRsaW5nIG9mIFBNQlVTX1NU
QVRVU19XT1JEIGluIHRoZSBnZW5lcmljIGRyaXZlciwgcGxlYXNlIGZlZWwgZnJlZSB0byBjb3Jy
ZWN0IG1lLg0KPiANCj4gTXkgYXNzdW1wdGlvbiB3YXMgdGhhdCBpdCBjb3VsZCBzZXJ2ZSBhcyBh
IGNvbnNvbGlkYXRlZCBzdGF0dXMgaW50ZXJmYWNlLCBidXQgSSBub3cgd29uZGVyIGlmIGl0cyB1
c2UgaXMgaW50ZW50aW9uYWxseSBhdm9pZGVkIGluIGZhdm9yIG9mIHRoZSBpbmRpdmlkdWFsIHN1
YnN0YXR1cyByZWdpc3RlcnMuDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgdGltZSBhbmQgeW91
ciB3b3JrIG1haW50YWluaW5nIFBNQnVzIHN1cHBvcnQgaW4gTGludXghDQo+IA0KDQoNClNvcnJ5
LCBJIGhhdmUgbm8gaWRlYSB3aGF0IHlvdSBhcmUgdGFsa2luZyBhYm91dC4gUE1CVVNfU1RBVFVT
X1dPUkQgaXMgdXNlZCBhbmQgZXZhbHVhdGVkIGFsbCBvdmVyIHRoZSBwbGFjZS4NCg0KJCBnaXQg
Z3JlcCBQTUJVU19TVEFUVVNfV09SRA0KZHJpdmVycy9od21vbi9wbWJ1cy9kZWx0YS1haGU1MGRj
LWZhbi5jOiAgICAgICAgY2FzZSBQTUJVU19TVEFUVVNfV09SRDoNCmRyaXZlcnMvaHdtb24vcG1i
dXMvZHBzOTIwYWIuYzogY2FzZSBQTUJVU19TVEFUVVNfV09SRDoNCmRyaXZlcnMvaHdtb24vcG1i
dXMvZnNwLTN5LmM6ICAgY2FzZSBQTUJVU19TVEFUVVNfV09SRDoNCmRyaXZlcnMvaHdtb24vcG1i
dXMvaWJtLWNmZnBzLmM6ICAgICAgICBjYXNlIFBNQlVTX1NUQVRVU19XT1JEOg0KZHJpdmVycy9o
d21vbi9wbWJ1cy9sdGMzODE1LmM6ICAgICAgICAgIHJldCA9IHBtYnVzX3JlYWRfd29yZF9kYXRh
KGNsaWVudCwgMCwgMHhmZiwgUE1CVVNfU1RBVFVTX1dPUkQpOw0KZHJpdmVycy9od21vbi9wbWJ1
cy9sdGMzODE1LmM6ICAgICAgICAgICAgICAgICAgcG1idXNfd3JpdGVfd29yZF9kYXRhKGNsaWVu
dCwgMCwgUE1CVVNfU1RBVFVTX1dPUkQsDQpkcml2ZXJzL2h3bW9uL3BtYnVzL21heDE2NjAxLmM6
ICAgICAgICAgY2FzZSBQTUJVU19TVEFUVVNfV09SRDoNCmRyaXZlcnMvaHdtb24vcG1idXMvbXAy
OTc1LmM6ICAgY2FzZSBQTUJVU19TVEFUVVNfV09SRDoNCmRyaXZlcnMvaHdtb24vcG1idXMvcGxp
MTIwOWJjLmM6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQTUJV
U19TVEFUVVNfV09SRCk7DQpkcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzLmg6ICAgIFBNQlVTX1NU
QVRVU19XT1JEICAgICAgICAgICAgICAgPSAweDc5LA0KZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1
c19jb3JlLmM6ICAgICAgIGNhc2UgUE1CVVNfU1RBVFVTX1dPUkQ6DQpkcml2ZXJzL2h3bW9uL3Bt
YnVzL3BtYnVzX2NvcmUuYzogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhZ2UsIFBNQlVTX1NUQVRVU19XT1JELA0KZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1
c19jb3JlLmM6ICAgICAgIHJldHVybiBfcG1idXNfcmVhZF93b3JkX2RhdGEoY2xpZW50LCBwYWdl
LCAweGZmLCBQTUJVU19TVEFUVVNfV09SRCk7DQpkcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzX2Nv
cmUuYzogICAgICAgICogU29tZSBQTUJ1cyBjaGlwcyBkb24ndCBzdXBwb3J0IFBNQlVTX1NUQVRV
U19XT1JELCBzbyB0cnkNCmRyaXZlcnMvaHdtb24vcG1idXMvcG1idXNfY29yZS5jOiAgICAgICBy
ZXQgPSBpMmNfc21idXNfcmVhZF93b3JkX2RhdGEoY2xpZW50LCBQTUJVU19TVEFUVVNfV09SRCk7
DQpkcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzX2NvcmUuYzogICAgICAgc3RhdHVzID0gcG1idXNf
Z2V0X3N0YXR1cyhjbGllbnQsIHBhZ2UsIFBNQlVTX1NUQVRVU19XT1JEKTsNCmRyaXZlcnMvaHdt
b24vcG1idXMvcG1idXNfY29yZS5jOiAgICAgICBzdGF0dXMgPSBwbWJ1c19nZXRfc3RhdHVzKGNs
aWVudCwgcGFnZSwgUE1CVVNfU1RBVFVTX1dPUkQpOw0KDQpHdWVudGVyDQoNCg==
