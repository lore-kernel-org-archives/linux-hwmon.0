Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8495C07E96
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Jul 2021 10:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B719F61360
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Jul 2021 10:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhGOKlp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Jul 2021 06:41:45 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:27104 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234408AbhGOKlo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Jul 2021 06:41:44 -0400
X-Greylist: delayed 750 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Jul 2021 06:41:44 EDT
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16FAGjEj024180;
        Thu, 15 Jul 2021 06:26:07 -0400
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
        by mx0b-00128a01.pphosted.com with ESMTP id 39tday8yc2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jul 2021 06:26:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFFRoobTLf7gezwK27Dn5CewAEQq44+f5fM+dBv5acRku+lQgJ+jJgV1GovCLaiXUFU3Imq/pVztnDpbtn4ZA+OUk06mG2nN0CHWnrxtkuDLJW4XQxs82DBPrqiQkqSyJfFDOHy41cobfBEO9/MTCSdas2UL0yE5mSvDFS9y9u63wJpGE1dfYL9B3RmYD8mH8W/1jmYkTr2m4VK/8Q3Rk2BSbRZ+avg7Z4Gt+WHw+lFdcS7YlPTCk+fC2UvoT9kMmOyC4XKsFDXQgpvhpN46YUfFD8Q5oFbwpMGQ3yU5pF1zrVuxNeY5NdQRbkq/A53HBQlcruq5jFjSk1ObKGAbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWcPlPhuDtWr1XeqSRzVfn/AFuKCqmKAZzIgBUgHI9k=;
 b=chRLqc/tg5+c+oELXo6Ow0avRk20WeB37SEnqY4OBTkNEsxAvJk8bGY0yri8QOh8zw7TFxy7FzyVtkb0Yb3ajsbsZzqtM1iY61DZ0w7CNvgHzFfv3G5Ma/mxOF+ykG2uf+Z9KFHGUv7y5u4sKfPvyA+IRunK95x8+mr/OuiMwZT3xv2Y7OCjgHiEAvd09p2B1w7NzPy68ne6qKMaPjByK3u/aREY6qwcvNkBVq03sFCVWtoJ1ADLR5FApmVzAODIT7amLqM0obBdPfvvzCaEADSYfTxua5BihcVk1kl33PuKD+Yb9RxDDzGU8iV/0DgeUEL+KblebwBkzjDU61DfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWcPlPhuDtWr1XeqSRzVfn/AFuKCqmKAZzIgBUgHI9k=;
 b=iq1iFis3Q3BhkvVW+U94Vq6wJpFSHhF6DQxf437egkNNdK1RNUXLfZIkfj9QOJIz7JWHptsN0Km9EvhD0qmeX4wd2BfoG7GqT3MXKC62amH66wKGLwLfcksjbcecjKvcOrtjDyMDYFtHmJAoWvha2Q78Yuhv99T+Uu2SVVV6Zl0=
Received: from PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 by PH0PR03MB5862.namprd03.prod.outlook.com (2603:10b6:510:42::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 15 Jul
 2021 10:26:05 +0000
Received: from PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca]) by PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca%4]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 10:26:05 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: RE: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
Thread-Topic: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
Thread-Index: AQHXc/CftWRp4pYREEulee6AuCq4has/nlgAgAQ89UA=
Date:   Thu, 15 Jul 2021 10:26:05 +0000
Message-ID: <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
 <20210712172656.GA2142233@robh.at.kernel.org>
