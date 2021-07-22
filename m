Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354A5C6377D
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 13:01:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DB576135B
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 13:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhGVMU6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jul 2021 08:20:58 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:25792 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232105AbhGVMUv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jul 2021 08:20:51 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16MCtmGG019674;
        Thu, 22 Jul 2021 09:01:01 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        by mx0a-00128a01.pphosted.com with ESMTP id 39xvy5adsm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Jul 2021 09:01:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8CRUewO6RJqj8YL3atmGvsgiL6ti9uBdbGRJG1XfRKqAr3GBV2+3AooLgTo9ovqNUkIRUu8bvA2JN0m74scAw45pwLE/QnqSeupOaj9ZZW7TInY/fQnOFLZEtEdL6v60GplpoYcBPS/WJdaLEkUE6k3A413z08wbVbtA69A37CexpYGgQF8NHhH8mtwftd6ZPTSEbkxHSK/aq8tkErUMoebW2hfO+YLgKZ12sQkqByTVib1O4ubGFcnTVjkonDxj7cR2uN/0vYZ1LHiqz8KnqXqmikZ8zHWJqbUFg7JxPJc1R/hKKuvrRzNJ9cpuRKRtksHO8C+lXqXPp4JbOTlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVvu0Xa228FuzlaoESuTfs56HfoZSRSpHozxk0KTeN0=;
 b=ULHccYvaQdhycDy9q5sifCHF1M3Uzh3KU1JVID8U/hCwVKTslnHHbeT2r1+7Y0zTwCLeLHrVJ0IaMIEI0vW/R72Q2kF7i9zRX4vCnh+Z2LegTyRZXKVItZ9AzYciMCNnw8rLvj9CMYAdN9ccdUN78euOScyQF7Bwf8dNG4bKpEy+BXpoQ9d/ZcrHN00hIHGoiPGN06eDAcxwJKcDjYgQogYr6lcHmIbItEXlP77zdj32AlgqqKUdEJ27C9nKFRxozAHnw0HqSmKH9eCVA2KMzHIJz9q9HCgXBTOUkDMkIbluSDGRCecw/8/xTmmT8xWdpN4LQzh0MqGR0V6IciggRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVvu0Xa228FuzlaoESuTfs56HfoZSRSpHozxk0KTeN0=;
 b=0QOzHG/gPHSP0Ak1qfwMDbo8g/URa/1ingjiLYdna5uF+KFl/OUIgJeXXOOpY4sqX21IUyETkTO2u2WXydreogxE/5vvdPg8gdyWh/W+9Jt63jKIYq9IjBMBBJdSlOLD4BuVG72bwD++eEvukXgAIDHEuNn5+42IzAsVgqYrT3Y=
Received: from PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 by PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Thu, 22 Jul
 2021 13:00:59 +0000
Received: from PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca]) by PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca%4]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 13:00:59 +0000
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
Thread-Index: AQHXc/CftWRp4pYREEulee6AuCq4has/nlgAgAQ89UCAAK/fgIAAtKIggAB/4YCABDeOgIADox4AgAEL3CA=
Date:   Thu, 22 Jul 2021 13:00:59 +0000
Message-ID: <PH0PR03MB6366BFF27EB69694904C226B99E49@PH0PR03MB6366.namprd03.prod.outlook.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
 <20210712172656.GA2142233@robh.at.kernel.org>
 <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
 <20210715203937.GA3182741@roeck-us.net>
 <PH0PR03MB636641D09289D1F696A64C9299119@PH0PR03MB6366.namprd03.prod.outlook.com>
 <f6d415a7-e113-1dda-727e-0d645c8114cb@roeck-us.net>
 <PH0PR03MB636618FE5E821669E224960199E19@PH0PR03MB6366.namprd03.prod.outlook.com>
 <20210721150018.GA3446170@roeck-us.net>
