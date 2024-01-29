Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028C1E883
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jan 2024 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706514033; cv=fail; b=L7cdRUa2A4Du4eMkPYMOMlcmo4QGQNnv+uOU3+Q+zc/WS7TthVhLB2JJGQo7FrFRIoeuuTwk4Eo7MwAWQE/ul0Vm2U02S5wTtGO6Lfbt9D2kMmq2dBNf1Yzlrt8Kb8wOA7pvf2ZRFR1+yuwWk7x56UqblOU1ORG9RLSz6iHjkWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706514033; c=relaxed/simple;
	bh=NVS+Fy00R45W7uX23WMPturkiT7YWR5YkuzCbI60CNI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V/SQd7JIEbQBS1/2KoHGPzkdyk+24Opb1hXuxD4esqYqzK5RyPUf/fbyR1jc37FW0mupndidsignZXOARmk4sqG4n+BzDHtJs5xUJ22RI9siPS2ZKlQ1PBZh1LFiaTRZFPuq+FkIfYrRCdTGw3m9OVYdHhTWmqFN6rPpmwFt8LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Gfjpjsdg; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Gfjpjsdg"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T3bOEi031711;
	Mon, 29 Jan 2024 02:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=DKIM;
	 bh=NVS+Fy00R45W7uX23WMPturkiT7YWR5YkuzCbI60CNI=; b=GfjpjsdgE6uU
	f45WRodBB8ZBGTcNVOEmQu8z61K8tDMM3npO86ayLfygBBOm9VKSIl3k8jcfHue4
	To50J0V8tVzyVLKIFPTbcTHQCcMB0WwZ1ALAgi90tzAaX7ZbW6sDvPLcSnYOsvgc
	truPWjg2SfBQkU4h/ptt5t0dt9qYu2T8LPiWlpd8b1SFDUi+oTCSZQ757MEgJDzk
	FW65oqUoGzmBd2jCGt/nhzfY2gal2IX1cwuyydXebiWikyD/yy5nYR10Ch/8raaM
	74z1RbCnvb5aVMfN0TzFTMN5XlwJYT+a7vjl9yCn06znHR0YlUEk2NwlzEKjKvXt
	F2pZZhG57A==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3vwfkkuymk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 02:40:12 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHFNRkBHZXdjYXKB/z0cSQFGKOIfi2jTOUwXUQUtEwX9PpbfcN6FLC7djNnFbe1UOoBIrCtsEVM2Nb5RoTGhZA5JANTKocfiVaI6/HpDNm+3b5oW8Mlu0kg+1+6MOgtuX/D+A61jlSyV3dr/tsOQ8qcLA41AsRlVtA69oCnIVxCzLABDmM+rbi9+EhdRKWfc5KCPlLzePLGV9shb8qbkYowun84IvC5bkLk6/StpPNxJi4i68xU7X7wPSYKX3RrpdSBjBvmCjZAiSibQfnu8DshQ6M1arAedMwcSu+4WJOAU7N2pFonKnopeeZZPrH8P012Ua2a+51CMRBsY69Jtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVS+Fy00R45W7uX23WMPturkiT7YWR5YkuzCbI60CNI=;
 b=dIlRFkOuVxY1ln4j4WDBf4KIVX4VLsYUTNm2rX5RUrBXaAPiItIuA+75c1M1Mo89RjyjpTAUB3piTL7C2gfqOZK9PGG062s6b/b5a5Cns5KCFq36rv7vJlqIvS27IXrWcAhUyEqDw4zcDB8ZuKaMc2kQAR1Uj6ZZzy2CBjT2JyTzYfeLa6J7z6xculQSCneQMQxB6WZYhXaNjKAUjxqRr5Twm3aEPhORe1riTHF9pTVJruNDX1mpLDcb0ElqD8v2KyF5CsPGMjyOmPxc2VmWJ+V+Fk0z4TWNyh841abNbUFaQailAqOds6YQQoqaSFDx7KivU1nsuRF9uRlxc/OXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from CO3PR03MB6774.namprd03.prod.outlook.com (2603:10b6:303:178::18)
 by SJ0PR03MB5598.namprd03.prod.outlook.com (2603:10b6:a03:28a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 07:40:10 +0000
Received: from CO3PR03MB6774.namprd03.prod.outlook.com
 ([fe80::7d65:3a82:aa42:547f]) by CO3PR03MB6774.namprd03.prod.outlook.com
 ([fe80::7d65:3a82:aa42:547f%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 07:40:10 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sa, Nuno"
	<Nuno.Sa@analog.com>
Subject: RE: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
Thread-Topic: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
Thread-Index: AQHaUTHsqdQNw+noikSJK0Q98Hc2GbDtw6GAgAKlzBA=
Date: Mon, 29 Jan 2024 07:40:09 +0000
Message-ID: 
 <CO3PR03MB6774E72E555582B03BCB8D1D8E7E2@CO3PR03MB6774.namprd03.prod.outlook.com>
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
 <60283451-7e83-48da-9f70-b4bb327ae8cf@gmail.com>
In-Reply-To: <60283451-7e83-48da-9f70-b4bb327ae8cf@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYldobGJtNWxjbWxjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTA1WmpBMVpUTm1NeTFpWlRjNUxURXhaV1V0WWpnNE1pMDBNVFUy?=
 =?utf-8?B?TkRVd01EQXdNekJjWVcxbExYUmxjM1JjT1dZd05XVXpaalF0WW1VM09TMHhN?=
 =?utf-8?B?V1ZsTFdJNE9ESXROREUxTmpRMU1EQXdNRE13WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?STBORFkySWlCMFBTSXhNek0xTURrNE56WXdOelE1TVRBd05qa2lJR2c5SWpk?=
 =?utf-8?B?WFpFMU1URmtyY0dkQ0wwaHRhRk5aZFVobVYwUkdUMFZsYnowaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUWpGcldFNW9hR3hNWVVGUlpUVjVOVU12UjNGQ1Uw?=
 =?utf-8?B?STNia3hyVERoaGIwWkpSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQmJFZFVSMVpuUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO3PR03MB6774:EE_|SJ0PR03MB5598:EE_
x-ms-office365-filtering-correlation-id: ab52afb7-e8a2-4070-a6a3-08dc209d855b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ctmWN7H8ZBRLNrxfCOowbF2fH2iU1fyaOnd1S1pU6n1A4DdrseMzqg3atsMUP8g82jVZDimAJpIUuN3OZXqogWlhAThsXnPzhWyLJttmQE1RQheYIQK6q+aAsVIS1cL/h4n0eHp+SPRjzLcK5E4AACoAz5Zk6QpqNKd8654uUZVlsqFWiaWhShLpoS92hiTbwzC+KL3HRpTR/68z6Yw9akSlov/ZvlQ9VqLgyryedBguFthJEjqrvdAZ5sjTFgLSUy6BB3YhTXIwzhUqGu9xM0pIX1ae3Hj6uk5noC99Fy1CPy91arx8oeB6+h6M+1I6sc6ZsFg8AhCojBruW0rmwQNJl3otLvUW4A6DPfbVesKLWC3Jd6pxWtGZ1Asl+cYaDO7qmO98VokPr5RsliMgKksaOJoGvS+aqbUPsiP9isKuTAyxZsBK+4hqmUnobu94wLEQbbxDIGVJfQ7xyELtbfTJbXLyVjuw6KesNalhv9gUd6NyfF4Vw85pXm92c1DgDfCWt5BeSB9RIMQlXoI4Nu9z87XbbDtochl5PD8WYgWnyghfZs5DW5LCoteCXso6YS3xAmStq4u8+9yApdZ8LWQQJnUi8YPofdZj5gy5STCPtu0neQ13QQ8/9jfh0zza
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO3PR03MB6774.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(83380400001)(107886003)(53546011)(6506007)(7696005)(9686003)(38100700002)(122000001)(71200400001)(5660300002)(4326008)(8676002)(52536014)(8936002)(41300700001)(2906002)(478600001)(316002)(110136005)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(33656002)(86362001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d1djRWNSZ3N0c1d5UjV4dDhiSUJ5dktOV2VBb0E4Tm1uQ0JIR2ZtNUtwcFJJ?=
 =?utf-8?B?cmZESTFpSlMyYXBHaC8yYXNpekxpVVNvNmFhRk4vRWNWYk5MZlBjWGhDYWdR?=
 =?utf-8?B?NXhQSG9FVXRUZnpBWk84cmc2bURKOGc3b3lTanR4VGthRmxjTTN0WWlTbUF2?=
 =?utf-8?B?YjA5MmRwaksvSS9wU1hxTUNaakNtemNOYlkwMklxclpoT2U2N1ZqQ3p0a3FQ?=
 =?utf-8?B?QTdEay9kS01JMGNEVG5WTFI2V0VUZHp3UU5IV2krRmlYbHdTckdIVUtHQjlt?=
 =?utf-8?B?L1NJbUNDejdta0lRODNObW02cFRPWG9tMEpqVzk2RFJvc3VHVExaRW1oWjA4?=
 =?utf-8?B?cFo5a0ZJazZ1VjdIL1A1NEZCZG1WdmR5ZmNEZkxqTXB2emROYXZ3bDFLVHNn?=
 =?utf-8?B?TG85cWhqRGRmeldyNUZsUDMvNjVIQzNtZ3VNOUlFRVVSNTdBVmp0RnkvYVhS?=
 =?utf-8?B?RWZXSVh2U3FOTXhxSWRpSDVsakZnUWowbHZweEtoZ0N1b0wyU0JjeXVKYXU5?=
 =?utf-8?B?ZnR3NFVTbEZxR1lTUFNZS1Jmd1RidkVqYjlldUxjRnV6QVVqQ2xZamlFbDVt?=
 =?utf-8?B?U1hybjMvZnFkTmxUYnJvRzcxZzlUaGlnSm1jd0VzaVA5MWhxUEQyaklCODhC?=
 =?utf-8?B?QXkyWi9vejBsS3RqR1B2SUo0VzVEYy9zd2h6WkQrOG5HZXdJcnBqakwrOGpM?=
 =?utf-8?B?QUExMmN6VkJZaHpINTZxQnJDK2VsWmxCR05uOTZwbjRXeGEwQnVqNGIrRjdV?=
 =?utf-8?B?bUZZcEt4UnhpUW1IcE9VdHJhV0E1cHExZEVTT2RjdWVnb1djYm83ZGNkUXpS?=
 =?utf-8?B?MW9iZWltTW9MOTVnOHNyN2JXYjcxb0V0QVNickJtZnBWUTF1MW5yRmxLamd3?=
 =?utf-8?B?SWhXRitOVlhsWVVaNnU1TmNYTjY5WG1NenZYWVVPdXZZS2lzcGhGK3U1VlVP?=
 =?utf-8?B?T2VkVWNhYmNYaFNneXZ6ME9wYkdGRmwyTDkzNCtmVUUyUnpLTkJQQ2tCKzZI?=
 =?utf-8?B?YnlTQ3RlOUhwTmNtOVZMQmczb2VaK2Y2N0dOdEwxTTI3Wjl4QUcySWtPaDJT?=
 =?utf-8?B?VTdBTU5yOURjUFJUenFGdGNXK1hFMHNMZWJxeTk1WHd4elVtWWFOVDR2blNs?=
 =?utf-8?B?Ung1QWp0NjhEQlQ0SFE0ZGlGdjBEMCtzOENPTWp2a3Z6eW5mQmdvSXNsQjFk?=
 =?utf-8?B?SUpvekMvN2hROWJSRnFSUHhtM2ZTR3lZU0xDcmxrUFlHY1B3cXBTdXRCYmdO?=
 =?utf-8?B?QnAyRi9QMiswaEhCcW90aGZialRqYXpBZmFKRUtYQWFSeUE5UjA2d0ViR1R3?=
 =?utf-8?B?T0JHUnVtdG1mVkJLREo5a2w1ZDhtanFsR29obHUrY0hjT01lRWFmVWVHZlpB?=
 =?utf-8?B?VVh5NzhDNVErQjJBYlVsYzBReVhKSWE3L2tHa3REUVlFdHZYZGY3UGRRT1Fy?=
 =?utf-8?B?Nk91bFVvNXBWWktNRzJDZXFmc3U5UE9RTUtjaXBWckNINzA1Y2g2WGx0aHk4?=
 =?utf-8?B?a2k3ZHNxQVYzQ3JKOHFlS3d0Z0VDeklEbkVzWUlEczYxVWljRVlTMTVLNkNY?=
 =?utf-8?B?TVZpT1JmRjBGYW9TYnZtZUEvd2RDbEJIMFFaMDNnWWRHdzJ6ZXl0SGdWcEor?=
 =?utf-8?B?YXFFR0lEMnJPOGQ5ZFRaa0g3cHpTZmJpMzhFam42Y2tFc2VYdDhWWXkvYzlV?=
 =?utf-8?B?RE9ycC9MM1JjZFZMQ3QyQVZJLzVIRUxaMDl4eWdBdHNwQlRzR1VwdDY5cHhB?=
 =?utf-8?B?ejFWcGNwK0pDUUtPc3E2L1hlRUhEcGJiNmxLenI5SVJrUXdDK1pMVXhvZ1JY?=
 =?utf-8?B?cTNzMmhyMThaQzJ0bS9YZDQydWdPN05kZHlaRCt0dlQ2ZjloMVNIUEZJK2NS?=
 =?utf-8?B?SkFxMDRnNEF3aStyZTk2TFlXSk1BNWVubWFGc1dUTFVPSndialdnTy90UlJ1?=
 =?utf-8?B?LzVyKzlNeEFteFErSkxMWjg2OEFaU0tDbGcrNnZRRGpmSlQzMlljazc5Tlk1?=
 =?utf-8?B?bGdFN29ZNkREMythKzBJZnJRenZYWXBOeGlzR2VMRWY1MWNUTEhRYzJuV21B?=
 =?utf-8?B?L1BBdGhMdzA0NS81NnIvcFp6aVJGcTNRck9NTWNWZlkxRXluejR1TlcwMm44?=
 =?utf-8?B?NzFGYVBRUmxFcWxST3dQdVJjSlNuazRiM09LRnFWR3JONUJFMGdreGp0RlB0?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO3PR03MB6774.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab52afb7-e8a2-4070-a6a3-08dc209d855b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 07:40:09.8690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVSCtSVx700Sjl1TaHYSyAPTiSCICr9Px92qyGF9jQtnb/H8b46U6QpFk/1kYoTcPEsguTH7NlCXb27EZsLNEp8bxnllqegnv0xX1bVxnYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5598
X-Proofpoint-ORIG-GUID: fXainl5uXIRtnxHh1gargedGdrgjm5T9
X-Proofpoint-GUID: fXainl5uXIRtnxHh1gargedGdrgjm5T9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_04,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=805 clxscore=1011
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290054

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhlaW5lciBLYWxsd2VpdCA8
aGthbGx3ZWl0MUBnbWFpbC5jb20+DQo+IFNlbnQ6IFNhbXN0YWcsIDI3LiBKYW51YXIgMjAyNCAx
NjoxMQ0KPiBUbzogSGVubmVyaWNoLCBNaWNoYWVsIDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cu
Y29tPjsgSmVhbiBEZWx2YXJlDQo+IDxqZGVsdmFyZUBzdXNlLmNvbT47IEd1ZW50ZXIgUm9lY2sg
PGxpbnV4QHJvZWNrLXVzLm5ldD4NCj4gQ2M6IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIXSBod21vbjogUmVtb3ZlIEkyQ19DTEFTU19IV01PTiBmcm9t
IGRyaXZlcnMgdy9vDQo+IGRldGVjdCgpIGFuZCBhZGRyZXNzX2xpc3QNCj4gDQo+IA0KPiBPbiAy
Ny4wMS4yMDI0IDE2OjAyLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+ID4gQ2xhc3MtYmFzZWQg
STJDIHByb2JpbmcgcmVxdWlyZXMgZGV0ZWN0KCkgYW5kIGFkZHJlc3NfbGlzdCB0byBiZSBzZXQN
Cj4gPiBpbiB0aGUgSTJDIGNsaWVudCBkcml2ZXIsIHNlZSBjaGVja3MgaW4gaTJjX2RldGVjdCgp
Lg0KPiA+IEl0J3MgbWlzbGVhZGluZyB0byBkZWNsYXJlIEkyQ19DTEFTU19IV01PTiBzdXBwb3J0
IGlmIHRoaXMNCj4gPiBwcmVjb25kaXRpb24gaXNuJ3QgbWV0Lg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgZHJpdmVycy9od21vbi9hZG0xMTc3LmMgICAgICAgfCAxIC0NCj4gPiAgZHJpdmVycy9od21v
bi9kczE2MjEuYyAgICAgICAgfCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9kczYyMC5jICAgICAg
ICAgfCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9pbmEyMDkuYyAgICAgICAgfCAxIC0NCj4gPiAg
ZHJpdmVycy9od21vbi9pbmEyMzguYyAgICAgICAgfCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9t
YXgxMjcuYyAgICAgICAgfCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9tYXgzMTc2MC5jICAgICAg
fCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9tYXgzMTc5MC5jICAgICAgfCAxIC0NCj4gPiAgZHJp
dmVycy9od21vbi9tYXgzMTgyNy5jICAgICAgfCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9tYXg2
NjIxLmMgICAgICAgfCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9tYXg2Njk3LmMgICAgICAgfCAx
IC0NCj4gPiAgZHJpdmVycy9od21vbi9vY2MvcDhfaTJjLmMgICAgfCAxIC0NCj4gPiAgZHJpdmVy
cy9od21vbi9wbWJ1cy9pcjM2MDIxLmMgfCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9wb3dyMTIy
MC5jICAgICAgfCAxIC0NCj4gPiAgZHJpdmVycy9od21vbi9zYnJtaS5jICAgICAgICAgfCAxIC0N
Cj4gPiAgZHJpdmVycy9od21vbi9zYnRzaV90ZW1wLmMgICAgfCAxIC0NCj4gPiAgZHJpdmVycy9o
d21vbi93ODM3NzNnLmMgICAgICAgfCAxIC0NCj4gPiAgMTcgZmlsZXMgY2hhbmdlZCwgMTcgZGVs
ZXRpb25zKC0pDQo+ID4NCj4gDQo+IEl0IHNlZW1zIE1BSU5UQUlORVJTIG5lZWRzIHRvIGJlIHVw
ZGF0ZWQuDQo+IA0KPiBEYW5pZWwgTWF0eWFzIChkYW5pZWwubWF0eWFzQGFuYWxvZy5jb20pIFRo
ZSBlbWFpbCBhZGRyZXNzIHlvdSBlbnRlcmVkDQo+IGNvdWxkbid0IGJlIGZvdW5kLiBQbGVhc2Ug
Y2hlY2sgdGhlIHJlY2lwaWVudCdzIGVtYWlsIGFkZHJlc3MgYW5kIHRyeSB0bw0KPiByZXNlbmQg
dGhlIG1lc3NhZ2UuIElmIHRoZSBwcm9ibGVtIGNvbnRpbnVlcywgcGxlYXNlIGNvbnRhY3QgeW91
ciBlbWFpbA0KPiBhZG1pbi4NCj4gDQo+IElicmFoaW0gVGlsa2kgKElicmFoaW0uVGlsa2lAYW5h
bG9nLmNvbSkgVGhlIGVtYWlsIGFkZHJlc3MgeW91IGVudGVyZWQNCj4gY291bGRuJ3QgYmUgZm91
bmQuIFBsZWFzZSBjaGVjayB0aGUgcmVjaXBpZW50J3MgZW1haWwgYWRkcmVzcyBhbmQgdHJ5IHRv
DQo+IHJlc2VuZCB0aGUgbWVzc2FnZS4gSWYgdGhlIHByb2JsZW0gY29udGludWVzLCBwbGVhc2Ug
Y29udGFjdCB5b3VyIGVtYWlsDQo+IGFkbWluLg0KDQpSaWdodCAtIHRoYW5rcyBmb3IgcG9pbnRp
bmcgb3V0Lg0KV2UnbGwgc2VuZCBhIE1BSU5UQUlORVJTIHBhdGNoIHNob3J0bHkuDQoNCi1NaWNo
YWVsDQoNCg==
