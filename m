Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AE9C4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 07:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C916A604DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 07:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhGZHHU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jul 2021 03:07:20 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:59584 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231621AbhGZHHT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jul 2021 03:07:19 -0400
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16Q7hAZI001481;
        Mon, 26 Jul 2021 03:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=7w1wbRan//eooCiP2x6thf3ujCQoqvgXycjSQpni+x4=;
 b=ESLaWCpYXWofVvTVEfuk+BfQ0lD2ilcjiALlgI2GnJsJT+/l6Z9HUNXkNEukK++66odc
 q6mczjyKXlapUXeTgOL3lrdt6Xse6YxKL9ETg8aKmLGrEh+sakScUz5+kT001nGYWeUZ
 1JhgAdIbl6RQ3oFuqLhR7ZJKSNMbv6LkiuYARlURl4kNNAcmZJ7nybIKdjfTtEHDW+Qn
 ttH415Nmp1JRO3i53DfOYvjagBA6vwpIhwxja82Hfv6cglsJpFTFR0mmf13TtxIqGHFV
 PQMAJiN8gjHa0TDRJDDuANCtC+NhMZ6JQuDAQnPo0vmON09QbV+8Zw/G4T0qp0C2dck6 xA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 3a0k49mt1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Jul 2021 03:47:34 -0400
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16Q7fIp4014537;
        Mon, 26 Jul 2021 03:47:33 -0400
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by mx0a-00154901.pphosted.com with ESMTP id 3a0ytkbtn7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 03:47:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKhahRhBeLwCgHjPruoMZiZs3nGmrCyPdLip92k/SsjoqymprMrcn1hch5nLCIbuTB+kDhaGn2dqQMqmBdSoO2WGvhOkWh2SxkAR/cnnzudYkqvuOE2ZaRfiZrvvSv4Fc5wiuJykIdQkrse/vQqo5cJ2uO5yMCblnFgISw/2l7xJY+mM8mkxXX895CfqZAqVhWcG2aTDfUx7IuJn8YaRp3CgYuUbptz5aL3QV5QcQkCc/Eg2Cs0qGWOJV/xkT3nTemFQNtoNt0r6IUNAxBw/zAEeZfzZDgIt0nDs+BXBusTS+/vj6joAo2AnR4hE4I9QbWHaNkJqEZ3W6P0aeHe/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7w1wbRan//eooCiP2x6thf3ujCQoqvgXycjSQpni+x4=;
 b=GaxUCnkHpgFFlKIziRdsnIj31fP3xlyBLbIHwaJIPFGacQgt1nAtmCmd14RUBjwZj6s7zTFB4jnUjL139CkC3mqMs/XsrJ8FzK54vWVKKSXOILt01D2xcaujqKy4ACI+T2tvQh6MTwRTRm7CxcECW2VFeMZEyXv6BNaouXDVTjfG7L0t7YPdAndXP4pj183agdrKl2JY7z48Ylbx9nzIarlJa3Crkrs1NnWbGcpy36sRqWta205Ha/SIV8/GuEw5M5+nRR6HAlhGbCGlB/p8s05JFlAeJhwqsANWofE0sW9H20302LUnGyXMFfvAYBCuCclb5Xb/hmReJYURss41qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by CO1PR19MB5222.namprd19.prod.outlook.com (2603:10b6:303:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 07:47:31 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 07:47:31 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 0/5] hwmon: Add driver for MAX6620 Fan controller
Thread-Topic: [PATCH 0/5] hwmon: Add driver for MAX6620 Fan controller
Thread-Index: AddyZLj95yBihWm1SmSbEomGCD5YsQAA7bmAA+JCCuA=
Date:   Mon, 26 Jul 2021 07:47:31 +0000
Message-ID: <MW2PR1901MB2028749607502C9E63FC25AEA6E89@MW2PR1901MB2028.namprd19.prod.outlook.com>
References: <MW2PR1901MB20287B190088EC2608094AF2A61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
 <c058d3c0-2977-00cc-fba8-2eb81b28095a@roeck-us.net>
