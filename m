Return-Path: <SRS0=HSB5=QZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46B0C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 20:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78C32217F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 20:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="boFvv1Ub"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfBRUHh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Feb 2019 15:07:37 -0500
Received: from mail-eopbgr130080.outbound.protection.outlook.com ([40.107.13.80]:2894
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725308AbfBRUHh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Feb 2019 15:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDFvT0HmC3Oy9X97M0Fl0INYBBcvHaukdZGzj/6+b+c=;
 b=boFvv1UbSDaPksQo5FmoKg3IknmmLzn46P8twOBJgHLEF24Sx4aHJImLX7C4VWtK1imDI71tKlAbgS3VCr37lTJZZ6g11f1xLnGHVXlxnFKVd4UGHEmq/9lTz8L8GgUU/cyfs03dM5s0/F6Ad1KddXr69coVwAuDWNhB7lMATRA=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5800.eurprd05.prod.outlook.com (20.178.94.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Mon, 18 Feb 2019 20:07:33 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::195d:8821:cbf3:ca92]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::195d:8821:cbf3:ca92%5]) with mapi id 15.20.1622.018; Mon, 18 Feb 2019
 20:07:33 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: query for hwmon: (mlxreg-fan) patch
Thread-Topic: query for hwmon: (mlxreg-fan) patch
Thread-Index: AdTHxJ4hNo4BJOqfQpaqZKIVL1K+ZA==
Date:   Mon, 18 Feb 2019 20:07:32 +0000
Message-ID: <AM6PR05MB522493FB8E567BFFFE1A95EDA2630@AM6PR05MB5224.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da4412ad-57f2-4733-d298-08d695dcb7ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM6PR05MB5800;
x-ms-traffictypediagnostic: AM6PR05MB5800:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1;AM6PR05MB5800;23:vZ7Cua0oliOykx2iq07p8O8Q0/l/REalxrE8YygT7?=
 =?us-ascii?Q?dq+Un3G+Gy9HxfqH4juLZGgTzGmBLocVOpHRfP/H/X0wyHISoCikHv/LTZZn?=
 =?us-ascii?Q?1Qpc+rVFlgPnfK0k1JpCJUKMQClBdA8UBAr1K6sTG6xjRqbI1ztyCYr093yw?=
 =?us-ascii?Q?iwYtfZAgrsGU1vxUyeFDUfufCD1y+BWbnjfJ55O8Wq/YhDpqFtO6k5vniHBT?=
 =?us-ascii?Q?i690XGeuYPHTwxT9wIDSHlfjvw6mttTwU7o8qMXrXAAUTEmZ99QvRazOPOXA?=
 =?us-ascii?Q?voy5PFiz/TArvTGzlBWpUIsXm79LOo6xC1FvBt2F+msLOzmdlNJhOfK3r2Bt?=
 =?us-ascii?Q?yg+PAkyKKrTDcjr2jaCsXGudjcBu9bnSdhIQIyt7uMqz6D4j4+gVZvR65SBF?=
 =?us-ascii?Q?St6bIBuQEXgt6bc5JurFo5++V8qysxEULaAA0VGP7atyLUHJVmtwsA9ngbn4?=
 =?us-ascii?Q?5XNO2zPuAva0EbMavtAwC5I8fEb+gqq05ROqrZf/9AzEsD7dcOHLuwmJLK2r?=
 =?us-ascii?Q?WjQNHF5fnQsQj5R28hdyFwRVg8KDP/J4iWX+61mdv7QzNr56clllGBGq9IvK?=
 =?us-ascii?Q?i0Bng7BdHZpnuMiOO7xHdRiS6tPoQ4fNSXXkud77ZxZ76LRm1YXkJs7siWr5?=
 =?us-ascii?Q?SmxTyf/GitxSrUsOC5C1r8roby0jRbYLQkBRuS/pjvpS9tu0PCltGU2srPlr?=
 =?us-ascii?Q?juoJvVVlRpkMLVqd7u5hOOOCHf21lRrVceKQIwoFTzV5X8dRLzBtY2T2PbBZ?=
 =?us-ascii?Q?0oCy8q8F3wJ+XK6DbQy2MgTVKwJ+2BUyKGHLXQev+FmCCHrleLLF7eD03drr?=
 =?us-ascii?Q?vFct93zXTB5M5L2hhW0dKz0pu3aHZk9vmeuS/6Yu+BVISrB8J+Ur+70TnEDx?=
 =?us-ascii?Q?AGtzw2XPx/cSPDF35RN4DekPd/nwD2YF3nMVfnimEbjfMDd3rWPt4flBgS8U?=
 =?us-ascii?Q?GZZTINxUIklim8HiBx+0p741qkOPgr1/rGqnEB3oeyfulsOtb9L5kp9LEnyk?=
 =?us-ascii?Q?ckdRHcXx2OXodgifWDWtUV9bc04YGhSZyzDP4/mlAo0fISQZ19ZA4wr62BSZ?=
 =?us-ascii?Q?t5CCxsNvAAqAl1lQ1K7Yu7V4gdVzqD7SFO3TfOjnDDGb/zNSRiPzSjMdd2i3?=
 =?us-ascii?Q?kefv81/odzoqDANaBUKuOiB3rMV5SUfc2z45TDDM9hJDoG8FvqPn/2HAsMDz?=
 =?us-ascii?Q?wszpHEZNB8IW9SztqI/kOMSGMijj65e7NGd?=
