Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17F0C6FD1D
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Apr 2023 07:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbjDDH7K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Apr 2023 03:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjDDH7J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Apr 2023 03:59:09 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9165198C
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Apr 2023 00:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkJ0Y7Ghtf/UCX+beSAoOh8Kz/5hqpEl+OUTYyQSRUanWeeMOq0Be25N7loaj50ilriE1ey9HRfbUqARFURcAH4i20s1+1Ed72WDLUVxHq4+E7MTNhxORSU+YwKplhNDIhb6JErtxptmsb7kD/bWhCC+dmJ53bwbITTOLgiVzB2Ja/MqbfAPaEEzPCBDCf1YzmwMHseAqj5ENKZLp86YuShY1o6tGROtTKJFczU/9Us5bjOTHkWpSr1YbbG+oZLJPI5U3PR9r6sVSufndvXkXE5BtFO4pMvb2yKnkP0SyI38RJAZ2Teen8wEmQBonkmg4G6dXZydXaeEvb0sQrPlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyL1FL9QFuwCPwEafybWAq2u1PwwIATEDbBM4nMrF0w=;
 b=XQkXyRjE5Hqb+t5eIzDcNHFC5VRF3szkjlOA4m5cgu+zNjXg5tCF50Ahel72Ud8HmDEdMB4/JWwjrNCniR5XAEWBmwvWrF5wMUVzsE/um2Ootr9g66SQ/o6UgSVDkZ8nW8fc/M8cOQwzvBXeoI+4OkNfoHfbsgXrtdsCK25slcoxebu2osu3rMc01b3UyyTfwHMgZvx3T9EB77x7w1np818WT5I6TqrMXg70s3DhoDvEZxtd7omIkoEM53KLrexNsBLQzAzSGiQ+Bo/vPljDReNtL03eCKdfy/wIc5ItePQckmfG5nPoAdaedQaEN/GIlI7kAy5LtwzzFKHen84m6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyL1FL9QFuwCPwEafybWAq2u1PwwIATEDbBM4nMrF0w=;
 b=ZbYZ6a9J7VjJR/AwKtfaX9x3/A1VUmiOc7EJlQhZew3tdsNR9KYxcAXYoebIHcmk+FCeFqhkvpn1omFN6Zatl2a3OFCYe/9y9f+/GkXpPKCMVUE3mdyG6vtqsx6Db1fGUe8P6rkosFzWGpV+SpOnIQUprwxSVvWSbZ8qORxEvvM=
Received: from AS1PR10MB5190.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a8::11)
 by AS8PR10MB7302.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:616::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28; Tue, 4 Apr
 2023 07:59:03 +0000
Received: from AS1PR10MB5190.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::74f6:32ab:8b09:53]) by AS1PR10MB5190.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::74f6:32ab:8b09:53%6]) with mapi id 15.20.6277.016; Tue, 4 Apr 2023
 07:59:03 +0000
From:   "Heimpold, Michael" <michael.heimpold@chargebyte.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
CC:     "mhei@heimpold.de" <mhei@heimpold.de>,
        "Wahren, Stefan" <stefan.wahren@chargebyte.com>
