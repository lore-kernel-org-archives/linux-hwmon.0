Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11022102.outbound.protection.outlook.com [40.107.149.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892BC13CF82;
	Thu, 10 Sep 2026 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016718; cv=fail; b=KOdAt2qwtGPcJKS60PHBCUFQpzKGQebkMDVFnS794A1v9RfPFu4arQOJ5tlINLs+HbPMmxvGPfIEZyCvn5l6uZ3TU93eJYzkEAaGuFNRCflvZ+z71zDeX9Dl3tFm8gbhMjnPsK1zEJoFrfaDuNngbrVbKZgxvY4F175Dl2EU7vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016718; c=relaxed/simple;
	bh=AzyV80YGgNxYXB0p6TuZ9TbcAxgoCV7vhhQuoEYBEto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RCevD0WsTOzmjHTXAnYvklEYV9FjtHP7tr23R/Wlg4gEIv2RKVqpQZKZQWwo5jNp0FuvxrWocLxwVGiyEp8ee+K+kIQbtC2lUH51Kn8qJ7qB9LWVMY11iMo/rGaLNcHN+WjkCWD3kizPdtYfQ3oUb0AoqmDOgL7dm6gdj88ykk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=bk+Uir6X; arc=fail smtp.client-ip=40.107.149.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="bk+Uir6X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQD7lQoVGkXeoz53hQPb09LmGDvmV5dOlGQxNza2+y9PW4hdllNpxY50Dsu+VoeaDZmkHlNArQTyfGScxJaiwe3qPwkUYDlKwJw56QNd/j02+j79VBXENCdF+c6U1khCdvOF9Iquz5UKsKZZBVPFj5KDCCyYoZh7sWYKIETDCgKJUT4V7HqTaFSeVb9SlEYMc8KXyYA+VLSJR0KBHKMzNHVUkrEqKsoRXj8QNVI156ShmncMv5Tw7GHyhTmNtcka+kbUp4FaTyQbpLz454t9smZScssmAijq5ge3wRfiO6lmca1gHiqMvkLenI8FmjVts8vouXSBN8uTSPzMq4Wc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G02hFSTe1Ro9tdDxY9+65Qu3ND5o4FoOYfw/gDVIQ+Y=;
 b=DzwaFvrNjYO41rTbyblRrOHpSdtuXC8yVB70NfdXV8trxkC/exm+9+EXA15rE0A5QRUbJzq8Vu1uXRmCi9wF8QbfTB60mncIkaOfwfeoeR1dNkNP/AucYG9N7cbiNpfc2GR3kI0u7WSgSBCLVI0Kj3xRtClYcPzY1GVuXz/pfP4BknPEfGHlEfNFKdBFUWZBzMZNs+03F0pki3eg4rw/p1pkbLqHoog6pMo1Kcg8bIh3PfpwXEi+xfUIBKonyefeNcSAAC15z/mBytOeYVQ5B0o5LZPSQ24mcVwHB71OqvczrOrv9q/rAtOoi9hTprxe8QDJHjpbv6v+uI9sX9KKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G02hFSTe1Ro9tdDxY9+65Qu3ND5o4FoOYfw/gDVIQ+Y=;
 b=bk+Uir6XII/AiXRL57RDSdFjLSYnxHoByxcavsbg87vNxJ7qfLeQKdIZ+WJ77leCChIQusipIomnpp8d3MYeFvPZ7FBN6QkbnJMj/SOkSSodvN6r4FH3WBJlQI5wXodWAkMu0jgrVwKojWZq9tWuvG08MJa2+V9aocWKjXxCaXpTHwaRe1RXhIECJZlLH9gXF361D+AD527yqpP9vHK46PB2f0VC9/BIHobdsLQ0sLVfb6GthZh6r5sNPSdIhubyoUy4r3Vt/Cjb8amyF+Kkv/+rqxCh97nPaQRP0Ho2css4XnZoBgn1nrqUg1XiiCekjrP3fYjRa2B+txdNfvaJkg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:51::8) by
 FR2PPF80BEA9E4C.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 05:05:13 +0000