In-Reply-To: <20210721150018.GA3446170@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctZGEzNjA1MDUtZWFlYy0xMWViLThiNzUtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XGRhMzYwNTA2LWVhZWMtMTFlYi04Yjc1LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iNzI0NSIgdD0iMTMyNzE0MzI0NT?=
 =?iso-8859-1?Q?cwMzMzNTI0IiBoPSJBdk9SNUNvNk5jOEdDVm5JSFhETTVMSXJRYU09IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FJWURBQUJVNFo2YytYN1hBYTNhUVRzekhlZXNyZHBCT3pNZDU2d0ZBQUFB?=
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
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a2320e6-6571-45df-4b45-08d94d10c06f
x-ms-traffictypediagnostic: PH0PR03MB6366:
x-microsoft-antispam-prvs: <PH0PR03MB63663E40515C1060A969B8B599E49@PH0PR03MB6366.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vj3sakO8Rm2Zg92WWoKJ6h1hkCjuKGcaKSHi52IMrT1GT0D/iql0P09rB1C0KCEZ/jOT9YKbKE1lfCdLxx7IEMGD5GlR2fABeiZzHSVkBVhCF8GiFlP+KN1zOCuQcRN4ubSU7znPgwniZCylvQF6g/lCPJ46g7aGfH1utZLkapJeRprk9TMWwaa0EOj2ChDhQncxrGDvUG5WunpaTvIbW4bVNYgfdaxb/N7lWUuC1OAWvQ8goVPgqjHLEkdk8I5wqkU8yMhBID/KnjT94v0UM4iYk/Z+hD7IApGlDF3AdYJRWPN4k4GtsUoI7snCgUgAnt+bubP5wz4+x6iVDsi/L7ZHchqyzYxNGh/jcDcS4QEmYD/KFLe2boVCwn8lccATok7zFE8QeqzC9UvN4KbNi6c01HwYCGGzEqbRsMur8tjt+b2RQQZNfxizaqVYAORRhx5bv7AN7dq9tPMYkngB/nN+iXnn23Hb/Cbg2Je63sVvjV27BLMuPbKgwT8bHxyQAOJAGfuGdrImKxajP4OdMAnOotkPez1/AcEdL4FUQ77qYHdBiI7165D7sN97tx2C96XwLQa3IVfXC1bXpay0wxBG0swGgsiUBZVMNusdrxAbRHTszHceCCgTzeU8SjW2rHgSs6Zy8ctU3S0sQJ8PPh+cTGx8yhIeXv+G0KAksQ9BmT61MZzL0mfnKjrjDfLeOoBti+i9KpLXWxLFjwBd6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6366.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(186003)(64756008)(478600001)(8936002)(38100700002)(53546011)(316002)(26005)(54906003)(7696005)(5660300002)(6916009)(86362001)(4326008)(66446008)(8676002)(83380400001)(55016002)(2906002)(76116006)(9686003)(122000001)(52536014)(6506007)(71200400001)(66556008)(66946007)(33656002)(66476007)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?be+zmS0efnAFvhgb8T4577wePkDbU81e61caOC6iq4E1knz89bX3aPcc0X?=
 =?iso-8859-1?Q?OdlUkD/rvUOw8DP4ilV0BEu+aEPDTzq8RjPt9dZnmUg3L+mRDMw8jhiJ9d?=
 =?iso-8859-1?Q?sliQSB9NLjMuPyb2xskKHKFtPskQMhMDSuXPQnm5ICOsR0sWrhgzR2s5Gh?=
 =?iso-8859-1?Q?AWz54Uo5QMjHPunNo7UhJ+qHsiDUc0UDpjX5jnzeO3Wtv+yZX03nSz0HQO?=
 =?iso-8859-1?Q?SIX7DfWuvTNkL8Ogf+ka/icsct5H2Q4+ejYJYHz6OE5YsqDRLPbmoHtJFu?=
 =?iso-8859-1?Q?PmcwqiZqazdjU+iLQqAkEbIWh+cQif8Om4+paWowkdgjex+JaF3YjMprnE?=
 =?iso-8859-1?Q?hcF+5BEKLehuqIDX6UC1bTnbQNdlYiVvvPBU+zlVaWrG+CSpSvyZ2m/UOy?=
 =?iso-8859-1?Q?P/atPYLx4Avh+f6mhhyeC6/SNqlUJoGg7EhNewaAaLwDXZ/faS1AaIOpDw?=
 =?iso-8859-1?Q?Qr+aMrn8P1hEVrL2F67ZyBiSbmNAH4JxZNgPo7mq8RPrR+6obQl/jX/Su7?=
 =?iso-8859-1?Q?gqqhzZT1lcPk3VRMEYzlx1zxmkSbX4W0F5L41yWwKiMYAQipRqzJ1uTkVB?=
 =?iso-8859-1?Q?3y/G27PyjIoyYq0955QVYvPwTGzn1z/4hzAXsLkCm0xbkbP5/4vHCzSrw8?=
 =?iso-8859-1?Q?OVuQUF5w0zqKL1lZAnotCh210+Gfs3TENAIUvvGYrii5+7XOVBDEJqUQ2e?=
 =?iso-8859-1?Q?UD//OOOPFsuVZn3oxCNgdGhm+45oJRkQQE6A/m+GWh+zwPmfl0j5U0J+q2?=
 =?iso-8859-1?Q?oRjSYJq6vYuwmbETG5UkSM6L3DFHAOlZ+j7XPCWVd/IEDZtzTK3yfP70ly?=
 =?iso-8859-1?Q?Zu0w17uf8Q6achDRsIhlIfVY6crsYelH0I9QF1naJ4/IIZ1IDdFvxdIBMB?=
 =?iso-8859-1?Q?hOjAupdR9YWn8+39PrnInA2py3DM96lx1i4/+QFeEssah0fyVjkZIinLnu?=
 =?iso-8859-1?Q?cHbYwHjgadnxyuDkMlgDAowD88Lo/zPjEp/P6dWizKxffkMOP/jgswmv+x?=
 =?iso-8859-1?Q?dQyRt0Qa/gm6PwHzbbjysRVbJvene+0AJrf2oI4D9MVUM7SOH59WAVaVtg?=
 =?iso-8859-1?Q?wZx8GmjTI7yPZ+g9CStNE5wCNumcdb4bslZ45YyRj+GrM8cAc2YPd0fOFx?=
 =?iso-8859-1?Q?pN6CQXfY6jpNcgttnFhLcvuBqdUzqQV1XzhBc08gd/mkrjAVSrcPa4TSb5?=
 =?iso-8859-1?Q?w0ZXVegIHBp0YuX2p903hVJaNVMPe+a2p4HCBf1twEmR3MoLped2Ilnyfp?=
 =?iso-8859-1?Q?n2Ilf+OvqJrUmCz2pkeskG7V5G/G7zW/0YMHxdo4QkqIaewesIxDfGvukz?=
 =?iso-8859-1?Q?ZHeGT7IqEb6weNnryu5Rjevj2r4J5s0ufZvBWUOkezUAvTz9349i6yvW/o?=
 =?iso-8859-1?Q?WkMJrk7ghr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6366.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2320e6-6571-45df-4b45-08d94d10c06f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2021 13:00:59.1895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMCA80cYDw/gFBfNlajaBjNO2E7nf07jaYFXf2qW+Gb3jNCISILEPSGz0BNOcYufzajeDZud30DKq8W0AejmyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6366
