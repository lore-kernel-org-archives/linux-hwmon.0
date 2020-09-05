Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A49AC43461
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CE68206B8
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="YNHYgWDp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgIEOdH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:33:07 -0400
Received: from mail-bn8nam11on2063.outbound.protection.outlook.com ([40.107.236.63]:2133
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728364AbgIEOdF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Sep 2020 10:33:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVuwV3fe9N2VxOoXIuBb7OWSwtVfbxsuqFqIPemrzCyVormzbsrqD0tju2HQuNhPAZ3G2xd7NIXNTmCRUn8RE6irjJplKU/hA+ugvewvn8grtUq0XUOYQN/aSRJLgHam3cS+fnn4YigtGeH7v0fnhqD+oWeekx3hG6R+b0HmGJnIX0S2HZ2rXG36XXc/DQm/6MxYaT0W457IRAp5vn/ETyYezCyRvUH8ifELDHQZjHUM9bw3qEnfD3jf4COowIPukgq3yYPhqyELeG8zRPc6kLajyfwnunrnNdcp6ZERa2jWrJQLAB6O9kleW38iNH7mXVAqy+CYqC/DDZNYP1SIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZE8mEpZOc0DoZa4M97ogv4hgr03c4OIKFWY0MTHNyo=;
 b=jkWNq2ea9SklaSquOVAMAnjJ+h2PSj3GPTOnK16ngBbwz01PAPXJMgEUXmmBEZYGLWY41V733xRyGX8HpSErhwDXNV0jXWO1klYdrgKOUG8RX8Zq/DjMAw2N+E0YV96MTSKVs9XLRrxV5AGn+N2CI+9rVFeMh+x11G5iwbiyfj3e0LjQRqGyoG4oWnxjQgn4k9mFGOD8aVelMqBiW761YA8wKd34eQoLIDIaXW+lK+tvak6I8gBFfS61Gxt72zdHQLL93N9Dvr5D3TusaVLWbjX4rJpI22qucptXq4KgT5FjCP0miUdpPUaAkYTxj6DvGtqmFHWGt856VffQFRoshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZE8mEpZOc0DoZa4M97ogv4hgr03c4OIKFWY0MTHNyo=;
 b=YNHYgWDpagzCrmrrOf1Oi8NTyHf1dE3bUGU6bQvt1abIv03BeOOt0fbKkk5HR1y+L/TonbclTs51oetQiYFMw+Cna4BaqMWnMrppy+03ow8pI2u71dSi4Jee/K0g3lsyER7TCQ9y0uIm1WlUkT7CPg2R4L5ZstRM7q+aubQeeX4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 14:33:01 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839%5]) with mapi id 15.20.3348.018; Sat, 5 Sep 2020
 14:33:01 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 5/6] hwmon: amd_energy: dump energy counters via debugfs
Date:   Sat,  5 Sep 2020 20:02:29 +0530
Message-Id: <20200905143230.195049-6-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200905143230.195049-1-nchatrad@amd.com>
References: <20200905143230.195049-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::25) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 14:32:59 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e46f72d3-7056-4b95-cdae-08d851a8976e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB311486F4CEB40B81BE6C92AEE82A0@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nD8eTb8WvOSZ3XyeYjCgqPVUE9aBfTr7SF/hMfIJsYevi9gkUOQoYguedM7zefgbtCuMIhF+2dQ3mmpI955QXdQC+ROWeP2gMTzJyaQ0b/RJT8tN+PLNSO4HQHKZ2gNnyGC295uMDa5Cr4XHi8/X+HxqbmxJFuB5UJQInl/EIanNIBaU78orRW8T0x4ymXr5DY+3LY87Kd0etL3IEttq0CyHgo8XEBNfDSnOp6WC9PoUYQeIMb4u2+kyQVZuQ05Np3sjlARowLLi14hznzL18EAIeBWcsyT+KaIJ0AtFleeEwwAJXqrRE2utqg2a3nAfMtyRktC32OVYws6Zj+o2lA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(52116002)(316002)(478600001)(66946007)(8676002)(7696005)(66476007)(6916009)(66556008)(26005)(6666004)(4326008)(2616005)(6486002)(83380400001)(5660300002)(956004)(16526019)(36756003)(2906002)(186003)(1076003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xcJG8uUrHu0v9RJ+Dc5L369sMPmBO2Inh6BCU3w1xJjJDOELb5/D5VJ6dSu3+rrkTY51ed1LFhC85hPQH83oZcEjvx9F7IKlcNdcTIUvZXW/MD0pwILri00jOGmHo139PgZuv9zSsmiy2KT87wH+eYaWgqyBaglrckCMd4fkfVcSLemuc0jnoVvc3R1DRtj/htnmcQSkwu9jdyesumXFdqLpdP912Df/FqF6lG41i9COkuL3KM1CjVZWkZPQ4TyNX8fzgIIJzML2dcurYzrvbNQMEEd6VzsTx6Mj89yrBVQDWPkLRZXlsXZ+9g54ubDVwKqYePgApx4CVO+s1EVGrt9RUBGvvh6aOtpruhckcHCOSdESn1FXSRDYVgQvTOcnRf3+Fg/zdWmmfWgeJJ7kjT9xushDPBrwFMZAHdaiGDoe5jgFt4sLnDgEmhvL+tkdwk648Ht4cvZcPJ6Xq/TDSltfCET88YT1zkd2uGIs0BEMMTUmvk2e4YXTEt8hlq6VWgiDuME3oia9vXvUKneGlcV5LMwBRlf6kzPkK9jycEhQ9AmQlzUzaFlsA/qkm33r8xPMiqAHC3G0AhKniM11n50rfacjD6XLCoWILkWhT4TnDTkbFJXBn+7IYVLg/RS3BLwWqcl+ABsahxfRwUAtKg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46f72d3-7056-4b95-cdae-08d851a8976e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 14:33:01.1236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rGFRhc16+MtbiC2EcJPjG8bjnvuA574jWzdcFQ6I0ZxYiDkxCLyPRJW8w856ENCIpJGVAjXn2V1Mxk3Q4cwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use seq_printf to capture the core and socket energies under debugfs
path in '/sys/kernel/debug/amd_energy/'
file cenergy_dump: To print out the core energy counters
file senergy_dump: To print out the socket energy counters

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/hwmon/amd_energy.c | 110 +++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index c294bea56c02..2184bd4510ed 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
@@ -20,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/smp.h>
 #include <linux/topology.h>
 #include <linux/types.h>
 
@@ -57,6 +59,8 @@ struct amd_energy_data {
 	int nr_socks;
 	int core_id;
 	char (*label)[10];
+	u64 *cdump;
+	u64 *sdump;
 };
 
 static int amd_energy_read_labels(struct device *dev,
@@ -329,6 +333,108 @@ static int create_accumulate_status_file(struct amd_energy_data *data)
 				 &accumulate_attr.attr);
 }
 
