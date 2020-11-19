Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D876DC56201
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Nov 2020 18:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74ADC24199
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Nov 2020 18:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="Ig9gHYzm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgKSSRZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 19 Nov 2020 13:17:25 -0500
Received: from mail-dm6nam11on2061.outbound.protection.outlook.com ([40.107.223.61]:24288
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728277AbgKSSRZ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Nov 2020 13:17:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECQ4m36GVfVt8mwSxcEb8d5TiYWgdDg0NHImGQuavvRYvJx0ylrodkteJI3SanNeVdZUcigFsLiEy/MBoHIFua2ISPIynSAy5tEs8vMRqIWzrk7qNwufgabRw5JL7HnmYUXYwNf0luSgfr/9NA6d9fFKnCECyNEPNPBAbxkcp/EvkR2G88/IO9XIR0AxlPVRsyAGBUITlDib97xXtf7BDy3oP0VYZ1l4JjEYqoYwh1DfX2oAUUZyqdBncdivKtZ0Ub2Zwv+dgazvpKAsGLipD5hom+C6zl1lo2TnAX+Ia2ejd1y1yOitK4Zrth9UrC6oLVRFX9Xdi/HTWaoSKSJkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+V3TyIzU4MZA5kqcu1y6QvCN89oLV6O/RiTCm8XZ9w=;
 b=Ba7Qbk/qUjkyvCi0B25IyX6bdbvhGNPokFPV6qFzwrJ4C8513cvHysDmLJMRtDkLLigURzKSJjwYSCch8rAIyzpk4a0UODvCTZ/b8jMyBK0gnflaw3ekosAzl4wY2FQ3SdZNIX02HSqZ2DCCsN1/FE8lktiVIjNtGurpXQZhgGaWhLSsHum1hJIS/M8uvh4GUZP2w/L1gnxwuYRTk/Lwvp040YOQIR9gXU/++u8BczhQs5r/mr2eeQc/d+jnwKXPThoMPVsNaZNHDLyprOPHz54ba1VNK4CJDcAXiD5BEi23Z8H3CXCZrSp+oA/LJi/ZxJ9JoadAxYJm+Nn7/B+Mlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+V3TyIzU4MZA5kqcu1y6QvCN89oLV6O/RiTCm8XZ9w=;
 b=Ig9gHYzmtvFK2lpvyGaBhQ9rcSiKoWeyHVoL7ssQeFePhd5jMwIhTqvEBSXpmH+XhyzDOuXIQepLxzHYcHgIG9bvKRGoiGsHlYD0s4vlwFe0mCBdO5zSWJITSSr1bSDSHPMFFf4TvMsQAKZ+vYx9QuYFOQT0GEdY/XnLT82i/jM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM5PR12MB1833.namprd12.prod.outlook.com (2603:10b6:3:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 18:17:23 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3%4]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 18:17:22 +0000
From:   Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
Subject: [PATCH 2/2] docs: hwmon: (amd_energy) update documentation
Date:   Fri, 20 Nov 2020 00:12:46 +0530
Message-Id: <20201119184246.228322-2-NaveenKrishna.Chatradhi@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119184246.228322-1-NaveenKrishna.Chatradhi@amd.com>
References: <20201119184246.228322-1-NaveenKrishna.Chatradhi@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0081.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::21)
 To DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from SLES15.amd.com (165.204.156.251) by MA1PR01CA0081.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:17:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a656918-9a33-47e9-e9a3-08d88cb75c16
X-MS-TrafficTypeDiagnostic: DM5PR12MB1833:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1833050783EC058C6FC4D3E5E8E00@DM5PR12MB1833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b1DiNDk9EO0L9Uvz/KunDYc5AbbIKMpQSVadpIC9uzb3BNL0SxDbDzuAtYZf0OmLNZ0uPb/WHhVUe6OBi0TNaJlsR6buriK3178hHz8gHKjcpMWE8SQ3BxuPt0Ct+pf85hCYsMkIaBewFhw5WFUhun8DkbJImQ296glymrk5tehUcbZFYhvUYhqpqHfJ9vR5B3zcL4zMxFT6HmOqFeYOpURvpwgzsARfDydjE6993s1xwRmGj3AVzOt1pGiqEAzbgjLrzcm/zVSxjDx+HdLVz4h+DKIUdSV2pVa21sea/PsdbNINoxqdj0lqEtnMyEm1aBfruC0QghQQnQeyYwkD7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(8676002)(1076003)(15650500001)(956004)(6486002)(86362001)(8936002)(6916009)(16526019)(26005)(2616005)(6666004)(52116002)(7696005)(478600001)(316002)(36756003)(5660300002)(83380400001)(66946007)(66476007)(4326008)(186003)(2906002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fa1/5Bife4XxT8EMZTSarIBCWNiTvTjk7pwjfunTFJEKr/rDEsYRQ7UyO3tMpjKwrHzJUGRO5fY/AmErqaHU8JaCWZ7ublidsM9dDwIZEfU6+EQy2diUVqmpqdxdIJ1HPxq2UoZhbjEG//MvZ18HortKHntZg2a641RmdiULA6F/b4wZ5Tfd2r/gSSqkIqOXnS2Kilt28duKlWaUAcZKATOfmpDlQvzRwHKQvQVawcCcEe3AoyAWnUc/rdeLWE5gsGw9AnGZd3pzVjmdM3Rxv1ZRK9zzXBNRYX6ivv+KJLkds0/q4cnLsglrARwwFRSOmr+6sfFU0oDeSF1tpI6EqcPo/kB26SaqCmlJZubV4qK3CJZMbYctHWoPTrg0k2ssPR1REtnWY/Nv0YyIcCDEHyEt1uWN6FPIpn9CZgdtoiCd4Bm/i5a4zXODtf53/nqHpYIJ6JqhTjQ5kWhOQpnD5fGzK4+mdISK0SrU5yvsHfQr5QhDweH/rAkWtUSWrNFptIvSu/XFKCF3YdO3Ic5hfy4Bhva4hyeYr2OZAwzt9VgRtkLXg/mcyinOUbH3dybqiqLEMQAU1co02KksshBLrgbVrknpL1sFrp2GFvGctuLkgccIoB0VuItNMNBogWlQs5bn3Kl6y8Qc6nW8f2iY/Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a656918-9a33-47e9-e9a3-08d88cb75c16
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 18:17:22.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ih4CWPpuUVPNe/lN/Ov5p8FOFnP7O5b6FsH4sZgy9mK5R/W0vk4w6MP1hprcAlZB5p9ljRDhyUJ4sR9WjvgVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1833
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Update the supported processors and mention vulnerability fix.

Signed-off-by: Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
---
 Documentation/hwmon/amd_energy.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
index 86e4ebc5cbc2..7d6fb4b0181b 100644
--- a/Documentation/hwmon/amd_energy.rst
+++ b/Documentation/hwmon/amd_energy.rst
@@ -5,7 +5,9 @@ Kernel driver amd_energy
 
 Supported chips:
 
-* AMD Family 17h Processors
+* AMD Family 17h Processors: Model 30h
+
+* AMD Family 19h Processors: Model 01h
 
   Prefix: 'amd_energy'
 
@@ -112,3 +114,6 @@ energy[N]_input EcoreX	  Core Energy   X = [0] to [nr_cpus - 1]
 energy[N]_input EsocketX  Socket Energy X = [0] to [nr_socks -1]
 			  Measured input socket energy
 =============== ========  ======================================
+
+Note: To address CVE-2020-12912, the visibility of the energy[N]_input
+attributes is restricted to owner and groups only.
-- 
2.26.2

