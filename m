Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2A5C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 13:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239536AbiEQNRv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 09:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbiEQNRt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 09:17:49 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50106.outbound.protection.outlook.com [40.107.5.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163563FBD0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 06:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnlLOfjIVk834IDEvO36wRkrMqYIW8zJQ36ZHGpl83xPRAT/7MF4bsoR42B8BMmpXwlFKjkkqdbHVOmy+NAi6klB4WvkFe3dgvt1fJitoii3dMRVLvqb16mt+i1gdjQODH7zdh+88pXcnk+PabtLO+ycSIbr5VMERDJAraU9Ms5/mYTQuz736PklulaoD38bFlO6ecMPa9yFexoYtv4zUnjoxfdv3URkztBwC8J+IWBMqX0LUe2PcO3u4um2uc1gtpFDrKWDF8ZBCNvUty6YYYe9t0EChxXjWNJa7FMhxmXGnYAbexil9/5731LhymDbrvX3PgpTNICggxWaVnRM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtWgjT8Vze8ofI98ZhbN5eRbk/eKD6czPPJc/YGhUHU=;
 b=aq1yAD1UrKTPZGjgsEE70aeibI31VlKB8dXhr7Vdx7l50FLMem4EUN2n3yn0BLcaQfb3es0nTfDfNQVz5WPIbZ0Y8bqptvbslzUPDQveKLaWQRm7Yu9NAzNtpAAkud+hCKUYHL9wS0mLkb6cC+ZF6TiboAPSx9U7cq0I2O2cwUg10S4NNfFZbupAM49a5rt2lKPm1SQI80mzFZRXKcB3DoiLujp098BhgLnmxYQ1zoEFSN39x/qhmWNS9j1+Syt79WruLi/Gs7kwAPnA8UX5vMYWCaw8nAvxqSv3WWlu3V59sg33YhUwl2WXV8HaGMC6f71zJ0cE5ah/E2sgtQCriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtWgjT8Vze8ofI98ZhbN5eRbk/eKD6czPPJc/YGhUHU=;
 b=yeInpu8fWpnwM0mp4+ikL+AeY8tj3mHmZDlPTpiXicLNToiG/zO/Eo4JLfqswlru3hphkYOzG5PUeLprLSxtcnRBqpaIo/lPDYqKMsbaWExUBlY587ZHX/Uy1WF9SuIfetMkts29IqtAfiN+L1Z+UttsJVof92R/JW4tl4ArTBiB4+sjK6UTlnL3JBJ6K7sHBltSvZ+fFHXiLVEilEisLyOL960RPb36/AaBF7z7HQXD4YIrqNKjuCb2BCJ1ieggwmu3NdGfSCqTKHEhbD/WwNQWJDf41Bi2bWAPH4e5hHXuwrBeGNnVrfNEg+AM7KfUGpLp1cMgq9faSV31pu1MIw==
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com (2603:10a6:10:218::16)
 by DB9PR06MB8090.eurprd06.prod.outlook.com (2603:10a6:10:297::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 13:17:45 +0000
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4]) by DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4%9]) with mapi id 15.20.5273.013; Tue, 17 May 2022
 13:17:45 +0000
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [v3 3/3] hwmon: (lm90) enable extended range according to DTS
 node
Thread-Topic: [v3 3/3] hwmon: (lm90) enable extended range according to DTS
 node
Thread-Index: AQHYacPKZS5W/JLDBEWy4am7ds58Ka0jBwMAgAAFEeA=
Date:   Tue, 17 May 2022 13:17:45 +0000
Message-ID: <DB9PR06MB7289D017682F1085A1ECF173F7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
References: <20220517075738.16885-1-holger.brunck@hitachienergy.com>
 <20220517125440.GA3575490@roeck-us.net>
