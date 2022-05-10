Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6205C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 07:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235611AbiEJHia (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 03:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240652AbiEJHXD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 03:23:03 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140098.outbound.protection.outlook.com [40.107.14.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9A02A18A0
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 00:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwoBTS2bssYmbLjBPtKXwxNUEPx6Ejs/6rDFQnr3RKs1qlZwfbXkM5KQMEn0foKCzUL6hyR7pnU/r/BupVCOzr2qyKfGMsOy3t0owbs1QQGelq7FsiU0tIyt6kUQ4CrZOQ9Yb+X9KLj5Nl5+87a7kZjbK/fgaB32hDaa+PoEMO8yT/p4bXO0MQeDqLdKxxSoAiK7IyD+h1tbg2yldxpjnCe6H5zC51JqpB8VIk/qgqPwNcEHFybnKwmoQcZXLnWizgwuP9ONgQjhPVEVTxHVjDxZw3ZIgYnGlMBVIA8y6O/HIAPG5YuRx2hlXDHfX82BJlkJF3/WB6cZAlgWocgQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2OmK7znANLLCPpGcqHuCa+qBgAZ2r+dBzzCJrDisqM=;
 b=Pzv7s/SzuMb0bdnsG7oayNGcGP4FDfGASOrXD5rFAxKBPxIdFSj5Qg+4kE6vVbHsJGFV8KyUChHmpxiuURgLLSEb9ulXnmAYoBRCTNlHg3EBgbMD2a/0jDIUCgQXYVZb6VoowrLsJH48w1AufllVMXTnQTzm4nvBEongkyhj/dHRUOrEZeWZo8lVDeBpLDVOC3TN5RXBfxesztj76kZokTyiQozOT8zzP86+pkEsJ7rGgbS8MJv36g3kHMwh6Q5dx9HFuhtc4uv2PyOUvbEh2s+ZbQSNGMpHBoV1A4nJ3ucdD/eMqkVyDDEVwBFeFAZDqUhPSPkrOSmL+XfkQ5HnWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2OmK7znANLLCPpGcqHuCa+qBgAZ2r+dBzzCJrDisqM=;
 b=LX7gxJSr+B6GBHxkLo1Skq9oJGLuNeufUunWNqW/BEP/NM702YmkspAbWngQzDn2n0G29PfuZLqjWDoVk1LumHINDQ3QZZECoZJXF/CAmZ37XTa0L4Dru/3G6lcvrTdeeLbS6hzMviEA5Iy/fNQU2h44np2ckgkpXZLD/5mhSSex+iUKmZxnVNQ/abY9x75sMTXwhFdMceiDGWipsuI/9a68BOpyLPFQVgRA8BzRh3/xlUVc8+neHVliEhsXdhSnbchFOPI4I8/ynb2XZqW9YfiwarOigyL+lPjYZ51zMow5PKT5YLtZB/sHWSz4I50lHVWJ/IvsjUnXu7k2oM8tvQ==
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com (2603:10a6:10:218::16)
 by AM0PR06MB5378.eurprd06.prod.outlook.com (2603:10a6:208:ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 07:19:03 +0000
Received: from DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4]) by DB9PR06MB7289.eurprd06.prod.outlook.com
 ([fe80::7015:6796:8a61:93b4%9]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 07:19:03 +0000
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Thread-Topic: [PATCH 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Thread-Index: AQHYY6Ypw7E0KLjTH0+L1gk7R3M1Aa0XRfUAgABrr2A=
Date:   Tue, 10 May 2022 07:19:03 +0000
Message-ID: <DB9PR06MB7289C1EF96CAC7554D65EC2EF7C99@DB9PR06MB7289.eurprd06.prod.outlook.com>
References: <20220509131016.29481-1-holger.brunck@hitachienergy.com>
 <af58fc2a-9d72-82b5-2cd4-8376a99e9ef5@roeck-us.net>
In-Reply-To: <af58fc2a-9d72-82b5-2cd4-8376a99e9ef5@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8d740cc-ddf5-4672-6918-08da32555ca8
x-ms-traffictypediagnostic: AM0PR06MB5378:EE_
x-microsoft-antispam-prvs: <AM0PR06MB5378B8C6D061189DDF43BEBAF7C99@AM0PR06MB5378.eurprd06.prod.outlook.com>
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aBKzoOWDDFYRDLTeq8TYgi9AeeZGpq55XbzujvZvOko5SeoML0vsujc8Kz6ut8yR50BndQ2vz8u/rTDy3BKpO+NPrwH+BU3KC+R3Ce6E/YVPStLw3e2H+/w+nn6z8njPE4dohdci9OgZNPG9eQOt6OaMkwPwgog9dTcXt5KcO+6hWRB4aM0MfFrpY0G5jDMo0UfqPhZZCl+6bGijqO4izo6wx5VKM+Yf9yD1PqLW0NxsqIdVxTW39E5CJzA/7EjWntAmsIyskC6hHMhzJvO2CzyZWTjANmrVHx/8c3N6nFMJ4vAN+cc9ZOCrQMj2pxKb7f9FYagGuuhmeZbwlhNQxMNajp1pzCY5zLQH2sfta7ewj0dSNdbAMADzcTp34xj4Fl6IySOhonREPNIe8TBdmGppu6gQj5IYoYwMD8LTLF00qIFPwQon0wX5vDV3HZ+vb8/gKwl86/oNEFYrlXRIx7P4Ouwrqinw+yfxYP0w5LvaUnWiMyr9uuJybiKVP9VJG6BfPy2VanileCja6FpgNvvpgSYnSdXlNXU2WsRNZf88I0DexJzkzyUqpjIV6r5JoIFDeGjpw0CWUQqevcHCsqKuGqmgLozYwescuneImhOPZi7JaZQ/hN7+jYTkJAXAtS31On+0o3GgiKitCOFGhRy7ZSyOMH/RlJbIxuXxbTXXjq3tIKvWViDxsqL8CFnClxFqNUgJKX5ln9K53WM3hw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7289.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(5660300002)(86362001)(186003)(9686003)(52536014)(44832011)(82960400001)(8936002)(122000001)(2906002)(66946007)(4326008)(8676002)(66556008)(66446008)(38100700002)(38070700005)(66476007)(64756008)(76116006)(71200400001)(6506007)(33656002)(53546011)(54906003)(508600001)(7696005)(316002)(55016003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bS9TQmoyVFAvS2ZvVkV5aU1qNHZSeEM1NmdweFVLY3FheTZYMlEwakpwbkV6?=
 =?utf-8?B?WStPeGo5TXNmdFJoMHNvNjZmM01GNXkwUXlONFc5TjRNbE11ZXJNTTdOV2NN?=
 =?utf-8?B?TXczemUwYWxCYnV3a3RWamN2TnFGUExCRU9MNzdsK3huWlRiYnZxd1dDaE5k?=
 =?utf-8?B?SWU1alEwaXpSakc4T2FYVTNKWDBRNUZuNDBGOEdRbkpqTzdFbzdPc1lYRUcv?=
 =?utf-8?B?cVk3Y3k5dGpMajltcHc1TkgyQ0ZzbWlSekxteXJOcldpRSs0cXBOdCtlTXRU?=
 =?utf-8?B?YlkyRDMwL3lDNnFGVTlGeEQvQXYxZHJKK0lQaUsrS2lzTlBKTTJhNVdVRFlT?=
 =?utf-8?B?b0R2QUFyQnhHQjI3bk9zam8vL2krbUdRWGlIMjczWDJ4QlRqYmw3YlJIY1hR?=
 =?utf-8?B?R3Q3UXlDblR6M3BjQmtCTzJMYVZaQXNaM0kzdjBJdk5YKzRmR3ViQ0kwSVVK?=
 =?utf-8?B?V0c2U2VDZG9SUnhLMjY0QW96Q0N6Q1MwZzhhM1gza1k2MmZpV1pIZ3pZU0Z1?=
 =?utf-8?B?ampjSlVJa1RBdlVrSUpXN3ozTTlta0VuVE5pZFRMdmZPc3UwaEkxTHhxVSs0?=
 =?utf-8?B?SnB1Zkxra3lRaDdxSEx3d2JiUVgzaGNPWjVhTHpodVhnSitCbkZEbTRHc2lV?=
 =?utf-8?B?R2czOGRCTUZsRzhtWmZhZ3dKUGhoTldWVS9tTUsyNTVzUnR5Wk4rZm85THlp?=
 =?utf-8?B?dzZhWFJWM21oVE1YMGhKTzFhVi9VWXNubWN3Sjd0SGVBS1lQR1VaT3U1VE5k?=
 =?utf-8?B?WVBRcjNIUTJ5enJZcytWMU13Q0h0YnRMcGd3MDlpOTNEbzBQTkt6WWVQTVA0?=
 =?utf-8?B?UDdla3cvTWtqU1lZY2g3b2w5TThtdkdsZzFIRWMrZWNRMjVZQktJUU5FK2pp?=
 =?utf-8?B?V3R6ZGs1NDBJdjkzS0dGbjZwU3h1aUVEV05XeEpESWI2WnVvTGYwYmIybXVm?=
 =?utf-8?B?Z0R3TngwMWg5Q1N2aGtDT3dJZXRhVEYwZzRURTNpeGJGcG03c2dLZFRqRXp6?=
 =?utf-8?B?aUZzakVGVWprZGZOSmFNbnU3WE4xYVAvdG91WXFWdkxkditmNmVpcDdJajlv?=
 =?utf-8?B?NkJRMXN4d2VwbFZ3WDc5WDVwaXJFTmxxT29kZ2sxVkp1ZE5pR3doaG53QlFj?=
 =?utf-8?B?dUVYRnNCZVV6UmF0bG81T2Y5ZUJ6VTl2dnNyNVNBaDQ2aWRxSkxuVWpZVk1E?=
 =?utf-8?B?Mi91ckQ1UytSM0hrZUtWeWpkN1A2SlVpbGZjL0ZyNjQ2eGtDVVI3TFlXQ0tr?=
 =?utf-8?B?M2VUcUtBQnVqR2NBUkswVTNGeUR1S2tmM21xNVdQVXFyZEp3TDVRUHBTWGY5?=
 =?utf-8?B?MEF4cklINVpmNllLajZpQVYvay9LVTJVTWVuazE4RFExVm9TcXZIUjlpUDUr?=
 =?utf-8?B?Lzdpc0xoM1ZwYVl3Si8zcWp1bUdYM1pLQkx1K2k0RVJSNThoRTBjT2twOFlQ?=
 =?utf-8?B?MDBvaHNDSEU4MmFlWFFrSHpLeWZKc1VQYVorQ2NVMzhRa2ljQzgydXI4VXBp?=
 =?utf-8?B?V0IzcEpuY090VEgwdkg4U2tjcEVDVXJNRU1IMjJrRVVRRnZFQ20xTCt1WWg0?=
 =?utf-8?B?YXMzendmOE9rZ3FCSnR0dU9KYTgyK0tuMkxwU0lWNW5OQ0JiOThDQ0Y5Tm5Q?=
 =?utf-8?B?cWtuSXBGVEVHTWtTM1J2ZDFKUDFrR2lVUHp4WWZBZ2syYml1bE50cWdIU0l4?=
 =?utf-8?B?TkxIQ1F2SHpoOVRZZW5RMXNKQTVBNXdRQXBpYUM4aHVZaFVFeHNGaGJPMUJ6?=
 =?utf-8?B?Q3JhTlllU0pYVTBrdnhSQ1JkS0N0ZEloa0swS3pKVGZDd21zUm5NMDVPTEhG?=
 =?utf-8?B?WE1FdVRUdE9EQ0dCK09UeGNzQXJmUVErUkFJVG1iMUNsdlM0K25CVWRaaHNV?=
 =?utf-8?B?eDhqdlo4UDgvTU5QcDJJZ0tZK3E4NEVUN2Z0a2hNcTRWVHZTMWhzWlF3SHZp?=
 =?utf-8?B?WEh4NFdNQU5jV2pDdjVtUjBCRElZQ1JQN1JSRFZqRHVXMEtnRlJNMzdnbTJ2?=
 =?utf-8?B?cjR3d0dHclhhYjkwcG93Tm01Qkwyb250UVhCMzhXRkpHWkplMFRtUWxXdm9l?=
 =?utf-8?B?V05KeDFwNjhGcjR6Q01wTkpMTWlGazZpRnovSG5mODhtUmtSMnQ2NU1wTDY2?=
 =?utf-8?B?V1Yva2JPQmltWjRxWDlCYTdKRituUkR0WnBNK1QxdWtpTDc1TThxM2FjdzFQ?=
 =?utf-8?B?U3IxcmNMM3I5MG51T0dXMGxOanRJL3VSQjU5anFJbXJ3N3c3Q0FKaFhCNFE2?=
 =?utf-8?B?WHlaeEluRTJlM0dQZkZzaE93RWRpNlV4aHpVUFpWajVjMUZ5WGViQ0NEa2Z2?=
 =?utf-8?B?MnZXbkZxeDNzYXd1V283N082UXJvbUtoSXl6MFFMdVJjeU1WclJpMXVVN215?=
 =?utf-8?Q?+SEKT81IXAPszYrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7289.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d740cc-ddf5-4672-6918-08da32555ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 07:19:03.3871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kzMlrMaRnheDqInO8EnKcFRdK1LpVWvwmV0zTQlij+3kvy6Wh9pc8d9rp5qrbm6KT5MUMSpN4HSkCTQvXYBsdTGkKsULT+FeIZQD1fZcFew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5378
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiBPbiA1LzkvMjIgMDY6MTAsIEhvbGdlciBCcnVuY2sgd3JvdGU6DQo+ID4gQWRkIGEgYm9vbGVh
biBleHRlbmRlZC1yYW5nZS1lbmFibGUgdG8gbWFrZSB0aGUgZXh0ZW50ZWQgdGVtcGVyYXR1cmUN
Cj4gPiBmZWF0dXJlIGZvciBzb21lIGxtOTAgZGV2aWNlcyBjb25maWd1cmFibGUuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBIb2xnZXIgQnJ1bmNrIDxob2xnZXIuYnJ1bmNrQGhpdGFjaGllbmVy
Z3kuY29tPg0KPiA+IGNjOiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuY29tPg0KPiA+IGNj
OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQo+ID4gY2M6IFJvYiBIZXJyaW5n
IDxyb2JoK2R0QGtlcm5lbC5vcmc+DQo+ID4gY2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4NCj4gPiAtLS0NCj4gPiAgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9uYXRpb25hbCxsbTkwLnlhbWwgfCA0ICsrKysN
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1n
aXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9uYXRpb25h
bCxsbTkwLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21v
bi9uYXRpb25hbCxsbTkwLnlhbWwNCj4gPiBpbmRleCAzMGRiOTI5Nzc5MzcuLjk4ZDAxZjZjOTMz
MSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdt
b24vbmF0aW9uYWwsbG05MC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2h3bW9uL25hdGlvbmFsLGxtOTAueWFtbA0KPiA+IEBAIC01Miw2ICs1MiwxMCBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgICB2Y2Mtc3VwcGx5Og0KPiA+ICAgICAgIGRlc2NyaXB0aW9u
OiBwaGFuZGxlIHRvIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUgK1ZDQw0KPiA+IHN1
cHBseQ0KPiA+DQo+ID4gKyAgZXh0ZW5kZWQtcmFuZ2UtZW5hYmxlOg0KPiANCj4gVGhpcyBzaG91
bGQgcHJvYmFibHkgYmUgZWl0aGVyICJvbnNlbWksZXh0ZW5kZWQtcmFuZ2UtZW5hYmxlIiAoZm9y
DQo+IGFkdDc0NjEpIG9yICJ0aSxleHRlbmRlZC1yYW5nZS1lbmFibGUiIChmb3IgdGhlIHN1cHBv
cnRlZCBUSSBjaGlwcykuDQo+IA0KDQpJIGNhbiBjaGFuZ2UgdGhhdCwgYnV0IEkgdGhvdWdodCBh
IGdlbmVyaWMgbmFtZSB3b3VsZCBiZSBiZXR0ZXIgYXMgdGhlDQpzYW1lIHByb3BlcnR5IG5hbWUg
aXMgYWxyZWFkeSB1c2VkIGluIGRyaXZlcnMvaHdtb24vbWF4NjY5Ny5jLg0KDQpCZXN0IHJlZ2Fy
ZHMNCkhvbGdlcg0KDQoNCg0KDQo=
