Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9FFC7EE22
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 May 2023 09:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbjEIJPe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 May 2023 05:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbjEIJP2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 May 2023 05:15:28 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2094.outbound.protection.outlook.com [40.107.7.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62037E72A
        for <linux-hwmon@vger.kernel.org>; Tue,  9 May 2023 02:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBXPQrTiFaciuzqpm51I4d0kaE5pA0lUPcqA/o3XWPcl6wpvWWg5+RMPZKaPI/lE+aigxczdWFdhGOEbgLfPkAy6Iktvk3MIfQrn0sH83IXYDIaHL2GyMaa4IIYQc688QtgOVnYYJ6QIACOS1OvENRZKXIqGefaIob+B4cE8wo3mnryi9SS4LzgaHuhYFyO5XRDPTxubKU0bU8er7xszYovFLXYoAsSNOT74+sDUU0IFGeHB+ZCN5s/1RwB8SW7HHH4qG/9LlkaOCy8YbUBz5IBB5XmbN+bxQGSlmxfvpYXzHfi7IqBKXuMP5KQ7laZmlZPvovJhX1SfFVAyJYltyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3B0AAICfdDKyaRiWRfPLDbrc4FmvHjckkQ+egXd9jk=;
 b=RJFvwFdeorVV+00tF0SMYglczCLnRfLZYMoz227xdvq1FJyyVgJUtizw3R6SX7y/lhbzQhtksq1ZIjWiWRNMFPMBnFOLLXlYcGva7tyAUlzmciW3griu/4JTFiRDMaw4A73ZrLfdv8KAXIJQn6ks6qir3URo2mPZsxP9c6hKHebWWApT7iTua+1D2NXoPUqe7LBGjEi2L8qy3zl4M7lo7RHb3KxUNRSVTHOM2Ct/24FCv4g4ndvlLD3Wex7R4BHJA117zlEeLfS35eceNI/V5ZCmWDlS+mZ6F/+ZR5Jz1pvzkF/lgaNpJO/rHEypNszm+eHuRf2c6/Z/yO07hjtWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3B0AAICfdDKyaRiWRfPLDbrc4FmvHjckkQ+egXd9jk=;
 b=I2Qps1qgYwl6NyYUsIjhVrB21H5UYHHtMZpF+O3H//q3n0l27acWDiH0/sx7s3xojhJ6OGXnoXY1JtTuDLEhPmCnmvTd1l8bkM9RP6hhsXQnVaIjT/X83zzVpe+qiRXUSIPsTuxb9ODw9dXNgmrZnqIYnO4u/7q8fJq+VB2EBgE=
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by VI1PR10MB3312.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:131::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 09:15:13 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::eee1:518:b4eb:318d]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::eee1:518:b4eb:318d%6]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 09:15:12 +0000
From:   Gilles Buloz <Gilles.Buloz@kontron.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: hwmon: (nct7802) fix for buggy temp6 + GPIO question
Thread-Topic: hwmon: (nct7802) fix for buggy temp6 + GPIO question
Thread-Index: AQHZglGoFaqiKmncY0Kkn21J7M/Aeg==
Date:   Tue, 9 May 2023 09:15:12 +0000
Message-ID: <DU0PR10MB62526EFCF921942925CC164280769@DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB6252:EE_|VI1PR10MB3312:EE_
x-ms-office365-filtering-correlation-id: 70e83772-8b09-4a80-c26c-08db506de516
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lo4MlDxaFcHHMwjbsLX9Z1kMbpe/joaXnldrNWgzps9wzlGx8H21YAU9/E5bOezokqq5PI2vG4e1rUqLeadq0diHD5iX0DJl4x+KHikfA5XMnP7vRaCOeRtSo2x9DNolOdaf8lIMHvsiiWisGR3Oj4cEUUcgccznWPYXDAypfTRnmjZATjy5JZAeyZctgJw7HU9UqKNV6iLO8T4ig/4wqcKn4rAXp43WYdIyIZ0msbRPxvycIgF2SP74S0DavVjeOqzpCPSHw/e2RAqr3DxET6DqAB15WzNoNqxDAnt1JLnyXIW67ILs3Hf0p9o6qgQ1rCJaL1Om8xDnOK4B8iShpfn3Cq0xSPlcyGshetK5j0yZWSAo2QgdG8IlFyT9hjIA4pKytA5QIEyvBt/D0NTVfgnP8l5pJWUUnG9/02Cfc93INsi+D8a9QZYfrERxj9wk5GPlqE4nsTSkMz0YlfNVT6yoPkHY2tNOBDawEduQDWJIBgxoB1e4NRMkv5/DBX7MANiGFLO3GySD2PylV4ldAH9CSvLmX8fLItz4M7tWgBLEEY0/PEG3FJ6v1PF1d6ejwNNYuUJ80flJhFOxxX0YIHF5ePgIyzeSGlfGS5Fp17Vi0SSeRMGh/zyPrvVivH3b
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(26005)(122000001)(6506007)(9686003)(38100700002)(38070700005)(7696005)(83380400001)(71200400001)(186003)(2906002)(55016003)(86362001)(33656002)(66556008)(66946007)(76116006)(66476007)(91956017)(52536014)(66446008)(5660300002)(478600001)(41300700001)(8936002)(8676002)(64756008)(316002)(4326008)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QzpGdXuavhH2Gacs6zBIjS3Xh8quhQ59nZvPhPfoz1QErO219CLKVmdeHR?=
 =?iso-8859-1?Q?oJxL5p/HU1bBfW02pHiodn64orABXH8Z365XQz5YSAn9D8/78tndGnCTD6?=
 =?iso-8859-1?Q?NUlnO605OVfjz9XHq2ObmWdluYAoS6l1P368OkTit5aUcxZNM/NTguN5aa?=
 =?iso-8859-1?Q?pQhkhvbvMusu8NAzFxc4++oLLbNax7D6S7rgBVKhsPHsTXEf1N3YpGvJBy?=
 =?iso-8859-1?Q?BAZQUHVOM1KsGnduG6scYrgmMtX+/4S7Ihx5FfkEQw9mWb9CiBAkkUetuZ?=
 =?iso-8859-1?Q?En8hYenu2/rM/wNmyJnsw7WEszCYWlETl9v4BfxVsucGyilhL84RJhpkGa?=
 =?iso-8859-1?Q?yuaTfcsa5qNAsYzX8d0VZLwzHQVZyPWbl0chwcVsKBjifupEW9tG+YC8FF?=
 =?iso-8859-1?Q?PmkYU0bVWH6bp4D2JVM6RyPQ+bXQUA/eVKp2om/zEcufj5drr5kN4yYS9M?=
 =?iso-8859-1?Q?h5gohMcC16WI6/5KgseQcCR1ppdyu74DMOFtX4Fch3St7dM3X6HTH7Xb/C?=
 =?iso-8859-1?Q?5uPYWSGoVvmnfTC5rTrsN9FVj3Ywj8k0aPiTv9q5hEa9WHITqi3SHjk2bj?=
 =?iso-8859-1?Q?ewNUxS/kjgJDNIB7VwBnhRSHOqM7Pytr/4tMjKfaqnEf2bcCPHhUeyZsqN?=
 =?iso-8859-1?Q?XbDv5ODdQMXoDYgis7DjDVDFWDWsztgaZQtwHI6ykgCWgNVDmCZ9fxZUcF?=
 =?iso-8859-1?Q?V4BFyPsgqMrjpTDxZkgFkMSePSBoeL+WNpVBietvIexR2q/dnNykCpb1Xf?=
 =?iso-8859-1?Q?e63I9l4DCyxmpr1XjzkIqgIFHU5AGyyZO3JrKii58sZJahUW3LFySQDf8q?=
 =?iso-8859-1?Q?ST8Wzu2bBsIw15ci2fN5asuVuk556GFifLYwT59/teBhd+7ux+Snw0GVVw?=
 =?iso-8859-1?Q?Ir2hhxhiZz3HY8sUM2QmFT2ja7ageVZLNKYQC0qIetbwYuOZVZI48QfUtt?=
 =?iso-8859-1?Q?i6NQlMU0Q89w6vviDMu+HTl+cbYcatlribRc+RwhzxKGDwh7PWk1R3HOWe?=
 =?iso-8859-1?Q?J4byJjtdHSw8/cQdAg4REaJvUHVpsXJdAf/tguXdFLx0J9Gn5WXSx7dijv?=
 =?iso-8859-1?Q?PMEE8RZ/sYI1hFy612rFlTsj1TMpZIQaAgV02B5U2/r4KJ9h9JThUCST5p?=
 =?iso-8859-1?Q?Sy54WCv2icrihrPTsmut58F1lOBE7E6taG9CiEkPGnk1jtiiMvDqwiCp5+?=
 =?iso-8859-1?Q?1ZGGVoR7uyXx7CpPMoJdJC3fnZj+kkg/a2OVS1KxOJP2+SDVrMz4wxUU1x?=
 =?iso-8859-1?Q?hYi/3X1i9ok0EfBnTjWzE12xU2cAvHOWarsM1NmXrJ+K2O37emLhJqXFk8?=
 =?iso-8859-1?Q?3uFXVehIY1mmZxhz6/GmEsOMTql12ttizwNmzZZWWkrsgVySAaA2p0dyON?=
 =?iso-8859-1?Q?Vic+gXO3ktMgeMxQaRbavqAn7oM9bQ2hiquC8tIaTYJz7lwQvIBbCwRmmj?=
 =?iso-8859-1?Q?bmTnKrGflNMwYDUTa/JtR42hcrO1uT4XuWAxYh53Ls6tue4Bb417oUiJ0t?=
 =?iso-8859-1?Q?ur1fX1c7AVMervrOWCvfI3f5A1Mwvrh5/0411e7GzPiQbjAOxGfeBf0Go/?=
 =?iso-8859-1?Q?N45ussgQ2xDNFhGqiYR+WJkBKo43X1UvtuXw9TLOmLIk+JKJ85JaRixVJz?=
 =?iso-8859-1?Q?QesboG92T6BPUYFC2AlZOIYZA7Qgnu3pg7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e83772-8b09-4a80-c26c-08db506de516
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 09:15:12.7742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2eJuyhYEt3pfysc75nV9K4Tlxm6XA3v2wUHHMwfUq8Sc9Btshz3mxgkaraAuaxXhLYrfTNHbcWfwleKgmRhh8z2QhsyHk3L5yOAqxlGV9Cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3312
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,=0A=
=0A=
I was wondering why temp6 temperature was reported even with PECI1 disabled=
 and found a bug in nct7802_temp_is_visible() where 46 is treated as an hex=
 instead of a decimal. The fix is :=0A=
