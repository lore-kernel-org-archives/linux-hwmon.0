Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EA8C001DE
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jul 2023 08:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjGXIEt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jul 2023 04:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjGXIEs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jul 2023 04:04:48 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2102.outbound.protection.outlook.com [40.107.20.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00939113
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jul 2023 01:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPy9tu+vnRkBD5ip5h0OUJKu7DP8JyfsfesGRrpdYUzrWnXvFxPQ6vXs+2vftT/4rnZhZY/87IchPNv8Dawvwr/LOx6Fs+oXRrmDWwi3fLAF55xAzf6XjUw8CtzxmRd0ZnqCKs7tk31bYB1wfo0m9R21bz7MtL4q/ihnwPI2brzWaMPlK6J1BSjyZZssLYXfWbAAZiZ394KruMZfdnqRsw9/iHYN8C9RHrug+GlLGUz776Rg6lD8cikwD94UsczYlje3DeVr1rYA5XR1y6mrDZ+uHf35+ZyXPXAnt6NPuLe7suBgsEYGiYMs7eGherrx9eka0X7FBmHObO75+5+S4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmnzyhanW+2Ca8l14PecNoGz1vLCSIQ45aF800tNdJM=;
 b=H7S6xCSDcFn/BA9S/IZQdBoieUQs+noyiq5048MakmAoOezHThMYXQu4ZrwMkhoS51+nR1n2Pyw1V/dTTPyRW/HSpi31h9ZeWyka/D2h+XkLOz4vNFPVghwr8DKVvlaFGGN9KkmUrNmifm1JItojkSo0boWG+xPOXoubE+mkRUDIkiQPziig2CF0onGWkh75I8lEd6koqDvRb5Vm73ySJl0KXpUB6WiyjYZKmSnHOTpIPRWd5ELTOJG8pLTQGLrNg5GRAKKstuYJ/QuPgCT/mEqVq4wQmUO2FGjIrPlFAsaHeNA37uOXW/xyvct2Ap2N4A6Q5+xrPiO8SHpBMAEQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmnzyhanW+2Ca8l14PecNoGz1vLCSIQ45aF800tNdJM=;
 b=iQ0MExpww1MU4U8efGxQ0Ztysbbz8gXtp+pOJ4KGl4/EBXLsjviteYKEQzsK5KMyG6kaTuC+yMG/MeCHZbBZ53QTA5d6+AqSnMV+FScY+ZBObOoQJ1GU+9xkf8FtmYx9GEvsV7cRAeRZ0QTfifeJaHazg3q7LReYCWvc7RDVjzY=
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by AM8PR10MB4036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 08:04:44 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4478:3f61:306b:21e5]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4478:3f61:306b:21e5%4]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 08:04:44 +0000
From:   Gilles Buloz <Gilles.Buloz@kontron.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v2 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed even
 if PECI1 disabled