x-microsoft-antispam-prvs: <AM6PR05MB58006DC3A526AAB5AA688C10A2630@AM6PR05MB5800.eurprd05.prod.outlook.com>
x-forefront-prvs: 09525C61DB
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(396003)(366004)(136003)(376002)(346002)(199004)(189003)(5640700003)(5660300002)(102836004)(4744005)(6506007)(256004)(74316002)(6116002)(305945005)(316002)(3846002)(7736002)(26005)(55016002)(99286004)(478600001)(966005)(86362001)(4326008)(6306002)(8936002)(186003)(106356001)(81156014)(2906002)(66066001)(476003)(68736007)(25786009)(486006)(2501003)(97736004)(2351001)(6916009)(8676002)(105586002)(6436002)(71190400001)(71200400001)(53936002)(7696005)(33656002)(1730700003)(81166006)(14454004)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5800;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GIeeXGCSR7WCrODXWTZd427of4/AwlYxpSCv9jg5U7kvsNPgJorIMIO7PXiPMtABDabeH9ZMCnWioxlBSfWp3Zc7RUcoD3Fe/AnxzX4CbPT1mcGNWJAaNWS/f4ZMoscKWHhe6A0hPA0FJXLeacGLU0zX2Z2bbYrzZ/A0wvR1yrNav/EyD2TP9apqAlmhzboCRsGmeGMxzBe/4uFTDg6ME2iUwALywqNDr5PpsL1xPFPBIiY1uezOPr+Tcd6AuXV5B2CNjyF4IePTN9o1ebAA5LV73IfH6rKHo+WN8cIw8YkE9jzFyj/gTQJa7mazvj544WvaH1ZMMXBmanU+mw68V2GK2sVS6krHRHeDCPoSzhnsYy/eepYGIIOvKzvUZr2zllaZJVUwaAlYDIgc5ooY4xgQ6FztT2tdqWP8ee5VOPM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4412ad-57f2-4733-d298-08d695dcb7ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2019 20:07:32.9873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5800
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

I would like to ask you about the way of sending the patch for
drivers/hwmon/mlxreg-fan.c.

This patch makes use of new "capability" register, but required commit
"platform_data/mlxreg: Add capability field to core platform data"
from platform for-next branch:
http://git.infradead.org/linux-platform-drivers-x86.git/blobdiff/9b28aa1d0e=
ae1be1016c8f4ba504545caff01da3..946e4e02b11889cb161b15ff4712a8ba21a50eb6:/i=
nclude/linux/platform_data/mlxreg.h

Is it possibly to send a patch with such dependency? Or I should wait until
"platform_data/mlxreg: Add capability field to core platform data" is got
to upstream?

Thanks,
Vadim.
