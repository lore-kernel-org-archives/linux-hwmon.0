Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842D2C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 06:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236432AbiEQG1z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 02:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238888AbiEQG1r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 02:27:47 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150101.outbound.protection.outlook.com [40.107.15.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFF43FD82
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2022 23:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdcMHnWWiI9SwvBvtfwOI4WGROJBNBkr4SiEUIOC4xYWpgk7yMYnKCL6fLFaSjMiIbkl/IWxk8GIMATBiqX//ksvfPeC5Vdz9qo2JR0pMFApZh/9UWJgEHd8XAUrftho50kUjW5eZQfvDefPVKle/CFH3/E2wrTrp4daBjvx1XhID6bvh1SUKIdwi9dz7fZb5bhAvg2WoS6vA4jnxTCyXCot7dH4C/K2j/VTwnEYevyYlVG5cKNfgDWxyijAOiXqeOkkyewxr/13KwjehKFR2NZEbooumd48wVrSWf4tM/gT5x9peLHvSsbmXz4cJYHqwI2TqoUAukzke3jjKbXubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcRfG8jtare7DEWUQJdu/80dmXnAKn3ddAvgh2NPR7k=;
 b=LQUg/3ua+PBgfO9qMIBWf5w9XHA8tFxMG6rnpK6Ya7wNtZ+X38CzVjWWRxbGZ4Yvaq0FcGXBfEzAkZhlH412uWqG6LNQOV/Ovd/yVaA38Ojv/ncq9ZzWEq6entomLWo+GmvGFJ2/EL5oTrk73q1tDvhmnpt13Y3qIwnpbspei4+lWLz5Us7B9JAVEjD//cZ+41s3OKFQhgA6hcZjMZVxzY3kn4dAMYlDukRUAVQ1+/N/mbqn37bDvwuOAxXDeH1JKTuXFBgoHgx2gUtv9iQBKWgYsO8gCtBZK7ihCmkx2b/x5S34Lj+WzrZi/C/tU3WlLTYuSUZGGzrxqPA0b47ReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcRfG8jtare7DEWUQJdu/80dmXnAKn3ddAvgh2NPR7k=;
 b=aG0DP8vfUMk8NN6JEr5VyxlEt3khWIPiDyRFvRWb2Q9HRu+orVfyIH6KRg/b/JO3brCj5xtgHEpmGZYpkh6IzzmKm8/bq9afk7JOzps5V/A0iIogTDx/Z5T7G2NeC2UCjcaqWdn0eOCP9pZtRwyGnT1V9joixatWd6p96FuSIc0iZymA1cEyeUy15h0biOUMwY68DUw+HXNKhtRaqioVmufh77aYjowjEH5y/QE7SLHq5k1n96XXaPuQ1w/VJHRSxy+UC+m7uxnhF4P4lF2fIgaqWfwCvD9dUqP/Bt465onw+FYBclcbX0g0yZhCN9U5gir4cPfolOUUWPabzPi1Jw==
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com (2603:10a6:10:218::16)
 by AM8PR06MB7746.eurprd06.prod.outlook.com (2603:10a6:20b:36a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 06:27:42 +0000
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4]) by DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4%9]) with mapi id 15.20.5273.013; Tue, 17 May 2022
 06:27:42 +0000
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: RE: [v2 2/2] driver/hwmon/lm90: enable extended range according to
 DTS node
Thread-Topic: [v2 2/2] driver/hwmon/lm90: enable extended range according to
 DTS node
Thread-Index: AQHYZEU3R3ThQh9j2kG9BRADVG6ii60Y5tMAgAkL/OCAAAxsAIAApRJQ
Date:   Tue, 17 May 2022 06:27:42 +0000
Message-ID: <DB9PR06MB7289D39850290F93698E39DDF7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <20220510080900.22758-2-holger.brunck@hitachienergy.com>
 <692d5ac7-840f-49da-c06a-c2b0e0e6cf8c@roeck-us.net>
 <DB9PR06MB7289A0505D42DC7151BD8517F7CF9@DB9PR06MB7289.eurprd06.prod.outlook.com>
 <20220516203114.GA4080547@roeck-us.net>
