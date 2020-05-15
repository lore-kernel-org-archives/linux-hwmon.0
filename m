Return-Path: <SRS0=MVeP=65=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB673C433E1
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 May 2020 18:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A405520728
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 May 2020 18:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="n8D/TSVH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgEOSxD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 May 2020 14:53:03 -0400
Received: from mail-eopbgr700077.outbound.protection.outlook.com ([40.107.70.77]:45217
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726144AbgEOSxD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 May 2020 14:53:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4mhE9wJnOUMKEvgP4/NSHeyxZMpchVz6wloZRP4qPs9t2aE5GSVN+6AI0tmP1OfUPMXcmD8ThRzI2G00tIV7ughYroW/hFV+3V4XY56RZkP6lc98eogr9GavN0op0rTPEnHhgEYbftsfvRR/WDA4rV0gc6zy8r6N7+0HC+NWvXW/U3walwI+9QSkSZHJjUPU5SWKVDGlZXka5eWsu8swD8lbOEJG9UBMe7bx6fFprN11Oi6BFUoHHncmZNp2NKuft90MgFXayZ+uHqTFED1vstPxeL9GF6E86T/ifn4HFFPrtzNcZqx+z2GMX8o0f7Ydxr7b9OzVdFNiOv5GeEhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOinFidRBjYbV5iC5lH6fB1KecSfu632JbR9h4uoYmg=;
 b=LbXL3DJeyIs6Ih3nra+WhkNeWvew9mduHfM52Oo8XqyODm0Bl8x/LQxWdrrBiywr3SuE+qD8pNZ+fwrBvsTSIZrvMPMyosbjDDB94G8sF9yLOKxiWWHCGuJLYMiV+OXdzlVjqveXIgRAYYESpzE/ouFPUs+ATJAyrbzT1IRRGJH9DEbGkgfANEdXwv6MbNhPTronw1DVN9t4M8WVLHAzosjWC3vyVFAfiHgz4qIWJP9BIfAimjCcYkAsXC1rVbfRFeTpD8yhvQCFjKPkTEWj626badkM6i8DDIflfTlXXMwKYPKTQHJMIdXacTt3PqmNcICsDMbAARMYMceli5xvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOinFidRBjYbV5iC5lH6fB1KecSfu632JbR9h4uoYmg=;
 b=n8D/TSVHY3kMVlNwFRzTiUpFW1lzonGeD/+HRCZ9IkCceVG3Vz2CVMAOt4Bm/xr9A5gWw+GwbTjk3GXoQlegTWWvj+i0J3LfzPoQ3+JyOvoxOT4FPPoEUa7Zq44d4yByqEME1uHil+6Tv2VZwjizU/l3RID8mXb6C5KGTnuX/tI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3860.namprd12.prod.outlook.com (2603:10b6:a03:1ac::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Fri, 15 May
 2020 18:53:01 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.3000.016; Fri, 15 May 2020
 18:53:01 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/3 v6] MAINTAINERS: add entry for AMD energy driver
Date:   Sat, 16 May 2020 00:22:34 +0530
Message-Id: <20200515185234.30687-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515185234.30687-1-nchatrad@amd.com>
References: <20200515185234.30687-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::20) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR0101CA0034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 18:52:59 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f552f04-3660-46a7-8d6e-08d7f9013123
X-MS-TrafficTypeDiagnostic: BY5PR12MB3860:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3860C59F357825A0223252A1E8BD0@BY5PR12MB3860.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qf67kYDSz85BpMzRvtgINGSD6DcVLNfr5+cBIy+MXhQC/epdQe7qBkk1MKqzGiZG76GcFhnohyBq7h5s0PXc99CC781XXfu6iVBxtGiEtGveLfx+eHc0NPYNCLXSj5YXRchf+zJwGhwTmu8Jlg6VCGgPq9XZulSlmD6fBD8tLjejeeVKS4dtXIimwAoohPqGQDV4Trtotjis78pR8qbjjtN7jCzo50J337tUIixl3ZkU3+yFTkcln79Kd2LG9EvW56ofN6zgI8oILDhYdnTskEG/Zb+J3WB5+LdowR6ysYvwcpeOixilIXawzZykENgU+STxVTJiDlIUinb8PDOhIk+orLWegF0Yjw7FHj3z37XZrn4Lx2Z7kuLA1X+nfFAiJ3bpxtGoxmLaYC9Zo4yPEhvGoFHIx4PPYx7WWm4BB9V7TBHcHgDFizfIVgfihcnI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(2906002)(36756003)(7696005)(6916009)(478600001)(66946007)(956004)(5660300002)(4744005)(66556008)(186003)(4326008)(52116002)(1076003)(66476007)(16526019)(2616005)(6486002)(8676002)(8936002)(6666004)(54906003)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: QAn+w/KuHhLPQLrcm2KcLFaAHnlTzTeVHYqSS1/UqcObRxp2+wdkX8HQE5lOOpELQkHlTpshvX7PV1kA49EWWNaPq/luE5bvFV4UrjN9R7HyGIHNwOO0pjnGrOCanaXtYEG+cY053NguEdpCmbnlqgFX2K1tKIroa8mObobqBKoyIH4OMhag+FFOwpbirI3yOIYTA11cfWUspykdLzV+tY9+grZCFC0zn6mXSOHzV7bfTxghOSKyFazUuEi/ukTInk+TUYv139K5ufZRwFVVM08qLwhsEBO8P34C1t9pqk5xJvQaSovRFMobeiprSZmIYM7NK0BOxfQP9HqYFZaT2THKHN4gVbc1H8aPn8MHHNwZzFYUw40cZ/2KHxvlKE49FlAIHZ1SjKH8TAvM9N0vFnExWJD5whfZOS62dcf2jgj6mfZom2by2LbG/EasDErNJb2LClc1GmFr/ZoGEOUwgCqJG1EI2gaYWQOLc1wWEAqUew9eIeErNjc5DB8ooeOZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f552f04-3660-46a7-8d6e-08d7f9013123
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 18:53:01.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiEe0EoPyrewl3w3Hy7J7sO6JJjOENqtNSc+7+8eI7bcCe8MMgPrBUOwENv/e15hESQze4LIzb0/9l5sTk0njg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3860
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The kernel driver is part of HWMON subsystem.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Change in v6:
None

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 091ec22c1a23..7e7393f9a0e5 100644
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

