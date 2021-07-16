Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C677C07E95
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 07:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BC27613BB
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 07:44:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236342AbhGPHrr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Jul 2021 03:47:47 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:40842 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236294AbhGPHrr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Jul 2021 03:47:47 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16G7Z1CX026047;
        Fri, 16 Jul 2021 03:44:36 -0400
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
        by mx0a-00128a01.pphosted.com with ESMTP id 39tw2r9mcp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 03:44:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+1j7aWGYx+82Nazr2guTjf1q54AbxNM/jxG5cqMKGsPXfKgqKvBPK82qATkco6l8b4uzhVWoNZRiuDQrD8BeuwkS3L6EFn9lnDTIKcpFxbu4blN7NWdYtVncNRnHgbIhOXx/u/qpTfRO6Uuxd/jGTqIm1ACR+AUBcdS03LGpZfA1kh+xuGTAs1DT/3BK2oaX9pdbXr8d+ZPimpvI3MfPxGrISx8kdy1wGijcO5Z4f9UYh2IUqwPk+6EsJuhihGnI4NnyCIJecfaV5MTtjcDY2ZfZns8/fYMyD5CEsXKpUtK6+EugLsuEVNYBesEX3oxBN88pjaSS1+gTh3zwz55aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmTGO+hskm85NWV8Pb7TG9laMZkfOzetFOSISM8a4qs=;
 b=ezkcP12FvYSIwWfQQDqjkKfY5EC8Ss9S3goJTi3I9RC1U5LKJiI7AS/IJdcABA3cCNfzm/oKN+NjcV7Y+cW9LvTXwPv2W9PTwkIIGl8xUEloiaGBeD6hbB74Hy7Vyx0VnctfOgpKcuExDxvewdEk8+QNurhjztj1LkAt9Nr+959rPCKk+WGWquj6sbL2by+vi7+0+RU2m0lvFLIObtMUd67adNwjliaeE/sIvLN0jZocHavF6pBJltrvfkDAwitO+9nYBQ2qi1AVEMBjcaQcHjpW7I+hTDoAlI2IujZJouuE/tvkLGm6C5M2dQHJP1JqwNFybSsDCn8cu/EOJrhv0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmTGO+hskm85NWV8Pb7TG9laMZkfOzetFOSISM8a4qs=;
 b=1fEWQhTCzcgSeSElVHeXwiORIG8kwH+lk4QRfucyX8tTK7gLvumycaCf00aDnXFytQ05OcUJSHlGCAq1PvMCtmsunQf/4/wNlY58iunT0HgZL1isi9mekZ5u8qjBg+4a6jKfaYTkTWAfXAAkcJZxFpLW/WknW5lFKD5e8zGVQ/8=
Received: from PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 by PH0PR03MB5831.namprd03.prod.outlook.com (2603:10b6:510:40::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Fri, 16 Jul
 2021 07:44:35 +0000
Received: from PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca]) by PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca%4]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 07:44:35 +0000
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
Thread-Index: AQHXc/CftWRp4pYREEulee6AuCq4has/nlgAgAQ89UCAAK/fgIAAtKIg
Date:   Fri, 16 Jul 2021 07:44:35 +0000
Message-ID: <PH0PR03MB636641D09289D1F696A64C9299119@PH0PR03MB6366.namprd03.prod.outlook.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
 <20210712172656.GA2142233@robh.at.kernel.org>
 <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
 <20210715203937.GA3182741@roeck-us.net>