In-Reply-To: <20220516203114.GA4080547@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3ec2ad6-a5e3-4420-8376-08da37ce5924
x-ms-traffictypediagnostic: AM8PR06MB7746:EE_
x-microsoft-antispam-prvs: <AM8PR06MB774613730CF88203C7331AE8F7CE9@AM8PR06MB7746.eurprd06.prod.outlook.com>
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qbk676BQoquM3K7QwX3hUzGLhFJcjJaTqdB2jn4NZcfzwkuXx6nrIfKMSOpBVCZRT8Ss6vmj7Oq1E4xMj3+/oZAjOKdRc2V4t3MN2C+wxoPiAokS5qqAxDs1iacChQbQKZAt7wcGJiAXyk7As8BJqZeFWdoKA0FkIb4+ZRappkqhVvEr4q0qjYLqvXeXsnIdC5mrLfLTd683id4dTXHvh1Jbc9T5ZYteoGV8cqffQUu3k/mbeD+8hLE+N30DsFk52MHAszMc6eD4cvM8Zy08vWZ1Kdn0a5pE3gMBzkc2sMJ9gX2xSDG12mMueEHGjYi8ueeFxIUaL41UEWNkrZwUltPz1A+xQ8RTWu3qsG2tC08y32umd2guprOqIi3VR+k8c1XBKJTfqK1VAfOlJXQBFGIoVY0DQAD0iTJdgjKm0bkvPRa1DM7JrlyLaMwz68b98I+H2Ymcy92YA9/XVh0xOexN647Dl2cBHTlRC8BI2/HzeKVl698rUO9biZ0cQYDOX6L9RzpcZK7dZgjXxg0IzlU5pir1/mrhbbpMPwCPrLvqfzQFNn5lhMQ/S3aojggxvgxzWYujbHzIVneUAjUOi4lptzNjyRUFBDDUk2RawRQIlDpI6SxS3b3pScsWSLGqhyVxRcazjB9kQy+0MjZoFzAeNBdjrfRSBeKgc+iAAeScjIDE86wZP8Cb6XKBuLb8163D9Y805d+srKvEXP847w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7289.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(5660300002)(66946007)(66556008)(64756008)(316002)(71200400001)(66476007)(66446008)(54906003)(6916009)(8936002)(6506007)(76116006)(44832011)(4326008)(33656002)(7696005)(86362001)(9686003)(26005)(52536014)(2906002)(83380400001)(82960400001)(186003)(55016003)(8676002)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5XKCstPIgY8gk/ct7EnPIsxrwTyZxh1gmDpMoqPtG2P6Q+uEDi5xCg4StwBJ?=
 =?us-ascii?Q?oz1ZWuAxZ/d7T0IVKQ1+tbegZRFppup95Tlkv96U8Bx85BkiWBK2gCu+K2xH?=
 =?us-ascii?Q?d35VIgDJNilP4Y+6Zm+wooToUZemjJ3us7OsjipmDmMMR/gyawdRdO+qgQUh?=
 =?us-ascii?Q?yZSl/+Hw6yugy8zn+z5qklmFehCTtIHnhK+IsNsjGeYHFmKGVyD/ZZUiCREy?=
 =?us-ascii?Q?XYYZuGnZYgYmvEI78sNEUj0sflsPrMyiGqy7NUdK3IFBHSUCqJ/MOWyzSn/T?=
 =?us-ascii?Q?FklGbkps3hgFXUz5mbViyjL1+ht0QTdalUGmi1zEtX8SAEOeScvkHUeZDZay?=
 =?us-ascii?Q?G67Ulp8ba/FRbmrJjxX+2PBiiZ6TBwAkPPeeyBo3ijZ+eIMFEBG2PfZY7Ayp?=
 =?us-ascii?Q?LBKItAoQsr/0s6yy3BYLe2ocnG0nLz3aU3j/yWQDeMKlFq9MgrbUJO9NxP0E?=
 =?us-ascii?Q?GtVkQr90r/t8oAf/HKxq1tIlIOm0dIBy0xcrhmXfuD/X/Be/VqMJ7FPugHgY?=
 =?us-ascii?Q?uKJmqR/trSNi8yHHUOv7uAB+1WfeiXqAPc64vupB9o4yDVi7DYNTV8FUtcDP?=
 =?us-ascii?Q?1HbXNtsB/XyNNqwwqU9nlU0Baq75ZkAG8JKwmAkHP0QTjm+6STiNZWAXiYGX?=
 =?us-ascii?Q?3i3Gt/3jjYctQqnlGFlERpp2hScXuFLLDFjsd8tpXiaq0Lrygyz2w0CHxqVS?=
 =?us-ascii?Q?NWps/bSh7mNGHQOKORptwLn6utuM1eKbo/bpcD9B1EvjSRY6fCG92mOs1xyz?=
 =?us-ascii?Q?BPrtvhzXohraSAUfAIP/XlE09ZfJmm33fQ1sZu0k6Db6rtMQnx1w25lgBED7?=
 =?us-ascii?Q?CkhJZc+nWEjfZxsnqs8VLYHSnd+aJJa7LuIA+Bj6eaDN/cYfegpbEPnE3jyB?=
 =?us-ascii?Q?2pESw2GrJYNY+ZsnNC5nIoZ64MR0QyefGa0CPx9+OUND6z7M4MSm4fLoDtGp?=
 =?us-ascii?Q?Qm3InsfeNST8t9pVjCKnJ25AnN8AaGR6BnhwIUJE67GHQSFOQAtCl6VrJ8Gj?=
 =?us-ascii?Q?GdgJemDah0ZgT032r6ky0YncWgTH0gU0xl7zYnsBrVDsGHeSPOCozLH18Lj4?=
 =?us-ascii?Q?Gm2iac+K398DNvR+6t5SlVnHI/9TpKr89/aY+NY9rUnwzkL5fe/pVEpJ/zqQ?=
 =?us-ascii?Q?WEUVaeu7L1f3El4nYciOq2cR0rGtpBH0/Oj4/KTUFosUESwdFKS9ZxIQnhq0?=
 =?us-ascii?Q?HkpLbhrHViKRPnxksZDYWLh3C4AqDxxrYRgAcEDSNR13QaL2BxgneAKIFXZA?=
 =?us-ascii?Q?dFkT6nafUAbT/080fntNSqmhC8gLEaVw0JeOVsbS3LpQI8q2bKMZvq81VAZl?=
 =?us-ascii?Q?0/kF7Dzf9VKxUUz7029xWye/HNUepfLjqw8RcFyj1OjxL/f3XvSOarXxumod?=
 =?us-ascii?Q?yGIrGIwqDrESk0q5yZ/gQxx5Xa58VpaabkBsByD+idLTORMVekjIZtzgus8l?=
 =?us-ascii?Q?awPQ65Dzws9h1bTC/mvng5QiUWKDtkb4X1kBYaGi3ZVF8X9COdEMhTHr1495?=
 =?us-ascii?Q?OEHcMP9NT93N+S+JGGWNiheJbTWUajTsro18KgMuKlQ9rS7ZYAAd1GMAwmDv?=
 =?us-ascii?Q?WaLObWsypjvIrZNGPJYrpeJf+KROYv8ROHiR/NWNnxDKevRG32+8l/c3j+UE?=
 =?us-ascii?Q?Q/pOhX/WOSN/BvNpueDrrfpTHn9xh2dC4SfxeQm+tFQG0c7CtuTbynA7poLo?=
 =?us-ascii?Q?OqawiFhNR31iUTZvgD0W3z/gmmwjvCvPKFQjdj7uv7RFdJujGfLO/W9edL/a?=
 =?us-ascii?Q?mIBySbiBqUmXYBcoyLMcgpnwSAoa3GI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7289.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ec2ad6-a5e3-4420-8376-08da37ce5924
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 06:27:42.4233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4nFquwD+oPpIM0JnyT0DDKOZjr2XSyrNFUO0yx9e3kKsonCRtOzYcPSj8oh/yA8t/+pXqA/wWm9NUeqmoRP9qW7dlAvdYYeor5OzUMm0WGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7746
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> On Mon, May 16, 2022 at 08:01:34PM +0000, Holger Brunck wrote:
> > > > diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c index
> > > > 1c9493c70813..6cdbcfab9f20 100644
> > > > --- a/drivers/hwmon/lm90.c
> > > > +++ b/drivers/hwmon/lm90.c
> > > > @@ -1707,6 +1707,7 @@ static void lm90_restore_conf(void *_data)
> > > >
> > > >   static int lm90_init_client(struct i2c_client *client, struct lm9=
0_data
> *data)
> > > >   {
> > > > +     struct device_node *np =3D client->dev.of_node;
> > > >       int config, convrate;
> > > >
> > > >       convrate =3D lm90_read_reg(client, LM90_REG_R_CONVRATE); @@
> > > > -1727,7 +1728,8 @@ static int lm90_init_client(struct i2c_client
> > > > *client, struct lm90_data *data)
> > > >
> > > >       /* Check Temperature Range Select */
> > > >       if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
> > > > -             if (config & 0x04)
> > > > +             if (config & 0x04 ||
> > > > +                 of_property_read_bool(np,
> > > > + "onsemi,extended-range-enable"))
> > > >                       data->flags |=3D LM90_FLAG_ADT7461_EXT;
> > >
> > > Maybe I am missing something, but I don't see the matching
> > > configuration change. Specifying the flag in devicetree only really
> > > makes sense if the chip configuration is changed accordingly.
> > >
> >
> > what is confusing here for me is that in the current code we have "if
> > (config & 0x4)" and if this is true we configure the flags
> > accordingly. But the bit 0x4 in config is nowhere set in current code.
> > Therefore also the flag is never set. Or do I miss something?
> >
> The idea is to pick up the configuration set by the BIOS/ROMMON.
>=20

ok.
=20
> > I am asking because if my assumption is correct I would replace the
> > current (never matching) check to the new property:
>=20
> It does match, if set by the BIOS.
>=20

ok thanks.

> > if (of_property_read_bool(np, "ti,extended-range-enable")) {
> >   config |=3D 0x4;
> >   data->flags |=3D LM90_FLAG_ADT7461_EXT; }
> >
> > Is this ok for you?
> >
> Looks ok at first glance, though of course I'll have to see the entire pa=
tch.
>=20

sure, but I need to change it as now the use case that config bit 0x4 is se=
t even
if the property is not set by DTS need to be covered as before. But anyhow,=
 lets
discuss on the update then.

Best regards
Holger