- =A0 =A0 =A0 if (index >=3D 0x46 && (!(reg & 0x02))) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 /* PECI 1 */=0A=
+ =A0 =A0 =A0 if (index >=3D 46 && (!(reg & 0x02))) =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 /* PECI 1 */=0A=
but to be coherent with the lines above, this is probably better without th=
e parenthesis around the "!" :=0A=
+ =A0 =A0 =A0 if (index >=3D 46 && !(reg & 0x02)) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 /* PECI 1 */=0A=
=0A=
About GPIO, I have a custom board where a voltage is connected to the GPIO1=
 pin just to detect its presence (all sense inputs already used and only pr=
esence info is required). I have patched the driver to treat this GPIO1 pin=
 as an "in5" returning 0 or 1 and have added this to sensors file :=0A=
=A0 label in5 =A0 "3V3AUX Present"=0A=
=A0 compute in5 3300*@, @/3300=0A=
Is there a better way to do so in a more standard way (yes I know this is c=
ustom hardware) ?=0A=
For example implement that in a GPIO driver instead of patching the nct7802=
 one, but with the output displayed by "sensors" (this is realy a sense, no=
t a GPIO).=0A=
Or add a standard feature to the nct7802 driver to report the level on GPIO=
 pins if enabled as GPIOs and set as inputs ?=0A=
=0A=
Thanks a lot=0A=
=0A=
Gilles Buloz=0A=
Kontron Modular Computers=