In-Reply-To: <20210715203937.GA3182741@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctYTdmYjI0MGEtZTYwOS0xMWViLThiNzQtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XGE3ZmIyNDBiLWU2MDktMTFlYi04Yjc0LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iNjExMyIgdD0iMTMyNzA4OTUwNz?=
 =?iso-8859-1?Q?IzNTU3NTQ0IiBoPSIyS29KbzVHOW42TmRyMWkrTUFFejBITUc0eUk9IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FJWURBQUNvZUdScUZuclhBVTAxRzR5OWo5ai9UVFViakwyUDJQOEZBQUFB?=
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
x-ms-office365-filtering-correlation-id: 80b3cac6-008d-4d87-4ef2-08d9482d8e9e
x-ms-traffictypediagnostic: PH0PR03MB5831:
x-microsoft-antispam-prvs: <PH0PR03MB5831CFAE1F0F1548F0DB0FBC99119@PH0PR03MB5831.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tqf/c/7bKKYL42VpkmOpUIMwX6prkxqwDr0eIHlYzm1cM69sjn2WKXTaz/TDiy5L8umOy8L/rbHY65pQvnWolrtjn8WiMntVL1WkHPLam6aI39K2e1Z9dkShigoUGEkM3/h/53j3thXqdX3VI4UYO3WNiCje2LIVXfx/R0hJ3l9f0isep3O/uW1CJeZ21aEXLU85uQZgXzM2qmroWvFFvy7jkv69TwXiirxO2IjaesNUyYjKJWR0r42uagC1poXwUdt9h4KM/1jWxVEPYZjzOZ95uXFxspqsEIXbfi10/TbMzyUExAnTQmnMQoAd30e/5CV6KyHDAEaVyOpC3sUwFJWjk6M8BRaozaDz3CMjgmKbCk/4opbdkE9xU6nCrQWl2aCIgvVNLVqsa769Hoe7fjFBbpdqVt/Pj/R0S2uGSUr0wSrKT4qnBbTBKV4I9KjIatqsbpCNBBhjr7rIcwgupmEP7vB3OSOIiAS73itlxhrAGl/pWJLTTyc+dZfaxqQ3LOmiePFTE7Qrigmd803Te6YRjcBoKwyisOwfWG/t+WPDw61TiVNBidODxKIDuhrA+KcGw4T/F87xSLqUZA2IQiRqM45ikdZgRtXLqPLEw6nabF5amtfPj+8SdCltePr0QTTMOac0qeINmnW3Pz5xEhcRarRBtuLIWXj2ypHMOMtdvGkIR6OUCwq24zNZ0ROo/XAZMmaYMh7LKOHtdIv/Vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6366.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(52536014)(55016002)(76116006)(4326008)(86362001)(66946007)(9686003)(64756008)(66556008)(66476007)(8676002)(8936002)(66446008)(6916009)(5660300002)(186003)(26005)(7696005)(6506007)(53546011)(122000001)(38100700002)(478600001)(2906002)(71200400001)(54906003)(316002)(83380400001)(33656002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/VuViS9iEur9CfUybLXy95kdVQ+NxF1T2r2b54oXKFw6QJmWVAhJLJ1oeD?=
 =?iso-8859-1?Q?I3BROeGeyJLRpbeBNp3G+S8xkVy1ECs0d+9jAeILx5uvgSEScWaon9kVxt?=
 =?iso-8859-1?Q?ArCt3xv41Xkn7KhI94B5oJ79/kGAjiXWUFBKQ4Vtp7bSjWDgbak7vPyD/q?=
 =?iso-8859-1?Q?zRE762gwqg/6a0g+w3TBLHbU+cJXxGQSUzBSQ90T7XAbSbflCnUpeutz60?=
 =?iso-8859-1?Q?3yumMRqYpEfmzuGAff0Ur1wQ5CmULflZlzUlcMSobEHO9DGvZ5lKidw2wA?=
 =?iso-8859-1?Q?bjREFHeR8jBnkgZy1ZUbmKoU08g2nlgaZWt2ItvQIuJnUVcR9qGM0SNs2a?=
 =?iso-8859-1?Q?UotrM01iU+nFOEdp7kaWBYnujLhjfip9WsKQbx8E6flHKmHDPKsqWQn1hA?=
 =?iso-8859-1?Q?Uu7dWRQNnhT+scj7OMzxd5foYlpH2MrkZWLsAzNqI81VYjLCPvl0chCezX?=
 =?iso-8859-1?Q?afNYv7vutqvyiE9L2bM0+Ap3IeMzHP6tlAL/vcS0mCKsMUQfO2pPWYUl3w?=
 =?iso-8859-1?Q?URNdy5jcq8SyHQTyiaFotyoSdiRL4Yr80IlIMA+CyzZkWLFkkvtcLrRNWk?=
 =?iso-8859-1?Q?Zr/Xr8BMe7kidetbjKVo0ymlSBGZMDZiJ2JyNWFLfzlRG0Hv8MUvPxZOP5?=
 =?iso-8859-1?Q?kEIIVgDBG2nCE/vJYBTNi7qZC29LAHZFGrSFUcp3k8W5PwqiQTm7G7t8hP?=
 =?iso-8859-1?Q?Slo3PM7UqCuSvUWn/IU3wQiRUSXwZcTpJh/xUuQlMQxp0egiuXq4tGw8wg?=
 =?iso-8859-1?Q?n0TncfW6wmmtCWZ1fSBZK+AGdbEPdl6o01BuD4j4ftRsM4oja6DB8+C8cd?=
 =?iso-8859-1?Q?2v5F9rUGa+5j+9ecTBgsqKNztjjbI93sPKZXjhaXd1R9lG5vCv0Ggm+MGt?=
 =?iso-8859-1?Q?Do5lnUklkyRrKJi8lAw1EHFf85av6Oy2OwjnwVm98elwow2iAJov13d8B9?=
 =?iso-8859-1?Q?ZhZKFkx5q+DOQOaP5Q0Pag7JTyHOkOU36Nw1CcmchqLCJurR2W6JkkJ4I1?=
 =?iso-8859-1?Q?jm+Q3yYG58LNIOTHMMSjP5AO1lvLQ5LUrEuFJwos2aUL+CaGhqjoR2RYw3?=
 =?iso-8859-1?Q?kjgbe0FuOfKZfSLe/xpaJwDWgSukAITc4aG7zjRkmirbHNbuITcA7MLUa/?=
 =?iso-8859-1?Q?aD8UxYbFWp7LNMO4faquiQRhAfckfrD+npj2jsolsj5aSUpwNKrboA1jf+?=
 =?iso-8859-1?Q?LQXs1hNnuwK5MrDM7X7eMSuAKvcMyaxVIXhbT5mNb2/abLl+5w8xCqQYOo?=
 =?iso-8859-1?Q?nPwANbTLhHLheo/ovJL6ZuJz7sZ0k/Xah7vJMndX2lT/WERaXdm+bBvZ2Q?=
 =?iso-8859-1?Q?Eo4fDCABrx8XZOerE0M80lkc20HaKe7rHtmVJbw+BGxcp1OTj3X1fLG9vM?=
 =?iso-8859-1?Q?nW7n0+ECRr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6366.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b3cac6-008d-4d87-4ef2-08d9482d8e9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 07:44:35.2058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OWi9Ds3qns4VR7yG9/tIGhiXydIev38ts5f4pl3X0CXXh626Z4dUwSQit83zIIW5bWedkCRvVGdycjbztZ4NPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5831
X-Proofpoint-ORIG-GUID: PxTsomnDIgs5gbqyJZfGHosHWxajyoQ_
X-Proofpoint-GUID: PxTsomnDIgs5gbqyJZfGHosHWxajyoQ_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_02:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160044
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
> Roeck
> Sent: Thursday, July 15, 2021 10:40 PM
> To: Sa, Nuno <Nuno.Sa@analog.com>
> Cc: Rob Herring <robh@kernel.org>; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; Jean Delvare <jdelvare@suse.com>
> Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
> properties
>=20
> On Thu, Jul 15, 2021 at 10:26:05AM +0000, Sa, Nuno wrote:
> > > From: Rob Herring <robh@kernel.org>
> > > Sent: Monday, July 12, 2021 7:27 PM
> > > To: Sa, Nuno <Nuno.Sa@analog.com>
> > > Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> > > Guenter Roeck <linux@roeck-us.net>; Jean Delvare
> > > <jdelvare@suse.com>
> > > Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add
> tacho
> > > properties
> > >
> > > [External]
> > >
> > > On Thu, Jul 08, 2021 at 02:01:08PM +0200, Nuno S=E1 wrote:
> > > > Add the bindings for the tacho signal evaluation parameters
> which
> > > depend
> > > > on the FAN being used.
> > > >
> > > > Signed-off-by: Nuno S=E1 <nuno.sa@analog.com>
> > > > ---
> > > >  .../bindings/hwmon/adi,axi-fan-control.yaml          | 12
> > > ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/adi,axi-
> fan-
> > > control.yaml
> b/Documentation/devicetree/bindings/hwmon/adi,axi-
> > > fan-control.yaml
> > > > index 6747b870f297..0481eb34d9f1 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-
> > > control.yaml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-
> > > control.yaml
> > > > @@ -37,6 +37,18 @@ properties:
> > > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > >      enum: [1, 2, 4]
> > > >
> > > > +  adi,tacho-25-us:
> > > > +    description: Expected tacho signal when the PWM is at 25%.
> > > > +
> > > > +  adi,tacho-50-us:
> > > > +    description: Expected tacho signal when the PWM is at 50%.
> > > > +
> > > > +  adi,tacho-75-us:
> > > > +    description: Expected tacho signal when the PWM is at 75%.
> > > > +
> > > > +  adi,tacho-100-us:
> > > > +    description: Expected tacho signal when the PWM is at 100%.
> > >
> > > This looks like it should be common. But having PWM percents in
> the
> > > property names doesn't scale. This is also a property of the fan, not
> > > the fan controller.
> >
> > Yes, I see that these parameters are definitely a property of the
> attached
> > fan but the evaluation of these timings are very specific to this
> controller
> > (I think). The way it works is that the HW can fully operate without
> any
> > runtime SW configuration. In this case, it will use the values in these
> > registers to evaluate the tacho signal coming from the FAN. And the
> HW
> > really uses the evaluation points like this (0, 25%, 50% and 100%). It
> has
> > some predefined values that work for the FAN that was used to
> develop
> > the IP but naturally the evaluation will fail as soon as other FAN is
> attached
> > (resulting in fan fault interrupts). And yes, writing these parameters
> is
> > already SW configuration but what I mean with "runtime" is after
> probe :).
> >
>=20
> Are you sure you can ever get this stable ? Each fan has its own
> properties
> and tolerances. If you replace a fan in a given system, you might get
> different RPM numbers. The RPM will differ widely from system to
> system
> and from fan to fan. Anything that assumes a specific RPM in
> devicetree
> data seems to be quite vulnerable to failures. I have experienced that
> recently with a different chip which also tries to correlate RPM and
> PWM
> and fails quite miserably.
>=20
> In my experience, anything other than minimum fan speed is really a
> recipe
> for instability and sporadic false failures. Even setting a minimum fan
> speed
> is tricky because it depends a lot on the fan.