Thread-Topic: [PATCH v2 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed
 even if PECI1 disabled
Thread-Index: AQHZvgS5pEJghVK4TUW6lpftdOvQJA==
Date:   Mon, 24 Jul 2023 08:04:44 +0000
Message-ID: <DU0PR10MB62526435ADBC6A85243B90E08002A@DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB6252:EE_|AM8PR10MB4036:EE_
x-ms-office365-filtering-correlation-id: 7e1a8af4-3ad3-41b3-90db-08db8c1ca433
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YcYrPrdtVy22zMs+lneZuB5Gkg8J0Pcn/2bkcgnYAW5+m4gVr3p5QfRtpupheTgaCuxNSPIl4q2f027V+gNxX++H/C16KlD73exK4HS0pZzxjlObnLiIc4+NXiciiSoIitqKMvIartpWV/ehlpCcUAONJx6qRJRJLcOJYKZ9wxI6oaG/DasMTuGaHetbwJDlz5Lw0V1WRXSFL4nsjCwkTCRxGiFBCpz5cRjxsScFJVIx2tp94wFStdKbcwjjZg+zEdiW4RmpglrWxbkmBHhfvNSSSRWVglv5njWqrj1I7lNYpLTkur+VprFCQyLDY7MCe/KXy04ns0Ot8LE+lPOf30tdx+Yvjou2jFuAfbEkSA5RR9eHHD5mCTP94UC3OE31RIGnlYL6L1BRNo9tuHiF4SRC056ycMjcklV2MQ2JnTNlzDWZ3BdsUt6s0zx6ZNFhOV+9x3jtpBnqfPnuWOaXGjs4ktghh8zKC/S2kg20Fa3IryGJl32IxjDpP2yn4U5YgmI0ptKSYr1x4tlUMskNjA7sSADlGM2cy3+aBtrf432yBvWXqW4Ti//tpNrOBIAivGz4bwj3h73RvAP6pQQFbPAnrL3TR2aNg6HyUc8S2XrB3hD8lORwze9M7wBI6+M1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199021)(7696005)(478600001)(91956017)(71200400001)(9686003)(186003)(6506007)(4744005)(2906002)(316002)(41300700001)(76116006)(64756008)(6916009)(66946007)(66556008)(66476007)(4326008)(66446008)(5660300002)(52536014)(8676002)(8936002)(38100700002)(122000001)(33656002)(38070700005)(86362001)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?prU/1LX4o/ox2bhSgn9Acm5dNqmPkCQ5t2k4JDIbif/GkP2724zIfJnnbc?=
 =?iso-8859-1?Q?DcXI1Ncbf79+9vPMo/v84+Ux0iEHDugF2SWAKYBf7LdAoAWaJON0e7zoWn?=
 =?iso-8859-1?Q?bupaR/zTuEKlhRhHDzcqm7IOpde0pI5vekAKndWiioJlAG8PyyEwHDEllP?=
 =?iso-8859-1?Q?rZB68tTiR/W2T49qR8+iNJGD1UmlLaQO+h5Q0WYV8PyQ4JD4daqyCYrV4z?=
 =?iso-8859-1?Q?7wZzMN2tasN1/mAnixu6pCMeiI6XjvUNHbj4YMSKFf76HUIVb/3x7C/XNY?=
 =?iso-8859-1?Q?wcn+nQCQlrwCYuCu1lnKiWW/o3CTlKLsCigsX3Cm6Oi5sgIvJ8mGLZUc/U?=
 =?iso-8859-1?Q?555W23vOexprgxRm9nSq7xHrjxcGnJoUwqSD8Xv9+kmn0wgSFcDG7SGKIb?=
 =?iso-8859-1?Q?54pApg1KNH2LKoNt3ZOMq6uw5UywrqxzhM2x4l+BPKZgkOvjOGQKqEQMlT?=
 =?iso-8859-1?Q?ptGqS8E3WUyN/J+sGMMHC1790PuSYYJSX+j4BvgdN4d/j8ZbidyvtQG8eX?=
 =?iso-8859-1?Q?lAdtT0DaL45Ti+t1jyfh8o+9glVwviFChPecclS2CwGwlK4vDeWzmQHouo?=
 =?iso-8859-1?Q?pLIuOx1wedKmhb4aipNGC9OWCh1kligsI83AyZjDJIQZOOqEAM5r+QwciR?=
 =?iso-8859-1?Q?sV48ZxVOn2VIYgR6T3DJevRuaSqFnUJZvnUQGEt7YXvC5QLqGpSbHx5rYV?=
 =?iso-8859-1?Q?bCvXX+k1nufiBtj4AYZl3vVPvMZX0KxqdILsSc/h3sLJnowFp0oJTZROxg?=
 =?iso-8859-1?Q?3r9t17vZxCloTYgrF0ILc8hOsgsJXdnC6EY0fMDdY1xMb1CnbK2O97b5fk?=
 =?iso-8859-1?Q?85RuNfKEgVBSPrjAGNz+L21WObdZpXq2slx2VvZCzL529jIIlB3ryoH59I?=
 =?iso-8859-1?Q?Cn/Wr9fXMi+U2c1X5zfUktbIXhSOUcmffEoHGMwt7RqNHQG/hs2uRTDoqH?=
 =?iso-8859-1?Q?QKF0Qa27xvlGkBC+2UwmYVTiggHjlLIdvID3rN7ZOs/lJC5wrejaHH20iS?=
 =?iso-8859-1?Q?KiG/6N2RJAQt2cKCv3ARRn7vhfWB20I1ixhSeriZ3NAB4NjB2Xo+9VUr7A?=
 =?iso-8859-1?Q?fSgC4abWarNOW2MlAMesNXKNZw+gtHbvjoxstxwS7SdxvQnFwFnLvvrwUw?=
 =?iso-8859-1?Q?UoYt66uj1A7ja7iFcLs0giORXCmqmRZkH5z9K35m7wSaUP1axQZx5t6R8G?=
 =?iso-8859-1?Q?BUsO+mLWBzZBqjL4MfVf7RgyC7/HcR6U1vPTls5P5BV8PNC4/HtTNK/GKj?=
 =?iso-8859-1?Q?q/yreykJiCOka9z50u191fXt5DY2yusfZzo+reME3rEFTayPmNHpK5Oye3?=
 =?iso-8859-1?Q?K/7z96OtrDmbnHgaF6IPvFySPb1UJ5cm8Vda1aEpvxh4AE9F7a+En12ZYU?=
 =?iso-8859-1?Q?HeSZppcExB6zf40CVcaET3/cnxFR37wN8NnHJwauR99BWcXVcH/AG9YrV9?=
 =?iso-8859-1?Q?IUkhLv/bah1sC+A7uSbcx/Jhmu4VZ/4i7yGCgSzDJ5YKT6GWUtPUqSyjFl?=
 =?iso-8859-1?Q?SnkOV8oc6QBqmNMyD1vcX9lh4hE0qwZHO3AQISjITxjcjksndS6/S3Wzya?=
 =?iso-8859-1?Q?c22YfvWo5nE5f4HXG4peb2fGVLCRuzytEad4aAzc03zOkATp2ZX8/sfIgP?=
 =?iso-8859-1?Q?qJq7vNRVNwgrjCC7m2sX/H3lmh18XtopLc0GBft/HJeXkJRorCZuxWwzqb?=
 =?iso-8859-1?Q?imdEeYtEAZftQEoJyUORQs1ZbDAYfk7YHyiKOFJN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1a8af4-3ad3-41b3-90db-08db8c1ca433
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 08:04:44.4436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hRSwPsnWsUkTBfK5LFOpCsE199vrAqFXph1Qh7LXnzYlVkO6laFhlBKm77mByCO6P9Vq5/1yoBQc5ZClgv64gz0HGBmiLRy6z2q+LS1B5mQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4036
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Because of hex value 0x46 used instead of decimal 46, the temp6=0A=
(PECI1) temperature is always declared visible and then displayed=0A=
even if disabled in the chip=0A=
=0A=
Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>=0A=
---=0A=
V2 :=0A=
- Same patch resent with another mailer because context lines were=0A=
  corrupted by extra spaces=0A=
---=0A=
 drivers/hwmon/nct7802.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c=0A=
index 9339bfc..024cff1 100644=0A=
--- a/drivers/hwmon/nct7802.c=0A=
+++ b/drivers/hwmon/nct7802.c=0A=
@@ -725,7 +725,7 @@ static umode_t nct7802_temp_is_visible(struct kobject *=
kobj,=0A=
 	if (index >=3D 38 && index < 46 && !(reg & 0x01))		/* PECI 0 */=0A=
 		return 0;=0A=
 =0A=
-	if (index >=3D 0x46 && (!(reg & 0x02)))			/* PECI 1 */=0A=
+	if (index >=3D 46 && !(reg & 0x02))			/* PECI 1 */=0A=
 		return 0;=0A=
 =0A=
 	return attr->mode;=0A=
-- =0A=
2.23.0=0A=
