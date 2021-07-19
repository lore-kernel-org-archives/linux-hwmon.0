Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057D2C12002
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 07:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD6B56115B
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 07:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbhGSHt7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Jul 2021 03:49:59 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:45118 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233759AbhGSHt5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Jul 2021 03:49:57 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16J7UZM2016982;
        Mon, 19 Jul 2021 03:46:43 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        by mx0a-00128a01.pphosted.com with ESMTP id 39uv48njvr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Jul 2021 03:46:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLYYpwXX42Oh1Wt2043leMcDffvPgsc/aYvpsb7iM2IwHrMXFfH5sWsiNdVIAaJm7891RiR4J3iIZzlsw2jDrVGIMYlCyBwGkJrp9qMZa8/UBgJfBBtmfLGy/dvEr0LBXHOromgbsb3IP+7LnWbSyev6h+lWpqDXuCAPAGTT4DMb3Wv7sh+bE2aI2AtD/OBrqN3YkvWprcROjpmyHSVIh+HV+Fqz2mKKQ/j8+cTmxOp2XG5sxNoJEip8dJ7/RRmU9iqkRPxzR0Hke6GvPB2n6w9ZPeFjLJzRRgcRHH/MnO+7muA9DBDEhkQxRyuebtYYMkbuT+3nQK14oDUBe2ZTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRoa1O2z9UrfRUS2qIFUvLLUz6skuOY1pYwYktLgHG4=;
 b=i+pNq25mJG2mq7LfpoGuTYT6bwZuV3xEcOOV6rYJH/2r2B+hhkHzxrXOIv+H6V6skw+J5s7cu5YB++GS1belqoVAIeO2T6GCkjhRmmhUTAYVhqtGvjtrH8IlX8oTBZVd3GH9h3TdBeEjw/gZnrSqhqdn9qGK2HS1ZqDjcqrxuoe+7HzywyuQ+yQEGghblHPV8FLSsdh3Nxh7NbY2L6Mv2TKlWnKoeZ4PiCpNfydUhAoeAa7VZsNdUpV8R5nHJT5cizx/yzPHRfdz/fIa7ULlM/9yD0QuzcPwRunGDcHU63anjBU00UYuivQiDCcwWO+zoC0ad6ncCEgWkGweu0EhsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRoa1O2z9UrfRUS2qIFUvLLUz6skuOY1pYwYktLgHG4=;
 b=qq3IsMowXHVDEh7igmy8k6PRrh2HDn3UgOqnL+dSsF35rhHBaw88XtPFzNr2tjNV+ggkabyCQDtfhSoYckPShHlfMljy45V95jAoyE4kOqCTFZUAxZ6XwMo/pjkY+KH/yUMD+bht9hEmJUYtNL5cXSgQ3co5G1AUYfQJcL4Y2NM=
Received: from PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 by PH0PR03MB6267.namprd03.prod.outlook.com (2603:10b6:510:e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 07:46:42 +0000
Received: from PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca]) by PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca%4]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 07:46:42 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Rob Herring <robh@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: RE: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
Thread-Topic: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
Thread-Index: AQHXc/CftWRp4pYREEulee6AuCq4has/nlgAgAQ89UCAAK/fgIAAtKIggAB/4YCABDeOgA==
Date:   Mon, 19 Jul 2021 07:46:41 +0000
Message-ID: <PH0PR03MB636618FE5E821669E224960199E19@PH0PR03MB6366.namprd03.prod.outlook.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
 <20210712172656.GA2142233@robh.at.kernel.org>
 <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
 <20210715203937.GA3182741@roeck-us.net>
 <PH0PR03MB636641D09289D1F696A64C9299119@PH0PR03MB6366.namprd03.prod.outlook.com>
 <f6d415a7-e113-1dda-727e-0d645c8114cb@roeck-us.net>
