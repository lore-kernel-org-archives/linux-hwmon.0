Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03F8C43216
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C781461027
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhHZSmT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:42:19 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com ([40.107.93.86]:29519
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243300AbhHZSmS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 14:42:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahkXRc+fBC1Oq9Q6Oc8iVIVQ3m2Nlz0rHutix37OiIGCjhwehPbEJ+6g+/gpFKmeBe5J2LHrXAQeuvOA/pIEtT6LCaTr+MEn1vsil7MD+oQQu5QPcDviQuSUnWooKJT8oSa8CKc3s4PTouFwb3/vtzbviStHxc9u1bXojJY9a64eqwunljPlDUaQ3tridf6g6AdrW5LkJQrGTAZ7wS5eXAytTR5j2In8gIIDuS96xql/Srd69CUUjQs38vCm13Kh14VPgkCujU5SFQAbR3nspvQtnVkmvVWOBPw0jRNKvk91uKCYll8EUlUWFtSxQ37260X1tQ4rStXtwBqdgqt0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s29EWh1A7DKFEJp42pnzCEfcCIKZEq2ihCqvmnytBg=;
 b=XkXZfJNiwzofDfpancpZ5zxTkJHPXeWiBXoVJvo1xc5gj8LOVpzow1/STE77jQpwaiA6iLlnIO8kG8hQPi232P1WfkC/bdaotEkKJNJPXAcfZdwVGzhnQ2/MkU63Gwisyrqp4daDnXqRqBNL+c8JDq5Im01eWWwG+8HD1VqFRYB1AULMt8TuO2xmpR8by38BTUWMfkiVfYBqbp92Ns2XlAjriUsSZzdhLSQS4/Zec+1vVpfLRziPNVStPCHnfUhc5NlGI98DYEimXYOTpaPGCGbDxynqChjSCnzmRXuIr36ERCvRnu5MedUutgtoFU75pTuucFXkIlPoNLidB+s0Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s29EWh1A7DKFEJp42pnzCEfcCIKZEq2ihCqvmnytBg=;
 b=opuf5Ednb4ScECEh3ODLEbvGTEU0PgwhXb5Ov52KE1V98ouW0eX/VwRnyRgz8QMuas8pFDnfRTeDIo0Lk9ClSV0LOswuYg56SuJYz2eUu4Ak7kKb7Ie1HWyiWdPHOljk0oAeNy558jz+4U3tBE7YI+sQNI9brXR2lDgTWZQLnJc=
Authentication-Results: ladisch.de; dkim=none (message not signed)
 header.d=none;ladisch.de; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 18:41:27 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 18:41:27 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wei Huang <wei.huang2@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 4/6] hwmon: (k10temp): Show errors failing to read