In-Reply-To: <20220517125440.GA3575490@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64459c51-d935-4833-182a-08da3807a1c5
x-ms-traffictypediagnostic: DB9PR06MB8090:EE_
x-microsoft-antispam-prvs: <DB9PR06MB80904BCD389A5BB29CE6264AF7CE9@DB9PR06MB8090.eurprd06.prod.outlook.com>
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NGgHNwZs8Ke8L4k8ZOPrm0t+fuT62EF7AQihw2JnEh+uV5wVKw187QM9r+c9X5hYackMovpMIHjrJ/LxoyXyZ7SyivLYWQ8V9FV8l6b5fO1IHOiiehw3N1vDQEY0PZUoA/ZQ0jY+GReQffvvEkZtC1ZRxaHBxZjhrI5stSPwa6fgzTChV5CmfpPFh/MZs+cLG8YM4hCyPM9i2CDrBeT18QPajNHef/jXaRouoi6uiy9EDO2VHFG1k0CiPxKWuuK6fMqYHzjHD7x/ZtCbzVpO0ZfHcU3Jpl0K0bCR1H5h9RoQ+5af4JKWHybgyzWMGPY4PYROtSk5MXPdzoxeAffYw5ElyFtRtEXjmFXk9mOsZ0Q1rQVPZ4KWygMyOCk6dfnE2eToisRA0IX7PSfx1GVMnmMaRS2iILpOFBL2KrSx1vZrWEhjcqmA4HZgXx29rfAEk2lHsL86R+QmgfyqfxFx4hfvPVEgUS7qpBJ0q/SPl6wI6Z5Sd972IXIYPyrmooZwzCHHr3updB/GpQhS71ZSoA5s9kB4YY7/jNDTlSeJiqarrJuhJxI3fjbh2TyndXybIpdAuuwk58AgjVgPZLTxZgbHYWMTrf8XYRSKCyBHKPjEMcKYEbQ2EB5Lh6RzagCMLndP7GE5OwxSW/E2sVu0qtN49kR68cQIn435iqtNvTI/JMphDo09wQnoDimMWzAdtmBjNgWhu/pGFiau5Gi8gg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7289.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(5660300002)(508600001)(44832011)(4744005)(71200400001)(82960400001)(38100700002)(38070700005)(33656002)(6916009)(54906003)(316002)(64756008)(66446008)(66556008)(66946007)(52536014)(8936002)(4326008)(8676002)(7696005)(83380400001)(86362001)(26005)(6506007)(9686003)(186003)(122000001)(66476007)(76116006)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MyAih4nfsihrRH/jk0NMRdxia/xJCvFONOeFyGyR/bJOiKpKTxXPqM5UjFYX?=
 =?us-ascii?Q?MtdPe09LX9acYvEoCYrKBqKU7M8qtoheXHVOc68haEiQWCCtN+hz5tBCejmV?=
 =?us-ascii?Q?OZdnpypWgIEwbnE5/nW+7YoyTOrS7aRynl0O1n2MqxSL/QZzPPyL/Nm3Lm3A?=
 =?us-ascii?Q?MLOMH9w82EBQgNIraeoI55auzqndXKsuHCZRkNZF+krLapHV3JlgHu5tEe4U?=
 =?us-ascii?Q?ed9NPGTt1q3Mc7tZiF8CgSW3O3F9QvEAxUQ8qSZCYic2VZ8/awP9R7Ajgpk5?=
 =?us-ascii?Q?8r2tdkvJ7MkAF4ba4c9ZG/mIdxhwn2Qb4ACxrsoDYtqWB/Z/x+/yGiYdDYbz?=
 =?us-ascii?Q?rvRSpcgjfUAmneAEOTl0fsIKJuHv9f9ipeZlgRYmi/Zb4FZCN1SflokZUmaC?=
 =?us-ascii?Q?rbmk+XVh3+RXsl6+kEzn7B/yogBtgklAnr6iSc46Ce3CpXuJIYHqJBIlgw0O?=
 =?us-ascii?Q?ro6V8f9Nsub7X4gFrSVdlQrKIQhT3LcmB9XLKijXJJvMauOA/BkVCUGXWO7z?=
 =?us-ascii?Q?+G84SwT+d65ydXgVJEEtOajC+0oIaBR18TXtKsLiZKbdnrYVPD4FM1aa0b9m?=
 =?us-ascii?Q?dxurxPBtBLEga/aWsVqc7T5RJ6aypUfDYNU8xlSeu0LLtTOOBkRC6k6XSTW2?=
 =?us-ascii?Q?3wP8/Azvbw1bBz1Ri4v3/BF2Eph11cIdbVtxkkReta5foXloVvZx+H/R3H+5?=
 =?us-ascii?Q?X4B/pvOw/wNRfhQ6yPvux8bFYmf+Pq1RBAmqNgrzeM4LCNkgkd2qrgQhUijB?=
 =?us-ascii?Q?WU9TiKjmVacxmefh1BjCpalH185YHo2Sr0yyvLmizXdIGuAuoBn5fO8QqYCz?=
 =?us-ascii?Q?ZXnSOFPtcHpjX2PZxX4CHqnyxYUwdRteHD6DV1+mlmBmIOyyXYWfVN4AH86h?=
 =?us-ascii?Q?lnMk5EPfh8yziZ8PWL46YcfNAo4yf9+ejOdhTa5y0TDpiFtFoXtH8RZwZ0HK?=
 =?us-ascii?Q?O9cjUncrUNNRt5p8NZ0Zuayd/AmCHSAHhabP6X3stcptM3CPNi3XBOdohOkN?=
 =?us-ascii?Q?0cpNUQxeDDL8ophO8cuSlbekzE8YyV5YNpGevI2qKjuC7dKxoXbB4NxtUxFA?=
 =?us-ascii?Q?FnceReL3lMiZEqa9ral81NgSM+TBwirthe1eHSkODhpOrT94sdwmf9X082YQ?=
 =?us-ascii?Q?i5xr45cFjKog2aJgoY56yw0zDYmmfxb9W7StJZc9RiRx5rAm/wbOPkr25F37?=
 =?us-ascii?Q?zfKpFAF1upQU3ov090TEQYHbl/h89YpT20qR3fsoVNppMg/UkiPnJtQtft4P?=
 =?us-ascii?Q?y9++vDZ83pz/rdwx61v646DOzsMVfUl1tse7SJve1+ZD73UqwGGU8NpTpNQp?=
 =?us-ascii?Q?+WE7Il3XZb+igISaLFS7sw5ZtoJWKg935zGYiCwze8HDMyj2QLOyFKuItHZB?=
 =?us-ascii?Q?fClv3oc6bYuhhC0gtIRwyDyc3yicJb57TAXC7YX4DMhaHmnRFWa5RNcOLjGo?=
 =?us-ascii?Q?JxkblXu7oe6Kh5NlpT/E3Qa2sRrIpdAqqLVKiey2V39x4zJzKFzbSJvE32Uj?=
 =?us-ascii?Q?YlfWa+qOiIcYcBYT7HW+xttpcGU8J833u3lKZrnUpUunD8jfq/i5VZQerwPz?=
 =?us-ascii?Q?L+cW8jLk2x6aYfYyXR0laSKLO1HTkDoXY0KoyUvkGucIltX8RtmdBhcR8zdX?=
 =?us-ascii?Q?u8LWmxK5ubrFUJ4VC7K+AuA6VCvEgh3Ei0afogAqYJYVsLZxcXv6zpgO7SaD?=
 =?us-ascii?Q?eyOlLppw6K42hnHdOscQrevErCRtldpR/xLZv9Co+XN1rAlSMI9yRuv9zms6?=
 =?us-ascii?Q?NAq8hFUJFUmB7dKL29PLjiDP14CWVtM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7289.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64459c51-d935-4833-182a-08da3807a1c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 13:17:45.5852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ia8yYRpyWKrSrmwPO8e9w/QJyzcI66SHm35V//Yes7is23fir5UhUbn2WyuiKaYL9PNvSddtiLTeb55f4ekpp9yiWPiExLZhvKr5nxGZ9Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8090
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> On Tue, May 17, 2022 at 09:57:38AM +0200, Holger Brunck wrote:
> > Some lm90 compatible devices can operate in a extended temperature
> mode.
> > This feature is now enabled if the property is set in the
> > corresponding device tree node.
> >
> > Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
>=20
> For my reference:
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>=20

thanks. As you now already applied 1/3 and I have to update 2/3 should
I send a v4 with the missing two patches, even if this one is reviewed?
Or should I only send a v4 for 2/3 and if this is applied you apply this
one?

Best regards
Holger