I see what you mean. So, I had to go through this process when testing
this changes because the fan I'm using is different from the default one
used to develop and stablish the default values in the IP core. The core
provides you with a register which contains the tacho measurements in
clock cycles. You can read that for all the PWM points of interest
(with devmem2 for example) and make your own "calibration". I assume
that people have to go through this process before putting some values
in the devicetree. I'm aware this is not the neatest process but I guess it=
's
acceptable...

> > So, I honestly do not know how we could name this better... Maybe
> a
> > 'tacho-eval-points-us' array? The question would be the min/max
> > elements? Do you have any suggestion for a more generic property?
> >
> I am guessing that the "us" refers to the time between pulses from the
> fan. I think this is a bad value to start with - anything fan speed
> related should really be expressed in RPM, not in time between
> pulses.
>=20
> Overall I don't think this should be handled as generic set of
> properties.
> Whatever we come up with as standard set of pwm or fan related
> properties
> should not be an expected correlation between pwm and rpm.
> Assuming such
> a property is needed here (after all, the controller is what it is),
> maybe a set of tuples makes sense, such as
>=20
> 	adi,pwm-rpm-map =3D <
> 		25, 250,
> 		50, 500,
> 		75, 750,
> 		100, 1000
> 	>;
>=20
> though I think that each of those should also include the tolerance
> instead of just assuming that a 25% tolerance (as implemented in patch
> 2/6) would work for all fans.

Yes, this makes sense thanks. As the HW default tolerance is 25% I was=20
somehow attached to that. Since all these values are correlated it makes
complete sense to also give the tolerance here as it makes things more
flexible. The map is also a good tip, I just have to see if there is a nice
way to specify that the pwm column is constant...

Thanks!
- Nuno S=E1

