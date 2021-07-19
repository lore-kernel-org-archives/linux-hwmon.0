Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DC5C12002
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 07:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6405F6100B
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 07:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234822AbhGSH0m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Jul 2021 03:26:42 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:2136 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234559AbhGSH0l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Jul 2021 03:26:41 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16J7AY3L011397;
        Mon, 19 Jul 2021 03:23:27 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        by mx0a-00128a01.pphosted.com with ESMTP id 39uv48ngsm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Jul 2021 03:23:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxWC/My+JiPMR82gKL31E5ZFHNRKkJnFuw+f+ng7sI9ULqf4nVKYttHo+rLplkrxz1fwQ6JXvKFpmowKhVLINc4A2lulx+Rzn+ysPZgSfGvHaoBXZK2ucUPiEsQrRxwVzyfv08KTWGCSIsjs+KpG9FEPCAM+Fs/vOzlJ0O+4yaOM4Hjpyt7IK/SRezlizaMhZwew8SsrFVzttoFvOetCR3HIomTEmof5Iijse25Z72z1T1vNsASLGM2DYb451mnV+zonC7r8v1yKsN6ztIsOlWON22Zq32lzsNkQuUPL3oeTSkZd/z5looaVm053N2hwoTPmhmGm9SV+MtwG19i/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/Ptb26/F34R500FJH0HwZQKl+c19xEsNLVbni2QtPM=;
 b=c3KqRMaAvWVaMuFZw9nCdq/UQNdPTSMvtxOx0KAum4LpaL0OMUQRNToAhB2HcJn0T6pBA1S5tZrF88/O56gnCMvEfyDm/62NUd/ay5wxWP/h+YDDfpMbkpZUIoQbx8u5CSF4spFsd/SpT62ulPCbiuInRp/XIICnKRuumBZMnOYvX0DCCBg+V8bYGK9avfavNAfGxyduFRcpDbhhZkFGgKmtQGVyFEx4lRyG1HC0O/BNFjeOIqIMa9SGJQJApOTKB/QlYyYPjtq6LeFoRo18g/ICpwDxcy/0tqVm2YsXXdEC1aCBsUZ/Itcxds/jBnZ93XACKDCFxXyJY83ma/RceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/Ptb26/F34R500FJH0HwZQKl+c19xEsNLVbni2QtPM=;
 b=D3jjtoIOR5fOBxO1b3MPZ9MVXOylSzOKyT01h323/03VOSHfD+W92vzgT62CNGusB7GxrQ26PekflNCCYdRzMP2eWjRuo91WF9vfX5UM89kD12kxY8DgmohJu5sKNCBcocr/mrLHP0wnP+vOvHnGW9fJ1g8bebXqNhd+o6PlDa0=
Received: from PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 by PH0PR03MB5880.namprd03.prod.outlook.com (2603:10b6:510:32::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Mon, 19 Jul
 2021 07:23:25 +0000
Received: from PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca]) by PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca%4]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 07:23:25 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: RE: [RFC PATCH 6/6] hwmon: axi-fan-control: support temperature vs
 pwm points
Thread-Topic: [RFC PATCH 6/6] hwmon: axi-fan-control: support temperature vs
 pwm points
Thread-Index: AQHXc/DWZPSBv17ydEqvW0XR9aKxs6tHeNmAgAJ846A=
Date:   Mon, 19 Jul 2021 07:23:24 +0000
Message-ID: <PH0PR03MB63661256CFF2A93E99D38B1299E19@PH0PR03MB6366.namprd03.prod.outlook.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-7-nuno.sa@analog.com>
 <20210717172249.GA158182@roeck-us.net>