Date:   Thu, 26 Aug 2021 13:40:55 -0500
Message-Id: <20210826184057.26428-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826184057.26428-1-mario.limonciello@amd.com>
References: <20210826184057.26428-1-mario.limonciello@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::17) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 18:41:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa91edba-b126-4dc3-9944-08d968c11cf2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB451067D5DD8E312827491E44E2C79@SA0PR12MB4510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s0Ig7moQlVY6Kf3G0GK8sECgTqTwvGQTSh1wA6gbpw9k0M08jeGTRTm8EvtxD0KJeFkTQHzZBQXNek8sKEXSDZbDQb6SCp01Rsx01mMt8wJs5C4Be8uxTVI3PsyrQojnmRNtdN3O+sr0FmhwFTUz3/wrS8rnEcPkzFQHm7QZxO84fNYvRDxzEhSEkUPnTKryZ9aP8kCNA4oPLGgMdy+R3DoE2n/yNE88pPCJACar1vIyOWOwKbq9qBaAsCKqcEewBvEIls1/6LfKbNbpA45nK+DiH2UxYaBjmwH1IhRX1BDIkLhPw6WBhEGbY0TP4KzeeUts7i9Z6rsmF0xfp+8dWIEngOTx9MNIcMjMhX90Al+Wd0AX6FWRk91qF7dFBLla6d/kosdo+Y/KN933fLT2KuCeq7hs/sbujYGSstqUi/37Nzlz5kcMj0Sem3IAqa3uoQVSr8WmtbZpIzRQBG/oLns2o4/KVpLPBkOGDpeKEOe1Sym1WkKV65xZp0cWX8bbBBecIMrT9g688m9kslTU3Ki8a1qUQOE1Kwg7tA3ngzXndbpURxcPo5L6rd9BXJxo6onxZN18C7EMr1ZqEX5ZTiJIwb2YwV9zA8wQFEm9qUQyNIZelfTFOcuFaiSFV+zItcVFwqo6iFIQSOwU5RKwEWlDl5jJ4kUBRhVZDyNz3mtrOz5dYEKOofGyZjI2hktRUg/ZQnoajOZaT61eY1Riag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(4326008)(38100700002)(1076003)(2906002)(44832011)(508600001)(956004)(5660300002)(66556008)(66476007)(6486002)(54906003)(66946007)(26005)(8676002)(186003)(36756003)(6666004)(2616005)(52116002)(7696005)(6916009)(86362001)(8936002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ycy4nIiPj0GU1pbB5HNaswCxkiTPV1LGFS6wFGh1KRE72rox/VbUMXn/ijpu?=
 =?us-ascii?Q?KlgawDExI5OGkjtnz3Xh51sM9DgXmMnZvL5qKImLSrEB/OstNm2lxG5KRk7l?=
 =?us-ascii?Q?6vbILj1YUqLX2TpXcfcVFpBQ6cqegPitRiikI0t1FKTwQ+7/1lO27OV1jJp5?=
 =?us-ascii?Q?oruOFl5OpetQAKbSWVJHLx3BHE8i8zxHb1Ljb9D6cvGlHdVw6FFx6B88jt3N?=
 =?us-ascii?Q?fTsbq4EJu06cnne4PgEm4Txf1pHjsJwGa2T3DZxCGkWwlZegdz0MmaT8OmbG?=
 =?us-ascii?Q?Y2q70FPe7oVEhMaHKvA+8Sc6npXvK5i88HhHdtUL9f2msFTNd09u0egOT7TW?=
 =?us-ascii?Q?x4tYDf194Ia8uDcMPjZy81g+7GAODOs2JOz86y8FbUiK8PnsSAlxulh7a1tj?=
 =?us-ascii?Q?ISyazYAxoskQDLw6t5UIchl03+MOF8i6t0gvK9K7OSQ0JDFOpuBNTCafCpOL?=
 =?us-ascii?Q?KLDaYXbt4L0Xi47xMRSUt3A9WNruMlCqe8dyLmPygQtK+osKDCmtuTjuSYoF?=
 =?us-ascii?Q?z990JrJ2LBf4qnt7kAc3ie1U0RwIwGCq6awUXu7gWidxYI+1PJDEQiua28ul?=
 =?us-ascii?Q?yQds5mukF6aPsezThO465cheflj+TkfW2A/Xy+d0Rt1x6nw3Gw91ZcMyfVI5?=
 =?us-ascii?Q?FgSpqVpgTP6eFwYZWKKKmiPH31BeE0aUlhdInRXDv7utNt2iXY/atZ2YDnmn?=
 =?us-ascii?Q?hvDD9YiR4Xuww6Y/M5TBLP6pnFDfCAuagWcNKpU2Qr9jSZ0btBiYdFUhiUmb?=
 =?us-ascii?Q?83mOdRiEMLPKsumIs+WY4zVIC8GJ35G+xDggEJPW0Uh+CyPCq9oV+L8/WJfA?=
 =?us-ascii?Q?ZmnFc6G7K/dYoE69cn1naiYj1GC8ye390C3dOPYiyEunnMgEuMqpAkjphuWo?=
 =?us-ascii?Q?klVaHeV4jEgNsvpsFKw4m3M2igpycoBe5c3bJs6H+cpGbWrz76tYTs0cTHBY?=
 =?us-ascii?Q?rQ+/B4EZ0CORParWk+8Ak0ydz6/pVQm57UivsJRPxg6OViz/qKYwnhRaZfEk?=
 =?us-ascii?Q?hHinMKALc2wYSVj39/vttBeEBPfZv3wVP8qEMH/1HH4Y4S6VWr/4l35KLkXv?=
 =?us-ascii?Q?Li1ms5NIyUioierwHnptzu+K71zP/DIk+0c7z64fPFQCnu3t1Z+5xo6VFhxx?=
 =?us-ascii?Q?19VlxLPeNPddJpDy/TeMradTUTWXTWa7t+yDocZMjIFhO5/VxUwfAlNoV9qT?=
 =?us-ascii?Q?P6GEcz1oVj+5GJPois2G8TJvDSC7o1dD+AvDsTqD3yQau2nMX3kSSKmI6stq?=
 =?us-ascii?Q?fSbTHauRlYsDupmM0p21IY6ZHj31wiRmQ1KuLonmjoxjHIfItr7BesL5mCBE?=
 =?us-ascii?Q?N5EtHfOZxhYKEilXMeL5Df5s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa91edba-b126-4dc3-9944-08d968c11cf2
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 18:41:27.4896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hZTfJqXipqkHmwvDSIWQmcnuvpjwqfOz6d5fiDXFpCfQdc8OiynF3jpGeErT3+a0wNKaRDicLbH61kLmiz8SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Enabling Yellow Carp in past commit was initially not working "properly"
because extra IDs were needed, but this wasn't obvious because fail values
from `amd_smn_read` were ignored.
If errors are found, show a kernel warning.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hwmon/k10temp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 5c1aebf7a56d..41d9c0c0a1f1 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -164,8 +164,10 @@ static void read_tempreg_nb_f15(struct pci_dev *pdev, u32 *regval)
 
 static void read_tempreg_nb_zen(struct pci_dev *pdev, u32 *regval)
 {
-	amd_smn_read(amd_pci_dev_to_node_id(pdev),
+	int ret = amd_smn_read(amd_pci_dev_to_node_id(pdev),
 		     ZEN_REPORTED_TEMP_CTRL_BASE, regval);
+	if (ret)
+		dev_warn(&pdev->dev, "failed to read core temperature: %d\n", ret);
 }
 
 static long get_raw_temp(struct k10temp_data *data)
@@ -212,6 +214,7 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
 {
 	struct k10temp_data *data = dev_get_drvdata(dev);
 	u32 regval;
+	int ret;
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -227,10 +230,13 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
 				*val = 0;
 			break;
 		case 2 ... 9:		/* Tccd{1-8} */
-			amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
+			ret = amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
 				     ZEN_CCD_TEMP(data->ccd_offset, channel - 2),
 						  &regval);
-			*val = (regval & ZEN_CCD_TEMP_MASK) * 125 - 49000;
+			if (ret)
+				dev_warn(dev, "failed to read CCD temperature: %d\n", ret);
+			else
+				*val = (regval & ZEN_CCD_TEMP_MASK) * 125 - 49000;
 			break;
 		default:
 			return -EOPNOTSUPP;
-- 
2.25.1

