Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D324CC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Sep 2021 18:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF033611C9
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Sep 2021 18:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbhIVSdm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Sep 2021 14:33:42 -0400
Received: from mail-eopbgr60091.outbound.protection.outlook.com ([40.107.6.91]:3758
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232806AbhIVSdl (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Sep 2021 14:33:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpCdzfXzxknjfBLD8AQ2JJeq1BcR8fji4ZoqKmDii/lyBj7fBO5HpOHD+Yjg/r0OKh/q9j2yqNhi/JFIzNAAg8fs8gL8Mk5RVEgSJNi5oKRzKNkBuNqm+B1+zM8tm6P9Cfec6fdjxK1A+OYu1ZLLmDrpxAATGx+weFpJ7y/r2gRJT90iFcdGzJOOrHn0oURg9k3EGwNzmHUvZ8UsfJA5K9TV9/gsPtFKa4PzxNFikmWLCm/WXunT5miSiJfSFAnyVZ9AWrj1EXhZ5oH/EwVohIMKTW3QQCn5IQ29TucmbOF/zOXKlPvmOA/EZmWWbv7jJhQLb1gQ+RzpkXoNXNr6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WVDWUdUr2MHe1ZKqN4rpPYYYe1dcbyz5JmAWmNerIRU=;
 b=nghaT1FyyMcK1Et0qboInL9aURajW7isN4naTz8Ss9IBCb4EMmDarvf89zli5u9a5JMOrNuPna4qfcz2ZBrKV9xBLMiQzB2VZfy/lbif7qIufT5hsYx1BBaHbWwcrAQ2ExKQfjGLkyaWlde5a/YsG59grF2R5HGdOfFjgWdBdH6c/jrMjKaPFUHjleoNOfXMVPAEXphkNoYFZqmt9jhs4S8CX6grOdbZtR6XdIqB5lZCIcjXYbFw74b/Oi0Of74VTIXjNk/g9b2Hzi3EtOoWF7sD7G0KUxSGfKt4kzt8KEORcjMjDLvo14dvbs725pHtSdiY6vla1seSCiJbxrzSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVDWUdUr2MHe1ZKqN4rpPYYYe1dcbyz5JmAWmNerIRU=;
 b=KipuUiobzNm/vF3uQcUg5U4CFSEqdGrMxH1aUpAq+KbqC4K6j06EdifLep3oUl8/DckWs25NoLUmbKKW4XB8EXHkw9+BBjx4PwyZlBGwqVXBr5hmvRl6/w8pdUiX6JX77adpkHkd+Lz457/Vrh4pNrJY1bTO5+rpxIfJfY1y/yc=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8077.eurprd07.prod.outlook.com (2603:10a6:10:2b6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.11; Wed, 22 Sep
 2021 18:32:09 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Wed, 22 Sep 2021
 18:32:09 +0000
Date:   Wed, 22 Sep 2021 20:32:00 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Oskar Senft <osk@google.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <YUt2oD6sUKYvZLDB@localhost.localdomain>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
 <20210921125831.GB1864238@roeck-us.net>
 <YUrRd3kTyLoCkLAt@localhost.localdomain>
 <20210922123926.GB3201379@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210922123926.GB3201379@roeck-us.net>
X-ClientProxiedBy: HE1PR0701CA0077.eurprd07.prod.outlook.com
 (2603:10a6:3:64::21) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.21) by HE1PR0701CA0077.eurprd07.prod.outlook.com (2603:10a6:3:64::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend Transport; Wed, 22 Sep 2021 18:32:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d9ab4b7-77c3-468e-5493-08d97df74909
X-MS-TrafficTypeDiagnostic: DU2PR07MB8077:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8077D8F04962FB3A2EA4D009EFA29@DU2PR07MB8077.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JkJA4vRZ1P6pmDUAKQgPR4OldjoyvQZnGC/njJohzTdiyq93nqRVeqpZA8cK5lq09L2dlyDpPyu7O1lgrvUN56zqsWvvM1+UxwJDi57fTY658Q0stvwFImit3pVnOHV1bCRQFOKBNsoeEMtjdVYdQ2A6ubsQgFmeBU0xvE4SYYxpXUnNH80JPwdK/VK5kEl0dhiz5UatybHR7IusNo4Lq3DvtgOD7PK9X2m6i5V9wrCwxmSTmaQ+LC4x+GTaOFpGLFikDvJ8dq5UKIFQSKKW44C/8VGYwEN6dDHuYdEyGDYu+i7chsQjr6ENPqGeI3sz7qdTe5yJxBWZEshxnavP7s8BFX6z4/NMaYZWXBUgw1q6eDSMv71yjBCzN2FblyOB84YXFuPRnIAGxuo+67LkqKmITdJ6fLW/5hSLz36ktkhCDikcwVnSbmeqEbk+gTVacy59RFexW9oR9UVdrf7Bj9SSueTsqeNGwMM6KIOrIfvhaP5H+c5DhAFzu3YbL9H5aWUOG8ZXgR7REymCCncGRyATriTVi2CmNXht/rPTnX1PzGI5EaplcNIvqHcK7LQLzmv0LKYr6qIvlZVAiqOP623rDonj0IYjfOgYi2c9fu08/E9plGCOtbj4yUqW0INQtb5J5/Fv6iSCS8ZL7LZJF7aVGy8fx5UEKNDGWJ6+U8r3hGikMkUZfiuR1vCTTskEoyeLdXlsm/rNGp6djWX0fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(66946007)(44832011)(6506007)(66476007)(52116002)(508600001)(8936002)(66556008)(186003)(4326008)(316002)(2906002)(5660300002)(9686003)(8676002)(6916009)(86362001)(38350700002)(38100700002)(6666004)(54906003)(956004)(26005)(83380400001)(55016002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFKTVErOFJFTCsweGZ2K2Y3NUVJT1ozNnB1SDJpZ2RZZXFxOEx6MFh6Z2dB?=
 =?utf-8?B?S1dqRmVNNzNJVDhTelEyVUUva0hGV3pwcE5WcXlVYkRRaFdHbmU5cy9EZFR5?=
 =?utf-8?B?R1JGWWRTSkZwUXBINUhIMk02L255SEdTUjBveEtwSlRGajVXY1BMMFp4dWhY?=
 =?utf-8?B?SHM3TVBrMmp2ZUVRejVHeXhMVUlKQmJwWnZXM3dtZ1JXWlZXU0hybWZ1M1Ni?=
 =?utf-8?B?UzFwOXpyQjdUR3p1eko1VEV6bFN0RDROK1JIUU02Z0g3YzJ1c3RQMGRBamtm?=
 =?utf-8?B?VEVVdHRxY3lDa3E3UUwyVzdEQUpmbWlKTlZkc0hXaFFSOXRvY2RPdy9IbTZC?=
 =?utf-8?B?d0I3bGxhSVhwVkFQbU5LOXYwRGkxV1BRR213STlYQTJ1enpQTEY5V3NSWEYy?=
 =?utf-8?B?MEwzTTBVdVRnbmtVR1YzVXZ5ZUpUWnNhNHNoWGJWazJucTNwM2Q3eWNva1Ew?=
 =?utf-8?B?VkQyeVB6bDlNOW5rYnhnODNoUDRua0V6M1oydzVXSk5yNld3dTQ2eGFiblpt?=
 =?utf-8?B?Nmcwd3BiNHVId1d2cTFiSEtOVnROUWUvSWpWaHowOERsbTFMMEdDVHNqTURC?=
 =?utf-8?B?blFxZ2MweXNTeHRNb0lWQ1RrZlFZUTlEakVtcDdualJwT0FyZ3BSMzVLTHNh?=
 =?utf-8?B?S3p5RGRCbnFNd1hkRURqZ1NOR2MrVE1rRSthMUlsLzdnS0pQZUtvSC84NGs4?=
 =?utf-8?B?Qi9CUjR1TnRPQVBoWUhOTVFibEVQeUZSNC9pOHJSK0pqQUlycEI2aVUzKy9t?=
 =?utf-8?B?NG93czZQRGN5My9aTWU0c09NTk5SYVlsS0w1SUEyT3RsSmNjcklKSEp5ZUFq?=
 =?utf-8?B?bVVWa3RBa2luRFozL1piWllwek9iQmZZcCt5U2wyUkFLM3pDQm0xR0VzU3ZG?=
 =?utf-8?B?MG54N0VRS1VHeEZXVFkzWmdiRG9zUDJoQ3NXTjBQYUFuYzkzK1JKT202VURL?=
 =?utf-8?B?bzQrYWU1UzREUHhzQXdkeDBZdHNKbWpZNkgvdUdpV0tseEdCdURnYlVaZ2NO?=
 =?utf-8?B?ZWZhdThtNWdvb1JYTXlBV2Q2TFJrajBlTWlqS2lnOW10Tk9CYW84QWROT0Jk?=
 =?utf-8?B?U1gwT21uemt6RG8wbFloeUVuK2htd0xOL3ZIMlI2SjlvMzlnRkR6VE42UmZy?=
 =?utf-8?B?dTA2UVN2RUpORytWR2g1d094NUVaVzJhNU5uMEdtMDU0eUFkenZGK0x0MURu?=
 =?utf-8?B?N0NkTnE1UkwxK1krVTdRSU5rb3hnOWJCR2l3NTMvRzZkSnNkdGZaZmY5ZnNT?=
 =?utf-8?B?NHhPeHdnS3hHTWZuc1lJaUlsVzBJbkdTdDFqRkZPVG9sZmRsREltejgyUE5P?=
 =?utf-8?B?V0s0MTlFV28zTGdpSS9WWmlaTWIxZUJiV2tGbkNseTRua3ZMSklva3F5YzlP?=
 =?utf-8?B?VkIwM1RkUHZZRkcvQW5lS25OODlJZmVyTFhzUEJyaFh2QkQrN0ZaM3p4elJH?=
 =?utf-8?B?bGlhMzNWVFJPUk1jSXhOODV1Tnl4WEFsR3BpanZCUExqZGhucWpHaTJYL1Zz?=
 =?utf-8?B?bFAxQVIwRW93UGw0aXNyY2NWQlQyYUdrOFlUMEg0UFZnYTRMSyt3dXJham11?=
 =?utf-8?B?SERsejB5V2hKWkRHMUl4OUtnZHgwd1lWR2xUM0dkTGJXaWpjUE5VNHk2MkV4?=
 =?utf-8?B?ZkpYYVBjTDBjSElxMlR6d0ZXK2k5ckVUeFNFOEVqdDROSWl6aTlEZjVqKzFG?=
 =?utf-8?B?OUc4V2E0K2JEeXNncnVtZ3Qxc01oclVTTkZLNndJbnlPemtCWmV2MmQzRGZG?=
 =?utf-8?Q?v72bQCZA/q1OO0sjn+WoRJbsRVhQQhQ/QrDzG9p?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9ab4b7-77c3-468e-5493-08d97df74909
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 18:32:09.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfeRxJdaCXJs0/u093VVyd4k67MkUOEsGw5VxmPO0yLFxrJeSQdchJBbIcQgUNutVP7KtmAZOF0fnHrwA456IsRPtD0SqiV5KUhoy0t2Bs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8077
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Wed, Sep 22, 2021 at 05:39:26AM -0700, Guenter Roeck napisał(a):
>On Wed, Sep 22, 2021 at 09:22:33AM +0200, Krzysztof Adamski wrote:
>> Dnia Tue, Sep 21, 2021 at 05:58:31AM -0700, Guenter Roeck napisał(a):
>> > >
>> > > ti,n-factor
>> >
>> > n-factor isn't just supported by TI sensors, though it isn't always called
>> > n-factor. Maxim (eg MAX6581) uses the term "ideality factor", though they
>> > also refer to the factor as "N" in the datasheet.
>> >
>> > So question is if we make this ti,n-factor and maxim,n-factor, or if we make
>> > it generic and define some kind of generic units. Thoughts ? My personal
>> > preference would be a generic definition, but is not a strong preference.
>>
>> That was exactly my way of thinking here - many sensors have n-factor
>> parameter and this is the name I see most often.
>>
>> That being said, maybe it should be "nfactor" instead of "n-factor", as
>> this is what tmp513 is using?
>>
>> > In regard to units, the n-factor is, as the name says, a factor. Default
>> > value is 1.008. The value range for MAX6581 is 0.999 to 1.030. For TMP421
>> > it is 0.706542 to 1.747977. So the scondary question is if the value
>> > written should be the register value (as proposed here) or the absolute
>> > factor (eg in micro-units).
>>
>> Since expressing the fractional values in DT isn't well supported and
>> (at least here) hardware guys like to think in terms of register values
>> so this is what I proposed. Also, I just noticed that, for example,
>> TMP531 is using register values as well.
>>
>
>I never see "someone else does that" as valid argument.

It is not an argument for "so I should be allowed too" but more like "so
it is generic enough to make sense for more than a single case" :)

> Also, DT does support fractional values, via units. It is perfectly
> valid to describe a voltage as micro-volt, for example.

True. But doing so for unit-less values isn't as obvious. For real
fractions we don't even know what the resolution should be and then we
also may have those rounding errors etc (while with register values we
know precisely what we get). As usual, we have some pros and
cons of both approaches. While I agree raw values are not perfect, I
still think it makes more sense so I vote for them. But my vote,
obviously, isn't that important here so I'll let you guys decide.

>If the agreement is to use raw register values, I think the property name
>should be prefixed with the vendor name, since it won't be a standard
>property. I'll defer on Rob for that, though.

Fair enough. If we go that route, we should use "ti,nfactor" (without
dash) to be consistent with ti513?

Krzysztof
