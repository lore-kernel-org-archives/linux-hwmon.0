Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B81C4338F
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Aug 2021 08:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4AD961057
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Aug 2021 08:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbhHBIEm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 Aug 2021 04:04:42 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:10384 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232537AbhHBIEl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 2 Aug 2021 04:04:41 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17280anf009348;
        Mon, 2 Aug 2021 04:04:16 -0400
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
        by mx0a-00128a01.pphosted.com with ESMTP id 3a5kshbgg5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Aug 2021 04:04:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WljmJFhGKMSS3l8wdDyAffk8BoYDCIgJuKq7wFUl9ZrPM/Sq5VeHAKhisrDKY19cuCBQNVnDmF1C8ujUctOKaOYr8gAVPaYhSYhq8l79LvJBjS4zOx9ABleokbtlrNQMXo6DTZaTM4M8ho6gzGXRIgU+OaakwRYKk2/HmTCQk402KVfQQFQNWsOT1g2co3qlWpZaSn3rCH6kKR+JrYh/ir9mJPiVCTYHK/a1fBl0neEQlTT5RwsCkzeuVTKpcVRD9cEoN+df0RovAB0drJa4IB4LKfk9+W0kLH6aLiQgKRVRN//vIs3fu4pZPBW18SYffdDESOzpK3kOXtJS9wD8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRAUepezF9mS/6+DCkM3f5cDtUTrTPxfyKqUp7mXKHQ=;
 b=gSfVcNEPpZ25Xac1gpOAF7jQMoQFYr6qmckU/j92P0QE2hpuqDItgEi+PViuOHhGiD4f59kEHis37cUkheVfg30e3U+bwpgB5n34slhyEXBecXFJa8gewlxldAB2rtzEvZncEdmvUYTMHgjBG40gZWcS8pgqN/YRiDQYWY0ducU3qvrddnQK1v6ayr38KrheylJqldUGPNefSX5othUUTSq2sjgnK4C9QqZKu8hWc/WOsNEzzww0bxJpJhVZMnOp6J0zPqPqcocQuAhTjP/A5SXEIPO21ZlYwH4t6He7V5fv31lm2avHFvd6wzypB/EKR+MWIagHa+9Wdyl1S02M+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRAUepezF9mS/6+DCkM3f5cDtUTrTPxfyKqUp7mXKHQ=;
 b=i7dnDgWkfAzTMWmFNuhlh7qDe7ot+cKGK+qMULJDwswE6FSLXWoJGgGgpYdhnAvERAgR3/xbrrguX0CGxxctXf8FZKSaSrZ+EEai6/KqmeKDB7RdmZddCtpfe4xgMQE8Soj+/1uzYqP9KRhRm+zO2z/lfJPlgJ5EDvRmXltEbn0=
Received: from PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 by PH0PR03MB6281.namprd03.prod.outlook.com (2603:10b6:510:ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Mon, 2 Aug
 2021 08:04:14 +0000
Received: from PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca]) by PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca%4]) with mapi id 15.20.4352.030; Mon, 2 Aug 2021
 08:04:14 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>
Subject: RE: [RFC PATCH 0/6] AXI FAN new features and improvements
Thread-Topic: [RFC PATCH 0/6] AXI FAN new features and improvements
Thread-Index: AQHXc/DVxLPZKDI5NEGd7KfkUZYeSatWmeWQgAI9pYCAByo5cA==
Date:   Mon, 2 Aug 2021 08:04:14 +0000
Message-ID: <PH0PR03MB63662A8C2EF6784B4DFBC6F499EF9@PH0PR03MB6366.namprd03.prod.outlook.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <PH0PR03MB6366CDE5F062E14F7A8E943F99E99@PH0PR03MB6366.namprd03.prod.outlook.com>
 <bcb1160d-adba-53e3-11d9-f93aac1e9137@roeck-us.net>
