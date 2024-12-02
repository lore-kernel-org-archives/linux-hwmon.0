Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68630F9E6
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Dec 2024 02:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.151.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733104841; cv=fail; b=rx8MTKkZBCS2D85rDiW/fLZqHpd3sWH/9AVPzfsBC1uMzJ7kbpF+8Ec23nuc83ih1tYDkahzbvakzgT2eWGZZFmhGAUIoENeSek5BstO9piwtYx7bXJqkmYmfGblYX2KqsuqKLqCsGcX+ptCcXAa5TgOSRoGxSNL8+3Ai5svLYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733104841; c=relaxed/simple;
	bh=HLyNaJ/vFCbKEcdDdYVy6t6P3H3M3R+H2wgnnE8nHEY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=evMIkF+CZJEGWGzgncwpf4F72WyW0/Dx+OKuLKM1xTnlG58ctLnCYYTylnB6rtP2oYuaIDq6byswPjEd2YJxDBX+7johDuTbbqvvo1xXijKv21WbqiUgdO7SsbYE3ZnskvoEfZXFFERpv+spblTt0kTkBIgHTEdu0laMmaPoKVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=P09fGrYr; arc=fail smtp.client-ip=68.232.151.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="P09fGrYr"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1733104839; x=1764640839;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HLyNaJ/vFCbKEcdDdYVy6t6P3H3M3R+H2wgnnE8nHEY=;
  b=P09fGrYrK6c0hSVWjZDCxD7UyWc5k8Y+U+MxNyekU6GybL47xPhtqGCl
   DFYFyq0hZKooc53mAcrKZ10gj0g/7vB5B0PoW3sHJ21AI7abYa3jdEYgf
   w9rRx+Cqsnda7KndOwLySNqH5VmIrdeCaVsGzv32PugfHU8ihvUjeonIB
   C/hzzG2cVK+u0vPRmlAB8CqxIknZ/wSqrA+vxvz+S1R/J1w+1YugK4u+1
   UPjGdXemV3SBBGzmLwdLf1YhgBlpXWmYu8vFE/btGjJWlB2QlumMWm58t
   xhkOMvubYgad6T7EtXw0UWL+xMkPGrvUSxO3L20c08RPeVmbhHQ6HxWO8
   A==;
X-CSE-ConnectionGUID: Vh3kKg1JTvqnHI2NwDor2A==
X-CSE-MsgGUID: HgUxTeMXQ5en1kkuTpuHjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="49976705"
X-IronPort-AV: E=Sophos;i="6.12,201,1728918000"; 
   d="scan'208";a="49976705"