+#ifdef CONFIG_DEBUG_FS
+static void dump_on_each_cpu(void *info)
+{
+	struct amd_energy_data *data = info;
+	int cpu = smp_processor_id();
+
+	amd_add_delta(data, cpu, cpu, (long *)&data->cdump[cpu],
+		      ENERGY_CORE_MSR);
+}
+
+static int cenergy_dump_show(struct seq_file *s, void *unused)
+{
+	struct amd_energy_data *data = s->private;
+	struct cpumask *cpus_mask;
+	int i;
+
+	cpus_mask = kmalloc(sizeof(*cpus_mask), GFP_KERNEL);
+	memset(data->cdump, 0, (data->nr_cpus) * sizeof(u64));
+	cpumask_clear(cpus_mask);
+	for (i = 0; i < data->nr_cpus; i++) {
+		if (cpu_online(i))
+			cpumask_set_cpu(i, cpus_mask);
+	}
+
+	on_each_cpu_mask(cpus_mask, dump_on_each_cpu, data, true);
+
+	for (i = 0; i < data->nr_cpus; i++) {
+		if (!(i & 3))
+			seq_printf(s, "Core %3d: ", i);
+
+		seq_printf(s, "%16llu ", data->cdump[i]);
+		if ((i & 3) == 3)
+			seq_puts(s, "\n");
+	}
+	seq_puts(s, "\n");
+
+	kfree(cpus_mask);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(cenergy_dump);
+
+static int senergy_dump_show(struct seq_file *s, void *unused)
+{
+	struct amd_energy_data *data = s->private;
+	int i, cpu;
+
+	for (i = 0; i < data->nr_socks; i++) {
+		cpu = cpumask_first_and(cpu_online_mask,
+					cpumask_of_node(i));
+		amd_add_delta(data, data->nr_cpus + i, cpu,
+			      (long *)&data->sdump[i], ENERGY_PKG_MSR);
+		seq_printf(s, "Socket %1d: %16llu\n",
+			   i, data->sdump[i]);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(senergy_dump);
+
+static void dump_debugfs_cleanup(void *ddir)
+{
+	debugfs_remove_recursive(ddir);
+}
+
+static int create_dump_file(struct device *dev,
+			    struct amd_energy_data *data)
+{
+	struct dentry *debugfs;
+	char name[] = "amd_energy";
+
+	data->cdump = devm_kcalloc(dev, data->nr_cpus,
+				   sizeof(u64), GFP_KERNEL);
+	if (!data->cdump)
+		return -ENOMEM;
+
+	data->sdump = devm_kcalloc(dev, data->nr_socks,
+				   sizeof(u64), GFP_KERNEL);
+	if (!data->sdump)
+		return -ENOMEM;
+
+	debugfs = debugfs_create_dir(name, NULL);
+	if (debugfs) {
+		debugfs_create_file("cenergy_dump", 0440,
+				    debugfs, data, &cenergy_dump_fops);
+		debugfs_create_file("senergy_dump", 0440,
+				    debugfs, data, &senergy_dump_fops);
+		devm_add_action_or_reset(data->hwmon_dev,
+					 dump_debugfs_cleanup, debugfs);
+	}
+
+	return 0;
+}
+#else
+
+static int create_dump_file(struct device *dev,
+			    struct amd_energy_data *data)
+{
+	return 0;
+}
+
+#endif //CONFIG_DEBUG_FS
+
 static int amd_energy_probe(struct platform_device *pdev)
 {
 	struct amd_energy_data *data;
@@ -376,6 +482,10 @@ static int amd_energy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = create_dump_file(dev, data);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.26.2

