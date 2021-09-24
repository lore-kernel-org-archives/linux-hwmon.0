Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF66FC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 07:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2AF560E08
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 07:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237965AbhIXHzf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 03:55:35 -0400
Received: from mail-eopbgr40105.outbound.protection.outlook.com ([40.107.4.105]:43136
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244467AbhIXHzf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 03:55:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7ktvptBAZnpUfue02rHN4ByUEk0kcfqFK8th7/Satket3MnaRclVEstksx+p/B/isyTUASs0EsZFCZdrgJkFaJw0gc6dL/eZk2VZVY/miJvqlrMEcyxpyK5ZrDsOKPKchysoufamVj0Q2uQNLetV6G4W5XxgJ2J0Q9bPR2QCui2KMSlY5ig2qTSxau9bz59dtrvZBpftMB4CO8kVYZ/USVooUIBqXRfsxKv7sGyZYElcpQnoG8XP9tUBrb7ZNfmdvD51I0DTpBpOLmJQ5pJ5L/j+PmgsAJzMCRv3Tp4TZ5bTDyeEBvGcC9Oqe+JSEpHRGZko+rtJR0oJj/cEdjqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DlSGGjNZnT0bbCnTlXZ8Fm895NV6lHxZiTZnsI5IAQ=;
 b=QMw9V4ao9Lm0lQcHHySJXQs8G8Xxfxd0effRtnfNYC3+CO1Eqj3XecJpQFC94eXl+hiD1H7j1wPmXQCQdDo+cWBnsjYdZxsMrr51wFfUOJZYgy5wWwRDps7Nq0bJ+vanyxxTvKt22iFfNxVbHSDJ1iu0gsjjljhR4s4VDJ21eTx7kwXgynB/4WxH8rWltsxeMfu5abhbni8Hc/5UkKaxfnxWZAigMgOtQ17XhAJycakdGCqfvQtNOYBFt33+lqf/95QoL1SEI/j6C6rvB9BfmgoAyxsaN+fRnq8JGuKua+KXxSsoegj3Z+f8jmY7PKV1IDLGWuK1y4LCqYAQHTcMhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DlSGGjNZnT0bbCnTlXZ8Fm895NV6lHxZiTZnsI5IAQ=;
 b=njh7bhoajNI8w1gT2UakUEKCEdn7Te2Zd4Urw9LP+DXHKo1wc8ZeMurvJ/5f3t50Uuz71Jj1C0M/89Y6vI5nnt6O/ltW43K/FwpLGqt96BAvOHuoUFqjYAnTC2P5NIHvok4ehPMFI53xOp3P14Y3TyQ8mSU2l0Mji5LDYOQOsyc=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8303.eurprd07.prod.outlook.com (2603:10a6:10:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Fri, 24 Sep
 2021 07:53:53 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 07:53:52 +0000
Date:   Fri, 24 Sep 2021 09:53:16 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org, Oskar Senft <osk@google.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <YU2D7L7QMgCJZUeb@localhost.localdomain>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
 <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
 <20210921205247.GA2363535@roeck-us.net>
 <CAL_Jsq+NXuF+F7OE3vyEbTUj6sxyMHVWHXbCuPPoFaKjpyZREQ@mail.gmail.com>
 <20210924002951.GA3027924@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924002951.GA3027924@roeck-us.net>
X-ClientProxiedBy: HE1PR05CA0159.eurprd05.prod.outlook.com
 (2603:10a6:7:28::46) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0159.eurprd05.prod.outlook.com (2603:10a6:7:28::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 07:53:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf8ed828-9605-4aec-ca89-08d97f30736e
X-MS-TrafficTypeDiagnostic: DU2PR07MB8303:
X-Microsoft-Antispam-PRVS: <DU2PR07MB830350486CFCB0DD78664B8FEFA49@DU2PR07MB8303.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n44V4vRxNFcp4HquYu2c/P4Xk80o9djxiqNgrphwolQTop6Bg6aojklL4azUoOVtoa+qqrZsRKvi30rJPLdIRL1mdpo0Kss3anhznJytnI/TwV1tZLSZlJBESRQDQXUeg7kCxojRM9Ex4GXLKUQyxSl7kC+ByxJjKBaIWLvS5fIMcOJ37A9O7PHnmn8kAymQ8T1esHUA1mXzMVXInRgTwqsLj+WtJCEOTVm1BDW99Krv4YG2yxi5ZLWVbordDWde+crPXxFvhLpdsl/KdmqR+Kjb2glK8ZCPsb3O3osUIyNM4daTYVAtby8L88YX3bD7x2/BD/6E6Jnwfv0/fNVBy6hAJGHh1MWjICKZFFeuOmtoZodgFNOpS3ZQGxeuzLsy7Kt7DoN7fdEckwhQ2Hn9qfTpN8LiDz9w6EtG4T0la38vve+GpduSVBPO2BdNdUJoHm1YmTFBiAJGzZJI7SioZKxmtviI2MjK5S1yKkVLY/Km0wauIOsLOYGlMXpdHYH/cKASZKcrY1rxp3z5xkfR5oHmCL5F7my7927B4O3oL7skXgylG0FHK9QdIrHPjgPBQzHZzIDQCXvH0wSPWCmxzbrrgv4TPbvSfKgIdmGB7E2jP7F5NaGIyfaXPvzFJAFWHh+4nr0/cPXn31kSIA/8+9VfKkjdSukBTrAyLhZGhYVGpi7dlRyYPl4kTc1AQ6tdCT7VPFNMF+025R8T3z5RjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(7696005)(316002)(83380400001)(66946007)(44832011)(86362001)(6916009)(6666004)(38100700002)(8676002)(66476007)(52116002)(26005)(5660300002)(2906002)(4326008)(8936002)(508600001)(66556008)(186003)(9686003)(6506007)(55016002)(54906003)(956004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnZCT21hODErZFRucXZrY1hLMi91S3YwOUdWTzI2NjBKbEpKK0F0c1AzbjE3?=
 =?utf-8?B?bG1UQkd2eEZRNnNHWlYvbEFzOXJCV0VIWDZZMVNMcG9UQU1OWHdSSmVWN3Av?=
 =?utf-8?B?dG1tSy9kT3JhbUNrQ3J1QmxXV2JTRERNU2V4dk4vZU9UY0ZSYzBnYlZHTDBD?=
 =?utf-8?B?TE1VZVBGQzlUMHk2NGxKbGNpa3NLNVYyZkNNUHkwd1ZxNjg5bEJkeUNJckdO?=
 =?utf-8?B?NHluS0t4RGlNVjd1VHpWMEdzUkRTazBidE9DVzVyTkFIeGlBUWIrZGUrS2ZW?=
 =?utf-8?B?dm5peGhvU280bWo1dHBiSVdvRnpFdDM2QmxzRkhkUVpuQUsrVmttVEkwclBQ?=
 =?utf-8?B?YzRHcm9FaFFET005Y1hrKzhQR1RhNVFISmIvUTU1NHRQa3k2WEFqbnNyVFNQ?=
 =?utf-8?B?UEVGZzRxWm04YldidnljYkFzcHBudGR0TGlyVjIrSHI0dnZ6YWQ4TDY5SDVj?=
 =?utf-8?B?UG9XaFg0M08vZFhWeHB6WjZDV01Ybmc0MmtzaWJoUG5MKy96MCtLcHN2WHhW?=
 =?utf-8?B?OGVZaktPTWx3cnBZc1pjUkxUSFRxQ2cvaGk2ZnE3THlUMEUzLzNVMzN4U01D?=
 =?utf-8?B?eHlFelZLWjlBNkZMZFptQ0dOQW8vdGUyK2c0RFQxY2loVnR5NnVmU3FRanUr?=
 =?utf-8?B?clFRMW14KzZlM01SVVFxQldVWmdxa1ZvWVl5WE9YU0wvQ3hQb0JndGVyL1lt?=
 =?utf-8?B?SWlQZ0xaNTJwSytWV3dyQlNYdVd5VlIwYlVySjVtQWRvZlEvRVBTaTgrTTQz?=
 =?utf-8?B?OGx0ZVRtbThXVTBYMEdFWTYwd1JGTlhZNTE1b1JJUnc4Ky9HZW1sOEY2eDNT?=
 =?utf-8?B?cFByWkp2emMyc0hDTUYzdm8zalZtWVlHOUQ4SGc4UUpDRzJuN0dDSmxKOVh2?=
 =?utf-8?B?a2JXYzN2aDJHVEZFenJUZllDcWtNdHlRSmE0RnNUcTQxS21tOEg4KzNIbDBz?=
 =?utf-8?B?Vy9JcHhlU01vdm8wR0R4Tk9haFhzaHhacUFSVjZIZEFSTEU0TGZ3UnYvMGhu?=
 =?utf-8?B?cTdwb2FncnVia2tIWkF3MHVyVEZMNnF0L2ZoNUZCRVJtT1NYMVBua2dWdnRC?=
 =?utf-8?B?NE5jNkFObzYvVHpWYmZZZkN2WEpvUVZRUkM0RExGRHFsQ2FlTmxsOUpGanhz?=
 =?utf-8?B?QUljczdyUURSYnpMSUZlU1R3cTd3bXMzMWxXVFBjR2lDMjZKUTk5eVQ3TGM0?=
 =?utf-8?B?ZHBZZTFyRHh1bUZ1Ykw4Vng3ek1HY21CS2piakJjUm1FVFVsb2Z2bU1UTHRQ?=
 =?utf-8?B?TzFMNlA3cHdPUzQrdG5aeEtVQWROMW1BazFqdmJJVjBLbTNCR3IveTZlU2VL?=
 =?utf-8?B?MDkwWnl4VGRyais0WkExRmZFWFJtWU1Kay9RRHczaTNxaUpDOHVnZWl3NDdr?=
 =?utf-8?B?Y1ZRZmFDSGhtT2JpTUZuMlBmWTZIMFd3eldscW5GVW1wZlVtMlErUjdNSGJY?=
 =?utf-8?B?bUVLZTg2UXdqeS8rc3RLczlLenRmbS9pTUJyOFhySDdmQ3lzZG81aG5YRkR1?=
 =?utf-8?B?U2FMQ2hLSWFCS3g5NmVldXA2UVNFTEh6M1l4RXpTY0FieVg0eHVPckVway85?=
 =?utf-8?B?cStyRkQycDl4L0djazlHWXYvWHZZS09EMzhTd2cwNCtoL2FjZmo1NVJpZnZx?=
 =?utf-8?B?ckxQenhDejJnSVVoSkRwQVhJclg4ZVRMUVdqLzRRaXlQbGFRd29qc3ZlUGJX?=
 =?utf-8?B?K0N2bzhYcVN1dWdUN0J2OTI3clZpb3hjUzhyUUZKNnl0Q01TUENxcFh2TEtT?=
 =?utf-8?Q?++1uOpGcB00T2EowBUS7bJR5mce21dhFodySi+0?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8ed828-9605-4aec-ca89-08d97f30736e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:53:52.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w66qMCTwbl9iO/PhavXZA4UK+2dzhbmdKk+t4jhm7nBi+zratjwnmD2cXZJ0tMVqAoPz1fjDPpSpspoq65ZKXk/RCeA77JM/78G2k/SwgtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8303
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Thu, Sep 23, 2021 at 05:29:51PM -0700, Guenter Roeck napisał(a):
>> If each kind of sensor is a different number space (e.g. 0-2), then
>> how you have it with 2 levels of nodes is appropriate. If you only
>> have one set of channel or input numbers, then they should all have
>> the same parent node. So is it current sensors 0,1,2 and temperature
>> sensors 0,1,2, or just input channels 0,1,2,3,4,5?
>>
>
>Each sensor type has its own number space.
>

But many sensors will have only one type of channels - like several
temperature sensors and nothing else. Like several temperature channels
on a temperature sensor, or several fans on a fan controller.

In such cases, we already define them with 1-level structure, like:
- npcm750-pwm-fan
- aspeed-pwm-tacho
- ina3221

In many cases the channels are "shared" - we have 3 voltage, 3 current and 3
power sensors but in fact they are not separate sensors but 3 channels
each able to measure 3 different things and they may share some common
properties in each channel (so current, voltage and power may be
calculated bases on the same shunt resistor or correction factor). An
example being adi,ltc2992.  In those cases it doesn't make sense to have
two levels as how would you describe the shared parent? Call it generic
"channels"?

So maybe it makes sense to have 2 levels for complex devices that can
measure several independent entities or for devices which do not have a
clear concept of enumerated "channels" or "inputs", but we could skip it
for most others? After all, what is the benefit of having this
additional level if all we have is something like:

temperature-sensors {
     temperature1 {
	};

	temperature2 {
	};

	temperature3 {
	};
};

For most devices having an "index" or "reg" makes much more sense so:
temperature@1, or channel@1 feels like a more natural way to describe
them.

In any case, I'm quite confused right now on what would be the
conclusion of this discussion. How would you like the DT for TMP421 to
look like, after all?

As a side note, should the description of the tmp421 bindings be in
tmp421.yaml file (as it is in current patchset), or should it be
actually called "ti,tmp421.yaml"?

Krzysztof
