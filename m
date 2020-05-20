Return-Path: <SRS0=CmOj=7C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A1AC433E2
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 May 2020 09:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAED220888
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 May 2020 09:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com header.i=@maximintegrated.onmicrosoft.com header.b="dGuFAQNY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgETJsc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 May 2020 05:48:32 -0400
Received: from mail-dm6nam11on2132.outbound.protection.outlook.com ([40.107.223.132]:33473
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726596AbgETJsb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 May 2020 05:48:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic+U1j/GOfhA1qkPrOVgmyzGduDR/djem/j42pFQ20bBTFfvT5KrlUqNN9ngfMK92xSyJignxfz5DrsTfkJMtXryI2zKOMyjQB02RVlZypQN3tST2743IzkVRCjaCtsNToh+v1sIwaUVvicMIImKEyEEh6VVUIuzv1t6PS98vA2bk44S/1i+jtjU1xQGbmGENQ5YLru5Vx8/SNDVnIL5hiExXboWFphWc2vecmatx1wC0I2cSRb7CQGIpb+/I/+ILItRAFAjd57556cDJeSh/O9SW72WfweEx8kuMQkNhWug+9rKqacU/Z5NIaWubymCLd7Wj6SFPOkOJpWduk4EXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i79WQiPWFDKPvmILbh0xdKz/JLOLtpX/0NCWM521mXA=;
 b=F4phGmm5Q+JtVibKbmjsuF0kTQcU+cwMLfZtAkhspgGVwDTMBb8DtLZnr+yVz51r3SlQTZtCEBfUdQwMCBQl9SEtzJTU0I1CDQRn94Y7fMxm+8oRFBznpYEvkJQguc3il7cEJqud5yRz8HzSIpnJiP9WYqmyh7dNTvhrXCdLfIylcKM5wZVvRRGNeS6Buj15/3ukRbT/CS84XMOyqraIv44CjZnD6KWKn4r9y7o9ei76gxQK5yHb/hGtk3FKTKReaAtF3q156l1VQbCDZeolCHAwc/VMA2yfYx07sZ+XlzQpBqzs4aviFaCGjs2oSaMe1MfQ71pK4xrvD+3OanTByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i79WQiPWFDKPvmILbh0xdKz/JLOLtpX/0NCWM521mXA=;
 b=dGuFAQNYTFOrTtTiLd94wVddTdYCnMtUauWs/V5jj8P9tjqMKvU+0JAHgnPYeEHtXKj0GuD8qtDYR1fp7HGaKLM58zFPJJdP27XYkKBPouit91qrDH7TLNdteJJmGdfZ/9yhTgYz0Vs4t41rHBZLTjbnyPH27MbSvGvBCqIvnPA=
Received: from MWHPR11MB1661.namprd11.prod.outlook.com (2603:10b6:301:b::16)
 by MWHPR11MB1680.namprd11.prod.outlook.com (2603:10b6:301:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 20 May
 2020 09:48:28 +0000
Received: from MWHPR11MB1661.namprd11.prod.outlook.com
 ([fe80::6c65:6b11:a837:e9b1]) by MWHPR11MB1661.namprd11.prod.outlook.com
 ([fe80::6c65:6b11:a837:e9b1%10]) with mapi id 15.20.3021.020; Wed, 20 May
 2020 09:48:27 +0000
From:   Ugur Usug <Ugur.Usug@maximintegrated.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH] MAX20730 updates
Thread-Topic: [PATCH] MAX20730 updates
Thread-Index: AdYuin/tT+h7Pz3+TAuMz9gNqU4ZRQ==
Date:   Wed, 20 May 2020 09:48:27 +0000
Message-ID: <MWHPR11MB16617BBD8A8A85FCF99B909FFDB60@MWHPR11MB1661.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [212.125.27.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 81bb58c0-70f3-4c9f-79cd-08d7fca2f269
x-ms-traffictypediagnostic: MWHPR11MB1680:
x-microsoft-antispam-prvs: <MWHPR11MB16809DB21FC33A7CB99F4806FDB60@MWHPR11MB1680.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rNFAH5VQUMnqq0zoSUvgGqwHEP9mz/VoEsrNIykku9wKPUUMbSw8RU/rhO84DZNfh/FyuYBAXNowK43T2hHkppBk3UGOB4B8rpQsSko0n/CDJT5z3Oy/fgcLBnASinK1ya+pjrAfmzdU9I+nm16EMhVVXftohUwTZsNY0D4wcOXnGuhsZCJSToYhqYZD5MggD3s1Lm5PgTTeOpHVVB8rwjqqmzgPuJ4Nl+6d7sR4p7/vbeNQDewigjboNfdl4hfOOwOMD2EZ2PlCL9zBDgwSsBSflSqOzRazozImu267i5F9OoBFUgurzfSmwZTzAKCUpVIOp0RRagD0J48zNqHdDHL0yB9heie3/qNHAU2eWGJy1JaW+bMMMZ6VDl/WCBuKELruJDWbjXnTNEjfHBq+mW213tb2KjLfkrG2bzy+2ONFqHJ0Oo+CIdoWwQ9GUFh7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1661.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(8936002)(8676002)(33656002)(71200400001)(9686003)(6506007)(7696005)(55016002)(52536014)(2906002)(86362001)(5660300002)(4744005)(4326008)(186003)(26005)(6916009)(66476007)(66446008)(478600001)(66556008)(66946007)(76116006)(316002)(15650500001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: xi1tUmNtb57h40UYwkAgkE0rJ0TZFo6J4NqEnpQUFsKLkLPA21CGp8C74cSfMOV4WQbpNR7jBBvZl7yamMG19M0WsU6nJ/Jt98PZZEr7rBPjwv1ex6s84Hob+F86iDXCX6MoOiQN3UZ0aPrI5cuPbktoVI6WlSHGeUn5bMprdgiWWlmHXMLqMbRBISOH60g/N92uRs6ZgzLnZ4Tu8X9sFlrSfFdlYEEurHGXuRchtkZRUln9e5vYmMwU2R49CM20UJumQY61+uB8Ko3Gtj/FhktaFWqOMr1frCJ+ABYRAsMFqnFiBzizfm37R8LpFwDA0pdv4c4CP+QR2M17lDGn+PVKKOHlWp8SZRMTDLul2GTn8Aj698U5w98g6ajGzmztkqCnTaR07jgf8k2nfsPMjpV8qeiEICPd8fR/2/wdTnjk9Ce/NfViBphMlllBmaTXy6Y4MsgzXGJLe2qzK5gvknoaRjaOQkTwLH0/H3F87pejZ9Usns/BAWGFl+yAezte
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bb58c0-70f3-4c9f-79cd-08d7fca2f269
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 09:48:27.6605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oEmgm/o8aHXzG2nvJGleho+x6TKRWeLPdK6V/iYSOlTZcFqfCLZif7GtYU9KkplPeT6BP5RiAbh/TQt1JHWpSnFGhi30aQ2JBL4dU43hs+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1680
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

I have a driver update for the existing MAX20730. Upon Google request, I ad=
ded all other (not covered) device specific features (VOUT_MIN/DEVSET1/DEVS=
ET2) via debugfs interface to the existing driver. I also add MAX20710 supp=
ort which was a trivial job. I finished testing the driver on MAX20730. Now=
 I am testing it on MAX20743, MAX20734 and MAX20710. How can we proceed? I =
can supply more details to you as well.

Thanks,
Ugur
