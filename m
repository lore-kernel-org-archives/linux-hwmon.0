Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A31C4338F
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jul 2021 08:43:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2088B61248
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jul 2021 08:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235986AbhG0InP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jul 2021 04:43:15 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:47680 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235978AbhG0InO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jul 2021 04:43:14 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16R8a8kn019072;
        Tue, 27 Jul 2021 04:42:59 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
        by mx0a-00128a01.pphosted.com with ESMTP id 3a234fsyc2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 04:42:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCgI4kZxsU6U5EqMI/aOa86NybKaFXJbq3mTXTtF5DyMebB3yDZXlfGPio1q7AauqDPwK5l2+8KT511IvPTWbIUhKPeId1syTb2JFAjJobKI3jalDYMmUBTcs4HRNHcoBQRelKKnXi+vztfWG8eQMvN/ytEAwpK/N91bYtj9N5s+FipvIKpg4JTLDWirfkWun3q9zeLoUTXZNdufoWLK3TU4zhDQHjz1RIdEHDx6dlhP3j2ux45SlwV3b6zBRV2ESoDy3PX+xLlcaRMrmZQpf8HLsfNPQcizpQn60FggPNcfbsOSTLb2Umv7UHIeFnJa1gd1SYOrdb3nYWZdUIzyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg/RvUKn4AqbtBgC45yyIW4RQGCQqDWycgbAiwfYBxo=;
 b=llLU2dYpfcDFLQfQ2+dweRxGMJnctGR8xops3srDVBsoSVWYKtDGbo2EuBTSnKYNa/1CpEDdQrH/yhtcW3qjOnddXHlufpNlTeWorPMCeErGOi8Ep7KngicJ2ttPwT9PhTC1a69zO3SBdimm43s/AYeZuAS/s3IC9EQFHwrjJvku3sgb3JzFyWMzdvkie2/OgrryrjpUHR1Kk3ooOjapLc/8aDCWL0NgCS0GeO4iSRaVt3g9+X0ViQ8zAGIjTqdDuzjXx3NUkZiWzba82B/2EnyQEbbUtAvkliX2yQNkEuvwFrYORD46FI2mRKV5e9sCzZka3243JAF1u6yG/PfvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg/RvUKn4AqbtBgC45yyIW4RQGCQqDWycgbAiwfYBxo=;
 b=foUrBlfo2r22FxBysQKizbEGKRTgsoRwEz94tkZCcEfPxDKYSeNeqZipHc3UUJnp/E1Xo5/vytjPTEauI/N4EREUfHipkyYXclJKZawMkAqhQy4f1SyBB8ZB5eaeOuxGIZkO1z5vRCZgaK2zYNI1hn1ny8KHutI6s/CeXfXISis=
Received: from PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 by PH0PR03MB5846.namprd03.prod.outlook.com (2603:10b6:510:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 08:42:57 +0000
Received: from PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca]) by PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca%4]) with mapi id 15.20.4352.030; Tue, 27 Jul 2021
 08:42:57 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: RE: [RFC PATCH 0/6] AXI FAN new features and improvements
Thread-Topic: [RFC PATCH 0/6] AXI FAN new features and improvements
Thread-Index: AQHXc/DVxLPZKDI5NEGd7KfkUZYeSatWmeWQ
Date:   Tue, 27 Jul 2021 08:42:57 +0000
Message-ID: <PH0PR03MB6366CDE5F062E14F7A8E943F99E99@PH0PR03MB6366.namprd03.prod.outlook.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
In-Reply-To: <20210708120111.519444-1-nuno.sa@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dFlUSTBNakF3WmpndFpXVmlOaTB4TVdWaUxUaGlOemN0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhHRXlOREl3TUdZNUxXVmxZall0TVRGbFlpMDRZ?=
 =?utf-8?B?amMzTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTXpNd015?=
 =?utf-8?B?SWdkRDBpTVRNeU56RTRORGc1TnpVeU56RTBNREU0SWlCb1BTSlFNVlJSWVdO?=
 =?utf-8?B?R1YwMHZWWGw0WmxkeFFqVldlRXByU1VkbVJVRTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZKV1VSQlFVRnBUemxhYTNjMFRGaEJWamxyWldOVlpYZG1LM05ZTWxJMWVG?=
 =?utf-8?B?STNRaTgyZDBaQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
authentication-results: analog.com; dkim=none (message not signed)
 header.d=none;analog.com; dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b36165fb-0832-4365-1090-08d950da88d6