In-Reply-To: <c058d3c0-2977-00cc-fba8-2eb81b28095a@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-07-26T07:47:28.8687003Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=cb7fe09e-cb27-451e-a5a6-b14dba9790e6;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f45d67e7-6b15-4496-0e48-08d950099fdf
x-ms-traffictypediagnostic: CO1PR19MB5222:
x-microsoft-antispam-prvs: <CO1PR19MB522232593BA637D308750DEAA6E89@CO1PR19MB5222.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZoX6igL9KogFnT2HCA29UCdq87EPaF6WdKS3R9U4/cDTc9MCYSCovvPEwjJWq/Zp6xWXNJWKh5gJq1WQBN7B9yQaxaW82IsURY4KAWrnqZsr8u8OZ/gPyiBLe/dE36ZUDO/Xl4qo4GVjWsXq6RbdLoT95jJg6MnaQk0rpq/MB0WBq+xsi/dIsAP3y3O/Dd+acLBESFXCgi9kgwJq/MjGfzb3TA+S251UhepMSuQ2grtZha0hv6i7Nz0RNXqyifEkVGRqT78XnDtq74/71Dd7IlV8jw6zlDj8xoCabnfdpmkx4W798htH9kyXNvd1x7EMTB1v+2YCtGf3bNS9OgvgTXZqAsYqZRiOpg++tSC0tqrD1WflZ36lB5DzPlKrx6WXN2xEeRyh6yX7K7U2FqFfnd82DAwLMXxIMsibHnYeRA/WEcmdGbMVbaO8wg3yXKj7WguDXKieeuivUm7Td8s0W8+hZaIoks0qD5DKwiEyQDjB5U7pqPwcentYg+8DpR5UAw56DBHjtLh1upc62qDtmsB4ZowBJWnSS4z7QEd/Pz692YrXLCHh4ujHU4hChFZkk4VqqLQmCanxGV5+Hx5OEbnyivAXOIKDoY6jOQlgV3qzggPiZ/aUMDeRDDwlW5LG8g6CLAk4+AXGxQWHHe/rVFIV97a4+9mHmGXySmbWc3xpY9JDgUkpvWol9J4pjvjFaJhdYvK8A2pc84x251v7FQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(55016002)(66946007)(55236004)(8676002)(122000001)(786003)(316002)(9686003)(83380400001)(38100700002)(2906002)(5660300002)(7696005)(64756008)(33656002)(66476007)(66446008)(66556008)(52536014)(26005)(76116006)(110136005)(53546011)(186003)(86362001)(6506007)(8936002)(71200400001)(478600001)(4326008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVRqN3h0SmgwczdsVXkvbURNQy9ma25VUmZra0RMOHlGbXVzQ2VYT2xBZzFp?=
 =?utf-8?B?MmpjZWwvb3hyUmxSa09sU2ZPWVc1UXRQUURyOWczOGduWFF5Vmk1UFR3Mzdv?=
 =?utf-8?B?TjZ0dk8vWXdxTGhRUTVwSDRlMXRpRW81WWJzNHlnMWtXNStDdDJBYVBoWDdt?=
 =?utf-8?B?cDljdlBxTXBOaXNReGNJbmgyclhaTVlsaWxGSE1oMEcrakQ2M0RFakZ3Tkhu?=
 =?utf-8?B?TGt1dmxZUG9vYk9sS0I2YzNhZWFIT0F5eFZtNjZ4bmlia2FHY1lSckNUN1hT?=
 =?utf-8?B?NndZejBYZW1RcVVWdEpuQVQyajQ2YVdUUHp5bEJDYUpucDRQT1hZMzRnajhG?=
 =?utf-8?B?RndDTjVmMkZodEtZYWhjc0dwMmh3Y2ZoZU5uMHJWSStOcXY1ZjRyNks1dFYx?=
 =?utf-8?B?M09FeitNb1VKUjJqM0VzQmxnTTROeitxRDd1K2xGMGFCSE1OMEJZSHM3OTlR?=
 =?utf-8?B?SWdwMnJFRXBqbGpseWNGMitTQ2R1cjF1aCt1Lyt4Yk92TlRqYU1wWmtzZ3dl?=
 =?utf-8?B?OTdwVlVLOXdPWDh4amdySVlaREp6Ym95RXNXNk8zZ2E3OGVlZWRlbFVTRFMx?=
 =?utf-8?B?Uno5Vi8zTFhiOG9oOUZFa1dMckdzZnRzcWIyQ0d3NVBGSjBnZzdWVW1iY2hP?=
 =?utf-8?B?RHh5TGtsWU81dFVKTnEwZmJuaExjQnlJWGgxdEI2empHYlBTZEU1eHk3QVdm?=
 =?utf-8?B?SUpGV0FQTG1tUEs1Nm9VdGJvSVRBS1NaNlQ0aDIxTzd3YlhEajR5bW5GUktF?=
 =?utf-8?B?L1psK3h2bEdvTUoyMktjY2hyZXZDSGtoZStManRwMTdGYzdyeldwQVVSUTdR?=
 =?utf-8?B?WStyYmp0aldEamtveUtKTjhLOXRwOUdJS0xFa2g3ZE1MRTEzb2daaFFrYXJ5?=
 =?utf-8?B?ajZhaEdzK08vZnZPd3U1cXk0RS95K1pLdDhOMzhNTllzUzFqTlJLNEpWZVpG?=
 =?utf-8?B?RDliRmlIZXJZZk5VWmtnZDAwVEtUN2RueGR5SmNES1dTR1k0TThxRFltMmRT?=
 =?utf-8?B?ZUxRYTYvc1VvRTRRZVQyUzdjbGNWUGYvNWNLWVZOVzJZRVFjZDViWHVoWWxl?=
 =?utf-8?B?ZW1BWmpvUEpWeTZ0S0x2bGliMDRjajFtSllidGdpYTYrTFV1czhHSHBaZ1Qw?=
 =?utf-8?B?MXpFUnhPZzd0VEoydml6bFR3ZTdYVzRTYnpsb1BaL21xTnpZd0Vzd2FySy91?=
 =?utf-8?B?Y2tRRDBid1R0MTdoelRCWlJKY2pranVzaFVEdUMrMlFYZk1rUHNQYSt0Q3N0?=
 =?utf-8?B?elRlbXNkbUd6eVRQN2JHaWFYNGs0ejByQ3o3V2tFdzV1VDczS0srcEtxQnhq?=
 =?utf-8?B?bVErMmZ3eisyL0k4bUJ2V1RxQVQ2OTY3LytxVTVrOHRFWlZ6V2FoNnhXTFgr?=
 =?utf-8?B?V1doaXlTTWZicm5JTk5ubGxraUV0MUVKOTdnQVZlcWtIRDVRdTNBa1NKY1dE?=
 =?utf-8?B?d3JCYWRUVXNoQjB6RjZKcGdzVDBIM09DL3VXbWhCcUZqSjdLQ0lybjdCZ1lt?=
 =?utf-8?B?UTVNVFR0L2JjeUtKL2FMSFdIZDJ5WlZ6ajFkSy9wMzZpNDV5QWFHa2dDeDFM?=
 =?utf-8?B?M1B1aVZldWJxMjR6TUE3T2p3WVZCeDVnSFJyNklaM21Ud0grZ1plRWdUTDJx?=
 =?utf-8?B?cVhVNlpmWXJseTFVN0diOUgyblZzNDJhNGVuVWE2ZHFPRWNyMER0Q1kveUR2?=
 =?utf-8?B?c1gvUzRTSHNMaTVpL3k5NWlyZ1I4Nk0vYU5Cem9jaThyUmd5SHFjU3JpV0kw?=
 =?utf-8?Q?26BXhAIFdWMLmMdZ8+Q8nVMtozYCyScm683o+rj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45d67e7-6b15-4496-0e48-08d950099fdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 07:47:31.2871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJvQEK2A7M/xU9SRMyS/g0OTp5YYK9nsImWKMlxF5suZgVeNoDwj3fVov7SKOBd5VltL29+FfFQkjCEW67fmR9Ja1bA51KbJ921AaifSBh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5222
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-26_03:2021-07-26,2021-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107260045
X-Proofpoint-GUID: 0zFf6pKUDXxZ5EGsZSxRmbCt-trfMrfZ
X-Proofpoint-ORIG-GUID: 0zFf6pKUDXxZ5EGsZSxRmbCt-trfMrfZ
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260045
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IGNvbW1lbnRzLg0KQW0gY3VycmVudGx5IHdvcmtpbmcg
b24gdGhlIHN1Z2dlc3RlZCBjaGFuZ2VzIGFuZCB3aWxsIHN1Ym1pdCB0aGUgc2FtZSBmb3IgeW91
ciByZXZpZXcuDQoNClJlcXVlc3QgeW91ciBpbnNpZ2h0cyBvbiB0aGUgcmVjb21tZW5kZWQgbWV0
aG9kIHRvIGluY2x1ZGUgdGhlIGF1dGhvciBpbmZvcm1hdGlvbiBvZiB0aGUgZWFybGllciBwYXRj
aGVzLA0KaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHdoaWxlIHNxdWFzaGluZyB0aGVtIGludG8gb25l
Lg0KDQpSZWdhcmRzLA0KQXJ1biBTYXJhdmFuYW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBPbiBCZWhhbGYgT2Yg
R3VlbnRlciBSb2Vjaw0KU2VudDogVHVlc2RheSwgSnVseSA2LCAyMDIxIDY6NDIgUE0NClRvOiBC
YWxhYywgQXJ1biBTYXJhdmFuYW47IGpkZWx2YXJlQHN1c2UuY29tDQpDYzogbGludXgtaHdtb25A
dmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDAvNV0gaHdtb246IEFkZCBkcml2
ZXIgZm9yIE1BWDY2MjAgRmFuIGNvbnRyb2xsZXINCg0KDQpPbiA3LzYvMjEgNjowMSBBTSwgQmFs
YWMsIEFydW4gU2FyYXZhbmFuIHdyb3RlOg0KPiBGcm9tOiBBcnVuIFNhcmF2YW5hbiBCYWxhY2hh
bmRyYW4gPEFydW5fU2FyYXZhbmFuX0JhbGFjQGRlbGwuY29tPg0KPiANCj4gQWRkIGRyaXZlciBm
b3IgTUFYNjYyMCBGYW4gY29udHJvbGxlcg0KPiANCj4gQXJ1biBTYXJhdmFuYW4gQmFsYWNoYW5k
cmFuICgyKToNCj4gICAgQWRkIGF0dHJpYnV0ZXMgaW4gTUFYNjYyMCBkcml2ZXIgdG8gcmV0cmll
dmUgZmFuIGZhdWx0IHN0YXR1cw0KPiAgICBVcGRhdGUgTUFYNjYyMCBkcml2ZXIgYXMgcGVyIGxp
bnV4IGNvZGUgZ3VpZGVsaW5lcw0KPiANCj4gQ3VtdWx1cyBOZXR3b3JrcyAoMik6DQo+ICAgIERy
aXZlciBmb3IgTUFYNjYyMCBGYW4gc2Vuc29yDQo+ICAgIE1BWDY2MjAgZml4IHJwbSBjYWxjdWxh
dGlvbiBhY2N1cmFjeQ0KPiAgIA0KPiBTaHVvdGlhbiBDaGVuZyAoMSk6DQo+ICAgIFVwZGF0ZSBN
QVg2NjIwIGRyaXZlciB0byBzdXBwb3J0IG5ld2VyIGtlcm5lbCB2ZXJzaW9uDQo+IA0KPiAgIGRy
aXZlcnMvaHdtb24vS2NvbmZpZyAgIHwgIDEwICsNCj4gICBkcml2ZXJzL2h3bW9uL01ha2VmaWxl
ICB8ICAgMSArDQo+ICAgZHJpdmVycy9od21vbi9tYXg2NjIwLmMgfCA2MjUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNjM2IGlu
c2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od21vbi9tYXg2NjIw
LmMNCj4gDQo+IA0KPiBiYXNlLWNvbW1pdDogMzAzMzkyZmQ1YzE2MDgyMmJmNzc4MjcwYjI4ZWM1
ZWE1MGNhYjJiNA0KPiANClBsZWFzZSBzcXVhc2ggYWxsIHBhdGNoZXMgaW50byBvbmUsIGFuZCBw
bGVhc2UgdXNlDQpkZXZtX2h3bW9uX2RldmljZV9yZWdpc3Rlcl93aXRoX2luZm8gdG8gcmVnaXN0
ZXIgdGhlIGhhcmR3YXJlDQptb25pdG9yaW5nIGRldmljZS4NCg0KQWxzbyBwbGVhc2UgZm9sbG93
IHRoZSBndWlkZWxpbmVzIGluDQpEb2N1bWVudGF0aW9uL2h3bW9uL3N1Ym1pdHRpbmctcGF0Y2hl
cy5yc3QuDQoNClRoYW5rcywNCkd1ZW50ZXINCg==
