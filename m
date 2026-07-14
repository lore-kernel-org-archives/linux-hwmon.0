Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013029.outbound.protection.outlook.com [52.101.127.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382F4483BA;
	Tue, 14 Jul 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034217; cv=fail; b=iXfphCuZ11QcvxUiWjXWSseoGcdO4WgU5loS71nwjCAbw5vl2Jb82VLseFGC/VYKioIyskyj7nuoA5KFMVqBu5E0CZt9LjlATNBT6SXl6H05LNKUcZfAaKPTpybO3Y2Jox4J9PxfwQ8G5wsGkZIIef94FCSFV5ttcYs0iIqWW6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034217; c=relaxed/simple;
	bh=aZiBq+cc74hSZkyXkKTmmVgXfvJaAcqM5ib1LrkdiJM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fgToDy+Nr3JjSL1/HemMfBeCe9/YE+VXBbxgn+jWdFcEEVdpRTO3eDNgcwQ8KewTIFruLt0xhBjhnZcAQffNqWpPwaJBKPFBNLAQkbsb4+PdevmssXnFTnfrYqVBzCu799I7jq0KPPw02zxB5N0ZWVPj5P+Si1eI9r/HolCkeIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jWJZ1v0K; arc=fail smtp.client-ip=52.101.127.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="jWJZ1v0K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFdvtDAB0Ios5fcbkN7SvoWVlTcohZn/XxJUM4B/W8kUjPoxYeR1KFE/oiup5ZdBilQWx0f1te6gnrbN1js7XUZ11PD4C361qJVzTed8RPxjEHjeEaUwjFcyYrGjwlqySjfICA6UHS2JJoQRJGJWsYNKuryPjpIdZbph13W/OY3inrC78pxhIfMXEn5IRp8kgyAoALXoGVxVtSpBYUwTkzJWwGlQdKn9rwCNTw1tkr5RAVm3xh+pq9uBGnuQStmeAIYmLHi0cmm+6uMXQ6D7DhZoFRskLiAbHLJE5yVUldJQMLNt281kUV1CCQeuaIL4DPslpiOqxjpZQE3oKRJ4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR3qqlbrVFbKncFy3G0Bj/vKdzsR0uXEneMubWXw9lg=;
 b=GptC6DIn+pW8y7TaeqI/Z6HSIWeU/+PswcOU1Ux4bd/L+q/sdj6dKDBcrOo1mHzmjEVWHy4/M6grFSzVyD6aYEfYZlgRn4X2S9P/cHj0v5oUaxIjzw6Ow46IYP8dedrqvgZGSbkcOdEYqpX6zVuS6Oi6pxmuRsIrjtYN8GRxYzaT6TJlqxZc/5uNFeteOPAd2tvhTkieFMA45zb2g19BjIRan7bv6QKyxlSBBXU3GOOnojWx9IK9aG+SuTKuJ79XGnIqZk9KBat9swNZ91ygsPjAOS7ktLM3DhwI15bfAC9fsyhJdPoaarFLDfsiezToBvolhxb7ag2C3mCEMuaVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YR3qqlbrVFbKncFy3G0Bj/vKdzsR0uXEneMubWXw9lg=;
 b=jWJZ1v0KTo2tvESQp+jLgwepQU7XDNxYyvQyC8OINuh1/kzRISbozmJP865Exhg8Z+5LoeCgk6oBHB683GNS1vcwZI2N+6UFXfqGYdWi9Mf+AjeveAH/G4W/tkBdByMcUjvzHaXgQUTWXjN7XyDgYVKA457R0r9NbZHxDet7oou9UnbcoS3QH+u/J0iPJtp6XIgqnubYhT/bZE8ZB+ooNLoTR5TpjHjiNrjtrwtr6RKAsiRh1MFwaa0MRs00mAfTA6wXH39IbZUL/pUdb6VlAWuyz0u5eHJ3GaEsR5hRrALwt+0U/OdxCWVjralsEZAyLQdu97p57JhVDOuM55p0dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEZPR06MB6666.apcprd06.prod.outlook.com (2603:1096:101:17b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 13:03:30 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 13:03:27 +0000
From: Pan Chuang <panchuang@vivo.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Pan Chuang <panchuang@vivo.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	linux-hwmon@vger.kernel.org (open list:AXI-FAN-CONTROL HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list),
	openbmc@lists.ozlabs.org (moderated list:ARM/NUVOTON NPCM ARCHITECTURE)
Subject: [PATCH 0/2] hwmon: Remove redundant error messages on IRQ request failure
Date: Tue, 14 Jul 2026 21:02:23 +0800
Message-Id: <20260714130228.449233-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEZPR06MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 048630ee-390d-4603-7df7-08dee1a84b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|11063799006|56012099006|18002099003|6133799003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	dmyu3v/kHXjRlcV8GqX34wVkjVLdI9LXkXddJDoZqAH26eyXkZyRhBa7C4SVyN/0Rd5eh6T/TwjFsDTe5x+LmZnLHO7hbT6sY3vSqE5wgOPf3tHnyd4QnXBPlw3pB5h1C4qQzFO2MboVpYFHKdpoFgg99S6N7czGIbFU1lJkabQ0alFD2LWU1+AchN59G5UCBws52oaabU/6jeewnHj8f8lJ/kX0O/brgKZ1+K2HQGHUY1PWsEUdIczgbE4a7W+fqQbx0IglRqwM9BfTNlko2hAibLtAU0PjRZUfeDWr4MeTqpNwKCfgo71sb93tf7M6l54iIvPZSATL4AqjovLDdsqcnAHuFlzo91gfAc/c/dfftCFlKdv3frMZA2WtQ8mY8KDzibSuKuJxOAq5KyuniC2Vtu1oCijsiBm01COaeNHt4zMEI9qw3w2ppyyZvnHUBquQbkegG60mDWSo0G6PCfW4sVj5AFo1t1iBuPQZxicVmvziZRjLF307XAclAqN5/nGTfDrecQgROd/aEW7bCun0cXbW5y50BSQ5damEWz81XMCYO/+w+EytnPSuX4HW1Za4BmkCwzd3VeY7GRWg5mHR6w8cXSixMWrqyhR9CI6zYzwTRyr9AN34ZlcD/kKjYS59Rxzs1/r4OJhyZ3E3Txl+P8daDECtNDaF3jiWtKhJt8J12DYVmGo/W20cR8I/1Rocm3fEVjVexqz0N5rwLQppLmmuRSOEJLt9UgHLc7fJ8z31zA4RVy7G/Hx5Il64
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(11063799006)(56012099006)(18002099003)(6133799003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFEYvxluXj/DHyBnxX6soIvMlp+TnKQVEHWOMmuuCczQYX+wUswKNTC9ChnC?=
 =?us-ascii?Q?Ze+eeGrVlgmv3AP9ef1PBR14QMbjstaJdycEDOpyCAR8ViZld9xk3kjpk4gf?=
 =?us-ascii?Q?8ou5ZilCxJeSMdPLcp7E68xv5v6brhbzMH+SiBtY4V3FtiGyX7jt79PUms8Y?=
 =?us-ascii?Q?09gl4YjuhaDCayT/PbcQPCAC3sfE+r4eyw+7ndkuLRq1LyiMeTWLGJHrKgNc?=
 =?us-ascii?Q?ohdnxiRUln/v+gF0m8Ppg+bfjsT0l39C87TZHFXnKQhG8y9xwM6711iqRp95?=
 =?us-ascii?Q?ss24gpmoCer4nKPIkya/x+7kpAzdahyzckDfMdvuPPmc8fbqPqYufYOsFd68?=
 =?us-ascii?Q?E5jsZHyBSOFcmvXcAYqrCI/g6utEKyjxZZZKcVGgr4VJ89IxtN55DYs20Kzg?=
 =?us-ascii?Q?4ilvKaBjbqP5VvF1K/jb5Z6BaOn3xWDJznJ793VcMDr4DgnWGKXBQXTGVuyK?=
 =?us-ascii?Q?1T9dSvIapNVF7Y/fAmLfU4Tj1/laoui6d7qnlZfu8vRrHHNxIKf/qnu8SqsB?=
 =?us-ascii?Q?QE6ob89Qui/q+3mleUSr1+7IR9JGeAbHsh4AScrFIiM1XWnD7lc5j5Wyn82L?=
 =?us-ascii?Q?mZkk4Tkp7RLxFLkbycado6UNBdHq9GWAvOvadOw7lIf5k5jlm5bf2lGo4AWK?=
 =?us-ascii?Q?v6DncIFCVHEIl7ICSy8SlsBvkTgmRnziejhg9MmoSEuwbMzvM3rDVW2t0CmM?=
 =?us-ascii?Q?ggbp3y90RcVoWrOr3QZoXKdmzSZ/swvYRbxrd9vz0NG2MFZynPX4TwaJHTmR?=
 =?us-ascii?Q?qDrZnlSXNshz/e2pHMCR2dpyfdGbuz1jYMXBT1LrssBQ3Ien6Lwjy2rSz3ry?=
 =?us-ascii?Q?mQdK51vNs8PLQ+c3P8upC8SFE36Mj82CptLGO3EaobSETvdC7s/ZcDu9Q74M?=
 =?us-ascii?Q?/p6ckXoaiGWWUBPBIXGtYvfz+ciB6jcWf9bOG7XzZK4qFzbAiUyRwhu+8QZ/?=
 =?us-ascii?Q?UDVOI/ilbqDuttazlZxh8nfks5B0UfwikBxz+Tl3CGHrryIN6zThUKKp7dsj?=
 =?us-ascii?Q?x2oC4fi6Xly1Ri9xjwIwkYwjZJAYZ+ogc3gQLrQtFiobSzDErfXYxVdgICMT?=
 =?us-ascii?Q?Vhb1QOGfs2K70i5hOKNMsRxgMOBcstnzrbyinjjX6s3LCYWbQotAVTFbBJdw?=
 =?us-ascii?Q?/jDM06gzcGwkaZRXEvc0iBJchbJwgQTnlFv4ifHfTKypdAbrWPK64OKOOv6a?=
 =?us-ascii?Q?ZDeE5XfvfXxEk28sSDBPkPnDaBqIXc95Oj0SkqULCS6Xbn5fiV+iQzEzmWlf?=
 =?us-ascii?Q?OUxJaHVP8iikxpg2Lk9hD+aG2VLZKWwzGENhYjnRUMcisTomzkXqChqSSY5V?=
 =?us-ascii?Q?+xyu65+3V5A8L1uIsN2g7lJdJBCDZkjct2tXlESKIePukv20ssLzOksGmSVX?=
 =?us-ascii?Q?dzHQxGXiW3evRNnW/V8OtqZs82rDdmpeE4nHe7bZHzaZfQaHuFfeBu8VYMJU?=
 =?us-ascii?Q?JCqApa3Tkxh1Q2R3BqouVJQA6Yco/MEXQqQ9Sq+TpvEs0WVTkVwR7R+3vfWi?=
 =?us-ascii?Q?HkQPU6cC136Dn/1SRwCyApRY0G+MZWKeVb5LF3+RGQFiz8kRL22gD8L93bCV?=
 =?us-ascii?Q?H6ct8iqgDBjS8YZ5P2Y1ah4Cpw/ER2NL7CYGbnGyWrRHqKSCL3p79EVQyatd?=
 =?us-ascii?Q?6rjTCVpLWw22IBvSxROAtvVY1lga7ODCRH9/2327Ni0k0x3RojH1nVJMVrtH?=
 =?us-ascii?Q?YvCoxEsO5IMWHsnHNseXrv0cZCzPyUlfNBsZeLnqQ+d4mWfKmmtumHZOylx6?=
 =?us-ascii?Q?X8EUlsK+7Q=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048630ee-390d-4603-7df7-08dee1a84b6d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:03:27.3342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIuforax+sJ/49fGnLMBwAzzH+AB02D88jixKI8Tsr8Ygv9Ci9OgFgC+MUGhGZXW5TL1REYNZFd3+P2jBjEI3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6666

Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()") added automatic error logging to
devm_request_threaded_irq() and devm_request_any_context_irq()
via the new devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code on failure.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in hwmon drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (2):
  hwmon: Remove redundant dev_err()/dev_err_probe()
  hwmon: (pmbus) Remove redundant dev_err()

 drivers/hwmon/axi-fan-control.c  | 3 +--
 drivers/hwmon/da9055-hwmon.c     | 5 +----
 drivers/hwmon/lm90.c             | 4 +---
 drivers/hwmon/npcm750-pwm-fan.c  | 4 +---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +---
 drivers/hwmon/pwm-fan.c          | 6 +-----
 drivers/hwmon/sht15.c            | 4 +---
 7 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.34.1