x-ms-traffictypediagnostic: PH0PR03MB5846:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB58467E8DC0FE5AE7587048A899E99@PH0PR03MB5846.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GyKQ23kMe18XTsDvlrZb5xeetNVbXtqOQCjxmGeNeS6YxvWPSAR62It43SoYSegpqNs0r2bHSI6VJnW3gqzuoSgh4muuk12zTqCU8DALGLT+3haKNDXjK/cTZSHKtQmtyHn+tikEUQ69FIq2xxNhxGiR1cDcq0IIWUJLXvAYnK1+SEfvI2HfZfayOclUMe4rdokbR3ViXYOO37qHuUvIBbK/rgtqfym+SfB02l13F3lS2c50caZ4NGVt//niFxv81d37HZGp7j+nNoEGQxXVeUAKTSsk10jP+o54fgbCYRDbCj4MBLSV4ucfSKjLzbOSA5F1czvGNZTf64RjLzUXOVPZ6D33NdrccP4wS4Q7p2Jt1waS01aYcx3xm23t5e5Xf5sIBTrHIVEGY6ib8TwM0yFlsU/RE0Wls+u28HgORpQdppTr3/mMIysvfBxdf5z7tp4d2a44h1nQ/iwDD/i59xpcBh0g/0sRjD8hp5WaoSuH27jxESbKlyYFqaAgPkxN7ZosfLKfx1PYvxp5GxcWbRL2q7TScYmUInvX7kOySHDXZF3YAAcJ8rFd1lrMajWggb31prFPdPCiypKoCvJtfG2FzcRy/L4l5ku9/2Gn6UcKSqJnS5qDgASb5uHyXQueDxGVHfm++fr5coLOaXAFP8G7RAdqhO348i1qZyRI3y6xBW12ScMZbhu1BZkX/tF14EurwPa8eA89TZdILgePscqh5H2IwVQtpNJz6p1Z1zj1tKjM3uxG90+3VdFzQR0u6otuHAOodELtQL7zhEdpsOPmFyxQJ27GlCd43m8Z7RCQuT7sOOv0hEt84onySbcbhqovOsRrdYnnx+kaIvv44g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6366.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(66556008)(66446008)(9686003)(66946007)(64756008)(66476007)(8936002)(26005)(86362001)(83380400001)(54906003)(110136005)(6506007)(53546011)(2906002)(4326008)(316002)(55016002)(76116006)(7696005)(52536014)(8676002)(5660300002)(186003)(966005)(71200400001)(508600001)(38100700002)(122000001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWJEVjhvMVJSc3ZxWGc3cHpUdDBXMjFyVi9FUzNzU25HK0N1azFrN2J4ZFNV?=
 =?utf-8?B?VDZLOHRjUzF2QnFBMW9GQWZQdkRCQmNjNFI5OXlGQUszQVVXZ1FvSHoxTFpn?=
 =?utf-8?B?UGdqVUxJbUJKWFN3SWgvMnhXL1RYNXRXUFVzSnovcjc0bFBNOXgzaWRNL2Yy?=
 =?utf-8?B?WjAxVFpjVnh4MVBVQ09WcXpsKzA5WUJKSkg5L1h2LzR0YXVnOXpOSyt4S0tt?=
 =?utf-8?B?Y3R2VU1FTmY1TVI1ZUhBSytJRTlLZjVxWU9qMTVueUVtUXdwemVlalRHZEFr?=
 =?utf-8?B?NkdYL05RckJKTVlEMTc4VXU0Y2ZERUNWd1UvaG53THNNL1diZk1RenE2bStM?=
 =?utf-8?B?bm9BbUR6Uml2bkJYL1FmdVNieDJVdWh4Rjg1akhsK08rNTd5cXd2ck52bjhl?=
 =?utf-8?B?ay93clRqeU9MVUd6V2d2MlBPbFd6dU81b1N3UDEvQ2dMaWlaRnlsSDFNMWFE?=
 =?utf-8?B?WDltajNhYWswNjZUTzJDWUZvcExsajJhVjlQRzNPaE9GUHJSWGZuTlI2dnpv?=
 =?utf-8?B?VGhML0tTdUJZYUVpYy9YS1Byc2hYK1BRWnpUc05lSFlCYmE4MXY5Y2t4VlIy?=
 =?utf-8?B?TmhUUllieGN2QW8wUWt1NFBnMWlMaVJRM2lHY0svZ2x3MWtncEpha0VsWmhn?=
 =?utf-8?B?bWhUTlVQbHBZUENFbnVmRm1yUHVlMGd3Q0R6eE1ldkhIV2F1dXp6amgxTFZK?=
 =?utf-8?B?d2lZNy8yS2g0MXdGOUFxRFV1ZVRqUGsrZk5iUFRQWnVVZXN3NzJUeWZ0eUJp?=
 =?utf-8?B?WGNSa2xzR2gvcGREL3JyZ1RYaXpaVXF3Zk92UHNiL0w1QXBlaHlhNkNjeHN3?=
 =?utf-8?B?VnJlTkFRZjQ1UEpMSTZsaWN4c2FkdzlWMTJ0N3J6SmJxT1ZWQzBzcXgwOS9y?=
 =?utf-8?B?ZEhwbzY5cjMxZjVsU0VqMGhCWTZYRVFBRCtCYmZhRUdOMXBFWTF4N1U4NFpo?=
 =?utf-8?B?QlhDNytCSENTUFR0ZUFWQjFFYlRNS1ZmSFVBYUlBMmIrVFRCVGlrZmFRbUtW?=
 =?utf-8?B?N2xmVjJaSDRsYUkyd1lLUlFhZDVyZHZiTXhLRHU1dncwWXdIMkJoY1RSV1RE?=
 =?utf-8?B?VUNRd3VVZXR3NGtTNWFncHJQcmc4VjFCcysrTCtOVU9UT1U2R1ZiWXZWaFcy?=
 =?utf-8?B?WmNwNzIzaDlGSGQ2UkV2NUlUcnVNdzNRaGZvYTh6NGFUZ054czZpZXZROUd0?=
 =?utf-8?B?NEdhNlJ3RUtBQ3pSQlFnQVdneXV2SjhZSHc0ZHk1MlJ2QlRpVm1CUG5WSmVq?=
 =?utf-8?B?UlFTVTJUV0hLUWdxMSszSFRPUUZvczBXMktLV0tiaFZVS2tGV3g2eHRSRWhz?=
 =?utf-8?B?Y29TWFZHd082VTlkZ21kMGhRTVVxajNDeGdWa3RTRmZ5aGNDdTYrZzd0N1NW?=
 =?utf-8?B?RVkyMXVLT2lwZlRCQnQxdWQxVFBIN0YvWldRa25lYXdhQWtOQzlBZk5mUytQ?=
 =?utf-8?B?bjBhK1VRbkFSSkpOVlNOT0VFMVhvL2QxUlNOR01SYk5PNU9MYVl5eC9QSG5x?=
 =?utf-8?B?eHpQUXM4dHU2TGhQcWVDRlNsYlI5NUtvWmY2RStFelRmVjBKbFYwOVRzREpG?=
 =?utf-8?B?UllyMDFldjhxS2JtbzkwSDhiQW1JNkIzaFR3NSt4dXZubHY3WEdlcXVXUDZY?=
 =?utf-8?B?Y0YzazVseEc5UVdtTVphbnd6U2JCbEJtV2M1MFF2bXNtTHdhM3pla1M0dnZl?=
 =?utf-8?B?SmxPNjNKWGZPZ1NxSVdhUUI5ajhINCsrOWROR3E0MVR2Zk4weGx1a1VpYnpr?=
 =?utf-8?Q?ooL9CVRluFACiesqjI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6366.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b36165fb-0832-4365-1090-08d950da88d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 08:42:57.6935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1nExjQvS5/hzHm7aqiKXJONdDq1udPtuqfLXbyrrMiF81AcmB4MNVO+NJ/O5SkAg15dv2riapGZV3OpIUADYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5846
