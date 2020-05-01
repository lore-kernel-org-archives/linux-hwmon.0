Return-Path: <SRS0=GqDx=6P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1A7C47253
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 May 2020 17:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E2C220857
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 May 2020 17:50:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="PRwR8Q74"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbgEARuj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 1 May 2020 13:50:39 -0400
Received: from mail-eopbgr750054.outbound.protection.outlook.com ([40.107.75.54]:4099
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729393AbgEARui (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 1 May 2020 13:50:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvYOEbBXMbLL7r3iFwMzoFl81cns8Lu09Xp8LA8x8dKhdvtEkZlHGl7m2sK1bFeqhxla0TY6iXPzaOl2RHQJzuPoZS4u9WBjpG4nXWDSq87l6i/C2YHsTbAbwFuVUU2LrBUE+6tur7wKOeVNwXZaYHnNkeuU9ybyKr8dp1+wP4ONI069zyRNzGqGGAPb639sIyrRF44stBo2iXIXcLL1Nq8e2T9MehsaLR0bPOlYNyiM26MDTLg08pgWBYsGBDBMGxMCUKjjEtdSy6m+KJ9uaTYbdI1tmeXceUSYlSTuv7TYlwfL7PKi6tQLhqXOcBsHPjJwvxAfKzS829YxZ5do2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EixfLwD+SDssVg2gkYZfSxOxbFDBfrTYFoZXFe8PuHs=;
 b=OEgX1gZOVLpa+sPKH0VSz1NlKUHyBX0gIJ2GxpfTHMYWE+3TcI4MDA03fL72PQqEZKksHmtm4gvMD+QrP5Mduha44KYn8hJV+lSOcpazp7K9tbFm5g4FrMR+nuBFCCP+/Pj0F0ueQ1pyblQe9sEfYdsjtAeXZuNxtIsD18jsatw7306Jo1BwRxFKYs2wOkiHzoyKaOpwZ7dK+aRSRZpzcP8vpnYQSQ2dDaXZsLjTgorC23DtQufps7/yf/FxVCYFgP15jlE6LFgH3pEKV5KsDUtIuR+yA8E5tt0xjVx6sZ12pJXlU8IcR2NbdaN0i6V7fUIaORY6X+wS57DAe9ThDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EixfLwD+SDssVg2gkYZfSxOxbFDBfrTYFoZXFe8PuHs=;
 b=PRwR8Q74uT4fF8OU6BOff52VgyNbsUH4nQZrjtuAOcKx72BJ23WqJDoi2OWvkO72wL5LniViUcndYQAaR0ddrah5/DdtYajx1a8nIrykEom6LGJI3mYD1lJU5Ia/pkUbFTnC1C6RvL1b6NKDiNUBcbo4w9Wh9Cv1RTnId9YnKdQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3859.namprd12.prod.outlook.com (2603:10b6:a03:1a8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 17:50:36 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%6]) with mapi id 15.20.2958.020; Fri, 1 May 2020
 17:50:36 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/3] MAINTAINERS: add entry for AMD energy driver