In-Reply-To: <20210717172249.GA158182@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctMzFlN2ExMjYtZTg2Mi0xMWViLThiNzUtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XDMxZTdhMTI4LWU4NjItMTFlYi04Yjc1LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iMjQzOCIgdD0iMTMyNzExNTMwMD?=
 =?iso-8859-1?Q?E2NzkxMzYxIiBoPSJKcDdQQ3BnbUIvZzZJL2krcEtRbXpla3gzT3M9IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FJWURBQUJCMnovMGJuelhBWmlLYzRjMjRHYzJtSXB6aHpiZ1p6WUZBQUFB?=
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
x-ms-office365-filtering-correlation-id: 57860114-a0c8-4c2f-c914-08d94a8618bb
x-ms-traffictypediagnostic: PH0PR03MB5880:
x-microsoft-antispam-prvs: <PH0PR03MB58805EDBA6A5F06F3268683699E19@PH0PR03MB5880.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1vr9OnaiHmgtB5miBWbwt2xZKgMP6jFY5spVQzhXtK7cnUwR6+yONQZ0xGfNKgxGJxBNaAdVUxnksG2FZRvoebjvRvgJXdcnzFjEwtyWnTDDUvzmfJtkefMcWM8Mxu65seRZWH4gwc72NkIcLeHqlO7oAzh8n8C2gBpAm3r3FCWhA4FjSPxN/AwLPjBZJqsUW4t/IB+hnFLugbjpIgM64OPQokPtZ/L2bUO+J6U2Tvc75lxjP5cfeXUPJgGeGzURHqU3ph3j0++F5hWK1grSTz3WuAAViQ6ih08NoMxP5gJXpzwytMfn7R8e+CkD5cbaV24pnTHuhD7JVng4QT0kchatZDtL8H3hZhG04qLmVLTAs1j0SaXNLI5wvb/UjUjARUyDdKW3UQKOgF0vuTgvWqseJXp/7H6GCax+ESDJRlq+kDVqMf/82JSOm2KTcCtQMyUK2MoNMHNR3kyDMB4drAR3wUTYoeXNqdAqA5kWWSqBpibrPeFOgf0EgYfnIk5xC05vqeTJ73jPwLa60uLtH0Z6fFZZ7CJ0Xw8zIlThH6qSFfuMj2WOt3ZgoMRzd+SoP6FJGk9D5kg26URfigwoRjjJZqZnSvI5cth0aq/+VRnVgJD+JE9tzyN56MfBQVTJ6lhqFqlVz9wwqKUg9VIwc5jHEY8Cd6S2DAVFZ2t5x3Ag0yyfBV2VjXtb7j5TWL9kzlgijErPCO4tPnO2o56Oow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6366.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(83380400001)(26005)(186003)(76116006)(33656002)(66946007)(66556008)(55016002)(9686003)(64756008)(66446008)(52536014)(66476007)(53546011)(6506007)(8676002)(7696005)(316002)(122000001)(8936002)(86362001)(478600001)(38100700002)(54906003)(71200400001)(5660300002)(4326008)(6916009)(2906002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?f/BhWM/GY9zoucZlMkrmPKM5kMOdCdHtdMDuHsHbVXwJ/Kv5KaBnxtRJXl?=
 =?iso-8859-1?Q?ZsrM8Xbdw/1RzKT71rQ/iuJBLjXGnCWN4/BHWUZ0VzyXDAWErk97DH93q/?=
 =?iso-8859-1?Q?606mu+u7FVGo1XbMWkwWdtHE/yauTMn/+4Q7Sm9gvyzAOmis7cBHwqd2Nh?=
 =?iso-8859-1?Q?6iuitkn5vE/FT9JMmdTCT/RFrI4Y/frLLbEVGN39n/LT08fZCMb5Bjg3ta?=
 =?iso-8859-1?Q?y/bJ4ZpIii7frSCwlwtYXV2eUWDfbrUxS1MY4g6zJbli5ZLsOK6qxdePo6?=
 =?iso-8859-1?Q?LlJNp+SfIDqTHp0sqhYanwndcxux6DPKoqCDwbJlCwdFPD1Os0rnA5VbSy?=
 =?iso-8859-1?Q?U6Obqzt3Lt5jVQHKzkmzMMYAthGXK0HFuWfVtOpA76irvry0MiLxCt0FkX?=
 =?iso-8859-1?Q?NqMHcRojRWIOE+QoUWMhNRCHFSpgZbm4AHlG9SOYNfAV5hNCxRItv4jkm6?=
 =?iso-8859-1?Q?EHnmk3m/hyDJ9KpbNmqUqDkdyOqG740sSbCzAgcNQvUezrerrj6k379WWF?=
 =?iso-8859-1?Q?Av47cKqgTie1K4/Xg9D2cvXV9Dwl3GGtcYDfGzTPALU//aopY+YeRWFOSF?=
 =?iso-8859-1?Q?RyYbcevmk5z/2ee0132fU5shXmo1cjOWekS09PTtejd1WMFzGbHEX/HWhV?=
 =?iso-8859-1?Q?LkCu33oRQKlXc5a+aNhBllOHIxYXFo1o9xii4SM5PJK2th+M5KBjN63+9/?=
 =?iso-8859-1?Q?eXwzstrf6wcSDeyLZvIyVD6mxx9s1D9wQd923cdvoG5NL6/4S+vDVcpyh8?=
 =?iso-8859-1?Q?drOU5OPkLfLitl9ylkRR5OAcipAs64BcSMFG9SEt0bqTte9GKwrs4/7r4k?=
 =?iso-8859-1?Q?ky5sXuCEuY+DvR9y4jKKpZZKdkBPpLfFWa+jiHSMDeAmPYPO2rriIXhJPG?=
 =?iso-8859-1?Q?K6qYy/WhAKtPACbk7oZ1eMFCR6i/P1khPqW6cNeKcuuHuZV6L2Z1nCeu0I?=
 =?iso-8859-1?Q?DznyiQV6wETbrebAeo+PDOKj40uUQpAbsuH4dL8rBAx5LARqs6wsbhN7rl?=
 =?iso-8859-1?Q?RKfhotDashqUvlIDt5Qwg4TwvGI+ZKjUhxmYrlQ9fSeFurWRrKpDw203ax?=
 =?iso-8859-1?Q?PcDBFu4OLx9r1KNgauBqNtWYv/qaHP6Z2XC2oxCZeYpvueDbyyXWGbV1Il?=
 =?iso-8859-1?Q?gE5YP4NCl3MSyN+nrMO/rHwSMzQQ96Gkd2FQ13z5tDvPPlcSviDze/Qxo1?=
 =?iso-8859-1?Q?5uIAeZGGHA7CnP0+Ahf+CFHaLJ49iQ8VPa0bC287YK5Qd44WeVjPUVrxWD?=
 =?iso-8859-1?Q?PLvuSFZ5b6rYa612kYq5/2Q+qYrsR7xPLCoXft4Zspqj9EQAQkhgjI1zAi?=
 =?iso-8859-1?Q?e52hNoMznGlm2QgN7U+Guct5UACW0Mf/MAKRkdYBxyQCnGlmL4YsVwCXEQ?=
 =?iso-8859-1?Q?aFPbiuBqrM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6366.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57860114-a0c8-4c2f-c914-08d94a8618bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 07:23:24.9832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +0prEqDe5DNJe9yCu0jtaYqGVM0iBtgCXGCLkwWQrO7s07+MCC+7MO6aSCpGU7AMpUA9P9CbH1UsQy9U1jsE2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5880
X-Proofpoint-GUID: VFClB-yPeQXYxCagfiwiODSXbP51vE_z
X-Proofpoint-ORIG-GUID: VFClB-yPeQXYxCagfiwiODSXbP51vE_z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-19_02:2021-07-16,2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107190041
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
> Roeck
> Sent: Saturday, July 17, 2021 7:23 PM
> To: Sa, Nuno <Nuno.Sa@analog.com>
> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org; Rob
> Herring <robh+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>
> Subject: Re: [RFC PATCH 6/6] hwmon: axi-fan-control: support
> temperature vs pwm points
>=20
> [External]
>=20
> On Thu, Jul 08, 2021 at 02:01:11PM +0200, Nuno S=E1 wrote:
> > The HW has some predefined points where it will associate a PWM
> value.
> > However some users might want to better set these points to their
> > usecases. This patch exposes these points as pwm auto_points:
> >
> >  * pwm1_auto_point1_temp: temperature threshold below which
> PWM should be
> >    0%;
> >  * pwm1_auto_point2_temp: temperature threshold above which
> PWM should be
> >    25%;
> >  * pwm1_auto_point3_temp: temperature threshold below which
> PWM should be
> >    25%;
> >  * pwm1_auto_point4_temp: temperature threshold above which
> PWM should be
> >    50%;
> >  * pwm1_auto_point5_temp: temperature threshold below which
> PWM should be
> >    50%;
> >  * pwm1_auto_point6_temp: temperature threshold above which
> PWM should be
> >    75%;
> >  * pwm1_auto_point7_temp: temperature threshold below which
> PWM should be
> >    75%;
> >  * pwm1_auto_point8_temp: temperature threshold above which
> PWM should be
> >    100%;
> >
>=20
> If I understand those correctly, half of those are really hysteresis
> points.
> I think it would be better to express this with
> 	pwm1_auto_pointX_temp
> 	pwm1_auto_pointX_temp_hyst
>=20
> where the hysteresis point is the temperature where the previous
> pwm value
> is activated. In other words, change attribute names as follows:
>     for 25%:
> 	pwm1_auto_point1_temp -> pwm1_auto_point1_temp_hyst
> 	pwm1_auto_point2_temp -> pwm1_auto_point1_temp
>     for 50%:
> 	pwm1_auto_point3_temp -> pwm1_auto_point2_temp_hyst
> 	pwm1_auto_point4_temp -> pwm1_auto_point2_temp
>     for 75%:
> 	pwm1_auto_point5_temp -> pwm1_auto_point3_temp_hyst
> 	pwm1_auto_point6_temp -> pwm1_auto_point3_temp
>     for 100%:
> 	pwm1_auto_point7_temp -> pwm1_auto_point4_temp_hyst
> 	pwm1_auto_point8_temp -> pwm1_auto_point4_temp
>=20

Agree, it makes sense.

- Nuno S=E1