Subject: Incompatible userspace API of pwm-fan driver
Thread-Topic: Incompatible userspace API of pwm-fan driver
Thread-Index: AdlmyusfwKeJzNbTQz67ESZtuJEQdg==
Date:   Tue, 4 Apr 2023 07:59:03 +0000
Message-ID: <AS1PR10MB51907B404B1DF68C81FCAA43F2939@AS1PR10MB5190.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5190:EE_|AS8PR10MB7302:EE_
x-ms-office365-filtering-correlation-id: 87b3eaa2-7173-496e-ebaa-08db34e27534
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SD+A1I/2s8+TNG8bTp9WSrC7RbHJK0czt5bcdQPfulraWCyEOc3hiX/a//kZe9DAQF0L6E55fqa0LPMebfW/trMdN2bz/Yj1yb7GN449jIpohcTIc+3rNio1qsZYm6g1/Y74d1+nMErhxQp0kK5KPea6IStgksDyHVMr0f0KZCFcxecQ6HYAOlL0fSb09aLQQnkls0Sssin/8YVv8O3Zl2JwM2+eZTfc9R3Axph3L0uuXXMdfnju8TUjY4Wx6mQoByE6//kADRlN85xXbi9gqRlVfm/5r90XIgixHjJQG9DHXElVH8kSlYDS4Vt48RjMD6BUZt4C3+GOJTB2JGl6hijKP9grogEvsxkpewN0VI7Kc11C63sfpyYgkiaXjwDVB1WYD+hrNo6k9ivD4qg5u6yHFsegRu6zyrmaSwg3mPGFspoIQmJ7eeXUd0R+5xq5OUmW5lGu0ndlNgsIS4wMv8Tx2RaWZ0OtWW/qbf3htybyrn7oFvbdSY1YOPA7Vx004EFf49dYb8PgTFh9oI/HGXQp1j6k6fBTswpZDGSZISRAvkCOCrGPXFP/ig1jhWniF5F460habB4s38el0w8cNR+zd5OmEwxzqfP4qFmoG/o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5190.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(451199021)(186003)(2906002)(107886003)(9686003)(6506007)(26005)(83380400001)(66574015)(55016003)(966005)(5660300002)(8936002)(7696005)(52536014)(71200400001)(38100700002)(478600001)(99936003)(122000001)(41300700001)(38070700005)(54906003)(316002)(110136005)(33656002)(76116006)(15974865002)(86362001)(66476007)(66446008)(64756008)(8676002)(66946007)(66556008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tcgD8PEeUThgcKBBQ29Tp1Cc0UwAMbv8XygPOp2H0IobDSONTTWpCLlinE?=
 =?iso-8859-1?Q?/QaGjSWby5I/uR4r0+iqJPeI7gEGaAQBf61Su6/BYh5wrcq4N9/LeGnUiD?=
 =?iso-8859-1?Q?3BM8KebQp0l+K/1waSCaDydXxONHWQR7q0VBTygvds90Y27+IkI2CzYOeM?=
 =?iso-8859-1?Q?puh/jBAfv2b5D2PdyAJYYy5Rmu4BZyjFbI2mlsDcvX8P0cTecs+a0XTo8a?=
 =?iso-8859-1?Q?CyJK+cT/5ai+0RExFUaTI5IfDjG3xuzGSHJzd1j+s000zBSfHrPn3SO6ty?=
 =?iso-8859-1?Q?2roGE/UwjE1wI6kbQEJhieg0KiIx64CkHzjNkpUB25cgceGA3m9QhPHX0a?=
 =?iso-8859-1?Q?Rg9RHPsGyOFEGIDQPOzLiOB9fIYP62fdkJz464DeoP9TrFd+e5ePCnAreF?=
 =?iso-8859-1?Q?+zdlMRzuMK4FLjhlSkEJEaQDvR7AFwR4KX8f6jWppsU5V0tkE/gmJXpQAs?=
 =?iso-8859-1?Q?KQKvXP4givGr5RhpFjaCQLQxiiMWoJk/fMQrs+0mGuTAsbyTDWDtZd/U+S?=
 =?iso-8859-1?Q?JpKvX0g4HyC8QoQrtXFXj3usZASdF0Khl1iW9ztU43EcztUJWc9r3l8kmX?=
 =?iso-8859-1?Q?g1+Sl/hkJxRJHTOLlMmozOjNC1hAcscYPPWMvMLlkM5xRCxfK5PY0CBcMh?=
 =?iso-8859-1?Q?LDz3QuQPpF5S0j1NI+hqp8sb3oZ30bgWIhSTU+lwCVAnX7YGmo5Lm381rJ?=
 =?iso-8859-1?Q?jRObgc0PFECEmQOUwfgCCiVIw0fi3dS5WAcvGMl2fRFgYqxW8Akqn3i5vZ?=
 =?iso-8859-1?Q?oVtBwDxdigasRlPgp0K0o2Xm+xkvNOSBibsOtkA5gQN9lQIBmspSCpVblC?=
 =?iso-8859-1?Q?x5x8kWYfGmIXkx/jZhVqnZQ9MHC54Q5XnQhHLfJJjNSN+zWL6G6ehVW6R9?=
 =?iso-8859-1?Q?ZDloEJksfVxZ11l9aeAounNH0Qe3aCbuGVrfFm/ZhcKsKuVunUH/qdeAKj?=
 =?iso-8859-1?Q?y/C6x3RAp2VX+CAjywFJMWUqowxj+VaSom4G1Eu9Gv1BtvbhN9ZCiTKpc4?=
 =?iso-8859-1?Q?PWWgmGi8sa18chlxdQl4+oMkLm/RcJ1dLRgr9NfksVuQihfqswE3aVVgis?=
 =?iso-8859-1?Q?6XjxpFlgDh9pUTIUdvfgUWIn737//VbemgngNPftVNsAcoJx9XfwjAK3Wl?=
 =?iso-8859-1?Q?PsaFC3M5LjFVy9aerOitVYh1zCKGg2QYDNTRy3AAANoxB50l683+dyIZeo?=
 =?iso-8859-1?Q?JbR+smbejT/aiU6FaS+yVhm6tlcg7z12QVdLVHHOiDXznChaysU9l2aSTd?=
 =?iso-8859-1?Q?TYpdBSt1lmQEBOkINl2+qCwFKx0Gz/6rrqj6OaUV05UQax7AJ/NOMy/emu?=
 =?iso-8859-1?Q?lU+JsbQ9C9WrMwBRWb7e9wbGzcv86PCUcYvoqio8dtL4JZLcICbvOPpoGq?=
 =?iso-8859-1?Q?B7/qw9+wLNKxyz19rWG16bQvcnWrB5Gbjj45S+rwLtqpreCL2w/uQfsegH?=
 =?iso-8859-1?Q?0zTrrEFpU6siH3W4urM5nrCXPsX+HYoe4ZyNHTzzveZKELB9Ufi/801NZs?=
 =?iso-8859-1?Q?gFjLbK2c+zCJ2Vvo2aC/SGd0ngliNCh5IZS5arvd1r59kPG2BvOrvZFNYv?=
 =?iso-8859-1?Q?iWNsnXamYYtgQKSv+E0ppgjUANl4/epj+7IenBWePNFDPeaGEkXHJjzU7X?=
 =?iso-8859-1?Q?w/YyCa5wBFXV/98rEajxV3258ua5okuEXohMdCOOEO6sQAQgcibHR96Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=SHA1;
        boundary="----=_NextPart_000_002D_01D966DC.143CAFA0"
