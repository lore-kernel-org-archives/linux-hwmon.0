Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855A7C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 17:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 626D161100
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 17:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbhIGRuv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 13:50:51 -0400
Received: from mail-eopbgr50138.outbound.protection.outlook.com ([40.107.5.138]:28547
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242931AbhIGRuu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 13:50:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9VD8iDhmJlPUe6FAoO/2vDpYW4/cwdmYIpUiVUmuSatE78aYM57iHES3keDANG8OkcRMC+B8a/A3Q4NbSqRE/Wf69HvT9C3ta8B5k04SB16mufTARDDvqtK1K51Eg6oZ+xdCrCWhp4wQgLPuB7Xmw971p33jdWEjvdFr2eONe3KVMcvmXi5+tLXqSDKFbj1a2S+NtrtJn7PMMEOCLB8wUMnI8ytQnPpdWRlNoPbE/VZTDHc0ZXQcvsVfzRF4aw6+aL8mHjHGLOMKIO17cZCUaj5OoIxuDT70pSpRxIzKmq+y5RCiqu2MdmKDOSBuBNWzR3NRUBSiQvGXklHY6G3UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Pmn//LAF0w13NKmS9GscYQ6dIzjhHzrea5KNDw9UhyI=;
 b=GLf3L8sRdeZ509tbk7/6E/Ilq9TOYkNn8IH3dqPBZ8TRiFe8DHwcrzc7YRKhTHmYVD6mTwu48ba/xtSMFOpmiWKr4rnYGkpUB3qblUw+mUAIcVy2KJdmXFjemFdS2brUXRvL7r8fJ6ZWngma6LdUO2IMn009zO2Fi8kvXx6ogdi/jrylFAFCqTQibgBoJ0AAua5zXErp4fWY9jqUImcCnPBmbulUvppYGiG+275IK5h38bhDCKCe58g/rBc4/AGwYtznfQzhpDdCzY7ZLu5Nxhrw9k24UDOGq8dHDsBKLKLpUtmJCBDNFLwsVZtXwiN66fwdyGN26KNySsyp7YUtWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmn//LAF0w13NKmS9GscYQ6dIzjhHzrea5KNDw9UhyI=;
 b=qBwWj++rx+s4nKJPhKmqMXORZklJ9s3ojreudnad2piHTblOl8I3Ntbo7vCiPqCUa1rXjcQ+fFV6aiU3R7FVe60Z9n6YiJvgxeLNuM3qCaD+JhNh724jFeVqKCxF2QfjfDsPEhb+vICMfcLx8zBqozUkoZE4NzhAis55m6oC7lg=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8149.eurprd07.prod.outlook.com (2603:10a6:10:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.12; Tue, 7 Sep
 2021 17:49:42 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 17:49:42 +0000
Date:   Tue, 7 Sep 2021 19:49:36 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/8] hwmon: (tmp421) add support for defining labels from
 DT
Message-ID: <YTemMLjCVMsbteOm@localhost.localdomain>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <22639314543a98b4c24e55b7e5a803325ad9e568.1631021349.git.krzysztof.adamski@nokia.com>
 <30814a02-10f1-2590-26a5-b3f6ff367be1@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30814a02-10f1-2590-26a5-b3f6ff367be1@roeck-us.net>
X-ClientProxiedBy: HE1P18901CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::12) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 17:49:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb096bce-e6d3-4428-71d0-08d97227def6
X-MS-TrafficTypeDiagnostic: DU2PR07MB8149:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8149AFE9D4793E39CCDF56A3EFD39@DU2PR07MB8149.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6WoZvy4Oq6ieNiCSkf9OGx1Wd0zf060bGhZfZC/6sy1YCxSG7C+Cop1wlCgoaDKJaAsnmafJ7vUNzB8UZKUCr8GzMLne4eihhLZIeQ1DWeu8xhD92lUjijy7SqT93y+3/m7bwPQm8At/jSi1c3z0NSFSSWKmcYjWem73oEaEYv6vq8NDZailp262AJ4+LLn7b0VEJI/ms3CCGijPF0alHh5eyPhn060obn6ZwdIZvofRouUuG/7gY3JeTnXeukmADHTr7y9/IjMbqtLLTFp37IKoXygJEZxgd1UOqCh5kZ3Ks+u71zTMiWR+RYO2Zc9Y+R96Y+fRCxDPVqR3cgo8ks8RKVyIOCqxh+xUy5S5Z4FpPptiy1MMmciXXgOsptiO3JftYamEGjegEZDpvnzHhjxxwLEhmpE9mrBKh7/sErq63a7Pp5oRltCkh1HSJlGWBJ3mC0zw4XaVt0nDTyxmY9GQ/VgmqZJYxteKc5+KCV2ek2ZVo8KKg+ZiSTXjLSGC7gtVgMv2qGZa5IXo0GQiPxYquzzbcD2P8Zu3l6p2QLgKQdHikjb/KqSQre09UZ4K3lHL2+YIMWKqgytZVEt/uxIvKIRtzjO2xow9TksOIhKYOSLizO4Svs40wZfh9FWqbqu6upG5evDfYGsCZWGJmljFDmDY4HThk0Ao93e1sa1mVUbAcl6mvU5p8XuDusbbPCVGGT2TfIyYTwjagFXCMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(5660300002)(956004)(44832011)(6666004)(2906002)(55016002)(38350700002)(66556008)(66946007)(6916009)(6506007)(4744005)(4326008)(186003)(9686003)(83380400001)(8936002)(52116002)(7696005)(66476007)(508600001)(38100700002)(316002)(54906003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S291TXkyOTJtWlJHZzkvRzFhUDNOUzc1dWQ0YmxDZXhwemhoV3BLNko0dWdP?=
 =?utf-8?B?RkYzK1J6czg5aEdnSU9rU3FrUk4rdVVqcStVU254NTZ3SC9RcWNQMGw1c1hn?=
 =?utf-8?B?SjM2UGMvQitZTitDazBiaENHZ2h3MHdvU1J5NGVjMndublpUMXlNQnFRYjBT?=
 =?utf-8?B?bDRYYmtXZy9yalVWUzV3OFBpTXFZYjVjMytRZ3ZuWW1yZDRJL3FxKzhjclZu?=
 =?utf-8?B?b0d3eW9tV0toWnBsMlZYM2dEQVllRFFzNS9XUDBGMU4xUlFpeDJjZTEzUFdv?=
 =?utf-8?B?SGFsYWJzWEV1dW14aytKdDdlZVlDZnkwSjJyNWdiUkJRbzZtbC9YaDVOR0Rx?=
 =?utf-8?B?VS8rS2lYcXQvRFZyM29JaFFtQ2JzcUlGbXJtWFpqZzIyUU96V0JlM0J5WjQ3?=
 =?utf-8?B?VlBqTXRRU3M4dlRvdnpWS0lwMlNXQm1KWWh6clcvckcxd0d4ei9FblN1c0hG?=
 =?utf-8?B?WlJ4cVZIRTM4c2svWEJnRTFEM0toOXVKSC9MQTBHRnh4Rk1BZFRHdGZuTTN6?=
 =?utf-8?B?aXh6d2pNL20xZmJPcmF6NEdlT3BHbDV4ZkJpV01nZ21Icys1V1RkUktzb2VM?=
 =?utf-8?B?SytlL1FPSlNKTVNzMWtoVm1JcHJsN1FQUUNyemJJTDJzS0crcUZLRmZNK05v?=
 =?utf-8?B?MEd3ZjVRMnRCbjIyMUZNNlFrcmRweUQ0TjVGTG4vRlFQOEdZbG13a0JuamxI?=
 =?utf-8?B?VTkrZ29EcEZLNy85OTZOL1NOUXVSNlcrMk1NR2ttYklqVWNOSXNwUnFHNzJq?=
 =?utf-8?B?aG1TTHh3ZUkvT0UxMUM5VExqSEdDTExxWUZNU1p6YmZyKzBaL3NwYzRwV0U4?=
 =?utf-8?B?a2l1cTkrSGM0SWtYZWk0SllZemdiR2I5OTNMVkJxeGc3YXF2VmJ3UUwrZ05q?=
 =?utf-8?B?VVZTVHU4aWJvRllpVmUySHYzVmdmRjhqcWZxWE9JVkJMRG40aExjTWtzRFcy?=
 =?utf-8?B?UjFNZFlwUFA4YXZqZDQ1ZkNhMHBSbmxGMHFqbjg2b1M3bHRiYkhIVC9qUngw?=
 =?utf-8?B?ZVhvdkkxRm4xemNYWmhjN0k1bDlSR0EyUG0vZGNCekpjZ1J4RFdmODRFRk1w?=
 =?utf-8?B?ejZXN0grNjFoVWZubWhLSktmeU5kTkJCWm5wbEFNZzYxOWhhNysxNk16TTM0?=
 =?utf-8?B?NGJoNWhqeTFtbG5YRVNnN0E5dzFCWUROa1lzZkFSNWRCcFRyRk1KME5ReTFq?=
 =?utf-8?B?cmJUWkNsblJoV1N1TU5HWWRVSnlNa0tLeE9Fd20yZElWRlJBcWNqVG9HanRL?=
 =?utf-8?B?ODBmSlJPdU1OaHU0UWZJR3BsOVc2RWk1YzAvT1hxaVJaT0VKL25BWFhxUjVa?=
 =?utf-8?B?MlhJQlUxVHBPR2t0cHpHb3Z2M0hFaUYwdndzRkNldmJKOE0xNFBGemZCR09D?=
 =?utf-8?B?cFpxYW00bWd1Y1E2cWlLbit1VS9rd2JhZ3NUTmRDTFpBTjNEYWJjWWZoNzZN?=
 =?utf-8?B?T1FlL2tIOUd2cFhwWFF1d2dobUtSdlRZOHdVeHN4ZFY1eWZFclZFTDRrQ2VD?=
 =?utf-8?B?cVpXL05MWUJlNWxRSXRPclZYZEpkVEU2TlZBR2VsbXVWNUxHWXlWUEJta2Vl?=
 =?utf-8?B?cnp1R3pNN1RQZ2dGU0NHK2x5QmdKWEYwYjZPY2s1bUREMWcvZCtOcHlGRWNC?=
 =?utf-8?B?aUR1SUtaaWVxdXNORlFrZmpEcFdtOS9LVW1lT0ovSU5rcVBWVnBtdDlnWkdE?=
 =?utf-8?B?NHd2RlN6a2ZkOUxocXpOTmsyeWtucWJDRG1ZaEhKYVZReklNWm5qYVZUYkR4?=
 =?utf-8?Q?m7zH1X2yLQ6on5NyFQyP04VpD25hHRxhxjFMXYN?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb096bce-e6d3-4428-71d0-08d97227def6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 17:49:42.1023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjqPeTP1eKeW08GNytRnCCOf0iSGcTwtwnKsc5HTG5ySNK3eNyDTucRh0ms0K7xWKxCXIUhKiSBQmIHikaP/hK/Q82k25vxg+TiR9NT1wwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8149
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Tue, Sep 07, 2021 at 08:46:22AM -0700, Guenter Roeck napisał(a):
>>+void tmp421_probe_child_from_dt(struct i2c_client *client,
>>+				struct device_node *child,
>>+				struct tmp421_data *data)
>>+
>>+{
>>+	struct device *dev = &client->dev;
>>+	u32 i;
>>+	int err;
>>+
>>+	err = of_property_read_u32(child, "reg", &i);
>>+	if (err) {
>>+		dev_err(dev, "missing reg property of %pOFn\n", child);
>>+		return;
>
>Report to caller
>

My idea was to make those errors in DT non-critical. I.e. if one of the
child nodes is not well structured, I just skip it but continue the
probing. Do you think it should be considered critical and I should
abort the whole probe function as soon as I detect such DT errors,
instead?

Krzysztof