In-Reply-To: <bcb1160d-adba-53e3-11d9-f93aac1e9137@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE16aGxZak01WXpNdFpqTTJPQzB4TVdWaUxUaGlOemt0Wm1NM056YzBNakZt?=
 =?utf-8?B?WTJGbFhHRnRaUzEwWlhOMFhETTRaV0l6T1dNMUxXWXpOamd0TVRGbFlpMDRZ?=
 =?utf-8?B?amM1TFdaak56YzNOREl4Wm1OaFpXSnZaSGt1ZEhoMElpQnplajBpTXpjeE55?=
 =?utf-8?B?SWdkRDBpTVRNeU56SXpOalV3TlRNeU1UZzJNakkxSWlCb1BTSnlaMVp1ZWxW?=
 =?utf-8?B?RVUyNWpTMlF3VlZONlFWWkxXblpTVUdSVmJVMDlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZKV1VSQlFVSjRiVVZRTjJSSlpsaEJVMUpLWTBWRmNqZ3phekJLUld4M1VW?=
 =?utf-8?B?TjJlbVZVVVVaQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
 =?utf-8?B?QlFVRkJWMEYzUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZC?=
 =?utf-8?B?VVVGQ1FVRkJRVUpQV1VkalowRkJRVUZCUVVGQlFVRkJRVUZCUVVvMFFVRkJR?=
 =?utf-8?B?bWhCUjFGQllWRkNaa0ZJVFVGYVVVSnFRVWhWUVdOblFteEJSamhCWTBGQ2VV?=
 =?utf-8?B?RkhPRUZoWjBKc1FVZE5RV1JCUW5wQlJqaEJXbWRDYUVGSGQwRmpkMEpzUVVZ?=
 =?utf-8?B?NFFWcG5RblpCU0UxQllWRkNNRUZIYTBGa1owSnNRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVGQlFVRkJRV2RCUVVG?=
 =?utf-8?B?QlFVRnVaMEZCUVVkRlFWcEJRbkJCUmpoQlkzZENiRUZIVFVGa1VVSjVRVWRW?=
 =?utf-8?B?UVZoM1FuZEJTRWxCWW5kQ2NVRkhWVUZaZDBJd1FVaE5RVmgzUWpCQlIydEJX?=
 =?utf-8?B?bEZDZVVGRVJVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCVVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVOQlFVRkJRVUZEWlVGQlFVRlpVVUpyUVVkclFWaDNRbnBCUjFWQldY?=
 =?utf-8?B?ZENNVUZJU1VGYVVVSm1RVWhCUVdOblFuWkJSMjlCV2xGQ2FrRklVVUZqZDBK?=
 =?utf-8?B?bVFVaFJRV0ZSUW14QlNFbEJUV2RCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlNqUkJRVUZDYUVGSVNVRmhVVUpv?=
 =?utf-8?B?UVVZNFFWcEJRbkJCUjAxQlpFRkNjRUZIT0VGaVowSm9RVWhKUVdWUlFtWkJT?=
 =?utf-8?B?RkZCWVZGQ2JFRklTVUZOVVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBGQlFVRkJRVzVuUVVGQlIw?=
 =?utf-8?B?VkJZMmRDY0VGSFJVRllkMEpyUVVkclFWbDNRakJCUjJ0QlluZENkVUZIUlVG?=
 =?utf-8?B?alowSTFRVVk0UVdSQlFuQkJSMVZCWTJkQmVVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJRVUZCUVVGQlEwRkJRVUZC?=
 =?utf-8?B?UVVFOUlpOCtQQzl0WlhSaFBnPT0=?=