MIME-Version: 1.0
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5190.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b3eaa2-7173-496e-ebaa-08db34e27534
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 07:59:03.6158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTUpV42OUCuRXCyAunYMlYby4c4wifEzZ3jiTshMfQHNZHE0Z5oC4QMQ4PS5OP/g795FAFpjZ/mQZm+HpG8Ku8lK2YnC0dyUIUjWJ+khMV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7302
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

------=_NextPart_000_002D_01D966DC.143CAFA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

our product =93Tarragon=94 is an embedded Linux system, a charging =
station
controller with the possibility to attach a fan.
This fan can be controlled via PWM and the Linux driver we use for
it is "pwmfan". On top in userspace, we use fancontrol and pwmconfig
from lm-sensors.

We recently switched over to a newer Linux kernel version and noticed =
that
commit b99152d4f04b (=93hwmon: (pwm-fan) Switch regulator =
dynamically=94)
introduced an =93issue=94: now the pwm1_enable file is present in the =
sysfs API
but the way the driver implements this is not compatible with the
expectations by fancontrol/pwmconfig:

According to =
https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface:

-snip-
pwm[1-*]_enable
    Fan speed control method:
    0: no fan speed control (i.e. fan at full speed)
    1: manual fan speed control enabled (using pwm[1-*])
    2+: automatic fan speed control enabled
    Check individual chip documentation files for automatic mode
    details.