Received: from FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bbc8:b2df:8c7f:739c]) by FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bbc8:b2df:8c7f:739c%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 05:05:13 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	arctic.it.hk@arctic.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH 3/3] hwmon: arctic_fan_controller: use shared maintainer address
Date: Thu, 10 Sep 2026 13:04:01 +0800
Message-ID: <20260910050401.279868-4-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910050401.279868-1-aureo.serrano@arctic.de>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:51::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR0P281MB3401:EE_|FR2PPF80BEA9E4C:EE_
X-MS-Office365-Filtering-Correlation-Id: 321634e3-7b08-4d42-8662-08df0ef9188d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|56012099006|55112099003|18002099003|22082099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xYZBGEhOqKobhVfCV55iRUngzCEtiMPPd2+1W8WaE07zY7tKusafvmqJQ0Pwoghhe2wwfRL3/aIdO964Pv1GfiEFaC3itXvXeqDzsaEWqhDpncdHnK3UtlOTWHd2sjTg1Of+wNEb63GFZ2rjo8Sgp+/wITRaMV3SfDciz1kuHeW6TlemH5O9t2zTW3dxSYQtmoYiqBL/0JOXwt2pMO3VSMFgXteDP+ZGrZu/0r026ueQDDGyjfp94SFQFF0VhZTq+Gre8j1ohd/fizjNLLJwxIk2qfMwh26ti+DEvhqOnBN0Lnu6gpQ8VJuiWzFkBFg88D4fEdP46r3nZKhfAZyhk+JN9pOd0MeTRvKLKEMXgzu+hrKwqEOoYLJYtx0/tzlGups6xj0V/HYj8niWsO/fr//cU8marncq9rXXMF/i6dOk61CqG57noL5b/prR6b1Ou54Y7IZgLw7o8krE8AwRx7PpTCGobrGs8tnSGryI2oVE27lvHKLBHNOfKxMSiHCW7GGiJMIHKzU4V7Wm2KL6sTl61V971+5L9eNA+WXr7EOyUx53XKCzt+LE8YHZ1cYb7g6/mCmOcUVpCDQ9jLgWtxLSmHW+Bjodnw5FwQwI48DvQoWEg+MxEqeymSti+iyyPkKpMp8KsqKKG1Tt8slWevCB6zlRq28w4CKxoZyNmIXCb6YaPak460zd9/za7XOeG+cW6OLAQ54QY8McvomX0hI1m4AfsjuX8G40nJ8djp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(56012099006)(55112099003)(18002099003)(22082099003)(10067099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7lkEO7qzzETJDHyrIzHp1rsDW5vdDDlJ+jZb+uyFQIXKlssWUKHlRdd/ZCEe?=
 =?us-ascii?Q?U9D6GSsewojW0iCKrc3QG4+elScG8VHERFpgeJJrYa9d3zZNcWuzd5qHrz8A?=
 =?us-ascii?Q?HGcIN8rdMJqCfzyt9k2LgMLkYfoNh5ZojADzLO6hcKKWwp7fsVfx4cKugl8R?=
 =?us-ascii?Q?RaUhhU+J45sIhfHam7iX2OI40+oYB+3bfQ2eXfnCJHl7SvkU5bEzTwCsj/Zi?=
 =?us-ascii?Q?Oug4H23yuhWys1/FqP3gNrAknvt5i7H9qmPX8OuhU+WMLQTZXh0Hes/Xs7n2?=
 =?us-ascii?Q?ElgpsFH8YnagWBPj/eVgg/fMDt7NJIAZN6C0mQxZ8TfKK+PsLKKWJTIPSl3w?=
 =?us-ascii?Q?EdEZbGVMDQFqicPc6a2DrvrRfE4mLMSIoySazZVSxxI23tCw5Zrt6/59CNbW?=
 =?us-ascii?Q?/wCZwCPiXsdEB9ZqSVaVA+drxXlizBBJpu+ynRteirpCbcc7LeRwDVnsHsLx?=
 =?us-ascii?Q?Jyr5o8IEmPoMXTK79V+xJ/w7bzquWrvse04wWscfD0UOsD4MT1USs5YfbcWH?=
 =?us-ascii?Q?JwScLegkLwGaULy/e7pn6tsbzAy/8Pc6NRzv4gLAFu099IgEeeK/waj1StMp?=
 =?us-ascii?Q?yGHcjb4QxEO+SXySiyRr4pKcfSMs/raPTf7cjcXxBTBcpglLJWYvnXu9ifck?=
 =?us-ascii?Q?J93mbWDIqHztBLOxZN0Gn4eCKAfcRJkizl+yH1DqD6+nA3HAn3DeELu0M5rs?=
 =?us-ascii?Q?DjrVC0noLkhPQc1Eb/5U+DxC6OEaIZWLrAD1a3xxq2/ybncKaYb0Qegj2WKn?=
 =?us-ascii?Q?I4MNB1fWQXOSOCfWAIr7MPycXZtu491TJrhNLDiiQM9eqE/WPN5ubu7ZbqxT?=
 =?us-ascii?Q?7qB8xBjwL2NjXjfJIWCl2CWyq9oXo6pPRKV6AJzt3pyDCS3YTQTUlvEkf1z7?=
 =?us-ascii?Q?GuPV6nr7fhyWdEI4NIAGMxP3iORcBAkpJw5wNTBtsbspnAJoAmsYn1EGhEsT?=
 =?us-ascii?Q?BWvjRBD1lopfhJfTXbqIZYjWf5DI18Yb0KvlkZZmR6LW6NGQifHWrZN6vE7+?=
 =?us-ascii?Q?tp+kqgLigj+roTzVwPjzOVD4uen5n7til0rUD1OsNU55g+mmRseH5oE1kZLN?=
 =?us-ascii?Q?VkdJ830I/3lPf0+Eu6CfqOY11SDBmZFik70gqcR6HHsZDocRbExVTzDrGN3y?=
 =?us-ascii?Q?fPuSIjlfRaTaXlXLXg6gjGRFhgPsGZ5hSVHKRlAPmjlGu69vKZ+CmIPWDOL4?=
 =?us-ascii?Q?RFxxM5puhPjeFc+4UayA0cCSVIHKfoatWdCoRFoVJab0LZpdSMn4PL5sD6Ym?=
 =?us-ascii?Q?f+tojreu1ViS6OAzO3uNQK3d+wfct92+OiAzMlJZLVoF4eAPDLgmIL2RsJHG?=
 =?us-ascii?Q?xdmeyuVuHZhBEZKn/WD13Ub4Evpv5G8koUN5cn/i5hIvv0hJQLZAA0yVuiC4?=
 =?us-ascii?Q?Lhhpvi5uStEjNgq9IFLgY5Ph9KmKDzoLcQEBOlVQNPlB7Iu05pVHG+wDg3XS?=
 =?us-ascii?Q?L0aIvz+gZNP0z8lgqhlemPfacsBKZoNBt1VMKJ/9iDxTiabnDBzdnEjXz/P+?=
 =?us-ascii?Q?Rofrl+h585SDBhXt7pmCEssaNy4T3/em3rPsmUiPi9bFapXp4NDNEY0iw0Qo?=
 =?us-ascii?Q?R1zNvKt+meMRwgdgeC/bs8LqreJgn/5Gzb39t8CfWxo88Jwqa/RYAm4Xh/+8?=
 =?us-ascii?Q?VoIwdgj/YXzrc0QyNvNVjZt/b+Qha05T7FszTbelkKUMtyYXLKWaVh2LyC5S?=
 =?us-ascii?Q?S1l42n2aCRQKCUPnCLaUCNIX3nPU9ucKC7L9r0noF3QK6lNJwqpGCQeoXg0D?=
 =?us-ascii?Q?DACELQBdLA=3D=3D?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 321634e3-7b08-4d42-8662-08df0ef9188d
X-MS-Exchange-CrossTenant-AuthSource: FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:05:13.7090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4vYD75B2KrH7nSi2jjDwsX3hq2ZimKRfaNMzgMX500eAoeQcBpBMymeA0G3M9bBEbkp0zVh4/3iZw7wYfyURQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2PPF80BEA9E4C

Route driver maintenance mail to the shared ARCTIC (HK) alias instead
of a personal mailbox.

Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c1d85ad307..90cdd80704c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2177,7 +2177,7 @@ F:	drivers/net/arcnet/
 F:	include/uapi/linux/if_arcnet.h
 
 ARCTIC FAN CONTROLLER DRIVER
-M:	Aureo Serrano de Souza <aureo.serrano@arctic.de>
+M:	ARCTIC (HK) <arctic.it.hk@arctic.de>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/hwmon/arctic_fan_controller.rst
-- 
2.43.0

