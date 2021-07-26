Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3B6C4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 04:36:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2C8160720
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 04:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhGZD4I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Jul 2021 23:56:08 -0400
Received: from mail-dm6nam08on2064.outbound.protection.outlook.com ([40.107.102.64]:45536
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230321AbhGZD4I (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Jul 2021 23:56:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY6X2i8Ic3xmDENsNVgwUZC4a0kMTrSiw6VHZGfVW8XLRs4CtvrNPqEnZVIqbPvOJZtiiHsu+LuptAwabg9vOYSa+lfItcpYegIzUyNhFv7YR5l8pp6QTJmj580JpnfNCG4brDUx6N/zeRX3LexMjLZymHx9O/l7hpWL77oEehiBS9ul4brlKOvnKi7kXs5nKUaB7sAULICHzv2nECR9P7nkLouFfX8v44nLGvXMENvhq3T9vMQoNNgjpwP0KYUWbO0oFpUQENwzP7CIwSncVw0e/EzIRYqSp1bWNsYIAWW8Hv6zn7bvsKuUWLzfC3zU1y1aliXi7dCCy/yVcIQ1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESkno0Cx8B7dktNdGIV4twhE6aY6UO8otTE/j9Hy8oE=;
 b=dRRU5Vzj2ptIj1P/5UQaB5Ban5hv64wrMjz2/iuAtXUmu8/kQOeoKfvTFvN/16j9jaOBd2hC1CYbkqanjoRjroSf1Oc+Fo09rEyA3Ls68sSKAG70DVxKR/ALayds5JKLtO6uw010r21y0F1UYcU7fFKhM/sd4GVNRtwasuF1e+t+eBsEAI3W5WzL7Ez7PWtJjtL0xX7zVYNob+PJ/gPBGA2jRYalsEnptsuaZQ2RaAbjHGGvp4rhARs9EHhqnQPj7JFYxd29VQes0i9ixZelsOMpOAvJ32nKKrbI5wY8lcYnveUpOA/t1KsTItxRZxJD+LVZmDY6Kyhx5D1rbJA8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESkno0Cx8B7dktNdGIV4twhE6aY6UO8otTE/j9Hy8oE=;
 b=lwu0TIxfbcLFqIckDliTp5kT1+E7QxT7wRaacfo+s64eFxCb2Ech/HGEZL42lFonpxqMI7gANi8QBWbdVadTiflFFZFkWKwRCUcZuJ4QZiYUzqxD8d1TSzEBGTdsSn6RDaAxzsjfM7GMlj0iZNPQx2jsUCyZrPW9EyJA/yOowZU=
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5223.namprd12.prod.outlook.com (2603:10b6:208:315::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Mon, 26 Jul
 2021 04:36:35 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 04:36:35 +0000
From:   "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     "Gupta, Akshay" <Akshay.Gupta@amd.com>
Subject: RE: [PATCH v3 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver
 bindings
Thread-Topic: [PATCH v3 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver
 bindings
Thread-Index: AQHXfSw5YNGoXJW8qE6CYKFIVKG3/6tUQAkAgAB0d2A=
Date:   Mon, 26 Jul 2021 04:36:34 +0000
Message-ID: <BL1PR12MB52865705B0A49244B5E49C26E8E89@BL1PR12MB5286.namprd12.prod.outlook.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210720055737.8666-1-nchatrad@amd.com>
 <20210720055737.8666-3-nchatrad@amd.com>
 <a56d3b58-06cf-6d4e-0858-31d658746396@roeck-us.net>
In-Reply-To: <a56d3b58-06cf-6d4e-0858-31d658746396@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-07-26T04:36:31Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=cf190029-53d5-4ba3-90dd-68d8fe43028a;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1d43cdc-c68b-4c1b-900d-08d94feef337
x-ms-traffictypediagnostic: BL1PR12MB5223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB52231F95E01A648C82B5D8D8E8E89@BL1PR12MB5223.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bmtZPzNwZtWAfCwECrqe7Ugo9SxMl5vW8LeGSNz0w4QxmTD2wg9xqoSolu+0BY2Gfwi9UtwaZ5fqUEktxbaWkcAOdz5dbspHWMtqm4XLm0LYh9AVsvjHeJcy8jn9HVvVaJvWNxVvxH8LEiZkUUlMmN5yjorIoP+87qGYwGVCccwOH7jFsw8mUQfg/AHrPiWKx+FyhkfafcxgpOtSjs4RaN0uH/IjiV6OwMtovFS1ghI+6D4TbwrqF6XPNwywxsuXPk4bzJAmj87rHoY0V+ch0xicggoD/ipmVCXhdVp7iUqo3Mk5IYiD6Ms9iFfX4t+7GtjwVai7MaLqiCscmRV+kDbTqKcIvZ6jyhxMxu7WbgaLeocx9Ann3XoeQY3cRc5PZzT4W/Ti3Ele2f7oeNGY3YE42pnsEToAfjJyESY1StDOjxgYge2K0NIwRJIjzRTTLpqmNm9kHl3wvdnyulWP/XdUG9BRKVXMJP0xmIOd/btEoavWbnYJ3YImV79Cens5NUNt2nABGU9whN/ICKFi2GIgkeb8+r97ZDi+egzOh3BB1itBlh6XOfHvbG3AMPZ2QkpjDHAhEADr6r8s5RG397djP493E0wcXKmlAANWYyPo79F1FYkcKmF0dcNkOa1ST86AH5JGf0uaT1bFkjse9FfADCyI74VqXKDnm0IZJ4S2/4p9TNcJlbOqMUfuXCTp3NEFo8sGtL4yoVPvsQG+Ro61J8In3FDgYtHhXva93BebXS9YRt1vNVudoUtazwNI9hUnqgaVdkIP1H7WikbbXd6o4/F/iVVSd1kQAZ7M5xghmvy42xuqEVDKb1OmRBlffvsP726pHTEL6rxb6Z3NHw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(5660300002)(966005)(8676002)(2906002)(4326008)(186003)(316002)(8936002)(9686003)(55016002)(64756008)(66476007)(66446008)(66946007)(110136005)(66556008)(76116006)(45080400002)(83380400001)(38100700002)(52536014)(86362001)(7696005)(122000001)(33656002)(6506007)(53546011)(71200400001)(26005)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y4gE9NAF3hQbS9tphf9d/5UubBGbycFhnq/+4igysitZvvlINm7RtGO3GGdM?=
 =?us-ascii?Q?Xjkxf59x2OwHVwZW5Ao9BWMOYE7K1qz4ug0hgUVXAph9dFO4NH5yzp1phgIu?=
 =?us-ascii?Q?qgsoT0/vlINbYwVNZz4Od9O4/EbjVn3aAOE2WP8qArFMVYUZIGavAgiBXKis?=
 =?us-ascii?Q?AYcJKHnYsh9lWr+cRlwIOb6p5kxfd+k7NqkAsl4b1aKlAR7uN/Sv72CTPx++?=
 =?us-ascii?Q?kyud7FOoDN+/v73YN500aATE2A0fTnHU/KYUesnoxusTmiTWL1g8FfNQohHp?=
 =?us-ascii?Q?yKkCtuXgtC3eSnL0TH4jykYyx9YJMgqY5D9v2dRuqdW26OyDmqCZhy/k1Y5S?=
 =?us-ascii?Q?oTFSwLvZRHrIb7qEJGsWM3nOOa+6vNj2RYwyeB40dZXUi5u6M4Ji4MeNOosc?=
 =?us-ascii?Q?zxHC52Br1KO51HTxdYf86Ak0AcDRsZSbZ28UBQOiHe5BVsnYDj1n5bOmx9ni?=
 =?us-ascii?Q?9QBFBsDAqOvqEZEUR5VvmP0UCYJRX6dSdHInjzHh9An0ggppallv8l7T92WD?=
 =?us-ascii?Q?fbEgcpPVcaqd/jiMYYSu1nxZlPip+RtfCH1/CXfGA8wVwZHhAfSVBvXuhrTW?=
 =?us-ascii?Q?1oTAUzD9as395MR6RpqDEcHjb/9bJo0F/0sXPIAEeakgtBpYWB4q9GFPRz/c?=
 =?us-ascii?Q?FPWoOrugj1ewOUrZL7Mh+C8mN6J2n5OnaBU0px1mWgtwu9/UcJjBZ4nGnad8?=
 =?us-ascii?Q?sgORjkL28EnhQjKxJH3JU/pOcr3/TNaMn1ddnpRZOUVia8BkWcqzjk4/WB2K?=
 =?us-ascii?Q?6Jh0MCF5vAIKLJQ4sy2oMCXSzn2l6/pRnSOUb41l4N6iqkFEvKbkv8dGFm60?=
 =?us-ascii?Q?NSKWeavioJ+ttiaEGw5upLfSLA//IKCZfRP5O2l/hoWHP2vM0tn845TSVq2w?=
 =?us-ascii?Q?lcBWht8UX108VDrPnfIhdkZoZtWSwrIstn+DQUl6vEITRKXZ5yqPTneySBt4?=
 =?us-ascii?Q?1ca9JHFzOvzoyLAko+QhS8XADfsIPxzWWvWBFUjgjZewyyWFdmXcoXZRzK7L?=
 =?us-ascii?Q?Y5hNB56I4IEhpHCLnba+Zlcan3hlTvhd252suSJ/Z7EBG+NFg4i6aTqHxbta?=
 =?us-ascii?Q?AvSeDhkfF4QNGWve2OoFlUBwYODVmLgKVs0I73vffEqb+K4pUEJxhr7JegMX?=
 =?us-ascii?Q?bwZIDSKtkCj2HYnRR4xlMgwOSGkBOwh1+Q514gQvvkcFOawu2evKSM3an/zD?=
 =?us-ascii?Q?W8ZHona5BaJaKUxYMxH3CrfWH5MrDLjGnq4OYRV2EgbvxMFVCIilOqiXxO7g?=
 =?us-ascii?Q?em1fQJd5Tr3WhyQnpx3D8a9uVvJMZn0gtRu+82Y8jtTX5OJtYpnuL+OdKAJl?=
 =?us-ascii?Q?kbl/moLbyr4nzjz1k23Dy2tE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d43cdc-c68b-4c1b-900d-08d94feef337
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 04:36:34.9995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJuBG7WYx9wOA7rdqILQlgNJ5SqVvSrXR4Gb7h9RCYw2INGVcFynHyvO5KPzYNXmzCjYdWeZfkDjG3A0g++xDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5223
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

[AMD Official Use Only]

Hi Guenter,

Regards,
Naveenk

-----Original Message-----
From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
Sent: Monday, July 26, 2021 3:07 AM
To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>; linux-hwmo=
n@vger.kernel.org
Cc: Gupta, Akshay <Akshay.Gupta@amd.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver bin=
dings

[CAUTION: External Email]

On 7/19/21 10:57 PM, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <Akshay.Gupta@amd.com>
>
> - Document device tree bindings for AMD SB-RMI emulated service.
>
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Devicetree files need to be approved by a dt maintainer.
They can't do that if they are not copied on devicetree patches.
[naveenk:] Yes, my bad. Can I add the devicetree list now here or should I =
submit v4
of the patch-set with your reviewed-by on other 2 patches and copying the d=
evicetree list.

Guenter

> ---
> Changes since v2:
> None
>
>   .../devicetree/bindings/hwmon/amd,sbrmi.yaml  | 53 +++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644=20
> Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
>
> diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml=20
> b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
> new file mode 100644
> index 000000000000..7598b083979c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id:=20
> +https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi
> +cetree.org%2Fschemas%2Fhwmon%2Famd%2Csbrmi.yaml%23&amp;data=3D04%7C01%7
> +CNaveenKrishna.Chatradhi%40amd.com%7C8a8332e2358f4c37030d08d94fb456ac
> +%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637628458245183191%7CUn
> +known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> +WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DXwsc2G6T34oiV4aTzYLEb%2FLpoTj%2BW%
> +2B6LmRkAFyeauQ8%3D&amp;reserved=3D0
> +$schema:=20
> +https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7CNaveenKri
> +shna.Chatradhi%40amd.com%7C8a8332e2358f4c37030d08d94fb456ac%7C3dd8961
> +fe4884e608e11a82d994e183d%7C0%7C0%7C637628458245183191%7CUnknown%7CTW
> +FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> +6Mn0%3D%7C1000&amp;sdata=3DieeFYJjYCyDzHrcGjvHWkkU6QHqXcBqOa4Kfsmqk3Ek%
> +3D&amp;reserved=3D0
> +
> +title: >
> +  Sideband Remote Management Interface (SB-RMI) compliant
> +  AMD SoC power device.
> +
> +maintainers:
> +  - Akshay Gupta <Akshay.Gupta@amd.com>
> +
> +description: |
> +  SB Remote Management Interface (SB-RMI) is an SMBus compatible
> +  interface that reports AMD SoC's Power (normalized Power) using,
> +  Mailbox Service Request and resembles a typical 8-pin remote power
> +  sensor's I2C interface to BMC. The power attributes in hwmon
> +  reports power in microwatts.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amd,sbrmi
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      I2C bus address of the device as specified in Section SBI SMBus Ad=
dress
> +      of the SoC register reference. The SB-RMI address is normally 78h =
for
> +      socket 0 and 70h for socket 1, but it could vary based on hardware
> +      address select pins.
> +      \[open source SoC register reference\]
> +       =20
> + https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww
> + w.amd.com%2Fen%2Fsupport%2Ftech-docs%3Fkeyword%3D55898&amp;data=3D04%7
> + C01%7CNaveenKrishna.Chatradhi%40amd.com%7C8a8332e2358f4c37030d08d94f
> + b456ac%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376284582451831
> + 91%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> + iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DeG384k%2FtNMNJD17u7qdIhjI
> + p2sz%2B6Qs5PpAprL54saU%3D&amp;reserved=3D0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        sbrmi@3c {
> +                compatible =3D "amd,sbrmi";
> +                reg =3D <0x3c>;
> +        };
> +    };
> +...
>
