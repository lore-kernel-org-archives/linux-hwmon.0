Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68195C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 08:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbiA0IxK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 03:53:10 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3874 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236698AbiA0IxJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 03:53:09 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R6upGH011847;
        Thu, 27 Jan 2022 08:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=QFbkoRUdLQCurDnMgpbDlKNkxXxzYB2D+Xrt/gjdajI=;
 b=WiOSnxViojQVD1+0nzGQN7UFBtlEpnlV0x8sQ3oj5E+W1EiKwgs+3h06q2GibsyuYOfP
 GrmX0+BwdKXg8mkVMEsDcaMFSQx34kft7a89iIOAiT7tz1TN5Ut+XkXl7QflqjUATswd
 aCBMVPw1qrg1YPVo0OqEvTgoqPUJa2+t28iXe5IQpkqJai0KO4AXKHESItCWeMlh0Nhq
 Bz8fnzK9qeiKObXAfyuZ40ECHWzV+zhriwrgNXf6YLy2xdOGc90qQ0fJHzpKtHmyK9nV
 X0cBFfT1dXKA0hxqEU3xSV/yDhF29oqhl3T6EA7foing6MOsV4jON4/QcwjPISvnpjGX 6A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaaggn3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jan 2022 08:53:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20R8oXfs101112;
        Thu, 27 Jan 2022 08:53:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
        by userp3020.oracle.com with ESMTP id 3drbcsva76-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jan 2022 08:53:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6r6slpTO1xzanbrnj8X+elFHc3uCAZ9gP09HBfP5O4hSKpaeYVnUih9TETxyylQF3tb8HHzLCsfnnYAoX+GsCnHBRt5sROkF3b7FzBhYsUoqEoAfAYqjioA5i80xckIZqkVPdPs+DCWqfCGsQyAEmF30zJAjJHxKSZZcbI2d2lwkMdeL7n4UOKo8vrCSVcZYBHS1YJlKvH3HwnJEf0TCdWprBp8JVwIsyx669NFPK0/qQpSjwd66DpvRMoBjgmnjfArVVzQVE5SlRBfXWzNzQsZK16iNTf7Dg+CGAFx3jZBbsXcnHHL+cFsR8Qeg3Z6TA4i2S3mpXz3vXpoZd4EMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFbkoRUdLQCurDnMgpbDlKNkxXxzYB2D+Xrt/gjdajI=;
 b=ko36b/xhRquaeuj8z3XSLMIUTT5aaeeiwNcd0mZ8eCnNhIdSM2oBPaImtRCxCrQNh/IMXaBtNSaEKUFeCBEGdM/EMt+x5JyMyIFihP+7lpOq0TZTeLMKpuOwWlJ9fK7mew7GdJIHT4lqF+2pIdD/wQo9c6EaGd/GzeKvw568VCKvxpa9/F1bJqufXx0K6hxduFGN1rx2dUasAu0wJxK7XkMdXCiTK+1iOGwM+K+78HHNg5q+WnARMfSaGFHskLXDLo/2xPx3DykEtUTI+zp/m04BZzWjvppTPwvAHoo8ZVGjnzSv3n8XnV9HDlIPBtIKtTCAAkURAWi85C5bV6i9oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFbkoRUdLQCurDnMgpbDlKNkxXxzYB2D+Xrt/gjdajI=;
 b=WorgaGe7Gq/pKb3seIgOodmBp+Cmq7Pk+QUsnZs61ASuW30iiLUUW3NY1DwJjX49wNPJEDSYmwin86r5zG3P4fVVBWDaESp+nO7p/GZEiX9aZeBHQHUl4UmfV/mA9rrRaYWKlpgyQyqTLDCCL2+DsQRf9iS1LK7PTYcO/xJ2mFQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3685.namprd10.prod.outlook.com
 (2603:10b6:a03:124::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:53:03 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 08:53:03 +0000
Date:   Thu, 27 Jan 2022 11:52:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     paul@crapouillou.net
Cc:     linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: Add "label" attribute
Message-ID: <20220127085245.GF25644@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: JNAP275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0ea241f-6e2c-49e5-bbf4-08d9e1726d81
X-MS-TrafficTypeDiagnostic: BYAPR10MB3685:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB368572AD7E88567F030D649A8E219@BYAPR10MB3685.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyqQ5PXVxNzEBMqNtObbNXm3aN12X945RskG6UGvq/WRY1wO/2jCT4LuuDPktriTZyfIHI1zWDwy8+RwoiZqbnM/CIe+XTABYcWRiRhyFGhXEatDbnl2YWjESRiz2OeugR0epo9XYKCHgeKLS3BktCHovzxk9blyAWcc8bbMTR+Pn2PnBhMOsag7qVdq5ZyHDIkKOGtEM+eOLtBs3nk8vYP0L5VUxqaJI5/R1nvqsaP6LmfDECxRVgyb28Vw0TgsnMk5szT60S/4TsgHdaeH8ZqyKkB+KCHUblV6fueqjjiCwPLl7MAXiseWgbAopZIn/n2/iMobyPMvyURM04obfT7NgdBJMqEwykSlAyhvwWOyh4KKWgIeHkNYDO2TIATCfwND/pKyiUkxI6R/lGGzj60LCX2HVmiYSRurhf0pySwazJV/cO/u/MzXLGo0eZN/GXqeGZOWKLWduT4ll/0rZpyxv0V7h/xv2HhWQAqRWb24qdcYwvWazdPm3pU4ncFkIEJ01b+Ae9yp0XQjxozkG3qLQPNF+kWwo754I5GkdGTJCU/x0duGFKmIi2rAkSsdnXt3gH3WI3+tP+6Y6VL/B46aFapN69bSc/wqFwdYXNjsn9gwi9b2fZtUCGWymm5C/I2CjKPzpWs2/ZHdgeXXj4whiCvj8B04eQrY3jSCeo167C7fBH2USoF2S778SHGUEE+qSDdpf1uk2EWC/ejBYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(508600001)(86362001)(2906002)(316002)(6916009)(38350700002)(66946007)(5660300002)(66476007)(66556008)(38100700002)(8936002)(33716001)(8676002)(4326008)(6486002)(83380400001)(44832011)(4744005)(33656002)(6512007)(1076003)(186003)(6506007)(26005)(9686003)(52116002)(6666004)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wftYMtiLfLH3/166qBTHo5IiwXE1kR/4FNKbpF8oaD9UqaD3/RDsw5tcoCKg?=
 =?us-ascii?Q?tn79OhKgAVOuRiX25hzfFN69tox8BSSdgP1pIbQhSoF7x+0TGCHPwB18vvpn?=
 =?us-ascii?Q?cYIITHQ6xU+77+1BTeTZ/nIc0a1YensxXuRlIjr2tOhGlvWXoqm+1gdXtdon?=
 =?us-ascii?Q?dM9yMmtDjHFTV6McjdLtWsjDrDEqxvQjRrQqhfk80XRjDLRtm6UeHAR3K43+?=
 =?us-ascii?Q?I2+AqU9m6b9ycD4MMIBp5HWhyOsfbVulL2NtPiBGfrIwGbnCTP2jxZDSQWur?=
 =?us-ascii?Q?hBmR1zvK2hlN0yScCsTlVo+FMgYEwd5TFghQWlyYYsVpbpN2+HlhNXztIVAT?=
 =?us-ascii?Q?ZPxBlWsNT1UTzww0ICcXou4nW1y94DPULgmsSICS6BNbRnY55a3MAJyh07Di?=
 =?us-ascii?Q?g3Gyn3QBTMqrV+PSeZ0aOEdS5QW8oWpKAdlObzvmGnYfrkft7AI/NOx20ksO?=
 =?us-ascii?Q?BPZOfVuaQNAajx+r+U58HKn/npQA6vuF4M1nb4hlG0+BiXG/59bA70Tt00rU?=
 =?us-ascii?Q?M5bVn7rhr6p4xQMk+V6MigzgFkaQ0LgbSrJpkQULtaKFccZNN8gFSNxJJBNi?=
 =?us-ascii?Q?y7paVUPLw8lkZHkSv1XHbCGXhHFh8kETQ5uFkmKr3/SyN5SXnpOSIT2s2wl1?=
 =?us-ascii?Q?uO8zLIvInFqr6OCbThHGLRKabKK9awHfqDEevwo1cA/uudn7TCFpot5cTHDm?=
 =?us-ascii?Q?lqU+WPV0RHBX+rQM4ydvK94UcRKSv4cN8Bs4/L7T/zfD8CEOASFA4ydGdJQN?=
 =?us-ascii?Q?sEJz8qP6/ti96U/YbKwQNtc8fetG90DmMpZsQ5SfaEP2p+enlRi9WnTBH6pd?=
 =?us-ascii?Q?5UtbAEUds9KbSwiL4/30H26GI2pOrh9lyu1SSzsKGW9LFp6HFNcFPe+hycQd?=
 =?us-ascii?Q?KOyLgPIhwaF0PF1vN71R+OBN2Eji6XO7bpuf6LsMOutKlhR0aE8kZoOD3u5j?=
 =?us-ascii?Q?D656TqfSy+5mJijroetATuTWJkzezEULgwmDkzZ9slxSRG0O/hB40WQs51ny?=
 =?us-ascii?Q?E7wuhVTC4ilb/yvpT2ssM9f4mElN+tvnZ3uGHoflnjRH1LgJ6/JVpTipc5bX?=
 =?us-ascii?Q?w9V+qQKEtn68q6iDDi4CroxyKUGRd/4lR3jqw17tu2ewUD6v5VYcKsuRSSS1?=
 =?us-ascii?Q?f86K/XPzFyiGV1Mcvse2ZiVAvxek+j82MdbooQsREeMzFj2HrwpDb57Vy/T+?=
 =?us-ascii?Q?MzNyFWkhvWKCAm0MxQUXtb/Vo7qBc1BTL/iTrMXktafnWhvjcJzanyRZPi52?=
 =?us-ascii?Q?Mx0cCbJtTffY0aoyEpgz5/lW0sOWpsusQzygqaWW+eKXZN+m5DNGAMFhvkXD?=
 =?us-ascii?Q?Tc8Sx6D83ogWfTYTVloF4Kjyg9XVJ0vwOvOOK5p5KH1QqsNlz0xtetKWnuRB?=
 =?us-ascii?Q?5s6LBqUYJqzbptNNI71E7ckBCMfmjeEiJGXaijZaIQnUVwGzLWklpl03HXmp?=
 =?us-ascii?Q?QNgxUds5UMiq/nw4tIxtNxyPZWWBZzbNwhBuijNOhsroJOYn5KAKt2CD1XOs?=
 =?us-ascii?Q?YK9iTIfVl2ZOcb5Mh8cZ7lM9n4UyfkXNyOfc712EZQr+gVsFXVwdhvMCruNS?=
 =?us-ascii?Q?Gvkf89dZvkWGcrVFsuU9b1iPZ6CbkkFqlCuEwUdeilfjwGhX9yI0BR4k2tPq?=
 =?us-ascii?Q?9KYHitks98ZapU4Zct6pbUHOTJBrammILZKaIMfqqnGNK96ocESwkY6J2yd9?=
 =?us-ascii?Q?OuC4u82xUzVTa48AmP3nzWLBaiI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ea241f-6e2c-49e5-bbf4-08d9e1726d81
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:53:03.0469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6c7qSrtOTkpE6A3hYrTa/+b764xehKZeuUrxa6h5ZRZiQv/6h6/j9M6NcKkLYZLaZuCVLEzmR3OVzHOTKVZZJ3VEck5WBJg9YsVJyu7IsuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3685
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=718
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201270052
X-Proofpoint-GUID: CVM7SLuMnoi-XxZnd2kmeV1MecG3NoSA
X-Proofpoint-ORIG-GUID: CVM7SLuMnoi-XxZnd2kmeV1MecG3NoSA
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Paul Cercueil,

This is a semi-automatic email about new static checker warnings.

The patch 073c3ea6c530: "hwmon: Add "label" attribute" from Jan 10,
2022, leads to the following Smatch complaint:

    drivers/hwmon/hwmon.c:825 __hwmon_device_register()
    warn: variable dereferenced before check 'dev' (see line 810)

drivers/hwmon/hwmon.c
   809
   810		if (device_property_present(dev, "label")) {
                                            ^^^
The patch adds a new unchecked dereference

   811			err = device_property_read_string(dev, "label", &label);
   812			if (err < 0)
   813				goto free_hwmon;
   814	
   815			hwdev->label = kstrdup(label, GFP_KERNEL);
   816			if (hwdev->label == NULL) {
   817				err = -ENOMEM;
   818				goto free_hwmon;
   819			}
   820		}
   821	
   822		hwdev->name = name;
   823		hdev->class = &hwmon_class;
   824		hdev->parent = dev;
   825		hdev->of_node = dev ? dev->of_node : NULL;
                                ^^^
Existing code checked for NULL

   826		hwdev->chip = chip;
   827		dev_set_drvdata(hdev, drvdata);

regards,
dan carpenter