In-Reply-To: <f6d415a7-e113-1dda-727e-0d645c8114cb@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE56TXpNbVF3T0dVdFpUZzJOUzB4TVdWaUxUaGlOelV0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhEY3pNekprTURobUxXVTROalV0TVRGbFlpMDRZ?=
 =?utf-8?B?amMxTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTkRFeE55?=
 =?utf-8?B?SWdkRDBpTVRNeU56RXhOVFF6T1RrNE1UTXpNelV6SWlCb1BTSmpMMHBLVURO?=
 =?utf-8?B?Mk1qbE1NRWhvYldneFJtVXpPRWgzU0dabkszTTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZKV1VSQlFVSndUa3B2TVdOdWVsaEJVV3hySzJkMlZVTk1iMjVEVjFRMlF6?=
 =?utf-8?B?bFJTWFZwWTBaQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: ccd4a086-7450-40b7-3433-08d94a895963
x-ms-traffictypediagnostic: PH0PR03MB6267:
x-microsoft-antispam-prvs: <PH0PR03MB62671148D5F15B7892BB2B7F99E19@PH0PR03MB6267.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xg4M61/88Zv2tBlqTYNaEy/AldmcR9/y/auUdyjrspcYTMwKkHRLNI+Sx9y/U/2Gp7Pcv6oJQk9onGB+0RGMi7DrzbmBt3lC2Z7Ky57jy3t/rRltMksr9YuXVHFncHvn0GabPj4u9cU2PW/AnPQwrqDMRrYp/3QuGOI+CYRwG2PJ/5dKU3z52BYsFxjLMMmPtdpQmHvhHl4KO3K+9+XO3/m4FaeafHMGC/wUjyYWAJZLkVC6O8wLKvCvtE+a/uow2tJggWFF88wVa7Qm9sNygDAUG9chUratifdf10vtwmRjEPosM7LN7G39TtomjXb7zObBiDE+2o+TxRyOil0lWLU2wvupo1Be+euona9O/uYUvYBpt+V/wRDK4ehc0lq2sU8N/nFLhP/epY+mLdWSn25kbYpD3BekscuZvTcRFVryEc18dTmby+XybxBLVe69tDp9zlCBUDHqLj/V0wIiL6k+CTF1h9PpeglpQ6zmg6+MH3h3JSoKjutOTTjhiIEI+5aw1LzxvIYkRyvsba7gazQ3UMZKbI+pbIsfpG9ed6sYx/1vK715KCM+qClYLcqd+8pNfUx2pB3heYrGGMXAbLVzWy6fSK5IdU1Eu+s63lYfx/fU625Q+Z2nDFQ2kYChEYsn/AiW9obMmOP1Dwp2vCd8c5aKT+TmTzR8bSXdbkU+S6dJDhbG3bTHblWpcG7NXSCRtRDH4Vgt0ribrRIFBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6366.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(9686003)(316002)(33656002)(8936002)(6916009)(66556008)(64756008)(86362001)(8676002)(55016002)(66446008)(478600001)(66946007)(2906002)(76116006)(66476007)(38100700002)(83380400001)(71200400001)(53546011)(122000001)(6506007)(4326008)(5660300002)(186003)(52536014)(26005)(7696005)(54906003)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGIvdUoyS2RYTGxxamJhU1BqTWloQzNEbzBiQmJXYlpSTlNIUm9XY2VZZHpT?=
 =?utf-8?B?YjY0RFNPVnpwcmp3ZGVXT0lWeXdkd2ZrLytYZS9KWGU3MUoyTTVxbGVpbFUy?=
 =?utf-8?B?M2FjQVdiRUhjUkFZSEN6akEyanQzaG1yc2lLRm9SZG16Rmx3TVdJTTUxTSt1?=
 =?utf-8?B?RWxZQmlTL0FWY0thWTNUazM4em9RaUMyZlcwenlzWTd6WklKRFFMUWxKNkFw?=
 =?utf-8?B?NUdvZEJqYlA4a0FleGFUcWk3ZEt5WmZmcmNDK09Hc0hNTmUzOXFXZ1JVTnVB?=
 =?utf-8?B?SU9sYkxQNnVoOEJld0xsWDhHRFpTVDdBZGhrVTBBa1dNMm1qMFR6aE5hUVlZ?=
 =?utf-8?B?eUNWMzJ2dW5XZHgvNThLMkZiZkJVcHYweEZHM0Q5cUlWeXFzRTFZdjhkbTZE?=
 =?utf-8?B?TjhtaTFLL3pvMkgyWGNwT3YxQ3VxL0phQm9UNFNvMTZTTmJPZ0NCUUlicnlp?=
 =?utf-8?B?NmIveFhtQlFYUURIOHVuTGQ3Um1YbGZreGZsTlRyLzBBYTVuVE5ROWFXN29Q?=
 =?utf-8?B?VUlibmd0bkc1N09YU0FIQTFNeEdLZ2ttNklwdjVYR05VS1Eyek0yVXFuMi90?=
 =?utf-8?B?bXovN1ZXMEVLelZrR0ZMQkVnMWpvN3Z0TTRpQmdIUHJnVzUrakdaUHNZS0hZ?=
 =?utf-8?B?MHdGYmZMakNHaHdJYkZXMkVRdFYyZ0V4RVpubzdMNkNvRGhGLzZCYXFIVFJ1?=
 =?utf-8?B?TW9JTTF0MmlpYTBoZ2Vaa0Q2K0RLVW9FZ00wcHFTOE5tK2Y3WVRqdGRrREtm?=
 =?utf-8?B?N2ZSZ25YMVJqTC9DMXcxL2J0SisycVNLWG9reTVTdVhqbzVkR1VxaVBjZE1u?=
 =?utf-8?B?RFBIdWptampXRTRsYUd2OFlySXVPdFpoclhZaGxSRHBnZ1JreFlDUjVHTWFr?=
 =?utf-8?B?VE84eGRPdVNqTkpXMkxNUFMxdlFtdVZXVk5nZFRWN1RPMDJnMHRiYVg0TUNR?=
 =?utf-8?B?QjlKeFRMZG5XN3lpWFJYS0ZYakt6bWlHODQ2VVA1TFovbEZaKzVPWVYrQ0ZM?=
 =?utf-8?B?TFpxQnF5cTNaeEFJUVNhei9EbHBxUjcyUjJrZUZFRGozTXNmeG9oaTdYY1BY?=
 =?utf-8?B?UXBmWDlwODVla09EcG5QUlNZZmJyVjE0dCtDV1ZsZXBia0pHbklMNEo3MVUz?=
 =?utf-8?B?cTVaaUQyWTdQTWRNZExSeTA3S1d1ZTJUQklGcWdGcVBuTjhZUzQ4bm1LaDFW?=
 =?utf-8?B?cGRycHpRM2JOek4wSjd4SDJWRlVqVHNrb0lucUlYQTRvdXI3NGptdU4xTytW?=
 =?utf-8?B?M2h6SzlINlVHeDJYNVpXVWlIa0x5em9oN2tVdkRLclFnMlNKbVZNQ3dvUjZ2?=
 =?utf-8?B?SnBsWDJyeXprMW5jbnN6L243Uk1TOEgvYXh4WE1sUkVudGpxU0RoM3VIdHA5?=
 =?utf-8?B?L0ZZNCtScjBzUTh4TStzK29oRGVSRXVEdjhTUGZkMS9sMXgvRGNPT2hpSVM4?=
 =?utf-8?B?b2FRQkpiSGp5UUtHT1ZZWGhyZFdYZmNGUy8xNThEQ05nOHlTYTZ2T2V3WnQz?=
 =?utf-8?B?cXRLV01PVzlheExrV1YrOFBKYjN6S3lYVWMyMWZ5VUFOTXN0dDRORVRLMmIz?=
 =?utf-8?B?OGJhM1VmbnJINWVmcHh6T1VSYlRTY1BTQUlnU1c1K2pKMDJlVHo4NERaWDc5?=
 =?utf-8?B?eWdlRURPLzA4NU1mN21QTG1RVTQ2TnY1NVVieXNIQnJFVHJIdlRvKzViVG42?=
 =?utf-8?B?OXhmTGV4a1YxWVZTNDE2ZnRsQ1VyNlZMQ2lRVlZLcUhwRjlLdUp5RW5vYWZ5?=
 =?utf-8?Q?wczn1oqstMbHgyC5vfp3EhcD9s8xFiDmCO0Gejl?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6366.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd4a086-7450-40b7-3433-08d94a895963
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 07:46:41.8671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCCHz2PILpikGSfBOTN7bV92SFUJIzW8NuMCZ9DjnxQIC1pXudphRrmMhmOiiv9BzPsd/RPaM9Akq08G1oKJKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6267
X-Proofpoint-GUID: EqfKYfma2q70BNvP_LdETyM0COtnNVOy
X-Proofpoint-ORIG-GUID: EqfKYfma2q70BNvP_LdETyM0COtnNVOy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-19_02:2021-07-16,2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107190042
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyDQo+IFJvZWNrDQo+IFNlbnQ6
IEZyaWRheSwgSnVseSAxNiwgMjAyMSA1OjA0IFBNDQo+IFRvOiBTYSwgTnVubyA8TnVuby5TYUBh
bmFsb2cuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IGxpbnV4LWh3
bW9uQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IEplYW4g
RGVsdmFyZSA8amRlbHZhcmVAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDMv
Nl0gZHQtYmluZGluZ3M6IGF4aS1mYW4tY29udHJvbDogYWRkIHRhY2hvDQo+IHByb3BlcnRpZXMN
Cj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIDcvMTYvMjEgMTI6NDQgQU0sIFNhLCBOdW5vIHdy
b3RlOg0KPiBbIC4uLiBdDQo+ID4+DQo+ID4+IEFyZSB5b3Ugc3VyZSB5b3UgY2FuIGV2ZXIgZ2V0
IHRoaXMgc3RhYmxlID8gRWFjaCBmYW4gaGFzIGl0cyBvd24NCj4gPj4gcHJvcGVydGllcw0KPiA+
PiBhbmQgdG9sZXJhbmNlcy4gSWYgeW91IHJlcGxhY2UgYSBmYW4gaW4gYSBnaXZlbiBzeXN0ZW0s
IHlvdSBtaWdodCBnZXQNCj4gPj4gZGlmZmVyZW50IFJQTSBudW1iZXJzLiBUaGUgUlBNIHdpbGwg
ZGlmZmVyIHdpZGVseSBmcm9tIHN5c3RlbSB0bw0KPiA+PiBzeXN0ZW0NCj4gPj4gYW5kIGZyb20g
ZmFuIHRvIGZhbi4gQW55dGhpbmcgdGhhdCBhc3N1bWVzIGEgc3BlY2lmaWMgUlBNIGluDQo+ID4+
IGRldmljZXRyZWUNCj4gPj4gZGF0YSBzZWVtcyB0byBiZSBxdWl0ZSB2dWxuZXJhYmxlIHRvIGZh
aWx1cmVzLiBJIGhhdmUgZXhwZXJpZW5jZWQNCj4gdGhhdA0KPiA+PiByZWNlbnRseSB3aXRoIGEg
ZGlmZmVyZW50IGNoaXAgd2hpY2ggYWxzbyB0cmllcyB0byBjb3JyZWxhdGUgUlBNIGFuZA0KPiA+
PiBQV00NCj4gPj4gYW5kIGZhaWxzIHF1aXRlIG1pc2VyYWJseS4NCj4gPj4NCj4gPj4gSW4gbXkg
ZXhwZXJpZW5jZSwgYW55dGhpbmcgb3RoZXIgdGhhbiBtaW5pbXVtIGZhbiBzcGVlZCBpcyByZWFs
bHkNCj4gYQ0KPiA+PiByZWNpcGUNCj4gPj4gZm9yIGluc3RhYmlsaXR5IGFuZCBzcG9yYWRpYyBm
YWxzZSBmYWlsdXJlcy4gRXZlbiBzZXR0aW5nIGEgbWluaW11bQ0KPiBmYW4NCj4gPj4gc3BlZWQN
Cj4gPj4gaXMgdHJpY2t5IGJlY2F1c2UgaXQgZGVwZW5kcyBhIGxvdCBvbiB0aGUgZmFuLg0KPiA+
DQo+ID4gSSBzZWUgd2hhdCB5b3UgbWVhbi4gU28sIEkgaGFkIHRvIGdvIHRocm91Z2ggdGhpcyBw
cm9jZXNzIHdoZW4NCj4gdGVzdGluZw0KPiA+IHRoaXMgY2hhbmdlcyBiZWNhdXNlIHRoZSBmYW4g
SSdtIHVzaW5nIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBkZWZhdWx0DQo+IG9uZQ0KPiA+IHVzZWQg
dG8gZGV2ZWxvcCBhbmQgc3RhYmxpc2ggdGhlIGRlZmF1bHQgdmFsdWVzIGluIHRoZSBJUCBjb3Jl
LiBUaGUNCj4gY29yZQ0KPiANCj4gRXhhY3RseSBteSBwb2ludC4NCj4gDQo+ID4gcHJvdmlkZXMg
eW91IHdpdGggYSByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUgdGFjaG8gbWVhc3VyZW1lbnRz
DQo+IGluDQo+ID4gY2xvY2sgY3ljbGVzLiBZb3UgY2FuIHJlYWQgdGhhdCBmb3IgYWxsIHRoZSBQ
V00gcG9pbnRzIG9mIGludGVyZXN0DQo+ID4gKHdpdGggZGV2bWVtMiBmb3IgZXhhbXBsZSkgYW5k
IG1ha2UgeW91ciBvd24gImNhbGlicmF0aW9uIi4gSQ0KPiBhc3N1bWUNCj4gPiB0aGF0IHBlb3Bs
ZSBoYXZlIHRvIGdvIHRocm91Z2ggdGhpcyBwcm9jZXNzIGJlZm9yZSBwdXR0aW5nIHNvbWUNCj4g
dmFsdWVzDQo+ID4gaW4gdGhlIGRldmljZXRyZWUuIEknbSBhd2FyZSB0aGlzIGlzIG5vdCB0aGUg
bmVhdGVzdCBwcm9jZXNzIGJ1dCBJDQo+IGd1ZXNzIGl0J3MNCj4gPiBhY2NlcHRhYmxlLi4uDQo+
ID4NCj4gDQo+IERvIHlvdSByZWFsbHkgZXhwZWN0IGV2ZXJ5b25lIHVzaW5nIGEgc3lzdGVtIHdp
dGggdGhpcyBjaGlwIHRvIGdvDQo+IHRocm91Z2gNCj4gdGhpcyBwcm9jZXNzIGFuZCB1cGRhdGUg
aXRzIGRldmljZXRyZWUgY29uZmlndXJhdGlvbiwgYW5kIHRoZW4gcmVwZWF0IGl0DQo+IHdoZW5l
dmVyIGEgZmFuIGlzIGNoYW5nZWQgPyBHaXZlbiBob3cgZHluYW1pYyB0aGlzIGlzLCBJIHJlYWxs
eSB3b25kZXINCj4gaWYgdGhhdCBpbmZvcm1hdGlvbiBzaG91bGQgYmUgaW4gZGV2aWNldHJlZSBp
biB0aGUgZmlyc3QgcGxhY2UuDQo+IA0KDQpNeSBuYWl2ZSBhc3N1bXB0aW9uIHdhcyB0aGF0IHdl
IHdvdWxkIG9ubHkgZG8gdGhpcyB3b3JrIGF0IGV2YWx1YXRpb24NCnRpbWUuIEFmdGVyIHRoYXQg
YW5kIGFmdGVyIHdlIHNldHRsZWQgd2l0aCBhIGZhbiBmb3Igc29tZSBzeXN0ZW0sIEkgZXhwZWN0
ZWQNCnRoYXQgY2hhbmdpbmcgdG8gYSBkaWZmZXJlbnQgZmFuIGlzIG5vdCB0aGF0IGxpa2VseS4g
RnJvbSB5b3VyIGlucHV0cywgSSBndWVzcw0KdGhpcyBpcyBub3QgcmVhbGx5IHRoZSBjYXNlIHdo
aWNoIG1ha2VzIHRoaXMgcHJvY2VzcyBtb3JlIGN1bWJlcnNvbWUgKGFzIGl0DQphbHNvIGltcGxp
ZXMgcmVjb21waWxpbmcgdGhlIGRldmljZXRyZWUgZm9yIHlvdXIgc3lzdGVtKS4NCg0KSG93ZXZl
ciwgZXZlbiBpZiB3ZSBleHBvcnQgdGhlc2UgYXMgcnVudGltZSBwYXJhbWV0ZXJzLCBzZXJ2aWNl
cy9kYWVtb25zDQp3aWxsIGFsc28gaGF2ZSBhbiBoYXJkIHRpbWUgZG9pbmcgdGhpcyAiY2FsaWJy
YXRpb24iIGluIGEgZHluYW1pYyB3YXkuIFRoZSByZWFzb24NCmlzIGJlY2F1c2UgdGhlIHdheSB0
aGUgY29udHJvbGxlciB3b3JrcyBpcyB0aGF0IGl0IG9ubHkgYWNjZXB0cyBhIG5ldyBQV00NCnJl
cXVlc3QgaWYgaXQgaXMgYW4gaGlnaGVyIHZhbHVlIHRoYW4gd2hhdGV2ZXIgdGhlIEhXIGhhcyBh
dCB0aGF0IG1vbWVudC4gVGh1cywNCmdvaW5nIHRocm91Z2ggdGhlIGNhbGlicmF0aW9uIHBvaW50
cyBtaWdodCBiZSB2ZXJ5IGN1bWJlcnNvbWUuIEkgY2FuIHNlZSBzb21lDQp3YXlzIG9mIGhhbmRs
aW5nIHRoaXMgdGhvdWdoIGJ1dCBub3QgdmVyeSBuZWF0Li4uDQoNClNpbmNlIHRoaXMgaXMgYSBG
UEdBIGNvcmUsIHdlIG1pZ2h0IGhhdmUgc29tZSBmbGV4aWJpbGl0eSBoZXJlLiBTb21ldGhpbmcg
dGhhdA0KY2FtZSB0byBteSBtaW5kIHdvdWxkIGJlIHRvIGhhdmUgYSBjYWxpYnJhdGlvbiBtb2Rl
IGluIHRoZSBIVyB0aGF0IHdvdWxkDQphbGxvdyB1cyB0byBmcmVlbHkgY29udHJvbCB0aGUgUFdN
IHZhbHVlcy4gSW4gdGhhdCB3YXkgd2UgY291bGQgZ28gZnJlZWx5IG92ZXINCnRoZSBjYWxpYnJh
dGlvbiBwb2ludHMuIEkgZ3Vlc3MsIGZvciBzYWZldHkgcmVhc29ucywgdGhpcyBjYWxpYnJhdGlv
biBtb2RlIHdvdWxkDQpleHBpcmUgYWZ0ZXIgc29tZSByZWFzb25hYmxlIHRpbWUgKHRoYXQgZ2l2
ZSB1cyBlbm91Z2ggdGltZSBmb3IgZG9pbmcgdGhlIHdob2xlDQp0aGluZykuIFRoZSBiZXN0IHBs
YWNlIGZvciBkb2luZyB0aGUgY2FsaWJyYXRpb24sIEkgZ3Vlc3MgaXQgd291bGQgYmUgZGlyZWN0
bHkgaW4gdGhlDQpkcml2ZXIgc2luY2Ugd2UgZG8gcmVjZWl2ZSB0aGUgaW50ZXJydXB0cyBhYm91
dCBuZXcgdGFjaG8gbWVhc3VyZW1lbnRzIG1ha2luZw0KdGhpbmdzIGVhc2llciB0byBzeW5jIGFu
ZCBoYW5kbGUuIEhvd2V2ZXIsIGdpdmVuIHRoZSB0aW1lIHRoYXQgdGFrZXMgZm9yIGEgbmV3DQpQ
V00gdG8gc2V0dGxlICsgbmV3IHRhY2hvIG1lYXN1cmVtZW50cywgaXQgd291bGQgbm90IGJlIHZl
cnkgYWNjZXB0YWJsZSB0byBkbyB0aGlzIA0KZHVyaW5nIHByb2JlIHdoaWNoIGlzIGRlZmluaXRl
bHkgYWxzbyBub3QgaWRlYWwgKHdlIGNvdWxkIGRlZmVyIHRoaXMgdG8gYSB3b3JrZXIvdGltZXIp
Lg0KDQpJJ20gbm90IHN1cmUgaWYgdGhlIGFib3ZlIG1ha2VzIG11Y2ggc2Vuc2UgdG8geW91IGFu
ZCBpdCBhbHNvIGRlcGVuZHMgb24gdGhlIEhXDQpndXlzIGJlaW5nIG9uIGJvYXJkIHdpdGggdGhp
cyBtZWNoYW5pc20uDQoNCi0gTnVubyBTw6ENCg==