-snap-

This is also what pwmconfig and fancontrol expects.

But the driver implementation does this:

Quote from https://www.kernel.org/doc/Documentation/hwmon/pwm-fan.rst
-snip-
pwm1_enable rw keep enable mode, defines behaviour when pwm1=3D0
    0 -> disable pwm and regulator
    1 -> enable pwm; if pwm=3D=3D0, disable pwm, keep regulator enabled
    2 -> enable pwm; if pwm=3D=3D0, keep pwm and regulator enabled
    3 -> enable pwm; if pwm=3D=3D0, disable pwm and regulator
-snap-

As workaround, we have adapted the two mentioned scripts. The used =
approach
is to check whether this special hwmon driver is used and ignore
the pwm1_enable file in this moment.
I posted this topic (combined with our patch) also to lm-sensors list
yesterday, for reference see:
https://marc.info/?l=3Dlm-sensors&m=3D168051630023128&w=3D2

I=92m/we are not sure, what the "correct" resolution here would be,
so looking forward to your feedback.

PS: I'm not subscribed to the list(s), please keep Cc-ing me, thanks.

Best regards,
Michael

--=20
chargebyte GmbH=A0=95=A0Bitterfelder Str. 1-5=A0=95=A0D-04129 Leipzig
=A0
Michael Heimpold
Software Developer
=A0
www.chargebyte.com
=A0
Gesch=E4ftsf=FChrer: Thomas Wagner
Registergericht: Amtsgericht Leipzig, HRB 237 84
Umsatzsteuer-Identnummer: DE 811 528 334