Date:   Fri,  1 May 2020 23:20:03 +0530
Message-Id: <20200501175003.28613-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501175003.28613-1-nchatrad@amd.com>
References: <20200501175003.28613-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend Transport; Fri, 1 May 2020 17:50:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d1d4000-a1d0-45a8-f450-08d7edf826bd
X-MS-TrafficTypeDiagnostic: BY5PR12MB3859:|BY5PR12MB3859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB38592062E8F4CBA43F5D6ED3E8AB0@BY5PR12MB3859.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XaZQAIb1oATlM+wtOg00SRbfYyo9bsxO16DMnVoyy6irR5sgdWpaasB06PTMhYWea0NyvYYcN7dTnGx+BQh+PeGNrR29mL4DerB77BA/Wbk0jmVyUgRfbq9tfebVk357kYY4qUKcC8LyfY0gJ6kZUKx4Oug6uwGqerxBqOtwCWCAfYWXleKtl4uIuSuXmbbWMJrEtxCKkwj34RdmQTP+ifLjD7IV97ZaO5TSWNJgCtVX45OF5F/kfFVLxu1RtwoMOGIQnN0puoJ7Rd5MbcKCS/ajk37nTM8FBdt38XooFbX+GT1kbeSzxU4HEte+WNz3gOyl0UTgxU1/3tiU/jmaWKloY3vBtiYku54RobIsYEVtLbb+mzPrIrDbs9a3zIzkriXwfD6WFGgGXXxYv63Hi2TQug0VIRxIui5LxeZnrAAVGiJPkYtR8hFY41ytLM2+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(26005)(8936002)(5660300002)(478600001)(54906003)(66556008)(66946007)(8676002)(66476007)(956004)(2616005)(4744005)(316002)(36756003)(6916009)(52116002)(1076003)(7696005)(4326008)(6486002)(2906002)(16526019)(6666004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: esddpXfLAEW08Yy82zRZcCrnr8toDTMUwstTcxxouijUeTskrKKa4hF+V1QZzuG+xP0PCaqfYolIZmGOr61fuqALCgfuh/SN6ZRlEXPq68zVlma/nCL8yCdcMcwWFqbx6X+SFUCsF8tM00tYG4i/DaC4BWC9ksdoxlHhpBFN2cdnM49p8ZfJz3E8ed+JbgpNsWMuLKwK93pDXqVcaRumHh8udXhM2Tz6KnKZm731yhYWNs0+v9tT3/RPr5MCVMf5KqU54VIvGTh9EpeaWel03mF/2seRg7+wcdBEhKkaiORs4zHVvlsQTRnkfI2fW6aIEFwbs4S4b04CZIPvzYKpNZcMfigJrgIi1OZx7A2kAk/Xc0JbIjLiVFuxXnjcfkRpyKYKuBFWp/a2YM5EtDKXBG0FcPjV8RcBbGDlh39CHr9fT5CJytOmcNhx5oh3Cd79MLtkK4boeSWU9OgGTCuTgdzDbJ2TCOrUdy/iiWCGWVPP3bWHpr2RxTup9wxIO9bDkBaED07Jh36MQFm3U/2bvPy0fj1p7EJsPF3G9Wkh9/ABWv8hpCZ5pbRJXdgLdrctLAfvOI+SROMaHwTV0EIysC08xBLv+0WKTBQnm8HyumLz18AuS5lcM2jkjMhqDhK+HKO5GDXOYS5owNGT1wwutZT84CuiwI+2nQrCMu1PSsBdrrlaAGeR1ftbRAAZreUne/IoZsuarfnglydUNktrGFanB+boqNufHKwN/PeYvi46VuMV1O2MFPG7qRkVRqp6pSifKCwOrhRX/Ll4Y/yVvFrv94zFBsDtLT9sk85vGoAOsgLJogcm8NnSZb0g1rxh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1d4000-a1d0-45a8-f450-08d7edf826bd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 17:50:35.7842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWuQJVF4Re6/HLsx3nQFG7ZTYb54joR+cBJCRIC1SGeKMJhdph35bqmVCFKHBS8TBkLI+DGv+TFDUfklYfCYsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3859
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The kernel driver is part of HWMON subsystem.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v5: None

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26f281d9f32a..48e94d0a9955 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -842,6 +842,13 @@ S:	Supported
 T:	git git://people.freedesktop.org/~agd5f/linux
 F:	drivers/gpu/drm/amd/display/
 
+AMD ENERGY DRIVER
+M:	Naveen Krishna Chatradhi <nchatrad@amd.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/amd_energy.rst
+F:	drivers/hwmon/amd_energy.c
+
 AMD FAM15H PROCESSOR POWER MONITORING DRIVER
 M:	Huang Rui <ray.huang@amd.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.17.1