X-Proofpoint-ORIG-GUID: GlX1td5NIIC4xGw1p2agrEut_ulYxIdn
X-Proofpoint-GUID: GlX1td5NIIC4xGw1p2agrEut_ulYxIdn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-27_05:2021-07-27,2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270049
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQpIaSBHdWVudGVyLA0KDQo+IEZyb206IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+DQo+
IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDgsIDIwMjEgMjowMSBQTQ0KPiBUbzogbGludXgtaHdtb25A
dmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBDYzogR3VlbnRl
ciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PjsgUm9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2Vy
bmVsLm9yZz47IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFtS
RkMgUEFUQ0ggMC82XSBBWEkgRkFOIG5ldyBmZWF0dXJlcyBhbmQgaW1wcm92ZW1lbnRzDQo+IA0K
PiBUaGlzIHNlcmllcyBhZGRzIHNvbWUgbmV3IGZlYXR1cmVzIHRvIHRoZSBheGktZmFuLWNvbnRy
b2wgZHJpdmVyLiBPbg0KPiB0b3ANCj4gb2YgdGhhdCwgdGhlIEhXIGhhZCBzb21lIGNoYW5nZXMg
KGJhc2ljYWxseSBpdCBub3cgc3RhcnRzIGF1dG9tYXRpY2FsbHkNCj4gb3V0IG9mIHJlc2V0KSBz
byB0aGF0IHRoZSBkcml2ZXIgbmVlZGVkIHNvbWUgbWlub3IgcmVmYWN0b3JpbmcuIFRoZQ0KPiBy
ZWFzb24gSSdtIHNlbmRpbmcgdGhpcyBhcyBSRkMsIGlzIG1haW5seSBiZWNhdXNlIG9mIHRoZSBs
YXN0IHBhdGNoDQo+ICgiaHdtb246IGF4aS1mYW4tY29udHJvbDogc3VwcG9ydCB0ZW1wZXJhdHVy
ZSB2cyBwd20gcG9pbnRzIikuIFRoZQ0KPiBjb3JlDQo+IGhhcyBzb21lIHByZWRlZmluZWQgdmFs
dWVzIHdoaWNoIGRlZmluZSBhIHRlbXBlcmF0dXJlIHZzIHB3bQ0KPiBjdXJ2ZSBbMV0uDQo+IEl0
IGFsc28gZXhwb3NlcyByZWdpc3RlcnMgc28gdGhhdCB1c2VycyBjYW4gY2hhbmdlIGl0IGFjY29y
ZGluZyB0byB0aGVpcg0KPiBuZWVkcy4gQXMgSSBjb3VsZCBub3QgZmluZCBzdGFuZGFyZCBhdHRy
aWJ1dGVzIGluIHRoZSBzdWJzeXN0ZW0sIEknbQ0KPiBwcm9wb3Npbmcgc29tZSAicmF3IiBzeXNm
cyBmaWxlcy4gTG9va2luZyBhdCBbMl0sIHRoZSBwd21fYXV0b19wb2ludA0KPiBzdHVmZiBsb29r
ZWQgdG8gYmUgd2hhdCBJIHdhbnQuIE9idmlvdXNseSBJIG1pZ2h0IGJlIHdyb25nIDopLiBJZiB0
aGlzDQo+IGlzIGFjY2VwdGVkLCBJIHdpbGwgYWRkIGEgcHJvcGVyIHN5c2ZzIERPQyBmaWxlIGRl
c2NyaWJpbmcgdGhlIG5ldyBmaWxlcw0KPiAoYmVpbmcgbGF6eSBpbiB0aGUgUkZDKS4NCj4gDQo+
IEZvciBwYXRjaCA1ICgiaHdtb246IGF4aS1mYW4tY29udHJvbDogY2xlYXIgdGhlIGZhbiBmYXVs
dCBpcnEgYXQNCj4gc3RhcnR1cCIpLA0KPiBpdCdzIGFsc28gYXJndWFibGUgaWYgd2UgcmVhbGx5
IG5lZWQgaXQuIFRoZSBtYWluIHJlYXNvbiBJIGhhdmUgaXQgaXMNCj4gYmVjYXVzZSBvZiBzb21l
IHVzZXJsYW5kIGFwcHMgdGhhdCBtaWdodCB0YWtlIHNvbWUgZHJhc3RpYyBtZWFzdXJlcw0KPiBi
eQ0KPiBqdXN0IHJlYWRpbmcgMSBmYW5fZmF1bHQgYWxhcm0uIE9idmlvdXNseSwgd2UgY2FuIGFy
Z3VlIHRoYXQgdGhlDQo+IHByb2JsZW0NCj4gaXMgaW4gdGhlIGFwcCBhbmQgbm90IGluIHRoZSBk
cml2ZXIuIFRob3VnaCBpdCdzIHN1Y2ggYSBtaW5pbWFsIGNoYW5nZQ0KPiB0aGF0IEkgZGVjaWRl
ZCB0byBpbmNsdWRlIGl0IChJJ20gbW9yZSB0aGFuIGZpbmUgaW4gZHJvcHBpbmcgdGhlIHBhdGNo
KS4NCj4gDQo+IFsxXTogaHR0cHM6Ly93aWtpLmFuYWxvZy5jb20vcmVzb3VyY2VzL2ZwZ2EvZG9j
cy9heGlfZmFuX2NvbnRyb2wNCj4gWzJdOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbg0KPiB0YXRpb24vaHdtb24vc3lzZnMt
DQo+IGludGVyZmFjZV9fOyEhQTNOaThDUzB5MlkhdXdqcGFPVDhRRUJWZktUQ1dFTEpOYmpKSjY5
aVI3UzN0S1MNCj4gV1Y0QjBLNzQyQ3RjQVJrVHRBcU14a25ucFB3JA0KPiANCj4gTnVubyBTw6Eg
KDYpOg0KPiAgIGh3bW9uOiBheGktZmFuLWNvbnRyb2w6IG1ha2Ugc3VyZSB0aGUgY2xvY2sgaXMg
ZW5hYmxlZA0KPiAgIGh3bW9uOiBheGktZmFuLWNvbnRyb2w6IGFkZCB0YWNobyBkZXZpY2V0cmVl
IHByb3BlcnRpZXMNCj4gICBkdC1iaW5kaW5nczogYXhpLWZhbi1jb250cm9sOiBhZGQgdGFjaG8g
cHJvcGVydGllcw0KPiAgIGh3bW9uOiBheGktZmFuLWNvbnRyb2w6IGhhbmRsZSBpcnFzIGluIG5h
dHVyYWwgb3JkZXINCj4gICBod21vbjogYXhpLWZhbi1jb250cm9sOiBjbGVhciB0aGUgZmFuIGZh
dWx0IGlycSBhdCBzdGFydHVwDQo+ICAgaHdtb246IGF4aS1mYW4tY29udHJvbDogc3VwcG9ydCB0
ZW1wZXJhdHVyZSB2cyBwd20gcG9pbnRzDQo+IA0KDQpUaGUgSFcgZ3V5IGlzIHdpbGxpbmcgdG8g
Y2hhbmdlIGhvdyB0aGUgY29yZSB3b3Jrcy4gVGhpcyBtZWFucywNCnRoYXQgYWxsIHRoYXQgdW5z
dGFibGUgcHdtIC0gcnBtIHBvaW50cyB3aWxsIGdvIGF3YXkgYW5kIHdlIHdpbGwNCmhhdmUgYSBy
ZWdpc3RlciB3aGVyZSB3ZSBjYW4gc2V0IHRoZSBtaW5pbXVtIGZhbiBzcGVlZCBmb3INCmV2YWx1
YXRpbmcgdGhlIEZBTi4gSGUgYWxzbyBzYWlkIHRoYXQgdGhlIGRlZmF1bHQgdmFsdWUgZm9yIHRo
ZQ0KdGhpcyBzZXR0aW5nIHdpbGwgYmUgcHJldHR5IGxvdyBzbyB0aGF0IHdlIHNob3VsZCBvbmx5
IGhhdmUgX3JlYWxfIA0KZmF1bHRzIGF0IHN0YXJ0dXAgd2hpY2ggbWVhbnMgcGF0Y2ggNSBzaG91
bGQgbm90IGJlIG5lZWRlZA0KYW55bW9yZS4uLg0KDQpBbnl3YXlzLCBJIHdpbGwgc2VuZCBhIG5l
dyBwdWxsIHdpdGggcGF0Y2hlcyAxLDMgYW5kIDUgYW5kDQphcyBzb29uIGFzIEkgaGF2ZSBzb21l
IEhXIHJlYWR5IHRvIHRlc3QsIEkgd2lsbCBzZW5kIHRoZSBvdGhlcg0KcGF0Y2hlcy4gV2l0aCB0
aGUgbmV3IG1lY2hhbmlzbSwgd2UgY2FuIGFsc28gc2ltcGxpZnkgdGhlIElSUQ0KaGFuZGxpbmcg
WzFdLi4uDQoNCkZvciB0aGUgbmV3IGRldmljZXRyZWUgcHJvcGVydHksIEkgdGhpbmsgbm93IGl0
IHJlYWxseSBpcyBhIGZhbg0KcHJvcGVydHkgd2hpY2ggbWFrZXMgbWUgd29uZGVyIGlmIHRoZSBw
cm9wZXJ0eSB3aWxsIGJlIGFjY2VwdGVkDQppbiB0aGUgY29udHJvbGxlciBiaW5kaW5ncyBvciBp
ZiBJIG5lZWQgdG8gc2VuZCBhIGZhbi55YW1sLi4uDQoNClsxXTogaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuMTQtcmMzL3NvdXJjZS9kcml2ZXJzL2h3bW9uL2F4aS1mYW4tY29u
dHJvbC5jI0wyODANCg0KLSBOdW5vIFPDoQ0K