x-dg-rorf: true
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4492ec26-df5a-47ee-83f9-08d9558c1e88
x-ms-traffictypediagnostic: PH0PR03MB6281:
x-microsoft-antispam-prvs: <PH0PR03MB628139031F6954C6808811AF99EF9@PH0PR03MB6281.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 58/h22387KTT4xMJAjVQwVO8LsaEQSVUr1sT6R+igXeoWgFYj9gzbQr4iAdOheifohGcksfXpETqp2yjqAqlt4+8VzLThzwDEYI+1EmZ2Wz3DqPZhaWwL/5GVPVSapiQHMGLJlHoO6UL7/wuuQ0OoALetmOdEaRmoxodHfFtE5ibIEPvRWUuUSiPHXGti+wVL4Hy2BooGV39Bg6AJWl5GrVtzzpMmPqMmpcFYLinIE03N5MpYAn0p5Cx/fsv/TqQueMAmxXk97MnSxJxO0u7bZpFKXR2Ns41QAEa4blQ2IAIwl/icZ/I0t4gWlADRmWIYYTPTFAZ88iu8Gi5UTG8DZSb5DwlMwBhXEJe7nh8MdY4juCSVNYiv8hjxcTQmOJouM3UPp0VxxgyH5zq6Ve6zVhn7HQd9I0uEcqkQNwu7EZiIJ2vzJHiQB7trHu7FWVDRtRHJbQA5SV8x/5PpEXJxc8Te5GsGc+zRV8LIA8eamHeTjGg8o07rXIa0TNoLs6jfNhV5AeFNiNH/w95niWf4/V/GDVsTR3IPIR9+BvS0768CV7wkxJuqfwIN/qxaVSvIlbcvb93FXJ0UnvLVQ25xZFt/NLM4vmp3znzsM1tJi+S8Uaqsobl3mM03NgdIFMgZtoBLjUYkFjM7OP+q0tXWZSlZUPYw5bPfy17f3AcI8+mDrcuKFTLPkjsMNpLWUCX8Ezf4HVAuC18epuWZd/OdU0YOh5im4LL/5xpgwgWpnyJAS1VpzaU2HnMoiso5e6pnY+Pw9Abs9DPEEK+e92D6+wWMM7Dg7EC896ff+xBWtmuT+QJtLiS4cGBpB+qRs9k07HnD1DL92sivfyWBJQokA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6366.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(8676002)(5660300002)(38070700005)(966005)(8936002)(83380400001)(9686003)(316002)(478600001)(55016002)(54906003)(2906002)(122000001)(110136005)(38100700002)(6506007)(71200400001)(4326008)(52536014)(7696005)(53546011)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(186003)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUpuSndtZldId0tZNW51L2pkSlNQR29FMWFpZFVBMHNSVXRDZGo1YWIxTnph?=
 =?utf-8?B?QkpTMHFQMG9zOEpUdkhTVmhwQXRBWVBlZWpEQm9mdnc1MG52eHlZZEhXbXIv?=
 =?utf-8?B?Qi9LY08xYkV6QmZPZW9iRzRQaHhnVmJsdWZuS2g2UllOenpUWXVIeVl1Y1BE?=
 =?utf-8?B?QnNFbk4ySlhFems3ZW0zZ1UyQ2dmeDNNaWZhNXVBV0xSTTlwa3BzaHFrb2Zw?=
 =?utf-8?B?TDVWT20zb0hGNGY2VTJEMjRVTFpJY010REJuRkYzNVAzT1BsaGhJSCtRaEg3?=
 =?utf-8?B?dStmQVpFcDFETFlPT1MrOGVUamJWWThpc2Z1c3lFMnBtNkQ0eVJ6ZWtyYlBE?=
 =?utf-8?B?T01YNWsvVFIrK0dPU2lOZ0RHNllxU1NvYy9sQ1BWNVl2TCt5QmEvc0VPUzBH?=
 =?utf-8?B?MjVzbDlQaEZXOEpkNXRnOWhyaE5zZVNTbWdPNzRYTlZoZ1hmNzNDRmlMbmQ0?=
 =?utf-8?B?dHNjT2p5cFRIejFtdFo1MUdjbXRhdFp4blFGaEMrcGt3alhPVTEvL1NJaDc0?=
 =?utf-8?B?OXYxRXdMbGNEeHlIZXBZMzVCQngzSHA2bjJsSVFvNUxQVDh5ZzMyTWs4YnJx?=
 =?utf-8?B?TTZ2Uzl0VmNNMWk0alhqN0kvYmVBL0NqUTNuK1d5QW1NZ3FZTEdxWEtkaUFR?=
 =?utf-8?B?OEZtRlRiYnludFdoK244OVcvZ2FRRmZnZ1psZjRtZFNiZ0xYcFhLZkVGd0NZ?=
 =?utf-8?B?ZS8vMEpzRkRMbXFkUituc2tNdURrNjQvODJobFNTY3pLaWJRaXdTNHV5N2Q2?=
 =?utf-8?B?TUFxMGVPbU1obHVKVmlRYlg1SktjQnArbGJwZWVsUXUzZFhnUXl5eGlaV0di?=
 =?utf-8?B?bXpTcEgrbElFSVlGTm1XUmhJM2FsV20zYm16N1RZeVBNeWJnRGZZdHl6M0dS?=
 =?utf-8?B?UmhWQnFMOS9jTlBGc1Y3clp0M0NoOTlsOGY3Y1hGR3JoNCtqZGVVQ3c1c3Zy?=
 =?utf-8?B?YkZTWXl2emVMVnB1VmhHVlZhTG02VWN0UVJpaHpyZTJ3QTM3S2s1eXhSWG9O?=
 =?utf-8?B?TElnV0hsdWRVcWhkblZ3ODE1cUg3L3MreEErV0VEN1R1OWIwM2NMOFlCOEpO?=
 =?utf-8?B?YUI2cFRHSVZoUWE4QktOcTh0elkvNkxKSjU2a0lMc0tweWp2amlHUUZyMEIw?=
 =?utf-8?B?TlZuQk0yWUFMeUx3RHVwVVdIRWU5R1J6K2ZmV1R3OE1QSllFNDBzaU93NnpU?=
 =?utf-8?B?L3NyNWdHMFVGM0tVOUpYOHB0K2xkeVpkQnh4NmVYK3lsMWdqTTFWSVBFT2Jh?=
 =?utf-8?B?M0g1NFQrangwYndURFN4WSs3eWVDS29MZTN6bnQwM1c2Mmw1MXBkQWIzd2pS?=
 =?utf-8?B?TnJYbHRKUHE2dEFDVTVkWkNEZzdhMGQ3WHp3WTRONFczRGx5WGFmTmVjYmEy?=
 =?utf-8?B?SzFOb2M3Qm84MUJFVG9nd1pOT0JtK1RxTjRWejZZb0lWQTVsR1l6VW41aDVw?=
 =?utf-8?B?eTRvZVhjV1JCUUFIQ0poNyt0cktBd3BNZVZ0U24yRnpYSGZVaUdnUjl3anpm?=
 =?utf-8?B?YVJGRjJCaFRJS0VQb1V2OVptWE1mMkIyQWV4cjMvUkdCbmlReldxMGYzQUls?=
 =?utf-8?B?RkhKYzJaSE5OS2p6UXJHUlNrUTJVeHJ0WjBFbzJpRUxIRGpFSURYWlVjZGNm?=
 =?utf-8?B?NHBoZlEyYWRnUHJFQU9UVjhERXJUQXU5ZWk0eEJjNW82K0xqWmJSUUo5Y0JY?=
 =?utf-8?B?VWg4WGhYNlJmcmpEcXFPSnBrY1VZcUNiUnhHUys0b3NXVzljN3I5WWNKK1pQ?=
 =?utf-8?B?M1R5ck1ZWU80NURna0N0d1FScHlqT3ArLzhiNXdjVUNxS1RUSHZRVXkwRDc2?=
 =?utf-8?Q?H9lvZznp7CO5ACP+LgYbZt1xskNW7LNxRKF8Q=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6366.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4492ec26-df5a-47ee-83f9-08d9558c1e88
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 08:04:14.4387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdV7D6Kmr/iGvtJm64Y09wKrzx4qYMPDNFL5fqItITogOHaFV1oL83Tv2YoujCrQQh/33z66SfQ43sZAzYxnQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6281
X-Proofpoint-ORIG-GUID: kFqO9O9Qy0ya6WGgU2yZe2PZxRSKIRzF
X-Proofpoint-GUID: kFqO9O9Qy0ya6WGgU2yZe2PZxRSKIRzF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-02_01:2021-08-02,2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020057
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyDQo+IFJvZWNrDQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVseSAyOCwgMjAyMSA4OjM4IFBNDQo+IFRvOiBTYSwgTnVubyA8TnVuby5T
YUBhbmFsb2cuY29tPjsgbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZw0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47
IEplYW4gRGVsdmFyZQ0KPiA8amRlbHZhcmVAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZD
IFBBVENIIDAvNl0gQVhJIEZBTiBuZXcgZmVhdHVyZXMgYW5kDQo+IGltcHJvdmVtZW50cw0KPiAN
Cj4gW0V4dGVybmFsXQ0KPiANCj4gSGksDQo+IA0KPiBPbiA3LzI3LzIxIDE6NDIgQU0sIFNhLCBO
dW5vIHdyb3RlOg0KPiA+DQo+ID4gSGkgR3VlbnRlciwNCj4gPg0KPiA+PiBGcm9tOiBOdW5vIFPD
oSA8bnVuby5zYUBhbmFsb2cuY29tPg0KPiA+PiBTZW50OiBUaHVyc2RheSwgSnVseSA4LCAyMDIx
IDI6MDEgUE0NCj4gPj4gVG86IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gQ2M6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD47IFJvYiBIZXJyaW5nDQo+ID4+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBKZWFuIERlbHZh
cmUgPGpkZWx2YXJlQHN1c2UuY29tPg0KPiA+PiBTdWJqZWN0OiBbUkZDIFBBVENIIDAvNl0gQVhJ
IEZBTiBuZXcgZmVhdHVyZXMgYW5kIGltcHJvdmVtZW50cw0KPiA+Pg0KPiA+PiBUaGlzIHNlcmll
cyBhZGRzIHNvbWUgbmV3IGZlYXR1cmVzIHRvIHRoZSBheGktZmFuLWNvbnRyb2wgZHJpdmVyLg0K
PiBPbg0KPiA+PiB0b3ANCj4gPj4gb2YgdGhhdCwgdGhlIEhXIGhhZCBzb21lIGNoYW5nZXMgKGJh
c2ljYWxseSBpdCBub3cgc3RhcnRzDQo+IGF1dG9tYXRpY2FsbHkNCj4gPj4gb3V0IG9mIHJlc2V0
KSBzbyB0aGF0IHRoZSBkcml2ZXIgbmVlZGVkIHNvbWUgbWlub3IgcmVmYWN0b3JpbmcuIFRoZQ0K
PiA+PiByZWFzb24gSSdtIHNlbmRpbmcgdGhpcyBhcyBSRkMsIGlzIG1haW5seSBiZWNhdXNlIG9m
IHRoZSBsYXN0IHBhdGNoDQo+ID4+ICgiaHdtb246IGF4aS1mYW4tY29udHJvbDogc3VwcG9ydCB0
ZW1wZXJhdHVyZSB2cyBwd20gcG9pbnRzIikuDQo+IFRoZQ0KPiA+PiBjb3JlDQo+ID4+IGhhcyBz
b21lIHByZWRlZmluZWQgdmFsdWVzIHdoaWNoIGRlZmluZSBhIHRlbXBlcmF0dXJlIHZzIHB3bQ0K
PiA+PiBjdXJ2ZSBbMV0uDQo+ID4+IEl0IGFsc28gZXhwb3NlcyByZWdpc3RlcnMgc28gdGhhdCB1
c2VycyBjYW4gY2hhbmdlIGl0IGFjY29yZGluZyB0bw0KPiB0aGVpcg0KPiA+PiBuZWVkcy4gQXMg
SSBjb3VsZCBub3QgZmluZCBzdGFuZGFyZCBhdHRyaWJ1dGVzIGluIHRoZSBzdWJzeXN0ZW0sIEkn
bQ0KPiA+PiBwcm9wb3Npbmcgc29tZSAicmF3IiBzeXNmcyBmaWxlcy4gTG9va2luZyBhdCBbMl0s
IHRoZQ0KPiBwd21fYXV0b19wb2ludA0KPiA+PiBzdHVmZiBsb29rZWQgdG8gYmUgd2hhdCBJIHdh
bnQuIE9idmlvdXNseSBJIG1pZ2h0IGJlIHdyb25nIDopLiBJZiB0aGlzDQo+ID4+IGlzIGFjY2Vw
dGVkLCBJIHdpbGwgYWRkIGEgcHJvcGVyIHN5c2ZzIERPQyBmaWxlIGRlc2NyaWJpbmcgdGhlIG5l
dw0KPiBmaWxlcw0KPiA+PiAoYmVpbmcgbGF6eSBpbiB0aGUgUkZDKS4NCj4gPj4NCj4gPj4gRm9y
IHBhdGNoIDUgKCJod21vbjogYXhpLWZhbi1jb250cm9sOiBjbGVhciB0aGUgZmFuIGZhdWx0IGly
cSBhdA0KPiA+PiBzdGFydHVwIiksDQo+ID4+IGl0J3MgYWxzbyBhcmd1YWJsZSBpZiB3ZSByZWFs
bHkgbmVlZCBpdC4gVGhlIG1haW4gcmVhc29uIEkgaGF2ZSBpdCBpcw0KPiA+PiBiZWNhdXNlIG9m
IHNvbWUgdXNlcmxhbmQgYXBwcyB0aGF0IG1pZ2h0IHRha2Ugc29tZSBkcmFzdGljDQo+IG1lYXN1
cmVzDQo+ID4+IGJ5DQo+ID4+IGp1c3QgcmVhZGluZyAxIGZhbl9mYXVsdCBhbGFybS4gT2J2aW91
c2x5LCB3ZSBjYW4gYXJndWUgdGhhdCB0aGUNCj4gPj4gcHJvYmxlbQ0KPiA+PiBpcyBpbiB0aGUg
YXBwIGFuZCBub3QgaW4gdGhlIGRyaXZlci4gVGhvdWdoIGl0J3Mgc3VjaCBhIG1pbmltYWwgY2hh
bmdlDQo+ID4+IHRoYXQgSSBkZWNpZGVkIHRvIGluY2x1ZGUgaXQgKEknbSBtb3JlIHRoYW4gZmlu
ZSBpbiBkcm9wcGluZyB0aGUNCj4gcGF0Y2gpLg0KPiA+Pg0KPiA+PiBbMV06IGh0dHBzOi8vd2lr
aS5hbmFsb2cuY29tL3Jlc291cmNlcy9mcGdhL2RvY3MvYXhpX2Zhbl9jb250cm9sDQo+ID4+IFsy
XToNCj4gPj4NCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL0RvY3VtZW4NCj4gPj4gdGF0aW9uL2h3bW9uL3N5c2ZzLQ0KPiA+Pg0KPiBpbnRl
cmZhY2VfXzshIUEzTmk4Q1MweTJZIXV3anBhT1Q4UUVCVmZLVENXRUxKTmJqSko2OWlSN1MzdEtT
DQo+ID4+IFdWNEIwSzc0MkN0Y0FSa1R0QXFNeGtubnBQdyQNCj4gPj4NCj4gPj4gTnVubyBTw6Eg
KDYpOg0KPiA+PiAgICBod21vbjogYXhpLWZhbi1jb250cm9sOiBtYWtlIHN1cmUgdGhlIGNsb2Nr
IGlzIGVuYWJsZWQNCj4gPj4gICAgaHdtb246IGF4aS1mYW4tY29udHJvbDogYWRkIHRhY2hvIGRl
dmljZXRyZWUgcHJvcGVydGllcw0KPiA+PiAgICBkdC1iaW5kaW5nczogYXhpLWZhbi1jb250cm9s
OiBhZGQgdGFjaG8gcHJvcGVydGllcw0KPiA+PiAgICBod21vbjogYXhpLWZhbi1jb250cm9sOiBo
YW5kbGUgaXJxcyBpbiBuYXR1cmFsIG9yZGVyDQo+ID4+ICAgIGh3bW9uOiBheGktZmFuLWNvbnRy
b2w6IGNsZWFyIHRoZSBmYW4gZmF1bHQgaXJxIGF0IHN0YXJ0dXANCj4gPj4gICAgaHdtb246IGF4
aS1mYW4tY29udHJvbDogc3VwcG9ydCB0ZW1wZXJhdHVyZSB2cyBwd20gcG9pbnRzDQo+ID4+DQo+
ID4NCj4gPiBUaGUgSFcgZ3V5IGlzIHdpbGxpbmcgdG8gY2hhbmdlIGhvdyB0aGUgY29yZSB3b3Jr
cy4gVGhpcyBtZWFucywNCj4gPiB0aGF0IGFsbCB0aGF0IHVuc3RhYmxlIHB3bSAtIHJwbSBwb2lu
dHMgd2lsbCBnbyBhd2F5IGFuZCB3ZSB3aWxsDQo+ID4gaGF2ZSBhIHJlZ2lzdGVyIHdoZXJlIHdl
IGNhbiBzZXQgdGhlIG1pbmltdW0gZmFuIHNwZWVkIGZvcg0KPiA+IGV2YWx1YXRpbmcgdGhlIEZB
Ti4gSGUgYWxzbyBzYWlkIHRoYXQgdGhlIGRlZmF1bHQgdmFsdWUgZm9yIHRoZQ0KPiA+IHRoaXMg
c2V0dGluZyB3aWxsIGJlIHByZXR0eSBsb3cgc28gdGhhdCB3ZSBzaG91bGQgb25seSBoYXZlIF9y
ZWFsXw0KPiA+IGZhdWx0cyBhdCBzdGFydHVwIHdoaWNoIG1lYW5zIHBhdGNoIDUgc2hvdWxkIG5v
dCBiZSBuZWVkZWQNCj4gPiBhbnltb3JlLi4uDQo+ID4NCj4gPiBBbnl3YXlzLCBJIHdpbGwgc2Vu
ZCBhIG5ldyBwdWxsIHdpdGggcGF0Y2hlcyAxLDMgYW5kIDUgYW5kDQo+IA0KPiBUaGF0IGtpbmQg
b2YgY29udHJhZGljdHMgd2hhdCB5b3Ugc2F5IGFib3ZlLCB0aGF0IHBhdGNoIDUgd29uJ3QgYmUN
Cj4gbmVlZGVkIGFueW1vcmUuIEFtIEkgbWlzc2luZyBzb21ldGhpbmcgPw0KDQpNeSBiYWQuLi4g
SSBtZWFudCBwYXRjaCA2IGFuZCBub3QgNS4NCg0KLSBOdW5vIFPDoQ0K
