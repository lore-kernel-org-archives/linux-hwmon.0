Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65CDC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 18:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE07F60E97
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 18:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235343AbhIGSJm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 14:09:42 -0400
Received: from mail-eopbgr50139.outbound.protection.outlook.com ([40.107.5.139]:43332
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235009AbhIGSJm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 14:09:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/F5MZ2FJdL0jEdzZLjJZk8WTqy7sj9x45ANRsVP3FzDo+5HCsbl5zJP2fBy7NOo0ue7OOoP7iEiE0EzmK9Z2HX54vYACgw+PsWQg8Mvu/tkogwG0Aee0H9wnWyMyIMn7sCHAIz8SoYiOHZ1R2PtpckTxAXaPXqoa2pY9Q1G35+ZcVTUb/2oFr4O0sBK4vKMiSMKAqUCej3RukovbO2leiONQ1nNHNNCNsQaw5M6tFoR3qntIWICRKtQqUBZspmyO+nL8GOtU0TGwiSo9MSgO6IuxLQMdG70kYL1VLqWizHruQjUpMnJXa5u3zhjEj3vTP+UO73RE1TveYjQdGjoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cFJjKrwv3Yxxl9Rt7hxtFT7cEImNLbk11dtx6/3vm6g=;
 b=Sv58MJ0xHor8Qk/B2g8bmR5aRyYtX0xnT50Fs2MLwzx0lS+9ZLTSyIKVZaLBSPZM2RRhrPkUVux6blf0J39tlOX3zdXfCJM1W81beoVBQgwVeQUJubGLCAwkWW2aEWlLWbYR5cu7njLXNdYATAOjA+xW5dBFHq9MS9GdRYsAFnMZS3yjNSeXCvKwF6iUYGuIHsfdegRIOwuDJGYCu1vtQTZyxtx75knj6Y4sIXn1vZ+yNCo9jngRtbcnfpWkjVCwi7HFkE+ah/cLVIfYKCI32E6JjIMBcbiOaalrHsReEQIsrzSzUoGJe2sHkgiWnD94XbeaSSUQDP+pzcZzZG7jfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFJjKrwv3Yxxl9Rt7hxtFT7cEImNLbk11dtx6/3vm6g=;
 b=dufdpxsPWkYyDXpVc/bXq8OqSJ7Yz18A1WhXKNgWGct0x0n/F2nhkVhAQE74iHSu/KKcmN8SXOw5qK1eRUgTutfLpcs+dcI7QoioWvb0s1kjnONJO6PJhF3mo35i7KXyHvLo+sBdxXR4XM7bWsLVj/sUi3O8/DdwODJshIDGoTc=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8178.eurprd07.prod.outlook.com (2603:10a6:10:273::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.7; Tue, 7 Sep
 2021 18:08:33 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 18:08:33 +0000
Date:   Tue, 7 Sep 2021 20:08:28 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/8] hwmon: (tmp421) add support for defining labels from
 DT
Message-ID: <YTeqnEWPzic7Hk7L@localhost.localdomain>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <22639314543a98b4c24e55b7e5a803325ad9e568.1631021349.git.krzysztof.adamski@nokia.com>
 <30814a02-10f1-2590-26a5-b3f6ff367be1@roeck-us.net>
 <YTemMLjCVMsbteOm@localhost.localdomain>
 <20210907175552.GA235361@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210907175552.GA235361@roeck-us.net>
X-ClientProxiedBy: HE1P18901CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::22) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 18:08:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7236f660-3222-4d13-7c57-08d9722a8127
X-MS-TrafficTypeDiagnostic: DU2PR07MB8178:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8178F7CD41B78518F8D37366EFD39@DU2PR07MB8178.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLPHr9dexxM9xyr4iXmIv5clUtyi3eSmcWL1uTlEGyurDMKnlsTIZeVLvNFKNGiQrqSpK3cPiYU8zL0VVngvJiWN0VQdBNMBfCkf9PUsFpBnBiSc0SXc2G8hPmGqADYKaLEHRTGq1qW0xvwxmmgzMEJRzZJQ+opvAHRSDLmqQQphSU2Z2Q/iOS892SoHcxdO0vSImtBdVTeEzVWUFfFuy/PPbBWgJUSokbrXrSalsrwD6PW4diQCaUWp4r9KDvysZfZIRqrRi36wnTAyVgFeDGPyYipINhgvaBTXrZ5QtFs8cgiuC7A2H9D1QXxzWCzQN+HxNR+a4fVlnSwMmqeoEg+6Fk80UmuHk4QBQYDUmQIuAdHqexVbBsSQ+OkCwxQq5h2UzYNop+alghu/kLWxNmSE2z5HbkH6FzjNuYxoI/LWTXTQJNxz1ooADkRmDP5K8DQEkKMvH0AImfaz9JDl5MFTrv/I55fqvPd41BpoJ+ipccJ7gcLoIVZzWry3BZoV8HRQmImRzOM/ObFJwzugE4LcCaCRmYHlt0xO4EwFQ3bbAngeOk7GAa76LbeNKRoUxXSs8B3t2l/X5JQOaeZQs2BnD+vBqU++vlbL7lKklowXqOBf6mblbb6B4hXaacB3DuCsHQIruef7+m/6u8lTUtU2WsOIPQ2cFBNDTKMeE0ndTBQXVS5H6UAYfefJiwgwZ4fywEFvRupatlPXm6pmrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(9686003)(44832011)(66476007)(52116002)(5660300002)(7696005)(6916009)(26005)(478600001)(6506007)(86362001)(186003)(8676002)(6666004)(38100700002)(38350700002)(54906003)(66556008)(316002)(83380400001)(66946007)(956004)(4326008)(2906002)(8936002)(55016002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFWeDgwTTFSNEhJL0QyYUhCTzZOTWc2cDlVTVYrZlFzNU16OUFXSTExZnVI?=
 =?utf-8?B?MGI4cXArR3JsL1JIUUZxTDdFb1lPSC8rTXlrRTYraHVWeTBUVWFMWjZJRDFE?=
 =?utf-8?B?ZGVoZzZZNFZGektkTmwrS1VVc2lqNUdWYy9UN3R3SFM3dW9yYzRpSzV5UWll?=
 =?utf-8?B?Vk45cFRkTlJnYmNGYzlMY0hVeUsveFM2Lyt0UkxMaUFyUEVhM0RqUWl1WEFw?=
 =?utf-8?B?cXJmRjB2dVpONzNubEdCK1AydjlNa0cwcU9MRGNBUVd4emRTbTJvemlid29D?=
 =?utf-8?B?Y1Rrd0R6Y1YwTEs0OXluc0RiakNLMngyZ1cwY0RsQllXeW9GbzMvTDJUVEd5?=
 =?utf-8?B?endCVUZIcHc1MUVHT0cwUjdZTGlIR1ZQeHBpQVJlaklmRDNVbDFmMTlTaGxF?=
 =?utf-8?B?U3V0Z2l4blh1aGRmWXYvTEpNMlVjQlBLemtSSkNReHFYNFNEYnN2QWQ3MCsx?=
 =?utf-8?B?QlRNK01xdzU4bmt2REFQMWpUN3FDSmo1M1VTL2pJSy9xV3YyVnlkWjUrRFAz?=
 =?utf-8?B?a3dXaGNOSks3MTNMTWR6Q25US1hxR2dPRkFDVm56ZjBUUmppUDVVeHFRUEhI?=
 =?utf-8?B?OWUyd3dvS3lLMUN5Y3dTQ240RW0xOEtUdmV1dWcyeHNUd2R6bHhmbTNtS1po?=
 =?utf-8?B?Nll3bmpFcTc4NVdLMTZxdTJWQnBEYmU3Yys2dXNGVmRZdTZGbXhTbVRjKzBp?=
 =?utf-8?B?VmZQczVPYWRBOWdUZXRaOXdYRWZYNUZOVkJSRWV4SjFBWGRxUVovU2NhMHpT?=
 =?utf-8?B?UzYvQ2E5L0FXMEtIVDBXVjdOT3Nic21sb1J4eHlrMWpoOFJ4K1JCSXl1aU8x?=
 =?utf-8?B?VTJDKzVMQU4veU82d0Mrelkvd2hQeFZPZTNyd3RSY1JXZWp4TkdnMEtRbnhs?=
 =?utf-8?B?UnY0V0VmeXZKVHl1blc3eHE3M0gxcndncDJjWDR1cksybFBwaG9lK25yQTBp?=
 =?utf-8?B?MFVEaXhoYlpjRk4yK0NrY3hJV3ZNeWU3K2Fwc3dIejlXUjRaVi8yUEZYMGV4?=
 =?utf-8?B?V0hzUmtWZTN2dExuOEVIa2ovN0hGajBRM3lrZXhHWXR2cXMvN2hJUEczNkNl?=
 =?utf-8?B?NkgvM0NmRjZwV0taVVhHYTkzMkRZbVRTdXFwRlYzNHRzVElvQVFnMVBTdXFW?=
 =?utf-8?B?b3VuYmJOMmZPUko3QnJkUENJbmtIcGpUeUo5blVRSkUzSFR5MXRKTzZITTRy?=
 =?utf-8?B?cWgzMzRNM1poakRtYnJWSXVBeVoyN3pMZjhhQXQyNnMyZDNwUFpBc2JMTGJx?=
 =?utf-8?B?L0hWR3BqVks2TUpOUzhBY044WkFlWGdSVWtSVWFOTnVlODZzM2EvdkFQa2lq?=
 =?utf-8?B?RFVaYUt4R3lSN0lUYVNVaUFiajdOWnA3TkRqQnFkVnRmeEVJMUtzMWh6WXZL?=
 =?utf-8?B?VUh5VDhUb0pQVmZBNEpyaUN1R3NpbkZIZ1dzQXkvNzB4ZDBEOEZ2UEYwZ0Ez?=
 =?utf-8?B?N3FSaTg4MEdtdkR2Q0RvU05UOVNrby9VSWFEU0xMY1c5dUNSVlZhRk1zcEFL?=
 =?utf-8?B?R1Z3SFVIQSttMkVOeko0cmdlUGFmS1gvclhmQlBIYlpPVjU3RHVtd3VWU25p?=
 =?utf-8?B?S2hzYnBwRHc0Qk83aGV1QWxUdkM4aWtrNEVXNGtiSG1TMnVBbUNuQVFvUGdz?=
 =?utf-8?B?T1hISVFsUWtiRWVtNVRnQVB4OHJqeS9McjRic0JBWVhmVjk1VnREMHZnM2V1?=
 =?utf-8?B?VGJyYnVQUFUrTTFqejZDQWNSRG9XR2FuQzZMSHZVWXBpUHVmVDZYT2lxaG9Z?=
 =?utf-8?Q?RC0oIf1krb4a/o8UMdNLiGhYcZVsOaj8c+aMc8P?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7236f660-3222-4d13-7c57-08d9722a8127
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 18:08:33.1384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGkUq6i9mu91SU4OvG0vPaxpQUQ/ESOipuRRaGtBinZyb6zSt/TUcjAA55kmacy1+jSeJ6vwpstIrdw7OeGEJwHVPiRSgsbqTFJ2pRLz0Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8178
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Tue, Sep 07, 2021 at 10:55:52AM -0700, Guenter Roeck napisał(a):
>On Tue, Sep 07, 2021 at 07:49:36PM +0200, Krzysztof Adamski wrote:
>> Dnia Tue, Sep 07, 2021 at 08:46:22AM -0700, Guenter Roeck napisał(a):
>> > > +void tmp421_probe_child_from_dt(struct i2c_client *client,
>> > > +				struct device_node *child,
>> > > +				struct tmp421_data *data)
>> > > +
>> > > +{
>> > > +	struct device *dev = &client->dev;
>> > > +	u32 i;
>> > > +	int err;
>> > > +
>> > > +	err = of_property_read_u32(child, "reg", &i);
>> > > +	if (err) {
>> > > +		dev_err(dev, "missing reg property of %pOFn\n", child);
>> > > +		return;
>> >
>> > Report to caller
>> >
>>
>> My idea was to make those errors in DT non-critical. I.e. if one of the
>> child nodes is not well structured, I just skip it but continue the
>> probing. Do you think it should be considered critical and I should
>> abort the whole probe function as soon as I detect such DT errors,
>> instead?
>>
>Yes, I do think so. Otherwise people will just generate bad DT files and
>never fix them or even on purpose ignore the error messages. I don't want
>to see such messages in a production system.
>
>On a side note, I do not accept dev_err/pr_err if the error is ignored.
>Either it is an error, or it isn't.

Makes sense - if it's an error, it should be reported as such, otherwise
it's just a warning.
I'll change the code to fail on DT errors in v2.

Thank you,
Krzysztof