X-Proofpoint-ORIG-GUID: fvbQyxlAnQZ5El8qgXr2qIzTqsD6QvJT
X-Proofpoint-GUID: fvbQyxlAnQZ5El8qgXr2qIzTqsD6QvJT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-22_07:2021-07-22,2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220086
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
> Roeck
> Sent: Wednesday, July 21, 2021 5:00 PM
> To: Sa, Nuno <Nuno.Sa@analog.com>
> Cc: Rob Herring <robh@kernel.org>; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; Jean Delvare <jdelvare@suse.com>
> Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
> properties
>=20
>=20
> On Mon, Jul 19, 2021 at 07:46:41AM +0000, Sa, Nuno wrote:
> >
> >
> > > -----Original Message-----
> > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
> > > Roeck
> > > Sent: Friday, July 16, 2021 5:04 PM
> > > To: Sa, Nuno <Nuno.Sa@analog.com>
> > > Cc: Rob Herring <robh@kernel.org>; linux-
> hwmon@vger.kernel.org;
> > > devicetree@vger.kernel.org; Jean Delvare <jdelvare@suse.com>
> > > Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add
> tacho
> > > properties
> > >
> > > [External]
> > >
> > > On 7/16/21 12:44 AM, Sa, Nuno wrote:
> > > [ ... ]
> > > >>
> > > >> Are you sure you can ever get this stable ? Each fan has its own
> > > >> properties
> > > >> and tolerances. If you replace a fan in a given system, you might
> get
> > > >> different RPM numbers. The RPM will differ widely from system
> to
> > > >> system
> > > >> and from fan to fan. Anything that assumes a specific RPM in
> > > >> devicetree
> > > >> data seems to be quite vulnerable to failures. I have
> experienced
> > > that
> > > >> recently with a different chip which also tries to correlate RPM
> and
> > > >> PWM
> > > >> and fails quite miserably.
> > > >>
> > > >> In my experience, anything other than minimum fan speed is
> really
> > > a
> > > >> recipe
> > > >> for instability and sporadic false failures. Even setting a
> minimum
> > > fan
> > > >> speed
> > > >> is tricky because it depends a lot on the fan.
> > > >
> > > > I see what you mean. So, I had to go through this process when
> > > testing
> > > > this changes because the fan I'm using is different from the
> default
> > > one
> > > > used to develop and stablish the default values in the IP core.
> The
> > > core
> > >
> > > Exactly my point.
> > >
> > > > provides you with a register which contains the tacho
> measurements
> > > in
> > > > clock cycles. You can read that for all the PWM points of interest
> > > > (with devmem2 for example) and make your own "calibration". I
> > > assume
> > > > that people have to go through this process before putting some
> > > values
> > > > in the devicetree. I'm aware this is not the neatest process but I
> > > guess it's
> > > > acceptable...
> > > >
> > >
> > > Do you really expect everyone using a system with this chip to go
> > > through
> > > this process and update its devicetree configuration, and then
> repeat it
> > > whenever a fan is changed ? Given how dynamic this is, I really
> wonder
> > > if that information should be in devicetree in the first place.
> > >
> >
> > My naive assumption was that we would only do this work at
> evaluation
> > time. After that and after we settled with a fan for some system, I
> expected
> > that changing to a different fan is not that likely. From your inputs, =
I
> guess
> > this is not really the case which makes this process more
> cumbersome (as it
> > also implies recompiling the devicetree for your system).
> >
> > However, even if we export these as runtime parameters,
> services/daemons
> > will also have an hard time doing this "calibration" in a dynamic way.
> The reason
> > is because the way the controller works is that it only accepts a new
> PWM
> > request if it is an higher value than whatever the HW has at that
> moment. Thus,
> > going through the calibration points might be very cumbersome. I
> can see some
> > ways of handling this though but not very neat...
> >
> > Since this is a FPGA core, we might have some flexibility here.
> Something that
> > came to my mind would be to have a calibration mode in the HW that
> would
> > allow us to freely control the PWM values. In that way we could go
> freely over
> > the calibration points. I guess, for safety reasons, this calibration
> mode would
> > expire after some reasonable time (that give us enough time for
> doing the whole
> > thing). The best place for doing the calibration, I guess it would be
> directly in the
> > driver since we do receive the interrupts about new tacho
> measurements making
> > things easier to sync and handle. However, given the time that takes
> for a new
> > PWM to settle + new tacho measurements, it would not be very
> acceptable to do this
> > during probe which is definitely also not ideal (we could defer this to
> a worker/timer).
> >
> > I'm not sure if the above makes much sense to you and it also
> depends on the HW
> > guys being on board with this mechanism.
> >
>=20
> I don't really know what to say or recommend here. Personally I think
> any
> attempt to tie PWM values to RPM are doomed to fail. Here are a
> couple of
> examples:
>=20
> Take your test system and move the fan to a restricted place (eg close
> to a
> wall). You'll see the fan RPM change, potentially significantly. Put it i=
nto
> some place with airflow towards or away from the system (eg blow air
> into
> the system from another place, which may happen if the system is
> installed
> in a lab), and again you'll see fan speed changes. Open the chassis, and
> the fan speed will change. I have seen fan speeds vary by up to 50%
> when
> changing airflow.