Received: from mail-japanwestazlp17010003.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.3])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 11:00:30 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUZX58sJMdPLoCx+mrH5LJQviYN9oegUacQ3Cp7axu68V8Domesy5f5LEXWMgSr7nz2+AMGKBGxYuboCr8IYH58dI1sGQR8xNKhfyd/ZFUm8yJLjPTZZTNbvVJ+o9AdtR3I16ommrTJBo4qKJBwsLIejkBMVj4vBJQut2/fHjKZzUE8GGpTGhuFiJOz+azCQIROR5Uex23bKAgxWYBoTfblWwAZk57NCK1fUlzZeU0U2WK/nPMso8KeccZiLlaEev2UFi32SwSAdCrqiRWyYU4r+rz5ivawiG/H55gWGjDWHm0USyRCYt5lTDZyj9GH1r0JNch4S89qbg4b1r5kSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLyNaJ/vFCbKEcdDdYVy6t6P3H3M3R+H2wgnnE8nHEY=;
 b=tjc+IWGauioRrA1E+X7dR84vc2EHnOKYmsyFi1t9Qvpk8pvVYTxw88P2LBzSTYQ8fc1/mvF2fS2ny7ywg5BIs2zCxTb5VLmP1WZ4yuei7QuHVj/YupsB6g/RN8aVRRKm+fkKb9dZOsbNKnKMttJ9D2RDkWC8l+p7SERvT6ING0Wq8bbWTMeOOMch4cOsi3G+/C6gs7OUaAtKlgkmiUYsY+h3g3Xj/EHApHVzr39ye+MJaTAB/q9Q4WQmtDlwU7img/wn+1sXqxUKQFgfe8WEX1hv2nDDtQGvv2VNFAEwq0wrwwTRKqEa/Tx96MQqhmXvFH++8hahh6FP7T7zPW6TdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9382.jpnprd01.prod.outlook.com (2603:1096:604:1ce::6)
 by TYWPR01MB9724.jpnprd01.prod.outlook.com (2603:1096:400:231::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Mon, 2 Dec
 2024 02:00:27 +0000
Received: from OS3PR01MB9382.jpnprd01.prod.outlook.com
 ([fe80::948a:2ed9:c684:905a]) by OS3PR01MB9382.jpnprd01.prod.outlook.com
 ([fe80::948a:2ed9:c684:905a%5]) with mapi id 15.20.8207.010; Mon, 2 Dec 2024
 02:00:26 +0000
From: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>
To: 'Guenter Roeck' <linux@roeck-us.net>, 'Jean Delvare' <jdelvare@suse.com>,
	"'linux-hwmon@vger.kernel.org'" <linux-hwmon@vger.kernel.org>
Subject: RE: Question about enabling ACPI power meter capping
Thread-Topic: Question about enabling ACPI power meter capping
Thread-Index: AdtBSjp7ozFZFqBERQu+lwfTXdtHeQAwltwAAJQ6O/A=
Date: Mon, 2 Dec 2024 02:00:26 +0000
Message-ID:
 <OS3PR01MB93828DDE53D193451910DB84D9352@OS3PR01MB9382.jpnprd01.prod.outlook.com>
References:
 <OS3PR01MB9382B4EB50C4C797AD47F73AD9292@OS3PR01MB9382.jpnprd01.prod.outlook.com>
 <9d25b97d-9570-42c2-b951-4cc708f38be0@roeck-us.net>
In-Reply-To: <9d25b97d-9570-42c2-b951-4cc708f38be0@roeck-us.net>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZmI1ODViZmItZmQ0My00MDg4LWEzZDUtZmEyNjM3YmQ3?=
 =?utf-8?B?ODlhO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTEyLTAyVDAyOjAwOjE4WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9382:EE_|TYWPR01MB9724:EE_
x-ms-office365-filtering-correlation-id: 7faf1984-ed80-46aa-7838-08dd12751759
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1dpYnNmdHlLQlZGRlZnSEVXNkVONGIxUU1FL3RPYXpOQ0t1NlpsMzhJRytz?=
 =?utf-8?B?TjRJRHZHb1JabE9EeE9ZaW41RSthWmtMNzNuZEQzVG9icHFSZnpydmFJdXph?=
 =?utf-8?B?aU9aSjRDRUJwRWo4TllSMVh1bG52QTRWNXZvLzdEdmlRejNYdUp6L0cyeE5H?=
 =?utf-8?B?bUJBTGd5cWVIRXErL1NEYUtlYUd5NGliSHVscUZUMVdzZXB3N3h1UzFQM0Ro?=
 =?utf-8?B?K3ZBSWRyRnR6MVdHeFdsZDR6emJjeFFLWmFxREcycHVELzlmUHBpL1JXRXk0?=
 =?utf-8?B?WjBaWWdHNmg2NGNsRWFxZ09BT2hzYU9uMmV1NGQ2U2x0WGM1MWJscmFpbmo2?=
 =?utf-8?B?RW14QnBvTVMyNnRaQUV4RDZsTTNieUZMOWZ6QU5JUzU0UlEvMS93ME96cjlD?=
 =?utf-8?B?eDRkOUgwWGZrUnhPMDhYTjUzaUJEMk5udjJOb0Nqbm9xZDA5ZnlDUFRlem14?=
 =?utf-8?B?TXl3Um01TkxJLzJCb1Mvcmc2RThWOFFSQTlYSytuZHNDK3dla3dyajBuaTV0?=
 =?utf-8?B?WkZVYzVUWHQyOTh3WXJXalZKeXpSdlAyaytaK2RSVEF1a3dHNVZ3RFR1NFFI?=
 =?utf-8?B?Z0pYTWlDMHQ5QkFleGdtWTBnYmxIMVpCZmpKZzZIdmc3VXhIeVpBMGd3SFpQ?=
 =?utf-8?B?Q3RhMUN6VXh0bWZ3aXF6bWxOeHRFak1tWUVNNE9jdWR6UkU2SFhnWWpWQ3Zn?=
 =?utf-8?B?dWtUclZqenU2ayszZ2hNZUNCdllkUzhkVms0dkh3TDZ4clIvY1BUc3JqY29P?=
 =?utf-8?B?eFUzL092REdTdXFBWVFOTnEybC9QaFA5cEZmSTJMcWVSTWdVYUgwTlpMaXdC?=
 =?utf-8?B?aEUva01CNW9zSnZRTmZsWmJHRGlod2VJenJhTjdnRHN2S3UrVE56T2NEU2VM?=
 =?utf-8?B?NEdKWWNmR1cwK1VkM1czcnoyZGtONkJIYzhJYnVsaDJWM0RFUGVTYUVkdE1l?=
 =?utf-8?B?ODA0OFUvYm93T0hMSytBbU5oS2VWNS9oNGNWWkVNaXEwV0MyanBZU2JOZmMw?=
 =?utf-8?B?cmg3ZXdwTWswVzFQdldtcVd6ZDMyTlR6ZUNuK0lpbExYVnVCWkx2VkthSUZo?=
 =?utf-8?B?b3ZDQ2hXdC9FdFNPK1A1cHJ5d0JZaWNvcksxYlNaQWlVQ3NhdS82MjJ0VDd3?=
 =?utf-8?B?ZTI5Yk9wYit0L25GK2tYa1ZCb1JjTW9Zbkl0eUJDNXhPZE1IL2d4OTRaUE1m?=
 =?utf-8?B?ZkZNSDMyOTRsNFR0S2kyOWw2VXBkTzVMcy8zd3pnZEVRSkFPa0Z1VVdzREEx?=
 =?utf-8?B?QThCb3NUbjhWZXY3aGc4UUNoYlY0dUFGaWIwUFFXUFU3WThsci80RUJtNWFD?=
 =?utf-8?B?bU1TVkRVWFlMZUljWW9QNVJZN2RtOGtFcG5BRFVyOFg3RSt1NmFVNFZPSEpn?=
 =?utf-8?B?a0RKY0JBVmRTeTdVeFJ3dWxmYW15Z0xwUHJZUzc4L0k4Rnp6YTdmaThCRnBt?=
 =?utf-8?B?SElFbzN0QlZUN1dwcUY1UXFialNHbk5sMzRmK2c5VXEvM2lwRy9RQW90K0ZJ?=
 =?utf-8?B?ZUNMenBRczNoZGw3Zk1sUit4QmJQUDQxWUsvb3g4RzR3Zk82cDBHa0V5MWNs?=
 =?utf-8?B?YlQySEVYNzlMQUM0RDRtMEs2RnlGK3prNUtEeDN4Qjd2aVpGWlZ6cEJlaVlO?=
 =?utf-8?B?NXU4K3dLK2lqakx2ZTJ6RnRteEl5L3FGK2NIMHdmeEVWNEVNcEZoSXBtN1pU?=
 =?utf-8?B?RlpwVHl0a1hVSmZlNlVKTk0zZzkrQ2xac0dBajZ2OHkwczlqcGRqUGhRWlpE?=
 =?utf-8?B?YVVEbks3eUF3dzM0K1d5c2RlNEpMa29KZmJySU1tZ2VDc3J4dU5SMUxxaXFr?=
 =?utf-8?B?c0kyT0FLQ29SeGNwckw1YU1HVFQ1Y0FJOGpLb0NtSjdHUjFaYk5ibmEwY3RX?=
 =?utf-8?B?bXV1SmFuR1lRZkdxbm92RTJkZmt5dUt5OUx2c1hJTmdFK0h2U3RzRGpyK0xa?=
 =?utf-8?Q?CEVS/6lQt9ctwcTAAq1kI1W20n++/Tgl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9382.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1QzeTQ5OTlkenJnSVZ0VTlZeU02cFFBNHU4eS9iazlvVDhiR0JTR1p5dk41?=
 =?utf-8?B?aVNLSlFxQVpyUUt4NzhsZzE1RkNYWEdaaVl5bllhN3RySE1YaGF4d3NlTkho?=
 =?utf-8?B?U3NabmZxVE9SSFJXeHhOUC9VMVJrZk1UU3hmSlFwc1g3bWZXSVExOE1icGtG?=
 =?utf-8?B?Z2FVWm5aa3JRbGxCSmhqcG5UdytkL2FFc3VBZWFBUUwzQ3lYeXlPbHZybVh2?=
 =?utf-8?B?VFVNQzRmRURzK0I5ZzFkRCt3QjZEN3dBZ2t2dXVVUitVQmZTcFBUN2pjNyt5?=
 =?utf-8?B?dDE3d2lsZHZPL21SK2I0YnpsMTBCakczODBQRkVUdW5ReVBrampUSlJqOHBj?=
 =?utf-8?B?SXJTQ2IzdHdGUGdkRFM0K2czK3hZZW94ZXJmbWtpZ3ViUk9RZGxmUkpXVGlm?=
 =?utf-8?B?YnhxdDNqUkRoVGhpZ2pMeXVFdDVYMnFvVlg0ckNVSkRtRWV5VkZGTGpOL0ZY?=
 =?utf-8?B?ZWNMeU8zaEFrSVhGTHNHTEtaaWUzaW5ha3pkNnNocFJ6UzhwNFlWNmlDa1Uz?=
 =?utf-8?B?R2FqNi9PRGhJVS9NVzc2WVRVYURZSzlPMGFzNERGdjVoNlBBRUtTY0dZMUFI?=
 =?utf-8?B?S1JjaWFrc0ZybkFJejVETXJtbHNSckxqektFUElZdTJPcHlncDZSZjYzWi83?=
 =?utf-8?B?cnVuNjBrRjBqcWQvMXc2Zjh2ZXJOanQ1aUZBeEt6bXk4NitPb2pGRDZQTkZq?=
 =?utf-8?B?VDl1STkwMWJlVU9VRFdpeUZsQ3pQQ3V4ZlRReXpQd3l1WHpWdjc0NDVCU2dk?=
 =?utf-8?B?eldIMkFLVGxBNUdReFVMTlMwbFgyNWlLL3F3RE1STGtKblg0NzRyUXVzT0pN?=
 =?utf-8?B?Mkdzb0p2eGN3amVEeDhxbUM5c1Noam5TL29SRE5PZGZweWd4N002eUgxREZX?=
 =?utf-8?B?NXEzbXlHai9rSlBGK1NIU1B5V3RTQXZWdGRURjF5TlhVbDUvR3kwenp4WU9x?=
 =?utf-8?B?SkVzeGlTQ1I4N1ZOUjcvZW9CeVhlbk1Ha2o3SlNQKzdYNXcreGhNTGFnNTJF?=
 =?utf-8?B?VG9QMk1ZL1ZZZU1YUzdPcmlqRWp3RWZCdWV1SHM5RzhEZTJHT2F0eVh1Rktt?=
 =?utf-8?B?QUh6WmhGSThTTkdFQVBjVytRT3ZnREgzWmcvdnUvWkFwQUl4Q3JZQ3lrYTlv?=
 =?utf-8?B?dHlDRjhvNFE3aEdPM1pRSWduOEtQNVFkR0Z3U2RBY1MxSlVHZUV3Sk1yN2Zw?=
 =?utf-8?B?YU5VQ0VVMnU3L29iNWczazNlYXlTZmRtUHpTT1R3WmdxaW44RDBNWm4ySkpY?=
 =?utf-8?B?Z2FVakVpSEd1TnNGSGNBSHBPZ2ZkOC9PbnpFakxwbEJobSt3MVBHRmNKcjBL?=
 =?utf-8?B?b0J1UXBZcWZ5aWZEaE55QnRGcFFYUjVUV3lRc3F6QWYvcjY0SGRXYW5hNVZ5?=
 =?utf-8?B?aUdLdTRKaGl0bExTVnVvTzhUbEJDcGQvTWZjNGNuSFVBMmYwVFJMUVZyK0RE?=
 =?utf-8?B?Ynlyd3RhVE9oZlM2cVI5V1E3SVY3ZlI5SEx6c2UvVjlPaXNxd09xeE4vU0J0?=
 =?utf-8?B?Y1UrdUZtcktiV1pFSm5Sc280RnE0ekQ0SWVMNEp2b09NYjhzeUtPWG9Mb0l0?=
 =?utf-8?B?RFRQaWJNU2lidVJ2SkdUNHp5QktOamVFeEhpUy9YbXhmZCtjalIxUENzVEhQ?=
 =?utf-8?B?K2tDc0UwaXZ1bzBwamNSUysyaUpMOUJ4d2Y0b0s2am5KTGZzZW1MR0doRWJO?=
 =?utf-8?B?Q2VpSzJ3Rnl5eSthNWJqZys0TXRVVmJRZjFBdWFVamovVnhIMG81UU5ITEY1?=
 =?utf-8?B?YXE2dTVyVm54WjNMbVJzb1pLaWhKbVdpd2R6NmxpVVc2MFRqSnJVSEhuOWI1?=
 =?utf-8?B?QVJIUDBxWkxPUFhmcjhVTTRLK2VnUFRnNDUwK0RXZm13ZkVYbDEvazJCSWht?=
 =?utf-8?B?SWRaekFRbEZtZjExcUNiQWhLNkZsNlgzQUdhaWpMM3dJTlhValNqQndURiti?=
 =?utf-8?B?N0RqVzQyY0pndWV6RHpLZHJmUG42Y3NaYlR0V3VvUmZibzRHTFc2eDI1NHJq?=
 =?utf-8?B?ZHJXdVpnNi9zTTlod2dQNjhXSXpUWUUxbHNsb0xja1FwcjhDWlJ4TURNOVZC?=
 =?utf-8?B?WTRVMm84MWdxN0tLOVJlTU55cUo1UFZWM1M5RDJ6TUZRWFlya2F6SDlzWldj?=
 =?utf-8?Q?3tHk/lFmMoDzk3iOklAWisZyh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rDRfNnXNbiliV2SnPU4YyTRB5XU7eOHQr5wWgO+k/JEhUY7WO/ZVeGBPsy81kWrYmVIeAHWf4dOkz63DcYIDBm+7xFsUq8/dkKnxm/ajoCty54h0LpYscMgcg8e1D9G+6inZkb0HFgeTGJukd5a2C0i+ps7Dxf+IHqwdCsPJmluQAaxSWWF3g2mY9KI5C6m1ictbnhqp1O65k4Do4Zg7E0YJNZiZYqNSknTa3zzXKccWOC/r91tW+vXovACXDOEPgdtpVKDrfq19/k1L7KdhA2zA/l3xPUjogP6WIH0l9sjEhMIF4txwh0PlBC7QUAHAB71PUoYZOkB/0kYXMhB+QPII2DUCL/9Zc2tgxrD2LL1/xaGLZjPyaAiHsCahw18f+fXAPfcHwM7u0yApfHEECodZ3HINdJQVkmyqarfHReIQZ9GzbERvLWHqBg3d0y0idmQJqByFC/ekBILz3SRiXf1mH0ZBQyf28EaYJs94Scpl64xiQDL5WMU4OZ2NejQhLIuI45BX46gpVEx93akwrSU+N+nR8TbZA2B5N62gLi9ckQUrZvtI+sJB4uwi+/W5nubdAs/VvCzvLSjnAqQpYNVToLUCPU9mpJCFOOKSM3GkZffoXkAcx2mFZGOhtoY1
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9382.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7faf1984-ed80-46aa-7838-08dd12751759
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 02:00:26.8371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVZzy5h8uDBnQ3o5YknIbePWidv8LPLGdS+SNB6WNyy0viQrtX/mAOA/z5qgidvhEl4WAAepwYKpM7BjsxwZQBj/2kWXPYgR/8k8iZQL2ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9724

PiBUaGUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgaXQgaXMgaW1wb3NzaWJsZSB0byBwcm92ZSB0aGF0
IHRoZSBjb25kaXRpb24gaXMgX25vdF8gbmVjZXNzYXJ5LiBUaGUgZXhpc3RlbmNlIG9mIGEgc3Bl
Y2lmaWNhdGlvbiBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCBpbXBsZW1lbnRhdGlvbnMgZm9sbG93
IGl0Lg0KPiBPbiB0b3Agb2YgdGhhdCwgZHJpdmVyIGlzIGNvbXBsZXRlbHkgb3V0IG9mIGRhdGUs
IGFuZCBvbmx5IG1pbmltYWwgY2hhbmdlcyBzaG91bGQgYmUgbWFkZSB0byBpdC4gSSB3b3VsZCBz
dWdnZXN0IHRvIGFkZCB5b3VyIHN5c3RlbSB0byBwbV9kbWlfdGFibGUuDQo+IA0KPiBHdWVudGVy
DQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXBseSwgR3VlbnRlci4NCkknbGwgY29uc2lkZXIgYWRk
aW5nIGFuIGVudHJ5IHRvIHBtX2RtaV90YWJsZS4NCg0KU2hpbmppDQoNCg==