In-Reply-To: <20210712172656.GA2142233@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctMGRjNzViYzMtZTU1Ny0xMWViLThiNzQtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XDBkYzc1YmM0LWU1NTctMTFlYi04Yjc0LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iMzM0NyIgdD0iMTMyNzA4MTgzNj?=
 =?iso-8859-1?Q?M1NTQ3OTU1IiBoPSJPZkhFN1FTYlh3UVRnZUVLYkswd2kzN3hMeTg9IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FJWURBQUF6VjJMUVkzblhBUzNoalVycU54WUxMZUdOU3VvM0Znc0ZBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFBV0F3QUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBRUFBUUFCQUFBQUJPWUdjZ0FBQUFBQUFBQUFBQUFBQUo0?=
 =?iso-8859-1?Q?QUFBQmhBR1FBYVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0?=
 =?iso-8859-1?Q?JsQUdNQWRBQnpBRjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFH?=
 =?iso-8859-1?Q?a0FkZ0JsQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQV?=
 =?iso-8859-1?Q?pBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0Iw?=
 =?iso-8859-1?Q?QUhNQVh3QjBBR2tBWlFCeUFERUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFZUUJrQUdrQVh3?=
 =?iso-8859-1?Q?QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNnQnZBR29BWlFCakFIUUFjd0JmQU?=
 =?iso-8859-1?Q?hRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCaEFISUFhUUJoQUY4QVpBQn?=
 =?iso-8859-1?Q?BBR01BZEFCcEFHOEFiZ0JoQUhJQWVRQmZBSFFBYVFCbEFISUFNUUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBY2dCcEFHRUFYd0JrQUdrQVl3QjBB?=
 =?iso-8859-1?Q?R2tBYndCdUFHRUFjZ0I1QUY4QWRBQnBBR1VBY2dBeUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?iso-8859-1?Q?Q0FBQUFBQUE9Ii8+PC9tZXRhPg=3D=3D?=
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c4cc516-62a3-410d-5a7f-08d9477af401
x-ms-traffictypediagnostic: PH0PR03MB5862:
x-microsoft-antispam-prvs: <PH0PR03MB5862D9AD2C05B5A8F372A27D99129@PH0PR03MB5862.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t7rw1IDngjU6vJklB/mNk6BLU5++z2u1E5wMZ1KnMIKNwfgI5cvZbzR6RmfGvRkxbf7Qq9GWEmlITV8gizxKsMhIH2/UXc61XnUBtKZfCRzYsMKfZdTxa1KHKt1iihCfflw8FbJ4TTda1zzVlNVHZtwl7XOV5F6I1VhI+Bbk0g7HJ3kvWnBJmditIr8zU6m0fVNDUYPUA2o6YjiniuUVvS6qJqav+obD0IXE2PKg4maHPQ4c+zooQEz4KY6d+4WPYh2Gm8CPs9WWKoe5OwbWsd/A28RLKf4TCI42cThSVDK3ZWYAHXg+J1qGwlZ8CoaEYPWvwfy2Ljw5ynOo4VUe5UEUiHIWYUvDP+VcZ0Nqgazh9xWlK3pUf9rPosuU9ACU7nYR9EQwRrbIPBmi7z5PXMm/rlkXvv5C3kfGrAG9Ye5X1iXZzrzYfzH13lTxMTzKOnT6/fF2hoh6WHKkTUvAcoiGNopC3oS6hAkf1rIjpK6BiRTKjOPyMwWf5LAAC12UTZOuAqNHWgKj7yw2ErfyUmQGoqZTYN6M20JU6jMXTCqT29gfLqfBmkipwh16SOOzcQZ8B24Fed7B6vboauqGQ9EhjT5err+MbRqoOPw8KnR+6pOPf9C138hQBX2NRVgF/WGBWoETrM3c0X0VD907VBJOEpNH4tC+7ISc8H4ay1ETRg7WGGvEus6MymWyLRUXgzP1giC3j09n3AQE6yPD5w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6366.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(76116006)(6916009)(66476007)(55016002)(122000001)(38100700002)(5660300002)(71200400001)(66946007)(9686003)(4326008)(86362001)(33656002)(66556008)(64756008)(186003)(26005)(478600001)(66446008)(316002)(53546011)(6506007)(83380400001)(8936002)(8676002)(52536014)(7696005)(54906003)(2906002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+5jWUyJPxoG4/yc7qidZCfEbNY5cPJJKQqtddywBWWhx+sVBPtMjA5ZFpM?=
 =?iso-8859-1?Q?X3XP16wh3ppzF/eQQal/2rZ6Xf9N/lAKXYSnwwkR2DcSLpW+NZkjP+P1xg?=
 =?iso-8859-1?Q?AO9/qHlsha2+0g8LvB6J5tHgvBliOj90cykQYcru4S9RQibxPPJuJyO5C4?=
 =?iso-8859-1?Q?qN+VEFFSJs0WWZNdRCIBXjL9NWo0MtHkGq6dGwVSro5dvLKA24BKbLRhnX?=
 =?iso-8859-1?Q?4TzkLCSm9SKbYWTKvp6J9CW+Y5QY0QeRGoH+pz3ezbRAZgdQXIE4TfE0Jh?=
 =?iso-8859-1?Q?snNfC00qGwQr2gd4mtfk7iLKrL3AwNgm5cL5COata3/zcXA2B7nO+rsc/e?=
 =?iso-8859-1?Q?naqOkTdmCa3VdXJNVp9H5pn12OUstBE8CiqBbFqiSY9LF+PDZmqPdUQHzn?=
 =?iso-8859-1?Q?iW44V11wz+Th0Fup2/FMqhqZeBB3fkxlZXGbC/ctIQpXRALv5NfhU3RDfa?=
 =?iso-8859-1?Q?FOe+MFEbJ/gC0mNghi7KfW+qMdhbesqberHRmAyKVAc1x1fCjwJXNPvdlD?=
 =?iso-8859-1?Q?O7d40nD1K08GF/AP1YF4hD+cWhRXhlWvnB1LG+rYZ5N8s/UE2FBQ8rREdB?=
 =?iso-8859-1?Q?3VgX2QNTzeEeMsvcbZRdNatyWYTXGofXyVB/zSiAgFVCNsah1bX9Ld3Pot?=
 =?iso-8859-1?Q?2SocnUABsGn7JbcTChUqhbLnGPWmtkNlLtZLUDFNtmu7IZQlKLfKrkE8vD?=
 =?iso-8859-1?Q?BJDj2HAl+iHYN5H7RAuIBpyS8Vb681F5w39E/jlLq9kiVkF1XY9JvMxYF/?=
 =?iso-8859-1?Q?5y/GK0V+f8JZ/jHfCpKc4LefHlzTKmxwuHhl01lEkG6lY0v/dXrxnco6nz?=
 =?iso-8859-1?Q?RLb46/rdHiJG3D7ByPGvM+15SvjOcf36p64Vjn8KMcZC8ELIsvmBMcdxDN?=
 =?iso-8859-1?Q?53vJC6MkqvzrApc3t5Ojkcm87zGesnZHpmDyrn1AvzPb/TdXoFxwJgfYN5?=
 =?iso-8859-1?Q?Uo9LDYqZsKVeoUxYvqG52IcwjRGjAzeqNU69aQuwOGyWuS61uPadGNjeQH?=
 =?iso-8859-1?Q?9Wk8b10RCJR502wxP/vaEWpgE2YQE88bPupnhSxovAdei20U9ENCLCreRm?=
 =?iso-8859-1?Q?b98EEZcFc6jr83ajFUWUlqVBRp/M4ZzQvv03TEIRbdE0Xi4+P01G6md7tf?=
 =?iso-8859-1?Q?cUgSo2EB1PJVD+Y7kFFydbmLjXB5J51lItY30EOPRqJJ/6XCHp8bRelHqE?=
 =?iso-8859-1?Q?b/xcqKzbnaiEFxa/g2sravPV0cTooFZDyldc7q8mxWMF9zmxPW/szVMmCR?=
 =?iso-8859-1?Q?Z9tZ+T2qTGLyRQ4nyFT6qhA17so0ngLPqSgiwdfkaHFoYwRDrMYCcEdwZY?=
 =?iso-8859-1?Q?lOLBnc4SX1Imnw2atEmsQWPumBU0kFMg5kEH+D5lalVzvP63lu0z/9AQMA?=
 =?iso-8859-1?Q?2BLdd5xE7G?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6366.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4cc516-62a3-410d-5a7f-08d9477af401
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 10:26:05.3633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9jJ0tnWOFiLkWlPOatZ47qXnhJdK7FWR6iuRW8Yzi6ltz/B1/V86GRkFm4m+rVIWGTH/cth0uZCD/zKRs9YAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5862
X-Proofpoint-ORIG-GUID: bntmIuZI6Q4UkpaEe9CKxWSnh2SfnE8X
X-Proofpoint-GUID: bntmIuZI6Q4UkpaEe9CKxWSnh2SfnE8X
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-15_07:2021-07-14,2021-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107150076
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> From: Rob Herring <robh@kernel.org>
> Sent: Monday, July 12, 2021 7:27 PM
> To: Sa, Nuno <Nuno.Sa@analog.com>
> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> Guenter Roeck <linux@roeck-us.net>; Jean Delvare
> <jdelvare@suse.com>
> Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
> properties
>=20
> [External]
>=20
> On Thu, Jul 08, 2021 at 02:01:08PM +0200, Nuno S=E1 wrote:
> > Add the bindings for the tacho signal evaluation parameters which
> depend
> > on the FAN being used.
> >
> > Signed-off-by: Nuno S=E1 <nuno.sa@analog.com>
> > ---
> >  .../bindings/hwmon/adi,axi-fan-control.yaml          | 12
> ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-
> control.yaml b/Documentation/devicetree/bindings/hwmon/adi,axi-
> fan-control.yaml
> > index 6747b870f297..0481eb34d9f1 100644
> > --- a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-
> control.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-
> control.yaml
> > @@ -37,6 +37,18 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [1, 2, 4]
> >
> > +  adi,tacho-25-us:
> > +    description: Expected tacho signal when the PWM is at 25%.
> > +
> > +  adi,tacho-50-us:
> > +    description: Expected tacho signal when the PWM is at 50%.
> > +
> > +  adi,tacho-75-us:
> > +    description: Expected tacho signal when the PWM is at 75%.
> > +
> > +  adi,tacho-100-us:
> > +    description: Expected tacho signal when the PWM is at 100%.
>=20
> This looks like it should be common. But having PWM percents in the
> property names doesn't scale. This is also a property of the fan, not
> the fan controller.

Yes, I see that these parameters are definitely a property of the attached
fan but the evaluation of these timings are very specific to this controlle=
r
(I think). The way it works is that the HW can fully operate without any
runtime SW configuration. In this case, it will use the values in these
registers to evaluate the tacho signal coming from the FAN. And the HW
really uses the evaluation points like this (0, 25%, 50% and 100%). It has
some predefined values that work for the FAN that was used to develop
the IP but naturally the evaluation will fail as soon as other FAN is attac=
hed
(resulting in fan fault interrupts). And yes, writing these parameters is=20
already SW configuration but what I mean with "runtime" is after probe :).=
=20

So, I honestly do not know how we could name this better... Maybe a
'tacho-eval-points-us' array? The question would be the min/max
elements? Do you have any suggestion for a more generic property?

> There's only so many ways a fan can be controlled and I'm going to
> keep
> telling folks to make a common fan binding. There's some start to it,
> but it needs some work.

You mean the pwm-fan.txt? I gave a look to the driver and I don't think
it fully fits this controller. I'm ok in sending an fan.yaml binding if you
prefer it but I'm just not sure what we would need there... Maybe
pulses-per-revolution and the above property
(whatever the decided name) would be a starting point?=20

- Nuno S=E1