Here we can at least control the tolerance for each PWM vs RPM point but
I can image this as a very painful process to get these values right and no
one will think in setting tolerances of 50%...

> That doesn't even take into account that replacing a fan even with a
> similar
> model (eg after a fan failed) will likely result in potentially significa=
nt
> rpm changes.
>=20
> Ultimately, anything that does more than determine if a fan is still
> running
> is potentially unstable.

Yeah, I understand your points. The HW does the evaluation and of=20
course it also looks for the presence of a signal... So, in your opinion,
not even setting a minimum fan speed is likely to be stable?

> Having said all that, it is really your call to decide how you want to
> detect
> fan failures.
>=20

Well, my hands are also tied here. The core is supposed to work without
any SW interaction in which case the tacho evaluation is always done. The
only thing I could do is to completely ignore fan faults which is also bad.=
..=20

I can try to persuade the HW guy to completely remove the evaluation and
just give fan fauts in case there's no signal but I'm not really sure he wi=
ll go
for it. In that case, I'm tempted to just leave this as-is (with the extra =
bindings
for the tolerance and turn these bindings into a map) if you're willing to =
take it...
The reason is that, as you said, this is likely to be unstable any ways so =
that the
added complexity in the SW does not really pay off (better keep at least th=
e SW
simple)...

- Nuno S=E1