------=_NextPart_000_002D_01D966DC.143CAFA0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
fGVmcKfpItvuuzL6q7GGP6tIgbir8yrdN8cuC/ar31WtVCAUOreJRG3n6D+uiCEYjkdWlQDJ7GVu
VkcUTa0uJtLUi2zK8zMt+fCbjreGJoHnC56LDHwFpzx6+fCFkJyJZzl1EbFjsNQjLH3cHyt27QSt
uhHJB0kN4ygPLhEU0ray/3i4/lpTgCSsC0i6TjIxUeyq/rtELAvX+X2rjdpsqwjd80E9j/VBQVzG
zFHKDkQft2qAdlVpUeZM/ReA+7NU7rBKHTOTBnm5YRGs5A5bs93gsSVct9TTzfR7ngFUK4KQoeHK
Q43wQaQcB8DWMxajRUaPhExp/ZNXndPlb8skDDEtA5jCADlEeSKBbeTq/AtkJm78yp4aA0Ttf01N
6RGydr2GfXu7VD9RkEfHi/j/TizyCDCMGcEsRzWevatTpCKunwwhGSm9npvPhNyO0TVLIhCBG2Lt
wEvTK5AiSR8tIa6Rxd/x1kFUcg7eyjQQ9cmandVcFuTNJbHHqHFGrPhThReJqyQaOBgyJHPpVa74
gGMDb4Sw36CUtalT8Itq9VR55f9bnKJvIuH/QCllbG+OSGkxPoEbO4tY+lsvO2t9ayTwvPKN5Zrm
rHjL2IIrABcdeWoJLtZuds8w+9tZAgMBAAGjggFnMIIBYzAPBgNVHRMBAf8EBTADAQH/MB0GA1Ud
DgQWBBQJDL8qoh0EJAyy+UAKQcLPWnKqgDAfBgNVHSMEGDAWgBRbJXuWpGVRfrg588B4Zl7oOufw
7jAOBgNVHQ8BAf8EBAMCAQYwgf8GA1UdHwSB9zCB9DBHoEWgQ4ZBaHR0cDovL2NybC5zd2lzc3Np
Z24ubmV0LzVCMjU3Qjk2QTQ2NTUxN0VCODM5RjNDMDc4NjY1RUU4M0FFN0YwRUUwgaiggaWggaKG
gZ9sZGFwOi8vZGlyZWN0b3J5LnN3aXNzc2lnbi5uZXQvQ049NUIyNTdCOTZBNDY1NTE3RUI4MzlG
M0MwNzg2NjVFRTgzQUU3RjBFRSUyQ089U3dpc3NTaWduJTJDQz1DSD9jZXJ0aWZpY2F0ZVJldm9j
YXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwDQYJKoZIhvcN
AQELBQADggIBAAL46l3QisysCAM2VGb/CimG4VSDLDPox2yuEKlUgX8qLYgmraaoNCgPGQapneIC
lQQyZEwLyvnjfcMTW+iXQI534+OCgYetAWAHw8XhIP23MJc+uhxxdItfTaex/k58CXh6h1/xrKEl
EZfHLBGckOpyFj0CNam75SPYH1JAt9COXdojvDPpMv24dZ9Dvj1XS4dh3u2WyHB8frcT4QlAuxkC
Bw9r3R/SzA5aEhjkwbGcvr4rER7lmsXgoTWx5OGyYq7A6Gx8lof6YN4tiRwUQUA5onfvsBVbAT8e
zuYUqZy+gp+xYhffIkO1Mm+3BfwYytp6Q11ltSb+WkGhaXSX8UNRjdx/2VeEpx1R8oJtqw5806Pl
4MmVBG3yx5134qX4yMW5ZwZvbf3Gf26+xWrbBDbbMG9dvciZ/sRylsy5y3SLJKkTC3i1Bsr1iyYW
c5gdcZWd8/BS6WxVfgUiF9CJPGXtV4B3/NisvbNTjwd7WBN6sefJsPjjyaGR4nTOymgbshvElmCU
kNvlCLc+zIh9Z8BV/Chz3hw72s8PHLYI0jM++TySSKBacIgeEBeYenbdYEg+ckU+cGuM60h8WbVW
BRIUCkZNAjYJ0WxzIVIn2GvE0nKnTH7bNs7TPctc4u4b3fk6/U0T/w7OUrYWcTOgl8Vf9oIYF7U6
m5u2eKsb6/1aMIIHODCCBSCgAwIBAgIUOIba9yokiYI+z9y6v1tDpSCyXAkwDQYJKoZIhvcNAQEL
BQAwUzELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEtMCsGA1UEAxMkU3dpc3NT
aWduIFJTQSBTTUlNRSBMQ1AgSUNBIDIwMjEgLSAyMB4XDTIyMDgwOTA4NDcyMloXDTI0MDgwOTA4
NDcyMlowTjELMAkGA1UEBhMCREUxFTATBgNVBAoTDGluLXRlY2ggR21iSDEoMCYGA1UEAwwfbWlj
aGFlbC5oZWltcG9sZEBjaGFyZ2VieXRlLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAL4/aeVTXJQrpg8fy/2jE5WUpFsd9t84sNzhez0+pQNFj2HBtPN1YcFqwqXDK48a5cpFHHWz
uF7naSMY0+JqkApeNTGgi9DMKKfJsT9VTW3IdjGY4wdPmkwfzL38aYTxlCG9dMp3AiGEL6/GcNy0
g0X7okjOTtzzVcZwoB4cj6CFvxWzdB9LuGw77udIjC/c+RjcCXQlGPPCiLCcdM2JdE5Hi5DE8lTf
1ZPawk6DGa9ND3a4QN6bxpz9cvFbA8JvYKDPQxgBLBgBJ+pNJ8tM0veqWV66gnON0akmRK4v4pkP
WtW/QxM2OGYZW4FDaSpsNGGCfQzjU4Obu5KDoYBTnm8CAwEAAaOCAwcwggMDMCoGA1UdEQQjMCGB
H21pY2hhZWwuaGVpbXBvbGRAY2hhcmdlYnl0ZS5jb20wPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGC
NxUIhrzuOITzkQOHvZEZhrb2EbLZRmWC3csBhqLZDwIBZAIBCzAOBgNVHQ8BAf8EBAMCBLAwEwYD
VR0lBAwwCgYIKwYBBQUHAwQwHQYDVR0OBBYEFJ5vvxjhlUrwWSL5wIapei3j50NIMB8GA1UdIwQY
MBaAFPpUwIKm/pa9BMdfn1+CDD3DlU9HMIH/BgNVHR8EgfcwgfQwR6BFoEOGQWh0dHA6Ly9jcmwu
c3dpc3NzaWduLm5ldC9GQTU0QzA4MkE2RkU5NkJEMDRDNzVGOUY1RjgyMEMzREMzOTU0RjQ3MIGo
oIGloIGihoGfbGRhcDovL2RpcmVjdG9yeS5zd2lzc3NpZ24ubmV0L0NOPUZBNTRDMDgyQTZGRTk2
QkQwNEM3NUY5RjVGODIwQzNEQzM5NTRGNDclMkNPPVN3aXNzU2lnbiUyQ0M9Q0g/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MGcG
A1UdIARgMF4wUgYIYIV0AVkCAQswRjBEBggrBgEFBQcCARY4aHR0cHM6Ly9yZXBvc2l0b3J5LnN3
aXNzc2lnbi5jb20vU3dpc3NTaWduX0NQU19TTUlNRS5wZGYwCAYGBACPegEDMIHGBggrBgEFBQcB
AQSBuTCBtjBkBggrBgEFBQcwAoZYaHR0cDovL3N3aXNzc2lnbi5uZXQvY2dpLWJpbi9hdXRob3Jp
dHkvZG93bmxvYWQvRkE1NEMwODJBNkZFOTZCRDA0Qzc1RjlGNUY4MjBDM0RDMzk1NEY0NzBOBggr
BgEFBQcwAYZCaHR0cDovL29jc3Auc3dpc3NzaWduLm5ldC9GQTU0QzA4MkE2RkU5NkJEMDRDNzVG
OUY1RjgyMEMzREMzOTU0RjQ3MA0GCSqGSIb3DQEBCwUAA4ICAQCbAFAVsL/aMGv85CbwW9mLG2ZX
ID1ZdFYfgcn36iAle0aXK+9/x0SJ2tv1T3GEcMwThhuyAo/E9L1ALYDYV5fW8kElFjzQ2KyURdkY
M04FerrUlJaGdrgn+O49CZwFo2wnAfr/ysMSEC3CAka1+UUNYk2yRCeuPqHWy6RmaQUWbKvbSEdC
PX/LIughatos4cFmZZl9IOmILlMEGEdREjd5CPqcJGEJSJ/LXZXd0xzimPp0JaJA4MU2ENVBn1fJ
j9qNg6+e9HC39TKWtAfMrb9F5UtqmYJjU7yyBS/By+wG5WW8pNMBp3OZzzsUk40gPnPLk07ECiRf
EdbNlVaKGWtKFYyb620Ap4qQQ7B5/yE0+9BkdsadhZOMPopnfvnMCNg9ebu2ybcvYYsR21KuW1H6
CHpxYXUTmR+vzDHaoKHI1Lzg+kqxnQTBCnF68lXgAUZemhuOJEtoxAU7b8yDS1tXsuwaPZ3p2qx6
ICtvkXQtJh10ruiSnR8/CP9Wm9v9gFBMqE0S21kezwNCnliStpFJlqRuD6DlAz+ozNVOwl6hq5Xc
RorR8d/cWClSBfgMsJGJHn4AmgNEfdk5VkAluPGuhcwJnSuYpowJ4yabNA49l1797zBGZp23QbJ4
eB9e0gSbwVwgdOPQqNVtHy0kf7wG+ZAwZbUlQJ4EyiPuF8aJbDCCB0cwggUvoAMCAQICDyxaqdlU
/bKrlq0Xtl+M9DANBgkqhkiG9w0BAQsFADBTMQswCQYDVQQGEwJDSDEVMBMGA1UEChMMU3dpc3NT
aWduIEFHMS0wKwYDVQQDEyRTd2lzc1NpZ24gUlNBIFNNSU1FIFJvb3QgQ0EgMjAyMSAtIDEwHhcN
MjEwODA0MTIxMjU5WhcNMzYwNzMxMTIxMjU5WjBTMQswCQYDVQQGEwJDSDEVMBMGA1UEChMMU3dp
c3NTaWduIEFHMS0wKwYDVQQDEyRTd2lzc1NpZ24gUlNBIFNNSU1FIExDUCBJQ0EgMjAyMSAtIDIw
ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC9BRnI1A1xPgMDELSTFgDrzyPawAcju1E8
OBLTQHXDcmN46wsneV+NVoip2X1ZQ9GIF3bjx0aLq9/iiKo9EsCdCO1BENfc70ngvzFS1oOdmfzy
miKAZlWsEJSQocyLldDWSF03KN8a7Rgl30PDIURBvBWlpIOCxiCAUgKogGYBvm7ZRZZ10BcgfGU/
ga19jlhGI9xSJ9pCPjvcWPJKpiSbG+s0CR/M4cXaQPO9ZEFYxIn7g4rNIYBYZwhsIjcPn5OtC9/7
p/3F/2qKA9gfvK/CyQ14fPVOPVJaPECufMs4+tRhh2edpGx4irQTaVV85iVU3wjPpi84TIgUlRwq
UWloj158A5r7pGVMcI++Slyq3rudu319WjiC57kAikVHryC+gwC4SUAYn0CqX//cApx+99nmLWAm
WnGdeaRmHMJCmJfXy3Dji8SnVuggcXbErnkr5sms1kyp5wiDR7YVIkdTuiJHpF2d7WZ/d5EOT7KB
dS/k67/XgTrUwkWwKR2Vm/00b0Zpz3N4Hg9FTrBP53A2uci2e7Lf3vR8hFJijhu08zGuClY7Khn+
0BBU50YSOE2BnYWsBOe36ddw2470cM/iGtMMaTXnA0rg4MsX9TP0vX4iQpWZMwqNwqcYk0ewMqy4
RDAY7xH4GXNkRGT2nJngURbQS1wgScF1NMzRW+rRrQIDAQABo4ICFjCCAhIwDgYDVR0PAQH/BAQD
AgEGMBMGA1UdJQQMMAoGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFPpU
wIKm/pa9BMdfn1+CDD3DlU9HMB8GA1UdIwQYMBaAFAkMvyqiHQQkDLL5QApBws9acqqAMIH/BgNV
HR8EgfcwgfQwR6BFoEOGQWh0dHA6Ly9jcmwuc3dpc3NzaWduLm5ldC8wOTBDQkYyQUEyMUQwNDI0
MENCMkY5NDAwQTQxQzJDRjVBNzJBQTgwMIGooIGloIGihoGfbGRhcDovL2RpcmVjdG9yeS5zd2lz
c3NpZ24ubmV0L0NOPTA5MENCRjJBQTIxRDA0MjQwQ0IyRjk0MDBBNDFDMkNGNUE3MkFBODAlMkNP
PVN3aXNzU2lnbiUyQ0M9Q0g/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENs
YXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MB8GA1UdIAQYMBYwCgYIYIV0AVkCAQswCAYGBACPegED
MHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZYaHR0cDovL3N3aXNzc2lnbi5uZXQvY2dpLWJp
bi9hdXRob3JpdHkvZG93bmxvYWQvMDkwQ0JGMkFBMjFEMDQyNDBDQjJGOTQwMEE0MUMyQ0Y1QTcy
QUE4MDANBgkqhkiG9w0BAQsFAAOCAgEABw8elwSFegmW7IGpGTOPwtOC2tzTwCQiRA2VC/EWGKck
k8A3F9Q+M2A8lUYVlRKJt31pAezcXaP6OFW03IPiiXU70QA598nGqUxzzjn8rpFhZgCj6bi8MJd5
MH5C2RRYFrhiRefx6pp42LLc0AFIF1ZqkaYa1vz0EgTOL9XE3inXe39twPLoe3rc/f8gfpem/s1N
IJk2azwyxZn226YSrSedvxhe7LiN6gOqvU7hxpC8bXaiIYVy7DISXwEt902Gc+M4QbhUf8yQ+PiK
3QexGIWiusOO46cn673dG/1KCzma/1Llp9DxaeUHlxjjeeer/2WtWWZNFhoInrxpcK58odaJZRMZ
QJwNljMb66gGb5OpeanN0su93/S9GrZgJqN6spp171azfMuQzVqj9gxFy66yIdlrhZcba/QixC2e
AJxm5fM/PZg9WXZ737G8jAbsuoREH1bxsglLzxAIwboY7uVwIim6ZcieKb6Yy4n6TzperNmhU5UH
iUZSJzIQ/qu9B14cfh0CAJo19p7fRvyeF/p7INDH0ceTVTq5sF8kFtMM1bz+0/sWOTNqdi8kGO7I
7iouC3+V4DDx4F1sGcaigFXtUpLmol5Lss+i9NXGgWFcPFreexoLaBdckDJgBk6zOHKVYwZdnrg2
CovIev/uumK0WyCa7ix1+SDcsd2PXxIxggODMIIDfwIBATBrMFMxCzAJBgNVBAYTAkNIMRUwEwYD
VQQKEwxTd2lzc1NpZ24gQUcxLTArBgNVBAMTJFN3aXNzU2lnbiBSU0EgU01JTUUgTENQIElDQSAy
MDIxIC0gMgIUOIba9yokiYI+z9y6v1tDpSCyXAkwCQYFKw4DAhoFAKCCAe0wGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwNDA0MDc1OTAwWjAjBgkqhkiG9w0BCQQx
FgQU4Kifrs8qOJB9GXK1M2cZh9QVTwwwegYJKwYBBAGCNxAEMW0wazBTMQswCQYDVQQGEwJDSDEV
MBMGA1UEChMMU3dpc3NTaWduIEFHMS0wKwYDVQQDEyRTd2lzc1NpZ24gUlNBIFNNSU1FIExDUCBJ
Q0EgMjAyMSAtIDICFDiG2vcqJImCPs/cur9bQ6UgslwJMHwGCyqGSIb3DQEJEAILMW2gazBTMQsw
CQYDVQQGEwJDSDEVMBMGA1UEChMMU3dpc3NTaWduIEFHMS0wKwYDVQQDEyRTd2lzc1NpZ24gUlNB
IFNNSU1FIExDUCBJQ0EgMjAyMSAtIDICFDiG2vcqJImCPs/cur9bQ6UgslwJMIGTBgkqhkiG9w0B
CQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQME
AQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzAL
BglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAKD8Q0qjpPsFKnnerYQ2
kHWkmG/5gGLyYeY4SCvMwxoddc3FE0afYX41ROcLyt+1VvUfsD9fcxaorZZNaNYyBuJYfrxEJa0a
V4Z7Xj9psYBZJJh2tMYctIdgUa/N6fmzD4ZM/WsC6RhQEAUgMnwc/2MCxFKZc4IC4k5KAJDzzl+E
lmokDIfqjAJi+Z2qSzqt/o9UwmYpn7CYZGMJ2SMD3A9B6ZFzxKdJOl7OhXuW9PIfc7ZjyR/CVJf0
8XupVjCfJ7bbVORyuAJ50kX7+1/ZaB8fz3phD96yWmyuRAbvK2RTNwzCURig51lp1wO0m/54YTBU
Ol3mzWXS3xJCOu8NfJsAAAAAAAA=

------=_NextPart_000_002D_01D966DC.143CAFA0--
